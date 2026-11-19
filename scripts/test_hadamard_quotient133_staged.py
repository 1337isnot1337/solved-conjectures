"""Reject incomplete, mixed-commit, or tampered source-stage evidence."""

import copy
import hashlib
import json
from pathlib import Path
import tempfile
import unittest

import verify_hadamard_quotient133_staged as staged


class ProvenanceTests(unittest.TestCase):
    def setUp(self):
        self.stage = "catalog_verified"
        self.modules = [staged.gate.TASKS[self.stage][0]]
        self.sources = {"lean/" + self.modules[0].replace(".", "/") + ".lean": "1" * 64}
        self.inputs = {"lean/lean-toolchain": "2" * 64}
        self.name = self.modules[0].replace(".", "/") + ".olean"
        self.receipt = {
            "schema": 1, "stage": self.stage, "phase": "strict-source-only",
            "status": "source_passed", "commit": "a" * 40,
            "target": self.modules[0], "project_modules": self.modules,
            "checked_sources": self.modules, "source_failures": {},
            "completed_checks": [staged.SOURCE_CHECK],
            "source_sha256": self.sources, "gate_sha256": self.inputs,
            "object_sha256": {self.name: hashlib.sha256(b"checked bytes").hexdigest()},
        }

    def validate(self, receipt):
        return staged.validate_manifest(receipt, self.stage, "a" * 40,
                                        self.modules, self.sources, self.inputs)

    def test_complete_source_manifest_is_accepted_only_as_source_evidence(self):
        self.assertEqual(self.validate(self.receipt), self.receipt["object_sha256"])
        changed = copy.deepcopy(self.receipt)
        changed["status"] = "passed"
        with self.assertRaises(RuntimeError):
            self.validate(changed)

    def test_wrong_commit_sources_inputs_and_coverage_are_rejected(self):
        cases = {
            "commit": "b" * 40,
            "source_sha256": {next(iter(self.sources)): "3" * 64},
            "gate_sha256": {"lean/lean-toolchain": "4" * 64},
            "project_modules": [], "checked_sources": [],
            "source_failures": {self.modules[0]: "compiler failed"},
            "completed_checks": [], "target": "Conjectures.Unrelated",
            "stage": "rows_verified", "phase": "complete-verification",
        }
        for key, value in cases.items():
            with self.subTest(key=key):
                changed = copy.deepcopy(self.receipt)
                changed[key] = value
                with self.assertRaises(RuntimeError):
                    self.validate(changed)

    def test_missing_primary_object_and_unrelated_object_are_rejected(self):
        for objects in ({}, {self.name: "a" * 64, "../../unrelated.olean": "b" * 64}):
            changed = copy.deepcopy(self.receipt)
            changed["object_sha256"] = objects
            with self.assertRaises(RuntimeError):
                self.validate(changed)

    def test_tampered_downloaded_object_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            directory = Path(folder)
            target = directory / "objects" / self.name
            target.parent.mkdir(parents=True)
            target.write_bytes(b"checked bytes")
            objects = self.validate(self.receipt)
            self.assertEqual(staged.verified_objects(directory, objects)[self.name], target)
            target.write_bytes(b"different bytes")
            with self.assertRaisesRegex(RuntimeError, "object hash mismatch"):
                staged.verified_objects(directory, objects)

    def test_failed_stage_receipt_is_rejected_after_json_roundtrip(self):
        changed = json.loads(json.dumps(self.receipt))
        changed["status"] = "failed"
        with self.assertRaisesRegex(RuntimeError, "did not pass"):
            self.validate(changed)


if __name__ == "__main__":
    unittest.main()
