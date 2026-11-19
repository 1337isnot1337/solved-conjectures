#!/usr/bin/env python3
"""Optional proof-body rendering through the equivalent counted-bit checker.

The original numerical data and theorem statements are preserved exactly.
Every frame theorem still concludes Cuts.boundedCheck = true. Only its proof
uses the proved FastCuts.boundedCheck_sound transport before kernel reduction.
The baseline producer remains unchanged and remains available for comparison.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re

import generate_six_speed_prime_certificates as baseline


FAST_MODULE = "Conjectures.LonelinessModularCoverFastCuts"
FAST_SOUND = "SupportSearch.Bits.FastCuts.boundedCheck_sound"
FRAME = re.compile(r"theorem frame[0-9]+_checked :")


def transform(source: str) -> tuple[str, int]:
    """Change exactly the one-line numerical proof of each frame declaration."""
    lines = source.splitlines()
    output = []
    pending = False
    replacements = 0
    for line in lines:
        if FRAME.fullmatch(line):
            if pending:
                raise ValueError("Previous frame theorem had no expected proof body")
            pending = True
        if pending and line == "  decide +kernel":
            output.append("  apply " + FAST_SOUND)
            replacements += 1
            pending = False
        output.append(line)
    if pending:
        raise ValueError("Final frame theorem had no expected proof body")
    if replacements:
        output.insert(0, "import " + FAST_MODULE)
    transformed = "\n".join(output) + "\n"
    # Undo exactly this rendering change to assert preservation of all other
    # source bytes, including propositions, certificate data and imports.
    recovered = transformed
    if replacements:
        recovered = recovered.removeprefix("import " + FAST_MODULE + "\n")
        recovered = recovered.replace("  apply " + FAST_SOUND + "\n", "")
    if recovered != source:
        raise ValueError("Fast rendering changed source outside the allowed proof transport")
    return transformed, replacements


def fast_files(data: dict, block_size: int = 32, combined_frame_limit: int = 32,
               layout: str = "hybrid"):
    if layout == "hybrid":
        files = baseline.pipeline_files(data, block_size, combined_frame_limit)
    elif layout == "combined":
        files = baseline.combined_files(data, block_size)
    else:
        raise ValueError("Expected hybrid or combined layout")
    total = 0
    for module, source in files:
        rendered, count = transform(source)
        total += count
        yield module, rendered
    expected = sum(len(root["frames"]) for root in data["roots"])
    if total != expected:
        raise ValueError(f"Expected {expected} frame-proof transports, found {total}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path, required=True)
    parser.add_argument("--layout", choices=("hybrid", "combined"), default="hybrid")
    parser.add_argument("--block-size", type=int, default=32)
    parser.add_argument("--combined-frame-limit", type=int, default=32)
    parser.add_argument("--only-b", type=int)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.block_size <= 0 or args.combined_frame_limit <= 0:
        parser.error("Size limits must be positive")
    data = json.loads(args.json.read_text())
    if args.only_b is not None:
        data["roots"] = [root for root in data["roots"] if root["b"] == args.only_b]
        if not data["roots"]:
            parser.error("Requested minimum pair is absent")
    files = []
    for module, source in fast_files(data, args.block_size, args.combined_frame_limit, args.layout):
        path = args.lean_dir / (module.replace(".", "/") + ".lean")
        if args.check:
            if path.read_text() != source:
                raise ValueError("Generated fast source differs: " + str(path))
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source)
        files.append({"module": module, "sha256": hashlib.sha256(source.encode()).hexdigest()})
    print(json.dumps({"p": data["p"], "layout": args.layout,
                      "roots": [root["b"] for root in data["roots"]],
                      "frames": sum(len(root["frames"]) for root in data["roots"]),
                      "generated_modules": len(files), "acceptance": "pending Lean verification"}))


if __name__ == "__main__":
    main()
