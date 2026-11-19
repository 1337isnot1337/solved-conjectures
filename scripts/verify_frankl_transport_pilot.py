#!/usr/bin/env python3
"""Prepare and verify a bounded 128-map transport candidate.

All arithmetic premises come from checked source blocks or the public
period-nine pilot. This gate freezes the generated witnesses, audits every
owned declaration, and replays the exact isolated closure with stock Lean.
"""
from __future__ import annotations
import argparse
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
from types import SimpleNamespace

import verify_frankl_orbit_batches as arithmetic

ROOT = arithmetic.ROOT
RESULTS = ROOT / "results/frankl-generator-families"
PRODUCER = RESULTS / "generate_small_cyclic_weight_transport_pilot.py"
PRODUCER_SHA = "cf146c544b5a8cedaf97986dee11190f0d7ff0d21f9a75a3eea37c76a4a184c2"
REPORT = RESULTS / "small_cyclic_weight_transport_pilot.json"
ARTIFACT = ROOT / ".candidate-artifacts/frankl-transport-pilot"
PREPARATION = ROOT / ".candidate-artifacts/frankl-transport-preparation.json"
NAMES = ("FranklSmallCyclicOrbitTransportPilotData.lean",
         "FranklSmallCyclicOrbitTransportPilot.lean")
SCOPE = ("Only 128 explicit source-to-target maps, with source arithmetic "
         "premises in the checked import closure. No complete 9088-row "
         "coverage, no full ShortChecked assembly, and no period-ten claim.")
GATE_INPUTS = tuple(dict.fromkeys((*arithmetic.GATE_INPUTS,
    "scripts/verify_frankl_transport_pilot.py",
    ".github/workflows/lean-frankl-transport-pilot.yml",
    "results/frankl-generator-families/generate_small_cyclic_weight_transport_pilot.py",
    "results/frankl-generator-families/small_cyclic_weight_transport_pilot.json",
)))
digest = arithmetic.digest

def require(ok, message):
    if not ok:
        raise RuntimeError(message)

def read_json(path):
    return json.loads(Path(path).read_text())

def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")

def run(command, **kwargs):
    return subprocess.run(list(map(str, command)), cwd=ROOT, check=True, **kwargs)

def load_producer():
    require(digest(PRODUCER) == PRODUCER_SHA, "Transport producer bytes differ")
    spec = importlib.util.spec_from_file_location("transport_pilot_producer", PRODUCER)
    producer = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(producer)
    return producer

def validate_sources():
    producer = load_producer()
    packet, manifest, rows = producer.load_inputs()
    selected, pool_count = producer.select(packet, manifest, rows)
    files = producer.render(selected)
    report = read_json(REPORT)
    require(report["schema"] == "frankl-short-orbit-transport-pilot-v1", "Wrong report schema")
    require(report["count"] == 128 and len(selected) == 128, "Pilot count differs")
    require(report["producer_sha256"] == PRODUCER_SHA, "Report producer differs")
    require(report["available_pool_count"] == pool_count, "Selection pool differs")
    require(set(files) == set(NAMES), "Unexpected generated module")
    for name, raw in files.items():
        path = ROOT / "lean/Conjectures" / name
        require(path.read_bytes() == raw, "Generated source differs: " + name)
        require(digest(path) == report["generated_source_sha256"][name],
                "Report source hash differs: " + name)
    expected_private = ["FranklSmallCyclic.OrbitTransportPilot.checked" + str(i)
                        for i in range(128)]
    require(report["new_private_endpoints"] == expected_private, "Private map inventory differs")
    return report, manifest

def prepare():
    load_producer()
    run([sys.executable, PRODUCER, "--report", REPORT])
    with tempfile.TemporaryDirectory(prefix="frankl-transport-reproduce-") as directory:
        tmp = Path(directory)
        run([sys.executable, PRODUCER, "--output-dir", tmp / "sources",
             "--report", tmp / "report.json"],
            env={**os.environ, "PYTHONHASHSEED": "7"})
        require(REPORT.read_bytes() == (tmp / "report.json").read_bytes(),
                "Transport report is not deterministic")
        for name in NAMES:
            require((ROOT / "lean/Conjectures" / name).read_bytes()
                    == (tmp / "sources" / name).read_bytes(),
                    "Transport source is not deterministic: " + name)
    report, _ = validate_sources()
    paths = ["lean/Conjectures/" + name for name in NAMES] + [str(REPORT.relative_to(ROOT))]
    write_json(PREPARATION, {
        "base_commit": subprocess.check_output(["git", "rev-parse", "HEAD"],
                                               cwd=ROOT, text=True).strip(),
        "publish_paths": paths,
        "frozen": {path: digest(ROOT / path) for path in (*GATE_INPUTS, *paths)},
        "report_sha256": digest(REPORT),
        "status": "deterministic candidate witnesses; fresh Lean gate pending",
        "scope": SCOPE,
    })
    print(json.dumps({"prepared": 128, "report_sha256": digest(REPORT),
                      "source_sha256": report["generated_source_sha256"]}, indent=2))

def private_nodes(modules):
    result = []
    for module in modules:
        raw = arithmetic.source(module).read_text()
        names = re.findall(r"^private theorem (checked\d+)\b", raw, re.M)
        if not names:
            continue
        namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", raw, re.M)
        require(len(namespaces) == 1 and len(names) == len(set(names)),
                "Unsupported private namespace layout: " + module)
        result += [namespaces[0] + "." + name for name in names]
    require(len(result) == len(set(result)), "Duplicate private endpoint")
    return result

def verify(jobs):
    report, manifest = validate_sources()
    g00, _, arithmetic_required, _ = arithmetic.group_spec(manifest, "g00")
    require(g00["rows"] == 512, "Source arithmetic group changed")
    modules = arithmetic.dependency_order([report["root"]])
    private = private_nodes(modules)
    require(set(report["new_private_endpoints"]) <= set(private),
            "Some transport nodes are absent from the exact closure")
    required = sorted(set(arithmetic_required + report["required_endpoints"] + [
        "FranklSmallCyclic.MaskTransport.maskTransportCheck_entryCheck",
        "FranklSmallCyclic.Weights.Period9Pilot.each_checked",
    ]))
    group = {"id": "transport128", "rows": 128, "roots": [report["root"]],
             "private_chunks": len(private), "transport_checks": 128,
             "source_arithmetic_group": "g00"}
    arithmetic.group_spec = lambda _manifest, _name: (group, modules, required, private)
    arithmetic.GATE_INPUTS = GATE_INPUTS
    old_write = arithmetic.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = SCOPE
        receipt["transport_report_sha256"] = digest(REPORT)
        receipt["transport_private_endpoints"] = report["new_private_endpoints"]
        receipt["generated_source_sha256"] = report["generated_source_sha256"]
        old_write(stage, receipt)
    arithmetic.write_receipt = write_receipt
    arithmetic.run_group(SimpleNamespace(group="transport128", artifact_dir=ARTIFACT,
                                         runtime=None, jobs=jobs), manifest)

def git_bytes(commit, path):
    result = subprocess.run(["git", "show", commit + ":" + path], cwd=ROOT,
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return result.stdout if result.returncode == 0 else None

def publish():
    report, _ = validate_sources()
    prepared = read_json(PREPARATION)
    receipt_path = ARTIFACT / "receipt.json"
    receipt = read_json(receipt_path)
    require(receipt["status"] == "passed" and receipt["all_frozen_hashes_unchanged"],
            "Fresh complete transport gate required")
    require(receipt["kernel_replay"]["exact_project_closure"]
            and receipt["axiom_audit"]["all_declarations_audited"],
            "Complete stock replay and all-declaration audit required")
    require(len(receipt["transport_private_endpoints"]) == 128,
            "Transport proof coverage differs")
    frozen = dict(prepared["frozen"])
    frozen.update({"lean/" + module.replace(".", "/") + ".lean": expected
                   for module, expected in receipt["source_sha256"].items()})
    frozen.update(receipt["gate_sha256"])
    for path, expected in frozen.items():
        require(digest(ROOT / path) == expected, "Checked input changed: " + path)
    receipt_target = "docs/verification/frankl-transport128-hosted.json"
    (ROOT / receipt_target).parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(receipt_path, ROOT / receipt_target)
    note_target = "docs/verification/frankl-transport128-publication.json"
    write_json(ROOT / note_target, {
        "status": "bounded transport pilot passed source, all-declaration and stock-kernel gates",
        "scope": SCOPE, "base_commit": prepared["base_commit"],
        "receipt_sha256": digest(receipt_path), "report_sha256": digest(REPORT),
        "source_sha256": report["generated_source_sha256"],
        "private_transport_proofs": 128, "accepted_registry_changed": False,
    })
    paths = prepared["publish_paths"] + [receipt_target, note_target]
    require(all(not path.startswith(".github/") for path in paths),
            "Generated publication must not change workflows")
    run(["git", "fetch", "origin", "main"])
    latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
    for path, expected in frozen.items():
        if path in prepared["publish_paths"]:
            continue
        current = git_bytes(latest, path)
        require(current is not None and arithmetic.hashlib.sha256(current).hexdigest() == expected,
                "Concurrent checked-input change: " + path)
    for path in paths:
        before, current = git_bytes(prepared["base_commit"], path), git_bytes(latest, path)
        require(current is None or current == before or current == (ROOT / path).read_bytes(),
                "Concurrent target-path collision: " + path)
    with tempfile.TemporaryDirectory(prefix="frankl-transport-index-") as directory:
        env = {**os.environ, "GIT_INDEX_FILE": str(Path(directory) / "index"),
               "GIT_AUTHOR_NAME": "github-actions[bot]", "GIT_COMMITTER_NAME": "github-actions[bot]",
               "GIT_AUTHOR_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
               "GIT_COMMITTER_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com"}
        run(["git", "read-tree", latest], env=env)
        for path in paths:
            blob = subprocess.check_output(["git", "hash-object", "-w", "--stdin"], cwd=ROOT,
                                           input=(ROOT / path).read_bytes()).decode().strip()
            run(["git", "update-index", "--add", "--cacheinfo", "100644", blob, path], env=env)
        tree = subprocess.check_output(["git", "write-tree"], cwd=ROOT, env=env, text=True).strip()
        message = ("Verify 128 explicit Frankl orbit transports with exact stock replay\n\n"
                   "Record separate target-period weights and a bounded map inventory. "
                   "Complete row coverage and full span-four assembly remain pending.\n")
        commit = subprocess.check_output(["git", "commit-tree", tree, "-p", latest],
                                         cwd=ROOT, env=env, text=True, input=message).strip()
        print(json.dumps({"publication_commit": commit, "parent": latest, "paths": paths}), flush=True)
        run(["git", "push", "origin", commit + ":refs/heads/main"])
    print(json.dumps({"published_sha": commit, "source_sha256": report["generated_source_sha256"]}, indent=2))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("prepare", "verify", "publish"))
    parser.add_argument("--jobs", type=int, default=4, choices=range(1, 5))
    args = parser.parse_args()
    if args.mode == "prepare":
        prepare()
    elif args.mode == "verify":
        verify(args.jobs)
    else:
        publish()

if __name__ == "__main__":
    main()
