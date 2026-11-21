# Prior resolution excludes this target

Audit date: 21 November 2026. This package contributes no new-conjecture count.

## The exact earlier formula

Root found the Chinese thesis record for Xianghua Tan (谭湘花), *几类冠图的临界群* (*Critical groups of several corona graphs*), Hunan Normal University master's thesis, 2011, supervised by Yaoping Hou (侯耀平). The public bibliographic page reproduces the abstract:

<https://www.xueweilunwen.com/doc/461874>.

Both root and the combinatorics lane opened and read this page. Item (5b), concerning the edge corona of a cycle and a complete graph, states the group formula

```math
K(C_N\mathbin{\diamond}K_M)
\cong(\mathbb Z/(M+2)\mathbb Z)^{MN-2}
\oplus\mathbb Z/(2(M+2)N)\mathbb Z.
```

The edge corona attaches a separate copy of $`K_M`$ to the two endpoints of every edge of $`C_N`$. Together with the existing cycle edge, those vertices form a clique of size $`M+2`$. Therefore Tamimi's graph is exactly this graph with $`N=r`$ and $`M=n-2`$. Substitution gives

```math
(\mathbb Z/n\mathbb Z)^{r(n-2)-2}
\oplus\mathbb Z/(2rn)\mathbb Z,
```

the complete proposed formula, for all the parameters in Tamimi's conjecture.

This public abstract is a reproduced source, not a copy of the primary thesis. Neither lane retrieved the original thesis or independently checked its proof. Several other displayed formulas on the page have lost formatting in text extraction; the exponents and cyclic orders in item (5b) are legible and match exactly. We conservatively reject a new-priority claim on this evidence and preserve the access limit explicitly.

## Independently inspected earlier triangle case

Carlos A. Alfaro, Jesús Uriel Medrano, Juan Pablo Serrano, Iván Téllez Téllez, and Ralihe R. Villagrán, *The Smith normal form of Laplacian matrices of simplicial annuli and high dimensional trees*, arXiv:2607.23506v1, 26 July 2026, Lemma 8, determines the Smith form of the Laplacian of the planar dual of a cycle with one triangle attached along each edge. Its torsion factors are

```math
(\mathbb Z/3\mathbb Z)^{r-2}
\oplus\mathbb Z/(6r)\mathbb Z.
```

Primary: <https://arxiv.org/abs/2607.23506v1>.

The paper's local PDF and text extraction were inspected by the algebra lane, and its graph definition, Lemma 8, and following annulus application were independently read in the combinatorics lane. Planar duality gives the n=3 case of Tamimi's graph. This alone is a partial prior result; Tan's exact general formula is the reason for full exclusion.

## What remains in this package

`PROOF.md` is an independent all-parameter integral reduction and `ALGEBRA_REVIEW.md` confirms its mathematical correctness. The exact finite Smith checks give additional transcription diagnostics. These are retained as an independently reviewed reproof. They are not a newly solved open conjecture.

The first checkpoint at commit `40d16f6897afd1168e86e8a24b4b0f3018c45ce1` correctly marked source and priority as pending. The subsequent audit found the collision before any result registration or count increase.
