#!/usr/bin/env python3
"""Reject omissions and ownership mistakes in the explicit numerical-private inventory."""
import copy
import unittest

import verify_six_speed_prime0257_pilot as gate


class PrivateInventoryTests(unittest.TestCase):
    def fixture(self):
        module = "Conjectures.Pilot"
        user = "Loneliness.Pilot.frame0000_checked"
        raw = "_private.Conjectures.Pilot.0." + user
        inventory = {
            "modules": {module: {"names": [raw]}},
            "declarations": {raw: {"private_user_name": user,
                                  "kind": "theorem", "by_serialized": True}},
        }
        return inventory, {module: [user]}, module, user, raw

    def test_exact_private_theorem(self):
        inventory, expected, module, user, raw = self.fixture()
        self.assertEqual(gate.validate_private_theorems(inventory, expected),
                         {module: {user: raw}})

    def test_missing_private_theorem_rejected(self):
        inventory, expected, module, _, _ = self.fixture()
        inventory["modules"][module]["names"] = []
        with self.assertRaises(RuntimeError):
            gate.validate_private_theorems(inventory, expected)

    def test_wrong_serialized_owner_rejected(self):
        inventory, expected, module, _, raw = self.fixture()
        inventory["modules"]["Conjectures.Other"] = {"names": [raw]}
        inventory["modules"][module]["names"] = []
        with self.assertRaises(RuntimeError):
            gate.validate_private_theorems(inventory, expected)

    def test_definition_cannot_replace_theorem(self):
        inventory, expected, _, _, raw = self.fixture()
        inventory["declarations"][raw]["kind"] = "definition"
        with self.assertRaises(RuntimeError):
            gate.validate_private_theorems(inventory, expected)

    def test_duplicate_user_name_rejected(self):
        inventory, expected, module, _, raw = self.fixture()
        other = raw.replace(".0.", ".1.")
        inventory["modules"][module]["names"].append(other)
        inventory["declarations"][other] = copy.deepcopy(inventory["declarations"][raw])
        with self.assertRaises(RuntimeError):
            gate.validate_private_theorems(inventory, expected)

    def test_nonserialized_declaration_rejected(self):
        inventory, expected, _, _, raw = self.fixture()
        inventory["declarations"][raw]["by_serialized"] = False
        with self.assertRaises(RuntimeError):
            gate.validate_private_theorems(inventory, expected)

    def test_missing_module_rejected(self):
        inventory, expected, module, _, _ = self.fixture()
        del inventory["modules"][module]
        with self.assertRaises(RuntimeError):
            gate.validate_private_theorems(inventory, expected)


if __name__ == "__main__":
    unittest.main()
