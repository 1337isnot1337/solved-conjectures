#!/usr/bin/env python3
"""Offline protocol tests; the checker itself is mocked, never replaced in use."""

from pathlib import Path
import importlib.util
import os
import subprocess
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location(
    "replay_candidate", Path(__file__).with_name("replay_lean.py"))
replay = importlib.util.module_from_spec(spec)
spec.loader.exec_module(replay)


class ReplayTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.lean = Path(self.tmp.name)
        self.build = self.lean / ".lake/build/lib/lean"
        self.build.mkdir(parents=True)
        sources = {
            "Conjectures": "import Conjectures.A\n",
            "Conjectures.A": "import Conjectures.B\nimport Mathlib.Core\nnamespace A\n",
            "Conjectures.B": "def body : String := \"/-\"\n",
            "Solitaire": "import Solitaire.Base\n",
            "Solitaire.Base": "def x := 1\n",
            "Conjectures.CachedExtra": "def x := 2\n",
        }
        for name, contents in sources.items():
            path = self.lean / (name.replace(".", "/") + ".lean")
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(contents)
            target = self.build / (name.replace(".", "/") + ".olean")
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(b"fixture")
        (self.build / "Conjectures/B.olean.private").write_bytes(b"private")
        (self.build / "Conjectures/B.olean.server").write_bytes(b"server")
        self.modules = ["Conjectures.A", "Conjectures.B", "Solitaire.Base"]

    def test_default_exact_closure(self):
        closure, prefixes = replay.replay_plan(self.lean, self.modules)
        self.assertEqual(closure, set(self.modules) | {"Conjectures", "Solitaire"})
        self.assertEqual(prefixes, ["Solitaire", "Conjectures"])
        for bad in ([], self.modules[:-1], self.modules + [self.modules[0]],
                    self.modules + ["Conjectures.CachedExtra"]):
            with self.assertRaises(ValueError):
                replay.replay_plan(self.lean, bad)

    def test_root_exact_closure(self):
        closure, prefixes = replay.replay_plan(self.lean, [], "Conjectures.A")
        self.assertEqual(closure, {"Conjectures.A", "Conjectures.B"})
        self.assertEqual(prefixes, ["Conjectures"])
        for root in ("Mathlib.Core", "Conjectures.NoSource", "Conjectures.A..B"):
            with self.assertRaises(ValueError):
                replay.replay_plan(self.lean, [], root)
        with self.assertRaises(ValueError):
            replay.replay_plan(self.lean, self.modules, "Conjectures.A")
        (self.lean / "Conjectures/B.lean").write_text("import Solitaire.Base\n")
        with self.assertRaisesRegex(ValueError, "crosses project namespaces"):
            replay.replay_plan(self.lean, [], "Conjectures.A")

    def test_header_matches_pinned_syntax(self):
        path = self.lean / "Header.lean"
        path.write_text("/- outer /- import Conjectures.Fake -/ -/\n"
                        "module\nprelude\npublic meta import Conjectures.A\n"
                        "import /- note -/ all\nConjectures.B -- trailing\n"
                        "def body := \"/-\"\nimport Conjectures.Fake\n")
        self.assertEqual(list(replay.imports_of(path)), ["Conjectures.A", "Conjectures.B"])
        path.write_text("import Conjectures.α\n")
        with self.assertRaises(ValueError):
            list(replay.imports_of(path))

    def test_stdbuf_preserves_checker_and_prefixes(self):
        with patch.object(replay.shutil, "which", return_value="/usr/bin/stdbuf"):
            self.assertEqual(replay.checker_command(["Conjectures"]),
                             ["/usr/bin/stdbuf", "-oL", "-eL", "leanchecker", "-v", "Conjectures"])
        with patch.object(replay.shutil, "which", return_value=None):
            self.assertEqual(replay.checker_command(["Conjectures"]),
                             ["leanchecker", "-v", "Conjectures"])

    def test_staging_and_failure_receipt(self):
        seen = []

        def checker(command, *, cwd, env, check):
            self.assertEqual(command, ["leanchecker", "-v", "Conjectures"])
            self.assertEqual(cwd, self.lean)
            self.assertFalse(check)
            self.assertEqual(env["LEAN_NUM_THREADS"], "1")
            staged, external = env["LEAN_PATH"].split(os.pathsep)
            self.assertEqual(external, "/external/mathlib")
            names = {str(p.relative_to(staged)) for p in Path(staged).rglob("*") if p.is_file()}
            self.assertEqual(names, {"Conjectures/A.olean", "Conjectures/B.olean",
                                     "Conjectures/B.olean.private", "Conjectures/B.olean.server"})
            self.assertTrue(os.path.samefile(Path(staged) / "Conjectures/B.olean",
                                            self.build / "Conjectures/B.olean"))
            seen.append(Path(staged))
            return subprocess.CompletedProcess(command, 7)

        environment = {"LEAN_PATH": str(self.build) + os.pathsep + "/external/mathlib"}
        with patch.dict(os.environ, environment), \
                patch.object(replay.shutil, "which", return_value=None), \
                patch.object(replay.subprocess, "run", side_effect=checker):
            with self.assertRaises(SystemExit) as failure:
                replay.main(["--lean-dir", str(self.lean), "--root", "Conjectures.A"])
            self.assertEqual(failure.exception.code, 7)
        self.assertEqual(len(seen), 1)
        self.assertFalse(seen[0].exists())
        self.assertEqual((self.build / "Conjectures/B.olean").read_bytes(), b"fixture")

    def test_missing_object_fails_before_checker(self):
        (self.build / "Conjectures/B.olean").unlink()
        with patch.dict(os.environ, {"LEAN_PATH": str(self.build)}), \
                patch.object(replay.subprocess, "run") as checker:
            with self.assertRaisesRegex(SystemExit, "Missing accepted object"):
                replay.main(["--lean-dir", str(self.lean), "--root", "Conjectures.A"])
            checker.assert_not_called()


if __name__ == "__main__":
    unittest.main()
