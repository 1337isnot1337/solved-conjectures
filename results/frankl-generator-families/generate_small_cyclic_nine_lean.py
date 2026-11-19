#!/usr/bin/env python3
"""Generate exact union-table certificates for all nine-letter residual prefixes.

All proposed tables are checked by the proved Lean mask checker. The
residual-edge list is read from its literal Lean declaration, and the
generated aggregate also kernel-checks that every nonzero prefix is covered.
"""

from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
LEAN = ROOT / "lean" / "Conjectures"
TILES = (7, 11, 13, 15)


def generators(word: tuple[int, ...]) -> list[int]:
    answer: list[int] = []
    for p, letter in enumerate(word):
        for t, shape in enumerate(TILES):
            if letter >> t & 1:
                mask = 0
                for j in range(4):
                    if shape >> j & 1:
                        mask |= 1 << ((p + j) % 9)
                answer.append(mask)
    return answer


def unions(gs: list[int]) -> list[int]:
    family = {0}
    for g in gs:
        family |= {u | g for u in family}
    return sorted(family)


def word_literal(word: tuple[int, ...]) -> str:
    return "[" + ", ".join(map(str, word)) + "]"


def set_literal(values: list[int]) -> str:
    return "{" + ", ".join(map(str, values)) + "}"


def main() -> None:
    source = (LEAN / "FranklSmallCyclicResidual.lean").read_text()
    body = source.split("def residualEdges : Finset (List ℕ) :=", 1)[1].split(
        "theorem residual_edge_facts", 1
    )[0].strip()
    assert body.startswith("{") and body.endswith("}")
    edges = {tuple(w) for w in json.loads("[" + body[1:-1] + "]")}
    words = edges
    for _ in range(2):
        words = {w + (a,) for w in words for a in range(16) if w[-6:] + (a,) in edges}
    assert len(words) == 64 and (0,) * 9 in words
    nonzero = sorted(words - {(0,) * 9})
    chunks = [nonzero[i : i + 8] for i in range(0, len(nonzero), 8)]
    for index, chunk in enumerate(chunks):
        lines = [
            "module", "", "public import Conjectures.FranklSmallCyclicNineWords", "",
            "/-! Generated exact distinct-union tables. Every table is checked",
            "by the Lean kernel; the producer supplies no trusted counts. -/",
            "@[expose] public section", "", "namespace FranklSmallCyclic", "",
            f"def nineChunk{index} : Finset (List ℕ) :=",
            "  {" + ",\n   ".join(word_literal(w) for w in chunk) + "}", "",
        ]
        for j, w in enumerate(chunk):
            gs = generators(w)
            table = unions(gs)
            frequency = sum(u & 1 != 0 for u in table)
            assert len(table) <= 2 * frequency
            lines.extend([
                "set_option maxRecDepth 100000 in",
                "set_option maxHeartbeats 0 in",
                f"private theorem checked{index}_{j} :",
                f"    maskCertificate 9 (wordMasksNine {word_literal(w)})",
                f"      {set_literal(table)} 0 = true := by decide +kernel", "",
            ])
        lines.extend([
            f"theorem nineChunk{index}_abundant {{w : List ℕ}} (hw : w ∈ nineChunk{index}) :",
            "    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by",
            f"  simp only [nineChunk{index}, Finset.mem_insert, Finset.mem_singleton] at hw",
            "  rcases hw with " + " | ".join("rfl" for _ in chunk),
        ])
        lines.extend(f"  · exact maskCertificate_abundant checked{index}_{j}" for j in range(len(chunk)))
        lines.extend(["", "end FranklSmallCyclic", ""])
        target = LEAN / f"FranklSmallCyclicNineData{index}.lean"
        target.write_text("\n".join(lines))
        print(target, "tables", len(chunk))
    lines = ["module", ""]
    lines.extend(f"public import Conjectures.FranklSmallCyclicNineData{i}" for i in range(len(chunks)))
    lines.extend([
        "", "/-! Complete checked coverage of all nonzero nine-site residual prefixes. -/",
        "@[expose] public section", "", "namespace FranklSmallCyclic", "",
        "set_option maxRecDepth 100000 in", "set_option maxHeartbeats 0 in",
        "theorem nonzeroNineCandidates_eq : nonzeroNineCandidates =",
        "    " + " ∪ ".join(f"nineChunk{i}" for i in range(len(chunks))) + " := by decide +kernel", "",
        "theorem nine_candidate_abundant {w : List ℕ} (hw : w ∈ nonzeroNineCandidates) :",
        "    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by",
        "  rw [nonzeroNineCandidates_eq] at hw",
        "  simp only [Finset.mem_union, or_assoc] at hw",
        "  rcases hw with " + " | ".join(f"h{i}" for i in range(len(chunks))),
    ])
    lines.extend(f"  · exact nineChunk{i}_abundant h{i}" for i in range(len(chunks)))
    lines.extend(["", "end FranklSmallCyclic", ""])
    target = LEAN / "FranklSmallCyclicNineData.lean"
    target.write_text("\n".join(lines))
    print(target, "total tables", len(nonzero))


if __name__ == "__main__":
    main()
