# Agnostic VC learning with a known feature marginal

Let $`H`$ be any finite or countable enumerated class of measurable binary classifiers of VC dimension $`d\ge1`$, and $`n\ge d`$. For every feature distribution $`\nu`$ there is a single proper randomized learner $`A_\nu`$ satisfying
```math
 I(A_\nu(\widetilde Z_S);S\mid\widetilde Z)\le C d
 \quad\text{for every joint law }D\text{ with }D_X=\nu,
 \qquad
 \mathbb E_A L_z(A_\nu(z))\le\min_{h\in H}L_z(h)+C\sqrt{nd}
 \quad\text{for every }z.
```
Here $`L_z`$ counts mistakes, $`\widetilde Z`$ is an iid pool with two labeled examples per row, and independent fair bits $`S`$ select the training sample. The constant is absolute. The empirical guarantee includes feature configurations of probability zero. The learner uses neither the conditional label law nor any population-risk minimizer. The same proof works when there is a measurable canonical ERM whose possible outputs for subsamples of each pool are bounded by its number of traces, and the disagreement events below are measurable.

[Steinke and Zakynthinou's Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) asks for one learner that works for **every** feature marginal. Giving the learner the marginal changes that quantifier. Related [public-data learning](https://arxiv.org/abs/1910.11519) studies agnostic population error under differential privacy. We use the marginal to build a fixed tree and prove an original-CMI bound for its output. We make no claim of first priority for the known-marginal statement.

## A fixed tree of classifiers

Equip $`H`$ with the pseudometric $`q(f,g)=\nu\{f\ne g\}`$. Write $`r_j=2^{-j}`$, $`m=\lceil\log_2(n/d)\rceil`$. The case $`m=0`$ needs only a fixed classifier. At each level $`1\le j\le m`$ take a maximal $`r_j`$-separated net; level zero is a single fixed classifier. For each net point choose a parent at distance at most $`r_{j-1}`$ in the preceding net. Prune nodes having no descendant at level $`m`$. Each leaf below a level-$`j`$ node $`v`$ is at distance at most $`2r_j`$ from its classifier $`h_v`$ by the triangle inequality.

The level-$`j`$ net has log cardinality $`O(d(j+1))`$. For completeness, for any $`M\ge2`$ points pairwise more than $`r`$ apart, a random sample of $`k=\max(d,\lceil3\log(2M)/r\rceil)`$ features separates all pairs with positive probability by a union bound. Sauer's lemma gives $`M\le(ek/d)^d`$. Writing $`u=\log M/d`$, this implies $`u\le \log(C(1+u)/r)`$, hence $`u=O(1+\log(1/r))`$. This bound on all finite packings justifies greedy finite nets also for countable $`H`$.

For $`0\le j<m`$ put $`\tau_j=\sqrt{n/d}\,r_j^{1/4}`$. These temperatures decrease with depth and are at least one. At a leaf set $`V_h(z)=L_z(h)`$. At a nonleaf $`v`$ take the uniform law $`\pi_v`$ on its children and set
```math
 V_v(z)=-\tau_j\log\sum_{w}\pi_v(w)e^{-V_w(z)/\tau_j},
 \qquad P_z(w\mid v)=\pi_v(w)e^{(V_v(z)-V_w(z))/\tau_j}.
```
Start at the root and sample down to a leaf with these conditionals. Write $`B_z`$ for its law. The Gibbs variational identity gives $`V_v=\mathbb E V_w+\tau_jD_{\rm KL}(P_z(\cdot\mid v)\Vert\pi_v)`$, while $`V_v\le\min_w V_w+\tau_j\log|\mathrm{children}(v)|`$. Iterating the two bounds gives, on every input,
```math
 \mathbb E_{B_z}L_z(h)\le\min_{h\text{ leaf}}L_z(h)
 +O\left(\sqrt{nd}\sum_{j\ge0}(j+2)2^{-j/4}\right).
 \tag{1}
```

## Information cost of adding a fresh observation

Keep the same tree and temperatures when computing its laws on a base sample $`z`$ of length $`n-1`$ and on $`z'=z\cup\{u\}`$, $`u=(x,y)`$. Write $`\ell_u(h)=1[h(x)\ne y]`$. Allow any fractional weight $`s\in[0,1]`$ on $`u`$. At every node the shift $`\Delta_s V_v=V_v(z+su)-V_v(z)`$ lies in $`[0,s]`$, since adding a leaf cost in this interval moves every soft minimum by an amount in that interval.

The log likelihood ratio on any path from any subtree root to any descendant is
```math
 \sum_{v\to w}\frac{\Delta_s V_v-\Delta_s V_w}{\tau_{\mathrm{level}(v)}}.
```
Summing by parts, the positive coefficients sum to the reciprocal of the last edge temperature and the final negative coefficient has that same magnitude. The ratio thus lies between $`e^{-1}`$ and $`e`$, including for the probability of reaching a fixed internal node. Differentiating the recursive soft minimum shows $`\partial_s V_w(z+su)=\mathbb E_{B_{z+su}^w}\ell_u(h)`$, where the superscript means sampling from subtree $`w`$. Therefore for any child $`w`$ of $`v`$, writing $`\Delta=\Delta_1`$,
```math
 |\Delta V_w-\ell_u(h_v)|^2
 \le |\Delta V_w-\ell_u(h_v)|
 \le e\,\mathbb E_{B_z^w}1[h(x)\ne h_v(x)] .
 \tag{2}
```
The subtraction uses that the anchor loss is binary. The law on the right is determined before the extra observation arrives.

The new child law at $`v`$ is the exponential tilt of the old one by $`-\Delta V_w/\tau_j`$. Its KL to the old law is bounded by $`e/(2\tau_j^2)`$ times the old child expectation of $`(\Delta V_w-\ell_u(h_v))^2`$. Indeed, integrate $`s`$ times the tilted variance of the log weight for $`0\le s\le1`$. Its range is at most one, so the density at every intermediate tilt is at most $`e`$ relative to the old law. Centering at any constant upper bounds variance by the second moment about that constant.

Use the KL chain rule for paths and the upper ratio $`e`$ for reaching a node under the new law. When averaging over $`u\sim D`$ independently of $`z`$, (2) contributes at most $`2e r_j`$ at a level-$`j`$ node by the leaf-to-anchor bound. Consequently, uniformly in the fixed base sample,
```math
 \mathbb E_u D_{\rm KL}(B_{z+u}\Vert B_z)
 \le C\sum_{j<m} r_j/\tau_j^2
 \le C(d/n)\sum_{j\ge0}2^{-j/2}.
 \tag{3}
```
This estimate is on full output hypotheses. For a changed selector bit the two possible training sets add independent observations to a common base. Their Jensen–Shannon divergence is bounded by the mean of their KL divergences to $`B_z`$, since the mixture minimizes mean KL. Independence of the fair bits gives $`I(B;S\mid\widetilde Z)\le\sum_i I(B;S_i\mid S_{-i},\widetilde Z)`$. Thus (3) yields $`O(d)`$ original CMI.

## Enforcing accuracy even on atypical feature samples

For each $`h`$ fix a finest-net classifier $`g(h)`$ with $`q(h,g(h))\le r_m\le d/n`$. Let $`k=128\sqrt{nd}`$. If the minimum leaf loss exceeds the full-class minimum by more than $`k`$, output the first empirical minimizer in the enumeration. Otherwise use the tree law. The pointwise error assertion follows immediately from (1).

The fallback probability is at most $`2e^{-k/16}`$. To see this, let $`\mathcal A=\{\{h\ne g(h)\}:h\in H\}`$. Its traces on $`2n`$ points number at most $`(2en/d)^{2d}`$, and each set has probability at most $`d/n`$. Fallback requires a set containing at least $`k`$ of the training features. For a witnessing set determined by the sample, an independent ghost sample has count at most $`k/4`$ with probability at least $`1/2`$ by Markov. Randomly swap the members of each of the resulting $`n`$ iid pairs. For a fixed full-pool trace of size $`K\ge k`$, a ghost count at most $`k/4`$ is at least $`K/4`$ below its mean $`K/2`$. Only the pairs meeting the trace once produce random bits; there are at most $`K`$ of these. Hoeffding's inequality bounds the probability by $`e^{-K/8}`$ (if there are none, the event is impossible). A union bound costs $`(2en/d)^{2d}`$, whose logarithm is at most $`k/16`$ since $`\log(2et)\le2\sqrt t`$ for $`t\ge1`$. If $`k>n`$ the fallback is empty.

Given a fixed supersample, the first empirical minimizer of any selected sample is first in its full-pool trace, so the fallback can select at most $`(2en/d)^d`$ outputs. Reveal the always-generated tree output, the fallback bit, and the canonical minimizer only on fallback. The extra information beyond the tree is at most
```math
 \log 2+\Pr(\mathrm{fallback})\,d\log(2en/d)=O(d).
```
This proves the result. It bypasses the previously recorded [sensitivity obstruction for hard cell minima](../bounty-continuation-2026-11-21/learning-information/full-vc-continuation-obligations.md) by differentiating a soft minimum and measuring disagreement against its pre-observation law. The remaining dependence on the feature marginal enters in choosing the tree.
