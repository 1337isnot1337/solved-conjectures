#!/usr/bin/env python3
"""Verify Stern's published Goldbach disproof."""
import verify_lean_candidate as gate

TASK = "published-goldbach-lesser"
MODULES = ["Conjectures.PublishedGoldbachLesser"]
REQUIRED = [
    "PublishedGoldbachLesser.stern_5777",
    "PublishedGoldbachLesser.stern_5993",
    "PublishedGoldbachLesser.goldbach_lesser_false",
    "PublishedGoldbachLesser.goldbach_lesser_modern_false",
]


def main():
    modules = gate.dependency_order(MODULES)
    if modules != MODULES:
        raise RuntimeError("Unexpected project closure")
    before = gate.source_hashes(modules)
    for module in modules:
        gate.run("lake", "env", "lean", "-j1", "-M4500",
                 "-DwarningAsError=true", module.replace(".", "/") + ".lean")
        gate.run("lake", "build", module)
    gate.audit(MODULES, REQUIRED, modules, TASK)
    for module in modules:
        gate.run("lake", "env", "leanchecker", module)
    if gate.source_hashes(modules) != before:
        raise RuntimeError("Candidate proof inputs changed")
    gate.export_artifacts(TASK, MODULES, modules)
    print("PASS: strict source, axiom whitelist, independent kernel replay")


if __name__ == "__main__":
    main()
