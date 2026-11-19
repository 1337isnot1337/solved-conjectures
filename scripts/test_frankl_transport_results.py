#!/usr/bin/env python3
"""Regression tests for composed evidence; synthetic fixtures are not Lean proofs."""

from __future__ import annotations

import copy
import io
from pathlib import Path
import re
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch
import warnings
import zipfile

import preserve_frankl_transport_receipts as evidence
import test_frankl_transport_receipts as fixtures
import verify_frankl_transport_results as results


def zip_bytes(members):
    output = io.BytesIO()
    with zipfile.ZipFile(output, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for name, raw in members.items():
            archive.writestr(name, raw)
    return output.getvalue()


def coverage_fixture(change=None, change_members=None):
    receipt, model, members, prefix = fixtures.fixture()
    expected = copy.deepcopy(model["groups"]["g001"])
    expected["private"] = []
    expected["group"]["id"] = "complete-row-coverage"
    expected["group"]["private_chunks"] = 0
    expected["gate_sha256"] = model["gate_sha256"]
    receipt.update({
        "git_commit": results.COVERAGE_HEAD, "group": copy.deepcopy(expected["group"]),
        "required_private_endpoints": [],
        "coverage_manifest_sha256": evidence.MANIFEST_SHA256,
        "row_coverage_checked": True, "all_owned_private_declarations_audited": True,
        "numeric_proof_modules_imported": False, "numeric_weight_validity_checked": False,
        "numeric_integration_checked": False, "canonical_graph_coverage_checked": False,
        "period_chunks": {"7": 1}, "owned_private_declarations": [],
    })
    audit = (b"PASS: 1 project modules; 2 owned declarations; 1 owned theorems; "
             b"1 required endpoints; all 0 private arithmetic chunks visible\n")
    members[prefix + "logs/axiom-audit.log"] = audit
    receipt["axiom_audit"]["log_sha256"] = evidence.sha(audit)
    receipt["axiom_audit"]["private_arithmetic_chunks_visible"] = 0
    if change:
        change(receipt)
    if change_members:
        change_members(members, prefix)
    raw = evidence.encoded(receipt) + b"\n"
    members[prefix + "receipt.json"] = raw
    payload = zip_bytes(members)
    artifact = {
        "id": results.COVERAGE_ARTIFACT, "name": "frankl-transport-row-coverage",
        "workflow_run": {"id": results.COVERAGE_RUN, "head_sha": results.COVERAGE_HEAD},
        "expired": False, "digest": "sha256:" + evidence.sha(payload),
    }
    return artifact, payload, expected, raw


def validate_fixture(change=None, change_members=None):
    artifact, payload, expected, raw = coverage_fixture(change, change_members)
    with patch.object(results, "COVERAGE_DIGEST", evidence.sha(payload)):
        checked = results.validate_coverage(
            artifact, payload, expected, SimpleNamespace(PERIOD_CHUNKS={"7": 1}))
    return artifact, payload, checked, raw


def run_fixture(status="in_progress", conclusion=None):
    transport = {
        "id": evidence.SOURCE_RUN_ID, "head_sha": evidence.WORKFLOW_HEAD,
        "name": evidence.SOURCE_WORKFLOW, "head_branch": "main",
        "head_repository": {"full_name": evidence.REPO}, "status": status, "conclusion": conclusion,
    }
    coverage = {
        "id": results.COVERAGE_RUN, "head_sha": results.COVERAGE_HEAD, "head_branch": "main",
        "head_repository": {"full_name": evidence.REPO},
        "status": "completed", "conclusion": "success",
    }
    return transport, coverage


class CompositionTests(unittest.TestCase):
    def test_exact_stock_selector_uses_name_components(self):
        root = results.RESULTS_ROOT
        self.assertEqual(results.exact_selector([root + "Data", root, "Conjectures.Other"], root), [root])
        for modules in ([root + ".Child", root], [root, root], [root + "Data"]):
            with self.subTest(modules=modules), self.assertRaises(RuntimeError):
                results.exact_selector(modules, root)

    def test_identical_overlap_records_both_providers(self):
        identities = {}
        facets = {key: key + "-hash" for key in evidence.REQUIRED_FACETS}
        self.assertTrue(results.merge_identity(identities, "Conjectures.Example", "source", facets, "a"))
        self.assertFalse(results.merge_identity(identities, "Conjectures.Example", "source", facets, "b"))
        self.assertEqual(identities["Conjectures.Example"]["providers"], ["a", "b"])

    def test_changed_source_or_any_facet_rejected_on_overlap(self):
        facets = {key: key + "-hash" for key in evidence.REQUIRED_FACETS}
        for field in ("source", ".olean", ".olean.private", ".olean.server", ".ir"):
            identities = {}
            results.merge_identity(identities, "M", "source", facets, "a")
            changed = dict(facets)
            source = "source"
            if field == "source":
                source += "-changed"
            else:
                changed[field] = "changed"
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                results.merge_identity(identities, "M", source, changed, "b")

    def test_missing_or_unknown_object_facet_is_rejected(self):
        facets = {key: key + "-hash" for key in evidence.REQUIRED_FACETS}
        for field in evidence.REQUIRED_FACETS:
            changed = dict(facets)
            del changed[field]
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                results.merge_identity({}, "M", "source", changed, "a")
        with self.assertRaises(RuntimeError):
            results.merge_identity({}, "M", "source", {**facets, ".unknown": "hash"}, "a")

    def test_pending_run_is_waiting_and_failed_complete_run_is_rejected(self):
        for status, conclusion, expected in (
                ("in_progress", None, False), ("completed", "success", True)):
            transport, coverage = run_fixture(status, conclusion)
            ready, _ = results.check_run_identities(
                lambda path: transport if str(evidence.SOURCE_RUN_ID) in path else coverage)
            self.assertEqual(ready, expected)
        transport, coverage = run_fixture("completed", "failure")
        with self.assertRaises(RuntimeError):
            results.check_run_identities(
                lambda path: transport if str(evidence.SOURCE_RUN_ID) in path else coverage)

    def test_wrong_run_head_and_failed_coverage_are_rejected(self):
        for which, field, value in (("transport", "head_sha", "other"),
                                     ("coverage", "head_sha", "other"),
                                     ("coverage", "conclusion", "failure")):
            transport, coverage = run_fixture("completed", "success")
            (transport if which == "transport" else coverage)[field] = value
            with self.subTest(which=which, field=field), self.assertRaises(RuntimeError):
                results.check_run_identities(
                    lambda path: transport if str(evidence.SOURCE_RUN_ID) in path else coverage)

    def test_compiler_checker_and_strict_commands_are_required(self):
        receipt, _, _, _ = fixtures.fixture()
        results.validate_toolchain(receipt["toolchain"])
        check = receipt["source_checks"][fixtures.MODULE]
        results.strict_profile(check, receipt["toolchain"], "Conjectures/Example.lean")
        for field in ("lean_sha256", "checker_sha256", "lean_version"):
            altered = dict(receipt["toolchain"])
            altered[field] = "other"
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                results.validate_toolchain(altered)
        for field in ("exit_code", "timed_out", "command"):
            altered = copy.deepcopy(check)
            altered[field] = (1 if field == "exit_code" else True if field == "timed_out"
                              else [x for x in altered[field] if x != "-DwarningAsError=true"])
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                results.strict_profile(altered, receipt["toolchain"], "Conjectures/Example.lean")

    def test_safe_archive_and_unique_receipt_bounds(self):
        payload = zip_bytes({"safe/receipt.json": b"{}", "safe/source": b"source"})
        _, names = results.safe_archive(payload)
        self.assertEqual(results.receipt_member(names), ("safe/receipt.json", "safe/"))
        for name in ("../escape", "/absolute", "a\\b", "./ambiguous"):
            with self.subTest(name=name), self.assertRaises(RuntimeError):
                results.safe_archive(zip_bytes({name: b"x"}))
        with self.assertRaises(RuntimeError):
            results.safe_archive(payload, limit=1)
        for names in ([], ["a/receipt.json", "b/receipt.json"]):
            with self.assertRaises(RuntimeError):
                results.receipt_member(names)

    def test_duplicate_archive_members_and_symlinks_rejected(self):
        output = io.BytesIO()
        with warnings.catch_warnings():
            warnings.simplefilter("ignore", UserWarning)
            with zipfile.ZipFile(output, "w") as archive:
                archive.writestr("duplicate", b"first")
                archive.writestr("duplicate", b"second")
        with self.assertRaises(RuntimeError):
            results.safe_archive(output.getvalue())
        output = io.BytesIO()
        with zipfile.ZipFile(output, "w") as archive:
            info = zipfile.ZipInfo("link")
            info.create_system = 3
            info.external_attr = 0o120777 << 16
            archive.writestr(info, "target")
        with self.assertRaises(RuntimeError):
            results.safe_archive(output.getvalue())

    def test_coverage_fixture_preserves_exact_receipt_bytes(self):
        _, _, checked, raw = validate_fixture()
        self.assertEqual(checked["raw"], raw)
        self.assertNotEqual(checked["raw"], evidence.encoded(checked["receipt"]))

    def test_missing_coverage_scope_endpoint_or_replay_is_rejected(self):
        changes = [
            lambda r: r.update(row_coverage_checked=False),
            lambda r: r.update(numeric_integration_checked=True),
            lambda r: r.update(required_endpoints=[]),
            lambda r: r["kernel_replay"].update(replayed_modules=[]),
            lambda r: r["kernel_replay"].update(replayed_modules=[fixtures.MODULE] * 2),
            lambda r: r.update(owned_private_declarations=[{"name": "missing"}]),
            lambda r: r["axiom_audit"].update(all_declarations_audited=False),
        ]
        for change in changes:
            with self.subTest(change=change), self.assertRaises(RuntimeError):
                validate_fixture(change)

    def test_coverage_source_object_and_log_corruption_is_rejected(self):
        names = (
            "src/Conjectures/Example.lean", "src/OrbitGroupAudit.lean",
            "lib/lean/Conjectures/Example.olean", "lib/lean/Conjectures/Example.olean.private",
            "lib/lean/Conjectures/Example.olean.server",
            "logs/Conjectures.Example.source.log", "logs/axiom-audit.log", "logs/kernel-replay.log",
        )
        for name in names:
            def mutate(members, prefix, relative=name):
                members[prefix + relative] += b"changed"
            with self.subTest(name=name), self.assertRaises(RuntimeError):
                validate_fixture(change_members=mutate)

    def test_staging_materializes_all_facets_and_original_receipt(self):
        artifact, payload, checked, raw = validate_fixture()
        with tempfile.TemporaryDirectory() as directory:
            stage = Path(directory)
            identities = {}
            reference = results.stage_checked(stage, artifact, payload, checked,
                                              identities, {fixtures.MODULE})
            self.assertEqual((stage / reference["receipt"]).read_bytes(), raw)
            self.assertEqual(reference["receipt_sha256"], evidence.sha(raw))
            for suffix, digest in checked["receipt"]["artifact_sha256"][fixtures.MODULE].items():
                path = stage / "lib/lean" / (fixtures.MODULE.replace(".", "/") + suffix)
                self.assertEqual(evidence.sha(path.read_bytes()), digest)
            self.assertEqual(set(identities), {fixtures.MODULE})
            results.assert_frozen(stage, reference["preserved_files_sha256"])
            self.assertEqual(len(reference["preserved_files_sha256"]), 5)

    def test_staging_unrelated_module_is_rejected(self):
        artifact, payload, checked, _ = validate_fixture()
        with tempfile.TemporaryDirectory() as directory, self.assertRaises(RuntimeError):
            results.stage_checked(Path(directory), artifact, payload, checked, {}, set())

    def test_audit_requires_every_endpoint_and_only_claims_results_ownership(self):
        modules = ["Conjectures.Dependency", results.RESULTS_ROOT]
        source = results.import_audit(modules)
        for module in modules:
            self.assertIn("import all " + module + "\n", source)
        self.assertEqual(len(results.RESULTS_REQUIRED), 16)
        self.assertEqual(len(set(results.RESULTS_REQUIRED)), 16)
        quoted = re.findall(chr(96) + r"([A-Za-z0-9_.]+)", source)
        for endpoint in results.RESULTS_REQUIRED:
            self.assertEqual(quoted.count(endpoint), 1)
        self.assertIn('m.module.toString == ownedModule', source)
        self.assertIn("for axiomName in ← collectAxioms name", source)
        self.assertIn("info.isTheorem", source)
        self.assertIn("RESULTS-PRIVATE", source)
        self.assertNotIn("@BT@", source)

    def test_frozen_evidence_detects_mutation_and_preserves_original_bytes(self):
        with tempfile.TemporaryDirectory() as directory:
            stage, frozen = Path(directory), {}
            raw = b'{"receipt": "synthetic"}\n\n'
            results.freeze_bytes(stage, "receipts/original.json", raw, frozen)
            self.assertEqual(frozen["receipts/original.json"], evidence.sha(raw))
            results.assert_frozen(stage, frozen)
            results.freeze_bytes(stage, "receipts/original.json", raw, frozen)
            with self.assertRaises(RuntimeError):
                results.freeze_bytes(stage, "receipts/original.json", raw + b"changed", frozen)
            (stage / "receipts/original.json").write_bytes(raw + b"mutated")
            with self.assertRaises(RuntimeError):
                results.assert_frozen(stage, frozen)
            with self.assertRaises(RuntimeError):
                results.freeze_bytes(stage, "../escape", b"x", frozen)

    def test_artifact_metadata_ties_maps_to_the_frozen_run(self):
        artifact = {
            "id": 12, "workflow_run": {"id": evidence.SOURCE_RUN_ID,
                                     "head_sha": evidence.WORKFLOW_HEAD},
            "archive_download_url": evidence.API + "/actions/artifacts/12/zip",
        }
        results.validate_group_metadata(artifact)
        for field in ("id", "head_sha"):
            altered = copy.deepcopy(artifact)
            altered["workflow_run"][field] = "other"
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                results.validate_group_metadata(altered)


if __name__ == "__main__":
    unittest.main()
