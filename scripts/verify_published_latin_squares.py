#!/usr/bin/env python3
"""Verify the published Latin-square counterexample without promoting it."""
import verify_lean_candidate as gate

TASK = "published-latin-squares"
MODULES = ["Conjectures.PublishedLatinSquares"]
REQUIRED = [
    "PublishedLatinSquares.parkerA_latin",
    "PublishedLatinSquares.parkerB_latin",
    "PublishedLatinSquares.parker_orthogonal",
    "PublishedLatinSquares.euler_conjecture_false",
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
