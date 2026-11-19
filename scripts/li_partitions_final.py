"""Witness edge masks for every integer partition of 31, for Li's 31-vertex tree.

This script regenerates the 6,842 rows of the edge-cut certificate consumed by
`lean/Conjectures/LiPartitionsFinal.lean` and verifies them.

The tree is the one from `lean/Conjectures/LiBasic.lean` (`Li.T`): vertices
0..30, with the 30 edges given by the consecutive vertices of the five paths

    (0, 1), (0, 2, 3), (0, 4, ..., 14), (8, 15), (0, 16, ..., 30).

That is exactly the order of `Li.pathEdges`; the script rebuilds the adjacency
relation of `Li.T` from those five paths and re-derives the edge list, asserting
that it is the path order.  Bit `i` of a 30-bit mask refers to the `i`-th edge of
that list, and a **set** bit means the edge is **cut** (removed).  The kept edges
therefore form a spanning subgraph (an edge cut, here always a forest) of `Li.T`.

For every one of the 6,842 integer partitions of 31 the script produces one cut
mask whose connected-component-size multiset is the partition.  Masks come from
an exact edge-cut dynamic program over the 2^30 edge subsets; every mask is then
re-checked with an independent union-find and an independent breadth-first
search, and the script checks that

* the set of realized partitions is precisely the set of partitions of 31;
* the state multiplicities sum to 2^30 (a bijective decomposition of edge subsets);
* the rows are pairwise distinct and cover every partition exactly once;
* the canonical row data hash to `REFERENCE_SHA256`.

`--independent` runs a second, exhaustive block search (all 2^30 edge subsets,
grouped by the component types of two 15-edge subtrees) and requires it to
reproduce the same rows.

Lean data conventions (see `lean_chunks`), which are the columns the Lean
development reads:

* the partition column is the decreasing list of positive component sizes,
  as required by `LiFinal.rowOk`;
* the mask column is exactly the integer above (bit `i` set = mask bit `i`).

Standard library only.  Usage:

    python scripts/li_partitions_final.py                  # verify + summary
    python scripts/li_partitions_final.py --independent    # + block-search check
    python scripts/li_partitions_final.py --lean [FILE]    # write the Lean data chunks
    python scripts/li_partitions_final.py --check FILE     # audit a Lean data file
"""

import hashlib
import re
import sys
from collections import Counter

N = 31
PATHS = [(0, 1), (0, 2, 3), (0, *range(4, 15)), (8, 15), (0, *range(16, 31))]
EDGES = [(u, v) for path in PATHS for u, v in zip(path, path[1:])]
assert len(EDGES) == 30
assert len({frozenset(e) for e in EDGES}) == 30

# Rows per Lean data chunk; each chunk gets its own `decide` proof.
CHUNK = 500

# `sha256` of the `partitions` block of `results/li-coefficient-sign/li_certificate_data.json`,
# i.e. of the same 6,842 `(partition, mask)` rows produced by that independent run.
REFERENCE_SHA256 = "30f51845828f4ec7b33a3762698b5a02148368d63a3503da3f496336f5f0fffd"

# The first 15 edges span vertices 0..15; the last 15 span 0,16..30.
# These subtrees intersect only at vertex 0.
SPLIT_EDGE = 15


def tree_edges():
    """The edges of `Li.T` as `(min, max)` pairs, sorted.

    `Li.T.Adj u v` holds iff `u ≠ v` and `(u, v)` or `(v, u)` is a consecutive
    pair of one of the five vertex paths.
    """
    def adjacent(u, v):
        for path in PATHS:
            for a, b in zip(path, path[1:]):
                if (a == u and b == v) or (b == u and a == v):
                    return True
        return False

    return [(u, v) for u in range(N) for v in range(u + 1, N) if adjacent(u, v)]


def partitions(total, minimum=1):
    """Integer partitions of `total` as decreasing tuples of parts >= `minimum`."""
    if total == 0:
        yield ()
        return
    for last in range(minimum, total + 1):
        for head in partitions(total - last, last):
            yield head + (last,)


def components(mask):
    """Component sizes of the cut forest, sorted decreasingly (union-find)."""
    root = list(range(N))
    size = [1] * N

    def find(v):
        while root[v] != v:
            v = root[v]
        return v

    for bit, (u, v) in enumerate(EDGES):
        if not (mask >> bit & 1):  # bit set = cut, i.e. edge removed
            ru, rv = find(u), find(v)
            assert ru != rv, f"kept edges of {mask} contain a cycle"
            if size[ru] < size[rv]:
                ru, rv = rv, ru
            root[rv] = ru
            size[ru] += size[rv]
    return tuple(sorted(Counter(find(i) for i in range(N)).values(), reverse=True))


def adjacency(mask):
    """Adjacency list of the spanning subgraph on vertices 0..30."""
    adj = [[] for _ in range(N)]
    for bit, (u, v) in enumerate(EDGES):
        if not (mask >> bit & 1):
            adj[u].append(v)
            adj[v].append(u)
    return adj


def components_bfs(mask):
    """Independent (breadth-first) recomputation of the component sizes."""
    adj = adjacency(mask)
    seen = [False] * N
    sizes = []
    for start in range(N):
        if seen[start]:
            continue
        seen[start] = True
        queue, count = [start], 0
        while queue:
            v = queue.pop()
            count += 1
            for w in adj[v]:
                if not seen[w]:
                    seen[w] = True
                    queue.append(w)
        sizes.append(count)
    return tuple(sorted(sizes, reverse=True))


def acyclic(mask):
    """The kept edges form a forest: kept-edge count == N - #components."""
    kept = sum(1 for bit in range(30) if not (mask >> bit & 1))
    return kept == N - len(components_bfs(mask))


def cut_counts():
    """Exact edge-cut DP counting the cut forests of every composite type.

    Root the tree at 0.  A state of a fully processed rooted subtree is
    `(a, closed)`: `a` is the size of the piece still containing the subtree
    root and `closed` the multiset of sizes of the pieces already cut off.
    Processing the edges in decreasing child order visits every subtree before
    its parent, so the recurrence is exact.  Each state also keeps one witness.
    """
    states = [Counter({(1, ()): 1}) for _ in range(N)]
    witness = [{(1, ()): 0} for _ in range(N)]
    for bit, (parent, child) in sorted(enumerate(EDGES), key=lambda x: -x[1][1]):
        merged, masks = Counter(), {}
        for (a, closed_a), count_a in states[parent].items():
            mask_a = witness[parent][a, closed_a]
            for (b, closed_b), count_b in states[child].items():
                closed = tuple(sorted(closed_a + closed_b))
                ways = count_a * count_b
                mask = mask_a | witness[child][b, closed_b]
                merged[a + b, closed] += ways
                masks.setdefault((a + b, closed), mask)
                cut = (a, tuple(sorted(closed + (b,))))
                merged[cut] += ways
                masks.setdefault(cut, mask | (1 << bit))
        states[parent], witness[parent] = merged, masks
    counts, examples = Counter(), {}
    for (a, closed), count in states[0].items():
        kind = tuple(sorted(closed + (a,), reverse=True))
        counts[kind] += count
        examples.setdefault(kind, witness[0][(a, closed)])
    return counts, examples


def encode(kind):
    """The partition as a list of `31` entries in decreasing order (zero padded)."""
    return list(kind) + [0] * (N - len(kind))


def decode(parts):
    return tuple(p for p in parts if p != 0)


def lean_rows():
    assert tree_edges() == sorted((min(e), max(e)) for e in EDGES), \
        "edge list disagrees with the paths of Li.T"
    counts, examples = cut_counts()
    expected = set(partitions(N))
    assert len(expected) == 6842, len(expected)
    assert set(counts) == expected, "support is not the set of partitions of 31"
    assert sum(counts.values()) == 2 ** 30, sum(counts.values())

    rows = []
    for kind in sorted(expected, reverse=True):
        mask = examples[kind]
        assert components(mask) == kind, (kind, mask, components(mask))
        assert components_bfs(mask) == kind, (kind, mask, components_bfs(mask))
        assert acyclic(mask), (kind, mask)
        rows.append((encode(kind), mask))
    assert len({mask for _, mask in rows}) == len(rows)
    assert len({tuple(p) for p, _ in rows}) == len(rows)
    return counts, rows


def canonical(rows):
    """Canonical text: `a b c|0xMMMMMMMM`, one line per row, in the row order.

    This is the convention of `results/li-coefficient-sign` (`scripts/li_certificates.py`):
    the lines are joined by a newline.  `REFERENCE_SHA256` is the value recorded in
    `results/li-coefficient-sign/li_certificate_data.json` (`partitions.sha256`), so
    agreement of the hash is a full row-by-row cross-check against that independent
    run.
    """
    return "\n".join(
        " ".join(str(x) for x in decode(parts)) + "|0x" + format(mask, "08x")
        for parts, mask in rows
    )


def summary(rows):
    digest = hashlib.sha256(canonical(rows).encode()).hexdigest()
    print(f"partitions of {N}: {len(rows)} (p({N}) = 6842)")
    print(f"total cut forests counted: 2^30 = {2 ** 30}")
    print(f"witness masks verified by union-find and BFS: {len(rows)}")
    print(f"canonical data sha256: {digest}")
    assert digest == REFERENCE_SHA256, (digest, REFERENCE_SHA256)
    print("matches the independent run (results/li-coefficient-sign): yes")
    print(f"chunks of {CHUNK} rows: {(len(rows) + CHUNK - 1) // CHUNK}")


def block_table(edges):
    """Smallest local mask for each rooted component-size key of a subtree.

    Enumerate every subset of these edges independently of the tree DP.
    The key records the size of the component containing vertex 0, then the
    decreasing sizes of all other components.  Only vertex 0 is shared with
    the other subtree, so this key contains everything needed for assembly.
    """
    vertices = sorted({v for edge in edges for v in edge})
    assert 0 in vertices
    table = {}
    for mask in range(2 ** len(edges)):
        up = {v: v for v in vertices}
        for i, (a, b) in enumerate(edges):
            if (mask >> i) & 1:
                continue
            while up[a] != a:
                a = up[a]
            while up[b] != b:
                b = up[b]
            up[b] = a
        sizes = Counter()
        for vertex in vertices:
            while up[vertex] != vertex:
                vertex = up[vertex]
            sizes[vertex] += 1
        root0 = 0
        while up[root0] != root0:
            root0 = up[root0]
        root_size = sizes.pop(root0)
        others = sorted(sizes.values(), reverse=True)
        table.setdefault((root_size, *others), mask)
    return table


def independent_rows(progress=True):
    """Re-derive witnesses by an exhaustive block search that is not the DP.

    The first 15 edges and last 15 edges form subtrees meeting only at 0.
    Enumerating 2^15 masks for each subtree and combining all distinct rooted
    keys covers all 2^30 cut forests.  The two root components join at vertex
    0, so their combined size is the sum of their sizes minus one.  Every
    other component keeps its size.  Taking the smallest assembled mask for
    each partition reproduces the canonical witness rows without the DP.
    """
    head_edges, tail_edges = EDGES[:SPLIT_EDGE], EDGES[SPLIT_EDGE:]
    head_vertices = {v for edge in head_edges for v in edge}
    tail_vertices = {v for edge in tail_edges for v in edge}
    assert len(head_edges) == len(tail_edges) == 15
    assert head_vertices & tail_vertices == {0}
    assert head_vertices | tail_vertices == set(range(N))
    heads = block_table(head_edges)
    tails = block_table(tail_edges)
    if progress:
        print(f"independent search: {len(heads)} head keys, {len(tails)} tail keys",
              flush=True)
    results = {}
    for tail_key, tail_mask in tails.items():
        for head_key, head_mask in heads.items():
            root_size = head_key[0] + tail_key[0] - 1
            kind = tuple(sorted((root_size,) + head_key[1:] + tail_key[1:],
                                reverse=True))
            mask = head_mask | (tail_mask << SPLIT_EDGE)
            if kind not in results or mask < results[kind]:
                results[kind] = mask
    expected = set(partitions(N))
    missing = expected - set(results)
    extra = set(results) - expected
    assert not missing, f"search misses {len(missing)} partitions, e.g. {sorted(missing)[:5]}"
    assert not extra, f"search produces non-partitions, e.g. {sorted(extra)[:5]}"
    for kind, mask in results.items():
        assert components(mask) == kind, (kind, mask)
        assert components_bfs(mask) == kind, (kind, mask)
        assert acyclic(mask), (kind, mask)
    return [(encode(kind), results[kind]) for kind in sorted(expected, reverse=True)]


def lean_chunks(rows):
    """Lean source for the data chunks and their `decide` proofs.

    Each chunk is `def liDataNN : List Row` (500 rows) followed by
    `set_option maxRecDepth 100000 in theorem liDataNN_ok : ... := by decide`.
    """
    out = []
    for index in range(0, len(rows), CHUNK):
        chunk = rows[index:index + CHUNK]
        name = f"liData{index // CHUNK:02d}"
        out.append(f"/-- Certificate rows {index}..{index + len(chunk) - 1}. -/")
        out.append(f"def {name} : List Row := [")
        out.append(",\n".join(
            "  ([" + ", ".join(str(x) for x in decode(parts)) + "], " + str(mask) + ")"
            for parts, mask in chunk
        ))
        out.append("]")
        out.append("")
        out.append("set_option maxRecDepth 100000 in")
        out.append(f"theorem {name}_ok : chunkOk {name} = true := by")
        out.append("  decide")
        out.append("")
    return "\n".join(out)


def check(path):
    line_re = re.compile(r"^\s*\(\[([0-9,\s]*)\],\s*([0-9]+)\)\s*,?\s*$")
    kinds = Counter()
    with open(path, encoding="utf-8") as handle:
        for line in handle:
            match = line_re.match(line)
            if not match:
                continue
            parts = [int(x) for x in match.group(1).split(",")]
            mask = int(match.group(2))
            assert 1 <= len(parts) <= N and sum(parts) == N, line
            assert all(part > 0 for part in parts), line
            assert parts == sorted(parts, reverse=True), line
            assert 0 <= mask < 2 ** len(EDGES), line
            kind = decode(parts)
            assert components(mask) == kind, (kind, mask, components(mask))
            assert components_bfs(mask) == kind, (kind, mask)
            assert acyclic(mask), (kind, mask)
            kinds[kind] += 1
    expected = set(partitions(N))
    assert set(kinds) == expected, "data block does not cover every partition"
    assert all(v == 1 for v in kinds.values()), "duplicate partition"
    print(f"checked {len(kinds)} rows from {path}: every partition of {N} realized")


def main():
    counts, rows = lean_rows()
    summary(rows)
    if "--independent" in sys.argv:
        other = independent_rows()
        assert canonical(other) == canonical(rows), "independent search disagrees"
        print("independent block search reproduces the same 6,842 rows: yes")
    if "--lean" in sys.argv:
        i = sys.argv.index("--lean")
        target = sys.argv[i + 1] if len(sys.argv) > i + 1 else None
        text = lean_chunks(rows)
        if target:
            with open(target, "w", encoding="utf-8", newline="\n") as handle:
                handle.write(text)
            print(f"wrote Lean data: {target}")
        else:
            print(text)
    elif "--check" in sys.argv:
        check(sys.argv[sys.argv.index("--check") + 1])


if __name__ == "__main__":
    main()
