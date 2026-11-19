#!/usr/bin/env python3
"""Regression tests for candidate coverage and evidence that can fail closed."""

from pathlib import Path
import copy
import json
import os
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import verify_frankl_span_four_candidate as gate


class CandidatePlanningTests(unittest.TestCase):
    def test_full_plan_keeps_maximal_closures_and_all_contained_endpoints(self):
        plan = gate.ci_plan(None)
        self.assertEqual(plan["tasks"], ["small-cyclic-weights-pilot", "weight-batches", "word-coverage"])
        covered = {task for names in plan["covered_affected_tasks"].values() for task in names}
        self.assertEqual(covered, set(gate.TASKS))
        expected = {name for _, names in gate.TASKS.values() for name in names}
        required = {name for names in plan["required_theorems"].values() for name in names}
        self.assertEqual(required, expected)
        matching_jobs = [task for task in plan["tasks"] if "Conjectures.FranklVaughanMatching"
                         in plan["preflight"][task]["project_modules"]]
        self.assertEqual(matching_jobs, ["weight-batches"])

    def test_publication_missing_does_not_silently_remove_a_job(self):
        plan = gate.ci_plan({"lean/Conjectures/FranklCyclicRankList.lean"})
        self.assertEqual(plan["tasks"], ["weight-batches"])
        self.assertIn("preflight", plan)
        self.assertIn("missing_peer_sources", plan["preflight"]["weight-batches"])

    def test_unrelated_frankl_change_starts_no_span_four_job(self):
        self.assertEqual(gate.ci_plan({"lean/Conjectures/FranklLargeTheorem.lean"})["tasks"], [])

    def test_inventory_change_selects_all_maximal_components(self):
        self.assertEqual(gate.ci_plan({gate.INVENTORY_PATH})["tasks"],
                         ["small-cyclic-weights-pilot", "weight-batches", "word-coverage"])

    def test_direct_schedule_keeps_its_small_closure(self):
        target, modules, _, required = gate.task_spec("schedule")
        self.assertEqual(target, "Conjectures.FranklSmallCyclicSchedule")
        self.assertEqual(len(modules), 28)
        self.assertNotIn("Conjectures.FranklVaughanMatching", modules)
        self.assertIn("FranklSmallCyclic.residual_window_schedule_abundant", required)

    def test_manual_component_plan_does_not_expand_to_matching(self):
        plan = gate.ci_plan(None, "assembly-core")
        self.assertEqual(plan["tasks"], ["assembly-core"])
        self.assertNotIn("Conjectures.FranklVaughanMatching",
                         plan["preflight"]["assembly-core"]["project_modules"])

    def test_pilot_activation_has_its_reviewed_receipt_and_private_nodes(self):
        self.assertIn("small-cyclic-weights-pilot", gate.INVENTORY["local_gates"])
        _, modules, _, required = gate.task_spec("small-cyclic-weights-pilot")
        self.assertEqual(len(modules), 25)
        count = sum(len(gate.INVENTORY["modules"][m]["private_certificate_nodes"]) for m in modules)
        self.assertEqual(count, 24)
        self.assertNotIn("Conjectures.FranklVaughanMatching", modules)
        for n in [7, 8, 9]:
            self.assertIn(f"FranklSmallCyclic.Weights.Period{n}Pilot.checked", required)
            self.assertIn(f"FranklSmallCyclic.Weights.Period{n}Pilot.each_checked", required)

    def test_word_coverage_is_independent_of_missing_peer_sources(self):
        _, modules, _, required = gate.task_spec("word-coverage")
        self.assertEqual(modules, ["Conjectures.FranklSpanFourWordCoverage"])
        self.assertEqual(gate.preflight_report("word-coverage")["missing_peer_sources"], [])
        self.assertIn("FranklSpanFour.WordCoverage.mem_overlapWords_iff", required)

    def test_cli_exports_workflow_array_with_missing_sources_reported(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "github-output"
            result = subprocess.run([sys.executable, gate.__file__, "--plan-ci", "--files",
                                     "lean/Conjectures/FranklCyclicRankList.lean"],
                                    cwd=gate.ROOT, text=True, capture_output=True, check=True,
                                    env={**os.environ, "GITHUB_OUTPUT": str(path)})
            self.assertEqual(json.loads(result.stdout)["tasks"], ["weight-batches"])
            self.assertEqual(path.read_text(), 'tasks=["weight-batches"]\n')


class InventoryTests(unittest.TestCase):
    def test_frozen_assembly_has_exactly_74_sources_and_597_private_nodes(self):
        _, modules, _, required = gate.task_spec("assembly")
        self.assertEqual(len(modules), 74)
        count = sum(len(gate.INVENTORY["modules"][m]["private_certificate_nodes"]) for m in modules)
        self.assertEqual(count, 597)
        self.assertIn("FranklSpanFour.Assembly.unionClosed_family_abundant", required)
        self.assertIn("FranklSpanFour.abundant_of_generated_eq_insert_empty", required)

    def test_empty_checkout_reports_every_missing_source_and_peer(self):
        with tempfile.TemporaryDirectory() as directory:
            report = gate.preflight_report("assembly", root=directory)
        self.assertFalse(report["ready"])
        self.assertEqual(len(report["missing_sources"]), 74)
        self.assertEqual(set(report["missing_peer_sources"]), set(gate.INVENTORY["peer_owned_modules"]))

    def test_modified_source_is_not_treated_as_a_missing_dependency(self):
        target, _, _, _ = gate.task_spec("family-transfer")
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            path = root / gate.INVENTORY["modules"][target]["path"]
            path.parent.mkdir(parents=True)
            path.write_text("module\n/- changed source -/\n")
            report = gate.preflight_report("family-transfer", root=root)
        self.assertIn(target, report["source_hash_mismatches"])
        self.assertNotIn(target, report["missing_sources"])

    def test_undeclared_dependency_fails_inventory_loading(self):
        data = copy.deepcopy(gate.INVENTORY)
        first = next(iter(data["modules"]))
        data["modules"][first]["project_imports"].append("Conjectures.MissingPeer")
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            path = root / gate.INVENTORY_PATH
            path.parent.mkdir(parents=True)
            path.write_text(json.dumps(data))
            with self.assertRaisesRegex(ValueError, "unlisted project dependency"):
                gate.load_inventory(root)


class ProofEvidenceTests(unittest.TestCase):
    def test_period_nine_private_names_are_in_the_explicit_audit(self):
        _, modules, _, required = gate.task_spec("assembly")
        nodes = {m: gate.INVENTORY["modules"][m]["private_certificate_nodes"]
                 for m in modules if gate.INVENTORY["modules"][m]["private_certificate_nodes"]}
        text = gate.audit_source(modules, required, nodes)
        for module in modules:
            self.assertIn("import all " + module + "\n", text)
        self.assertIn("`Frankl.FC.VaughanMatching.checked366", text)
        self.assertIn("`Frankl.FC.SmallCyclicPasch.checked14", text)
        self.assertIn("`FranklSmallCyclic.checked7_6", text)
        self.assertIn("unless seenPrivate.size == expectedPrivate.size", text)

    def test_private_node_renaming_fails_even_if_count_is_unchanged(self):
        module = "Conjectures.FranklSmallCyclicNineData7"
        entry = gate.INVENTORY["modules"][module]
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            path = root / entry["path"]
            path.parent.mkdir(parents=True)
            path.write_text("namespace FranklSmallCyclic\nprivate theorem checked7_99 : True := trivial\n")
            with self.assertRaisesRegex(ValueError, "private certificate inventory differs"):
                gate.private_certificate_nodes([module], root=root)

    def test_partial_exit_zero_replay_is_rejected(self):
        with self.assertRaisesRegex(RuntimeError, "missing=.*Conjectures.B"):
            gate.assert_exact_replay_set("replaying Conjectures.A\nPASS\n", ["Conjectures.A", "Conjectures.B"])

    def test_extra_replay_module_is_rejected(self):
        with self.assertRaisesRegex(RuntimeError, "extra=.*Conjectures.B"):
            gate.assert_exact_replay_set("replaying Conjectures.A\nreplaying Conjectures.B\n", ["Conjectures.A"])

    def test_duplicate_replay_module_is_rejected(self):
        with self.assertRaisesRegex(RuntimeError, "duplicate"):
            gate.assert_exact_replay_set("replaying Conjectures.A\nreplaying Conjectures.A\n", ["Conjectures.A"])

    def test_exact_replay_set_can_be_reported_in_any_order(self):
        actual = gate.assert_exact_replay_set("replaying Conjectures.B\nreplaying Conjectures.A\n",
                                             ["Conjectures.A", "Conjectures.B"])
        self.assertEqual(actual, ["Conjectures.B", "Conjectures.A"])

    def test_missing_private_object_facet_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            lean = Path(directory)
            path = lean / ".lake/build/lib/lean/Conjectures/A.olean"
            path.parent.mkdir(parents=True)
            path.write_bytes(b"public")
            with patch.object(gate, "LEAN", lean):
                with self.assertRaisesRegex(RuntimeError, "missing modern Lean object facet"):
                    gate.object_hashes(["Conjectures.A"])

    def test_symlinked_project_object_is_rejected_before_overwrite(self):
        with tempfile.TemporaryDirectory() as directory:
            lean = Path(directory)
            target = lean / "donor.olean"
            target.write_bytes(b"unchanged")
            path = lean / ".lake/build/lib/lean/Conjectures/A.olean"
            path.parent.mkdir(parents=True)
            path.symlink_to(target)
            with patch.object(gate, "LEAN", lean):
                with self.assertRaisesRegex(RuntimeError, "symlinked project artifact"):
                    gate.check_output_paths(["Conjectures.A"])
            self.assertEqual(target.read_bytes(), b"unchanged")


if __name__ == "__main__":
    unittest.main()
