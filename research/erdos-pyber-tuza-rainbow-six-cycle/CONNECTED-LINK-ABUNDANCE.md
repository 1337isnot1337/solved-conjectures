# Connected links narrow the complementary-free branch

By [PRISM-PARITY.md](PRISM-PARITY.md), in a nonparity balanced zero-rainbow-six-cycle graphon the global rainbow-triangle link of every hue is connected. Thus every hue lies in at least four distinct rainbow-triangle palettes, and there are at least eight palettes. A useful finite consequence is that there are constants \(\varepsilon>0\) and \(n_0\) such that any exactly balanced six-cycle-free finite coloring of sufficiently large admissible order has at least \(\varepsilon n^3\) rainbow triangles using each fixed hue and one hue from each side of **every** nontrivial partition of the other five hues. If this failed, fix the partition and hue on an unbounded subsequence, take a colored cut limit, and apply the disconnected-link theorem. The limiting parity cut contradicts [finite parity repair](PARITY-CUT.md), exactly as in the [pair-abundance argument](ALL-PAIR-ABUNDANCE.md).

There are now two different remaining lanes.

1. The global palette family may contain complementary triples; their positive rooted supports are disjoint, by [ROOTED-TRANSVERSALS.md](ROOTED-TRANSVERSALS.md). Global coexistence is not ruled out.
2. The global family may be complement-free. It then has at most ten palettes. Its six links are connected and no hue belongs to every palette (the rooted omission bound gives this even at each root). The complete finite enumeration [connected_palette_orbits.py](connected_palette_orbits.py) leaves only the following four possibilities, up to relabeling. Here each digit triplet is a set of colors.

| Number of palettes | Labelled orbit size | Representative |
| --- | --- | --- |
| 9 | 120 | 012 013 024 134 234 125 035 235 045 |
| 10 | 90 | 012 013 023 014 024 134 015 125 035 045 |
| 10 | 120 | 012 013 023 014 124 234 025 125 135 045 |
| 10 | 12 | 012 013 024 134 234 125 035 235 045 145 |

No eight-palette family meets these necessary conditions. The checker enumerates the subsets of the 20 triples of each possible size, enforces connectedness by reachability on each five-hue link, removes all complementary-containing families and all common-hue families, and takes orbits under all 720 hue permutations. This is an auxiliary finite palette reduction, **not** a numerical test of the graph conjecture or a proof that any listed family can be realized by a balanced zero-cycle graphon. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
