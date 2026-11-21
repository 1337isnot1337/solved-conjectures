# Independent root review

21 November 2026. The complete written argument in PROOF.md was checked against the primary source, arXiv:2609.38084v1, Sections 2.1 and 3.1, including Corollary 3.13 and Conjecture 3.14. This review is ordinary mathematical review, not formal verification.

The source defines finite-order ultra log-concavity by division by the binomial coefficient at the degree. Its two coefficient distributions are exactly the ceiling of half the maximum Dyck height at semilength n and one plus the floor of half the maximum height at semilength n−1. The different Catalan normalization constants in the proof are necessary and correct. The source's Delest–Viennot maps justify both formulas.

The size-bias proof of the necessary variance bound permits the initial zero coefficient: the likelihood ratio has the correct infinite and zero endpoint conventions and crosses once. The coefficient supports have no internal zeros, because Dyck paths attain every possible positive maximum height. Finite-degree ultra log-concavity implies the stated Poisson-normalized inequalities.

The path-adjacency eigenvalue formula, the positive contribution from both extremal eigenvalues, and the resulting lower-bound constant are correct. The ballot midpoint computation includes the required parity mesh of two. The reflection bound and the N^(3/4) cutoff prove a sublinear mean. Two uniformly positive separated height events give a linear variance lower bound after either rounding. Their combination forces failure for every sufficiently large size; it does not extrapolate a finite calculation.

I ran check.py independently. All four recorded exact coefficient triples agree between confined Dyck walks, the reflection binomial sum, and bicolored Motzkin walks. The source examples and Catalan totals also pass. The finite-degree failures below 200 contradict the source's reported numerical check, but they follow from its literal definition and formulas. The two weaker Poisson failures above 200 and the arbitrary-size argument do not depend on that discrepancy. No cause of the discrepancy is inferred.

No mathematical gap was found in the complete argument. Prior-art review remains a separate gate; this review makes no absolute priority claim.
