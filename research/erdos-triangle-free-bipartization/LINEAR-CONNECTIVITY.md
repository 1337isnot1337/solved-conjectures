# A linear vertex-connectivity floor for counterexamples

Let G be a smallest-order counterexample to [Erdős #23](https://www.erdosproblems.com/23), in the all-order formulation β(G)>N²/25. Then **every vertex separator has size greater than cN**, where

    c = (27−√561)/42 = 0.0789… .

This is a global structural reduction, not a new finite range. It strengthens the [one-block reduction](BLOCKS.md) and does not use the density-band certificates.

## Two ways to join across a separator

Normalize the total vertex mass to 1; the proof also applies to positive vertex weights with edge cost the product of endpoint weights. Write G as S∪A∪B with no edge between A and B, separator mass s and side masses a≥b>0. Thus a=1−s−b and b≤(1−s)/2. Suppose both proper induced pieces on A∪S and B∪S satisfy the conjectured bound; this is automatic in a smallest-order unweighted counterexample. We give two upper bounds on the cost for the whole graph.

**Random insertion.** Take an optimal cut on A∪S and colour B independently and uniformly. Every edge touching B has uncut probability one half. The mass of such edges is at most sb+b²/4, using weighted Mantel inside triangle-free B and the absence of A–B edges. Therefore

    β(G) ≤ (1−b)²/25 + sb/2 + b²/8.

This is at most 1/25 whenever s ≤ 4/25−33b/100. In particular it applies for b≤1/5 and s≤c<2/25.

**Glue optimal cuts.** Take optimal cuts of A∪S and B∪S. Keep the first cut. For the second, choose its global orientation to minimize the weight of S–B edges incident to a separator vertex whose colour disagrees with the first cut. The two possible orientation costs sum to that total boundary weight, so the smaller one is at most sb/2. Now recolour the disagreeing vertices of S in the second piece to match the first. The cost added on S–B edges is no more than that smaller orientation cost. Edges within S are counted only from the first piece, so changes to them in the second piece need not be paid; this is why the same argument works whether or not S is independent. Thus

    β(G) ≤ ((a+s)²+(b+s)²)/25 + sb/2.

The right side is at most 1/25 if

    b[2−(27/2)s−2b] ≥ s².

For b∈[1/5,(1−s)/2] the left side is concave in b, so it suffices to check the endpoints. At b=1/5 it is at least 0.104>s² for s≤2/25. At b=(1−s)/2 the condition simplifies to 2−27s+21s²≥0, which holds exactly in the needed range s≤c. Together the two constructions exclude every separator of mass at most c.

Thus a smallest-order counterexample is connected after deletion of any set of at most cN vertices. This does not say that all middle-density triangle-free graphs have such connectivity.

## Graphon extremal form

The same arguments apply to measurable vertex sets A,S,B of a graphon, with no A–B edge mass, using the fractional-cost rounding for random insertion. Use unordered bipartization mass m(W)/2, as it corresponds to β above. At a global maximizing graphon, replace 1/25 in both proper-piece bounds by the global normalized maximum C≥1/25; after restricting to a set, normalize its mass. The inequalities sufficient for gluing or insertion only get weaker as C increases. At s<c the preceding checks are strict, so a global extremizer cannot have two positive-mass separated sides with separator mass <c. This is independent of the optimal-cut stationarity and the codegree saturation equations.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
