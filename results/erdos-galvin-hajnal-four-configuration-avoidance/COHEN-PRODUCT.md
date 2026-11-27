# Cohen forcing for simultaneous four-pattern avoidance

Follow-up to Erdős–Galvin–Hajnal’s four-configuration avoidance problem, [1975 Problem 9/C](https://old.renyi.hu/~p_erdos/1975-24.pdf#page=58), and the general ccc construction in [#1082](https://github.com/1337isnot1337/solved-conjectures/pull/1082).

**Theorem.** Over every ground model of ZFC, adding \(\omega_1\) Cohen reals produces an \(\aleph_1\)-chromatic triple system on \(\omega_1\) omitting all four patterns of 9/C. This is an actual Cohen product, not just a ccc forcing of the same cardinality. No single-Cohen claim is made.

## The modified conditions

A condition consists of a finite support \(s\subseteq\omega_1\), a graph \(S\) on \(s\), and a threshold \(b(v)<v\) for each positive \(v\in s\), with \(b(0)=0\) if needed. Put \(H=\{\text{triangles of }S\}\). Require:

- If two distinct members of \(H\) share a pair, it is the bottom pair of both.
- Every graph edge \(uv\) with \(u<v\) satisfies \(b(v)\le u\).

The order extends the threshold function and preserves the **induced graph** \(S\) on the old support, not just its triangles. In particular a graph edge may temporarily have no triangle. This is the change that allows restriction to initial segments.

Suppose finitely many conditions form a delta system with common initial root \(R\), and their induced graphs and thresholds agree on \(R\). Their graph union is a common extension. A triangle cannot use two different petals; all root graph edges in any triangle in one support were already present in its graph. If two triangles in different petals share a pair, it lies in \(R\) and their outside vertices are both above \(R\); if one triangle is in the root, use the old condition containing both to check it. Thresholds are unchanged. The \(\Delta\)-system argument at \(\omega_1\) therefore gives the ccc.

As before, if three such conditions have respective marked petal vertices \(x_i\) isolated from the root and all the \(x_i\)'s are above all three thresholds \(b(x_i)\), then add the three new graph edges between the marks. These cross edges are not inside any old support, so induced extension is preserved. They give exactly one new triangle: a third vertex in the root is excluded by isolation, and a third vertex in a petal gives a necessary cross edge only if it is the mark of that petal. None of the triangle's pairs occurred previously, so no bottom-pair violation is created.

## Why this forces the same positive answer

For an alleged countable coloring name, use exactly the two press-down steps from #1082 with \(S\upharpoonright R\) in the root profile. In brief, for limit \(h<x\) in a coding club, add \(x\) isolated with \(b(x)=h\) and extend to \(q_{h,x}\) deciding its color. At fixed \(h\), press down the part of the support below \(x\) to one finite \(R_h\), and fix the color and profile on \(U_h=R_h\cap h\) on a stationary set of \(x\). Press down \(U_h\) as \(h\) varies and fix the common root profile and color. Choose three \(h_i\) successively above the preceding \(R_{h_j}\), then three \(x_i\) above all the middles and successively above the earlier supports, as in #1082. These conditions have a common initial root and no root edge at a mark by the threshold \(b(x_i)=h_i\). The three new graph edges then force a monochromatic triple. This proves uncountable chromaticity.

In the generic union every triangle of \(S\) is a triple of \(H\), and every pair belonging to two distinct triples is bottom in both. These are finite-witness consequences of the conditions. The shadow of \(H\) is contained in \(S\) (equality is unnecessary); every triangle of that shadow is thus already a hyperedge. The four exclusions follow as in #1082. The chromatic number is exactly \(\aleph_1\) since the forcing preserves \(\omega_1\).

## Why the forcing is Cohen

Let \(P_\delta\) be the conditions with support contained in \(\delta\). The goal is to make restriction \(p\mapsto p\upharpoonright\delta\) a complete projection onto \(P_\delta\): whenever \(q\in P_\delta\) extends the restriction, union it with \(p\). The conditions so far do not suffice. Their intersection is exactly the root \(s_p\cap\delta\); their common induced data agree by the extension rule. There are no graph edges between their two disjoint sides. For any shared pair in separate triangles on the two sides that is not already handled within one condition, the third vertex of the \(p\)-triangle is above \(\delta\), but the third vertex of the \(q\)-triangle may lie below the common root. This needs an extra check, and is the place to use the following refinement.

**Seal low pages.** Along with \(S\), record for each graph edge \(ab\), \(a<b\), a flag saying whether it already has, or reserves, a page \(z<b\) distinct from \(a,b\). If such a page is reserved, record the actual ordinal \(z\) and include \(z\) in the support. Require that the unique triangle through \(ab\) is \(abz\) in that case. If no low page is flagged, only pages above \(b\) are permitted. The flag is immutable for old graph edges. In concrete terms an edge's low-page record is determined by its existing triangles when the edge is created, and no later extension can first create a low page for that edge. An edge low-page record is always visible in an initial restriction containing \(a,b\), because \(z<b\). The local constraints are equivalent to adding this immutability to the extension rule.

For the projection union, a shared root pair with a flagged low page has that page already in the root; neither side can add another. For an unflagged shared pair, both third vertices must be above the larger endpoint, regardless of the order of \(q\)'s added support. The repeated-pair rule therefore holds. The triangle and threshold arguments use agreement on the common shadow and do not need the \(q\)-petal to be above the root. Since any triangle of the union lies wholly in one support, no new low page is assigned to an old graph edge when forming this union. Restriction preserves flags for exactly the reason above. Consequently the restriction on the refined poset is a complete projection at every \(\delta\).

This refinement also preserves the ccc and chromaticity arguments: on an initial common root, the low-page data are already determined by the root graph. The marked-vertex extension adds one triangle with three new graph edges, so can record each edge's flag from that triangle and changes no prior flag. The isolated-mark step and all bounds are unchanged.

Now take \(\delta_\xi=\omega\cdot\xi\) for \(\xi\le\omega_1\). The chain \(P_{\delta_\xi}\) is continuous and increasing by complete embeddings. At each successor step the quotient is countable and atomless. Given any quotient condition, pick two unused points from \([\delta_\xi,\delta_{\xi+1})\), with thresholds zero, and add them with no new incident edges except possibly their mutual edge. The two choices (edge present or absent) give incompatible extensions with unchanged projection; if present, its flag is unmarked since it has no triangles. Thus they remain quotient conditions. Every countable atomless separative quotient is forcing-equivalent to one Cohen real.

The full poset is the finite-support direct limit of this continuous chain, as every support is finite. Applying the quotient identification at each stage gives the finite-support iteration of \(\omega_1\) copies of Cohen forcing, equivalently \(\operatorname{Add}(\omega,\omega_1)\).

## Scope

The immutable low-page record is essential here. Merely recording the induced shadow does not give complete projections: a low page could first be supplied on the side being amalgamated with the old condition. The flag is visible below the higher endpoint and closes that gap. This is distinct from the original ccc proof's initial-root amalgamation. Under CH the Cohen extension still satisfies CH, but the theorem says nothing about producing the four-pattern witness in every CH ground.
