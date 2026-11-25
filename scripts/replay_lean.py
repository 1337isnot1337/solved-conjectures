#!/usr/bin/env python3
"""Replay the accepted project, or one root's complete local import closure.

The pinned checker and its proof replay are unchanged. Only the project
objects visible on LEAN_PATH are staged. Explicit accepted-module mode must
match the imports of both project roots exactly; --root mode derives its
module set from the selected source and runs one namespace prefix.
"""

from pathlib import Path
import argparse
import os
import re
import shutil
import subprocess
import tempfile


MODULE = re.compile(r"[A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*")
PROJECT_NAMESPACES = ("Solitaire", "Conjectures")


def project_namespace(module):
    namespace = module.split(".", 1)[0]
    return namespace if namespace in PROJECT_NAMESPACES else None


def header_tokens(text):
    """Tokenize lazily; the import parser stops before the first declaration."""
    i = 0
    while i < len(text):
        if text[i].isspace():
            i += 1
        elif text.startswith("--", i):
            end = text.find("\n", i)
            i = len(text) if end < 0 else end
        elif text.startswith("/-", i):
            depth = 1
            i += 2
            while depth and i < len(text):
                if text.startswith("/-", i):
                    depth += 1
                    i += 2
                elif text.startswith("-/", i):
                    depth -= 1
                    i += 2
                else:
                    i += 1
            if depth:
                raise ValueError("Unterminated block comment in Lean header")
        else:
            start = i
            while (i < len(text) and not text[i].isspace()
                   and not text.startswith(("--", "/-"), i)):
                i += 1
            yield text[start:i]


def imports_of(source):
    # This is the ASCII-module-name part of the pinned Lean header grammar:
    # [module] [prelude] ([public] [meta] import [all] moduleName)*.
    # Lazy tokenization never interprets strings or comments in declarations.
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
            return
        module = next(tokens, None)
        if module == "all":
            module = next(tokens, None)
        if module is None or not MODULE.fullmatch(module):
            raise ValueError(f"Unsupported import in {source}: {module}")
        yield module
        token = next(tokens, None)


def local_closure(lean, roots):
    closure = set()

    def visit(module):
        if module in closure:
            return
        source = lean / (module.replace(".", "/") + ".lean")
        if not source.is_file():
            if project_namespace(module) is not None:
                raise ValueError(f"Missing project source: {source}")
            return
        closure.add(module)
        for imported in imports_of(source):
            visit(imported)

    for root in sorted(roots):
        visit(root)
    return closure


def replay_plan(lean, modules, root=None):
    """Return the exact local module set and unchanged checker prefixes."""
    if root is not None:
        if modules:
            raise ValueError("--root cannot be combined with an accepted-module list")
        namespace = project_namespace(root)
        if namespace is None or not MODULE.fullmatch(root):
            raise ValueError("Unexpected project root module name")
        closure = local_closure(lean, {root})
        if any(project_namespace(module) != namespace for module in closure):
            raise ValueError("Root import closure crosses project namespaces; "
                             "use the complete accepted-module mode")
        return closure, [namespace]

    if not modules or len(modules) != len(set(modules)):
        raise ValueError("Expected a nonempty list of distinct accepted modules")
    if any(not re.fullmatch(r"(?:Solitaire|Conjectures)\.[A-Za-z0-9_.]+", module)
           for module in modules):
        raise ValueError("Unexpected accepted module name")
    roots = set(PROJECT_NAMESPACES)
    closure = local_closure(lean, roots)
    expected = closure - roots
    if set(modules) != expected:
        missing = sorted(expected - set(modules))
        extra = sorted(set(modules) - expected)
        raise ValueError(f"Replay/import mismatch: missing={missing}; extra={extra}")
    return closure, list(PROJECT_NAMESPACES)


def checker_command(prefixes):
    command = ["leanchecker", "-v", *prefixes]
    stdbuf = shutil.which("stdbuf")
    if stdbuf is not None:
        command = [stdbuf, "-oL", "-eL", *command]
    return command


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", help="replay one project root's exact local import closure")
    parser.add_argument("--per-module", action="store_true",
                        help="run a fresh stock checker process for each scoped module")
    parser.add_argument("--lean-dir", type=Path,
                        default=Path(__file__).resolve().parent.parent / "lean",
                        help="Lean package directory (needed when testing a copy outside scripts/)")
    parser.add_argument("modules", nargs="*", help="complete accepted-module list")
    args = parser.parse_args(argv)
    if args.per_module and args.root is None:
        parser.error("--per-module requires --root")
    lean = args.lean_dir.resolve()
    build = lean / ".lake/build/lib/lean"
    try:
        closure, prefixes = replay_plan(lean, args.modules, args.root)
    except ValueError as error:
        raise SystemExit(str(error)) from error

    search_path = os.environ.get("LEAN_PATH", "").split(os.pathsep)
    project_entries = [i for i, path in enumerate(search_path)
                       if path and Path(path).resolve() == build.resolve()]
    if not project_entries:
        raise SystemExit("Run this helper through lake env from the Lean package")

    with tempfile.TemporaryDirectory(prefix="accepted-replay-", dir=lean / ".lake/build") as tmp:
        staged = Path(tmp)
        for module in sorted(closure):
            stem = module.replace(".", "/")
            for suffix in (".olean", ".olean.server", ".olean.private"):
                source = build / (stem + suffix)
                target = staged / (stem + suffix)
                if not source.is_file():
                    if suffix == ".olean":
                        raise SystemExit(f"Missing accepted object: {source}")
                    continue
                target.parent.mkdir(parents=True, exist_ok=True)
                os.link(source, target)
        for i in project_entries:
            search_path[i] = str(staged)
        environment = os.environ.copy()
        environment["LEAN_PATH"] = os.pathsep.join(search_path)
        environment["LEAN_NUM_THREADS"] = "1"
        if args.root is None:
            print(f"Replaying {len(args.modules)} accepted proof modules and "
                  f"{len(PROJECT_NAMESPACES)} roots", flush=True)
        else:
            print(f"Replaying all {len(closure)} local project modules imported by "
                  f"{args.root}, including that root (prefix {prefixes[0]})", flush=True)
        targets = [[module] for module in sorted(closure)] if args.per_module else [prefixes]
        for target in targets:
            result = subprocess.run(checker_command(target), cwd=lean,
                                    env=environment, check=False)
            if result.returncode:
                raise SystemExit(result.returncode)
        if args.root is None:
            print("PASS: every accepted module completed the pinned kernel replay", flush=True)
        else:
            print(f"PASS: the entire local import closure of {args.root} "
                  "completed the pinned kernel replay", flush=True)


if __name__ == "__main__":
    main()
