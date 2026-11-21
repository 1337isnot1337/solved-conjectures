# Circular chromatic index of complete graphs minus a few edges

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Colouring checks](verify.py) · [Sequencing search](verify_seq.py) · [Issue #147](https://github.com/1337isnot1337/solved-conjectures/issues/147) · [Issue #152](https://github.com/1337isnot1337/solved-conjectures/issues/152)

**Status:** Written proofs together with computer-checked finite parts. Part A, a second and shorter proof of Conjecture 2 of Mazák and Zrubák, passed an independent referee pass by a second model instance, which found it correct and complete; its corrections are applied. A second independent model referee pass checked the material added after the first: the values for $`K_{11}-2K_2`$ and $`K_{15}-3K_2`$, the 3-edge rows for $`n=9,11,13`$, Lemma B and Corollary B1, the structure lemma for $`2t=m`$, the status of Conjectures H and H′ and the claim about $`\Delta\ge8`$. Its verdict was accept with minor corrections, which are applied. **Not refereed:** the material added after the second pass, namely the colourings for $`n=19,23,27,47`$, the symmetry conditions and the structure lemma for $`(qn-1,q)`$-colourings. The colourings themselves are checked by `verify.py`. Some exclusions rest on exhaustive searches and on SAT runs, described below.

**Lean status:** none. No Lean formalization is included.

Primary source: J. Mazák and F. Zrubák, *Circular chromatic index of small graphs*, [arXiv:2603.08822](https://arxiv.org/abs/2603.08822), Conjecture 2 and the remark in the open-problems section on graphs with $`\chi'_c\in(\Delta+1/2,\Delta+1)`$.

## Result

A $`(p,q)`$-edge-colouring of a graph maps its edges to $`\mathbb Z_p`$ so that adjacent edges get colours at circular distance at least $`q`$, and the circular chromatic index is $`\chi'_c(G)=\min p/q`$. Throughout, $`n=2m+1`$ is odd, $`F`$ is a set of $`t`$ edges of $`K_n`$, and $`N=mn-t`$ is the number of edges of $`K_n-F`$.

**Theorem A.** For odd $`n\ge7`$, $`\chi'_c(K_n-e)=n`$.

This is Conjecture 2 of Mazák and Zrubák, already proved in this repository by a different argument: see [Mazák–Zrubák conjecture on complete graphs minus an edge](../circular-index-complete-minus-edge/). The proof here is logically independent of that one. By Vince's theorem and the matching bound $`\chi'_c\ge N/m`$, a value below $`n`$ gives an $`(mn-1,m)`$-colouring, and for $`K_n-e`$ every colour class of such a colouring is a single edge. So the edges are arranged in a cyclic order in which every $`m`$ consecutive edges are disjoint, a *perfect sequencing*. In it each vertex reappears after $`m`$ or $`m+1`$ positions. The two ends of the missing edge each fill one residue class modulo $`m+1`$, and in each of the other $`m-1`$ classes the edges form a path $`z_{k-1}z_k`$ through the remaining vertices. Two such classes carry the same path up to a shift. For $`n\ge7`$ there are at least two of them, so an edge would occur twice. For $`n=5`$ there is only one, in accordance with $`\chi'_c(K_5-e)=9/2`$.

**Exact values.** Lemma B shows that for $`m\ge2`$ and $`t\le m+1`$ a perfect sequencing of $`K_n-F`$ exists only if $`F`$ is a matching. With Corollary B1 and the finitely many candidate fractions allowed by Vince's theorem (Lemma 0), this gives:

| $`n`$ | $`F`$ | $`\chi'_c(K_n-F)`$ | how the smaller candidates are excluded |
|---|---|---|---|
| 7 | $`P_3`$, $`2K_2`$ | $`13/2`$ | $`19/3`$: no perfect sequencing (exhaustive search); also SAT |
| 9 | $`P_3`$, $`2K_2`$ | $`17/2`$ | none, the value equals $`N/m`$ |
| 9 | each of the five 3-edge graphs | $`17/2`$ | $`33/4`$: no perfect sequencing; $`25/3`$: SAT with DRUP certificates |
| 11 | $`2K_2`$ | $`32/3`$ | $`53/5`$: no perfect sequencing (exhaustive search) |
| 11 | each of the five 3-edge graphs | $`21/2`$ | $`52/5`$: no perfect sequencing |
| 13 | each of the five 3-edge graphs | $`25/2`$ | none, the value equals $`N/m`$ |
| 17 | $`4K_2`$, $`K_{1,4}`$, $`P_5`$, $`C_4`$, $`K_3\cup K_2`$ | $`33/2`$ | none |
| 25 | $`K_4`$ | $`49/2`$ | none |
| 41 | $`K_5`$ | $`81/2`$ | none |

The upper bounds are the 32 explicit colourings in [`colourings.json`](colourings.json). Exhaustive searches are needed for $`F`$ a matching, where Lemma B does not apply; for $`K_{11}-2K_2`$ and $`K_{11}-3K_2`$ they ran through $`1.36\cdot10^9`$ and $`6.96\cdot10^8`$ nodes.

**Graphs with $`\chi'_c\in(\Delta+1/2,\Delta+1)`$.** Mazák and Zrubák remark that for no $`\Delta\ge8`$ was a graph with maximum degree $`\Delta`$ and $`\chi'_c\in(\Delta+1/2,\Delta+1)`$ known to them. If $`2t\lt m`$ and $`F`$ leaves a vertex uncovered, then $`\chi'_c(K_n-F)\ge n-t/m\gt\Delta+1/2`$, so any colouring with $`p/q\lt n`$ gives such a graph. $`K_{11}-2K_2`$ has $`\chi'_c=32/3=\Delta+2/3`$ with $`\Delta=10`$. SAT searches found $`(3n-1,3)`$-colourings of $`K_{15}-3K_2`$, $`K_{19}-4K_2`$, $`K_{23}-5K_2`$, $`K_{27}-6K_2`$ and $`K_{47}-11K_2`$, so these graphs have $`\chi'_c\in(\Delta+1/2,\Delta+1)`$ for $`\Delta=14,18,22,26,46`$. Their exact values are not determined; for $`K_{15}-3K_2`$ the index lies in $`[102/7,44/3]`$. The colourings for $`n=27`$ and $`n=47`$ are invariant under a $`\mathbb Z_5`$ symmetry fixing the two ends of one edge of $`F`$; by the note's (unrefereed) conditions on symmetric colourings, this kind of symmetry occurs only for $`n\equiv7\pmod{20}`$. All these degrees are $`\equiv2\pmod4`$; the circulants of [Circulants with circular chromatic index in the upper half](../circular-index-upper-half-circulants/) cover $`\Delta\equiv0\pmod4`$, $`\Delta\ge8`$, and $`\Delta=18`$.

**Conjectures.** The first version of the note conjectured that $`\chi'_c(K_n-F)=n`$ whenever $`2t\lt m`$ (Conjecture H). $`K_{11}-2K_2`$ refutes it. The note states instead, as a conjecture only:

**Conjecture H′.** For $`2\le t\le m-1`$ and every $`F`$ with $`t`$ edges, $`\chi'_c(K_n-F)=n-1/\lceil m/t\rceil`$.

It agrees with every exact value above and with the upper bound $`44/3`$ for $`K_{15}-3K_2`$. The first open tests are $`K_{11}-P_3`$, $`K_{13}-2K_2`$ and $`K_{15}-3K_2`$.

**Limits.**

- It is not proved that $`\chi'_c(K_n-tK_2)\lt n`$ for every odd $`n\ge11`$ and some $`t`$ with $`2\le2t\lt m`$. There is no general construction. For $`n=13,17,21`$ no colouring of this kind was found within 10 minutes per SAT run, and for $`n=31`$ the searches timed out.
- Open values: $`K_{11}-P_3`$ lies in $`(53/5,11]`$, with $`32/3`$ and $`43/4`$ undecided; $`K_{13}-P_3`$ and $`K_{13}-2K_2`$ lie in $`[38/3,13]`$; $`K_{15}-3K_2`$ needs $`102/7`$ and $`73/5`$ excluded.
- The exclusion of $`25/3`$ for the five 3-edge graphs at $`n=9`$ rests on one SAT encoding with redundant constraints derived by hand and checked by the second referee. The DRUP certificates, checked with drat-trim, certify that this CNF is unsatisfiable, not that it encodes the problem. Plain encodings timed out after 10 minutes. The proof files (8 MB to 561 MB) are not stored; [`drat/mkproof.py`](drat/mkproof.py) regenerates them.
- Even $`n`$ with $`F`$ leaving a vertex uncovered is trivial by Plantholt's theorem; spanning $`F`$ is not treated.
- Vince's theorem was read by the referee, not by the authors; Zhu's survey was not re-read and Plantholt's paper was not read. A web search on 21 November 2026 found no result on $`\chi'_c(K_n-F)`$ for $`|F|\ge2`$.

## Verification

Run from the repository root with Python 3.10 or later and no other dependencies:

```sh
python3 results/circular-index-complete-minus-edges/verify.py
python3 results/circular-index-complete-minus-edges/verify_seq.py
```

`verify.py` checks each of the 32 colourings in `colourings.json` from the definition: the edge list is exactly the edge set of $`K_n-F`$, adjacent edges get colours at circular distance at least $`q`$, and a matching of size $`m`$ exists. It prints the bound $`N/m`$ and the resulting interval for $`\chi'_c`$, and takes under a second. `verify_seq.py` searches exhaustively, from the definition, for perfect sequencings of $`K_5-e`$, $`K_7-e`$, $`K_9-e`$, $`K_7-P_3`$ and $`K_7-2K_2`$. It finds 4 for $`K_5-e`$ (with the first edge fixed) and none for the others, and checks Lemmas A2, A3, A4 and the class counts of A5 on those of $`K_5-e`$. It takes about 25 seconds.

The proof of Theorem A covers every odd $`n\ge7`$ and does not depend on the scripts. The exact values for $`n\le 11`$ use the exhaustive searches and SAT runs listed above.

Optional checks, not run by CI:

- [`verify_sat.py`](verify_sat.py) needs `python-sat`. `python3 results/circular-index-complete-minus-edges/verify_sat.py 1` shows that $`K_7-P_3`$ and $`K_7-2K_2`$ have no $`(19,3)`$-colouring (about 85 s each); with argument `2` it shows that $`K_9-F`$ has no $`(25,3)`$-colouring for the five 3-edge graphs $`F`$ (a few minutes at most).
- [`drat/`](drat) contains `mkproof.py`, which rebuilds the CNF of `verify_sat.py` part 2 and writes a DRUP proof, and a `README.txt` with the solvers used and the drat-trim results.
- [`review/`](review) contains the two referee reports, [`REVIEW.md`](review/REVIEW.md) and [`REVIEW2.md`](review/REVIEW2.md), and the referees' scripts and recorded outputs. Among them, `seqsearch.c` and `pseq.c` are independent exhaustive searches for perfect sequencings in C, `lemma_check.py` checks the full Lemmas A5 and A6 on the sequencings of $`K_5-e`$, `check_col.py` (needs `networkx`) re-checks the colourings, `cands.py` lists the candidate fractions of Lemma 0, and `plainsat.py` and `sat172.py` are SAT models (need `python-sat`). Run the lemma check from this folder: `gcc -O2 -o seqsearch review/seqsearch.c; ./seqsearch 5 k5e.txt 0 0 1; python3 review/lemma_check.py k5e.txt 5 0 1`.

## Files

- [`PROOF.md`](PROOF.md): Lemma 0, Part A (Theorem A), Part B (Lemma B and Corollary B1), Part C (exact values and the refutation of Conjecture H), Part E (the colourings below $`n`$, symmetry conditions and the structure of $`(qn-1,q)`$-colourings), Part D (Conjecture H′), verification, the two referee passes and sources.
- [`colourings.json`](colourings.json): the 32 explicit colourings.
- [`verify.py`](verify.py): standard-library check of the colourings.
- [`verify_seq.py`](verify_seq.py): standard-library exhaustive search for perfect sequencings and check of Lemmas A2 to A5 on $`K_5-e`$.
- [`verify_sat.py`](verify_sat.py): SAT exclusions for $`n=7`$ and $`n=9`$.
- [`drat/`](drat): DRUP certificate generator and results.
- [`review/`](review): the referee reports and scripts.
