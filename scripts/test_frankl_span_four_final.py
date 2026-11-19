#!/usr/bin/env python3
"""Adversarial protocol tests for the final immutable-artifact consumer.

The small synthetic archives exercise rejection paths only. They are not Lean
proof evidence and cannot satisfy the published 1100-source model.
"""
from __future__ import annotations

import io
import stat
import unittest
import warnings
import zipfile

import verify_frankl_span_four_final as gate


class FinalCompositionProtocol(unittest.TestCase):
    def fixture(self, change=None, archive_change=None):
        module = "Conjectures.Fixture"
        source = b"module\n"
        toolchain = {
            "lean_path": "/p/bin/lean", "checker_path": "/p/bin/leanchecker",
            "lean_sha256": gate.evidence.LEAN_SHA256,
            "checker_sha256": gate.evidence.CHECKER_SHA256,
            "lean_version": gate.evidence.LEAN_VERSION,
        }
        def strict(target):
            return {"command": ["/p/bin/lean", "-j1", "-M4500", "-DwarningAsError=true", target],
                    "exit_code": 0, "timed_out": False, "log_sha256": gate.sha(b"")}
        audit_source = b"module\n"
        audit_log = (b"PASS: 1 project modules; 2 owned declarations; 1 owned theorems; "
                     b"1 required endpoints; all 0 private arithmetic chunks visible\n")
        kernel_log = b"replaying Conjectures.Fixture\n"
        objects = {suffix: ("fixture" + suffix).encode() for suffix in gate.ALLOWED_FACETS}
        config = {"lean/lean-toolchain": gate.sha(b"toolchain")}
        receipt = {
            "status": "passed", "all_frozen_hashes_unchanged": True,
            "git_commit": "1" * 40, "project_modules": [module],
            "source_sha256": {module: gate.sha(source)},
            "artifact_sha256": {module: {s: gate.sha(raw) for s, raw in objects.items()}},
            "gate_sha256": config, "required_endpoints": ["Fixture.endpoint"],
            "required_private_endpoints": [], "axiom_whitelist": gate.ALLOWED,
            "toolchain": toolchain, "source_checks": {module: strict("Conjectures/Fixture.lean")},
            "axiom_audit": {
                **strict("OrbitGroupAudit.lean"), "audit_source_sha256": gate.sha(audit_source),
                "log_sha256": gate.sha(audit_log), "all_declarations_audited": True,
                "explicit_import_all": True, "project_module_count": 1,
                "required_endpoint_count": 1, "private_arithmetic_chunks_visible": 0,
                "declaration_count": 2, "theorem_count": 1,
            },
            "kernel_replay": {
                "command": ["/p/bin/leanchecker", "-v", "Conjectures"],
                "exit_code": 0, "timed_out": False, "exact_project_closure": True,
                "log_sha256": gate.sha(kernel_log), "replayed_modules": [module],
            },
        }
        profile = {
            "kind": "orbit", "root": module,
            "source_sha256": {module: gate.sha(source)},
            "required_endpoints": ["Fixture.endpoint"], "required_private_endpoints": [],
            "excluded_modules": [], "compressed_limit": 1024 * 1024, "expanded_limit": 4 * 1024 * 1024,
        }
        if change:
            change(receipt)
        raw = gate.encoded(receipt)
        members = {
            "receipt.json": raw, "src/Conjectures/Fixture.lean": source,
            "src/OrbitGroupAudit.lean": audit_source,
            "logs/Conjectures.Fixture.source.log": b"", "logs/axiom-audit.log": audit_log,
            "logs/kernel-replay.log": kernel_log,
            **{"lib/lean/Conjectures/Fixture" + suffix: data for suffix, data in objects.items()},
        }
        if archive_change:
            archive_change(members)
        buffer = io.BytesIO()
        with zipfile.ZipFile(buffer, "w", zipfile.ZIP_DEFLATED) as archive:
            for name, data in members.items():
                archive.writestr(name, data)
        payload = buffer.getvalue()
        binding = {
            "run_id": 11, "head_sha": "1" * 40, "artifact_id": 22,
            "artifact_name": "fixture", "archive_sha256": gate.sha(payload),
            "receipt_sha256": gate.sha(raw),
        }
        profile["binding"] = binding
        artifact = {
            "id": 22, "name": "fixture", "workflow_run": {"id": 11, "head_sha": "1" * 40},
            "expired": False, "archive_download_url": gate.evidence.API + "/actions/artifacts/22/zip",
            "digest": "sha256:" + binding["archive_sha256"],
        }
        model = {"configuration_sha256": config}
        return artifact, payload, profile, model

    def check_fixture(self, change=None, archive_change=None):
        result = gate.validate_provider(*self.fixture(change, archive_change))
        result[0].close()

    def test_complete_synthetic_protocol(self):
        self.check_fixture()

    def test_reject_receipt_without_pass(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r.update(status="running"))

    def test_reject_source_checkout_drift(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r.update(git_commit="2" * 40))

    def test_reject_source_byte_drift(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(archive_change=lambda m: m.update({"src/Conjectures/Fixture.lean": b"changed"}))

    def test_reject_private_object_byte_drift(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(archive_change=lambda m: m.update(
                {"lib/lean/Conjectures/Fixture.olean.private": b"changed"}))

    def test_reject_missing_private_facet(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["artifact_sha256"]["Conjectures.Fixture"].pop(".olean.private"))

    def test_reject_unknown_facet(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["artifact_sha256"]["Conjectures.Fixture"].update(
                {".unknown": gate.sha(b"x")}))

    def test_reject_theorem_only_audit(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["axiom_audit"].update(all_declarations_audited=False))

    def test_reject_missing_private_audit_count(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["axiom_audit"].update(private_arithmetic_chunks_visible=1))

    def test_reject_strict_source_warning_policy_change(self):
        def change(r):
            r["source_checks"]["Conjectures.Fixture"]["command"].remove("-DwarningAsError=true")
        with self.assertRaises(RuntimeError):
            self.check_fixture(change)

    def test_reject_source_timeout_even_with_zero_exit(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["source_checks"]["Conjectures.Fixture"].update(timed_out=True))

    def test_reject_audit_log_drift(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(archive_change=lambda m: m.update({"logs/axiom-audit.log": b"changed"}))

    def test_reject_missing_kernel_target(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["kernel_replay"].update(replayed_modules=[]))

    def test_reject_nonstock_checker(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["toolchain"].update(checker_sha256="0" * 64))

    def test_reject_other_kernel_command(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(lambda r: r["kernel_replay"].update(command=["another-checker"]))

    def test_reject_duplicate_matching_receipt(self):
        with self.assertRaises(RuntimeError):
            self.check_fixture(archive_change=lambda m: m.update({"duplicate/receipt.json": m["receipt.json"]}))

    def test_reject_artifact_from_another_run(self):
        artifact, payload, profile, model = self.fixture()
        artifact["workflow_run"]["id"] += 1
        with self.assertRaises(RuntimeError):
            gate.validate_provider(artifact, payload, profile, model)

    def test_reject_unbound_archive_bytes(self):
        artifact, payload, profile, model = self.fixture()
        with self.assertRaises(RuntimeError):
            gate.validate_provider(artifact, payload + b"x", profile, model)

    def test_reject_expired_artifact(self):
        artifact, payload, profile, model = self.fixture()
        artifact["expired"] = True
        with self.assertRaises(RuntimeError):
            gate.validate_provider(artifact, payload, profile, model)

    def test_pending_binding_never_calls_api(self):
        def fail(_):
            self.fail("Unbound dependency must not call the API")
        self.assertFalse(gate.readiness({"providers": {"pending": {"binding": None}}}, fail)["ready"])

    def test_running_run_is_not_pass(self):
        _, _, profile, _ = self.fixture()
        run = {"id": 11, "head_sha": "1" * 40, "head_branch": "main",
               "head_repository": {"full_name": gate.evidence.REPO},
               "status": "in_progress", "conclusion": None}
        self.assertFalse(gate.validate_run(run, profile["binding"]))
        run.update(status="completed", conclusion="failure")
        with self.assertRaises(RuntimeError):
            gate.validate_run(run, profile["binding"])

    def test_overlap_requires_every_facet_and_source_to_match(self):
        facets = {suffix: "1" * 64 for suffix in gate.ALLOWED_FACETS}
        values = {}
        self.assertTrue(gate.common.merge_identity(values, "Conjectures.Fixture", "2" * 64, facets, "one"))
        self.assertFalse(gate.common.merge_identity(values, "Conjectures.Fixture", "2" * 64, facets, "two"))
        changed = {**facets, ".olean.private": "3" * 64}
        with self.assertRaises(RuntimeError):
            gate.common.merge_identity(values, "Conjectures.Fixture", "2" * 64, changed, "three")
        with self.assertRaises(RuntimeError):
            gate.common.merge_identity(values, "Conjectures.Fixture", "4" * 64, facets, "four")

    def test_singleton_replay_rejects_descendant_module(self):
        with self.assertRaises(RuntimeError):
            gate.common.exact_selector(["Conjectures.Fixture", "Conjectures.Fixture.Child"],
                                       "Conjectures.Fixture")

    def test_archive_path_guards(self):
        for path in ("", ".", "../x", "/x", "a/../x", "a//b", "a/./b", "a\\b"):
            with self.subTest(path=path), self.assertRaises(RuntimeError):
                gate.safe_relative(path)
        gate.safe_relative("safe/receipt.json")

    def test_archive_rejects_duplicate_members(self):
        buffer = io.BytesIO()
        with warnings.catch_warnings():
            warnings.simplefilter("ignore", UserWarning)
            with zipfile.ZipFile(buffer, "w") as archive:
                archive.writestr("same", b"a")
                archive.writestr("same", b"b")
        with self.assertRaises(RuntimeError):
            gate.archive_of(buffer.getvalue(), {"compressed_limit": 10000, "expanded_limit": 10000})

    def test_archive_rejects_symlink(self):
        buffer = io.BytesIO()
        item = zipfile.ZipInfo("link")
        item.create_system = 3
        item.external_attr = (stat.S_IFLNK | 0o777) << 16
        with zipfile.ZipFile(buffer, "w") as archive:
            archive.writestr(item, b"target")
        with self.assertRaises(RuntimeError):
            gate.archive_of(buffer.getvalue(), {"compressed_limit": 10000, "expanded_limit": 10000})

    def test_archive_expansion_bound(self):
        buffer = io.BytesIO()
        with zipfile.ZipFile(buffer, "w", zipfile.ZIP_DEFLATED) as archive:
            archive.writestr("large", b"x" * 10000)
        with self.assertRaises(RuntimeError):
            gate.archive_of(buffer.getvalue(), {"compressed_limit": 10000, "expanded_limit": 9999})

    def test_missing_or_extra_module_fails_exact_inventory(self):
        for values in ([], ["Conjectures.Fixture", "Conjectures.Other"],
                       ["Conjectures.Fixture", "Conjectures.Fixture"]):
            with self.subTest(values=values), self.assertRaises(RuntimeError):
                gate.checked_set(values, ["Conjectures.Fixture"], "Test inventory")



    def raw_audit_fixture(self):
        import test_audit_lean_raw_occurrences as fixtures
        data = fixtures.fixture()
        modules = data["modules"]
        fresh = [fixtures.A]
        model = {"source_sha256": {module: "1" * 64 for module in modules},
                 "required_by_module": {fixtures.A: [fixtures.TARGET]}}
        return model, modules, fresh, data, lambda: fixtures.encode(data, True)

    def test_full_audit_keeps_dependency_without_named_endpoint(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        required = gate.full_audit_requirements(model, modules, fresh)
        self.assertEqual(required[modules[1]], [])
        result = gate.validate_full_audit(render(), model, modules, fresh)
        self.assertEqual(result["summary"]["owned_modules"], 2)
        self.assertEqual(result["summary"]["private_declarations"], 1)
        self.assertEqual(result["serialized_occurrence_count"], 3)

    def test_full_audit_rejects_omitted_dependency_owned_coverage(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        data["base"] = [row for row in data["base"]
                        if not (row["tag"] == "module" and row["module"] == modules[1])]
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_missing_serialized_private_declaration(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        data["base"] = [row for row in data["base"]
                        if not (row["tag"] == "declaration"
                                and row["private_user_name"] is not None)]
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_dependency_without_import_all(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["base"]
             if row["tag"] == "module" and row["module"] == modules[1])["import_all"] = False
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_unapproved_direct_axiom(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["base"] if row["tag"] == "declaration")["kind"] = "axiom"
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_unapproved_collected_axiom(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["base"]
             if row["tag"] == "declaration")["axioms"] = ["Extra.axiom"]
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_preserves_distinct_checked_shared_bodies(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        result = gate.validate_full_audit(render(), model, modules, fresh)
        graph = result["raw_occurrence_graph"]
        self.assertEqual(result["duplicate_serialized_occurrence_count"], 1)
        self.assertEqual(graph["summary"]["kernel_checks"], 4)
        self.assertEqual(graph["summary"]["selected_kernel_checks"], 2)
        self.assertTrue(graph["all_mixed_family_selected_theorems_kernel_checked"])
        self.assertEqual(result["owned_modules"][modules[1]]["names"], ["RawFixture.target"])

    def test_full_audit_rejects_unchecked_distinct_raw_body(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["rows"] if row["tag"] == "node")["variants"][0]["kernel_passed"] = False
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_unchecked_selected_mixed_body(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["rows"]
             if row["tag"] == "node")["selected_kernel_check"] = None
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_missing_serialized_occurrence(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        data["rows"].remove(next(row for row in data["rows"] if row["tag"] == "occurrence"))
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_repeated_serialized_occurrence(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        data["rows"].append(next(row for row in data["rows"] if row["tag"] == "occurrence").copy())
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_dropped_foreign_raw_variant(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        foreign = next(row for row in data["rows"]
                       if row["tag"] == "node" and row["name"] == "Foreign.helper")
        foreign.update(expected_variants=[], variants=[], selected_kernel_check=None)
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_modern_partial_root(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["rows"] if row["tag"] == "passed")["audit_root_modern"] = True
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_missing_foreign_private_data(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["rows"] if row["tag"] == "scanned_module"
             and row["module"] == "Mathlib.RawFixtureForeign")["import_all"] = False
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_rejects_open_dependency_graph(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        next(row for row in data["rows"] if row["tag"] == "node")["dependencies"] = [999]
        with self.assertRaises(ValueError):
            gate.validate_full_audit(render(), model, modules, fresh)

    def test_full_audit_requires_exact_scope_for_empty_requirement_lists(self):
        model, modules, fresh, data, render = self.raw_audit_fixture()
        with self.assertRaises(RuntimeError):
            gate.full_audit_requirements(model, modules[:-1], fresh)

    def test_full_audit_uses_complete_private_root_and_checked_kernel(self):
        model, modules, fresh, _, _ = self.raw_audit_fixture()
        source = gate.full_audit_source(model, modules, fresh)
        self.assertFalse(source.lstrip().startswith("module\n"))
        self.assertIn("Complete raw occurrence audit requires a legacy root", source)
        self.assertIn("unless data.isModule do", source)
        self.assertIn("unless imported.hasData && imported.importAll do", source)
        self.assertIn("unless data.constNames == data.constants.map", source)
        self.assertIn("RawOccurrenceSelectedKernelCheck", source)
        self.assertIn("RawOccurrenceKernelCheck", source)
        self.assertIn("kernel.header.trustLevel == 0", source)
        self.assertIn("kernel.addDeclCore", source)
        self.assertNotIn("Serialized declaration has another owner:", source)

if __name__ == "__main__":
    unittest.main()

