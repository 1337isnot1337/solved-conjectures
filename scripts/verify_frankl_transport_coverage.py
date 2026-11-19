#!/usr/bin/env python3
"""Exact data-only gates for all four transported original-row lists.

Every generated Data module is freshly compiled. Concrete arithmetic proof
blocks, pilot arithmetic proofs, transport proof blocks and the final numeric
integration root are excluded from this closure. The kernel-checked Coverage
theorems establish each original index exactly once and preserve original words.
Alternative transported weights are retained; their validity is a separate gate.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re
from types import SimpleNamespace

import verify_frankl_orbit_batches as arithmetic
import verify_frankl_transport_batches as transport


ROOT = arithmetic.ROOT
COVERAGE_ROOT = "Conjectures.FranklSmallCyclicTransportCoverage"
COVERAGE_NS = "FranklSmallCyclic.TransportBatches.Coverage"
GROUP = "complete-row-coverage"
PERIODS = (7, 8, 9, 10)
COUNT = 9088
PERIOD_CHUNKS = {"7": 86, "8": 105, "9": 108, "10": 118}
GENERIC_MODULES = {
    "Conjectures.FranklBasic",
    "Conjectures.FranklCyclicCertificates",
    "Conjectures.FranklCyclicGenerators",
    "Conjectures.FranklCyclicRank",
    "Conjectures.FranklCyclicWords",
    "Conjectures.FranklFCBitCode",
    "Conjectures.FranklFamily",
    "Conjectures.FranklLocalCertificate",
    "Conjectures.FranklLocalEnumeration",
    "Conjectures.FranklLocalEnumerationCore",
    "Conjectures.FranklLocalEnumerationMap",
    "Conjectures.FranklLocalFibers",
    "Conjectures.FranklLocalFiniteSupport",
    "Conjectures.FranklLocalMaskCached",
    "Conjectures.FranklLocalMaskCertificate",
    "Conjectures.FranklLocalMaskDomains",
    "Conjectures.FranklLocalMaskEquivalence",
    "Conjectures.FranklLocalMaximalCover",
    "Conjectures.FranklLocalWeights",
    "Conjectures.FranklSmallCyclicCanonicalWords",
    "Conjectures.FranklSmallCyclicMaskTransport",
    "Conjectures.FranklSmallCyclicMaskWindows",
    "Conjectures.FranklSmallCyclicMasks",
    "Conjectures.FranklSmallCyclicOrbitArithmetic",
    "Conjectures.FranklSmallCyclicRowCoverage",
    "Conjectures.FranklSmallCyclicWeightTransport",
    "Conjectures.FranklSmallCyclicWeights",
}
ROW_ENDPOINTS = [
    "FranklSmallCyclic.RowCoverage.indexCheck_sound",
    "FranklSmallCyclic.RowCoverage.wordsCheck_sound",
    "FranklSmallCyclic.RowCoverage.coverageCheck_sound",
    "FranklSmallCyclic.RowCoverage.mem_allRows",
    "FranklSmallCyclic.RowCoverage.chunk_indices_bounded",
    "FranklSmallCyclic.RowCoverage.indices_bounded",
    "FranklSmallCyclic.RowCoverage.decode_combinedMask",
    "FranklSmallCyclic.RowCoverage.indices_toFinset",
    "FranklSmallCyclic.RowCoverage.allRows_length",
    "FranklSmallCyclic.RowCoverage.entries_length",
    "FranklSmallCyclic.RowCoverage.indices_nodup",
    "FranklSmallCyclic.RowCoverage.entries_checked",
    "FranklSmallCyclic.RowCoverage.entry_for_index",
    "FranklSmallCyclic.RowCoverage.checked_entry_for_index",
    "FranklSmallCyclic.RowCoverage.entry_words_toFinset",
    "FranklSmallCyclic.RowCoverage.entry_for_original",
]
CANONICAL_MODULE = "Conjectures.FranklSmallCyclicCanonicalWords"
CANONICAL_NS = "FranklSmallCyclic.CanonicalWords"
CANONICAL_ENDPOINTS = [CANONICAL_NS + "." + name for name in (
    "count_eq", "codes_length", "words_length", "wordAt_eq", "wordAt_length",
    "getD_lt", "codeAt_all_lt", "codeAt_bounded_check", "codeAt_lt",
)] + [CANONICAL_NS + f".block{i:03d}_bounded_check" for i in range(71)]
COVERAGE_SUFFIXES = (
    "_coverage_check", "_coverage", "_index_checks", "_word_checks",
    "_indexed", "_words", "_indices_nodup", "_indices_toFinset",
    "_entries_length", "_entry_words",
)
GATE_INPUTS = tuple(dict.fromkeys((*transport.GATE_INPUTS,
    "scripts/verify_frankl_transport_coverage.py",
    "scripts/test_frankl_transport_coverage.py",
    ".github/workflows/lean-frankl-transport-coverage.yml",
)))
SCOPE = (
    "Complete data-only row coverage for periods 7, 8, 9 and 10. "
    "Each list has exactly 9088 original indices without duplicates and "
    "the same original word at each index. All owned declarations and "
    "private object facets in this exact closure are audited and replayed. "
    "No concrete arithmetic proof block, pilot arithmetic proof or transport "
    "proof block is imported. Validity of the transported weights, the "
    "numeric integration root and canonical graph coverage remain separate."
)


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def validate_scope(manifest, modules):
    expected_data = {block["data_module"] for block in manifest["blocks"]}
    source_data = {group["source"]["data_module"] for group in manifest["groups"]}
    expected = GENERIC_MODULES | expected_data | source_data | {COVERAGE_ROOT}
    require(len(modules) == len(set(modules)), "Repeated module in the coverage closure")
    require(set(modules) == expected,
            "Data-only coverage closure differs: missing=" +
            repr(sorted(expected - set(modules))) + ", extra=" +
            repr(sorted(set(modules) - expected)))
    require(len(expected_data) == len(manifest["blocks"]),
            "Two transport leaves reuse a Data module")
    require(not any(
        re.fullmatch(r"Conjectures\.FranklSmallCyclicTransportG\d+B\d+", module)
        or re.fullmatch(r"Conjectures\.FranklSmallCyclicOrbit(?:7|8|9|10)Block\d+", module)
        or re.fullmatch(r"Conjectures\.FranklSmallCyclicWeights[789]Pilot", module)
        or module == "Conjectures.FranklSmallCyclicTransportResults"
        or "Vaughan" in module or "Matching" in module
        for module in modules), "A concrete numeric proof module entered the data-only closure")
    return expected_data, source_data


def required_endpoints(manifest):
    coverage = manifest["separate_coverage_gate"]
    require(coverage["root"] == COVERAGE_ROOT, "Unexpected complete-row root")
    require(coverage["numeric_proof_modules_imported"] is False,
            "Manifest does not claim a data-only coverage root")
    expected_coverage = {
        COVERAGE_NS + f".period{period}" + suffix
        for period in PERIODS for suffix in COVERAGE_SUFFIXES
    }
    require(set(coverage["required_endpoints"]) == expected_coverage
            and len(coverage["required_endpoints"]) == len(expected_coverage),
            "A period's exact row or original-word requirement is missing or duplicated")
    canonical = manifest["canonical_words"]
    require(canonical["module"] == CANONICAL_MODULE and canonical["namespace"] == CANONICAL_NS
            and set(canonical["required_endpoints"]) == set(CANONICAL_ENDPOINTS)
            and len(canonical["required_endpoints"]) == len(CANONICAL_ENDPOINTS),
            "Canonical word/lookup endpoint inventory changed")
    required = (list(arithmetic.SHARED_ENDPOINTS) + list(ROW_ENDPOINTS) +
                list(manifest["canonical_words"]["required_endpoints"]) +
                list(coverage["required_endpoints"]))
    for block in manifest["blocks"]:
        expected = {
            block["namespace"] + ".Data.period" + period + suffix
            for period in block["periods"]
            for suffix in ("Chunk_entries", "_index_check", "_words_check")
        }
        actual = [name for name in block["required_endpoints"]
                  if name.startswith(block["namespace"] + ".Data.")]
        require(set(actual) == expected and len(actual) == len(expected),
                "A leaf's data endpoint inventory is incomplete")
        required.extend(actual)
    return sorted(set(required))


def coverage_spec(manifest):
    modules = arithmetic.dependency_order([COVERAGE_ROOT])
    data_modules, source_data = validate_scope(manifest, modules)
    require(len(manifest["blocks"]) == 335 and len(data_modules) == 335
            and len(source_data) == 101 and len(modules) == 464,
            "The reviewed complete data layout changed")
    private = transport.private_nodes(modules)
    require(private == [], "Data-only closure unexpectedly contains private checkedN proofs")
    period_chunks = {
        str(period): sum(str(period) in block["periods"] for block in manifest["blocks"])
        for period in PERIODS
    }
    require(period_chunks == PERIOD_CHUNKS, "Per-period chunk partition changed")
    required = required_endpoints(manifest)
    require(len(required) == 1400, "The reviewed full data endpoint inventory changed")
    group = {
        "id": GROUP, "roots": [COVERAGE_ROOT], "rows": COUNT * len(PERIODS),
        "rows_per_period": COUNT, "periods": list(PERIODS), "private_chunks": 0,
        "transport_data_modules": sorted(data_modules),
        "source_data_modules": sorted(source_data),
        "period_chunks": period_chunks,
        "concrete_numeric_proof_modules": [],
    }
    return group, modules, required, private


def audit_source(modules, required, private):
    source = ORIGINAL_AUDIT_SOURCE(modules, required, private)
    needle = "      declarations := declarations + 1\n"
    require(source.count(needle) == 1, "Shared all-owned audit layout changed")
    extra = (
        "      if let some userName := privateToUserName? name then\n"
        '        logInfo m!"COVERAGE-PRIVATE {name} USER {userName} THEOREM {info.isTheorem}"\n'
    )
    source = source.replace(needle, needle + extra)
    command = "open Lean Elab Command in\n"
    require(source.count(command) == 1, "Shared audit command layout changed")
    return source.replace(command, "set_option maxRecDepth 100000\n"
                          "set_option maxHeartbeats 0\n\n" + command)


ORIGINAL_AUDIT_SOURCE = arithmetic.audit_source


def private_inventory_from_log(path):
    text = Path(path).read_text(encoding="utf-8")
    rows = re.findall(r"COVERAGE-PRIVATE (\S+) USER (\S+) THEOREM (true|false)(?:\r?\n|$)", text)
    require(text.count("COVERAGE-PRIVATE ") == len(rows),
            "A private declaration audit line could not be parsed")
    require(len({row[0] for row in rows}) == len(rows),
            "Repeated private declaration in the all-owned audit")
    return [{"name": name, "user_name": user, "is_theorem": theorem == "true"}
            for name, user, theorem in sorted(rows)]


def plan(manifest):
    group, modules, required, private = coverage_spec(manifest)
    return {
        "schema": "frankl-transport-row-coverage-plan-v1",
        "scope": SCOPE, "root": COVERAGE_ROOT,
        "manifest_sha256": arithmetic.digest(transport.MANIFEST),
        "project_modules": modules,
        "source_sha256": {module: arithmetic.digest(arithmetic.source(module)) for module in modules},
        "required_endpoints": required, "required_private_endpoints": private,
        "group": group,
        "reduction_review": {
            "leaf_row_word_checks": 834,
            "max_rows_per_leaf": 128,
            "per_period_mask_or_terms": PERIOD_CHUNKS,
            "range_mask_terms_per_final_check": COUNT,
            "final_coverage_checks": 4,
            "full_list_numeric_checks": 0,
            "full_list_word_comparisons": 0,
            "note": "The four final checks compute only mask unions and literal counts. "
                    "The 9088-term range-mask construction is measured by the source gate.",
        },
    }


def verify(manifest, jobs, stage):
    group, modules, required, private = coverage_spec(manifest)
    require(not stage.exists() or not any(stage.iterdir()),
            "Preserve existing coverage gate evidence; choose a fresh artifact directory")
    previous_write = arithmetic.write_receipt

    def write_receipt(destination, receipt):
        receipt["scope"] = SCOPE
        receipt["coverage_manifest_sha256"] = arithmetic.digest(transport.MANIFEST)
        receipt["numeric_proof_modules_imported"] = False
        receipt["numeric_weight_validity_checked"] = False
        receipt["numeric_integration_checked"] = False
        receipt["canonical_graph_coverage_checked"] = False
        receipt["row_coverage_checked"] = receipt["status"] == "passed"
        receipt["period_chunks"] = PERIOD_CHUNKS
        if receipt["status"] == "passed":
            receipt["owned_private_declarations"] = private_inventory_from_log(
                receipt["axiom_audit"]["log"])
            receipt["all_owned_private_declarations_audited"] = True
        previous_write(destination, receipt)

    arithmetic.group_spec = lambda _manifest, _name: (group, modules, required, private)
    arithmetic.GATE_INPUTS = GATE_INPUTS
    arithmetic.audit_source = audit_source
    arithmetic.write_receipt = write_receipt
    arithmetic.run_group(SimpleNamespace(
        group=GROUP, artifact_dir=stage, runtime=None, jobs=jobs), manifest)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--jobs", type=int, choices=(1, 2, 3, 4), default=4)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/frankl-transport-row-coverage")
    args = parser.parse_args()
    manifest = transport.validate_sources()
    if args.plan:
        print(json.dumps(plan(manifest), indent=2, sort_keys=True))
    else:
        verify(manifest, args.jobs, args.artifact_dir.resolve())


if __name__ == "__main__":
    main()
