# Fractional general position conjecture for square grids

Let $`P_n`$ be the path on $`n`$ vertices. The fractional general position number of $`G`$ is the maximum sum of nonnegative labels on its vertices, subject to the sum along every geodesic being at most two. We prove [Conjecture 5.38 in arXiv:2501.19385v5](https://arxiv.org/html/2501.19385v5#S5.SS4) with exactly its two parity quantifiers.

- For every even $`n\ge4`$ the answer is the maximum over integers $`0\le t\le n/2`$ of

```math
\frac{2(n^2-2t(t+1))}{2n-2t-1}.
```

- For every odd $`n\ge3`$ the answer is the largest of the two expressions

```math
\frac{n^2+1-8k^2}{n-2k},\qquad \frac{n^2-1-8k(k+1)}{n-2k-1}
```

over their respective integer ranges in Theorem 5.37 of the survey. Equivalently, put $`L=\lfloor\sqrt{(n^2-1)/2}\rfloor`$ and $`t=n-1-L`$. The optimum is the larger of the checkerboard values with corner cutoffs $`s=t,t+1`$:

```math
\max_{s\in\{t,t+1\}}\frac{n^2+1-2s^2}{n-s}.
```


## Why the upper certificate proves the claim

Grid geodesics are monotone in each coordinate and extend to a geodesic between one of the two pairs of opposite corners. A fractional geodesic cover is an assignment of nonnegative path weights such that the total weight through each vertex is at least one. A cover of weight $`2W`$ bounds the fractional general position number above by $`4W`$: sum every geodesic inequality against the weight of that geodesic. The matching feasible primal labelings are the ones already given by Fitzpatrick, Janssen and Nowakowski.

The proof constructs a distribution of paths for one corner pair and reflects it to obtain the other. In rotated coordinates a layer is a signed rank, and moving from layer to layer shifts position by one. The through-flow on the active ranks is a constant plus a difference of vertex potentials of an auxiliary rank graph. Laplacian solvability makes every layer carry the same total mass. This alone would not make the layer masses transportable. The boundary recurrence proves a parity-stride convexity condition on the potentials; it forces the cumulative layer masses to interlace, so they are the marginals of actual legal paths. Outside the active ranks, the remaining row surplus goes to the two extremes.

- [Even-order proof](EVEN-EXACT.md): one bipartite rank graph, exact cell coverage on its active square, and the complete transport lemma.
- [Odd-order proof](ODD-EXACT.md): two rank graphs, one for each checkerboard parity; a separate mass for each preserves the same legal interlacing.

The proof is symbolic for arbitrary side length. The optional [exact verifier](verify.py) certifies the floor choices, the primal longest paths, the dual row marginals, each legal mass coupling and each cell cover at selected orders. The exact optimum also closes the asymptotic gap:

```math
\mathop{\mathrm{gp}}_f(P_n\square P_n)=(4-2\sqrt2)n+O(1).
```

This follows immediately by optimizing the formulas in the two parity cases; in the even case compare the continuous maximizer and a nearest integer, and in the odd case use the explicit cutoffs above. The proof does not assert an exact formula for nonsquare rectangular grids or a result for the integral isometric path number.
