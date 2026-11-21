# Independent review of the Erdős 600 partial deductions

21 November 2026. Reviewed source: `agents/demath_zzz/erdos600-target-and-augmentation.md`, SHA256 `2fbbdf7b72638adf7d288bbeea90625bed0d4caaba302b2532a9ca8759c97ef5`.

The normalized threshold identity, corrected vertex edit, subsequential gap theorem, and monotone-augmentation obstruction pass written review. The full lower-limit statement is not proved. This review makes no priority claim.

## Vertex edits

Removing v can destroy the only triangle through an old edge. The corrected proof tracks precisely these edges in P_v. Every such edge already has zero triangles in G−v, so deleting it cannot destroy a triangle of G−v. Edges deleted in addition to the star of v are outside the induced graph on S, so G[S] is preserved. The retained old edges have either an old triangle avoiding v or the restored triangle through v. Each old edge gains at most one common neighbor, and each new edge has the prescribed induced degree in S. The exact gain includes the orphan-edge loss. In the booksize-one case the neighborhood is a matching, making that loss unavoidable unless its endpoints are retained.

The clone construction uses a nonadjacent twin. Existing edges within the old neighborhood gain one common neighbor; all other old edges retain their counts. New twin edges have the old counts. Maximum degree at least average degree gives the displayed one-vertex inequality. No claim for an unchanged booksize cap is used.

## Growth and telescoping

The triangle-removal input is a stated classical theorem. For fixed cap, there are only O(n²) triangles, hence o(n³), so the deletion set has size o(n²). Each deleted edge covers at most 2r−1 original edges through the union of its boundedly many triangles. This proves the required subquadratic edge bound.

The supplied ternary-digit construction is valid: numbers with digits0 and1 have no nonconstant three-term progression because both sides of a+c=2b have no ternary carries. Each of the three pair types in a prescribed tripartite triangle determines its parameters uniquely. An additional triangle would force a forbidden nonconstant progression. Padding to arbitrary orders gives divergence of F_r(n)/n, without assuming a limit only on a sparse subsequence.

Dividing the cloning inequality by n(n+1) telescopes exactly. The final normalized term tends to zero by the subquadratic bound. The nonnegative tail may be infinite, which is allowed. Its comparison with the telescoping weight sum proves arbitrarily large gaps at arbitrarily late indices. It proves a limsup statement only. A lower limit tending to infinity does not follow.

## Uniform obstruction and final gap

For KG(6,2), the common-neighbor counts are 1 for disjoint pairs, 3 for distinct intersecting pairs, and 6 for identical vertices. They multiply in the categorical powers. A distinct nonedge has at least one coordinate of the latter two kinds and therefore at least 3 common neighbors. Independent t-fold blow-up multiplies each count by t; pairs within one fiber have the stated degree count. With t=r−1, every nonedge has more than r common neighbors, so any added edge violates the relaxed cap. This disproves universal monotone augmentation even at unbounded order and degree, but says nothing about whether these graphs are extremizers.

The ordinary deletion estimate retains the private-edge loss and is too weak to imply the proposed sufficient increment bound. The source correctly leaves the actual liminf estimate unproved. These deductions do not add a completed bounty target.

