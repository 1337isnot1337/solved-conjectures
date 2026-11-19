#!/usr/bin/env python3
"""Protocol checks for scoped modern-module audit ownership and completeness."""
from __future__ import annotations

import copy
import json
import unittest
import audit_lean_owned_extension as audit

DEP = "Conjectures.ExtensionDependency"
GOOD = "Conjectures.ExtensionGood"
BAD = "Conjectures.ExtensionBad"
IMPORTED = [DEP, GOOD, BAD]
OWNED = [GOOD, BAD]
REQUIRED = {GOOD: ["ExtensionGood.result"], BAD: ["ExtensionBad.result"]}
PRIVATE_PROOF = "_private.Conjectures.ExtensionGood.0.ExtensionGood.hiddenProof"
PRIVATE_CHOICE = "_private.Conjectures.ExtensionBad.0.ExtensionBad.hiddenOwnedChoice"


def records():
    declarations = [
        ("ExtensionGood.value", GOOD, "definition", None, []),
        ("ExtensionGood.result", GOOD, "theorem", None, []),
        (PRIVATE_PROOF, GOOD, "theorem", "ExtensionGood.hiddenProof", []),
        ("ExtensionBad.result", BAD, "theorem", None, []),
        (PRIVATE_CHOICE, BAD, "definition", "ExtensionBad.hiddenOwnedChoice", ["Classical.choice"]),
    ]
    rows = [{"tag": "import", "module": module, "owned": module in OWNED}
            for module in IMPORTED]
    for module in OWNED:
        values = [row for row in declarations if row[1] == module]
        rows.append({"tag": "module", "module": module, "modern": True,
                     "import_all": True, "has_data": True,
                     "names": [row[0] for row in values],
                     "private_count": sum(row[3] is not None for row in values)})
    rows.extend({"tag": "declaration", "name": name, "owner": owner, "kind": kind,
                 "private_user_name": private, "by_module": True, "by_serialized": True,
                 "axioms": axioms}
                for name, owner, kind, private, axioms in declarations)
    rows.extend({"tag": "required", "name": name, "owner": module}
                for module, names in REQUIRED.items() for name in names)
    rows.append({"tag": "passed", "imported_modules": 3, "owned_modules": 2,
                 "declarations": 5, "theorems": 3, "private_declarations": 2,
                 "raw_declarations": 5, "required_theorems": 2,
                 "allowed_axioms": list(audit.ALLOWED)})
    return rows


def log(rows):
    return "\n".join(audit.MARKER + json.dumps(row) for row in rows)


def validate(rows, **kwargs):
    return audit.validate_log(log(rows), IMPORTED, OWNED, REQUIRED, **kwargs)


class ScopedAuditTests(unittest.TestCase):
    def test_exact_owned_subset(self):
        value = validate(records())
        self.assertEqual(set(value["owned_modules"]), set(OWNED))
        self.assertEqual(value["summary"]["private_declarations"], 2)
        self.assertFalse(value["dependency_audit_claimed"])

    def test_import_all_only_owned_roots(self):
        source = audit.audit_source(IMPORTED, OWNED, REQUIRED)
        self.assertTrue(source.startswith("module\n"))
        self.assertIn("import all " + GOOD, source)
        self.assertIn("import all " + BAD, source)
        self.assertNotIn("import all " + DEP, source)

    def test_duplicate_import_rejected(self):
        with self.assertRaises(ValueError):
            audit.audit_source(IMPORTED + [DEP], OWNED, REQUIRED)

    def test_owned_module_outside_imports_rejected(self):
        with self.assertRaises(ValueError):
            audit.audit_source([DEP, GOOD], OWNED, REQUIRED)

    def test_missing_required_owner_rejected(self):
        with self.assertRaises(ValueError):
            audit.audit_source(IMPORTED, OWNED, {GOOD: REQUIRED[GOOD]})

    def test_duplicate_required_theorem_rejected(self):
        with self.assertRaises(ValueError):
            audit.audit_source(IMPORTED, OWNED, {GOOD: REQUIRED[GOOD], BAD: REQUIRED[GOOD]})

    def test_missing_project_import_rejected(self):
        with self.assertRaises(ValueError):
            validate([row for row in records() if not
                      (row["tag"] == "import" and row["module"] == DEP)])

    def test_extra_project_import_rejected(self):
        rows = records()
        rows.insert(0, {"tag": "import", "module": "Conjectures.Extra", "owned": False})
        with self.assertRaises(ValueError):
            validate(rows)

    def test_unowned_module_raw_data_rejected(self):
        rows = records()
        rows.append({"tag": "module", "module": DEP, "modern": True,
                     "import_all": True, "has_data": True, "names": [], "private_count": 0})
        with self.assertRaises(ValueError):
            validate(rows)

    def test_omitted_private_declaration_rejected(self):
        rows = [row for row in records() if not
                (row["tag"] == "declaration" and row["name"] == PRIVATE_CHOICE)]
        with self.assertRaises(ValueError):
            validate(rows)

    def test_private_import_flag_rejected(self):
        rows = records()
        next(row for row in rows if row["tag"] == "module")["import_all"] = False
        with self.assertRaises(ValueError):
            validate(rows)

    def test_unowned_declaration_rejected(self):
        rows = records()
        rows.insert(-1, {"tag": "declaration", "name": "Dependency.unrelated", "owner": DEP,
                        "kind": "definition", "private_user_name": None,
                        "by_module": False, "by_serialized": False, "axioms": []})
        with self.assertRaises(ValueError):
            validate(rows)

    def test_serialized_wrong_owner_rejected(self):
        rows = records()
        next(row for row in rows if row["tag"] == "declaration")["owner"] = BAD
        with self.assertRaises(ValueError):
            validate(rows)

    def test_required_definition_rejected(self):
        rows = records()
        next(row for row in rows if row["tag"] == "declaration"
             and row["name"] == "ExtensionGood.result")["kind"] = "definition"
        with self.assertRaises(ValueError):
            validate(rows)

    def test_required_wrong_assigned_owner_rejected(self):
        rows = records()
        next(row for row in rows if row["tag"] == "required")["owner"] = BAD
        with self.assertRaises(ValueError):
            validate(rows)

    def test_private_choice_rejected_by_restricted_whitelist(self):
        with self.assertRaises(ValueError):
            validate(records(), allowed=("propext", "Quot.sound"))

    def test_summary_mismatch_rejected(self):
        rows = records()
        rows[-1]["raw_declarations"] = 4
        with self.assertRaises(ValueError):
            validate(rows)


if __name__ == "__main__":
    unittest.main()
