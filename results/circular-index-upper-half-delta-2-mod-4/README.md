# Graphs with circular chromatic index in the upper half for Δ ≡ 2 mod 4

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Exact checks](verify.py) · [Certificates](certificates.json) · [Issue #152](https://github.com/1337isnot1337/solved-conjectures/issues/152)

**Status:** Written proof of Theorems 1 and 1′. It has been through one independent referee pass by a second model instance, which re-derived every hand claim, found no mathematical error and accepted the note; its minor points are applied. The note is otherwise unrefereed. Proposition 2 rests on computer-checked colourings.

**Contributor:** [@aadrianvv](https://github.com/aadrianvv).

**Lean status:** none. No Lean formalization is included.

Primary source: J. Mazák and F. Zrubák, *Circular chromatic index of small graphs*, [arXiv:2603.08822](https://arxiv.org/abs/2603.08822), Section 8 (the remark after Problem 7).

## Result

A $`(p,q)`$-edge-colouring of a graph maps its edges to $`\mathbb Z_p`$ so that edges sharing a vertex get colours at circular distance at least $`q`$; it gives $`\chi'_c\le p/q`$. Mazák and Zrubák remark that for no $`\Delta\ge 8`$ was a single graph with maximum degree $`\Delta`$ and $`\chi'_c\in(\Delta+1/2,\Delta+1)`$ known. [Circulants with circular chromatic index in the upper half](../circular-index-upper-half-circulants/) answers this for $`\Delta\equiv0\pmod4`$, $`\Delta\ge8`$, and for $`\Delta=18`$. This note treats $`\Delta\equiv2\pmod4`$, and $`\Delta\equiv1\pmod4`$ as well.

**Theorem 1.** For every $`g\ge6`$ there is a simple graph $`G_g`$ on $`n=6g+1`$ vertices with maximum degree $`\Delta=4g+2`$ and

```math
\chi'_c(G_g)=\frac{2n+6}{3}=\Delta+\frac23 .
```

**Theorem 1′.** For every $`g\ge6`$ the graph $`G'_g`$ obtained with one insertion block instead of two has $`\Delta=4g+1`$ and $`\chi'_c(G'_g)=(2n+3)/3=\Delta+2/3`$.

**Proposition 2 (computer-certified).** For $`n\in\{11,15,19,23\}`$ and $`t=(n-3)/4`$, the graph $`K_n-tK_2`$ has $`\Delta=n-1\in\{10,14,18,22\}`$ and $`\Delta+1/2\lt n-t/m\le\chi'_c\le\Delta+2/3`$, where $`m=(n-1)/2`$.

**Corollary 3.** For every $`\Delta\equiv2\pmod4`$ with $`\Delta\ge10`$ there is a simple graph with maximum degree $`\Delta`$ and $`\chi'_c\in(\Delta+1/2,\Delta+1)`$. Together with the circulant result this gives such a graph for every even $`\Delta\ge8`$. With Theorem 1′ and the computer-certified $`\Delta=21`$ example of the circulant result, it also covers every $`\Delta\equiv1\pmod4`$ with $`\Delta\ge21`$.

The graphs of Theorems 1 and 1′ are the "Family B" graphs of Section 7.3 of the circulant result, where the construction was reduced to a base problem that SAT solved only for $`6\le g\le13`$. The base problem asks for perfect matchings $`M_0`$ of $`\{0,1\}\cup[2g+3,4g]`$ and $`M_1`$ of $`\{1,2\}\cup[2g+3,4g]`$ in $`\mathbb Z_n`$ whose $`2g`$ edges have distinct circulant lengths, none equal to 1. Section 3 of the note solves it by explicit formulas for every $`g\ge7`$, with a centred odd nest for $`M_0`$ and only even lengths in $`M_1`$, and uses the stored SAT base for $`g=6`$. The rest is the Family B argument, re-proved in full. The translates of $`M_0`$ and $`M_1`$ coloured $`3a`$ in $`\mathbb Z_{2n}`$ give a $`(2n,3)`$-colouring of a $`4g`$-regular circulant in which every window of three consecutive classes is a matching missing one vertex. Two blocks of length-1 edges are inserted into the colour sequence, which raises $`\Delta`$ to $`4g+2`$ and gives a $`(2n+6,3)`$-colouring. The lower bound $`\chi'_c\ge|E|/\alpha'`$ with $`\alpha'\le(n-1)/2`$ meets it exactly. The graphs are not regular, and their connectivity is not claimed.

Proposition 2 uses the $`(3n-1,3)`$-colourings of [Circular chromatic index of complete graphs minus a few edges](../circular-index-complete-minus-edges/), copied into [`certificates.json`](certificates.json). The exact value is known only for $`\Delta=10`$, where $`\chi'_c(K_{11}-2K_2)=32/3`$. In that result the colourings for $`n=19`$ and $`n=23`$ are among the unrefereed additions. Here they are checked by `verify.py` and again by the referee's `review/kn_check.py`.

**Not answered.** A uniform construction for $`\Delta\in\{10,14,18,22\}`$ is not given; the base problem has no solution for $`g=3,4,5`$. $`\Delta\in\{9,13,17\}`$ were not covered by these original constructions. $`\Delta\equiv3\pmod4`$ was open when this note was written; for $`\Delta\ge27`$ it is settled in [Graphs with circular chromatic index in the upper half for Δ ≡ 3 mod 4](../circular-index-upper-half-delta-3-mod-4/), and $`\Delta\in\{11,15,19,23\}`$ were not covered by these original constructions. The [PROOF.md](PROOF.md) of this note is unchanged and still lists $`\Delta\equiv3\pmod4`$ as open. Problem 6 (connectivity) and Problem 7 (denominators $`q\ge6`$) of Mazák and Zrubák are not touched. The quotation from Mazák and Zrubák was taken over from the circulant result, which obtained it through a web-fetch tool; the referee checked it against the arXiv HTML. No literature search was made beyond the sources of the two earlier results.

## Verification

Run from the repository root with Python 3.10 or later and no other dependencies:

```sh
python3 results/circular-index-upper-half-delta-2-mod-4/verify.py
```

For every $`6\le g\le60`$ (an optional argument changes the bound), the script builds $`M_0`$ and $`M_1`$ from the formulas of Section 3, or from `certificates.json` for $`g=6`$. It checks the base matchings and their lengths, the partition of the circulant into the $`2n`$ classes, the windows of the base colouring and the two insertion blocks. For both final graphs it checks simplicity, $`\Delta`$, the $`(p,3)`$-colouring per vertex from the definition, and $`|E|/((n-1)/2)=p/3=\Delta+2/3`$. Part 2 rechecks the colourings of $`K_n-tK_2`$ for $`n=11,15,19,23,27`$. Five negative controls must be rejected. The script ends with `ALL CHECKS PASSED`.

The script checks finitely many $`g`$. Theorems 1 and 1′ for every $`g\ge6`$ rest on the written proof.

Optional checks, not run by CI. [`review/`](review) contains the referee report [`REVIEW.md`](review/REVIEW.md) and the referee's scripts, which locate their files relative to their own folder:

- [`indep_check.py`](review/indep_check.py) is a verifier that shares no code with `verify.py`. It checks all pairs of incident edges and confirms $`\alpha'=3g`$ by a blossom matching, and needs `numpy` and `networkx`. [`mut_test.py`](review/mut_test.py) applies seven mutations to it, all of which must be rejected, with the same requirements.
- [`kn_check.py`](review/kn_check.py) rechecks the $`K_n-tK_2`$ certificates; [`base_small.py`](review/base_small.py) searches the base problem exhaustively for $`g=3,\dots,6`$; [`author_mut.py`](review/author_mut.py) feeds bad inputs to the checkers of `verify.py`. These three use only the standard library.
- The `.out` files are the recorded outputs.

## Files

- [`PROOF.md`](PROOF.md): statement, definitions and lemmas, the base matchings, the colouring and the graph, the proofs, the split into proved, computed and open, verification, the referee pass and sources.
- [`verify.py`](verify.py): standard-library check of Theorems 1 and 1′ for $`6\le g\le60`$ and of the certificates of Proposition 2.
- [`certificates.json`](certificates.json): the $`g=6`$ base and the colourings of $`K_n-tK_2`$.
- [`review/`](review): the referee report and scripts.
