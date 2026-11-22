# A double-logarithmic distribution-free information bound

For every finite or countably enumerated measurable binary class $`H`$ of VC dimension $`d\ge1`$, and every $`n\ge d`$, one distribution-independent proper learner achieves both
```math
 \mathrm{CMI}_D(A)\le C d[1+\log\log(en/d)]\quad\text{for every }D,
 \qquad
 \mathbb E_A\widehat L_z(A(z))\le \min_h\widehat L_z(h)+C\sqrt{d/n}
 \quad\text{for every individual }z.
```
Here CMI is the information about the independent selection bits in the full output classifier given the paired iid supersample. The feature domain can be infinite. The enumeration provides measurable first representatives of finite traces and a measurable empirical minimizer; the proof also applies when equivalent coherent measurable choices are available. The remaining unbounded factor in the information inequality prevents this from resolving the [paid Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf).

## A localized trace Gibbs learner

Write $`s`$ for a training size, and let $`a\in H`$ be a fixed anchor independent of this training block. Write $`L_z(h)`$ for its mistake count, $`q_z(h)`$ for its count of disagreements with $`a`$, and $`R\ge0`$ for a fixed count threshold. Define
```math
 F_z(h)=L_z(h)-L_z(a)+3(q_z(h)-R)_+ .
```
Give each distinct prediction trace weight $`e^{-\eta F_z(h)}`$, normalize, and return the first hypothesis having the sampled trace. Denote its output law by $`P_z`$. If $`M_z`$ is the number of traces, comparison with the Gibbs variational identity gives, simultaneously,
```math
 \mathbb E_{P_z} L_z\le L_z(b)+\log(M_z)/\eta
 \quad(q_z(b)\le R),\qquad
 \mathbb E_{P_z}q_z\le(3R+\log(M_z)/\eta)/2.
 \tag{1}
```
Indeed the anchor trace has objective zero, $`F_z\ge 2q_z-3R`$, and the expected objective is at most its minimum plus the entropy allowance.

For $`s\ge d`$ and $`0<\eta\le2`$ the original CMI of this learner is at most
```math
 C\left[d+\eta^2\left(R+\frac{d\log(2es/d)}{\eta}\right)\right].
 \tag{2}
```
We give the deletion proof, since the changing canonical supports and the localization in (2) both matter. Fix any full block $`T`$ of $`s+1`$ labeled observations and use the same $`R,\eta,a`$ at both sample sizes. Write $`Q=P_T`$ and $`J_i`$ for the canonical support after deleting coordinate $`i`$. Then $`J_i`$ is a subset of the full canonical support. Deleted representatives can be paired one-to-one at this coordinate with a surviving trace differing only at $`i`$. The two full objectives differ by at most four, so $`Q(J_i)\ge1/(1+e^{4\eta})`$ and
```math
 \sum_i Q(J_i^c)\le e^{4\eta}\sum_{uv\text{ trace edges}}\min(Q(u),Q(v))\le e^{4\eta}d .
```
For the last inequality integrate, over weight thresholds, the number of edges in each induced upper level set. A binary family of VC dimension $`d`$ has at most $`d`$ times its cardinality in unit-distance edges, as does every subfamily. A proof by coordinate induction is given in the [trace-count argument](../bounty-continuation-2026-11-21/learning-information/vc-information-complexity-target.md#3-a-low-information-reference-sampler).

On $`J_i`$ the deleted-sample output is the exponential tilt of $`Q(\cdot\mid J_i)`$ by $`-\eta(F_{T-i}-F_T)`$. This score is zero if the trace agrees with $`a`$ at $`x_i`$, and has absolute value at most $`4\eta`$ otherwise. The tilt KL is therefore at most $`C\eta^2 Q(h(x_i)\ne a(x_i)\mid J_i)`$: integrate the intermediate tilted variance against the interpolation parameter, bounding its density relative to the initial law by $`e^{8\eta}`$. The remaining KL to $`Q`$ is $`-\log Q(J_i)\le C Q(J_i^c)`$. Sum over $`i`$, use the lower bound on $`Q(J_i)`$, and apply (1) to the full block. This bounds the sum of all deletion KLs by the right-hand side of (2), by Sauer's lemma.

For an individual fair selector bit, the two alternatives delete one of two entries from the same union of $`s+1`$ iid observations. Jensen–Shannon divergence is at most the mean KL to their common reference $`Q`$. By exchangeability the expected deletion KL is the average over all union coordinates. Tensorizing over the $`s`$ independent bits proves (2). This proof charges loss sensitivity only where the returned classifier disagrees with the anchor.

## Constructing the anchor without the feature law

Let $`t=n/d`$ and $`L=\log(et)`$. Use a uniformly random split into a pilot of size $`p=\lfloor n/2\rfloor`$ and a main block of size $`s=n-p`$. In the pilot mark the first $`m=\lceil d L^4\rceil`$ indices of the random ordering. We first treat all sufficiently large $`t`$, so $`m\le p`$.

1. On the whole pilot take $`b`$, the first empirical minimizer. On just the $`m`$ marked features let $`a`$ be the first classifier agreeing with $`b`$. Only the identity of $`a`$ is needed to specify the localized Gibbs learner.
2. On the main block always generate its localized Gibbs output using $`R=s/L^2`$ and $`\eta=\log(es/d)\sqrt{d/s}\le2`$.
3. If $`q_{\rm main}(b)>R`$, output $`b`$. Otherwise output the localized classifier.

These steps do not use $`D`$. For every realized split the expected main loss count of the output is at most $`L_{\rm main}(b)+O(\sqrt{sd})`$, by (1) on success and equality on fallback. For **each fixed full dataset**, each block is a uniform subset. Its expected uniform deviation of normalized loss from full-sample loss is $`O(\sqrt{d/n})`$, by the [without-replacement argument](finite-feature-marginals.md#empirical-guarantee-after-splitting). The full-sample excess of $`b`$ is at most twice the pilot deviation since it minimizes pilot loss. Using the main deviation twice to transfer the comparison to $`b`$ now proves the required pointwise expected excess of the actual output.

For information, condition on the independent permutation. On fixing its paired pool the anchor $`a`$ ranges over at most $`(2em/d)^d`$ hypotheses. It is first in its **full marked-pool trace** because it was first in its selected marked trace. This holds even though $`b`$ uses all pilot labels. Hence revealing $`a`$ costs at most $`O(d[1+\log L])`$. Once $`a`$ is given the main block is independent of the pilot; (2) bounds its expected CMI by $`O(d)`$, since $`\eta^2R=O(d)`$ and $`\eta\log(2es/d)`$ is bounded uniformly in $`s/d`$ (use $`\log^2(eu)/\sqrt u=O(1)`$).

It remains to charge the fallback. Let $`\mathcal A`$ be all pairwise disagreement sets of $`H`$. Its VC dimension is $`O(d)`$ because its trace count is at most the square of the Sauer bound. The expected largest population mass of a set in $`\mathcal A`$ missed by $`m`$ iid features is $`O(d\log(em/d)/m)`$ by the realizable uniform-convergence bound with all-zero labels ([Steinke–Zakynthinou, Theorem 2, second inequality](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)). The disagreement of $`a,b`$ is such a missed set even with their dependence on the pilot. The independent main sample therefore has $`\mathbb E q_{\rm main}(b)/s\le O(d\log(em/d)/m)`$. By Markov,
```math
 \Pr(\mathrm{fallback})\le O\left(\frac{L^2d\log(em/d)}{m}\right)
 =O\left(\frac{1+\log L}{L^2}\right).
```
Reveal the fallback flag and the pilot minimizer only on fallback, in addition to the previously revealed anchor and the always-generated main output. Given the pilot pool, $`b`$ is one of at most $`(2ep/d)^d`$ canonical full-pool hypotheses. Thus this final cost is at most one bit plus $`O(dL)`$ times the fallback probability, which is $`O(d)`$. Data processing gives the stated bound for the returned hypothesis.

For the bounded range of $`t`$ omitted when fitting $`m`$ into the pilot, canonical ERM has zero excess and CMI at most the log of the full-pool trace count, $`d\log(2et)=O(d)`$. All constants above are universal. The present argument spends the double logarithm solely on the pilot anchor. Showing a dimension-only bound on the information in an anchor suitable for the same empirical comparison, or avoiding its disclosure, is an open step.
