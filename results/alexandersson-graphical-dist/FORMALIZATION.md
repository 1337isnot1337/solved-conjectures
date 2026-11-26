# Lean verification of the graphical dist counterexample

Lean defines the ordered graph on 71 vertices, verifies its 310 distinct edges, and defines its graphical dist polynomial by summing over all acyclic orientations. For each vertex the statistic counts incoming edges from earlier vertices. Each orientation contributes one monomial whose exponent counts its distinct positive earlier indegrees. The proof also characterizes acyclicity by the existence of a strictly increasing integer rank. [Ordered graph and orientation sum](../../lean/Conjectures/GraphicalDistGraph.lean).

The polynomial obtained by the two independent orientation counts has degree twelve and exactly ten distinct real roots and two nonreal roots counted with multiplicity. Lean checks all thirteen integer coefficients of the displayed polynomial in this root calculation. It proves the Laguerre inequality fails at $-4/3$ for the original polynomial $D$, and verifies ten sign changes on disjoint rational intervals. Its value at one is $2\cdot 3^{42}\cdot10!\cdot11^{18}$. [Polynomial and exact root certificates](../../lean/Conjectures/GraphicalDistPolynomial.lean) · [Subset-inversion count](check.py) · [Independent support-union count](check_unions.py).

The good placements of a new vertex attached to an oriented edge are exactly its three gaps in the old order. Lean constructs a topological rank for each placement and proves that the fourth assignment creates a directed cycle. It proves the four page factors and their products for an arbitrary number of pages. [Triangle insertion and finite product identities](../../lean/Conjectures/GraphicalDistInsertions.lean).

For every positive even $r$ the polynomial below has degree $r$ and exactly $r$ distinct nonreal zeros. Its derivative is nonzero at every zero, and its value on the real axis is positive. This establishes the root count of the limiting polynomial for the separate treewidth-two family. [All-order root theorem](../../lean/Conjectures/GraphicalDistMixture.lean).

```math
(1+2z)^r+(2+z)^r.
```

The identity between the full orientation sum of the 71-vertex graph and the computed coefficients remains a hypothesis in Lean. The reviewed counting argument establishes that identity, and the written convergence argument transfers the limiting zeros to the chordal family. The catalogue records partial Lean verification. [Exact formal scope](../../lean/Conjectures/GraphicalDistTheorems.lean) · [Counting and convergence proof](proof.md) · [Independent review](review.md).

Two independent runs strictly compiled 10 modules and audited 138 declarations, including 111 theorems, 5 private declarations and 52 named endpoints. Both runs replayed the stock Lean kernel and found only propositional extensionality, classical choice and quotient soundness in the transitive axiom audit. [Exact verification receipt](verification/lean-receipt.json).

If you use this verification, please credit Cinna Davis and GPT-6.2 Astra for the construction and Per Alexandersson for the original conjecture. Cite the author’s site and the specific proof or check you used. [Cinna Davis](https://itsdavis.com/) · [Result record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/alexandersson-graphical-dist) · [Original question](https://github.com/PerAlexandersson/RealRooted/issues/2641).
