#!/usr/bin/env python3
"""Recover frozen arithmetic candidates and publish only after a fresh g00 gate.

The public generators and their exact byte hashes are the recovery inputs.
A temporary Git index preserves unrelated main-branch work. A normal
fast-forward push rejects a concurrent branch change. No accepted registry is
modified; the remaining groups have independent jobs.
"""
from __future__ import annotations
import argparse
import copy
import gzip
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
RESULTS = ROOT / "results/frankl-generator-families"
ARTIFACT = ROOT / ".candidate-artifacts/frankl-weight-recovery"
EXPECTED_MANIFEST = "18246e0188eedf9ca9074b1d8bec301cc70f0ee4570aa20d0ee36789378a2ebc"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
FIXED = {
    "lean/Conjectures/FranklSmallCyclicOrbitArithmetic.lean":
        "de56e1f63a989f12c33a579b8872b1f9dd476c450d9550a6ea82865fa4fa5be9",
    "results/frankl-generator-families/generate_small_cyclic_weight_orbits_lean.py":
        "0b76101f569fca1174dff11c0a6c69caf85d4ea69a10197a1780cdfd69574f94",
    "results/frankl-generator-families/generate_small_cyclic_weight_orbit_batches.py":
        "049ff677839e1498a6cfba0ef1ddd11eb27eaccb0ea57b8096ea345380745619",
    "results/frankl-generator-families/small_cyclic_weight_orbits.json.gz":
        "0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c",
    "results/frankl-generator-families/width_four_weight_candidates.json":
        "5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a",
    "scripts/verify_frankl_orbit_batches.py":
        "078252c8a8298cae564b6646be15eaa6432a4890d1dba7a1f6916a131797e7cf",
    "scripts/test_frankl_orbit_batches.py":
        "23854104469bbb843d4b1f3c51976f062e0061d8ca850cd29850cb408e40c203",
    "scripts/templates/lean-frankl-orbit-batches.yml":
        "b0178182e22345ee32249f847decdec353f2a019b689a57defe14a1e3aaf5333",
    "results/frankl-generator-families/generate_span_four_literal_weight_orbits.py":
        "e450662bd086324955bc83688e8004c43a9a65c8032c593d973e973dbb84fad1",
    "results/frankl-generator-families/replay_span_four_literal_weight_orbits.py":
        "9f1a970ff23fb892fbce6af1f25fc5e89fb66100812ee1c2ef67d5496767d432",
}
PILOT = {
    "FranklSmallCyclicOrbit128Data.lean":
        "3cb2841c616a7bae404ebd16bcc4bb34b3dcb1471add46ad0bc7e24eb61cb566",
    "FranklSmallCyclicOrbit128Pilot.lean":
        "d5ea291a87df2ff383cc6f2e41f6d3d1bb995e12c0a8ea0bd34a91a06cc3dd9b",
}

def require(condition, message):
    if not condition:
        raise RuntimeError(message)

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

def digest(path):
    return sha(Path(path).read_bytes())

def run(args, **kwargs):
    print("+ " + " ".join(map(str, args)), flush=True)
    return subprocess.run(list(map(str, args)), cwd=ROOT, check=True, **kwargs)

def check_fixed():
    for path, expected in FIXED.items():
        require(digest(ROOT / path) == expected, "Recovery input differs: " + path)

def read_json(path):
    return json.loads(Path(path).read_text())

def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")

def prepare():
    check_fixed()
    ARTIFACT.mkdir(parents=True, exist_ok=True)
    workflow = ROOT / ".github/workflows/lean-frankl-orbit-batches.yml"
    template = ROOT / "scripts/templates/lean-frankl-orbit-batches.yml"
    if workflow.exists():
        require(workflow.read_bytes() == template.read_bytes(), "Existing workflow differs")
    else:
        shutil.copyfile(template, workflow)
    run([sys.executable, RESULTS / "generate_small_cyclic_weight_orbits_lean.py",
         "--report", ARTIFACT / "pilot-reproduction.json"])
    for name, expected in PILOT.items():
        require(digest(ROOT / "lean/Conjectures" / name) == expected,
                "Frozen pilot recovery differs: " + name)
    run([sys.executable, RESULTS / "generate_small_cyclic_weight_orbit_batches.py"])
    manifest_path = RESULTS / "small_cyclic_weight_orbit_batches.json"
    require(digest(manifest_path) == EXPECTED_MANIFEST,
            "Regenerated 75-block manifest differs from the pre-outage hash")
    manifest = read_json(manifest_path)
    paths = ["lean/Conjectures/" + name for block in manifest["blocks"]
             for name in block["source_sha256"]]
    require(len(paths) == 150 and len(set(paths)) == 150, "Expected exactly150 source files")
    for block in manifest["blocks"]:
        for name, expected in block["source_sha256"].items():
            require(digest(ROOT / "lean/Conjectures" / name) == expected, "Block hash differs: " + name)
    run([sys.executable, RESULTS / "generate_span_four_literal_weight_orbits.py",
         "--report", ARTIFACT / "literal-ten-producer.json"])
    p10 = RESULTS / "literal_ten_weight_orbits.json.gz"
    run([sys.executable, RESULTS / "generate_span_four_literal_weight_orbits.py",
         "--output", ARTIFACT / "literal-ten-reproduced.json.gz",
         "--report", ARTIFACT / "literal-ten-reproduction.json"],
        env={**os.environ, "PYTHONHASHSEED": "7"})
    require(p10.read_bytes() == (ARTIFACT / "literal-ten-reproduced.json.gz").read_bytes(),
            "Period-ten reconstruction is not deterministic")
    run([sys.executable, RESULTS / "replay_span_four_literal_weight_orbits.py",
         "--report", ARTIFACT / "literal-ten-replay.json"])
    verifier_path = RESULTS / "replay_span_four_literal_weight_orbits.py"
    spec = importlib.util.spec_from_file_location("independent_literal_ten_replay", verifier_path)
    verifier = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(verifier)
    packet = json.loads(gzip.decompress(p10.read_bytes()))
    original = read_json(RESULTS / "width_four_weight_candidates.json")
    short = json.loads(gzip.decompress((RESULTS / "small_cyclic_weight_orbits.json.gz").read_bytes()))
    mutations = []
    for label in ("missing_row", "bad_map", "zero_weight", "noninteger_period"):
        bad = copy.deepcopy(packet)
        if label == "missing_row":
            bad["members"].pop()
        elif label == "bad_map":
            bad["members"][0]["point_map"][0][1] = 10
        elif label == "zero_weight":
            bad["members"][0]["entry"]["weights"] = [0, 0, 0, 0]
        else:
            bad["members"][0]["period"] = 10.0
        try:
            verifier.validate(bad, original, short)
        except (ValueError, KeyError, TypeError) as error:
            mutations.append({"case": label, "rejected": True, "reason": str(error)})
        else:
            raise RuntimeError("Independent verifier accepted mutation: " + label)
    p10_manifest = {"schema": "frankl-literal-ten-weight-orbits-v2-manifest",
                    "status": "Independent candidate replay passed; Lean arithmetic and all transports pending.",
                    "producer": read_json(ARTIFACT / "literal-ten-producer.json"),
                    "independent_replay": read_json(ARTIFACT / "literal-ten-replay.json"),
                    "byte_reproduction": True, "invalid_witness_tests": mutations,
                    "recovery_note": "Producer and packet metadata were reconstructed after the local outage. No equality to the lost v1 source bytes is claimed."}
    write_json(RESULTS / "literal_ten_weight_orbits_manifest.json", p10_manifest)
    paths += ["lean/Conjectures/" + name for name in PILOT]
    paths += [".github/workflows/lean-frankl-orbit-batches.yml",
              "results/frankl-generator-families/small_cyclic_weight_orbit_batches.json",
              "results/frankl-generator-families/literal_ten_weight_orbits.json.gz",
              "results/frankl-generator-families/literal_ten_weight_orbits_manifest.json"]
    require(len(paths) == len(set(paths)), "Repeated publication path")
    frozen = {path: digest(ROOT / path) for path in paths}
    for path in FIXED:
        frozen[path] = digest(ROOT / path)
    for path in ("lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
                 "scripts/recover_frankl_weight_batches.py", ".github/workflows/frankl-weight-recovery.yml"):
        frozen[path] = digest(ROOT / path)
    record = {"status": "candidate source reconstruction passed; g00 fresh proof gate still required",
              "base_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
              "frozen_short_manifest_sha256": EXPECTED_MANIFEST,
              "frozen_pilot_hashes": PILOT, "generated_source_files": 152,
              "publish_paths": sorted(paths), "frozen_paths": frozen,
              "period10_recovery": p10_manifest}
    write_json(ARTIFACT / "preparation.json", record)
    print(json.dumps({"status": record["status"], "generated_sources": 152,
                      "manifest_sha256": EXPECTED_MANIFEST}, indent=2))

def git_bytes(commit, path):
    result = subprocess.run(["git", "show", commit + ":" + path], cwd=ROOT,
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return result.stdout if result.returncode == 0 else None

def publish():
    check_fixed()
    prepared = read_json(ARTIFACT / "preparation.json")
    for path, expected in prepared["frozen_paths"].items():
        require(digest(ROOT / path) == expected, "Recovered source changed before publication: " + path)
    receipt_path = ROOT / ".candidate-artifacts/frankl-orbit-g00/receipt.json"
    receipt = read_json(receipt_path)
    require(receipt.get("status") == "passed" and receipt.get("all_frozen_hashes_unchanged") is True,
            "A complete fresh g00 gate is required")
    require(len(receipt["project_modules"]) == 30 and receipt["group"]["rows"] == 512 and
            receipt["axiom_audit"]["private_arithmetic_chunks_visible"] == 256 and
            receipt["kernel_replay"]["exact_project_closure"] is True,
            "g00 proof coverage differs")
    require(receipt["toolchain"]["checker_sha256"] == CHECKER_SHA256, "Wrong stock checker")
    source_paths = {"lean/" + module.replace(".", "/") + ".lean": expected
                    for module, expected in receipt["source_sha256"].items()}
    for path, expected in source_paths.items():
        require(digest(ROOT / path) == expected, "Checked source changed: " + path)
    receipt_target = "docs/verification/frankl-orbit-g00-recovery.json"
    (ROOT / receipt_target).parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(receipt_path, ROOT / receipt_target)
    note_target = "docs/verification/frankl-weight-recovery.json"
    note = {**prepared, "status": "recovered candidates plus freshly verified g00",
            "g00_receipt_sha256": digest(receipt_path),
            "g00_modules": 30, "g00_rows": 512, "g00_private_chunks": 256,
            "remaining_groups": ["g" + str(i).zfill(2) for i in range(1, 19)],
            "accepted_registry_changed": False,
            "scope": "Only g00 is newly formally verified here. Other arithmetic blocks and period-ten data remain candidates; full transport and span-four conclusions are pending."}
    write_json(ROOT / note_target, note)
    paths = prepared["publish_paths"] + [receipt_target, note_target]
    run(["git", "fetch", "origin", "main"])
    latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
    base = prepared["base_commit"]
    generated = set(prepared["publish_paths"])
    for path, expected in {**prepared["frozen_paths"], **source_paths}.items():
        if path in generated:
            continue
        require(sha(git_bytes(latest, path) or b"") == expected,
                "Concurrent main changed a recovery or checked input: " + path)
    for path in paths:
        before, current = git_bytes(base, path), git_bytes(latest, path)
        require(current is None or current == before or current == (ROOT / path).read_bytes(),
                "Concurrent publication path collision: " + path)
    with tempfile.TemporaryDirectory(prefix="frankl-recovery-index-") as directory:
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
        message = ("Recover bounded Frankl arithmetic candidates after fresh g00 proof gate\n\n"
                   "Reproduce the frozen 75-block manifest and 128-row pilot hashes. "
                   "Record a fresh exact 30-module source/axiom/stock-kernel gate for512 rows. "
                   "Keep other blocks and reconstructed period-ten transports explicitly candidate data.\n")
        commit = subprocess.check_output(["git", "commit-tree", tree, "-p", latest],
                                         cwd=ROOT, env=env, text=True, input=message).strip()
        run(["git", "push", "origin", commit + ":refs/heads/main"])
    if output := os.environ.get("GITHUB_OUTPUT"):
        with open(output, "a") as handle:
            handle.write("published_sha=" + commit + "\n")
            handle.write("groups=" + json.dumps(note["remaining_groups"], separators=(",", ":")) + "\n")
    print(json.dumps({"published_sha": commit, "parent": latest, "paths": len(paths),
                      "remaining_groups": note["remaining_groups"]}, indent=2))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("prepare", "publish"))
    args = parser.parse_args()
    (prepare if args.mode == "prepare" else publish)()

if __name__ == "__main__":
    main()
