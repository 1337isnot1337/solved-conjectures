#!/usr/bin/env python3
"""Select the unchanged full Lean gate from the accepted roots' import closure.

Only a successfully read diff and a completely understood import header can
produce run_full=false. This script does not verify proofs or change the
source, axiom-audit, or kernel-replay commands in verify_lean.sh.
"""

from pathlib import Path, PurePosixPath
import argparse
import json
import os
import re
import subprocess
import tempfile
import tomllib
import unittest
from unittest.mock import patch

from replay_lean import MODULE, header_tokens


ROOTS = ("Solitaire", "Conjectures", "ProofAudit")
ROOT_PATHS = {f"lean/{name}.lean" for name in ROOTS}
# Preserve the public input list used by the existing selection controls.
GATE_INPUTS = {
    ".github/workflows/lean.yml", "scripts/verify_lean.sh",
    "scripts/replay_lean.py", "scripts/plan_accepted_lean.py",
    "scripts/plan_lean_candidates.py", "scripts/verify_lean_candidate.py",
    "scripts/test_plan_accepted_lean.py", "scripts/test_replay_lean.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
}
CONFIG_PATHS = {
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lakefile.lean",
    "lean/lake-manifest.json", "lean-toolchain", "lakefile.toml",
    "lakefile.lean", "lake-manifest.json", ".gitattributes", ".gitmodules",
}
EXTERNAL_NAMESPACES = {
    "Init", "Lean", "Std", "Mathlib", "Batteries", "Aesop", "Qq",
    "ProofWidgets", "Cli", "Plausible", "ImportGraph", "LeanSearchClient", "Lake",
}
# A known command starts the body. An unrecognized token forces the full gate.
BODY_HEADS = {
    "namespace", "section", "end", "open", "export", "set_option", "attribute",
    "variable", "universe", "universes", "def", "theorem", "lemma", "example",
    "axiom", "opaque", "abbrev", "inductive", "structure", "class", "instance",
    "initialize", "builtin_initialize", "syntax", "macro", "macro_rules", "elab",
    "elab_rules", "notation", "infix", "infixl", "infixr", "prefix", "postfix",
    "local", "scoped", "private", "protected", "noncomputable", "unsafe",
    "partial", "nonrec", "#check", "#print", "#eval", "#reduce", "#synth",
}
COMMIT = re.compile(r"(?:[0-9a-fA-F]{40}|[0-9a-fA-F]{64})")


def imports_of(source):
    """Read the pinned ASCII import grammar, rejecting unknown header syntax."""
    tokens = iter(header_tokens(source.read_text(encoding="utf-8")))
    token = next(tokens, None)
    if token == "module":
        token = next(tokens, None)
    if token == "prelude":
        token = next(tokens, None)
    while token is not None:
        if token == "public":
            token = next(tokens, None)
        if token == "meta":
            token = next(tokens, None)
        if token != "import":
            if token in BODY_HEADS or (token is not None and token.startswith("@[")):
                return
            raise ValueError(f"Unknown Lean header token in {source.name}: {token!r}")
        module = next(tokens, None)
        if module == "all":
            module = next(tokens, None)
        if module is None or not MODULE.fullmatch(module):
            raise ValueError(f"Unsupported import in {source.name}: {module!r}")
        yield module
        token = next(tokens, None)


def check_layout(repo):
    """Reject configurations that could move sources outside the parsed closure."""
    lean = repo / "lean"
    if (lean / "lakefile.lean").exists():
        raise ValueError("Unsupported or indirect Lake configuration")
    for name in ("lakefile.toml", "lake-manifest.json", "lean-toolchain"):
        source = lean / name
        if source.resolve() != source or not source.is_file():
            raise ValueError(f"Missing or indirect configuration: {name}")
    if (lean / "lean-toolchain").read_text(encoding="utf-8").strip() != "leanprover/lean4:v4.35.0":
        raise ValueError("The import parser does not cover this Lean toolchain")
    with (lean / "lakefile.toml").open("rb") as stream:
        config = tomllib.load(stream)
    if set(config) - {"name", "version", "defaultTargets", "require", "lean_lib"}:
        raise ValueError("Unsupported package layout or generated build target")
    targets = config.get("defaultTargets")
    if not isinstance(targets, list) or sorted(targets) != sorted(ROOTS):
        raise ValueError("Lake default targets differ from the accepted roots")
    libraries = config.get("lean_lib", [])
    if sorted(lib["name"] for lib in libraries) != sorted(ROOTS):
        raise ValueError("Unsupported library roots")
    for lib in libraries:
        if set(lib) - {"name", "moreLeanArgs"} or any(
                not isinstance(arg, str) or not re.fullmatch(r"-[jM][1-9][0-9]*", arg)
                for arg in lib.get("moreLeanArgs", [])):
            raise ValueError("Unsupported library layout or compiler arguments")
    requirements = config.get("require", [])
    if len(requirements) != 1 or set(requirements[0]) != {"name", "git", "rev"}:
        raise ValueError("Unsupported package requirements")
    required = requirements[0]
    if (required["name"] != "mathlib"
            or required["git"] != "https://github.com/leanprover-community/mathlib4.git"
            or not isinstance(required["rev"], str)):
        raise ValueError("Only the pinned external Mathlib requirement is supported")
    manifest = json.loads((lean / "lake-manifest.json").read_text(encoding="utf-8"))
    if (set(manifest) - {"version", "packagesDir", "packages", "name", "lakeDir", "fixedToolchain"}
            or manifest.get("version") != "1.3.0"
            or manifest.get("packagesDir") != ".lake/packages"
            or manifest.get("lakeDir") != ".lake"):
        raise ValueError("Unsupported dependency manifest layout")
    packages = manifest.get("packages", [])
    names = [package["name"] for package in packages]
    if "mathlib" not in names or len(names) != len(set(names)):
        raise ValueError("Missing or duplicate dependency packages")
    for package in packages:
        if (set(package) - {"url", "type", "subDir", "scope", "rev", "name",
                            "manifestFile", "inputRev", "inherited", "configFile"}
                or package.get("type") != "git" or package.get("subDir") is not None
                or not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", package["name"])
                or not package.get("url", "").startswith("https://")
                or not COMMIT.fullmatch(package.get("rev", ""))
                or package.get("manifestFile") != "lake-manifest.json"
                or package.get("configFile") not in ("lakefile.toml", "lakefile.lean")):
            raise ValueError("Unsupported local or indirect dependency package")


def source_inputs(lean):
    """Read the source closure in the default library layout."""
    sources, possible_paths, visited = set(), set(), set()

    def visit(module):
        if module in visited:
            return
        visited.add(module)
        relative = "lean/" + module.replace(".", "/") + ".lean"
        possible_paths.add(relative)
        source = lean / (module.replace(".", "/") + ".lean")
        if source.resolve() != source:
            raise ValueError(f"Indirect source path: {relative}")
        if not source.is_file():
            if module in ROOTS or module.split(".", 1)[0] not in EXTERNAL_NAMESPACES:
                raise ValueError(f"Missing local source or unknown external import: {module}")
            return
        sources.add(relative)
        for imported in imports_of(source):
            visit(imported)

    for root in ROOTS:
        visit(root)
    return sources, possible_paths


def accepted_inputs(repo):
    """Return the closure only after checking the actual package layout."""
    check_layout(repo)
    return source_inputs(repo / "lean")


def always_full(path):
    if path in ROOT_PATHS or path in CONFIG_PATHS or path in GATE_INPUTS:
        return True
    # Preserve the existing gate for generated data and other package inputs.
    if path.startswith("lean/") and not path.endswith(".lean"):
        return True
    if path.startswith((".github/workflows/", ".github/actions/", "lean/.lake/")):
        return True
    name = PurePosixPath(path).name
    return path.startswith("scripts/") and (
        name.startswith(("verify_", "plan_", "replay_", "test_replay_", "test_plan_")))


def _select(lean, files, event_name=None, diff_reason=None, *, check_config):
    result = {"run_full": True, "reason": "", "changed_files": [],
              "accepted_source_count": None, "matched_files": []}
    if event_name == "workflow_dispatch":
        result["reason"] = "Manual dispatch always runs the full accepted gate"
        return result
    if files is None:
        result["reason"] = diff_reason or "Changed-file diff is unavailable"
        return result
    if any(not isinstance(path, str) or not path or "\0" in path
           or PurePosixPath(path).is_absolute()
           or any(part in (".", "..") for part in path.split("/"))
           or PurePosixPath(path).as_posix() != path for path in files):
        result["reason"] = "Changed-file diff contains an unsupported path"
        return result
    result["changed_files"] = sorted(set(files))
    forced = sorted(path for path in files if always_full(path))
    if forced:
        result.update(reason="Accepted root, pinned configuration, or verification code changed",
                      matched_files=forced)
        return result
    try:
        sources, possible_paths = (accepted_inputs(lean.parent) if check_config
                                   else source_inputs(lean))
    except (OSError, UnicodeError, ValueError, TypeError, KeyError, AttributeError, RecursionError) as error:
        result["reason"] = f"Accepted import closure is unavailable: {error}"
        return result
    result["accepted_source_count"] = len(sources)
    matched = sorted(set(files) & possible_paths)
    if matched:
        result.update(reason="A source in the accepted import closure changed",
                      matched_files=matched)
    else:
        result.update(run_full=False,
                      reason="Known diff does not change accepted inputs or verification code")
    return result


def select(repo, files, event_name=None, diff_reason=None):
    """Production selector: validate the complete supported Lake layout."""
    return _select(repo.resolve() / "lean", files, event_name, diff_reason, check_config=True)


def plan(lean, changed):
    """Preserve the default-layout source-selection API and its existing tests.

    This pure closure helper accepts a standalone source directory. The CLI
    additionally validates the actual package configuration through select.
    """
    result = _select(lean.resolve(), changed, check_config=False)
    result["run"] = result.pop("run_full")
    result["affected"] = result.pop("matched_files")
    return result


def changed_files(repo, event_name, event_path, expected_head=None):
    """Read push/PR changes without fetching; unavailable history runs all gates."""
    if event_name not in ("push", "pull_request"):
        return None, f"No supported automatic diff for event {event_name!r}"
    try:
        if event_path is None:
            raise ValueError("GitHub event payload is unavailable")
        event = json.loads(event_path.read_text(encoding="utf-8"))
        base = event.get("before") if event_name == "push" else event["pull_request"]["base"]["sha"]
        if not isinstance(base, str) or not COMMIT.fullmatch(base) or set(base) == {"0"}:
            raise ValueError("The diff base is absent, invalid, or a new-branch zero SHA")

        def git(*args):
            return subprocess.run(["git", *args], cwd=repo, check=True,
                                  stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                  timeout=30).stdout

        if expected_head is not None:
            if not COMMIT.fullmatch(expected_head):
                raise ValueError("Invalid expected checkout SHA")
            if git("rev-parse", "HEAD").decode("ascii").strip().lower() != expected_head.lower():
                raise ValueError("Checkout differs from the event SHA")
        git("cat-file", "-e", base + "^{commit}")
        raw = git("diff", "--no-ext-diff", "--no-textconv", "--no-renames",
                  "--name-only", "-z", base, "HEAD", "--")
        if raw and not raw.endswith(b"\0"):
            raise ValueError("Git did not return a NUL-terminated path list")
        files = [] if not raw else raw[:-1].decode("utf-8").split("\0")
        return files, ""
    except (OSError, ValueError, KeyError, TypeError, AttributeError,
            subprocess.SubprocessError) as error:
        return None, f"Changed-file diff is unavailable: {error}"


class SelectionTests(unittest.TestCase):
    """Offline tests for the selector; none invoke Lean or alter the checkout."""

    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="accepted-plan-test-")
        self.addCleanup(temporary.cleanup)
        self.repo = Path(temporary.name).resolve()
        self.config = ('name = "fixture"\nversion = "0.1.0"\n'
                       'defaultTargets = ["Solitaire", "Conjectures", "ProofAudit"]\n'
                       '[[require]]\nname = "mathlib"\n'
                       'git = "https://github.com/leanprover-community/mathlib4.git"\n'
                       'rev = "v4.35.0"\n' + ''.join(
                           f'[[lean_lib]]\nname = "{name}"\n' for name in ROOTS))
        self.write("lean/lakefile.toml", self.config)
        self.write("lean/lean-toolchain", "leanprover/lean4:v4.35.0\n")
        self.manifest = {
            "version": "1.3.0", "packagesDir": ".lake/packages", "lakeDir": ".lake",
            "packages": [{"name": "mathlib", "type": "git", "subDir": None,
                          "url": "https://github.com/leanprover-community/mathlib4.git",
                          "rev": "a" * 40, "manifestFile": "lake-manifest.json",
                          "configFile": "lakefile.lean"}],
        }
        self.write("lean/lake-manifest.json", json.dumps(self.manifest))
        for name, source in {
            "Solitaire": "import Solitaire.Base\n",
            "Solitaire.Base": "def base : Nat := 1\n",
            "Conjectures": "import Conjectures.A\n",
            "Conjectures.A": "import Conjectures.B\nimport Mathlib.Core\nnamespace A\n",
            "Conjectures.B": 'def body : String := "/-"\n',
            "ProofAudit": "import Conjectures\nimport Solitaire\n",
            "Conjectures.Candidate": "unknown_candidate_header\n",
        }.items():
            self.write("lean/" + name.replace(".", "/") + ".lean", source)

    def write(self, relative, content):
        path = self.repo / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")
        return path

    def test_transitive_accepted_source(self):
        result = select(self.repo, ["lean/Conjectures/B.lean"])
        self.assertTrue(result["run_full"])
        self.assertEqual(result["accepted_source_count"], 6)
        self.assertEqual(result["matched_files"], ["lean/Conjectures/B.lean"])

    def test_candidate_docs_and_known_empty_diff(self):
        for files in (["lean/Conjectures/Candidate.lean"], ["README.md"], []):
            with self.subTest(files=files):
                self.assertFalse(select(self.repo, files)["run_full"])

    def test_roots_config_and_gate_changes(self):
        for path in ROOT_PATHS | CONFIG_PATHS | {
            ".github/workflows/lean.yml", ".github/workflows/lean-candidates.yml",
            "scripts/verify_lean.sh", "scripts/plan_accepted_lean.py",
            "scripts/replay_lean.py", "scripts/test_replay_lean.py",
        }:
            with self.subTest(path=path):
                self.assertTrue(select(self.repo, [path])["run_full"])

    def test_manual_and_unavailable_diff(self):
        self.assertTrue(select(self.repo, [], "workflow_dispatch")["run_full"])
        self.assertTrue(select(self.repo, None)["run_full"])

    def test_pinned_header_and_lazy_body(self):
        self.write("lean/Conjectures/A.lean",
                   "/- outer /- import Fake.Hidden -/ -/\nmodule\nprelude\n"
                   "public meta import Conjectures.B\nimport /- note -/ all\n"
                   'Mathlib.Core -- comment\ndef body := "/-"\n')
        self.assertFalse(select(self.repo, ["README.md"])["run_full"])
        self.assertTrue(select(self.repo, ["lean/Conjectures/B.lean"])["run_full"])

    def test_unknown_or_unfinished_header_runs_full(self):
        for source in ("future_header\nimport Conjectures.B\n", "import Conjectures.α\n",
                       "/- unfinished", "import\n", "public\n", "import Missing.Package\n"):
            with self.subTest(source=source):
                self.write("lean/Conjectures/A.lean", source)
                self.assertTrue(select(self.repo, ["README.md"])["run_full"])

    def test_missing_project_source_runs_full(self):
        (self.repo / "lean/Conjectures/B.lean").unlink()
        self.assertTrue(select(self.repo, ["README.md"])["run_full"])

    def test_external_shadow_path_is_an_input_even_after_deletion(self):
        self.assertTrue(select(self.repo, ["lean/Mathlib/Core.lean"])["run_full"])

    def test_changed_root_configuration_runs_full(self):
        self.write("lean/lakefile.toml", 'defaultTargets = ["NewRoot"]\n')
        self.assertTrue(select(self.repo, ["README.md"])["run_full"])

    def test_unsupported_source_layouts_run_full_on_later_commits(self):
        for config in (
            'srcDir = "relocated"\n' + self.config,
            self.config + 'srcDir = "relocated"\n',
            self.config + 'roots = ["DifferentRoot"]\n',
            self.config + 'globs = ["Generated.*"]\n',
            self.config + '[[require]]\nname = "Local"\npath = "../local"\n',
            self.config + '[[lean_exe]]\nname = "generator"\n',
            self.config + 'moreLeanArgs = ["--load-dynlib=../plugin.so"]\n',
        ):
            with self.subTest(config=config):
                self.write("lean/lakefile.toml", config)
                self.assertTrue(select(self.repo, ["README.md"])["run_full"])

    def test_local_manifest_dependency_and_new_toolchain_run_full(self):
        original = json.dumps(self.manifest)
        self.manifest["packages"][0].update(type="path", path="../local")
        self.write("lean/lake-manifest.json", json.dumps(self.manifest))
        self.assertTrue(select(self.repo, ["README.md"])["run_full"])
        self.write("lean/lake-manifest.json", original)
        self.write("lean/lean-toolchain", "leanprover/lean4:v4.99.0\n")
        self.assertTrue(select(self.repo, ["README.md"])["run_full"])

    def test_indirect_source_and_unsupported_diff_paths_run_full(self):
        source = self.repo / "lean/Conjectures/B.lean"
        source.unlink()
        source.symlink_to(self.write("elsewhere.lean", "def x := 1\n"))
        self.assertTrue(select(self.repo, ["README.md"])["run_full"])
        for path in ("../README.md", "/README.md", "README.md\0", "./README.md"):
            self.assertTrue(select(self.repo, [path])["run_full"])

    def test_push_and_pull_request_diff(self):
        base, head = "a" * 40, "b" * 40
        event_path = self.repo / "event.json"

        def git(command, **kwargs):
            self.assertEqual(kwargs["cwd"], self.repo)
            if command[1] == "rev-parse":
                output = (head + "\n").encode("ascii")
            elif command[1] == "cat-file":
                self.assertEqual(command[2:], ["-e", base + "^{commit}"])
                output = b""
            else:
                self.assertEqual(command, ["git", "diff", "--no-ext-diff", "--no-textconv",
                                          "--no-renames", "--name-only", "-z", base, "HEAD", "--"])
                output = b"README.md\0lean/Conjectures/Candidate.lean\0"
            return subprocess.CompletedProcess(command, 0, output, b"")

        for event_name, payload in (("push", {"before": base}),
                                    ("pull_request", {"pull_request": {"base": {"sha": base}}})):
            with self.subTest(event_name=event_name), patch.object(subprocess, "run", side_effect=git):
                event_path.write_text(json.dumps(payload))
                files, reason = changed_files(self.repo, event_name, event_path, head)
                self.assertEqual(reason, "")
                self.assertFalse(select(self.repo, files, event_name)["run_full"])

    def test_unavailable_history_and_malformed_events_run_full(self):
        event_path = self.write("event.json", '{"before": "' + "a" * 40 + '"}')
        with patch.object(subprocess, "run", side_effect=subprocess.CalledProcessError(128, ["git"])):
            files, reason = changed_files(self.repo, "push", event_path)
            self.assertTrue(select(self.repo, files, "push", reason)["run_full"])
        for payload in ("{", "[]", '{"before": "' + "0" * 40 + '"}', "{}"):
            event_path.write_text(payload)
            files, reason = changed_files(self.repo, "push", event_path)
            self.assertIsNone(files)
            self.assertTrue(select(self.repo, files, "push", reason)["run_full"])


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parent.parent)
    parser.add_argument("--files", nargs="*", help="explicit known diff, for offline checks")
    parser.add_argument("--event-name", default=os.environ.get("GITHUB_EVENT_NAME"))
    parser.add_argument("--event-path", type=Path, default=os.environ.get("GITHUB_EVENT_PATH"))
    parser.add_argument("--self-test", action="store_true", help="run offline selection tests")
    args = parser.parse_args(argv)
    if args.self_test:
        result = unittest.TextTestRunner(verbosity=2).run(
            unittest.defaultTestLoader.loadTestsFromTestCase(SelectionTests))
        return 0 if result.wasSuccessful() else 1
    files, reason = args.files, None
    if files is None and args.event_name != "workflow_dispatch":
        files, reason = changed_files(args.repo.resolve(), args.event_name, args.event_path,
                                     os.environ.get("GITHUB_SHA"))
    decision = select(args.repo, files, args.event_name, reason)
    # Keep the existing workflow/output API while retaining the explicit name.
    decision["run"] = decision["run_full"]
    print(json.dumps(decision, indent=2, sort_keys=True))
    if output := os.environ.get("GITHUB_OUTPUT"):
        with open(output, "a", encoding="utf-8") as stream:
            value = str(decision["run"]).lower()
            stream.write("run=" + value + "\nrun_full=" + value + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
