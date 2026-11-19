#!/usr/bin/env python3
"""Gate the complete prefix coverage and one generated 1,024-edge rank batch.

The public producer must reproduce the four rendered sources byte for byte.
Fresh project objects, all owned declarations and the exact stock replay
closure are checked in an isolated directory. No full rank table is imported.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import sys

import verify_frankl_graph_helpers as helpers
import verify_frankl_orbit_batches as orbit


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
INVENTORY_PATH = "docs/frankl-graph-pilot-sources.json"
PRODUCER_PATH = "results/frankl-generator-families/generate_span_four_graph_certificate.py"
GATE_INPUTS = (
    "scripts/verify_frankl_graph_pilot.py",
    "scripts/verify_frankl_graph_helpers.py",
    "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-graph-pilot.yml",
    INVENTORY_PATH,
    "docs/frankl-graph-helpers-sources.json",
    PRODUCER_PATH,
    "results/frankl-generator-families/span_four.py",
    "results/frankl-generator-families/window_filter.cpp",
    "results/frankl-generator-families/window_replay.cpp",
    "results/frankl-generator-families/width_four_weight_candidates.json",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)


def validate_inventory(inventory):
    if inventory["schema"] != "frankl-span-four-graph-pilot-v1":
        raise ValueError("Unexpected graph pilot inventory schema")
    helpers.preflight_sources()
    modules = orbit.dependency_order([inventory["root"]])
    if set(modules) != set(inventory["source_sha256"]):
        raise ValueError("Pilot source inventory differs from the exact import closure")
    for module in modules:
        if orbit.digest(orbit.source(module)) != inventory["source_sha256"][module]:
            raise ValueError("Pinned source changed: " + module)
    for path, expected in inventory["engine_sha256"].items():
        if orbit.digest(ROOT / path) != expected:
            raise ValueError("Reviewed pilot engine changed: " + path)
    private_by_module = helpers.explicit_private_proofs(modules)
    private = sorted(name for names in private_by_module.values() for name in names)
    if private != inventory["required_explicit_private_proofs"]:
        raise ValueError("Explicit private-proof inventory differs")
    required = sorted(set(inventory["required_theorems"] +
                          helpers.INVENTORY["required_theorems"]))
    if any("Vaughan" in module or "Matching" in module for module in modules):
        raise ValueError("The graph pilot must not import heavy arithmetic data")
    return modules, required, private


def group_spec(inventory, group):
    if group != "graph-prefix-edge-pilot":
        raise ValueError("Unknown graph pilot group")
    modules, required, private = validate_inventory(inventory)
    details = {
        "id": group, "roots": [inventory["root"]], "rows": 1024,
        "private_chunks": len(private), "workload": inventory["workload"],
        "scope": inventory["scope"],
    }
    return details, modules, required, private


def audit_source(modules, required, private):
    # Reuse the graph audit's complete declaration/private inventory. The second
    # summary line is the existing isolated runner's parsed receipt interface.
    return helpers.graph_audit_source(modules, required, private) + (
        '  logInfo m!"PASS: {modules.size} project modules; {declarations} owned declarations; '
        '{theorems} owned theorems; {required.size} required endpoints; all '
        '{seenPrivate.size} private arithmetic chunks visible"\n')


def reproduce(inventory, directory):
    if directory.exists() and any(directory.iterdir()):
        raise ValueError("Preserve existing reproduction evidence: " + str(directory))
    directory.mkdir(parents=True, exist_ok=True)
    rendered = directory / "Conjectures"
    command = [
        sys.executable, str(ROOT / PRODUCER_PATH),
        "--output", str(directory / "candidate.json.gz"),
        "--report", str(directory / "producer-report.json"),
        "--prefix-dir", str(rendered), "--edge-pilot-dir", str(rendered),
        "--prefix-chunk-size", "32", "--edge-limit", "1024",
    ]
    result = orbit.profile(command, ROOT, dict(os.environ),
                           directory / "producer.log", directory / "producer-progress.json", 1800)
    if result["exit_code"]:
        raise RuntimeError("Graph producer failed: " + (directory / "producer.log").read_text()[-12000:])
    names = sorted(path.name for path in rendered.glob("*.lean"))
    if names != sorted(inventory["rendered_sources"]):
        raise ValueError("Unexpected rendered pilot module set")
    rendered_hashes = {}
    for name, expected in inventory["rendered_sources"].items():
        actual = orbit.digest(rendered / name)
        if actual != expected or (rendered / name).read_bytes() != (LEAN / "Conjectures" / name).read_bytes():
            raise ValueError("Producer output differs from checked source: " + name)
        rendered_hashes[name] = actual
    raw = gzip.decompress((directory / "candidate.json.gz").read_bytes())
    raw_hash = hashlib.sha256(raw).hexdigest()
    if raw_hash != inventory["candidate_snapshot_sha256"]:
        raise ValueError("Recovered graph witness changed")
    data = json.loads(raw)
    report = json.loads((directory / "producer-report.json").read_text())
    seeds = report["edge_pilot"]["seeds"]
    fours = set(data["levels"][4])
    five = [a for p in seeds for d in range(16)
            if (a := p + 16**4 * d) // 16 in fours]
    six = [a for p in five for d in range(16)
           if (a := p + 16**5 * d) // 256 in fours]
    seven = [a for p in six for d in range(16)
             if (a := p + 16**6 * d) // 4096 in fours]
    seed_set = set(seeds)
    selected = [a for a in data["edges"] if a % 16**4 in seed_set]
    workload = {
        "prefix_extension_candidates": 16 * sum(len(level) for level in data["levels"][:4]),
        "prefix_private_chunks": 18,
        "edge_seed_group_index": report["edge_pilot"]["seed_group_index"],
        "edge_seeds": len(seeds),
        "five_candidates": 16 * len(seeds), "five_kept": len(five),
        "six_candidates": 16 * len(five), "six_kept": len(six),
        "seven_candidates": 16 * len(six), "seven_before_pair": len(seven),
        "generated_edges": len(selected),
        "total_edge_extension_candidates": 16 * (len(seeds) + len(five) + len(six)),
        "rank_tree_nodes": report["edge_pilot"]["rank_tree_nodes"],
        "keep_tree_nodes": report["edge_pilot"]["keep_tree_nodes"],
    }
    if workload != inventory["workload"]:
        raise ValueError("Pilot workload differs: " + json.dumps(workload, sort_keys=True))
    receipt = {
        "status": "reproduced", "formal_status": "Untrusted reproduction only; Lean gates follow.",
        "producer": result, "candidate_snapshot_sha256": raw_hash,
        "rendered_source_sha256": rendered_hashes, "workload": workload,
        "producer_report_sha256": orbit.digest(directory / "producer-report.json"),
    }
    (directory / "receipt.json").write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    return receipt


def declaration_inventory(stage, modules, required, private):
    text = (stage / "logs/axiom-audit.log").read_text()
    pattern = (r"PASS: (\d+) project modules; (\d+) owned declarations; (\d+) owned theorems; "
               r"(\d+) required endpoints; (\d+) private declarations; "
               r"all (\d+) explicit private proofs visible")
    match = re.search(pattern, text)
    if not match:
        raise RuntimeError("Missing graph declaration/private audit summary")
    counts = list(map(int, match.groups()))
    if counts[0] != len(modules) or counts[3] != len(required) or counts[5] != len(private):
        raise RuntimeError("Graph audit closure or endpoint count differs")
    declarations = re.findall(r"^DECL (.+)$", text, re.M)
    private_declarations = re.findall(r"^PRIVATE_DECL (.+)$", text, re.M)
    private_theorems = re.findall(r"^PRIVATE_THEOREM (.+)$", text, re.M)
    if len(declarations) != len(set(declarations)) or len(declarations) != counts[1]:
        raise RuntimeError("Declaration inventory differs from audited count")
    if len(private_declarations) != len(set(private_declarations)) or len(private_declarations) != counts[4]:
        raise RuntimeError("Private inventory differs from audited count")
    payload = {
        "declarations": sorted(declarations),
        "private_declarations": sorted(private_declarations),
        "private_theorems": sorted(private_theorems),
        "required_explicit_private_proofs": private,
    }
    target = stage / "declaration-inventory.json"
    target.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    return {
        "all_owned_declarations_audited": True, "exact_project_import_closure": True,
        "explicit_private_proofs_visible": counts[5], "private_declarations_visible": counts[4],
        "declaration_inventory_sha256": orbit.digest(target),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--jobs", type=int, default=4, choices=range(1, 5))
    parser.add_argument("--runtime", type=Path)
    parser.add_argument("--artifact-dir", type=Path)
    args = parser.parse_args()
    args.group = "graph-prefix-edge-pilot"
    inventory = json.loads((ROOT / INVENTORY_PATH).read_text())
    modules, required, private = validate_inventory(inventory)
    if args.plan:
        print(json.dumps({"root": inventory["root"], "modules": modules,
                          "required": required, "private": private,
                          "workload": inventory["workload"]}, indent=2))
        return
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts/frankl-graph-pilot").resolve()
    args.artifact_dir = stage
    if stage.exists() and any(stage.iterdir()):
        raise ValueError("Preserve existing gate evidence: " + str(stage))
    reproduction = reproduce(inventory, stage.with_name(stage.name + "-reproduction"))
    orbit.GATE_INPUTS = GATE_INPUTS
    orbit.group_spec = group_spec
    orbit.audit_source = audit_source
    try:
        orbit.run_group(args, inventory)
        details = declaration_inventory(stage, modules, required, private)
        receipt = json.loads((stage / "receipt.json").read_text())
        receipt["scope"] = inventory["scope"]
        receipt["reproduction"] = reproduction
        receipt["graph_declaration_inventory"] = details
        receipt["workload"] = inventory["workload"]
        receipt["status"] = "passed"
        orbit.write_receipt(stage, receipt)
    except BaseException as error:
        if (stage / "receipt.json").exists():
            receipt = json.loads((stage / "receipt.json").read_text())
            receipt.update({"status": "failed", "error": str(error),
                            "scope": inventory["scope"], "reproduction": reproduction})
            orbit.write_receipt(stage, receipt)
        raise
    print("PASS: exact prefix coverage and bounded generated-edge pilot; full ranks remain open.", flush=True)


if __name__ == "__main__":
    main()
