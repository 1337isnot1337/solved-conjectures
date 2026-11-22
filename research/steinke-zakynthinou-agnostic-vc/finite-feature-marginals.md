# A distribution-independent learner on finite feature spaces

For any known finite feature space of size $`K`$, any binary class on it of VC dimension $`d\ge1`$, and every $`n\ge d`$ with $`K\le\sqrt{nd}`$, both bounds of [Steinke–Zakynthinou Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) hold with a universal constant. One proper learner works for every joint distribution on this space and every individual labeled dataset. The constants are independent of $`K`$. The learner does not receive a feature distribution. The remaining range includes $`K>\sqrt{nd}`$ and unbounded feature spaces.

Use a uniform random permutation to split the sample into a pilot of size $`p=\lfloor n/2\rfloor`$ and a main sample of size $`s=n-p`$. When $`n<8d`$ any fixed classifier suffices after increasing the constant. On the pilot count each feature, giving a vector $`N`$. Put $`\lambda=\sqrt{p/d}`$ and add independent gamma noise $`G_x`$ of shape three and scale $`\lambda`$ to every entry. Use the normalized vector $`\mu=(N+G)/(p+\sum G)`$ as the feature law for the [known-marginal tree and fallback](known-feature-marginal.md) on the main sample. All choices of nets and parents can use a fixed ordering of the finite class; they are measurable functions of the histogram.

## Information in the pilot

For an adjacent pilot replacement at most two entries shift by one. With $`g`$ the square root of the gamma density extended by zero to the negative half-line, $`\|g'\|_2^2=O(1/\lambda^2)`$ by scaling, since at unit scale $`g(u)=u e^{-u/2}/\sqrt2`$ on $`u\ge0`$. The squared $`L^2`$ distance between $`g`$ and its unit translate is at most $`\|g'\|_2^2`$ by integrating the derivative and Jensen. The squared Hellinger distance of product laws is at most the sum for their factors by multiplication of affinities. Jensen–Shannon divergence satisfies $`\mathrm{JS}(P,Q)\le \int(\sqrt{dP}-\sqrt{dQ})^2`$: apply $`\log u\le u-1`$ to both relative entropies against the midpoint, then use $`(a-b)^2/(2(a+b))\le(\sqrt a-\sqrt b)^2`$. Consequently each adjacent divergence is $`O(1/\lambda^2)`$ even at a zero histogram entry. Tensorizing over the $`p`$ selector bits yields $`O(d)`$ CMI for the release.

Write $`P`$ for the true feature law, $`W=\sum G`$, and $`B=\sum_{x:N_x<p P(x)/2}P(x)`$. Simultaneously for every feature set $`A`$,
```math
P(A)\le 2(1+W/p)\mu(A)+B .
\tag{1}
```
The binomial lower-tail bound gives $`\mathbb E B\le\sum_x P(x)e^{-pP(x)/8}=O(K/p)`$. Also $`\Pr(B\ge u)\le2^K e^{-pu/8}`$ because the union of all undercounted atoms is itself a set with count below half its mean. We have $`\mathbb E W=3K\lambda=O(p)`$. By the gamma moment generating function at $`1/(2\lambda)`$, $`\Pr(W>Cp)\le\exp(-c\sqrt{pd})`$ for absolute $`C`$ sufficiently large, using $`K=O(\sqrt{pd})`$.

## Information in the main learner

Conditional on a realized pilot and its noise, the main observations still have law $`D`$. The tree at scale $`r_j`$ has leaf-to-anchor $`\mu`$-disagreement at most $`2r_j`$. In the information estimate (3) of the known-marginal proof, substitute $`4(1+W/p)r_j+B`$ from (1). Since $`s\sum_j\tau_j^{-2}=O(\sqrt{sd})`$ and $`s\sum_j r_j/\tau_j^2=O(d)`$, the expected tree information is
```math
 O(d(1+\mathbb E W/p)+\sqrt{sd}\,\mathbb E B)=O(d).
```

Use the main learner's fallback gap $`k=C_0\sqrt{sd}`$ with a sufficiently large universal $`C_0`$. Except on a pilot event of probability $`O(e^{-c\sqrt{sd}})`$, we have $`W\le Cp`$ and $`B\le C'\sqrt{d/s}`$, for sufficiently large absolute $`C,C'`$. A finest-net disagreement of $`\mu`$-mass at most $`d/s`$ then has $`P`$-mass at most $`k/(8s)`$ on choosing $`C_0`$ large enough. The ghost-count proof in the known-marginal note applies: a witnessing disagreement has ghost count at most $`k/4`$ with probability at least $`1/2`$ by Markov. Enlarge $`C_0`$ to absorb the same trace union bound. Thus the unconditional probability of fallback is $`O(e^{-c\sqrt{sd}})`$. Its extra information is at most one bit plus this probability times $`d\log(2es/d)`$, hence $`O(d)`$.

Conditioning on the independent permutation is harmless. Reveal the pilot release to the observer and then the main output. The pilot depends only on pilot selector bits and their pool; given its release the main algorithm needs only the independent main block. The sum of the two established bounds controls original CMI on the entire sample.

## Empirical guarantee after splitting

On every realized main sample, for every pilot, the expected main loss rate is within $`O(\sqrt{d/s})`$ of its best hypothesis. For a fixed full labeled sample $`z`$, the expected supremum over $`h`$ of the difference between its loss rates on a uniform size-$`s`$ subset and on $`z`$ is $`O(\sqrt{d/s})`$ in absolute value. To justify this, use the usual iid expected VC inequality ([Theorem 2](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)) with the uniform law on the indexed entries of $`z`$. The without-replacement estimate follows by convexity. Given the subset, generate an independent random occupancy pattern with the law of the equal-index partition of $`s`$ iid draws from $`n`$ indices. Assign its distinct blocks injectively and uniformly to members of the subset. The resulting draws are iid uniform unconditionally by permutation symmetry, and their conditional expected empirical measure is the subset measure. Apply Jensen to the supremum of absolute linear loss deviations. Comparing twice, once for the output and once for a full-sample minimizer, gives the required $`O(\sqrt{d/n})`$ full-sample excess in expectation for every $`z`$.
