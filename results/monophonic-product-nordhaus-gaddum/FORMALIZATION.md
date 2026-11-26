# Lean verification of the monophonic product counterexample

The triangle-expanded triangular prism, with every edge subdivided once, has 45 vertices. Lean proves that its independent monophonic chromatic number is 20 and its complement’s is 27. This refutes the product assertion of Conjecture 9.3 because

```math
20\cdot27=540>529=\left(\frac{45+1}{2}\right)^2.
```

A valid coloring is proper, and every induced path contains at most two vertices of any color. Lean identifies the injective path sequences used in the proof with Mathlib graph embeddings of the path graph. The witness is explicitly isomorphic, with adjacency preserved and reflected, to the subdivision of the triangle-expanded prism defined by its stations, ports and edge endpoints. [Coloring definition](../../lean/Conjectures/MonophonicProductPaths.lean) · [Explicit isomorphism](../../lean/Conjectures/MonophonicPrismIsomorphism.lean) · [Counterexample](../../lean/Conjectures/MonophonicPrismTheorems.lean).

## Why the witness needs 20 colors

There are 14,190 unordered triples. The 45 listed induced paths cover 14,172 of them. Each of the remaining 18 triples consists of the three subdivision vertices incident with one original vertex. The proof checks every adjacency and nonadjacency in each path, then verifies the finite covering calculation in the stock kernel. [Paths](../../lean/Conjectures/MonophonicPrismRoutes.lean) · [Coverage proof](../../lean/Conjectures/MonophonicPrismCoverage.lean).

A color class of size at least three therefore exhausts a subdivision star. The stars around two ports of the same triangle overlap, so at most six colors can contain three vertices. The other colors contain at most two vertices each. An explicit valid coloring attains 20. All 27 subdivision vertices form a clique in the complement, and an explicit proper coloring using 27 colors has every class of size at most two. [Upper colorings](../../lean/Conjectures/MonophonicPrismColorings.lean) · [Lower bound](../../lean/Conjectures/MonophonicPrismCounterexample.lean).

## The infinite family

For every prism length $s\ge3$, Lean proves that the subdivided graph has $15s$ vertices and its complement needs exactly $9s$ independent monophonic colors. The subdivision vertices form a clique in the complement. Pairing each original port with the subdivision vertex of its outgoing triangle edge colors the complement optimally. The all-order formula $\lceil13s/2\rceil$ for the original graph remains in the written proof. [General construction](../../lean/Conjectures/MonophonicPrismConstruction.lean) · [Written family proof](PROOF.md).

The original independent enumerator checked 322,899 induced-path states, 18,570 terminal orientations and 262,144 possible star-center sets. Its exact chromatic numbers agree with the Lean proof. [Independent checker](verify.py).

Two independent runs strictly compiled all 19 modules. Each audited 231 declarations, including 164 theorems, 6 private declarations and all 107 registered endpoints. Both passed stock Lean kernel replay with only propositional extensionality, classical choice and quotient soundness in the axiom audit. [Kernel verification receipt](verification/lean-receipt.json).

If you use the counterexample, please cite Cinna Davis’s project and the specific proof or certificate you used, and credit Chandran S.V., Di Stefano, Haritha S., Thomas and Tuite for the original conjecture. [Project](https://itsdavis.com/) · [Proof record](https://github.com/1337isnot1337/solved-conjectures/blob/f28ae784/results/monophonic-product-nordhaus-gaddum/PROOF.md) · [Original conjecture](https://arxiv.org/html/2408.13494v2#S9).
