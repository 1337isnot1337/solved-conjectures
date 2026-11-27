#!/usr/bin/env python3
"""Candidate-only verification; does not register the conjecture as complete."""
import verify_lean_candidate as gate

TASK = "hegyvari-floor-doubling-partial"
MODULES = [
    "Conjectures.HegyvariFloorDoublingTransport",
    "Conjectures.HegyvariFloorDoublingDistinct",
    "Conjectures.HegyvariFloorDoublingAlignment",
]
REQUIRED = [
    "HegyvariFloorDoubling.transport_comp",
    "HegyvariFloorDoubling.boundedGaps_of_selfTransport",
    "HegyvariFloorDoubling.boundedGaps_of_two_transports",
    "HegyvariFloorDoubling.boundedGaps_of_longRun_response",
    "HegyvariFloorDoubling.binaryStep_lower",
    "HegyvariFloorDoubling.zeroRun_expansion",
    "HegyvariFloorDoubling.oddMultiplier_response",
    "HegyvariFloorDoubling.boundedGaps_of_oddMultiplier",
    "HegyvariFloorDoubling.indexedTailComplete_to_distinctStrongComplete",
    "HegyvariFloorDoubling.binaryStep_eventuallyAbove",
    "HegyvariFloorDoubling.binaryStep_strictOnTail",
    "HegyvariFloorDoubling.binaryStep_injectiveOnTail",
    "HegyvariFloorDoubling.distinctStrongComplete_of_binarySteps",
    "HegyvariFloorDoubling.lateZeroRuns_of_not_boundedGaps",
    "HegyvariFloorDoubling.alignedZeroRuns_of_boundedGaps",
    "HegyvariFloorDoubling.alignedZeroRuns_sequence",
    "HegyvariFloorDoubling.forwardZeroRuns_of_not_transport",
    "HegyvariFloorDoubling.forwardTransport_of_no_forwardZeroRuns",
    "HegyvariFloorDoubling.disjoint_of_two_transport_criteria",
    "HegyvariFloorDoubling.disjoint_of_oddMultiplier_criteria",
]

def main():
    modules = gate.dependency_order(MODULES)
    if modules != MODULES:
        raise RuntimeError("Unexpected project closure")
    before = gate.source_hashes(modules)
    for module in modules:
        path = module.replace(".", "/") + ".lean"
        gate.run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true", path)
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
