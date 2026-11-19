#!/usr/bin/env python3
"""Regression checks for FC job coverage and private-proof audit visibility."""

from pathlib import Path
import json
import os
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import verify_frankl_fc_candidate as gate


class CandidatePlanningTests(unittest.TestCase):
    def test_full_plan_uses_one_packet_and_preserves_all_endpoints(self):
        plan = gate.ci_plan(None)
        self.assertEqual(plan["tasks"], ["packet"])
        self.assertEqual(set(plan["covered_affected_tasks"]["packet"]), set(gate.TASKS))
        self.assertEqual(set(plan["required_theorems"]["packet"]),
                         {name for _, names in gate.TASKS.values() for name in names})

    def test_matching_change_keeps_matching_endpoints(self):
        plan = gate.ci_plan({"lean/Conjectures/FranklVaughanMatching.lean"})
        self.assertEqual(plan["tasks"], ["packet"])
        self.assertIn("vaughan-matching", plan["covered_affected_tasks"]["packet"])
        for name in gate.TASKS["vaughan-matching"][1]:
            self.assertIn(name, plan["required_theorems"]["packet"])

    def test_family_change_keeps_adapter_endpoint(self):
        plan = gate.ci_plan({"lean/Conjectures/FranklFCFamily.lean"})
        self.assertEqual(plan["tasks"], ["packet"])
        self.assertIn("Frankl.FC.Family.three_generator_triples_abundant",
                      plan["required_theorems"]["packet"])

    def test_gate_change_selects_packet(self):
        plan = gate.ci_plan({"scripts/test_frankl_fc_candidate.py"})
        self.assertEqual(plan["tasks"], ["packet"])

    def test_unrelated_change_starts_no_fc_proof_job(self):
        plan = gate.ci_plan({"lean/Conjectures/FranklHighGirthTheorem.lean"})
        self.assertEqual(plan["tasks"], [])

    def test_equal_closures_have_one_deterministic_representative(self):
        closures = {"a": frozenset({"X"}), "b": frozenset({"X"}),
                    "c": frozenset({"Y"})}
        self.assertEqual(gate.maximal_tasks(["b", "c", "a"], closures), ["a", "c"])

    def test_direct_matching_task_keeps_its_small_closure(self):
        target, modules, covered, required = gate.task_spec("vaughan-matching")
        self.assertEqual(target, "Conjectures.FranklVaughanMatching")
        self.assertNotIn("Conjectures.FranklFCFamily", modules)
        self.assertNotIn("Conjectures.FranklSmallCyclicResults", modules)
        self.assertIn("vaughan-matching", covered)
        self.assertIn("Frankl.FC.VaughanMatching.checked", required)

    def test_cli_exports_the_workflow_task_array(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "github-output"
            result = subprocess.run(
                [sys.executable, str(Path(gate.__file__)), "--plan-ci", "--files",
                 "lean/Conjectures/FranklVaughanMatching.lean"],
                cwd=gate.ROOT, check=True, text=True, capture_output=True,
                env={**os.environ, "GITHUB_OUTPUT": str(output)})
            self.assertEqual(json.loads(result.stdout)["tasks"], ["packet"])
            self.assertEqual(output.read_text(), 'tasks=["packet"]\n')


class PrivateProofAuditTests(unittest.TestCase):
    def test_packet_asserts_all_534_certificate_nodes_including_pasch(self):
        _, modules, _, required = gate.task_spec("packet")
        nodes = gate.private_certificate_nodes(modules)
        self.assertEqual(len(nodes["Conjectures.FranklVaughanMatching"]), 367)
        self.assertEqual(len(nodes["Conjectures.FranklSmallCyclicPaschCertificate"]), 15)
        self.assertEqual(sum(map(len, nodes.values())), 534)
        text = gate.audit_source(modules, required, nodes)
        for module in modules:
            self.assertIn("import all " + module + "\n", text)
        self.assertIn("`Frankl.FC.VaughanMatching.checked366", text)
        self.assertIn("`Frankl.FC.SmallCyclicPasch.checked14", text)
        self.assertIn('throwError "Missing private certificate theorem: {name}"', text)
        self.assertIn("unless seenPrivate.size == expectedPrivate.size", text)

    def test_ambiguous_private_node_namespace_fails_closed(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "Conjectures").mkdir()
            (root / "Conjectures/Example.lean").write_text(
                "namespace A\nnamespace B\nprivate theorem checked0 : True := trivial\n")
            with patch.object(gate, "LEAN", root):
                with self.assertRaisesRegex(ValueError, "namespace layout"):
                    gate.private_certificate_nodes(["Conjectures.Example"])


if __name__ == "__main__":
    unittest.main()
