#!/usr/bin/env python3
"""Run the full Lean gate when any accepted source or gate input changed.

Unregistered candidate files have their own complete closure checks. A skip
here is not a proof receipt and never changes the accepted package.
"""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path

from plan_lean_candidates import changed_sources
from replay_lean import local_closure


ROOT = Path(__file__).resolve().parents[1]
GATE_INPUTS = {
    ".github/workflows/lean.yml",
    "scripts/verify_lean.sh",
    "scripts/replay_lean.py",
    "scripts/plan_accepted_lean.py",
    "scripts/plan_lean_candidates.py",
    "scripts/verify_lean_candidate.py",
    "scripts/test_plan_accepted_lean.py",
    "scripts/test_replay_lean.py",
    "lean/lean-toolchain",
    "lean/lakefile.toml",
    "lean/lake-manifest.json",
}
ROOTS = {"Solitaire", "Conjectures", "ProofAudit"}


def plan(lean: Path, changed: set[str] | None) -> dict:
    if changed is None:
        return {"run": True, "reason": "unknown changes or manual full run"}
    direct = sorted(changed & GATE_INPUTS)
    if direct:
        return {"run": True, "reason": "verification or pinned configuration changed",
                "affected": direct}
    missing = sorted(root for root in ROOTS if not (lean / (root + ".lean")).is_file())
    if missing:
        return {"run": True, "reason": "missing accepted root", "missing": missing}
    try:
        modules = local_closure(lean, ROOTS)
    except (OSError, ValueError) as exc:
        return {"run": True, "reason": "accepted closure could not be derived", "error": str(exc)}
    accepted = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
    affected = sorted(changed & accepted)
    # Conservatively rebuild for other package inputs, including generated data.
    other_inputs = sorted(name for name in changed
                          if name.startswith("lean/") and not name.endswith(".lean"))
    return {
        "run": bool(affected or other_inputs),
        "reason": "accepted inputs changed" if affected or other_inputs
                  else "no accepted source or verification input changed",
        "accepted_source_count": len(accepted),
        "affected": affected + other_inputs,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--files", nargs="*", help="inspect explicit changed paths")
    args = parser.parse_args()
    changed = set(args.files) if args.files is not None else changed_sources()
    result = plan(ROOT / "lean", changed)
    print(json.dumps(result, indent=2))
    if output := os.environ.get("GITHUB_OUTPUT"):
        with open(output, "a") as handle:
            handle.write("run=" + json.dumps(result["run"]) + "\n")


if __name__ == "__main__":
    main()
