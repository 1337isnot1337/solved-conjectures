# Novelli–Thibon's conjecture

**Status:** complete proposed proof of Conjecture 5.7 for every pair of partitions and all independent parameters. The adjacent hook-coefficient formula is also proved. Two internal mathematical reviews passed; the notes remain unrefereed.

**Lean status:** none. The exact Python checks are supplementary convention checks.

## Statement

Write the Schur coefficient of the modified multi-$`t`$ Macdonald function as

```math
\widetilde K_{\lambda\mu}(q,\mathbf t)
=\sum_{k,\alpha}c_{k,\alpha}q^k\mathbf t^\alpha.
```

Let $`d_\lambda`$ count standard tableaux of shape $`\lambda`$ in which 2 is above 1, in French notation. Then

```math
\prod_{k,\alpha}(q^k\mathbf t^\alpha)^{c_{k,\alpha}}
=\left(q^{n(\mu')}\prod_{j\ge1}t_j^{\mu_{j+1}}\right)^{d_\lambda}.
```

The original equation prints the exponent as $`d_\mu`$. Its own example requires $`d_\lambda`$; the proof explains the correction and establishes the intended formula. It does not treat the printing error as a disproof.

## Argument and scope

A word-standardization identity shows that any one inversion comparison contributes $`e_2p_1^{n-2}`$ to the fundamental expansion. Counting attacking edges and vertical comparisons gives every first parameter derivative at the unit point. The one-cell Pieri rule then identifies the exponent with $`d_\lambda`$.

The source's Carlsson–Mellit evaluation and its optional-edge expansion also give a product evaluation at the alphabet $`1-z`$. Extracting hooks proves the adjacent formula for every hook Schur coefficient. Both conclusions belong to this single named package. The separate Schur-positivity Conjecture 5.4 and general Yang–Baxter trace conjecture are outside its scope.

## Files

- [Complete proof](PROOF.md), including source conventions and the hook supplement.
- [Source and prior-resolution audit](SOURCES.md), with the searched literature, public proof archives and access limits.
- [Independent mathematical review](AUDIT.md), covering both conclusions; the coordinating reviewer also checked the proof independently in [issue 180](https://github.com/1337isnot1337/solved-conjectures/issues/180).
- [Exact checker](verify.py) and [recorded output](verification.json).

The checker uses the Python standard library. It independently converts the permutation expansion to Schur coefficients through Kostka numbers, checks 209 partition pairs and 135 hook coefficients through size six, and exactly reproduces the source's printed example. The all-size proof does not depend on this finite range.

```bash
python3 results/novelli-thibon/verify.py
```

## Original source

Jean-Christophe Novelli and Jean-Yves Thibon, *Noncommutative chromatic quasi-symmetric functions, Macdonald polynomials, and the Yang–Baxter equation*, Journal of Combinatorial Theory, Series A 220 (2026), 106130, [DOI 10.1016/j.jcta.2025.106130](https://doi.org/10.1016/j.jcta.2025.106130); [author manuscript, arXiv:2502.09072v2](https://arxiv.org/html/2502.09072v2), Conjecture 5.7 and the final sentence following it.

- [Partial Lean verification](FORMALIZATION.md)
