# Bernardi–Morales's delta-process conjecture

**Status:** full proofs with separate internal reviews. No previous resolution was found in the documented literature search of 20 November 2026. External peer review has not been obtained.

The targets are Conjectures 27 and 28, page 23, in Olivier Bernardi and Alejandro H. Morales, [*Some probabilistic trees with algebraic roots*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v23i2p36/pdf/), Electronic Journal of Combinatorics 23(2) (2016), P2.36, DOI [10.37236/4954](https://doi.org/10.37236/4954). The original [arXiv preprint](https://arxiv.org/abs/1501.01135v1) numbers them Conjectures 21 and 22. Both are included under this one named conjecture investigation.

## Result

Let $\mathcal R_{\boldsymbol p,r}$ consist of $r$ proper subsets of $[k]$ such that vertex $j$ occurs in exactly $p_j$ subsets. For each nonroot vertex $i$, a map $f:[k-1]\to[r]$ chooses one of the subsets. The delta rule fixes $i$ if $i$ belongs to that subset, and otherwise sends $i$ to the next element of its complement in cyclic order. These choices define a directed graph with root $k$.

For every fixed map $f$, the number of tuples producing a tree is exactly

```math
\#\{\boldsymbol S\in\mathcal R_{\boldsymbol p,r}:
G_\delta(\boldsymbol S,f)\text{ is a tree}\}
=|\mathcal R_{\boldsymbol p,r-1}|.
```

Consequently the original experiment, with a uniform tuple and an independent uniform surjection, has tree probability

```math
P_\delta(\boldsymbol p,r)
=\frac{|\mathcal R_{\boldsymbol p,r-1}|}
 {|\mathcal R_{\boldsymbol p,r}|}.
```

The proof covers all admissible $k,r,\boldsymbol p$. The stronger fixed-map statement allows nonsurjective maps and arbitrary $r\geq1$.

The source's stronger event-determinant Conjecture 28 is also proved. For every fixed surjection $f$ and every marked set $D\subseteq[k-1]$, its event matrix satisfies the complete polynomial identity

```math
\sum_{S_1,\ldots,S_r\subseteq[k]}
x^{S_1}\cdots x^{S_r}\det M^D(\boldsymbol S,f)
=F(x)^{r-1}x^D\prod_{j\in[k-1]\setminus D}(1+x_j),
\qquad
F(x)=\prod_{i=1}^k(1+x_i)-\prod_{i=1}^kx_i.
```

Here $M^D$ uses the paper's interval-event rows, with a fixed last row of ones. [EVENT_PROOF.md](EVENT_PROOF.md) gives their precise definitions. Membership coefficient extraction yields exactly the source's conjectured probability determinant for every $D$. The original paper had already proved the two endpoint cases $D=\varnothing$ and $D=[k-1]$; this proof covers all marked sets at once.

## Proof mechanism

Write $L$ for the directed-cycle Laplacian. Eliminating a proper subset $S$ by a Schur complement gives the cyclic-successor Laplacian on its complement, exactly the delta map. All proper principal minors of $L$ equal 1. This gives an identity with an arbitrary auxiliary matrix, rather than just a diagonal one, and therefore preserves the averages of all square minors.

The subsets become independent after introducing membership variables and postponing coefficient extraction. The all-minor identity permits replacement of each color's rows inside the determinant by a common matrix $H=L(I+XL)^{-1}$. Every principal cofactor of $H$ equals $1/F$, where

```math
F(x)=\prod_{i=1}^k(1+x_i)-\prod_{i=1}^k x_i.
```

The determinant is the indicator that the functional graph reaches the root. Thus the weighted tree count is $F^{r-1}$, and its membership coefficients give the result.

The separate event proof represents interval indicators by the adjugate of a cyclic matrix. Multiplying selected rows by that matrix reduces the determinant to complementary columns. At the full subset, both sides vanish because of the fixed last row of ones. This exact cancellation permits independent Bernoulli averaging even at the singular case. Replacing one color at a time and evaluating the final determinant proves the stronger identity.

## Files and verification

- [PROOF.md](PROOF.md): complete argument, including the fixed-map theorem and color-weight identity.
- [EVENT_PROOF.md](EVENT_PROOF.md): full proof of the stronger event-determinant conjecture, including full subsets and all marked sets.
- [NOVELTY.md](NOVELTY.md): source identification, author status pages, later citations, mechanism searches, access limits, and precise novelty claim.
- [verify.py](verify.py): independent exact enumeration and determinant-identity checks using Python's standard library.
- [verify_events.py](verify_events.py): literal interval-event determinants and complete membership coefficient comparisons.

Run `python verify.py`. The recorded run passed all membership coefficients for 71 fixed maps and 111,721 process pairs, including nonsurjective maps and cases with $r\geq k$. It also passed 25 dense arbitrary-matrix checks of the Schur generating identity for $k=2,\ldots,6$. These finite checks verify conventions and arithmetic; the mathematical proof is unrestricted.

Run `python verify_events.py`. The recorded run passed 342 pairs of a fixed surjection and a marked set, involving 438,952 signed integer determinants. The implementation uses the source's interval events directly and does not use the adjugate or Bernoulli formulas. Both verifiers use only Python's standard library.

Coordination and audit: [issue #85](https://github.com/1337isnot1337/solved-conjectures/issues/85). No Lean verification was used.
