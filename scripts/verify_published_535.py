#!/usr/bin/env python3
"""Strict compilation, all-owned axiom audit and stock kernel replay for a scoped proof."""
from pathlib import Path
import hashlib
import json
import subprocess
import sys
import time
import audit_lean_owned_extension as audit
import replay_lean

ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
OUT = ROOT / ".candidate-artifacts" / "published-535"
MANIFEST = ROOT / "docs/verification/published-535-targets.json"

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def run(label, command, cwd):
    path = OUT / (label + ".log")
    with path.open("w") as out:
        result = subprocess.run(command, cwd=cwd, stdout=out, stderr=subprocess.STDOUT)
    print(label + ": exit " + str(result.returncode), flush=True)
    if result.returncode:
        print(path.read_text(errors="replace")[-22000:], flush=True)
        raise RuntimeError(label + " failed")
    return path

def main():
    OUT.mkdir(parents=True, exist_ok=True)
    manifest = json.loads(MANIFEST.read_text())
    roots = manifest["roots"]
    required = manifest["required"]
    if not roots or len(roots) != len(set(roots)):
        raise ValueError("A nonempty distinct root list is required")
    closure = sorted(replay_lean.local_closure(LEAN, roots))
    if set(required) != set(closure):
        raise ValueError("Required-endpoint inventory must cover exact local closure")
    sources = {m: LEAN / (m.replace(".", "/") + ".lean") for m in closure}
    frozen = {m: digest(p) for m, p in sources.items()}
    receipt = {"status": "running", "git_head": subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": roots, "closure": closure, "required": required,
        "source_sha256": frozen, "manifest_sha256": digest(MANIFEST),
        "toolchain": (LEAN / "lean-toolchain").read_text().strip(),
        "mathlib_manifest_sha256": digest(LEAN / "lake-manifest.json")}
    receipt_path = OUT / "receipt.json"
    def save():
        receipt_path.write_text(json.dumps(receipt, indent=2) + "\n")
    save()
    start = time.monotonic()
    try:
        run("build", ["lake", "build", *roots], LEAN)
        for m, p in sources.items():
            run("strict-" + m, ["lake", "env", "lean", "-j1", "-M4500",
                "-DwarningAsError=true", str(p.relative_to(LEAN))], LEAN)
        audit_path = LEAN / "Published535Audit.lean"
        audit_path.write_text(audit.audit_source(closure, closure, required))
        audit_log = run("axioms", ["lake", "env", "lean", "-j1", "-M4500",
            "-DwarningAsError=true", str(audit_path.name)], LEAN)
        inventory = audit.validate_log(audit_log.read_text(), closure, closure, required)
        (OUT / "axiom-inventory.json").write_text(json.dumps(inventory, indent=2) + "\n")
        for root in roots:
            run("kernel-" + root, ["lake", "env", "python3",
                "../scripts/replay_lean.py", "--root", root], LEAN)
        if frozen != {m: digest(p) for m, p in sources.items()}:
            raise RuntimeError("Source changed during verification")
        receipt.update(status="passed", elapsed_seconds=time.monotonic()-start,
            all_owned_declarations=inventory["summary"],
            strict_source_compilation=True, stock_kernel_replay=True,
            allowed_axioms=list(audit.ALLOWED))
        print("Scoped proof verification passed.", flush=True)
    except BaseException as error:
        receipt.update(status="failed", elapsed_seconds=time.monotonic()-start,
            error=str(error))
        raise
    finally:
        receipt["logs"] = {p.name: digest(p) for p in OUT.glob("*.log")}
        save()
if __name__ == "__main__":
    main()
