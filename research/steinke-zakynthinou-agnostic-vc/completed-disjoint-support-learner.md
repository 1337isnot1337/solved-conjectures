# A completed-iid learner for disjoint finite supports

Let a hypothesis class contain the zero classifier and indicators of pairwise disjoint nonempty supports of size at most $`m`$. Assume that the feature space is standard Borel and that the hypothesis names have measurable singletons. Use the same name for a support on every sample. There is a distribution-independent proper learner with empirical excess at most $`2/\sqrt n+2m/n`$ on every sample, conditional mutual information at most 48 nats for every fixed paired pool, and the same bound on ordinary iid CMI under completion. In particular, the two-point class in the [universal-measurability disproof](completed-finite-groups.md#universal-measurability-on-the-sample-space) does attain both agnostic rates under the completion of every iid law. This proof is written.

## The learner

For a sample $`z=((x_i,y_i))_{i=1}^n`$, define the signed count of a support $`S`$ by $`a_S=\sum_{i:x_i\in S}(2y_i-1)`$. This is the improvement in the number of mistakes over the zero classifier. Define $`b_S`$ by using only terms whose feature occurs at least twice in the sample. Then $`|a_S-b_S|\le m`$ for every support, since every omitted term has a different feature in $`S`$. Only finitely many supports have nonzero $`b_S`$.

Set $`\lambda=\sqrt n`$. Give the zero classifier the deterministic selection score $`\lambda`$. Each support with $`b_S>0`$ has selection score $`b_S+U_S`$, where the $`U_S`$ are independent and have density

```math
 f_\lambda(t)=\frac{3}{2\lambda}\bigl(1-|t|/\lambda\bigr)_+^2.
```

Return the hypothesis of maximum selection score, with any fixed tie convention. The density integrates to one. Including any finite set of additional supports of score $`b_S\le0`$ makes no difference to the output law, since each noisy score is less than $`\lambda`$ almost surely.

Write $`M=\max(0,\max_S b_S)`$. The largest selection score is at least $`M-\lambda`$. A returned nonzero classifier therefore has $`b_S\ge M-2\lambda`$. If the zero classifier wins, $`M\le2\lambda`$, and its signed count is zero. Converting from $`b_S`$ to $`a_S`$ loses at most another $`2m`$ in comparison with the best true count. The excess error bound holds almost surely over the learner's randomness on each fixed sample.

## Information about the selected sample

Use squared Hellinger distance $`H_2^2(P,Q)=\int (\sqrt p-\sqrt q)^2`$, with both densities relative to any common dominating measure. The square root $`\phi_\lambda=\sqrt{f_\lambda}`$ is absolutely continuous and satisfies $`\int |\phi_\lambda'|^2=3/\lambda^2`$. For every shift $`\delta`$, the fundamental theorem of calculus followed by Cauchy–Schwarz and integration gives

```math
 \int\bigl(\phi_\lambda(t-\delta)-\phi_\lambda(t)\bigr)^2\,dt
 \le \delta^2\int |\phi_\lambda'|^2
 =3\delta^2/\lambda^2.
```

Deleting one sample row changes only the masked count of the support containing that row's feature. A feature with two occurrences can lose both contributions, and every other case changes the count by at most one. Disjointness therefore bounds the Euclidean distance of the masked-count vectors of two samples differing at one row by 4, via the common deleted sample. Both output learners use the original size-$`n`$ value of $`\lambda`$.

On the finite union of the two positive-score lists, include independent noises at every coordinate for both samples. Scores with $`b_S\le0`$ are harmless as above. The product of the Hellinger affinities of the translated noise coordinates is the affinity of the noisy vectors. Since $`1-\prod_i u_i\le\sum_i(1-u_i)`$ for affinities $`0\le u_i\le1`$, the squared Hellinger distance of the noisy vectors is at most $`3\|b-b'\|_2^2/\lambda^2\le48/n`$. Passing to the same argmax of the noisy scores, including the zero classifier, can only decrease this distance. This argument compares the distributions on the actual named hypotheses.

On a fixed paired pool, let $`W`$ denote the return value and $`B_i`$ the independent fair selection bits. The chain rule and independence give $`I(W;B)\le\sum_i I(W;B_i\mid B_{-i})`$. Each conditional term is an average of Jensen–Shannon divergences for two samples differing at just row $`i`$. Jensen–Shannon divergence is at most $`H_2^2`$ with the convention above, by the same scalar inequality used in the [Lean information lemma](../../lean/Conjectures/AgnosticVC/Information.lean). Thus the sum is at most 48 nats.

## Measurability for all iid laws

Fix any iid labeled law $`D`$ and let $`B_D`$ be the countable atom set of its feature marginal. The measurable diagonal and independence imply that, almost surely, every repeated sample feature belongs to $`B_D`$. The same holds for a paired pool of size $`2n`$, and then it holds for every selector in that pool. [Formal iid diagonal lemma](../../lean/Conjectures/AgnosticVC/FiniteSupportUniform.lean)

There are only countably many supports meeting $`B_D`$. For each such support, its masked count is Borel, as each feature in its intersection with $`B_D`$ is a measurable singleton and repetition is a finite union of feature equality events. A measurable version of the learner reads the countable list of those supports, uses only the finitely many with positive masked count, and samples independent noise for each listed support. The learner's output on this version lies in a countable set of names, so its output law is measurable for every measurable output event. The required countable list and noise are used here to exhibit the version for $`D`$. The learner defined on every fixed sample is independent of $`D`$ and has the same conditional output law as this version outside an iid null set. The pool, selector and whole-output experiment therefore has the required completed joint law, and averaging the fixed-pool bound gives ordinary iid CMI at most 48 nats.

For the two-point matching of full outer measure, the dependent replication experiment can always produce repeated features even when both one-feature marginals are nonatomic. The learner then uses the possibly nonmeasurable membership relation of the matching. Its completed-iid behavior and the universal-measurability obstruction concern the same class and different measurability requirements.

## Bounded overlap with the sharp uniform-convergence premise

There is a second construction that allows infinite supports and overlap. Assume each support is Borel, every feature is in at most $`s`$ supports, and the class has VC dimension $`d\ge1`$ and a sharp expected outer uniform-deviation bound $`B\sqrt{d/N}`$ over all iid labeled laws and positive sizes $`N`$. As above, the class contains the zero classifier. A distribution-independent proper learner has empirical excess at most

```math
 \frac{2}{\sqrt n}+\frac{k-1}{n},\qquad k=\lfloor4B^2d\rfloor+2,
```

on every sample and whole-output information at most $`12s`$ nats for every fixed pool and every completed iid law. Thus the two conjectured rates hold in classes with $`s=O(d)`$ and a numerical sharp uniform-convergence constant. A reference hypothesis other than zero is equivalent by flipping each label where the reference predicts one and using the supports of disagreement with that reference.

Fix a feature law $`\mu`$. We first show that almost surely **no $`\mu`$-null support contains $`k`$ sample rows**. It suffices to prove this for $`k`$ draws, since there are finitely many $`k`$-subtuples at every larger size. Let $`T`$ be the event that all $`k`$ iid draws belong to one $`\mu`$-null support. A tuple in $`T`$ has no atom in any coordinate, and tuples with repeated nonatomic features form a measurable null set. If $`T`$ has positive outer measure, take a measurable hull of the subset with distinct coordinates. Increasing finite partitions from a countable Borel generator separate any distinct coordinates eventually. Product-partition conditional densities of the hull converge to one almost everywhere in the hull. Some product cell $`A_1\times\cdots\times A_k`$ consequently has distinct positive-measure cells $`A_i`$ and hull density at least $`0.99`$. By minimality of the hull, the restriction of $`T`$ has outer probability at least $`0.99`$ under the product of the conditional laws $`\mu(\,\cdot\,|A_i)`$. [Product-cell argument](dominated-marginals.md#extension-from-the-sharp-outer-uniform-convergence-rate)

Use the iid feature law mixing those $`k`$ conditional laws uniformly, and label every feature one. After $`k`$ draws, condition on the cell indices of the rows and pick the first row in each of the $`K`$ occupied cells. Their coordinates extend to a tuple in $`T`$ with outer probability at least $`0.99`$. Projection of $`T`$ onto the occupied cells preserves this lower bound, and adding the remaining independent draws does so by Fubini on measurable subsets of the complement. A matching support from the full tuple has mass zero under the mixture, which is absolutely continuous with respect to $`\mu`$, and empirical positive frequency at least $`K/k`$. Thus every measurable envelope has conditional expectation at least $`0.99 K/k`$. Averaging over the cell indices and using the occupancy mean gives outer expected deviation at least $`0.99(1-1/e)>1/2`$. This contradicts $`B\sqrt{d/k}<1/2`$. Hence $`T`$ is outer-null as claimed.

Now use the original signed counts $`a_S`$ without any masking. Keep $`\lambda=\sqrt n`$ and the same noise, and set the zero classifier's deterministic selection score to $`k-1+\lambda`$. The eligible supports are those with $`a_S>k-1`$. This is a finite list because each row belongs to at most $`s`$ supports. As before, additional ineligible scores plus noise cannot win. The highest noisy score is at least $`\max_S a_S-\lambda`$ whenever the maximizing support is eligible. The selected true count is then within $`2\lambda`$ of the maximum if a support wins, and within $`k-1+2\lambda`$ if the zero classifier wins. The same accuracy bound holds when the maximum count is at most $`k-1`$. Deleting one row has count-vector Euclidean cost at most $`\sqrt{s}`$, so replacing a row costs at most $`2\sqrt{s}`$. The noise-translation and information arguments give $`12s/n`$ per selector bit and $`12s`$ in total.

Under any iid law with feature marginal $`\mu`$, all supports eligible on a sample or on any selected subsample of a paired pool have positive $`\mu`$-mass almost surely. Indeed eligibility needs at least $`k`$ hits. There are only countably many supports of positive $`\mu`$-mass, since the sum of their masses over any finite subfamily is at most $`s`$. Use their Borel signed counts to exhibit a countable-list measurable version for that law. This version agrees with the same distribution-independent learner on the completed pool experiment. The bound therefore concerns ordinary iid CMI for the full hypothesis name.

For supports of size at most $`m`$, one may take $`k=m+1`$ without the sharp uniform-convergence premise. Every feature of a null support is nonatomic under $`\mu`$, and almost surely the iid experiment has no repeated nonatomic feature. Thus a null support has at most $`m`$ hits simultaneously for all supports. For disjoint two-point supports this gives 12 nats and empirical excess at most $`2/\sqrt n+2/n`$.

## Discrete noise in Lean

Lean implements a proper learner with integer noise at scale $`r\ge1`$. The mass at integer $`u`$ is proportional to $`(2r-|u|)_+^2`$. The normalizer is at least $`2r^3`$, using the integers from $`-r`$ through $`r`$. For two centers $`a,b`$, the two translated support intervals have at most $`10r`$ integers in their union, and the unnormalized square root of the mass changes by at most $`|a-b|`$ pointwise. These facts give squared Hellinger distance at most $`5(a-b)^2/r^2`$. For argmax with reference selection score $`q+2r`$ and true reference count zero, the regret is at most $`q+4r`$, and a non-reference winner has original count above $`q`$. [Lean score channel and regret](../../lean/Conjectures/AgnosticVC/CompactScoreNoise.lean)

The named law uses only the supports hit on the input sample. Lean proves that adding independent scores for ineligible names preserves this law. On a fixed pool the proof embeds the two learners' actual output names into the finite set of names hit anywhere in the pool. The information bound is $`20s`$ when $`r^2\ge n`$. [Lean learner and fixed-pool bound](../../lean/Conjectures/AgnosticVC/NoisySupportLearner.lean)

For finite supports of size at most $`m`$, Lean verifies the completed-iid construction through the expectation and the actual conditional KL on full output names. The offset is $`m`$, and the scale is $`r=\lfloor\sqrt n\rfloor+1`$. The same learner has expected empirical excess at most $`m/n+8/\sqrt n`$ on every sample and ordinary iid CMI at most $`20s`$ for every iid law. A fixed law can only activate its countably many positive-mass supports. A finite list of eligible names and their counts is a measurable statistic for that law and determines the output distribution. [Lean completed-iid theorem](../../lean/Conjectures/AgnosticVC/NoisySupportIid.lean)

Lean also verifies the extension to unbounded-size supports. An arbitrary positive-outer-measure event is concentrated by independently conditioning the coordinates on a rectangle extracted from finite measurable partitions. The proof then mixes the conditional laws using uniform latent indices and puts one coordinate from each occupied index into the iid sample. It checks that the expected occupied fraction is at least $`1/2`$. Using a product cell of relative outer mass greater than $`1/2`$, a positive-outer-measure event of $`k`$ hits on one null support would force the expected envelope at size $`k`$ to be at least $`1/4`$ under the reweighted law. The argument allows the measurable cells to overlap because the indices stay latent. [Lean rectangle and null-hit amplification](../../lean/Conjectures/AgnosticVC/IidRectangleDensity.lean)

If the one-sided outer deviation of the positive-support frequencies has expected envelope at most $`B\sqrt{d/n}`$ for every feature law and positive size, Lean takes the offset $`\lceil16B^2d\rceil`$. For every $`n\ge d\ge1`$, the same proper learner gives actual iid CMI at most $`20s`$ and expected empirical excess at most $`(16B^2+9)\sqrt{d/n}`$. The one-sided premise follows from the sharp uniform-convergence bound for the whole class with all labels positive. [Lean theorem for unbounded-size supports](../../lean/Conjectures/AgnosticVC/NoisySupportSharpIid.lean)
