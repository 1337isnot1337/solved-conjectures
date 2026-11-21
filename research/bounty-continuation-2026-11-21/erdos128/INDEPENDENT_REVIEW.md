# Independent review of the sparse-half compression attempt

21 November 2026. Reviewed sources:

- [Target and prior-work audit](target-and-prior-audit.md), SHA256 `93352222ec434c43a9b2eb10306fd36fa55d6d2cfb288cd1fdd50564f228f915`.
- [Compression and spectral gaps](compression-and-spectral-gap.md), SHA256 `5de1f50bdeba170690920ab99f8181d58ce2832b90de32469ce694c5ac19250d`.
- [Threshold-conditional compression](conditional-compression-gap.md), SHA256 `d4217068bf91d7d09ef4fa43a921c616b56a9ea812896faf139031f0729b3eb3`.

The mathematical claims pass this written review. The notes disprove an unconditional compression rule and a general spectral rounding rule, then derive necessary conditions for a hypothetical counterexample. They do not prove or refute Erdős 128. No Lean verification or additional bounty completion is reported.

## Weighted objective and rounding

The objective counts each undirected edge once. Moving mass between two fractional coordinates has zero quadratic coefficient for a nonedge and negative quadratic coefficient for an edge. In either case its minimum on the feasible transfer interval occurs at an endpoint. Repeating leaves at most one fractional coordinate. For uniform weights and even order, the fixed half-mass condition rules out a remaining fractional coordinate. This justifies using cardinal half-sets in the 16-vertex example.

Rational vertex weights have even-order uniform blow-ups with exactly the same aggregated feasible polytope. For real weights, clipping a feasible point to nearby capacities loses at most their total absolute change; the available new capacities allow that mass to be restored. The objective is continuous under these bounded changes. A minimum-support weighted counterexample is consequently a legitimate conditional device. The odd-order convention in the original target is also respected: discarding the single fractional vertex leaves a cardinal floor-half with no larger edge sum.

## Clebsch calculation and quotient scope

I checked the five XOR differences, the absence of a triangle, and the eigenvalue formula $`4-2j+(-1)^j`$. With an eight-set indicator written as a constant half plus an orthogonal vector, the latter has squared norm four. The least eigenvalue $`-3`$ therefore gives at least four induced edges. The displayed eight-set realizes four; the displayed set after cloning realizes three. These exact upper and lower bounds suffice without a search for the modified graph's optimum.

The five-coordinate quotient model identifies nonneighbors with weight-two cosets. Coordinate permutations and translations act transitively on ordered nonedges, so the same strict loss occurs for every allowed opposite-pair choice and direction. Merging the cloned twins preserves the fractional weighted objective because all remaining contributions depend only on the sum of their two masses. The note correctly keeps the doubled weight in the 15-vertex quotient; it never substitutes an unweighted seven-set calculation.

The original value is $`1/64<1/50`$. This only refutes unconditional monotonicity. It does not refute a theorem whose hypothesis already requires a counterexample above $`1/50`$.

## Spectral comparison

I independently read [Balogh–Clemen–Lidický–Norin–Volec, Theorem 1.6](https://arxiv.org/pdf/2204.00093). It supplies the stated signless-Laplacian bound for every triangle-free graph. In a nonempty binary Cayley graph, some adjacency eigenvalue is negative because the trace is zero and the constant eigenvalue is positive. Its Walsh eigenvector is therefore nonconstant and balanced. Expanding the positive-level-set indicator gives exactly $`e(S)=n(k+\lambda_{\min})/8`$. The arithmetic $`15/752<1/50`$ is correct. This settles the candidate Cayley family by prior work, rather than producing a new general solution.

For Petersen, an intersecting family of four two-subsets is a star, and every outside vertex is disjoint from exactly two members of that star. Any five-set with at most one edge would contain such an independent four-set and contradict this fact. A star plus an outside vertex attains two edges. Thus the general rounding claim really does fail at $`nq_{\min}/8=10/8`$, while Petersen itself satisfies the conjecture at equality.

## Conditional compression

When the union of two nonadjacent vertices' neighborhoods is independent, completing both to that union adds no triangle. Edge addition cannot decrease the minimum objective, and merging the resulting false twins preserves it. This produces a smaller weighted counterexample if one existed. I checked the compatible prior homomorphism statement in [Norin–Yepremyan, Lemma 2.2](https://arxiv.org/pdf/1311.5818).

Hence private neighborhoods in a minimum-support counterexample must have a cross edge. Maximal triangle-freeness supplies a common neighbor. The resulting five-cycle is induced: its possible chords are excluded either by privacy or by triangle-freeness. Two common neighbors give the stated duplicated-vertex five-cycle configuration. These local configurations do not classify the whole graph.

For the weighted-codegree calculation, both proposed halves have exactly mass one half and satisfy every capacity bound. If $`d\le a`$, the multiplier $`(1-2a)/b`$ is at most one; adding the isolated-from-$`B`$ vertex mass gives the contradiction. Thus $`a\lt d<1/2`$. In the second construction, the multiplier $`(1-2d)/b`$ is strictly between zero and one. Its internal energy is bounded by $`(1-2d)^2/50`$, and its cross energy is precisely bounded by the weighted-codegree sum stated in equation (2).

Dividing the necessary strict excess by $`p\sum_y\nu(y)=(1-2d)/2`$ gives

```math
\frac{4d(1-d)}{25(1-2d)}.
```

The asserted large-codegree vertex follows by averaging. For uniform Clebsch weights the threshold is $`11/120`$, below its actual common-neighborhood mass $`1/8`$, so that example creates no contradiction with the necessary condition.

## The terminal gap remains

I read [Razborov, Section 4.6](https://arxiv.org/pdf/2104.09406), including its explicit reason for returning to absolute cardinalities: blow-ups need not preserve girth. Its bound on the cross term uses at most one unit-weight common neighbor. The analogous weighted common neighbor may be heavy. The note correctly leaves this additional terminal theorem unproved.

Large weighted codegree does not remove private cross edges, establish a nondecreasing merge, or bound that heavy common neighbor strongly enough. The necessary conditions are consistent; no final contradiction or full-target conclusion has been supplied. The payment and full prior-art search are separately recorded in the author's audit and are not independently certified in full by this mathematical review.
