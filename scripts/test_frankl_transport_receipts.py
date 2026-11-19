#!/usr/bin/env python3
"""Regression tests for transport receipt validation; fixtures are not Lean evidence."""

from __future__ import annotations

import copy
import io
import json
import unittest
import warnings
import zipfile

import preserve_frankl_transport_receipts as export


MODULE = "Conjectures.Example"


def fixture(group_name="g001"):
    source = b"fixture source; never executed as Lean\n"
    audit_source = b"fixture declaration audit; never executed as Lean\n"
    source_log = b""
    audit_log = (b"PASS: 1 project modules; 2 owned declarations; 1 owned theorems; "
                 b"1 required endpoints; all 1 private arithmetic chunks visible\n")
    kernel_log = b"replaying Conjectures.Example\n"
    objects = {".olean": b"fixture public", ".olean.private": b"fixture private",
               ".olean.server": b"fixture server"}
    group = {
        "id": group_name, "rows": 1, "direct_source_reuse": 0, "transport_checks": 1,
        "private_chunks": 1, "target_private_endpoints": ["Example.checked0"],
    }
    toolchain = {
        "lean_path": "/toolchain/bin/lean", "checker_path": "/toolchain/bin/leanchecker",
        "lean_sha256": export.LEAN_SHA256, "checker_sha256": export.CHECKER_SHA256,
        "lean_version": export.LEAN_VERSION,
    }
    expected = {
        "group": group, "modules": [MODULE], "required": ["Example.result"],
        "private": ["Example.checked0"], "source_sha256": {MODULE: export.sha(source)},
        "audit_source": audit_source,
    }
    model = {"groups": {group_name: expected}, "gate_sha256": {"gate.py": export.sha(b"gate")}}
    receipt = {
        "status": "passed",
        "git_commit": export.WORKFLOW_HEAD if group_name == "g000" else export.PUBLICATION_SHA,
        "transport_manifest_sha256": export.MANIFEST_SHA256,
        "group": copy.deepcopy(group), "project_modules": [MODULE],
        "required_endpoints": ["Example.result"], "required_private_endpoints": ["Example.checked0"],
        "target_private_endpoints": ["Example.checked0"], "target_count": 1,
        "direct_source_reuse": 0, "transport_check_count": 1,
        "integration_root_checked": False, "canonical_graph_coverage_checked": False,
        "all_frozen_hashes_unchanged": True,
        "axiom_whitelist": ["propext", "Classical.choice", "Quot.sound"],
        "toolchain": toolchain, "source_workers": 4, "kernel_threads": 4,
        "source_sha256": {MODULE: export.sha(source)},
        "artifact_sha256": {MODULE: {suffix: export.sha(raw) for suffix, raw in objects.items()}},
        "gate_sha256": copy.deepcopy(model["gate_sha256"]),
        "source_checks": {MODULE: {
            "exit_code": 0, "timed_out": False,
            "command": [toolchain["lean_path"], "-j1", "-M4500", "-DwarningAsError=true",
                        "-o", "/stage/Example.olean", "Conjectures/Example.lean"],
            "log_sha256": export.sha(source_log),
        }},
        "axiom_audit": {
            "exit_code": 0, "timed_out": False, "all_declarations_audited": True,
            "explicit_import_all": True, "project_module_count": 1,
            "required_endpoint_count": 1, "private_arithmetic_chunks_visible": 1,
            "declaration_count": 2, "theorem_count": 1,
            "command": [toolchain["lean_path"], "-j1", "-M4500",
                        "-DwarningAsError=true", "OrbitGroupAudit.lean"],
            "audit_source_sha256": export.sha(audit_source), "log_sha256": export.sha(audit_log),
        },
        "kernel_replay": {
            "exit_code": 0, "timed_out": False, "exact_project_closure": True,
            "replayed_modules": [MODULE], "log_sha256": export.sha(kernel_log),
            "command": ["/usr/bin/stdbuf", "-oL", "-eL",
                        toolchain["checker_path"], "-v", "Conjectures"],
        },
    }
    prefix = ".candidate-artifacts/frankl-transport-" + group_name + "/"
    members = {
        prefix + "src/Conjectures/Example.lean": source,
        prefix + "src/OrbitGroupAudit.lean": audit_source,
        prefix + "logs/Conjectures.Example.source.log": source_log,
        prefix + "logs/axiom-audit.log": audit_log,
        prefix + "logs/kernel-replay.log": kernel_log,
    }
    members.update({prefix + "lib/lean/Conjectures/Example" + suffix: raw
                    for suffix, raw in objects.items()})
    return receipt, model, members, prefix


def archive_fixture(change_receipt=None, change_members=None):
    receipt, model, members, prefix = fixture()
    if change_receipt:
        change_receipt(receipt)
    if change_members:
        change_members(members, prefix)
    members[prefix + "receipt.json"] = export.encoded(receipt)
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for path, raw in members.items():
            archive.writestr(path, raw)
    payload = buffer.getvalue()
    artifact = {"name": "frankl-transport-g001", "digest": "sha256:" + export.sha(payload)}
    return artifact, payload, model


class ReceiptTests(unittest.TestCase):
    def test_structurally_complete_fixture_is_accepted(self):
        artifact, payload, model = archive_fixture()
        checked = export.validate_artifact(artifact, payload, model)
        self.assertEqual(checked["group"], "g001")
        self.assertEqual(json.loads(checked["raw"])["source_sha256"],
                         model["groups"]["g001"]["source_sha256"])

    def test_archive_digest_is_required(self):
        artifact, payload, model = archive_fixture()
        artifact["digest"] = "sha256:" + "0" * 64
        with self.assertRaises(RuntimeError):
            export.validate_artifact(artifact, payload, model)

    def test_failed_receipt_is_skipped(self):
        artifact, payload, model = archive_fixture(
            change_receipt=lambda receipt: receipt.update(status="failed"))
        self.assertIsNone(export.validate_artifact(artifact, payload, model))

    def test_initial_and_published_source_checkouts_are_distinguished(self):
        receipt, model, _, _ = fixture()
        receipt["git_commit"] = export.WORKFLOW_HEAD
        with self.assertRaises(RuntimeError):
            export.validate_header(receipt, model["groups"]["g001"], "g001")
        initial, initial_model, _, _ = fixture("g000")
        export.validate_header(initial, initial_model["groups"]["g000"], "g000")
        initial["git_commit"] = export.PUBLICATION_SHA
        with self.assertRaises(RuntimeError):
            export.validate_header(initial, initial_model["groups"]["g000"], "g000")

    def test_missing_endpoint_or_private_proof_is_rejected(self):
        for key in ("required_endpoints", "required_private_endpoints", "target_private_endpoints"):
            artifact, payload, model = archive_fixture(
                change_receipt=lambda receipt, field=key: receipt.update({field: []}))
            with self.subTest(field=key), self.assertRaises(RuntimeError):
                export.validate_artifact(artifact, payload, model)

    def test_inexact_or_duplicate_kernel_replay_is_rejected(self):
        for modules in ([], [MODULE, MODULE], ["Conjectures.Other"]):
            artifact, payload, model = archive_fixture(
                change_receipt=lambda receipt, replay=modules:
                    receipt["kernel_replay"].update(replayed_modules=replay))
            with self.subTest(modules=modules), self.assertRaises(RuntimeError):
                export.validate_artifact(artifact, payload, model)

    def test_wrong_compiler_or_manifest_is_rejected(self):
        changes = (
            lambda receipt: receipt["toolchain"].update(lean_sha256="0" * 64),
            lambda receipt: receipt["toolchain"].update(checker_sha256="0" * 64),
            lambda receipt: receipt.update(transport_manifest_sha256="0" * 64),
            lambda receipt: receipt.update(gate_sha256={}),
        )
        for change in changes:
            artifact, payload, model = archive_fixture(change_receipt=change)
            with self.assertRaises(RuntimeError):
                export.validate_artifact(artifact, payload, model)

    def test_non_strict_source_command_is_rejected(self):
        artifact, payload, model = archive_fixture(
            change_receipt=lambda receipt:
                receipt["source_checks"][MODULE]["command"].remove("-DwarningAsError=true"))
        with self.assertRaises(RuntimeError):
            export.validate_artifact(artifact, payload, model)

    def test_missing_private_facet_is_rejected(self):
        artifact, payload, model = archive_fixture(
            change_receipt=lambda receipt:
                receipt["artifact_sha256"][MODULE].pop(".olean.private"))
        with self.assertRaises(RuntimeError):
            export.validate_artifact(artifact, payload, model)

    def test_tampered_source_object_audit_and_replay_are_rejected(self):
        suffixes = (
            "src/Conjectures/Example.lean",
            "lib/lean/Conjectures/Example.olean.private",
            "src/OrbitGroupAudit.lean",
            "logs/axiom-audit.log",
            "logs/kernel-replay.log",
            "logs/Conjectures.Example.source.log",
        )
        for suffix in suffixes:
            artifact, payload, model = archive_fixture(
                change_members=lambda members, prefix, tail=suffix:
                    members.update({prefix + tail: b"altered evidence"}))
            with self.subTest(member=suffix), self.assertRaises(RuntimeError):
                export.validate_artifact(artifact, payload, model)

    def test_unsafe_or_duplicate_archive_members_are_rejected(self):
        for names in (["../receipt.json"], ["/receipt.json"], ["a\\receipt.json"],
                      ["receipt.json", "receipt.json"]):
            buffer = io.BytesIO()
            with warnings.catch_warnings():
                warnings.simplefilter("ignore", UserWarning)
                with zipfile.ZipFile(buffer, "w") as archive:
                    for name in names:
                        archive.writestr(name, b"fixture")
            with self.subTest(names=names), self.assertRaises(RuntimeError):
                export.safe_archive(buffer.getvalue())

    def test_listing_reads_more_than_one_hundred_artifacts(self):
        calls = []
        def fetch(path):
            calls.append(path)
            if path.endswith("page=1"):
                return {"total_count": 103, "artifacts": [{"id": i} for i in range(1, 101)]}
            return {"total_count": 103, "artifacts": [{"id": i} for i in range(101, 104)]}
        rows = export.list_artifacts(fetch)
        self.assertEqual([row["id"] for row in rows], list(range(1, 104)))
        self.assertEqual(len(calls), 2)

    def test_listing_retries_a_concurrently_growing_snapshot(self):
        calls = []
        def fetch(path):
            calls.append(path)
            if len(calls) == 1:
                return {"total_count": 101, "artifacts": [{"id": i} for i in range(1, 101)]}
            if path.endswith("page=1"):
                return {"total_count": 102, "artifacts": [{"id": i} for i in range(1, 101)]}
            return {"total_count": 102, "artifacts": [{"id": 101}, {"id": 102}]}
        rows = export.list_artifacts(fetch)
        self.assertEqual(len(rows), 102)
        self.assertEqual(len(calls), 4)


if __name__ == "__main__":
    unittest.main()
