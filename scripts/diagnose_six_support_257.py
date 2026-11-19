#!/usr/bin/env python3
"""Expose the kernel result for the exact literal p257 tape goal.

This is a reduction diagnostic, not a proof acceptance gate. The generated
source is checked separately from the repository's registered Lean roots.
No axiom audit or independent kernel replay is claimed by this script.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import signal
import subprocess
import time


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
PROBE = LEAN / "Conjectures/LonelinessSixSpeedSupport257Probe.lean"
DEFINITIONS = ("inverseData", "inverse", "coverTable", "compatibleTable", "nodeData", "lookup", "tree")

RAW_TACTIC = """open Lean Meta Elab Tactic in
elab "kernel_decide_raw" : tactic => do
  let goal ← getMainGoal
  withMainContext do
    let type ← instantiateMVars (← goal.getType)
    let proof ← mkDecideProof type
    let name ← withOptions (Elab.async.set · false) do
      mkAuxLemma [] type proof (cache := false)
    goal.assign (mkConst name)
  replaceMainGoal []
"""


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def generated_source(source: str) -> tuple[str, dict]:
    starts = list(re.finditer(r"^(def|theorem) (\w+)\b", source, re.M))
    blocks = {}
    for index, match in enumerate(starts):
        if match.group(1) != "def":
            continue
        end = starts[index + 1].start() if index + 1 < len(starts) else source.index("\nend\n", match.start())
        blocks[match.group(2)] = source[match.start():end]
    if tuple(blocks) != DEFINITIONS:
        raise ValueError(f"Unexpected probe definition layout: {tuple(blocks)}")

    target = re.search(r"^theorem tape_checked\s*:\s*(.*?)\s*:=\s*by", source, re.M | re.S)
    if target is None:
        raise ValueError("The original tape_checked statement was not found")
    literal_target = target.group(1)
    masks = {}
    expressions = {
        "selected": r"\(InitialBits.encode\s+\(InitialSupport.selected\s+20\)\)",
        "available": r"\(InitialBits.encode\s+\(InitialSupport.available\s+257\s+inverse\s+20\)\)",
        "uncovered": r"\(InitialBits.encode\s+\(InitialSupport.uncovered\s+7\s+257\s+20\)\)",
    }
    for name, expression in expressions.items():
        theorem = re.search(rf"^theorem {name}_mask_checked\s*:\s*(.*?)\s*=\s*(\d+)\s*:=\s*by",
                            source, re.M | re.S)
        if theorem is None:
            raise ValueError(f"Missing literal mask equation: {name}")
        masks[name] = theorem.group(2)
        literal_target, replacements = re.subn(expression, masks[name], literal_target)
        if replacements != 1:
            raise ValueError(f"Expected one {name} mask in the tape target, got {replacements}")
    if "InitialBits.encode" in literal_target:
        raise ValueError("The diagnostic target still contains an encoded initial state")
    depth = re.search(r"^set_option maxRecDepth (\d+)\s*$", source, re.M)
    if depth is None:
        raise ValueError("The probe's original recursion-depth setting was not found")

    namespace = "Loneliness.Modular.SixSpeed.SupportRawDiagnostic"
    preamble = f"""import Conjectures.LonelinessModularInitialMemo
import Init.Data.RArray
import Lean.Elab.Tactic.Decide

/-! Generated reduction diagnostic only. This file is not an accepted proof
module and its result is not an axiom-audit or independent-replay receipt.
The original probe's data definitions and literal tape target are preserved. -/

{RAW_TACTIC}
namespace {namespace}

noncomputable section
set_option maxRecDepth {depth.group(1)}
set_option maxHeartbeats 0

"""
    generated = (preamble + "\n".join(blocks.values())
                 + "theorem literal_tape_goal :\n    " + literal_target + " := by\n"
                 + "  kernel_decide_raw\n\nend\nend " + namespace + "\n")
    return generated, {"preserved_definitions": list(DEFINITIONS),
                       "literal_masks": masks, "max_rec_depth": int(depth.group(1)),
                       "original_tape_statement": " ".join(target.group(1).split()),
                       "literal_tape_statement": " ".join(literal_target.split())}


def run(command: list[str], timeout: int, log: Path) -> dict:
    started = time.monotonic()
    print(json.dumps({"command": command, "timeout_seconds": timeout}), flush=True)
    with log.open("w") as stream:
        process = subprocess.Popen(command, cwd=LEAN,
                                   env={**os.environ, "LEAN_NUM_THREADS": "1"},
                                   stdout=stream, stderr=subprocess.STDOUT,
                                   start_new_session=True)
        timed_out = False
        try:
            code = process.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            timed_out = True
            os.killpg(process.pid, signal.SIGTERM)
            try:
                code = process.wait(timeout=3)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                code = process.wait()
    result = {"command": command, "exit_code": code, "timeout": timed_out,
              "elapsed_seconds": round(time.monotonic() - started, 2),
              "log": log.name, "log_sha256": sha(log)}
    print(json.dumps(result), flush=True)
    print(log.read_text()[-16000:], flush=True)
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-only", action="store_true", help="generate/hash the diagnostic without invoking Lean")
    parser.add_argument("--output", type=Path, default=ROOT / ".candidate-artifacts/diagnostic-six-support-257")
    parser.add_argument("--dependency-timeout", type=int, default=1200)
    parser.add_argument("--target-timeout", type=int, default=300)
    args = parser.parse_args()
    if args.dependency_timeout <= 0 or args.target_timeout <= 0:
        parser.error("timeouts must be positive")
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    generated, metadata = generated_source(PROBE.read_text())
    diagnostic = output / "SupportProbeRawLiteral.lean"
    diagnostic.write_text(generated)
    receipt = {
        "purpose": "reduction-diagnostic-only",
        "accepted": False,
        "axiom_audited": False,
        "independently_replayed": False,
        "stage": "prepared",
        "probe_sha256": sha(PROBE),
        "script_sha256": sha(Path(__file__)),
        "generated_source_sha256": sha(diagnostic),
        "configuration_sha256": {name: sha(LEAN / name)
                                 for name in ("lean-toolchain", "lakefile.toml", "lake-manifest.json")},
        **metadata,
        "commands": [],
    }
    receipt_path = output / "diagnostic.json"

    def save():
        receipt_path.write_text(json.dumps(receipt, indent=2, sort_keys=True) + "\n")

    save()
    if args.prepare_only:
        print(json.dumps({"diagnostic": str(diagnostic), "receipt": str(receipt_path),
                          "accepted": False, "lean_invoked": False}, indent=2))
        return 0
    dependency = run(["lake", "build", "Conjectures.LonelinessModularInitialMemo"],
                     args.dependency_timeout, output / "dependencies.log")
    receipt["commands"].append(dependency)
    if dependency["exit_code"] != 0:
        receipt["stage"] = "dependency_timeout" if dependency["timeout"] else "dependency_failure"
        save()
        return 1
    target = run(["lake", "env", "lean", "-j1", "-M4500", "-Dlinter.all=false",
                  "--root=" + str(output), str(diagnostic)],
                 args.target_timeout, output / "raw-kernel.log")
    receipt["commands"].append(target)
    receipt["stage"] = ("literal_goal_source_check_passed" if target["exit_code"] == 0 else
                        "target_timeout" if target["timeout"] else "target_failed")
    save()
    print("Diagnostic only: no acceptance, axiom-audit, or independent-replay result.", flush=True)
    return 0 if target["exit_code"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
