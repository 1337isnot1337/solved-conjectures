#!/usr/bin/env python3
"""Mutation tests for bounded-map evidence and the fresh gate's added checks."""
from __future__ import annotations

import copy
import io
import json
from pathlib import Path
import tempfile
import unittest
import warnings
import zipfile

import preserve_five_speed_bounded_receipts as history
import verify_five_speed_bounded_coverage as gate


def fixture():
    module = "Conjectures.Example"
    task = "bounded-maps-00"
    group = {"task": task, "modules": [module], "targets": [module],
             "required_theorems": ["Loneliness.Example.sound"],
             "job_id": 31, "artifact_id": 41, "artifact_name": "five-speed-" + task}
    historical = {
        "run_id": 21, "commit": "a" * 40,
        "source_flags": list(history.OLD_FLAGS), "audit_scope": history.OLD_AUDIT,
        "source_sha256": {path: history.digest(b"source") for path in
                          [history.source_path(module), *history.OLD_CONTROLS]},
    }
    object_path = "lib/lean/Conjectures/Example.olean"
    receipt = {
        "task": task, "commit": historical["commit"],
        "status": "checked candidate; not registered in accepted roots",
        "targets": [module], "checked_project_modules": [module],
        "checks": list(history.OLD_CHECKS), "source_sha256": historical["source_sha256"].copy(),
        "artifact_sha256": {object_path: history.digest(b"object")},
    }
    return group, historical, receipt, [(object_path, b"object")]


def packet(group, historical, receipt, entries):
    raw = (json.dumps(receipt, indent=1) + "\n").encode()
    path = "receipts/" + group["task"] + ".json"
    output = io.BytesIO()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", UserWarning)
        with zipfile.ZipFile(output, "w", compression=zipfile.ZIP_DEFLATED) as archive:
            for name, data in [*entries, (path, raw)]:
                archive.writestr(name, data)
    payload = output.getvalue()
    group = {**group, "archive_sha256": history.digest(payload), "archive_bytes": len(payload)}
    artifact = {
        "id": group["artifact_id"], "name": group["artifact_name"],
        "workflow_run": {"id": historical["run_id"], "head_sha": historical["commit"]},
        "expired": False, "digest": "sha256:" + group["archive_sha256"],
    }
    return artifact, payload, group, raw


class HistoricalTests(unittest.TestCase):
    def test_preserves_exact_original_receipt_bytes(self):
        group, historical, receipt, entries = fixture()
        artifact, payload, group, raw = packet(group, historical, receipt, entries)
        result = history.validate_archive(artifact, payload, group, historical)
        self.assertEqual(result["raw"], raw)
        self.assertFalse(result["metadata"]["new_source_compilation"])
        self.assertFalse(result["metadata"]["new_axiom_audit"])
        self.assertFalse(result["metadata"]["historical_binary_hash_recorded"])

    def rejected(self, change):
        group, historical, receipt, entries = fixture()
        change(group, historical, receipt, entries)
        artifact, payload, group, _ = packet(group, historical, receipt, entries)
        with self.assertRaises(RuntimeError):
            history.validate_archive(artifact, payload, group, historical)

    def test_source_hash_mutation(self):
        self.rejected(lambda g, h, r, e: r["source_sha256"].__setitem__(
            "lean/Conjectures/Example.lean", "0" * 64))

    def test_receipt_commit_mutation(self):
        self.rejected(lambda g, h, r, e: r.__setitem__("commit", "b" * 40))

    def test_missing_object(self):
        self.rejected(lambda g, h, r, e: e.clear())

    def test_corrupt_object_with_correct_archive_digest(self):
        self.rejected(lambda g, h, r, e: e.__setitem__(0, (e[0][0], b"changed")))

    def test_unknown_extra_file(self):
        self.rejected(lambda g, h, r, e: e.append(("unrecorded.txt", b"x")))

    def test_duplicate_zip_member(self):
        self.rejected(lambda g, h, r, e: e.append(e[0]))

    def test_path_traversal(self):
        self.rejected(lambda g, h, r, e: e.append(("../escape", b"x")))

    def test_symlink_member(self):
        def mutate(g, h, r, entries):
            item = zipfile.ZipInfo("link")
            item.create_system = 3
            item.external_attr = 0o120777 << 16
            entries.append((item, b"target"))
        self.rejected(mutate)

    def test_partial_private_server_pair(self):
        def mutate(g, h, r, entries):
            path = "lib/lean/Conjectures/Example.olean.private"
            entries.append((path, b"private"))
            r["artifact_sha256"][path] = history.digest(b"private")
        self.rejected(mutate)

    def test_historical_linter_policy_cannot_be_upgraded(self):
        self.rejected(lambda g, h, r, e: h.__setitem__("source_flags",
            ["-j1", "-M4500", "-DwarningAsError=true"]))

    def test_wrong_artifact_run(self):
        group, historical, receipt, entries = fixture()
        artifact, payload, group, _ = packet(group, historical, receipt, entries)
        artifact["workflow_run"]["id"] += 1
        with self.assertRaises(RuntimeError):
            history.validate_archive(artifact, payload, group, historical)


def named_inventory():
    module = "Conjectures.Example"
    private = ["Loneliness.Example.pairs_" + str(i) for i in range(4952)]
    model = {"required_theorems": ["Loneliness.Example.sound"],
             "required_owner": {"Loneliness.Example.sound": module},
             "numeric_private_theorems": {module: private}}
    declarations = {"Loneliness.Example.sound":
                    {"kind": "theorem", "private_user_name": None}}
    for i, user in enumerate(private):
        declarations["_private.Example." + str(i)] = {
            "kind": "theorem", "private_user_name": user}
    inventory = {"declarations": declarations,
                 "modules": {module: {"names": list(declarations)}}}
    return model, inventory


class FreshGateTests(unittest.TestCase):
    def test_named_numeric_private_proofs_are_visible(self):
        model, inventory = named_inventory()
        gate.validate_named_inventory(inventory, model)

    def test_omitted_private_proof_is_rejected(self):
        model, inventory = named_inventory()
        del inventory["declarations"]["_private.Example.4951"]
        with self.assertRaisesRegex(RuntimeError, "private theorem"):
            gate.validate_named_inventory(inventory, model)

    def test_required_definition_is_not_a_theorem(self):
        model, inventory = named_inventory()
        inventory["declarations"]["Loneliness.Example.sound"]["kind"] = "definition"
        with self.assertRaisesRegex(RuntimeError, "kind or serialized ownership"):
            gate.validate_named_inventory(inventory, model)

    def test_wrong_serialized_private_owner(self):
        model, inventory = named_inventory()
        inventory["modules"]["Conjectures.Example"]["names"].remove("_private.Example.0")
        with self.assertRaisesRegex(RuntimeError, "private theorem"):
            gate.validate_named_inventory(inventory, model)

    def test_name_components_control_singleton_replay(self):
        gate.exact_singleton(["Conjectures.Exact", "Conjectures.ExactOther"], "Conjectures.Exact")
        with self.assertRaises(RuntimeError):
            gate.exact_singleton(["Conjectures.Exact", "Conjectures.Exact.Child"], "Conjectures.Exact")

    def test_incomplete_legacy_private_facet_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            stage = Path(directory)
            stem = stage / "lib/lean/Conjectures/Example"
            stem.parent.mkdir(parents=True)
            Path(str(stem) + ".olean").write_bytes(b"public")
            Path(str(stem) + ".olean.private").write_bytes(b"private")
            with self.assertRaisesRegex(RuntimeError, "private/server"):
                gate.objects(stage, ["Conjectures.Example"], {"Conjectures.Example": False})


if __name__ == "__main__":
    unittest.main()
