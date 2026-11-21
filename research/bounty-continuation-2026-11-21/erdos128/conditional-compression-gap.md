# Erdős 128: the threshold-conditional compression attempt

21 November 2026. Status: exact necessary conditions for a hypothetical counterexample; no contradiction, full proof, counterexample, novelty claim, or bounty completion. This note continues the [initial route checks](compression-and-spectral-gap.md).

## 1. The assertion that the Clebsch witness does not disprove

The original target would benefit from a theorem of the following form: whenever a weighted triangle-free graph has minimum-half density greater than $`1/50`$, an opposite pair in an induced four-cycle admits a mass merge that does not lower that density. The Clebsch example has density $`1/64`$ and therefore says nothing against this conditional assertion. It only defeats the unconditional version.

Moreover, a sequence of mass merges would finish with a weighted quotient. [Razborov's girth-five theorem](https://arxiv.org/pdf/2104.09406), Theorem 3.8 and Section 4.6, concerns ordinary vertex counts. The proof explicitly uses the fact that every vertex outside a chosen closed neighborhood has at most one neighbor in its open neighborhood, with each vertex contributing unit mass. Arbitrary blow-ups introduce four-cycles. Thus the published terminal theorem cannot silently be substituted for the corresponding weighted statement.

The attempt below separates a valid homomorphic compression from the missing guarantee that such a compression exists above the threshold.

## 2. Weighted minimality is legitimate

For positive vertex weights summing to one, use the functional $`\beta(H,w)`$ defined in the companion note. Rational weights are represented by a uniform blow-up of even order. Aggregating the independent clone classes preserves both the objective and the feasible fractional-half polytope, and a uniform graph of even order has a cardinal-half minimizer. Real weights follow by approximation and continuity of the minimum. For continuity, a feasible half can first be clipped to new capacities and then replenished by at most the total lost mass; total capacity remains one.

Consequently, if the original target fails, some weighted counterexample exists. Choose one with the fewest positive-weight vertices. Every weighted triangle-free graph on fewer vertices then has minimum-half density at most $`1/50`$. This includes every proper induced subgraph after renormalizing its weights. We may add edges until the selected graph is maximal triangle-free, since adding edges cannot decrease the minimum.

This use of minimality is conditional. No counterexample is assumed to exist in the conclusions about the target's status.

## 3. A safe compression and its exact structural obstruction

Let $`u,v`$ be nonadjacent. If $`N(u)\cup N(v)`$ is independent, add every missing edge from each of $`u,v`$ to that union. This preserves triangle-freeness and does not decrease $`\beta`$. The two vertices are now false twins. Merge their masses and delete one vertex. Aggregating their half coordinates preserves the minimum exactly. This contradicts minimum-support counterexample status.

This is an instance of the established homomorphism transfer in [Norin–Yepremyan, Lemma 2.2](https://arxiv.org/pdf/1311.5818). It is not a newly asserted general symmetrization theorem. The operation uses the union neighborhood and can add edges; it is stronger than merely choosing one of the two original neighborhoods as the cloning template.

Therefore a minimum-support weighted counterexample satisfies, for every nonedge $`uv`$,

```math
E\bigl(N(u)\setminus N(v),\ N(v)\setminus N(u)\bigr)\ne\varnothing.
```

Indeed, each individual neighborhood is independent, and no common neighbor can be adjacent to either private neighborhood, by triangle-freeness. Hence any edge in the union must run between the two private parts.

In a maximal triangle-free completion, every nonedge also has a common neighbor. A private cross edge, together with one common neighbor, gives an induced five-cycle through $`u,v`$. If $`u,v`$ have two common neighbors, the six indicated vertices induce a five-cycle with that common-neighbor vertex replaced by two false twins. These assertions do not force the entire graph to be a blow-up of a five-cycle. The Clebsch and Petersen graphs already show that these local structures allow other cores.

## 4. An inductive weighted-codegree condition

Let $`(H,w)`$ be a minimum-support weighted counterexample, and fix a vertex $`v`$. Write

```math
a=w(v),\qquad A=N(v),\qquad d=w(A),\qquad
B=V(H)\setminus(\{v\}\cup A),\qquad b=w(B)=1-a-d.
```

First,

```math
0\lt a\lt d<\tfrac12.                                      \tag{1}
```

The alternatives $`a\ge1/2`$ or $`d\ge1/2`$ give a half contained in an independent set. If instead $`d\le a<1/2`$, then $`b>0`$. Minimality gives a half $`\nu`$ on $`B`$ of mass $`b/2`$ and energy at most $`b^2/50`$. Include all mass $`a`$ at $`v`$, omit $`A`$, and multiply $`\nu`$ by $`(1-2a)/b\le1`$. There are no edges between $`v`$ and $`B`$, so the resulting half has energy at most $`(1-2a)^2/50<1/50`$, a contradiction. This proves (1).

For $`y\in B`$, define the weighted common-neighborhood mass

```math
c(v,y)=\sum_{z\in N(v)\cap N(y)}w(z).
```

Take a sparse half $`\nu`$ on the normalized proper induced graph $`H[B]`$, rescaled to mass $`b/2`$ and energy at most $`b^2/50`$. Include all of $`A`$, exclude $`v`$, and scale $`\nu`$ by

```math
p=\frac{1-2d}{b}\in(0,1).
```

This is a feasible half. Its energy is at most

```math
\frac{(1-2d)^2}{50}
  +p\sum_{y\in B}\nu(y)c(v,y).                       \tag{2}
```

Because every half of the assumed counterexample has energy greater than $`1/50`$, (2) implies

```math
\frac{\sum_{y\in B}\nu(y)c(v,y)}{\sum_{y\in B}\nu(y)}
>\frac{4d(1-d)}{25(1-2d)}.                           \tag{3}
```

In particular, some nonneighbor $`y`$ with $`\nu(y)>0`$ satisfies

```math
c(v,y)>\frac{4d(1-d)}{25(1-2d)}.                     \tag{4}
```

This is an exact necessary condition, obtained from a particular feasible half and proper-subgraph minimality. It does not assert a uniform bound on all common neighborhoods. If the quotient has girth at least five, its common neighborhood has at most one vertex, so (4) forces an individual neighbor with weight greater than the displayed quantity. It does not eliminate that heavy-vertex case.

As a scope check, the uniformly weighted Clebsch graph has $`d=5/16`$, common-neighborhood mass $`1/8`$, and right side $`11/120`$. Thus the numerical inequality in (4) is compatible with this known below-threshold graph. The Petersen graph is also compatible with the conditions and meets the conjectured threshold. No positive finite test is being promoted to a uniform conclusion.

## 5. Exact stopping point

The safe union-neighborhood compression fails precisely when private neighborhoods contain an edge. Minimality and the candidate half in Section 4 force a large common-neighborhood mass, but do not eliminate those private cross edges, prove that either original-neighborhood mass merge preserves $`\beta`$, or handle the weighted girth-five terminal case. Those are separate missing mathematical implications.

The hypothesis $`\beta>1/50`$ has been retained throughout the conditional argument. The below-threshold Clebsch example is not a disproof of that hypothesis-dependent bridge. No full-target conclusion follows from the necessary conditions above.
