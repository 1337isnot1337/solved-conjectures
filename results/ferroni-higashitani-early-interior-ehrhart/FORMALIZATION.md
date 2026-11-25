# Lean formalization of Question 5.12(a)

Lean proves the existence of a lattice polytope in the standard integral
coordinates with integer decomposition at every positive dilation. Its
Ehrhart polynomial satisfies the original strict inequality.

```math
  |E_P(-2)|^2 < |E_P(-1)|\,|E_P(-3)|.
```

The final theorem is `FerroniHigashitani.question_5_12a`. It uses the
dimension-170 witness from the written proof and gives the stronger IDP
property, which implies very ampleness under the definition in §2.1 of the
source. [Lean theorem](../../lean/Conjectures/FerroniHigashitaniEhrhart.lean) · [Original question](https://arxiv.org/html/2307.10852v4#S5.SS2)

The formal proof constructs the six vertex boxes as a finite integral convex
hull. An explicit real linear equivalence identifies the refined lattice
with the ordinary integral coordinate lattice. It uses affine halfspaces
to identify the topological interior and proves the closed and interior
coset correspondences. [Cayley-box construction](../../lean/Conjectures/FerroniHigashitaniPolytope.lean) · [Interior count](../../lean/Conjectures/FerroniHigashitaniInterior.lean)

The closed count of the degree-two polytope at dilation $k$ is the
difference of weighted composition prefixes at $2k$ and $2k-6$. The
binomial-basis proof constructs a polynomial for the weighted prefix and
derives its reflected evaluations. This gives the unique Ehrhart polynomial
by its values at every positive integer and identifies the three negative
evaluations with the actual interior counts. Lean checks the strict numerical
inequality by kernel reduction. [Weighted composition proof](../../lean/Conjectures/FerroniHigashitaniPrefixPolynomial.lean) · [Ehrhart polynomial](../../lean/Conjectures/FerroniHigashitaniEhrhart.lean)

The formal scope is the original question and the explicit witness. The
written unbounded-ratio family and regular unimodular triangulation remain
supplements. [Written proof](PROOF.md) · [Independent audit of the written proof](AUDIT.md)

The scoped receipt records strict compilation of the full import closure,
the transitive axiom audit of every owned declaration, and stock-kernel
replay. The repository-wide workflow and deployment are separate checks.
[Receipt](../../docs/verification/lean-ferroni-higashitani-complete-20261124/receipt.json)
