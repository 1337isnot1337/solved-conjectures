#!/usr/bin/env python3
"""Render bounded six-speed packets through the proved structural count.

Only the numerical proof transport changes. Every proposition and every byte of
certificate data comes from the existing hybrid producer and is checked by exact
recovery of that producer's source. Generation makes no Lean verification claim.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
import re

import generate_six_speed_prime_certificates as baseline


ROOT = Path(__file__).resolve().parents[1]
FUEL_MODULE = "Conjectures.LonelinessModularCoverFuelCuts"
FUEL_SOUND = "SupportSearch.Bits.FuelCuts.boundedCheck_sound"
FRAME = re.compile(r"theorem frame[0-9]+_checked :")
FROZEN_HELPERS = {
    "lean/Conjectures/LonelinessModularCoverFastCounts.lean":
        "bbc76f17ce5e115461d40d6ac0b75af9da2edb6dc1de1229bebd0dfd2e067361",
    "lean/Conjectures/LonelinessModularCoverFuelCounts.lean":
        "a9ce5f7f9c413edf96f08e5bc4230e33f9bb02cd19e1316d925ae655eba0911e",
    "lean/Conjectures/LonelinessModularCoverFuelCuts.lean":
        "d8d9fb0c0b31e07d50e8b1a58ecbaff8540cebffdb1444b492858465070ae368",
}


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def transform(source):
    output = []
    pending = False
    replacements = 0
    for line in source.splitlines():
        if FRAME.fullmatch(line):
            require(not pending, "Previous numerical theorem has no expected proof body")
            pending = True
        if pending and line == "  decide +kernel":
            output.append("  apply " + FUEL_SOUND)
            replacements += 1
            pending = False
        output.append(line)
    require(not pending, "Final numerical theorem has no expected proof body")
    if replacements:
        output.insert(0, "import " + FUEL_MODULE)
    rendered = "\n".join(output) + "\n"
    recovered = rendered
    if replacements:
        recovered = recovered.removeprefix("import " + FUEL_MODULE + "\n")
        recovered = recovered.replace("  apply " + FUEL_SOUND + "\n", "")
    require(recovered == source, "Transport changed data, propositions, or other proof bytes")
    return rendered, replacements


def fuel_files(data, block_size=32, combined_frame_limit=32, layout="hybrid"):
    require(block_size == 32 and combined_frame_limit == 32 and layout == "hybrid",
            "Unreviewed packet layout")
    for path, digest in FROZEN_HELPERS.items():
        require(hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == digest,
                "Reviewed structural-count source differs: " + path)
    total = 0
    for module, source in baseline.pipeline_files(data, block_size, combined_frame_limit):
        rendered, count = transform(source)
        expected = sum(FRAME.fullmatch(line) is not None for line in source.splitlines())
        require(count == expected, "A numerical theorem escaped transport")
        if count == 0:
            require(rendered == source, "Nonnumerical source changed")
        total += count
        yield module, rendered
    require(total == sum(len(root["frames"]) for root in data["roots"]),
            "Missing or duplicated numerical proof transport")
