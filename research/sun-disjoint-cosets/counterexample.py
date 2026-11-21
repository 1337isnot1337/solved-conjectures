"""Search GAP's exported right cosets for a counterexample of a given size."""

import argparse
import json
from collections import Counter, defaultdict
from functools import lru_cache
from itertools import combinations
from math import gcd
from pathlib import Path

from pysat.card import CardEnc, EncType
from pysat.formula import CNF, IDPool
from pysat.solvers import Solver


def read_group(path):
    cosets = defaultdict(set)
    anchors = defaultdict(set)
    with path.open() as stream:
        header = next(stream).split(maxsplit=4)
        order = int(header[2])
        for line in stream:
            words = line.split()
            if words[0] == "ANCHOR":
                anchors[int(words[1])].add(int(words[2]))
            else:
                index, mask = map(int, words)
                cosets[index].add(mask)
    return order, anchors, cosets


@lru_cache(maxsize=None)
def signatures(order, count, indices):
    def extend(prefix, candidates, used):
        if len(prefix) == count:
            yield prefix
            return
        for pos, index in enumerate(candidates):
            size = order // index
            if used + size > order:
                continue
            compatible = tuple(n for n in candidates[pos:] if 1 < gcd(index, n) < count)
            yield from extend(prefix + (index,), compatible, used + size)

    return sorted(extend((), indices, 0), key=lambda seq: (len(set(seq)), seq))


def find_witness(order, anchors, cosets, signature):
    required = Counter(signature)
    anchor_index = min(required, key=lambda n: (len(anchors[n]), len(cosets[n]), -required[n]))
    required[anchor_index] -= 1
    required = {n: k for n, k in required.items() if k}

    # Translate one right coset to its subgroup, then conjugate that subgroup
    # to a class representative. Both operations preserve the whole packing.
    for fixed in anchors[anchor_index]:
        eligible = {n: [c for c in cosets[n] if not (c & fixed)] for n in required}
        if any(len(candidates) < required[n] for n, candidates in eligible.items()):
            continue
        variables = IDPool()
        formula = CNF()
        memberships = [[] for _ in range(order)]
        items = {}
        for index, candidates in eligible.items():
            ids = []
            for mask in candidates:
                variable = variables.id()
                ids.append(variable)
                items[variable] = (index, mask)
                bits = mask
                while bits:
                    bit = bits & -bits
                    memberships[bit.bit_length() - 1].append(variable)
                    bits ^= bit
            formula.extend(CardEnc.atleast(ids, required[index], vpool=variables,
                                          encoding=EncType.totalizer))
        for ids in memberships:
            if len(ids) > 1:
                formula.extend(CardEnc.atmost(ids, 1, vpool=variables,
                                             encoding=EncType.seqcounter))
        with Solver(name="cadical195", bootstrap_with=formula) as solver:
            if not solver.solve():
                continue
            true = set(solver.get_model())
            witness = [(anchor_index, fixed)]
            for index, count in required.items():
                chosen = [item for var, item in items.items() if var in true and item[0] == index]
                witness.extend(chosen[:count])
            assert Counter(n for n, _ in witness) == Counter(signature)
            assert all(c in cosets[n] and n * c.bit_count() == order for n, c in witness)
            assert all(not (c & e) for (_, c), (_, e) in combinations(witness, 2))
            return witness
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("count", type=int)
    parser.add_argument("groups", nargs="+", type=Path)
    args = parser.parse_args()
    for path in args.groups:
        order, anchors, cosets = read_group(path)
        cases = signatures(order, args.count, tuple(sorted(cosets)))
        for seq in cases:
            witness = find_witness(order, anchors, cosets, seq)
            if witness is not None:
                assert all(1 < gcd(n, m) < args.count for n, m in combinations(seq, 2))
                print(json.dumps({"group": path.stem, "signature": seq, "right_cosets": witness}),
                      flush=True)
                return
        print(json.dumps({"group": path.stem, "signatures_excluded": len(cases)}), flush=True)


if __name__ == "__main__":
    main()
