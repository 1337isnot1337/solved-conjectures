#!/usr/bin/env python3
"""Regression checks for the complete-row coverage gate's exact scope."""

from __future__ import annotations

import copy
from pathlib import Path
import tempfile
import unittest

import verify_frankl_transport_coverage as coverage


def fixture():
    blocks = []
    for index, period in enumerate(("7", "10")):
        namespace = f"FranklSmallCyclic.TransportBatches.G000.B{index:03d}"
        endpoints = [namespace + ".Data.period" + period + suffix
                     for suffix in ("Chunk_entries", "_index_check", "_words_check")]
        blocks.append({
            "data_module": f"Conjectures.FranklSmallCyclicTransportG000B{index:03d}Data",
            "namespace": namespace, "periods": {period: {}},
            "required_endpoints": endpoints + [namespace + ".period" + period + "_checked"],
        })
    manifest = {
        "blocks": blocks,
        "groups": [{"source": {
            "data_module": "Conjectures.FranklSmallCyclicOrbit7Block000Data"}}],
        "canonical_words": {
            "module": coverage.CANONICAL_MODULE, "namespace": coverage.CANONICAL_NS,
            "required_endpoints": list(coverage.CANONICAL_ENDPOINTS),
        },
        "separate_coverage_gate": {
            "root": coverage.COVERAGE_ROOT, "numeric_proof_modules_imported": False,
            "required_endpoints": sorted(
                coverage.COVERAGE_NS + f".period{period}" + suffix
                for period in coverage.PERIODS for suffix in coverage.COVERAGE_SUFFIXES),
        },
    }
    modules = sorted(coverage.GENERIC_MODULES | {coverage.COVERAGE_ROOT} |
                     {block["data_module"] for block in blocks} |
                     {manifest["groups"][0]["source"]["data_module"]})
    return manifest, modules


class CoverageGateTests(unittest.TestCase):
    def test_exact_data_closure_is_accepted(self):
        manifest, modules = fixture()
        data, source = coverage.validate_scope(manifest, modules)
        self.assertEqual(len(data), 2)
        self.assertEqual(source, {"Conjectures.FranklSmallCyclicOrbit7Block000Data"})

    def test_each_numeric_proof_lane_is_rejected(self):
        manifest, modules = fixture()
        for forbidden in (
            "Conjectures.FranklSmallCyclicTransportG000B000",
            "Conjectures.FranklSmallCyclicOrbit7Block000",
            "Conjectures.FranklSmallCyclicWeights9Pilot",
            "Conjectures.FranklSmallCyclicTransportResults",
            "Conjectures.FranklVaughanMatching",
        ):
            with self.subTest(module=forbidden), self.assertRaises(RuntimeError):
                coverage.validate_scope(manifest, modules + [forbidden])

    def test_manifest_cannot_relabel_a_numeric_proof_as_data(self):
        manifest, modules = fixture()
        old = manifest["groups"][0]["source"]["data_module"]
        for proof in (
            "Conjectures.FranklSmallCyclicOrbit7Block000",
            "Conjectures.FranklSmallCyclicWeights9Pilot",
            "Conjectures.FranklSmallCyclicTransportResults",
        ):
            changed = copy.deepcopy(manifest)
            changed["groups"][0]["source"]["data_module"] = proof
            moved = [proof if module == old else module for module in modules]
            with self.subTest(module=proof), self.assertRaises(RuntimeError):
                coverage.validate_scope(changed, moved)

    def test_missing_or_extra_data_module_is_rejected(self):
        manifest, modules = fixture()
        expected = manifest["blocks"][0]["data_module"]
        with self.assertRaises(RuntimeError):
            coverage.validate_scope(manifest, [m for m in modules if m != expected])
        with self.assertRaises(RuntimeError):
            coverage.validate_scope(manifest, modules + [
                "Conjectures.FranklSmallCyclicTransportG999B999Data"])

    def test_duplicate_module_is_rejected(self):
        manifest, modules = fixture()
        with self.assertRaises(RuntimeError):
            coverage.validate_scope(manifest, modules + [modules[0]])

    def test_all_period_and_leaf_requirements_are_retained(self):
        manifest, _ = fixture()
        required = coverage.required_endpoints(manifest)
        self.assertEqual(required, sorted(set(required)))
        for name in manifest["separate_coverage_gate"]["required_endpoints"]:
            self.assertIn(name, required)
        for name in coverage.CANONICAL_ENDPOINTS:
            self.assertIn(name, required)
        for block in manifest["blocks"]:
            for name in block["required_endpoints"]:
                if ".Data." in name:
                    self.assertIn(name, required)
                else:
                    self.assertNotIn(name, required)

    def test_missing_period_word_or_unique_index_requirement_is_rejected(self):
        manifest, _ = fixture()
        for suffix in ("_indices_nodup", "_indices_toFinset", "_entries_length", "_entry_words"):
            changed = copy.deepcopy(manifest)
            changed["separate_coverage_gate"]["required_endpoints"].remove(
                coverage.COVERAGE_NS + ".period9" + suffix)
            with self.subTest(suffix=suffix), self.assertRaises(RuntimeError):
                coverage.required_endpoints(changed)

    def test_missing_or_duplicate_leaf_requirement_is_rejected(self):
        manifest, _ = fixture()
        missing = copy.deepcopy(manifest)
        missing["blocks"][1]["required_endpoints"].pop(0)
        with self.assertRaises(RuntimeError):
            coverage.required_endpoints(missing)
        duplicate = copy.deepcopy(manifest)
        duplicate["blocks"][0]["required_endpoints"].append(
            duplicate["blocks"][0]["required_endpoints"][0])
        with self.assertRaises(RuntimeError):
            coverage.required_endpoints(duplicate)

    def test_missing_canonical_bound_is_rejected(self):
        manifest, _ = fixture()
        manifest["canonical_words"]["required_endpoints"].remove(
            coverage.CANONICAL_NS + ".block070_bounded_check")
        with self.assertRaises(RuntimeError):
            coverage.required_endpoints(manifest)

    def test_private_inventory_is_exact_and_parse_failures_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "audit.log"
            line = "COVERAGE-PRIVATE _private.Example.0.helper USER Example.helper THEOREM true\n"
            path.write_text(line, encoding="utf-8")
            rows = coverage.private_inventory_from_log(path)
            self.assertEqual(rows, [{
                "name": "_private.Example.0.helper", "user_name": "Example.helper",
                "is_theorem": True}])
            path.write_text(line + line, encoding="utf-8")
            with self.assertRaises(RuntimeError):
                coverage.private_inventory_from_log(path)
            path.write_text("COVERAGE-PRIVATE unparseable\n", encoding="utf-8")
            with self.assertRaises(RuntimeError):
                coverage.private_inventory_from_log(path)


if __name__ == "__main__":
    unittest.main()
