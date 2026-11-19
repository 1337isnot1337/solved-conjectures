#!/usr/bin/env python3
"""Generate and kernel-check one row of finite critical-plane certificates.

The generated modules remain candidates until this command has checked their
sources, transitive axiom dependencies, and a separate kernel replay. A JSON
receipt records the exact source hashes checked by this invocation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
GENERATOR = ROOT / "results/five-speed-spectrum/generate_plane_certificates.py"
SUPPORT = (
    "LonelinessPlaneCertificateDefs",
    "LonelinessPlanePermutationTable",
    "LonelinessPlaneWitness",
    "LonelinessPlaneWitnessSoundness",
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(*command: str) -> None:
    print("RUN " + " ".join(command), flush=True)
    subprocess.run(command, cwd=LEAN, check=True)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--row", type=int, choices=range(8), required=True)
    args = parser.parse_args()
    os.environ["LEAN_NUM_THREADS"] = "1"

    # Build only the four small support modules and their pinned dependencies.
    run("lake", "build", "Conjectures.LonelinessPlaneWitnessSoundness")
    for name in SUPPORT:
        run("lake", "env", "leanchecker", f"Conjectures.{name}")
    names = [f"LonelinessPlaneCertificate{args.row}{j}" for j in range(8)]
    hashes = {}
    for j, name in enumerate(names):
        run("python3", str(GENERATOR), "--lean-dir", str(LEAN / "Conjectures"),
            "--block", f"{args.row}{j}")
        source = Path("Conjectures") / f"{name}.lean"
        output = Path(".lake/build/lib/lean/Conjectures") / f"{name}.olean"
        run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true",
            "-o", str(output), str(source))
        run("lake", "env", "leanchecker", f"Conjectures.{name}")
        hashes[name] = sha256(LEAN / source)
        print(f"PASS source+kernel {name} sha256={hashes[name]}", flush=True)

    audit_dir = LEAN / ".lake/plane-certificate-checks"
    audit_dir.mkdir(parents=True, exist_ok=True)
    audit = audit_dir / f"Row{args.row}Audit.lean"
    imports = "\n".join(f"import Conjectures.{name}" for name in names)
    required = ", ".join(f"`Loneliness.PlaneCertificate.checked{args.row}{j}"
                         for j in range(8))
    audit.write_text(imports + f'''
import Lean.Util.CollectAxioms
open Lean Elab Command in
run_cmd do
  let required : Array Name := #[{required}]
  for name in required do
    let _ ← getConstInfo name
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let mut count : Nat := 0
  for (name, info) in env.constants.toList do
    if name.toString.startsWith "Loneliness.PlaneCertificate." then
      if let .thmInfo _ := info then
        count := count + 1
        for axiomName in ← collectAxioms name do
          unless allowed.contains axiomName do
            throwError "Unapproved axiom {{axiomName}} in {{name}}"
  logInfo m!"PASS: {{count}} plane-certificate theorem declarations use only permitted logical axioms"
''')
    run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", str(audit))
    receipt = {
        "row": args.row,
        "commit": os.environ.get("GITHUB_SHA"),
        "generator_sha256": sha256(GENERATOR),
        "support_sha256": {
            name: sha256(LEAN / "Conjectures" / f"{name}.lean") for name in SUPPORT
        },
        "blocks_sha256": hashes,
        "source": "passed",
        "kernel": "passed",
        "axioms": ["propext", "Classical.choice", "Quot.sound"],
    }
    (audit_dir / f"row-{args.row}.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("PLANE_CERTIFICATE_RECEIPT " + json.dumps(receipt, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
