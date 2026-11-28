#!/usr/bin/env python3
"""Replay the existing Caiolo–Ferroni–Hoster proof against the mission goal."""

from pathlib import Path
import re
import subprocess
import tempfile

from sync import ROOT, lean_env, load_mission


def main():
    repo_modules = ROOT.parents[1] / "lean" / "Conjectures"
    mission = load_mission(ROOT / "missions" / "caiolo-ferroni-hoster" / "mission.json")
    goal = mission["items"][mission["goal"]]
    definitions = mission["items"]["CaioloFerroniHosterRankFive"]
    with tempfile.TemporaryDirectory(prefix="prove2me-proof-") as directory:
        build = Path(directory)
        env = lean_env(build)
        (build / "Conjectures").mkdir()
        compiled = set()

        def lean(file, *args, capture_output=False):
            return subprocess.run(["lean", "-j2", f"--root={build}", *args, str(file)],
                                  cwd=ROOT, env=env, check=True, text=True, capture_output=capture_output)

        def build_module(name):
            if name in compiled:
                return
            source = (repo_modules / f"{name}.lean").read_text(encoding="utf-8")
            for dependency in re.findall(r"^import Conjectures\.(\w+)$", source, re.MULTILINE):
                build_module(dependency)
            if name == "CaioloFerroniHosterArithmetic":
                source = source.replace("import Mathlib.Basic.Real.Basic", "import Mathlib.Data.Real.Basic", 1)
            file = build / "Conjectures" / f"{name}.lean"
            file.write_text(source, encoding="utf-8")
            print(f"Replaying {name}", flush=True)
            lean(file, "-o", str(file.with_suffix(".olean")))
            compiled.add(name)

        build_module("CaioloFerroniHoster")
        # Separate the uploaded definitions by namespace so Lean can compare them with the original ones.
        bundle = build / "PilotDefinitions.lean"
        bundle.write_text(definitions["definition"].replace("namespace CaioloFerroniHoster", "namespace PilotModel")
                          .replace("end CaioloFerroniHoster", "end PilotModel") + "\n", encoding="utf-8")
        lean(bundle, "-DautoImplicit=false", "-DwarningAsError=true", "-o", str(bundle.with_suffix(".olean")))
        preamble = goal["preamble"].replace("import Definitions.Def_CaioloFerroniHosterRankFive",
                                            "import PilotDefinitions\nimport Conjectures.CaioloFerroniHoster")
        preamble = preamble.replace("open CaioloFerroniHoster", "open PilotModel")
        statement = goal["formal_statement"].replace(f"theorem {mission['goal']}", "theorem pilot_replay", 1)
        statement = statement.removesuffix(":= by sorry")
        proof = build / "PilotReplay.lean"
        proof.write_text(f"{preamble}\n\n{statement}:= {mission['goal']} q hprime hq\n\n"
                         "#print axioms pilot_replay\n", encoding="utf-8")
        result = lean(proof, "-DautoImplicit=false", "-DwarningAsError=true", capture_output=True)
        print(result.stdout.strip())
        axioms = re.search(r"depends on axioms: \[([^\]]*)\]", result.stdout)
        if axioms is None or set(axioms[1].split(", ")) - {"propext", "Classical.choice", "Quot.sound"}:
            raise SystemExit("Unexpected axiom audit output for the pilot theorem")


if __name__ == "__main__":
    main()
