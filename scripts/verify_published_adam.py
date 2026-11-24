#!/usr/bin/env python3
"""Verify the published Ádám counterexample without promoting it."""
import verify_lean_candidate as gate

TASK = "published-adam"
MODULES = ["Conjectures.PublishedAdam"]
REQUIRED = [
    "PublishedAdam.validS",
    "PublishedAdam.validT",
    "PublishedAdam.isomorphic",
    "PublishedAdam.noMultiplier",
    "PublishedAdam.adams_conjecture_false",
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
