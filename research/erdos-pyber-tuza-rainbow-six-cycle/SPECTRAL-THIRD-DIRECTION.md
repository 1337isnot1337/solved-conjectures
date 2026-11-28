# A uniform spectral gap for counterexamples

This is a stability consequence of the [two-dimensional operator classification](TWO-DIMENSIONAL-OPERATORS.md) and the [finite parity repair](PARITY-CUT.md). It applies to the original finite $C_6$ question of [Erdős #811](https://www.erdosproblems.com/811), not only to exact finite-rank models.

For an exact balanced finite six-coloring or balanced graphon, use the centered normalized operators $B_i$ and let
```math
Q=\sum_{i=1}^6 B_i^2.
```
Write $\lambda_3(Q)$ for the third-largest eigenvalue, with zeros added when necessary. For a finite coloring put weight $1/6$ of each color on the diagonal, making the step graphon exactly balanced.

**Theorem.** There exist absolute $\epsilon>0$ and $n_0$ such that any exact balanced six-coloring on $n\ge n_0$ vertices with $\lambda_3(Q)<\epsilon$ has a rainbow six-cycle. Equivalently, sufficiently large counterexamples, if they exist, have three independent nontrivial collective spectral directions above a fixed threshold.

**Proof.** Otherwise there is a sequence of finite counterexamples with $n\to\infty$ and $\lambda_3(Q)\to0$. Pass to a simultaneous colored cut limit as in [the graphon criterion](GRAPHON-CRITERION.md). The limit is exactly balanced and has zero rainbow six-cycle density: in the finite step graphons all contributions on distinct vertices vanish, and coincidence tuples have density $O(1/n)$.

Cut convergence for uniformly bounded kernels implies operator-norm convergence after relabeling. One can see this by the usual bounded-kernel cut/operator estimate, or by truncating the two unit $L^2$ test functions at height $T$, bounding their tails by $O(1/T)$ in $L^1$, and bounding the remaining integral by $O(T^2)$ times the cut norm. Thus the $B_i$ converge in operator norm and so do their squared sums. By the variational eigenvalue principle the limit has $\lambda_3(Q)=0$. Since $Q$ is positive and $\ker Q=\bigcap_i\ker B_i$, its joint mean-zero operator range has dimension at most two. The classification forces exact parity.

Cut convergence to this parity cut implies the finite step colorings have only $o(n^2)$ wrong pairs relative to an actual cut of their vertices. Use the rounding of fractional vertex cells described in [the graphon criterion](GRAPHON-CRITERION.md). This contradicts the finite parity repair theorem, completing the proof.

The same argument without the final repair gives a graphon statement: for every prescribed $L^1$ tolerance from an exact balanced parity palette there are positive spectral and rainbow-density tolerances such that any balanced graphon below both is within that tolerance of a parity palette. In that statement only the sum of the three palette kernels is required to approximate the parity indicator, not the individual kernels. The compactness argument does not give useful numerical values of the tolerances. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
