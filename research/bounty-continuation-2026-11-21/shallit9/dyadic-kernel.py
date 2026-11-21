#!/usr/bin/env python3
"""Exact finite 2-kernel closure; no Hankel nonvanishing claim."""
from collections import deque
import hashlib
import json
from pathlib import Path

EVEN = (1, 2, 1, 3)
ODD = (2, 3, 4, 2)


def build():
    initial = (1, 2, 3, 4)
    words = {initial: ""}
    queue = deque([initial])
    while queue:
        vector = queue.popleft()
        for digit, mapping in enumerate((EVEN, ODD)):
            child = tuple(vector[state - 1] for state in mapping)
            if child not in words:
                words[child] = str(digit) + words[vector]
                queue.append(child)
    vectors = list(words)
    index = {v: i for i, v in enumerate(vectors)}
    rows = []
    for v in vectors:
        children = [tuple(v[s - 1] for s in mapping) for mapping in (EVEN, ODD)]
        rows.append({"vector": list(v), "offset_bits": words[v],
                     "depth": len(words[v]), "offset": int(words[v] or "0", 2),
                     "sections": [index[w] for w in children]})
    return {"scope": "Exact finite kernel representation, not a proof of the bounty target",
            "morphism": {"1": [1, 2], "2": [2, 3], "3": [1, 4], "4": [3, 2]},
            "kernel_size": len(rows), "states": rows,
            "constant_sections": [r for r in rows if len(set(r["vector"])) == 1]}


def main():
    result = build()
    assert result["kernel_size"] == 79
    # All four letters occur in the third iterate, so different output vectors
    # encode different infinite sequences. The closure has no duplicate sequences.
    word = [1]
    images = result["morphism"]
    for _ in range(3):
        word = [b for a in word for b in images[str(a)]]
    assert set(word) == {1, 2, 3, 4}
    result["all_letters_occurrence_witness"] = word
    output = Path(__file__).with_name("dyadic-kernel.json")
    output.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"path": str(output), "kernel_size": 79,
                      "constant_sections": [{k: r[k] for k in ("vector", "depth", "offset")} for r in result["constant_sections"]],
                      "sha256": hashlib.sha256(output.read_bytes()).hexdigest()}))


if __name__ == "__main__":
    main()
