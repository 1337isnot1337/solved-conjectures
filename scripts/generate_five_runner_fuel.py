#!/usr/bin/env python3
"""Render five-runner certificates through the structural population count.

The baseline renderer determines all data, propositions and module boundaries.
This wrapper inserts one proved FuelCuts transport before each numerical
frame proof and checks exact recovery of the original source bytes.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re

import generate_five_runner_certificates as certificates
import generate_five_runner_fast as baseline
from generate_six_speed_late_prime_batches import require, sha


ROOT = Path(__file__).resolve().parents[1]
FUEL_MODULE = "Conjectures.LonelinessModularCoverFuelCuts"
FUEL_SOUND = "SupportSearch.Bits.FuelCuts.boundedCheck_sound"
FRAME = re.compile(r"theorem frame[0-9]+_checked :")
FROZEN_FUEL_SOURCES = {
    "lean/Conjectures/LonelinessModularCoverFastCounts.lean":
        "bbc76f17ce5e115461d40d6ac0b75af9da2edb6dc1de1229bebd0dfd2e067361",
    "lean/Conjectures/LonelinessModularCoverFuelCounts.lean":
        "a9ce5f7f9c413edf96f08e5bc4230e33f9bb02cd19e1316d925ae655eba0911e",
    "lean/Conjectures/LonelinessModularCoverFuelCuts.lean":
        "d8d9fb0c0b31e07d50e8b1a58ecbaff8540cebffdb1444b492858465070ae368",
}


def transform(source: str) -> tuple[str, int]:
    """Insert only the checker-equivalence proof at each frame declaration."""
    output = []
    pending = False
    replacements = 0
    for line in source.splitlines():
        if FRAME.fullmatch(line):
            require(not pending, "Previous frame theorem has no expected proof body")
            pending = True
        if pending and line == "  decide +kernel":
            output.append("  apply " + FUEL_SOUND)
            replacements += 1
            pending = False
        output.append(line)
    require(not pending, "Final frame theorem has no expected proof body")
    if replacements:
        output.insert(0, "import " + FUEL_MODULE)
    transformed = "\n".join(output) + "\n"
    recovered = transformed
    if replacements:
        recovered = recovered.removeprefix("import " + FUEL_MODULE + "\n")
        recovered = recovered.replace("  apply " + FUEL_SOUND + "\n", "")
    require(recovered == source, "Fuel transport changed other source bytes")
    return transformed, replacements


def render(data: dict, frame_budget: int = 128, block_size: int = 128,
           root_budget: int = 8, pilot_b2: bool = False) -> tuple[dict[str, str], dict]:
    for name, digest in FROZEN_FUEL_SOURCES.items():
        require(sha((ROOT / name).read_bytes()) == digest,
                "Reviewed structural-count source differs: " + name)
    originals, original_inventory = baseline.render_baseline(
        data, frame_budget, block_size, root_budget, pilot_b2)
    emitted = {}
    transports = []
    total = 0
    for module, original in originals.items():
        source, count = transform(original)
        expected = sum(FRAME.fullmatch(line) is not None for line in original.splitlines())
        require(count == expected, "An original frame proof escaped transport")
        if count == 0:
            require(source == original, "A nonnumerical source was modified")
        emitted[module] = source
        total += count
        transports.append({"module": module, "frames": count,
                           "original_source_sha256": sha(original),
                           "source_sha256": sha(source)})
    require(total == original_inventory["numerical_check_frames_emitted"],
            "Missing numerical proof transports")
    inventory = {key: original_inventory[key] for key in (
        "prime", "scope", "complete_prime_rendered", "frame_budget", "block_size",
        "root_budget", "minimum_pairs", "root_count", "support_frames",
        "numerical_check_frames_emitted", "generated_module_count")}
    inventory.update({
        "schema": "five-runner-prime-fuel-chunks-v1",
        "source_sha256": {name: sha(content) for name, content in sorted(emitted.items())},
        "proof_transports": transports, "transported_frame_proofs": total,
        "baseline_chunks": original_inventory,
        "frozen_fuel_sources_sha256": FROZEN_FUEL_SOURCES,
        "baseline_wrapper_sha256": sha(Path(baseline.__file__).read_bytes()),
        "wrapper_sha256": sha(Path(__file__).read_bytes()),
        "original_numerical_statements_preserved": True,
        "nonnumerical_source_bytes_preserved": True,
        "acceptance": "untrusted sources; strict source, axiom and stock kernel gates pending",
    })
    return emitted, inventory


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    inputs = parser.add_mutually_exclusive_group(required=True)
    inputs.add_argument("--prime", type=int)
    inputs.add_argument("--load-json", type=Path)
    parser.add_argument("--lean-dir", type=Path, default=ROOT / "lean")
    parser.add_argument("--frame-budget", type=int, default=128)
    parser.add_argument("--block-size", type=int, default=128)
    parser.add_argument("--root-budget", type=int, default=8)
    parser.add_argument("--inventory-out", type=Path)
    parser.add_argument("--pilot-b2", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.load_json is not None:
        data = json.loads(args.load_json.read_text())
    else:
        data = certificates.prime_data(args.prime)
        data["roots"] = [certificates.search_root(data, b)
                         for b in range(2, data["half"] + 1)]
    emitted, inventory = render(data, args.frame_budget, args.block_size,
                                args.root_budget, args.pilot_b2)
    suffix = "-pilot-b2" if args.pilot_b2 else ""
    default = f"five-runner-prime{data['p']:04d}-fuel-chunks{suffix}.json"
    inventory_path = args.inventory_out or (args.load_json.with_name(default)
        if args.load_json is not None else ROOT / ".candidate-artifacts" / default)
    for name, content in emitted.items():
        path = args.lean_dir / (name.replace(".", "/") + ".lean")
        if args.check:
            require(path.is_file() and path.read_text() == content,
                    "Generated structural-count source differs: " + str(path))
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            if not path.is_file() or path.read_text() != content:
                path.write_text(content)
    encoded = json.dumps(inventory, indent=2, sort_keys=True) + "\n"
    if args.check:
        require(inventory_path.is_file() and inventory_path.read_text() == encoded,
                "Generated structural-count inventory differs: " + str(inventory_path))
    else:
        inventory_path.parent.mkdir(parents=True, exist_ok=True)
        inventory_path.write_text(encoded)
    print(json.dumps({"prime": data["p"], "scope": inventory["scope"],
                      "minimum_pairs": inventory["root_count"],
                      "frames": inventory["transported_frame_proofs"],
                      "modules": len(emitted), "check": args.check,
                      "inventory": str(inventory_path)}))


if __name__ == "__main__":
    main()
