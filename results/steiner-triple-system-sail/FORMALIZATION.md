# Lean verification of the Steiner triple system sail theorem

For every red–blue block coloring of a finite Steiner triple system of order $n>1$, let $L$ count its monochromatic sails. Lean proves

```math
(294n-288)L\ge n(n-1)\bigl[n(n-3)-81(n-1)\bigr].
```

In particular every coloring has a monochromatic sail for $n\ge84$. A sail consists of four distinct blocks on seven points. The three blocks through the center intersect one another only there. Each meets the transversal in its prescribed point. The four blocks uniquely determine the center and transversal, and their union is the support used in the packing theorem. [System and blocks](../../lean/Conjectures/SteinerSailSystem.lean) · [Recovery and seven points](../../lean/Conjectures/SteinerSailGeometry.lean) · [Intersections and support](../../lean/Conjectures/SteinerSailShape.lean).

The proof counts the two colors of neighbors and the number of spokes that agree with each outside transversal. For a disjoint pair of opposite-colored blocks, an odd row or column in their pair-color array gives a point–block witness. Counting those witnesses and bounding the degree variance gives the displayed inequality. If $A$ is the set of all sails, then $6\lvert A\rvert=n(n-1)(n-3)$, and for $n\ge5$ Lean proves

```math
\frac{L}{\lvert A\rvert}\ge\frac1{49}-\frac4n.
```

[Spoke-count identity](../../lean/Conjectures/SteinerSailSpokes.lean) · [Opposite-colored pairs](../../lean/Conjectures/SteinerSailCover.lean) · [Quantitative count](../../lean/Conjectures/SteinerSailCount.lean).

Each point belongs to exactly $7(n-1)(n-3)/6$ sails. For $n>3$, one color has a family $M$ of pairwise vertex-disjoint sails satisfying

```math
3L\le49(n-1)(n-3)\lvert M\rvert .
```

For $n\ge5$, one such family satisfies $4802\lvert M\rvert\ge n-196$. This gives the asymptotic one-color packing rate $1/4802$ from below. In particular every coloring contains $k$ disjoint sails of one color whenever $n\ge4802k+196$. Lean also proves the density and packing statements with their epsilon quantifiers uniform over systems and colorings. [Point incidences](../../lean/Conjectures/SteinerSailPointCounts.lean) · [Disjoint packing](../../lean/Conjectures/SteinerSailPacking.lean) · [Ramsey and asymptotic theorems](../../lean/Conjectures/SteinerSailTheorems.lean).

## Verification

Two independent runs compiled all 14 modules with warnings treated as errors and audited 191 declarations, including 160 theorems, one private declaration and all 73 named endpoints. Both replayed the pinned stock Lean kernel. The axiom audit found only propositional extensionality, classical choice and quotient soundness. [Verification receipt](verification/lean-receipt.json).

The original checker covered all 4,224 colorings at orders seven and nine, including 24,576 disjoint opposite-colored block pairs, and fourteen larger colorings at orders 87 and 127. A second checker enumerated four-block subfamilies directly, identified 1,780 distinct sails on four systems of orders seven through 21, and checked 4,352 colorings. At order 21 it constructed a one-color packing of three disjoint sails. [Original verifier](verify.py) · [Four-block and packing verifier](check_packing.py).

If you use this result, please credit Granath, Gyárfás, Hardee, Watson and Wu for the original Ramsey question, and cite both Cinna Davis’s site and the particular proof or source you used. [Original paper](https://users.renyi.hu/~gyarfas/Cikkek/182_jcd1.pdf) · [Gyárfás’s Question 2.8](https://real.mtak.hu/162708/1/ejc40.pdf) · [Cinna Davis](https://itsdavis.com/) · [Theorem and source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/steiner-triple-system-sail).
