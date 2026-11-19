#!/usr/bin/env python3
"""Protocol tests; synthetic records are not Lean verification evidence."""
import copy
import json
import unittest
import tomllib

import verify_lean_all_owned_candidate as runner

import audit_lean_all_owned as audit


def fixture():
    module = "Conjectures.Example"
    private = "_private.Conjectures.Example.0.Example.hidden"
    names = ["Example.value", "Example.result", private]
    spec = {"modules": [module], "required": ["Example.value", "Example.result"],
            "legacy_prefixes": ["Historical."]}
    records = [{"tag": "module", "module": module, "modern": True,
                "import_all": True, "has_data": True, "names": names, "private_count": 1}]
    for name, kind, user in ((names[0], "definition", None), (names[1], "theorem", None),
                             (private, "definition", "Example.hidden")):
        records.append({"tag": "declaration", "name": name, "owner": module, "kind": kind,
                        "private_user_name": user, "by_module": True, "by_serialized": True,
                        "by_legacy_prefix": False, "axioms": []})
    records.extend({"tag": "required", "name": name} for name in spec["required"])
    records.append({"tag": "passed", "modules": 1, "declarations": 3, "theorems": 1,
                    "private_declarations": 1, "raw_declarations": 3, "required": 2,
                    "allowed_axioms": list(audit.ALLOWED)})
    return records, spec, {module: True}


def log(records):
    return "\n".join("info: " + audit.MARKER + json.dumps(row) for row in records)


class ProtocolTests(unittest.TestCase):
    def test_staged_validator_retains_other_layout_rejections(self):
        original = (
            b"def validate(config):\n"
            b'    if set(config) - {"name", "version", "defaultTargets", "require", "lean_lib"}:\n'
            b'        raise ValueError("unsupported")\n')
        derived = runner.legacy_compatible_validator(original)
        namespace = {}
        exec(compile(derived, "<candidate-layout-fixture>", "exec"), namespace)
        namespace["validate"]({"name": "fixture", "allowNonModules": True})
        for config in ({"allowNonModules": False}, {"allowNonModules": "true"},
                       {"allowNonModules": 1}, {"allowNonModules": True, "srcDir": "outside"}):
            with self.subTest(config=config), self.assertRaises(ValueError):
                namespace["validate"](config)
        receipt = runner.validator_record(original, derived, True)
        self.assertEqual(receipt["original_utf8"].encode(), original)
        self.assertEqual(receipt["derived_utf8"].encode(), derived)

    def test_legacy_config_changes_only_documented_opt_in(self):
        original = b'name = "fixture"\n[[lean_lib]]\nname = "Conjectures"\nmoreLeanArgs = ["-j1"]\n'
        before = tomllib.loads(original.decode())
        derived = runner.legacy_compatible_config(original)
        self.assertEqual(tomllib.loads(derived.decode()), {**before, "allowNonModules": True})
        self.assertTrue(derived.endswith(original))
        receipt = runner.configuration_record(original, derived, True)
        self.assertNotEqual(receipt["original_sha256"], receipt["derived_sha256"])
        self.assertEqual(receipt["original_utf8"].encode(), original)
        self.assertEqual(receipt["derived_utf8"].encode(), derived)

    def test_existing_legacy_config_opt_in_requires_review(self):
        for value in (b"true", b"false"):
            with self.subTest(value=value), self.assertRaises(ValueError):
                runner.legacy_compatible_config(b"allowNonModules = " + value + b'\nname = "fixture"\n')

    def test_required_definition_and_unused_private_definition_are_kept(self):
        records, spec, modern = fixture()
        result = audit.validate_log(log(records), spec, modern)
        self.assertEqual(result["kind_counts"]["definition"], 2)
        self.assertEqual(len(result["private_declarations"]), 1)

    def test_omitted_private_declaration_is_rejected(self):
        records, spec, modern = fixture()
        records = [r for r in records if r.get("private_user_name") != "Example.hidden"]
        with self.assertRaises(ValueError):
            audit.validate_log(log(records), spec, modern)

    def test_missing_raw_module_or_private_visibility_is_rejected(self):
        for mutation in (lambda r: r.update(import_all=False),
                         lambda r: r.update(has_data=False),
                         lambda r: r.update(modern=False),
                         lambda r: r.update(private_count=0)):
            records, spec, modern = fixture()
            mutation(records[0])
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                audit.validate_log(log(records), spec, modern)

    def test_duplicate_module_declaration_required_and_summary_are_rejected(self):
        for tag in ("module", "declaration", "required", "passed"):
            records, spec, modern = fixture()
            records.append(copy.deepcopy(next(r for r in records if r["tag"] == tag)))
            with self.subTest(tag=tag), self.assertRaises(ValueError):
                audit.validate_log(log(records), spec, modern)

    def test_forbidden_axiom_in_definition_is_rejected(self):
        records, spec, modern = fixture()
        records[1]["axioms"] = ["External.bad"]
        with self.assertRaises(ValueError):
            audit.validate_log(log(records), spec, modern)

    def test_direct_axiom_is_rejected_even_if_dependency_list_is_empty(self):
        records, spec, modern = fixture()
        records[1]["kind"] = "axiom"
        with self.assertRaises(ValueError):
            audit.validate_log(log(records), spec, modern)

    def test_false_ownership_claim_is_rejected(self):
        records, spec, modern = fixture()
        records[1]["by_module"] = False
        with self.assertRaises(ValueError):
            audit.validate_log(log(records), spec, modern)

    def test_historical_prefix_remains_an_additional_owned_lane(self):
        records, spec, modern = fixture()
        records.insert(-1, {"tag": "declaration", "name": "Historical.extra",
            "owner": "External.Legacy", "kind": "definition", "private_user_name": None,
            "by_module": False, "by_serialized": False, "by_legacy_prefix": True, "axioms": []})
        records[-1]["declarations"] += 1
        result = audit.validate_log(log(records), spec, modern)
        self.assertIn("Historical.extra", result["declarations"])

    def test_extra_or_missing_required_names_are_rejected(self):
        for change in (lambda rows: rows.__setitem__("required", ["Example.missing"]),
                       lambda rows: rows.__setitem__("required", [])):
            records, spec, modern = fixture()
            change(spec)
            with self.assertRaises(ValueError):
                audit.validate_log(log(records), spec, modern)

    def test_required_name_parser_rejects_code_and_duplicates(self):
        tick = chr(96)
        self.assertEqual(audit._names(tick + "Example.one, " + tick + "Example.two"),
                         ["Example.one", "Example.two"])
        for value in (tick + "A, " + tick + "A", tick + "A, evil()", tick + "A-B"):
            with self.subTest(value=value), self.assertRaises(ValueError):
                audit._names(value)

    def test_serialized_raw_declaration_inventory_is_authoritative(self):
        records, spec, modern = fixture()
        records[0]["names"].append("Example.unseen")
        with self.assertRaises(ValueError):
            audit.validate_log(log(records), spec, modern)

    def test_summary_must_equal_logged_inventory(self):
        records, spec, modern = fixture()
        records[-1]["private_declarations"] = 0
        with self.assertRaises(ValueError):
            audit.validate_log(log(records), spec, modern)


if __name__ == "__main__":
    unittest.main()
