#!/usr/bin/env python3
"""Negative provenance checks for the fresh quotient-133 staged gate."""
import copy
import tempfile
from pathlib import Path
import unittest
from unittest.mock import patch

import verify_hadamard_quotient133_staged as staged


class ManifestTests(unittest.TestCase):
    def setUp(self):
        self.stage = "catalog_verified"
        self.modules = ["Conjectures.One", "Conjectures.Two"]
        self.sources = {name: "a" * 64 for name in self.modules}
        self.inputs = {"scripts/control.py": "b" * 64}
        self.modern = {name: False for name in self.modules}
        self.commit = "c" * 40
        self.ci = {"repository": staged.REPOSITORY, "sha": self.commit,
                   "run_id": 12345, "run_attempt": 2, "workflow_ref": "fixed"}
        self.runtime = {"lean_path": "/compiler/bin/lean", "lean_sha256": staged.LEAN_SHA256,
                        "checker_sha256": staged.CHECKER_SHA256}
        self.receipt = {
            "schema": staged.SCHEMA, "stage": self.stage, "phase": "strict-source-only",
            "status": "source_passed", "commit": self.commit, "ci": dict(self.ci),
            "runtime": dict(self.runtime), "target": staged.STAGE_TARGETS[self.stage],
            "project_modules": list(self.modules), "checked_sources": list(self.modules),
            "source_failures": {}, "completed_checks": [staged.SOURCE_CHECK],
            "source_sha256": dict(self.sources), "gate_sha256": dict(self.inputs),
            "modern_modules": dict(self.modern), "accepted_registry_changed": False,
            "source_checks": {name: {"exit_code": 0, "timed_out": False}
                              for name in self.modules},
            "object_sha256": {name.replace(".", "/") + ".olean": "d" * 64
                              for name in self.modules},
        }

    def validate(self, receipt=None):
        return staged.validate_manifest(
            receipt or self.receipt, self.stage, self.commit, self.modules,
            self.sources, self.inputs, self.ci, self.runtime, self.modern)

    def rejects(self, change):
        altered = copy.deepcopy(self.receipt)
        change(altered)
        with self.assertRaises(RuntimeError):
            self.validate(altered)

    def test_exact_manifest_and_prior_attempt_same_run(self):
        self.assertEqual(len(self.validate()), 2)
        self.receipt["ci"]["run_attempt"] = 1
        self.assertEqual(len(self.validate()), 2)

    def test_commit(self):
        self.rejects(lambda row: row.update(commit="e" * 40))

    def test_mixed_run(self):
        self.rejects(lambda row: row["ci"].update(run_id=54321))

    def test_future_or_noninteger_attempt(self):
        self.rejects(lambda row: row["ci"].update(run_attempt=3))
        self.rejects(lambda row: row["ci"].update(run_attempt=True))

    def test_runtime(self):
        self.rejects(lambda row: row["runtime"].update(lean_sha256="e" * 64))

    def test_incomplete_coverage(self):
        self.rejects(lambda row: row["checked_sources"].pop())
        self.rejects(lambda row: row["source_checks"].pop(self.modules[0]))

    def test_source_failure_or_timeout(self):
        self.rejects(lambda row: row["source_failures"].update({self.modules[0]: "failed"}))
        self.rejects(lambda row: row["source_checks"][self.modules[0]].update(exit_code=1))
        self.rejects(lambda row: row["source_checks"][self.modules[0]].update(timed_out=True))

    def test_altered_sources_or_controls(self):
        self.rejects(lambda row: row["source_sha256"].update({self.modules[0]: "e" * 64}))
        self.rejects(lambda row: row["gate_sha256"].update({"scripts/control.py": "e" * 64}))

    def test_missing_or_extra_object(self):
        self.rejects(lambda row: row["object_sha256"].pop("Conjectures/One.olean"))
        self.rejects(lambda row: row["object_sha256"].update({"Conjectures/Other.olean": "d" * 64}))

    def test_stale_legacy_companion(self):
        self.rejects(lambda row: row["object_sha256"].update(
            {"Conjectures/One.olean.private": "d" * 64}))

    def test_missing_modern_private_facet(self):
        self.modern[self.modules[0]] = True
        self.receipt["modern_modules"] = dict(self.modern)
        self.receipt["object_sha256"]["Conjectures/One.olean.server"] = "d" * 64
        with self.assertRaises(RuntimeError):
            self.validate()
        self.receipt["object_sha256"]["Conjectures/One.olean.private"] = "d" * 64
        self.assertEqual(len(self.validate()), 4)

    def test_failed_status_and_unknown_schema(self):
        self.rejects(lambda row: row.update(status="failed"))
        self.rejects(lambda row: row.update(schema=1))

    def test_scope_claim(self):
        self.rejects(lambda row: row.update(accepted_registry_changed=True))

    def test_indirect_evidence_and_tampered_bytes(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / "proof.lean").write_text("theorem example : True := trivial\n")
            before = staged.file_inventory(root)
            (root / "proof.lean").write_text("changed\n")
            self.assertNotEqual(staged.file_inventory(root), before)
            (root / "alias").symlink_to(root / "proof.lean")
            with self.assertRaises(RuntimeError):
                staged.file_inventory(root)


class AuditEvidenceTests(unittest.TestCase):
    def exercise(self, relative, *, symlink=False):
        with tempfile.TemporaryDirectory() as temporary:
            stage = Path(temporary)
            for directory in ("src", "logs", "progress"):
                (stage / directory).mkdir()
            (stage / "src/HadamardQuotient133Audit.lean").write_text("-- checked audit\n")
            (stage / "declaration-inventory.json").write_text("{}\n")
            (stage / "logs/audit.log").write_text("checked\n")
            (stage / "progress/audit.json").write_text('{"exit_code":0,"timed_out":false}\n')
            record = {
                "exit_code": 0, "timed_out": False,
                "log_relative": "logs/audit.log",
                "progress_relative": "progress/audit.json",
                "log_sha256": staged.gate.digest(stage / "logs/audit.log"),
                "progress_sha256": staged.gate.digest(stage / "progress/audit.json"),
                "audit_source_sha256": staged.gate.digest(
                    stage / "src/HadamardQuotient133Audit.lean"),
                "declaration_inventory_sha256": staged.gate.digest(
                    stage / "declaration-inventory.json"),
            }
            receipt = {"axiom_audit": record}
            staged.recheck_evidence(stage, receipt)
            target = stage / relative
            if symlink:
                copy = stage / "same-bytes"
                copy.write_bytes(target.read_bytes())
                target.unlink()
                target.symlink_to(copy)
            else:
                target.write_text("changed after replay\n")
            with self.assertRaises(RuntimeError):
                staged.recheck_evidence(stage, receipt)

    def test_changed_audit_source(self):
        self.exercise("src/HadamardQuotient133Audit.lean")

    def test_changed_declaration_inventory(self):
        self.exercise("declaration-inventory.json")

    def test_indirect_audit_evidence(self):
        self.exercise("src/HadamardQuotient133Audit.lean", symlink=True)
        self.exercise("declaration-inventory.json", symlink=True)


class SourceMapTests(unittest.TestCase):
    def test_begin_copies_actual_sources_with_module_keys(self):
        target = staged.gate.TASKS["model"][0]
        commit = "c" * 40

        def check_inputs(actual_commit, modules, sources, inputs):
            self.assertEqual(actual_commit, commit)
            self.assertEqual(set(sources), set(modules))
            self.assertEqual(sources, {
                module: staged.gate.digest(staged.gate.source(module)) for module in modules})
            self.assertEqual(inputs, staged.input_hashes())

        with tempfile.TemporaryDirectory() as temporary, \
                patch.object(staged.gate, "revision", return_value=commit), \
                patch.object(staged, "ci_identity", return_value={"sha": commit}), \
                patch.object(staged, "assert_head_inputs", side_effect=check_inputs), \
                patch.object(staged, "resolve_runtime",
                             return_value=(Path("/compiler"), [], {})), \
                patch.object(staged, "environment", return_value={}):
            stage = Path(temporary) / "stage"
            values = staged.begin(stage, target, "strict-source-only")
            modules, sources = values[:2]
            self.assertGreater(len(modules), 0)
            self.assertEqual(set(sources), set(modules))
            for module in modules:
                copied = stage / "src" / (module.replace(".", "/") + ".lean")
                self.assertEqual(staged.gate.digest(copied), sources[module])

class CoverageTests(unittest.TestCase):
    def test_five_source_stages_cover_all_margin_leaves(self):
        self.assertEqual(len(staged.STAGES), 5)
        target = staged.gate.TASKS["main"][0]
        all_modules = staged.gate.dependency_order(target)
        self.assertEqual(len(all_modules), 215)
        covered = set()
        leaf_groups = []
        for name in staged.STAGES:
            modules = set(staged.gate.dependency_order(staged.STAGE_TARGETS[name]))
            self.assertTrue(modules <= set(all_modules))
            covered.update(modules)
            if name.startswith("margins_source"):
                leaves = {module for module in modules
                          if module.startswith("Conjectures.HadamardQuotient133MarginChecks")}
                self.assertEqual(len(leaves), 31)
                leaf_groups.append(leaves)
        self.assertEqual(len(set.union(*leaf_groups)), 93)
        self.assertEqual(sum(map(len, leaf_groups)), 93)
        remaining = [module for module in all_modules if module not in covered]
        self.assertEqual(covered | set(remaining), set(all_modules))
        self.assertEqual(len(covered) + len(remaining), len(all_modules))
        self.assertIn(target, remaining)


if __name__ == "__main__":
    unittest.main()
