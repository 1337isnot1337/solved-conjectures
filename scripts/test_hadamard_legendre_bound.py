#!/usr/bin/env python3
"""Fail-closed composition tests for the length-1197 multiplier-bound gate."""
import copy
from fnmatch import fnmatchcase
import json
from pathlib import Path
import re
import tempfile
import unittest

import verify_hadamard_legendre_bound as bound


class FiniteHeaderTests(unittest.TestCase):
    def setUp(self):
        self.modules = ["Conjectures.One", "Conjectures.Two"]
        self.sources = {name: "a" * 64 for name in self.modules}
        self.controls = {"scripts/control.py": "b" * 64}
        self.modern = {name: False for name in self.modules}
        self.spec = {
            "run_id": 12345, "run_attempt": 2, "commit": "c" * 40,
            "artifact_id": 67890, "artifact_name": "hadamard-quotient133-main-receipt",
            "receipt_sha256": "d" * 64,
            "workflow_ref": bound.finite.REPOSITORY + "/" +
                ".github/workflows/lean-hadamard-quotient133-candidates.yml@refs/heads/main",
        }
        success = {"exit_code": 0, "timed_out": False}
        self.receipt = {
            "schema": bound.finite.SCHEMA, "phase": "complete-verification",
            "task": "main", "status": "passed", "commit": self.spec["commit"],
            "ci": bound.expected_finite_ci(self.spec),
            "target": bound.gate.TASKS["main"][0],
            "required_theorems": bound.gate.TASKS["main"][1],
            "project_modules": list(self.modules), "checked_sources": list(self.modules),
            "source_sha256": dict(self.sources), "gate_sha256": dict(self.controls),
            "modern_modules": dict(self.modern), "source_failures": {},
            "accepted_registry_changed": False,
            "runtime": {"lean_sha256": bound.finite.LEAN_SHA256,
                        "checker_sha256": bound.finite.CHECKER_SHA256},
            "producer_reproduction": dict(success),
            "axiom_audit": {**success, "all_owned_declarations_audited": True,
                "exact_raw_private_visibility": True, "complete_serialized_private_import": True},
            "kernel_replay": {**success, "exact_target_multiset": True,
                "unchanged_stock_checker": True, "stock_prefix": "Conjectures",
                "replayed_modules": list(self.modules)},
        }

    def validate(self, receipt=None):
        bound.validate_finite_header(receipt or self.receipt, self.spec, self.modules,
                                     self.sources, self.controls, self.modern)

    def rejects(self, change):
        receipt = copy.deepcopy(self.receipt)
        change(receipt)
        with self.assertRaises(RuntimeError):
            self.validate(receipt)

    def test_complete_header(self):
        self.validate()

    def test_failed_or_source_only_component(self):
        self.rejects(lambda r: r.update(status="failed"))
        self.rejects(lambda r: r.update(phase="strict-source-only"))
        self.rejects(lambda r: r.update(schema=1))

    def test_wrong_run_commit_or_attempt(self):
        self.rejects(lambda r: r["ci"].update(run_id=54321))
        self.rejects(lambda r: r["ci"].update(run_attempt=1))
        self.rejects(lambda r: r.update(commit="e" * 40))

    def test_wrong_theorems_or_target(self):
        self.rejects(lambda r: r.update(required_theorems=[]))
        self.rejects(lambda r: r.update(target="Conjectures.Other"))

    def test_incomplete_source_coverage(self):
        self.rejects(lambda r: r["checked_sources"].pop())
        self.rejects(lambda r: r["source_failures"].update({self.modules[0]: "failed"}))

    def test_altered_sources_controls_or_facets(self):
        self.rejects(lambda r: r["source_sha256"].update({self.modules[0]: "e" * 64}))
        self.rejects(lambda r: r["gate_sha256"].update({"scripts/control.py": "e" * 64}))
        self.rejects(lambda r: r["modern_modules"].update({self.modules[0]: True}))

    def test_changed_runtime(self):
        self.rejects(lambda r: r["runtime"].update(checker_sha256="e" * 64))

    def test_missing_or_failed_complete_checks(self):
        self.rejects(lambda r: r.pop("producer_reproduction"))
        self.rejects(lambda r: r["axiom_audit"].update(exit_code=1))
        self.rejects(lambda r: r["kernel_replay"].update(timed_out=True))

    def test_old_theorem_only_audit(self):
        self.rejects(lambda r: r["axiom_audit"].pop("all_owned_declarations_audited"))
        self.rejects(lambda r: r["axiom_audit"].update(exact_raw_private_visibility=False))

    def test_inexact_or_changed_stock_replay(self):
        self.rejects(lambda r: r["kernel_replay"]["replayed_modules"].pop())
        self.rejects(lambda r: r["kernel_replay"]["replayed_modules"].append(self.modules[0]))
        self.rejects(lambda r: r["kernel_replay"].update(unchanged_stock_checker=False))

    def test_registration_overclaim(self):
        self.rejects(lambda r: r.update(accepted_registry_changed=True))

    def test_pending_dependency_cannot_authenticate(self):
        for key in ("artifact_id", "receipt_sha256", "run_attempt", "workflow_ref"):
            self.spec[key] = None
        self.assertFalse(bound.finite_ready(self.spec))
        with self.assertRaises(RuntimeError):
            self.validate()

    def test_partial_or_boolean_pin(self):
        for key, bad in (("artifact_id", False), ("run_attempt", True),
                         ("receipt_sha256", None), ("workflow_ref", "another/workflow")):
            spec = dict(self.spec)
            spec[key] = bad
            with self.assertRaises(RuntimeError):
                bound.finite_ready(spec)


class SealTests(unittest.TestCase):
    def exercise(self, change):
        with tempfile.TemporaryDirectory() as temporary:
            folder = Path(temporary)
            obj = folder / "lib/lean/Conjectures/One.olean"
            obj.parent.mkdir(parents=True)
            obj.write_bytes(b"checked object fixture")
            receipt = {"evidence_sha256": bound.finite.file_inventory(folder)}
            bound.finite.write_json(folder / "receipt.json", receipt)
            spec = {"receipt_sha256": bound.digest(folder / "receipt.json")}
            (folder / "receipt.sha256").write_text(spec["receipt_sha256"] + "\n")
            bound.verify_finite_seal(folder, spec, receipt)
            change(folder)
            with self.assertRaises(RuntimeError):
                bound.verify_finite_seal(folder, spec, receipt)

    def test_changed_receipt(self):
        self.exercise(lambda p: (p / "receipt.json").write_text("{}\n"))

    def test_changed_receipt_sidecar(self):
        self.exercise(lambda p: (p / "receipt.sha256").write_text("changed\n"))

    def test_changed_object(self):
        self.exercise(lambda p: (p / "lib/lean/Conjectures/One.olean").write_bytes(b"changed"))

    def test_unlisted_evidence(self):
        self.exercise(lambda p: (p / "extra").write_text("unlisted"))

    def test_indirect_evidence(self):
        self.exercise(lambda p: (p / "alias").symlink_to(p / "receipt.json"))


class BoundEvidenceTests(unittest.TestCase):
    def exercise(self, relative, *, indirect=False):
        with tempfile.TemporaryDirectory() as temporary:
            stage = Path(temporary)
            for directory in ("src", "logs", "progress"):
                (stage / directory).mkdir()
            (stage / bound.AUDIT_SOURCE).write_text("-- checked audit\n")
            (stage / "declaration-inventory.json").write_text("{}\n")
            (stage / "logs/check.log").write_text("checked\n")
            profile = {"exit_code": 0, "timed_out": False, "command": ["fixture"]}
            (stage / "progress/check.json").write_text(json.dumps(profile) + "\n")
            record = {**profile, "log_relative": "logs/check.log",
                "progress_relative": "progress/check.json",
                "log_sha256": bound.digest(stage / "logs/check.log"),
                "progress_sha256": bound.digest(stage / "progress/check.json")}
            audit = {**record, "audit_source_sha256": bound.digest(stage / bound.AUDIT_SOURCE),
                "declaration_inventory_sha256": bound.digest(stage / "declaration-inventory.json")}
            receipt = {"source_checks": {"Conjectures.One": record},
                       "axiom_audit": audit, "kernel_replay": dict(record)}
            bound.recheck_bound_evidence(stage, receipt)
            path = stage / relative
            if indirect:
                copy = stage / "same-bytes"
                copy.write_bytes(path.read_bytes())
                path.unlink()
                path.symlink_to(copy)
            else:
                path.write_text("changed after replay\n")
            with self.assertRaises(RuntimeError):
                bound.recheck_bound_evidence(stage, receipt)

    def test_changed_audit_source(self):
        self.exercise(bound.AUDIT_SOURCE)

    def test_changed_inventory(self):
        self.exercise("declaration-inventory.json")

    def test_changed_log_or_profile(self):
        self.exercise("logs/check.log")
        self.exercise("progress/check.json")

    def test_indirect_audit_evidence(self):
        self.exercise(bound.AUDIT_SOURCE, indirect=True)
        self.exercise("declaration-inventory.json", indirect=True)


class ComposedObjectTests(unittest.TestCase):
    def exercise(self, change, *, reject):
        with tempfile.TemporaryDirectory() as temporary:
            stage = Path(temporary)
            lib = stage / "lib/lean/Conjectures"
            lib.mkdir(parents=True)
            reused = lib / "Reused.olean"
            reused.write_bytes(b"authenticated finite object")
            original = {"Conjectures/Reused.olean": bound.digest(reused)}
            (lib / "Fresh.olean").write_bytes(b"freshly checked source object")
            change(reused, original)
            modules = ["Conjectures.Reused", "Conjectures.Fresh"]
            modern = {module: False for module in modules}
            if reject:
                with self.assertRaises(RuntimeError):
                    bound.composed_object_hashes(stage, modules, modern, original)
            else:
                result = bound.composed_object_hashes(stage, modules, modern, original)
                self.assertEqual(result["Conjectures/Reused.olean"], original["Conjectures/Reused.olean"])
                self.assertEqual(len(result), 2)

    def test_unchanged_authenticated_objects_join_fresh_objects(self):
        self.exercise(lambda path, original: None, reject=False)

    def test_reused_object_changed_before_final_baseline(self):
        self.exercise(lambda path, original: path.write_bytes(b"changed during fresh compile"),
                      reject=True)

    def test_original_authenticated_object_missing_from_final_closure(self):
        self.exercise(lambda path, original: original.update({"Conjectures/Missing.olean": "f" * 64}),
                      reject=True)


    def test_extra_object_outside_declared_namespace_is_rejected(self):
        for relative in ("Solitaire/Unchecked.olean", "Conjectures.olean", "Mathlib/Unchecked.olean"):
            with self.subTest(relative=relative):
                def change(path, original):
                    extra = path.parent.parent / relative
                    extra.parent.mkdir(parents=True, exist_ok=True)
                    extra.write_bytes(b"undeclared object")
                self.exercise(change, reject=True)


class SourceInventoryTests(unittest.TestCase):
    modules = ["Conjectures.One", "Conjectures.Two"]

    def stage(self, folder, audit=False):
        for module in self.modules:
            path = folder / "src" / (module.replace(".", "/") + ".lean")
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("-- exact source fixture\n")
        if audit:
            (folder / bound.AUDIT_SOURCE).write_text("-- authorized audit fixture\n")

    def test_exact_sources_and_one_authorized_audit(self):
        with tempfile.TemporaryDirectory() as temporary:
            folder = Path(temporary)
            self.stage(folder)
            bound.verify_source_inventory(folder, self.modules)
            (folder / bound.AUDIT_SOURCE).write_text("-- authorized audit fixture\n")
            bound.verify_source_inventory(folder, self.modules, bound.AUDIT_SOURCE)

    def test_extra_sources_across_the_entire_source_directory(self):
        for relative in ("Solitaire/Unchecked.lean", "Conjectures.lean", "OtherAudit.lean",
                         "Conjectures/Unchecked.lean", "unexpected.txt"):
            with self.subTest(relative=relative), tempfile.TemporaryDirectory() as temporary:
                folder = Path(temporary)
                self.stage(folder, audit=True)
                extra = folder / "src" / relative
                extra.parent.mkdir(parents=True, exist_ok=True)
                extra.write_text("-- undeclared source\n")
                with self.assertRaises(RuntimeError):
                    bound.verify_source_inventory(folder, self.modules, bound.AUDIT_SOURCE)

    def test_any_generated_source_is_undeclared(self):
        for relative in ("Solitaire/Unchecked.lean", "Conjectures.lean", "OtherAudit.lean"):
            with self.subTest(relative=relative), tempfile.TemporaryDirectory() as temporary:
                folder = Path(temporary)
                self.stage(folder)
                extra = folder / "generated" / relative
                extra.parent.mkdir(parents=True, exist_ok=True)
                extra.write_text("-- undeclared generated source\n")
                with self.assertRaises(RuntimeError):
                    bound.verify_source_inventory(folder, self.modules)

    def test_missing_module_or_authorized_audit(self):
        for relative in ("src/Conjectures/One.lean", bound.AUDIT_SOURCE):
            with self.subTest(relative=relative), tempfile.TemporaryDirectory() as temporary:
                folder = Path(temporary)
                self.stage(folder, audit=True)
                (folder / relative).unlink()
                with self.assertRaises(RuntimeError):
                    bound.verify_source_inventory(folder, self.modules, bound.AUDIT_SOURCE)

    def test_audit_must_be_explicitly_authorized(self):
        with tempfile.TemporaryDirectory() as temporary:
            folder = Path(temporary)
            self.stage(folder, audit=True)
            with self.assertRaises(RuntimeError):
                bound.verify_source_inventory(folder, self.modules)

    def test_source_file_or_directory_symlink_is_rejected(self):
        for relative in ("src/Conjectures/One.lean", "generated"):
            with self.subTest(relative=relative), tempfile.TemporaryDirectory() as temporary:
                folder = Path(temporary)
                self.stage(folder)
                alias = folder / relative
                if alias.is_file():
                    alias.unlink()
                alias.symlink_to(folder / "src/Conjectures/Two.lean")
                with self.assertRaises(RuntimeError):
                    bound.verify_source_inventory(folder, self.modules)


class CoverageTests(unittest.TestCase):
    def test_actual_frozen_source_control_and_dependency_maps(self):
        _, modules, finite_modules, fresh, sources, controls, _ = bound.preflight()
        self.assertEqual(len(modules), 243)
        self.assertEqual(len(finite_modules), 215)
        self.assertEqual(len(fresh), 28)
        self.assertEqual(set(finite_modules) & set(fresh), set())
        self.assertEqual(set(finite_modules) | set(fresh), set(modules))
        self.assertEqual(set(sources), set(modules))
        self.assertEqual(set(controls), bound.CONTROLS)

    def test_workflow_watches_every_frozen_input_for_push_and_pr(self):
        _, modules, _, _, _, controls, _ = bound.preflight()
        text = (bound.ROOT / bound.WORKFLOW).read_text()
        patterns = re.findall(r"^\s+- '([^']+)'$", text, re.M)
        paths = set(controls) | {bound.MODEL} | {
            str(bound.gate.source(module).relative_to(bound.ROOT)) for module in modules}
        for path in paths:
            self.assertEqual(sum(fnmatchcase(path, pattern) for pattern in patterns), 2, path)

    def test_stock_log_requires_exact_multiplicity(self):
        modules = ["Conjectures.One", "Conjectures.Two"]
        text = "replaying Conjectures.One\nreplaying Conjectures.Two\n"
        self.assertEqual(bound.replay_names(text, modules), modules)
        for altered in (text.splitlines()[0] + "\n", text + text.splitlines()[0] + "\n",
                        text + "replaying Conjectures.Unchecked\n",
                        text + "replaying Solitaire.Unchecked\n",
                        text + "replaying Conjectures\n",
                        text + "replaying Mathlib.Unchecked\n"):
            with self.assertRaises(RuntimeError):
                bound.replay_names(altered, modules)


class RawBoundAuditTests(unittest.TestCase):
    def test_original_finite_audit_renderer_keeps_its_scope(self):
        text = bound.audit_text(["Conjectures.One"], ["HadamardQuotient133.result"],
                                ["HadamardQuotient133."])
        self.assertIn("ALL-OWNED-JSON", text)
        self.assertNotIn("RAW-OCCURRENCE-JSON", text)
        self.assertNotIn("RawOccurrenceKernelCheck", text)

    def test_new_complete_audit_adds_raw_extraction(self):
        text = bound.bound_audit_text(["Conjectures.One"], {"Conjectures.One": False})
        self.assertIn("ALL-OWNED-JSON", text)
        self.assertIn("RAW-OCCURRENCE-JSON", text)
        self.assertIn("kernel.header.trustLevel == 0", text)
        self.assertIn("kernel.addDeclCore", text)
        self.assertNotIn("set_option maxHeartbeats 0", text)
        self.assertNotIn("set_option maxRecDepth 100000", text)

    def test_raw_audit_command_requires_zero_trust(self):
        self.assertEqual(bound.bound_audit_command(Path("/pinned/compiler"), "Audit.lean"),
            ["/pinned/compiler/bin/lean", "-t0", "-j1", "-M4500",
             "-DwarningAsError=true", "Audit.lean"])

    def test_visible_only_inventory_cannot_satisfy_new_audit(self):
        with self.assertRaises(RuntimeError):
            bound.require_raw_audit({"summary": {}, "declarations": {}})

    def test_raw_coverage_flags_and_completion_are_required(self):
        flags = ("all_serialized_occurrences_audited", "all_reachable_raw_variants_audited",
                 "all_nonidentical_raw_theorems_kernel_checked",
                 "all_mixed_family_selected_theorems_kernel_checked", "foreign_raw_variants_included",
                 "axiom_cache_bypassed", "checked_kernel_negative_control_rejected")
        inventory = {"all_serialized_occurrences_audited": True,
                     "raw_occurrence_graph": {**dict.fromkeys(flags, True),
                                              "summary": {"trust_level": 0, "pending": 0,
                                                          "audit_root_modern": False}}}
        bound.require_raw_audit(inventory)
        for flag in flags:
            with self.subTest(flag=flag):
                changed = copy.deepcopy(inventory)
                changed["raw_occurrence_graph"][flag] = False
                with self.assertRaises(RuntimeError):
                    bound.require_raw_audit(changed)
        for key, value in (("trust_level", 1), ("trust_level", False),
                           ("pending", 1), ("pending", False),
                           ("audit_root_modern", True), ("audit_root_modern", 0)):
            with self.subTest(key=key, value=value):
                changed = copy.deepcopy(inventory)
                changed["raw_occurrence_graph"]["summary"][key] = value
                with self.assertRaises(RuntimeError):
                    bound.require_raw_audit(changed)


if __name__ == "__main__":
    unittest.main()
