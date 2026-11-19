#!/usr/bin/env python3
"""Independent protocol fixtures for the raw-occurrence graph auditor.

These tests exercise the log validator and renderer.  They do not replace the
Lean extraction check, authenticated object inventories, or the real checked
kernel negative control.  In particular a self-consistent fabricated foreign
raw census cannot be disproved using a log that omits the foreign bodies.
"""
from __future__ import annotations

import copy
import json
import unittest

import audit_lean_owned_extension as base
import audit_lean_raw_occurrences as audit


A = "Conjectures.RawFixtureA"
B = "Conjectures.RawFixtureB"
FOREIGN = "Mathlib.RawFixtureForeign"
SELECTED = "Mathlib.RawFixtureSelected"
CORE = "Init.RawFixtureAxioms"
TARGET = "RawFixture.target"
PRIVATE = "_private.Conjectures.RawFixtureA.0.RawFixture.local"
HELPER = "Foreign.helper"
UNUSED = "Foreign.unused"


def fixture(flavor="extension"):
    modern = {A: flavor == "extension", B: flavor == "extension"}
    base_rows = [
        {"tag": "import", "module": A, "owned": True},
        {"tag": "import", "module": B, "owned": True},
        {"tag": "module", "module": A, "modern": modern[A], "import_all": True,
         "has_data": True, "names": [TARGET, PRIVATE], "private_count": 1},
        {"tag": "module", "module": B, "modern": modern[B], "import_all": True,
         "has_data": True, "names": [TARGET], "private_count": 0},
        {"tag": "declaration", "name": TARGET, "owner": A, "kind": "theorem",
         "private_user_name": None, "by_module": True, "by_serialized": True,
         "axioms": ["propext", "Quot.sound"]},
        {"tag": "declaration", "name": PRIVATE, "owner": A, "kind": "definition",
         "private_user_name": "RawFixture.local", "by_module": True,
         "by_serialized": True, "axioms": ["propext"]},
        {"tag": "required", "name": TARGET, "owner": A},
        {"tag": "passed", "imported_modules": 2, "owned_modules": 2,
         "declarations": 2, "theorems": 1, "private_declarations": 1,
         "raw_declarations": 2, "required_theorems": 1,
         "allowed_axioms": list(audit.ALLOWED)},
    ]
    rows = [{"tag": "kernel_negative_control", "rejected": True, "trust_level": 0}]
    for module, count in ((A, 2), (B, 1), (FOREIGN, 2), (SELECTED, 1), (CORE, 2)):
        rows.append({"tag": "scanned_module", "module": module,
                     "modern": modern.get(module, True), "has_data": True,
                     "import_all": True, "raw_count": count})
    rows += [
        {"tag": "variant_index", "id": 0, "module": A, "ordinal": 0,
         "name": TARGET, "header_equal": True, "kind": "theorem"},
        {"tag": "variant_index", "id": 1, "module": FOREIGN, "ordinal": 0,
         "name": HELPER, "header_equal": True, "kind": "theorem"},
        {"tag": "variant_index", "id": 2, "module": FOREIGN, "ordinal": 1,
         "name": UNUSED, "header_equal": True, "kind": "theorem"},
        {"tag": "occurrence", "module": A, "ordinal": 0, "name": TARGET,
         "owner": A, "kind": "theorem", "private_user_name": None,
         "constant_info_equal": False, "header_equal": True, "variant": 0},
        {"tag": "occurrence", "module": A, "ordinal": 1, "name": PRIVATE,
         "owner": A, "kind": "definition", "private_user_name": "RawFixture.local",
         "constant_info_equal": True, "header_equal": True, "variant": None},
        {"tag": "occurrence", "module": B, "ordinal": 0, "name": TARGET,
         "owner": A, "kind": "theorem", "private_user_name": None,
         "constant_info_equal": True, "header_equal": True, "variant": None},
        {"tag": "roots", "names": [TARGET, PRIVATE]},
    ]

    def checked_variant(index, module, ordinal, dependencies):
        return {"id": index, "module": module, "ordinal": ordinal,
                "dependencies": dependencies, "dependency_count": len(dependencies),
                "kernel_alias": "RawOccurrenceKernelCheck." + str(index),
                "kernel_passed": True, "alias_exact": True,
                "original_environment_unchanged": True, "trust_level": 0}

    def node(index, name, kind, owner, module, ordinal, dependencies, variants):
        selected_check = None if not variants else {
            "module": module, "ordinal": ordinal,
            "kernel_alias": "RawOccurrenceSelectedKernelCheck." + str(index),
            "kernel_passed": True, "alias_exact": True,
            "original_environment_unchanged": True, "trust_level": 0}
        return {"tag": "node", "id": index, "name": name, "kind": kind, "owner": owner,
                "checked_raw_module": module, "checked_raw_ordinal": ordinal,
                "dependencies": dependencies, "dependency_count": len(dependencies),
                "expected_variants": [variant["id"] for variant in variants],
                "variants": variants, "selected_kernel_check": selected_check}

    rows += [
        node(0, TARGET, "theorem", A, B, 0, [0, 2],
             [checked_variant(0, A, 0, [0, 1])]),
        node(1, PRIVATE, "definition", A, A, 1, [3], []),
        node(2, HELPER, "theorem", FOREIGN, SELECTED, 0, [2, 3],
             [checked_variant(1, FOREIGN, 0, [2, 4])]),
        node(3, "propext", "axiom", CORE, CORE, 0, [], []),
        node(4, "Quot.sound", "axiom", CORE, CORE, 1, [], []),
        {"tag": "passed", "scanned_modules": 5, "serialized_constants": 8,
         "indexed_variants": 3, "owned_occurrences": 3, "roots": 2, "nodes": 5,
         "edges": 9, "kernel_checks": 4, "selected_kernel_checks": 2, "pending": 0,
         "strict_project_private_ownership": flavor == "extension",
         "axioms": ["propext", "Quot.sound"], "trust_level": 0,
         "audit_root_modern": False},
    ]
    return {"modules": [A, B], "modern": modern, "base": base_rows,
            "rows": rows, "flavor": flavor}


def row(data, tag, position=0):
    return [item for item in data["rows"] if item["tag"] == tag][position]


def encode(data, include_base=False):
    lines = []
    if include_base:
        lines.extend(base.MARKER + json.dumps(item) for item in data["base"])
    lines.extend(audit.MARKER + json.dumps(item) for item in data["rows"])
    return "\n".join(lines)


def validate(data):
    return audit.validate_graph(encode(data), data["modules"], data["modern"],
        data["base"], flavor=data["flavor"],
        legacy_prefixes=("RawFixture.",) if data["flavor"] == "all_owned" else ())


class RawOccurrenceProtocol(unittest.TestCase):
    def rejects(self, mutate, *, flavor="extension"):
        data = fixture(flavor)
        mutate(data)
        with self.assertRaises((ValueError, KeyError, TypeError, IndexError)):
            validate(data)

    def test_valid_owned_and_foreign_variants(self):
        result = validate(fixture())
        self.assertEqual(result["summary"]["owned_occurrences"], 3)
        self.assertEqual(result["summary"]["kernel_checks"], 4)
        self.assertEqual(result["summary"]["selected_kernel_checks"], 2)
        self.assertTrue(result["all_reachable_raw_variants_audited"])
        self.assertTrue(result["all_mixed_family_selected_theorems_kernel_checked"])

    def test_unreachable_foreign_variant_needs_no_kernel_check(self):
        result = validate(fixture())
        self.assertEqual(result["variant_index"][2]["name"], UNUSED)
        self.assertNotIn(UNUSED, [node["name"] for node in result["nodes"].values()])

    def test_legacy_graph_preserves_legacy_scope(self):
        result = validate(fixture("all_owned"))
        self.assertFalse(result["summary"]["strict_project_private_ownership"])

    def test_extension_wrapper_retains_duplicate_occurrences(self):
        data = fixture()
        result = audit.validate_extension_log(encode(data, True), [A, B], [A, B], {A: [TARGET], B: []})
        self.assertEqual(result["serialized_occurrence_count"], 3)
        self.assertEqual(result["duplicate_serialized_occurrence_count"], 1)
        self.assertEqual(result["owned_modules"][B]["names"], [TARGET])

    def test_missing_owned_occurrence(self):
        self.rejects(lambda d: d["rows"].remove(row(d, "occurrence", 0)))

    def test_duplicate_owned_occurrence(self):
        self.rejects(lambda d: d["rows"].append(copy.deepcopy(row(d, "occurrence", 0))))

    def test_reassigned_owned_occurrence(self):
        self.rejects(lambda d: row(d, "occurrence", 0).update(name=PRIVATE))

    def test_owned_header_mismatch(self):
        self.rejects(lambda d: row(d, "occurrence", 0).update(header_equal=False))

    def test_owned_kind_mismatch(self):
        self.rejects(lambda d: row(d, "occurrence", 0).update(kind="definition"))

    def test_owned_owner_mismatch(self):
        self.rejects(lambda d: row(d, "occurrence", 0).update(owner=B))

    def test_private_owner_mismatch(self):
        def mutate(data):
            row(data, "occurrence", 1)["owner"] = B
            next(r for r in data["base"] if r.get("name") == PRIVATE)["owner"] = B
        self.rejects(mutate)

    def test_missing_selected_owned_copy(self):
        self.rejects(lambda d: row(d, "occurrence", 2).update(constant_info_equal=False, variant=0))

    def test_identical_copy_may_not_claim_variant(self):
        self.rejects(lambda d: row(d, "occurrence", 2).update(variant=0))

    def test_owned_variant_maps_to_wrong_body(self):
        self.rejects(lambda d: row(d, "occurrence", 0).update(variant=1))

    def test_dropped_owned_variant(self):
        self.rejects(lambda d: row(d, "node", 0).update(expected_variants=[], variants=[]))

    def test_dropped_foreign_variant(self):
        self.rejects(lambda d: row(d, "node", 2).update(expected_variants=[], variants=[]))

    def test_extra_owned_variant_without_occurrence_backlink(self):
        def mutate(data):
            extra = dict(row(data, "variant_index", 0), id=3, module=B, ordinal=0)
            data["rows"].insert(1, extra)
            row(data, "passed")["indexed_variants"] = 4
        self.rejects(mutate)

    def test_variant_index_ordinal_outside_module(self):
        self.rejects(lambda d: row(d, "variant_index", 1).update(ordinal=2))

    def test_variant_index_wrong_header(self):
        self.rejects(lambda d: row(d, "variant_index", 1).update(header_equal=False))

    def test_variant_index_non_theorem(self):
        self.rejects(lambda d: row(d, "variant_index", 1).update(kind="opaque"))

    def test_variant_index_duplicate_location(self):
        self.rejects(lambda d: row(d, "variant_index", 2).update(ordinal=0))

    def test_variant_id_hole(self):
        self.rejects(lambda d: row(d, "variant_index", 2).update(id=3))

    def test_variant_body_identity_mismatch(self):
        self.rejects(lambda d: row(d, "node", 2)["variants"][0].update(module=SELECTED))

    def test_node_id_hole(self):
        self.rejects(lambda d: row(d, "node", 4).update(id=7))

    def test_node_name_duplicate(self):
        self.rejects(lambda d: row(d, "node", 4).update(name="propext"))

    def test_owned_node_kind_differs_from_base(self):
        self.rejects(lambda d: row(d, "node", 1).update(kind="theorem"))

    def test_owned_node_owner_differs_from_base(self):
        self.rejects(lambda d: row(d, "node", 0).update(owner=B))

    def test_unresolved_dependency(self):
        self.rejects(lambda d: row(d, "node", 0).update(dependencies=[0, 99]))

    def test_duplicate_dependency(self):
        self.rejects(lambda d: row(d, "node", 0).update(dependencies=[0, 0]))

    def test_wrong_dependency_count(self):
        self.rejects(lambda d: row(d, "node", 0).update(dependency_count=1))

    def test_unresolved_variant_dependency(self):
        self.rejects(lambda d: row(d, "node", 2)["variants"][0].update(dependencies=[2, 99]))

    def test_missing_root(self):
        self.rejects(lambda d: row(d, "roots").update(names=[TARGET]))

    def test_root_order_disagrees_with_ids(self):
        self.rejects(lambda d: row(d, "roots")["names"].reverse())

    def test_unreachable_graph_node(self):
        def mutate(data):
            row(data, "node", 2)["variants"][0].update(dependencies=[2], dependency_count=1)
            row(data, "passed")["edges"] -= 1
        self.rejects(mutate)

    def test_bad_axiom_only_in_foreign_variant(self):
        def mutate(data):
            row(data, "node", 4)["name"] = "Foreign.unapproved"
            row(data, "passed")["axioms"] = ["propext", "Foreign.unapproved"]
        self.rejects(mutate)

    def test_direct_owned_bad_axiom_even_if_required_proof_does_not_use_it(self):
        def mutate(data):
            row(data, "occurrence", 1)["kind"] = "axiom"
            next(r for r in data["base"] if r.get("name") == PRIVATE)["kind"] = "axiom"
            row(data, "node", 1).update(kind="axiom", dependencies=[], dependency_count=0)
            row(data, "node", 0)["variants"][0].update(dependencies=[0], dependency_count=1)
            row(data, "passed")["edges"] -= 2
        self.rejects(mutate)

    def test_zero_trust_and_alias_guards(self):
        cases = {
            "unchecked": {"kernel_passed": False},
            "changed_alias": {"alias_exact": False},
            "changed_environment": {"original_environment_unchanged": False},
            "nonzero_trust": {"trust_level": 1},
            "boolean_trust": {"trust_level": False},
            "wrong_alias": {"kernel_alias": "RawOccurrenceKernelCheck.999"},
            "existing_name_alias": {"kernel_alias": TARGET},
        }
        for label, change in cases.items():
            with self.subTest(label=label):
                self.rejects(lambda d, change=change: row(d, "node", 0)["variants"][0].update(change))

    def test_kernel_negative_control_guards(self):
        for change in ({"rejected": False}, {"trust_level": 1}, {"trust_level": False}):
            with self.subTest(change=change):
                self.rejects(lambda d, change=change: row(d, "kernel_negative_control").update(change))

    def test_missing_foreign_selected_copy(self):
        self.rejects(lambda d: row(d, "node", 2).pop("checked_raw_module"))

    def test_foreign_selected_copy_unknown_module(self):
        self.rejects(lambda d: row(d, "node", 2).update(checked_raw_module="Mathlib.Absent"))

    def test_foreign_selected_copy_out_of_range(self):
        self.rejects(lambda d: row(d, "node", 2).update(checked_raw_ordinal=1))

    def test_selected_copy_is_explicitly_nonidentical(self):
        self.rejects(lambda d: row(d, "node", 2).update(checked_raw_module=FOREIGN))

    def test_two_nodes_claim_one_selected_copy(self):
        self.rejects(lambda d: row(d, "node", 4).update(checked_raw_ordinal=0))

    def test_owned_selected_copy_wrong_name(self):
        self.rejects(lambda d: row(d, "node", 0).update(checked_raw_module=A, checked_raw_ordinal=1))

    def test_missing_selected_body_kernel_record(self):
        self.rejects(lambda d: row(d, "node", 0).pop("selected_kernel_check"))

    def test_mixed_family_selected_body_kernel_record_cannot_be_null(self):
        self.rejects(lambda d: row(d, "node", 0).update(selected_kernel_check=None))

    def test_identical_family_cannot_claim_extra_selected_check(self):
        self.rejects(lambda d: row(d, "node", 1).update(
            selected_kernel_check=copy.deepcopy(row(d, "node", 0)["selected_kernel_check"])))

    def test_selected_body_check_matches_exact_raw_copy(self):
        for change in ({"module": A}, {"ordinal": 1}, {"ordinal": False}):
            with self.subTest(change=change):
                self.rejects(lambda d, change=change: row(d, "node", 0)["selected_kernel_check"].update(change))

    def test_selected_body_kernel_guards(self):
        cases = {
            "unchecked": {"kernel_passed": False},
            "changed_alias": {"alias_exact": False},
            "changed_environment": {"original_environment_unchanged": False},
            "nonzero_trust": {"trust_level": 1},
            "boolean_trust": {"trust_level": False},
            "variant_alias": {"kernel_alias": "RawOccurrenceKernelCheck.0"},
            "wrong_node_alias": {"kernel_alias": "RawOccurrenceSelectedKernelCheck.2"},
            "existing_name_alias": {"kernel_alias": TARGET},
        }
        for label, change in cases.items():
            with self.subTest(label=label):
                self.rejects(lambda d, change=change: row(d, "node", 0)["selected_kernel_check"].update(change))

    def test_selected_kernel_summary_cannot_be_dropped(self):
        self.rejects(lambda d: row(d, "passed").pop("selected_kernel_checks"))

    def test_selected_kernel_summary_counts_every_mixed_family(self):
        self.rejects(lambda d: row(d, "passed").update(selected_kernel_checks=1))

    def test_total_kernel_summary_counts_selected_and_variant_bodies(self):
        self.rejects(lambda d: row(d, "passed").update(kernel_checks=2))

    def test_boolean_ids_are_not_integers(self):
        changes = {
            "node": lambda d: row(d, "node", 0).update(id=False),
            "index": lambda d: row(d, "variant_index", 0).update(id=False),
            "occurrence": lambda d: row(d, "occurrence", 0).update(ordinal=False),
            "index_ordinal": lambda d: row(d, "variant_index", 0).update(ordinal=False),
            "variant_id": lambda d: row(d, "node", 0)["variants"][0].update(id=False),
            "dependency": lambda d: row(d, "node", 0).update(dependencies=[False, 2]),
            "selected_ordinal": lambda d: row(d, "node", 2).update(checked_raw_ordinal=False),
        }
        for label, mutate in changes.items():
            with self.subTest(label=label):
                self.rejects(mutate)

    def test_summary_integer_fields_reject_booleans(self):
        for key in ("scanned_modules", "serialized_constants", "indexed_variants",
                    "owned_occurrences", "roots", "nodes", "edges", "kernel_checks",
                    "selected_kernel_checks", "pending", "trust_level"):
            with self.subTest(key=key):
                self.rejects(lambda d, key=key: row(d, "passed").update({key: False}))

    def test_summary_private_flag_requires_boolean(self):
        self.rejects(lambda d: row(d, "passed").update(strict_project_private_ownership=1))

    def test_modern_audit_root_is_rejected(self):
        self.rejects(lambda d: row(d, "passed").update(audit_root_modern=True))

    def test_legacy_audit_root_flag_requires_boolean(self):
        self.rejects(lambda d: row(d, "passed").update(audit_root_modern=0))

    def test_summary_pending_work(self):
        self.rejects(lambda d: row(d, "passed").update(pending=1))

    def test_summary_drops_reached_axiom(self):
        self.rejects(lambda d: row(d, "passed").update(axioms=["propext"]))

    def test_scanned_private_data_missing(self):
        self.rejects(lambda d: row(d, "scanned_module", 2).update(import_all=False))

    def test_scanned_owned_count_disagrees(self):
        self.rejects(lambda d: row(d, "scanned_module", 0).update(raw_count=3))

    def test_missing_scan_module(self):
        self.rejects(lambda d: d["rows"].remove(row(d, "scanned_module", 0)))

    def test_unexpected_record(self):
        self.rejects(lambda d: d["rows"].append({"tag": "accepted"}))


class RawOccurrenceRenderer(unittest.TestCase):
    def test_extension_preserves_options_and_uses_complete_legacy_import_mode(self):
        original = base.audit_source([A, B], [A, B], {A: [TARGET], B: []})
        rendered = audit.augment_source(original, [A, B], {A: True, B: True}, flavor="extension")
        self.assertEqual(rendered.count("set_option maxRecDepth 100000"),
                         original.count("set_option maxRecDepth 100000"))
        self.assertEqual(rendered.count("set_option maxHeartbeats 0"),
                         original.count("set_option maxHeartbeats 0"))
        self.assertFalse(rendered.lstrip().startswith("module\n"))
        self.assertNotIn("import all ", rendered)
        self.assertIn("\nimport " + A + "\n", rendered)
        self.assertIn("\nimport " + B + "\n", rendered)
        self.assertIn("unless data.isModule do", rendered)
        self.assertNotIn("Owned-extension audit must use modern module mode", rendered)
        self.assertNotIn("Repeated serialized owned declaration: {name}", rendered)
        self.assertIn("kernel.header.trustLevel == 0", rendered)
        self.assertIn("kernel.addDeclCore", rendered)
        self.assertIn("RawOccurrenceSelectedKernelCheck", rendered)
        self.assertIn("rule.rhs.getUsedConstantsAsSet", rendered)
        self.assertIn("value.all", rendered)
        self.assertNotIn("__OWNED__", rendered)
        self.assertNotIn("__MODERN__", rendered)

    def test_all_owned_keeps_callers_resource_options(self):
        original = ("import Conjectures.RawFixtureA\nimport Lean.Data.Json\n"
                    "set_option maxRecDepth 2345\nset_option maxHeartbeats 6789\n")
        rendered = audit.augment_source(original, [A], {A: False},
            flavor="all_owned", legacy_prefixes=["RawFixture."])
        self.assertTrue(rendered.startswith(original.replace(
            "import Lean.Data.Json\n", "import Lean.Data.Json\nimport Lean.Util.FoldConsts\n")))
        self.assertEqual(rendered.count("set_option maxRecDepth 2345"), 1)
        self.assertEqual(rendered.count("set_option maxHeartbeats 6789"), 1)
        self.assertNotIn("set_option maxHeartbeats 0", rendered)

    def test_all_owned_preserves_existing_prefixes_without_trailing_dot(self):
        original = "import Conjectures.RawFixtureA\nimport Lean.Data.Json\n"
        prefixes = ["HadamardLegendre.", "HadamardAutomorphism", "HadamardBorder"]
        rendered = audit.augment_source(original, [A], {A: False},
                                         flavor="all_owned", legacy_prefixes=prefixes)
        for prefix in prefixes:
            self.assertIn(json.dumps(prefix), rendered)

    def test_changed_frozen_template_rejected(self):
        original = base.audit_source([A, B], [A, B], {A: [TARGET], B: []})
        with self.assertRaises(ValueError):
            audit.augment_source(original.replace("Repeated serialized owned declaration", "Changed"),
                [A, B], {A: True, B: True}, flavor="extension")

    def test_changed_original_root_mode_guard_rejected(self):
        original = base.audit_source([A, B], [A, B], {A: [TARGET], B: []})
        with self.assertRaises(ValueError):
            audit.augment_source(original.replace("Owned-extension audit must use modern module mode", "Changed"),
                [A, B], {A: True, B: True}, flavor="extension")

    def test_configuration_rejections(self):
        original = "import Lean.Data.Json\n"
        cases = [
            ([A, A], {A: False}, "all_owned"),
            ([A], {}, "all_owned"),
            ([A], {A: 0}, "all_owned"),
            ([A], {A: False}, "extension"),
            (["Conjectures.A\nimport Evil"], {"Conjectures.A\nimport Evil": False}, "all_owned"),
            ([A], {A: False}, "unknown"),
        ]
        for modules, modern, flavor in cases:
            with self.subTest(modules=modules, modern=modern, flavor=flavor):
                with self.assertRaises(ValueError):
                    audit.augment_source(original, modules, modern, flavor=flavor)


if __name__ == "__main__":
    unittest.main()
