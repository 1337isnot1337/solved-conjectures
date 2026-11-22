# The averaged pilot passes the hidden-winner counterexample

Take the same VC-one class and data law as in the [pilot winner obstruction](pilot-anchor-obstruction.md): $`M`$ singleton classifiers, a uniform feature in $`[M]`$, and an independent fair binary label. For the [averaged-entropy learner](averaged-pilot-entropy.md) itself,
```math
 \lim_{M\to\infty}\limsup_{n\to\infty} I(W;S\mid \widetilde Z)=0 .
```
The limits have the same order as the previous counterexample. This proof uses the actual output kernel with its changing canonical support. It does not bound the worst distribution or cover all classes.

Condition on the independent permutation used to divide the selected observations into pilot and main blocks. The pilot contribution conditional on the main selectors is $`O(\log^{10}(en)/n)`$ by the [pilot information lemma](averaged-pilot-entropy.md). To bound the main contribution one may condition on the pilot selectors as well as the full paired pool. The two conditional-bit bounds sum to an upper bound on original CMI by independence of the two blocks' bits.

For fixed $`M`$, the main features contain all $`M`$ possibilities except with probability at most $`M(1-1/M)^s`$. On that event's complement the canonical support consists of all classifiers. For bounding information about the main data, replace the algorithm by the same optimization on the fixed set of all $`M`$ classifiers. One can couple the two outputs identically on coverage, so the difference in their conditional information is $`o_n(1)`$ at fixed $`M`$, by the mismatch-bit entropy bound $`2[h_2(e)+e\log M]`$ for mismatch probability $`e`$. The probability of any pilot feature occurring fewer than $`p/(2M)`$ times also tends to zero at fixed $`M`$ by the binomial lower tail. Its contribution to the main information conditional on the pilot data is at most its probability times $`\log M`$.

On a good pilot, a uniformly chosen subset of $`m_j`$ pilot positions misses a given feature with probability at most $`e^{-m_j/(2M)}`$ by sampling without replacement. If $`m_j\ge 2M\log(2M)`$, the restriction therefore sees all features with probability at least $`1/2`$. In that case the restriction entropy is exactly the full entropy on the $`M`$ classifiers. Let $`j_0=\lceil\log_2(2M\log(2M))\rceil`$. For $`n`$ sufficiently large at fixed $`M`$, every level $`j_0\le j\le 2j_0`$ belongs to the construction. The objective Hessian in directions $`v=\dot q/q`$ is at least $`b\mathbb E_q v^2`$, where
```math
 b\ge \tfrac12\sqrt n\sum_{j=j_0}^{2j_0}(j+1)^{-3}
 \ge c\sqrt n/(1+\log M)^2 .
```
This holds at every interior law, for any main costs.

Keep the pilot fixed and let $`q_0`$ be the optimizer with all main costs equal. Interpolate from constant costs to the observed costs. With $`G_i`$ the signed label gain at feature $`i`$ on the main block, the added costs are $`-G_i`$ up to a common constant. The differentiated optimality identity in the [pilot proof](averaged-pilot-entropy.md) gives square-root path length at most $`\max_i|G_i|/(2b)`$, using the zero constant when bounding the $`L^2(q)`$ norm of the centered cost. Total variation is bounded by the unnormalized square-root distance and hence by that path length.

For fixed $`M`$, $`G/\sqrt{s/M}`$ converges to $`M`$ independent standard normals by the multivariate CLT, since the signed feature vectors have mean zero and covariance $`I/M`$. The expectation of its maximum absolute coordinate converges too: its squared maximum is bounded by the squared Euclidean norm, whose expectation is $`M`$. The Gaussian maximum has mean at most $`\sqrt{2\log(2M)}`$ by the exponential moment bound. Thus, uniformly over good pilots, the limiting upper bound on the expected total variation from $`q_0`$ is
```math
 \delta_M=O\big((1+\log M)^{5/2}/\sqrt M\big).
```
The pilot is independent of the main block, and $`q_0`$ is fixed given the pilot. On an alphabet of size $`M`$, laws at distance $`e`$ have entropy difference at most $`h_2(e)+e\log M`$, by maximal coupling and a mismatch-bit code. Both the conditional output laws and their mixtures may be compared to $`q_0`$. Concavity therefore bounds the main information by $`2[h_2(\delta_M)+\delta_M\log M]`$ in the upper limit for all sufficiently large $`M`$ (or use the actual mean distance before the limit). This tends to zero, proving the claim. The missing uniform main-data estimate for the prize remains in the [general learner analysis](averaged-pilot-entropy.md).
