# Circulants with circular chromatic index in the upper half

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Exact checks](verify.py) · [Certificate checks](verify_part2.py) · [Issue #152](https://github.com/1337isnot1337/solved-conjectures/issues/152)

**Status:** Written proof of Theorems 1 and 2. It has been through one independent referee pass by a second model instance, which found no mathematical error; the gaps it listed are fixed in the note. The note is otherwise unrefereed. The further examples of Section 7 are computer-certified instances, not a general theorem.

**Lean status:** Theorems 1 and 2 are fully formalized, as are the regular C31 and C33 examples of Section 7.2. The statements use the literal finite graphs, regular degree, connectedness after every deletion of fewer than the stated number of vertices, and the infimum over actual real circular edge-colourings. The 19-module closure passed strict source compilation, an all-owned audit of 601 declarations (500 theorem declarations and 171 required endpoints), and the unchanged pinned stock-kernel replay. Only `propext`, `Classical.choice`, and `Quot.sound` occur. [Local receipt](../../docs/verification/lean-named-20261121/circular-receipt.json).

Lean also verifies all 17 nonregular positive examples in Section 7.3. The additional general structural and insertion lemmas and the complete set of Section 7.4 search exclusions remain outside these receipts. [Proof and receipt](FORMALIZATION.md).

Primary source: J. Mazák and F. Zrubák, *Circular chromatic index of small graphs*, [arXiv:2603.08822](https://arxiv.org/abs/2603.08822), Section 8 (Problems 6 and 7 and the remark before them).

## Result

A circular $`r`$-edge-colouring of a graph $`G`$ is a map $`\varphi:E(G)\to[0,r)`$ such that edges sharing a vertex get colours at circular distance at least $`1`$ modulo $`r`$. The circular chromatic index $`\chi'_c(G)`$ is the least $`r`$ for which one exists. For a simple graph $`\chi'_c(G)\le\chi'(G)\le\Delta(G)+1`$ by Vizing's theorem, and the questions below concern the upper half of the interval $`[\Delta,\Delta+1]`$. For odd $`n`$ and $`S\subseteq\{1,\dots,(n-1)/2\}`$, the circulant $`C_n(S)`$ has vertex set $`\mathbb Z_n`$, with $`x\sim y`$ if and only if $`x-y\in\pm S`$.

**Theorem 1.** Let $`g\ge 2`$ and $`n=6g+1`$. The circulant

```math
G_g=C_{6g+1}(1,2,\dots,2g-2,\ 2g+1,\ 3g)
```

is a simple $`4g`$-regular, $`4g`$-connected graph with

```math
\chi'_c(G_g)=\frac{12g+2}{3}=4g+\frac23=\Delta(G_g)+\frac23 .
```

**Theorem 2.** The circulant $`C_{25}(1,2,3,7,8,9,10,11,12)`$ is a simple 18-regular, 18-connected graph with $`\chi'_c=75/4=18+3/4`$.

The smallest cases of Theorem 1 are $`G_2=C_{13}(1,2,5,6)`$ with $`\chi'_c=26/3`$, $`G_3=C_{19}(1,2,3,4,7,9)`$ with $`38/3`$ and $`G_4=C_{25}(1,\dots,6,9,12)`$ with $`50/3`$.

Mazák and Zrubák remark that for no $`\Delta\ge 8`$ was a single graph with maximum degree $`\Delta`$ and $`\chi'_c\in(\Delta+1/2,\Delta+1)`$ known. Theorems 1 and 2 give such graphs, simple, regular and of connectivity $`\Delta`$, for every $`\Delta\equiv 0\pmod 4`$ with $`\Delta\ge 8`$ and for $`\Delta=18`$. Their Problem 6 asks for which $`d`$ there is a $`d`$-connected $`d`$-regular graph with $`\chi'_c\ge d+1/2`$. Read literally, it is answered for every even $`d`$ by $`K_{d+1}`$, which has $`\chi'_c=d+1`$. In the non-trivial reading $`\chi'_c\in[d+1/2,d+1)`$, Theorems 1 and 2 answer it affirmatively for $`d\equiv 0\pmod 4`$ with $`d\ge 8`$ and for $`d=18`$.

The lower bounds come from $`\chi'_c(G)\ge|E(G)|/\alpha'(G)`$ (Lemma 1, proved by averaging over unit arcs), where $`\alpha'`$ is the matching number; the graphs have odd order $`n`$ and contain a matching of size $`(n-1)/2`$, so $`\alpha'=(n-1)/2`$ and the bound is $`2n/3`$ for $`G_g`$. The upper bound for $`G_g`$ is an explicit $`(2n,3)`$-edge-colouring: two base matchings $`M_0`$ and $`M_1`$, whose edge lengths are exactly the connection set, are translated around $`\mathbb Z_n`$, and class $`a`$ gets colour $`3a\bmod 2n`$. Every window of three consecutive colour classes is a matching that misses exactly one vertex, so the lower bound is attained; the window conditions reduce to four disjointness statements checked by hand. Connectivity follows from the theory of atoms: distinct atoms are disjoint (Watkins, Mader) and, in a Cayley graph, the atom containing $`0`$ is a subgroup (cf. Hamidoune); both lemmas are reproved in the note. The connection set rules out every non-trivial subgroup of $`\mathbb Z_n`$. Theorem 2 is proved in the same way with a $`(75,4)`$-edge-colouring built from three base matchings, which was found by computer search and whose nine window conditions are checked by hand.

Section 7 of the note records further examples. They are certified by `verify_part2.py`, not covered by a general proof:

- $`C_{31}(1,2,3,7,8,9,10,11,12)`$ is 18-regular and 18-connected with $`\chi'_c=93/5=\Delta+3/5`$, a denominator 5 for a simple regular graph; $`C_{33}(1,2,3,4,5,9,10,\dots,15)`$ is 24-regular and 24-connected with $`\chi'_c=99/4`$.
- Non-regular graphs with $`\chi'_c=\Delta+2/3`$ for every $`\Delta\equiv 1,2\pmod 4`$ with $`25\le\Delta\le 54`$ (Family B, built with a proved insertion lemma from base colourings found by SAT for $`6\le g\le 13`$), and one with $`\Delta=21`$ on 31 vertices, $`\chi'_c=65/3`$.

Section 7 also proves a structural lemma on perfect colourings and lists parameter sets for which exhaustive SAT searches in the cyclic ansatz found no colouring; these searches are not reproduced by the verifiers.

**Problem 7: distinguish simple graphs from multigraphs.** The literal multigraph question has an affirmative answer as a direct application of [Gao–Zhu’s 1996 lexicographic product theorem](https://doi.org/10.1016/0012-365X%2894%2900311-6). Tom (@tomdif) independently supplied the construction and an elementary colouring in [PR #752](https://github.com/1337isnot1337/solved-conjectures/pull/752). See [the calculation](PROOF.md#problem-7-multigraph-qualification). This does not establish the simple-graph version for denominators $`\gt 2`$ beyond the $`q=3,4,5`$ examples discussed here.

**Not answered for simple graphs.** Problem 6 in the reading $`\chi'_c=d+1/2`$ exactly is not answered and remains open here for every $`d\ge 5`$; the values here are $`d+2/3`$, $`d+3/4`$ and $`d+3/5`$. In the non-trivial reading, Problem 6 stays open for $`d\not\equiv 0\pmod 4`$ with $`d\ne 18`$. No example with $`\Delta\equiv 3\pmod 4`$ was found, and $`\Delta\in\{9,10,11,13,14,15,17,19,22,23\}`$ remain without an example.

Nothing new is claimed about atoms or connectivity. The quotations from Mazák and Zrubák were taken from the arXiv HTML through a web-fetch tool and not compared with the PDF character by character. No literature search beyond that paper and a few web searches was made; the searches found nothing more recent on this question.

## Verification

Run from the repository root with Python 3.10 or later and no other dependencies:

```sh
python3 results/circular-index-upper-half-circulants/verify.py
python3 results/circular-index-upper-half-circulants/verify_part2.py
```

`verify.py` checks Theorem 1 for $`g=2,\dots,30`$: the circulant is simple and $`4g`$-regular, the $`2n`$ classes partition the edge set, every class is a matching, the colouring is a $`(2n,3)`$-colouring (checked per vertex and per window), $`\alpha'=(n-1)/2`$ and $`|E|/\alpha'=2n/3`$. Its own max-flow routine computes $`\kappa(G_g)=4g`$ for $`g=2,3,4`$ over all non-adjacent pairs and for $`g=5,\dots,8`$ over the pairs $`(0,t)`$, which suffices by vertex-transitivity. It makes the same checks for Theorem 2. `verify_part2.py` reads [`data/part2_certificates.json`](data/part2_certificates.json) and, for every certificate of Section 7, rebuilds the colour sequence, checks that it is a perfect $`(p,q)`$-edge-colouring of a simple graph, computes $`\Delta`$ and $`|E|/\alpha'=p/q`$, and computes the vertex connectivity of the regular circulants. The scripts end with `ALL CHECKS PASSED` and `ALL PART 2 CHECKS PASSED` and take a few seconds.

The scripts check finitely many cases. The Lean proof of Theorem 1 covers every `g ≥ 2`; it does not infer the universal result from those checks. `CircularIndex.theorem_one` and `theorem_two` combine the exact real index, degree, and connectivity assertions. `graph31_complete` and `graph33_complete` prove the corresponding three assertions for the two regular supplemental examples. The real lower bound is proved by rounding arbitrary real circular colourings and taking the resulting bounds to their limit. The atom intersection and subgroup arguments used for connectivity are proved internally.

The entry modules are [`CircularIndexTheorems.lean`](../../lean/Conjectures/CircularIndexTheorems.lean), [`CircularIndexFurtherConnected.lean`](../../lean/Conjectures/CircularIndexFurtherConnected.lean), and [`CircularIndexFurther.lean`](../../lean/Conjectures/CircularIndexFurther.lean). Run the registered full gate from the repository root with `scripts/verify_lean.sh`.

Optional checks, not run by CI:

- [`review/`](review) contains the referee report [`REVIEW.md`](review/REVIEW.md) and the referee's scripts, written independently of `verify.py`. [`check.py`](review/check.py) needs `networkx`; run it as `python3 results/circular-index-upper-half-circulants/review/check.py fam`, `kappa` or `part2`. [`extra.py`](review/extra.py) imports `check.py`; run it with `famB` or `g1`.
- [`search/`](search) contains the search scripts that found the colourings, with their outputs and the work log [`LOG.md`](search/LOG.md). Most need `python-sat`; [`cyc2.py`](search/cyc2.py) (the backtracking search for the cyclic ansatz) and [`fam3.py`](search/fam3.py) (a first check of the family of Theorem 1) use only the standard library. None of them is needed to check the proof.

## Files

- [`PROOF.md`](PROOF.md): context, statements, proofs, consequences for the questions of Mazák and Zrubák, verification summary, sources, and the further searches of Section 7.
- [`verify.py`](verify.py): standard-library check of Theorems 1 and 2.
- [`verify_part2.py`](verify_part2.py) and [`data/part2_certificates.json`](data/part2_certificates.json): standard-library check of the Section 7 certificates.
- [`review/`](review): the referee report and the referee's scripts.
- [`search/`](search): search scripts, outputs and work log.
