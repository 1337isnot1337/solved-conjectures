#!/usr/bin/env python3
"""Offline protocol/process tests for the opt-in bounded verification helpers."""
from pathlib import Path
import json
import os
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

import build_lean_parallel as build
import replay_lean_parallel as replay

REPO = Path(__file__).resolve().parent.parent


class ProtocolTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.repo = Path(self.tmp.name)
        self.lean = self.repo / "lean"
        self.lean.mkdir()
        for name in ("lakefile.toml", "lake-manifest.json", "lean-toolchain"):
            (self.lean / name).write_bytes((REPO / "lean" / name).read_bytes())
        sources = {
            "Conjectures": "import Conjectures.A\n",
            "Conjectures.A": "module\npublic import Conjectures.B\n@[expose] public section\n",
            "Conjectures.B": "def x := 1\n",
            "Solitaire": "import Solitaire.Base\n",
            "Solitaire.Base": "theorem t : True := True.intro\n",
            "ProofAudit": "import Conjectures\nimport Solitaire\n",
        }
        for module, text in sources.items():
            path = build.source_path(self.lean, module)
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
        self.modules = ["Conjectures.A", "Conjectures.B", "Solitaire.Base"]
        self.objects = self.lean / ".lake/build/lib/lean"
        for module in sources:
            facets = build.FACETS if module == "Conjectures.A" else build.FACETS[:1]
            for facet in facets:
                path = self.objects / (module.replace(".", "/") + facet)
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes((module + facet).encode())

    def test_exact_registry_includes_both_roots(self):
        graph, prefixes, _, extra = build.scope_plan(self.repo, self.modules)
        self.assertEqual(set(graph), set(self.modules) | {"Conjectures", "Solitaire"})
        self.assertEqual(graph["Conjectures.A"], {"Conjectures.B"})
        self.assertEqual(prefixes, ["Solitaire", "Conjectures"])
        self.assertEqual(extra, {"lean/ProofAudit.lean"})
        for invalid in ([], self.modules[:-1], self.modules + self.modules[:1],
                        self.modules + ["Conjectures.Extra"]):
            with self.assertRaises(ValueError):
                build.scope_plan(self.repo, invalid)

    def test_root_mode_has_exact_closure(self):
        graph, prefixes, _, _ = build.scope_plan(self.repo, [], "Conjectures.A")
        self.assertEqual(set(graph), {"Conjectures.A", "Conjectures.B"})
        self.assertEqual(prefixes, ["Conjectures"])
        with self.assertRaises(ValueError):
            build.scope_plan(self.repo, self.modules, "Conjectures.A")

    def test_unknown_header_and_external_rejected(self):
        path = build.source_path(self.lean, "Conjectures.B")
        for text in ("unknown_header\n", "import Unknown.Library\n"):
            path.write_text(text)
            with self.assertRaises(ValueError):
                build.scope_plan(self.repo, self.modules)

    def test_cycle_and_absent_nodes_rejected(self):
        build.source_path(self.lean, "Conjectures.B").write_text("import Conjectures.A\n")
        with self.assertRaises(ValueError):
            build.scope_plan(self.repo, self.modules)
        with self.assertRaises(ValueError):
            build.validate_graph({"A": {"Missing"}})

    def test_audit_cannot_add_unregistered_source(self):
        build.source_path(self.lean, "Conjectures.Other").write_text("theorem other : True := True.intro\n")
        build.source_path(self.lean, "ProofAudit").write_text(
            "import Conjectures\nimport Solitaire\nimport Conjectures.Other\n")
        with self.assertRaisesRegex(ValueError, "ProofAudit adds"):
            build.scope_plan(self.repo, self.modules)

    def test_indirect_source_rejected(self):
        path = build.source_path(self.lean, "Conjectures.B")
        target = self.repo / "other"
        path.rename(target)
        path.symlink_to(target)
        with self.assertRaises(ValueError):
            build.scope_plan(self.repo, self.modules)

    def test_lean_name_prefix_is_component_based(self):
        self.assertTrue(replay.name_is_prefix("Conjectures", "Conjectures"))
        self.assertTrue(replay.name_is_prefix("Conjectures", "Conjectures.A"))
        self.assertFalse(replay.name_is_prefix("Conjectures.A", "Conjectures.AB"))
        self.assertFalse(replay.name_is_prefix("Conjectures", "Conjectures2.A"))

    def test_replay_set_rejects_missing_root_duplicates_and_extras(self):
        expected = {"Conjectures", "Conjectures.A"}
        good = "replaying Conjectures.A\nreplaying Conjectures\n"
        self.assertEqual(set(replay.exact_replay_set(good, expected)), expected)
        for bad in ("replaying Conjectures.A\n", good + "replaying Conjectures.A\n",
                    good + "replaying Conjectures.Extra\n", good + "replaying bad!\n"):
            with self.assertRaises(ValueError):
                replay.exact_replay_set(bad, expected)

    def test_staging_is_complete_materialized_and_frozen(self):
        graph, prefixes, _, _ = build.scope_plan(self.repo, self.modules)
        stage = self.repo / "stage"
        stage.mkdir()
        hashes = replay.stage_objects(self.lean, self.objects, stage, graph, prefixes)
        self.assertEqual(set(hashes), set(graph))
        self.assertEqual(set(hashes["Conjectures.A"]), set(build.FACETS))
        self.assertTrue((stage / "Conjectures.olean").is_file())
        self.assertFalse(any(path.is_symlink() for path in stage.rglob("*")))
        self.assertFalse(os.path.samefile(stage / "Conjectures/A.olean", self.objects / "Conjectures/A.olean"))
        replay.assert_artifacts(self.lean, self.objects, stage, hashes)
        (stage / "Conjectures/A.olean.private").write_bytes(b"changed")
        with self.assertRaises(ValueError):
            replay.assert_artifacts(self.lean, self.objects, stage, hashes)

    def test_modern_missing_or_symlink_private_rejected(self):
        path = self.objects / "Conjectures/A.olean.private"
        path.unlink()
        with self.assertRaises(ValueError):
            build.object_hashes(self.lean, self.objects, "Conjectures.A")
        target = self.repo / "private"
        target.write_bytes(b"private")
        path.symlink_to(target)
        with self.assertRaises(ValueError):
            build.object_hashes(self.lean, self.objects, "Conjectures.A")

    def test_legacy_partial_private_pair_rejected(self):
        private = self.objects / "Conjectures/B.olean.private"
        server = self.objects / "Conjectures/B.olean.server"
        private.write_bytes(b"private")
        with self.assertRaisesRegex(ValueError, "Incomplete server/private"):
            build.object_hashes(self.lean, self.objects, "Conjectures.B")
        private.unlink()
        server.write_bytes(b"server")
        with self.assertRaisesRegex(ValueError, "Incomplete server/private"):
            build.object_hashes(self.lean, self.objects, "Conjectures.B")
        private.write_bytes(b"private")
        self.assertEqual(set(build.object_hashes(self.lean, self.objects, "Conjectures.B")), set(build.FACETS))

    def test_search_path_shadow_rejected(self):
        stage, external = self.repo / "stage", self.repo / "external"
        external.mkdir()
        current = os.pathsep.join(map(str, (external, self.objects)))
        self.assertEqual(replay.staged_search_path(self.lean, self.objects, stage, current).split(os.pathsep),
                         [str(stage), str(external)])
        (external / "Conjectures").mkdir()
        with self.assertRaises(ValueError):
            replay.staged_search_path(self.lean, self.objects, stage, current)

    def test_build_output_cannot_contain_receipt(self):
        with self.assertRaises(ValueError):
            build.output_directory(self.lean, self.lean / ".lake/build/new", "test-")
        self.assertTrue((self.objects / "Conjectures.olean").is_file())

    def test_input_and_commit_changes_rejected(self):
        path = self.lean / "Conjectures.lean"
        snapshot = {"lean/Conjectures.lean": build.sha256(path)}
        with patch.object(build, "git_head", return_value="head"):
            build.assert_inputs(self.repo, snapshot, "head")
            path.write_text("changed")
            with self.assertRaises(ValueError):
                build.assert_inputs(self.repo, snapshot, "head")
        with patch.object(build, "git_head", return_value="different"):
            with self.assertRaisesRegex(ValueError, "HEAD"):
                build.assert_inputs(self.repo, snapshot, "head")

    def test_source_receipt_binds_compiler_and_artifacts(self):
        path, compiler = self.repo / "source.json", self.repo / "lean-compiler"
        compiler.write_bytes(b"pinned test compiler")
        artifacts = {"Conjectures": {".olean": "abc"}}
        receipt = dict(status="passed", phase="source", fresh_project_build=True, git_head="head",
            project_modules=["Conjectures"], artifact_sha256=artifacts,
            input_sha256={"lean/Conjectures.lean": "source"}, compiler_path=str(compiler),
            compiler_sha256=build.sha256(compiler))
        path.write_text(json.dumps(receipt))
        kwargs = dict(head="head", modules=["Conjectures"], inputs=receipt["input_sha256"], artifacts=artifacts)
        replay.validate_source_receipt(path, **kwargs)
        with self.assertRaises(ValueError):
            replay.validate_source_receipt(path, **{**kwargs, "head": "another"})
        with self.assertRaises(ValueError):
            replay.validate_source_receipt(path, **{**kwargs, "artifacts": {}})
        compiler.write_bytes(b"changed compiler")
        with self.assertRaisesRegex(ValueError, "compiler"):
            replay.validate_source_receipt(path, **kwargs)


class ProcessTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.path = Path(self.tmp.name)

    def command(self, module, delay=0.1, code=0):
        script = ('from pathlib import Path; import time,sys; '
            'Path(sys.argv[1]+".start").write_text(str(time.monotonic())); '
            'time.sleep(float(sys.argv[2])); '
            'Path(sys.argv[1]+".end").write_text(str(time.monotonic())); '
            'sys.exit(int(sys.argv[3]))')
        return [sys.executable, "-c", script, str(self.path / module), str(delay), str(code)]

    def run_graph(self, graph, command, records, **extra):
        return build.run_dag(graph, command, cwd=self.path, env=os.environ.copy(), output=self.path,
            jobs=2, memory_limit_mib=128, records=records, **extra)

    def test_dependency_barrier_and_parallel_bound(self):
        graph = {"A": set(), "B": set(), "C": {"A", "B"}, "D": {"A"}, "Root": {"C", "D"}}
        records = []
        metrics = self.run_graph(graph, self.command, records)
        self.assertEqual(metrics["peak_active_builds"], 2)
        self.assertEqual({r["module"] for r in records}, set(graph))
        for module, deps in graph.items():
            started = float((self.path / (module + ".start")).read_text())
            self.assertTrue(all(started >= float((self.path / (dep + ".end")).read_text()) for dep in deps))

    def test_failure_cancels_peer_and_does_not_release_dependents(self):
        records = []
        with self.assertRaisesRegex(RuntimeError, "Source build failed"):
            self.run_graph({"A": set(), "B": set(), "C": {"A"}, "D": {"B"}},
                lambda m: self.command(m, .05 if m == "A" else 5, 1 if m == "A" else 0), records)
        self.assertFalse((self.path / "C.start").exists())
        self.assertFalse((self.path / "D.start").exists())
        self.assertFalse((self.path / "B.end").exists())
        self.assertTrue(any(r.get("cancelled") and r["module"] == "B" for r in records))

    def test_timeout_cancels_process(self):
        records = []
        with self.assertRaisesRegex(RuntimeError, "timeout"):
            self.run_graph({"A": set()}, lambda m: self.command(m, 5), records, timeout_seconds=.1)
        self.assertTrue(records[0].get("cancelled"))

    def test_worker_thread_children_are_counted(self):
        child = ('from pathlib import Path; import sys,time; '
                 'data=bytearray(48*1024*1024); Path(sys.argv[1]).write_text("ready"); time.sleep(10)')
        parent = ('import subprocess,sys,threading,time\n'
                  'def work():\n'
                  ' p=subprocess.Popen([sys.executable,"-c",sys.argv[1],sys.argv[2]])\n'
                  ' p.wait()\n'
                  'threading.Thread(target=work).start()\n'
                  'time.sleep(10)\n')
        ready = self.path / "ready"
        process = subprocess.Popen([sys.executable, "-c", parent, child, str(ready)], start_new_session=True)
        try:
            deadline = time.monotonic() + 5
            while not ready.exists() and time.monotonic() < deadline:
                time.sleep(.02)
            self.assertTrue(ready.exists())
            stats = build.process_tree_stats(process.pid)
            self.assertGreaterEqual(stats["processes"], 2)
            self.assertGreater(stats["rss_kib"], 48 * 1024)
        finally:
            build.stop_processes([process])

    def test_checker_thread_guard(self):
        script = ('import threading,time; '
            '[threading.Thread(target=time.sleep,args=(5,),daemon=True).start() for _ in range(3)]; time.sleep(5)')
        with self.assertRaisesRegex(RuntimeError, "thread guard"):
            replay.run_checker([sys.executable, "-c", script], lean=self.path, env=os.environ.copy(),
                log=self.path / "threads.log", workers=1, memory_limit_mib=128, timeout_seconds=2)

    def test_checker_rss_guard(self):
        with self.assertRaisesRegex(RuntimeError, "RSS guard"):
            replay.run_checker([sys.executable, "-c", "import time; x=bytearray(32*1024*1024); time.sleep(5)"],
                lean=self.path, env=os.environ.copy(), log=self.path / "rss.log",
                workers=1, memory_limit_mib=24, timeout_seconds=2)

    def test_checker_exit_and_success(self):
        with self.assertRaisesRegex(RuntimeError, "exited 7"):
            replay.run_checker([sys.executable, "-c", "raise SystemExit(7)"], lean=self.path,
                env=os.environ.copy(), log=self.path / "failed.log",
                workers=1, memory_limit_mib=128, timeout_seconds=2)
        result = replay.run_checker([sys.executable, "-c", 'print("replaying Conjectures")'],
            lean=self.path, env=os.environ.copy(), log=self.path / "passed.log",
            workers=1, memory_limit_mib=128, timeout_seconds=2)
        self.assertEqual(result["exit_code"], 0)
        self.assertEqual(replay.exact_replay_set((self.path / "passed.log").read_text(), {"Conjectures"}),
                         ["Conjectures"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
