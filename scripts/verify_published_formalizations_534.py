#!/usr/bin/env python3
"""Strict scoped compilation, all-owned axiom audit, and stock replay for #534."""
from __future__ import annotations
import argparse, hashlib, json, os, re, shutil, subprocess, time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
LEAN=ROOT/"lean"
PAT=re.compile(r"Conjectures\.[A-Za-z0-9_.]+")
LEAN_SHA="bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA="12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
MATHLIB_REV="56a005855ea17e0b0958f73ec801ae140b0a1679"
def digest(path):
    h=hashlib.sha256()
    with path.open("rb") as f:
        while block:=f.read(4*1024*1024): h.update(block)
    return h.hexdigest()
def run(argv, output, *, timeout=3600):
    print("+ "+" ".join(map(str,argv)),flush=True)
    with output.open("w") as f:
        p=subprocess.run(list(map(str,argv)),cwd=LEAN,stdout=f,stderr=subprocess.STDOUT,
                         env={**os.environ,"LEAN_NUM_THREADS":"1"},timeout=timeout)
    print(output.read_text(errors="replace"),flush=True)
    if p.returncode: raise RuntimeError(f"Command failed ({p.returncode}): {argv}")
def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--list",action="store_true")
    p.add_argument("--manifest")
    args=p.parse_args()
    if args.list:
        manifests=sorted(str(x.relative_to(ROOT)) for x in
            (ROOT/"research/published-formalizations/campaign-534").glob("*/targets.json"))
        print(json.dumps({"include":[{"manifest":x,"lane":Path(x).parent.name} for x in manifests]}))
        return
    if not args.manifest: raise ValueError("--manifest is required")
    manifest=(ROOT/args.manifest).resolve()
    if not manifest.is_relative_to(ROOT/"research/published-formalizations/campaign-534"):
        raise ValueError("Unexpected manifest location")
    spec=json.loads(manifest.read_text())
    modules=spec["modules"]; required=spec["required"]
    if not modules or len(modules)!=len(set(modules)) or any(not PAT.fullmatch(x) for x in modules):
        raise ValueError("Invalid or duplicate modules")
    if not required or len(required)!=len(set(required)):
        raise ValueError("Required endpoints must be nonempty and unique")
    out=ROOT/".candidate-artifacts"/"published-534"/manifest.parent.name
    out.mkdir(parents=True,exist_ok=True)
    receipt={"status":"running","started_utc":time.strftime("%Y-%m-%dT%H:%M:%SZ",time.gmtime()),
             "manifest":str(manifest.relative_to(ROOT)),"manifest_sha256":digest(manifest),
             "head":subprocess.check_output(["git","rev-parse","HEAD"],cwd=ROOT,text=True).strip(),
             "modules":modules,"required":required,"sources":{},"gates":[]}
    def save(): (out/"receipt.json").write_text(json.dumps(receipt,indent=2)+"\n")
    save()
    try:
        if (LEAN/"lean-toolchain").read_text().strip()!="leanprover/lean4:v4.35.0":
            raise ValueError("Toolchain mismatch")
        packages=json.loads((LEAN/"lake-manifest.json").read_text())["packages"]
        if next(x["rev"] for x in packages if x["name"]=="mathlib")!=MATHLIB_REV:
            raise ValueError("Mathlib pin mismatch")
        prefix=Path(subprocess.check_output(["lake","env","lean","--print-prefix"],cwd=LEAN,text=True).strip())
        for name,expected in [("lean",LEAN_SHA),("leanchecker",CHECKER_SHA)]:
            actual=digest(prefix/"bin"/name)
            if actual!=expected: raise ValueError(f"Unexpected stock {name} binary: {actual}")
            receipt[name+"_sha256"]=actual
        import replay_lean
        closure=set()
        for module in modules: closure |= replay_lean.local_closure(LEAN,{module})
        if closure!=set(modules):
            raise ValueError(f"Manifest misses local imports: {sorted(closure-set(modules))}")
        for module in modules:
            source=LEAN/(module.replace(".","/")+".lean")
            receipt["sources"][str(source.relative_to(ROOT))]=digest(source)
            obj=LEAN/".lake/build/lib/lean"/(module.replace(".","/")+".olean")
            obj.parent.mkdir(parents=True,exist_ok=True)
            for suffix in ["",".private",".server"]:
                target=Path(str(obj)+suffix)
                if target.exists(): target.unlink()
            run(["lake","env","lean","-j1","-M4500","-DwarningAsError=true",
                 "-o",str(obj),str(source)],out/(module+".compile.log"))
            receipt["gates"].append({"gate":"strict-source","module":module,"status":"pass"})
            save()
        import audit_lean_all_owned as audit
        audit_file=LEAN/"Published534Audit.lean"
        audit_file.write_text(audit.audit_source(modules,required,spec.get("legacy_prefixes",[])))
        shutil.copyfile(audit_file,out/"audit-source.lean")
        run(["lake","env","lean","-j1","-M4500","-DwarningAsError=true",str(audit_file)],
            out/"all-owned-audit.log")
        receipt["gates"].append({"gate":"all-owned-transitive-axiom-audit","status":"pass"})
        save()
        for module in modules:
            run(["lake","env","python3",str(ROOT/"scripts/replay_lean.py"),"--root",module],
                out/(module+".kernel.log"))
            receipt["gates"].append({"gate":"stock-kernel-replay","module":module,"status":"pass"})
            save()
        receipt["status"]="pass"
    except Exception as exc:
        receipt["status"]="fail"; receipt["error"]=str(exc)
        raise
    finally:
        receipt["finished_utc"]=time.strftime("%Y-%m-%dT%H:%M:%SZ",time.gmtime())
        save()
        print("PUBLISHED534-RECEIPT "+json.dumps(receipt,sort_keys=True),flush=True)
if __name__=="__main__": main()
