# Averaging pilot partitions removes the pilot information cost

The [earlier distribution-free bound](distribution-free-localization.md) pays a double logarithm to identify a pilot classifier. Here a different learner uses the pilot only through averages of entropies of prediction patterns. It has the required pointwise empirical accuracy on arbitrary finite or countably enumerated measurable VC classes. Its contribution from **all pilot selector bits together** is $`O(d)`$ for every fixed pilot pool, even after the observer is given the entire selected main sample. Its information about the **main** selector bits remains unbounded by this argument.

## A finite optimization lemma

Fix a finite set $`G`$ of hypotheses, arbitrary fixed costs $`L(h)`$, a positive base temperature $`\tau`$, nonnegative coefficients $`a_j`$, and integers $`1\le m_j\le p`$. For a pilot feature array $`u`$ of length $`p`$, let $`J_j`$ be a uniform size-$`m_j`$ subset of its indices. For a probability distribution $`q`$ on $`G`$, let $`q_{u,J}`$ be the law of the joint predictions of a random $`h\sim q`$ on the indexed features $`u_J`$. Use the usual Shannon entropy $`H`$ in nats. Minimize over the simplex
```math
 F_u(q)=\mathbb E_q L-\tau H(q)-\sum_j a_j\mathbb E_{J_j} H(q_{u,J_j}).
```
Sampling one hypothesis from the unique minimizer is the learner in this lemma. The subset expectations are part of the objective and do not reveal or select an individual subset. For any paired pilot pool its conditional information about all pilot selector bits is at most
```math
 C\frac{(\sum_j a_j m_j)^2}{p\tau^2}.
 \tag{1}
```
The constant is universal and the costs can be arbitrary real numbers. Strict convexity follows from the full entropy term. Every minimizer is interior since moving a small mass to a missing coordinate decreases the full negative entropy with infinite one-sided slope, while no other negative marginal entropy can have a positive infinite slope in that direction.

To prove (1), replace one pilot feature, obtaining two objectives $`F_0,F_1`$. Interpolate by $`F_s=(1-s)F_0+sF_1`$ and let $`q_s`$ minimize it. On the interior the implicit function theorem on the simplex gives a differentiable curve. At any interior $`q`$ use coordinates $`\dot q(h)=q(h)v(h)`$ with $`\mathbb E_q v=0`$. For a fixed prediction partition $`\pi`$, the Hessian of $`-H(q_\pi)`$ on this direction is $`\mathbb E_q[(\mathbb E_q[v\mid\pi])^2]`$. The full objective Hessian is consequently at least $`\tau\mathbb E_q v^2`$.

For a random restriction of size $`m_j`$ the replacement affects only the fraction $`m_j/p`$ of restrictions containing the changed coordinate. For each such restriction keep the other coordinates as a partition $`\pi`$. Adding a binary observation $`b(h)`$ to $`\pi`$ changes the gradient of negative marginal entropy by $`\log q(b(h)\mid\pi(h))`$ (up to an irrelevant constant). Under $`h\sim q`$ its squared mean is at most an absolute constant $`K`$: on each cell it is $`r\log^2 r+(1-r)\log^2(1-r)`$, including the endpoints by continuity. To replace a bit subtract two such gradients. The triangle inequality gives
```math
 \|\nabla(F_1-F_0)\|_{L^2(q)/\mathrm{constants}}
 \le 2\sqrt K\sum_j a_j m_j/p.
```
Differentiate the optimality condition and test it on $`\dot q_s`$. The Hessian lower bound and Cauchy–Schwarz imply $`\|\dot q_s/q_s\|_{L^2(q_s)}\le 2\sqrt K\sum_j a_jm_j/(p\tau)`$. The derivative of $`\sqrt{q_s}`$ has half this norm in unweighted $`\ell^2`$. Integrating gives a square-root distance bound between the two endpoint output laws. Their Jensen–Shannon divergence is at most its square, as in the [bounded-noise argument](bounded-score-noise.md). Tensorization over the $`p`$ independent pilot bits gives (1). No lower bound on the least positive hypothesis probability was needed.

## A distribution-independent candidate for Conjecture 6

Randomly split $`n`$ examples into $`p=\lfloor n/2\rfloor`$ pilot observations and $`s=n-p`$ main observations. Use $`G`$ consisting of the first representative of each trace on the main features. Let $`L`$ be the main mistake count. Set $`t=n/d`$, $`B=\log(et)`$, $`\tau=\sqrt t/B`$. For sufficiently large $`t`$ take scales $`j=0,\ldots,\lfloor4\log_2 B\rfloor`$, $`m_j=\lceil d2^j\rceil`$, and $`a_j=\sqrt t/(j+1)^3`$. Then $`m_j\le p`$. In the omitted bounded range of $`t`$ a fixed classifier can satisfy the empirical bound by increasing the absolute constant.

A comparison to a point mass at a main ERM gives
```math
 \mathbb E_q L-\min L
 \le \tau\log |G|+\sum_j a_j d\log(e m_j/d)
 =O(\sqrt{nd}).
```
This uses Sauer's lemma on every pilot restriction. The [uniform random split estimate](finite-feature-marginals.md#empirical-guarantee-after-splitting) transfers the guarantee to every fixed full dataset. Given the independent permutation and all main selectors, (1) applies directly since the canonical support and costs now are fixed. Its upper bound is
```math
 O\left(\frac{(\sqrt t\,d B^4)^2}{n(\sqrt t/B)^2}\right)
 =O(dB^{10}/t)=O(d)
```
with a possibly large absolute constant. This shows that using the pilot to define multiple fine partitions need not itself violate the sponsor's information budget.

## What is known about the main perturbation

There is a useful uniform residual-variance inequality on any fixed pilot array and under **any** law $`q`$ on the hypotheses. For a uniform index $`i`$ in that array and an independent uniform size-$`m`$ restriction $`J`$, with $`m<p`$,
```math
 \mathbb E_{i,J}\mathbb E_q\big(h(u_i)-\mathbb E_q[h(u_i)\mid h(u_J)]\big)^2
 \le d/(m+1).
 \tag{2}
```
The residual vanishes when $`i\in J`$. Conditional on the other case, reveal the size-$`m+1`$ union and choose the omitted coordinate uniformly. On that union let $`w_v`$ be the probabilities of the possible binary traces. Summing conditional variances over all possible omissions gives $`\sum_{vw} w_v w_w/(w_v+w_w)`$ over unit-distance edges. This is at most $`\sum_{vw}\min(w_v,w_w)\le d`$, by the weighted one-inclusion bound. This proves (2) even with repeated pilot features.

On a fixed full hypothesis support the Hessian, in mean-zero $`L^2(q)`$ coordinates, is
```math
 A(q)=\tau I+\sum_j a_j\,\mathbb E_{J_j}P_{u,J_j},
```
where $`P_{u,J}`$ is conditional expectation on the trace partition. Under a main loss perturbation $`g`$, the infinitesimal squared speed of $`\sqrt q`$ is $`\|A(q)^{-1}(g-\mathbb E_q g)\|_2^2/4`$. Formula (2) controls the individual projection residuals on the pilot. The different **averages** of projections need not commute, and the required main estimate also involves changing $`q`$, main features, and the canonical main support. No bound proving $`O(d)`$ main information is established here. The pilot lemma cannot be counted as a proof of the [original conjecture](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf).

The [checker](verify_averaged_entropy.py) verifies (2) on all 255 nonempty subfamilies of the three-dimensional binary cube at three restriction sizes. For the four traces 000, 001, 010, 100 with respective weights 1/10, 2/10, 3/10, 4/10, the entry in row zero and column one of the commutator of the size-one and size-two average projections is exactly −43/3780. Thus replacing the averaged projections by a simultaneously diagonal family would already fail in VC dimension one.
