"""Build and replay the agnostic VC proof and audit its declarations."""

import json
from pathlib import Path
import subprocess
import sys
from tempfile import TemporaryDirectory

from audit_lean_all_owned import accepted_spec, audit_source, validate_log
from replay_lean import imports_of, local_closure

ROOT = "Conjectures.AgnosticVC"
REPO = Path(__file__).resolve().parents[1]
LEAN = REPO / "lean"


def main():
    modules = sorted(local_closure(LEAN, {ROOT}))
    sources = [LEAN / (module.replace(".", "/") + ".lean") for module in modules]
    if sys.argv[1:] == ["--fetch-cache"]:
        imports = {name for path in sources for name in imports_of(path)
                   if name.startswith("Mathlib.")}
        subprocess.run(["lake", "exe", "cache", "get", *sorted(imports)], cwd=LEAN, check=True)
    elif sys.argv[1:]:
        raise SystemExit("Usage: verify_agnostic_vc.py [--fetch-cache]")

    required = [name for name in accepted_spec(REPO)["required"] if name.startswith("AgnosticVC.")]
    if not required:
        raise ValueError("The shared proof audit has no registered AgnosticVC theorems")
    subprocess.run(["lake", "build", ROOT], cwd=LEAN, check=True)
    command = ["lake", "env", "lean", "-j1", "-DwarningAsError=true"]
    for path in sources:
        subprocess.run([*command, str(path)], cwd=LEAN, check=True)
    with TemporaryDirectory() as tmp:
        path = Path(tmp) / "AgnosticVCAudit.lean"
        path.write_text(audit_source(modules, required, []), encoding="utf-8")
        proc = subprocess.run([*command, str(path)], cwd=LEAN, text=True, stdout=subprocess.PIPE)
        if proc.returncode:
            print(proc.stdout)
            proc.check_returncode()
        spec = {"modules": modules, "required": required, "legacy_prefixes": []}
        result = validate_log(proc.stdout, spec, dict.fromkeys(modules, True))
        for name in required:
            if result["declarations"][name]["kind"] != "theorem":
                raise ValueError(f"Expected a theorem for {name}")
        print(json.dumps(result["summary"], indent=2), flush=True)
    subprocess.run(["lake", "env", sys.executable, str(REPO / "scripts/replay_lean.py"),
                    "--root", ROOT], cwd=LEAN, check=True)


if __name__ == "__main__":
    main()
