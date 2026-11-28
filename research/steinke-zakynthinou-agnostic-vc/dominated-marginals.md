# One proper learner for all marginals dominated by a fixed law

Let the feature and hypothesis spaces be standard Borel, let evaluation be jointly Borel, and let the nonempty class have VC dimension $`d\ge1`$. Fix a reference probability $`\mu`$ on the feature space. For each $`n\ge d`$ a proper learner, fixed before the labeled distribution, has original CMI at most $`19{,}712d`$ nats for **every** labeled iid law whose feature marginal is absolutely continuous with respect to $`\mu`$. Its expected empirical error on **every** sample is at most the class infimum plus $`585\sqrt{d/n}`$. The learner uses the completion convention. Its dependence on the reference law is an additional assumption relative to the original conjecture. The new ingredient is a countable subclass that misses at most $`2d`$ sample positions, simultaneously for all class members, almost surely at each finite sample size. [Original conjecture](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Countable-class CMI theorem](../../results/steinke-zakynthinou-agnostic-vc/README.md)

## Local disagreement on a fixed finite tuple

Fix a hypothesis $`g`$, an integer $`k>d`$ and $`0<\delta<1`$. Let $`E`$ be the event that on $`k`$ iid $`\mu`$ points some $`h`$ disagrees with $`g`$ everywhere even though $`\mu(h\ne g)\le\delta`$. This event is analytic. Joint Borel evaluation makes $`h\mapsto\mu(h\ne g)`$ Borel, and the remaining constraints are Borel before projection. On $`E`$ choose a witness by Jankov–von Neumann uniformization and replace it by a Borel version for the completed law on the tuple. [Kechris, *Classical Descriptive Set Theory*, §18.A](https://link.springer.com/book/10.1007/978-1-4612-4190-4)

Append $`M=\lceil1/\delta\rceil`$ independent ghost points. The chosen witness has expected ghost disagreements at most $`M\delta\le2`$. Conditional on the tuple and a valid witness, the probability of at most four ghost disagreements is at least one half. Thus $`\Pr(E)`$ is at most twice the probability that some hypothesis disagrees with $`g`$ everywhere in the identified tuple and at no more than four other positions. By iid exchangeability, identify the $`k`$ positions by a uniform $`k`$-subset of the combined pool. On a fixed pool, a disagreement trace of size at most $`k+4`$ contains at most $`\binom{k+4}{k}`$ such subsets. Disagreement with fixed $`g`$ is a coordinatewise bit flip and preserves the growth bound. Sauer–Shelah bounds the number of disagreement traces by $`O_d((M+k)^d)`$. Consequently

```math
 \Pr(E)\le 2\,O_d((M+k)^d)\frac{\binom{k+4}{k}}{\binom{M+k}{k}}
 \le C_{d,k}\,\delta^{k-d} .
```

The constant is uniform in $`g`$. The comparison after adding ghost points can discard the population constraint on $`h`$, because this only enlarges the counted event.

## A countable subclass with at most $`2d`$ discrepancies

Let $`\delta_j=2^{-j}`$ for positive integers $`j`$. Choose a finite $`\delta_j`$-net $`G_j`$ of hypotheses in the disagreement pseudometric $`\mu(h\ne g)`$. Haussler's packing bound gives $`|G_j|\le C_d\delta_j^{-d}`$. Choose the centers in the class, and let $`G=\bigcup_jG_j`$. [Haussler, sphere packing for VC classes](https://www.sciencedirect.com/science/article/pii/0097316595900527)

Fix $`n`$ and set $`k=2d+1`$. If $`n<k`$ the discrepancy claim is immediate. Otherwise, if there exists an $`h`$ that differs from every member of $`G_j`$ on at least $`k`$ positions of a sample, then it differs on at least $`k`$ positions from a center $`g\in G_j`$ with $`\mu(h\ne g)\le\delta_j`$. Some $`k`$-subtuple witnesses these differences. Use the local bound and sum over centers and subtuples. The probability is at most $`C_{d,k}C_d\binom nk\delta_j^{k-2d}`$, which tends to zero. If some $`h`$ differs on more than $`2d`$ positions from **every** member of $`G`$, this bad event occurs for every $`j`$. It has probability zero. All the existential bad events are analytic or are contained in the indicated measurable null bound.

It follows that almost surely, simultaneously for all hypotheses $`h`$, some member of the same fixed countable subclass $`G`$ has empirical loss at most the loss of $`h`$ plus $`2d/n`$, regardless of the labels. The null comparison event is a property of the features alone. It remains null for every iid feature law absolutely continuous with respect to $`\mu`$.

## Learner and actual output information

Use the [countable-class learner](../../lean/Conjectures/AgnosticVC/TraceCoreExamples.lean) on $`G`$ when the two empirical infima differ by at most $`2d/n`$. On the other samples use a universally measurable proper empirical minimizer for the original class. Such a selector exists by uniformizing the Borel relation for each fixed attainable mistake count, then using the smallest count with a nonempty fiber. There are finitely many counts at each size. This gives a single selection rule on all samples. The good-branch guarantee is $`583\sqrt{d/n}+2d/n\le585\sqrt{d/n}`$, and the exceptional branch attains the empirical infimum.

For a dominated labeled iid law the exceptional branch has probability zero on each fixed selector's input. There are finitely many selectors, so for almost every paired pool the conditional channel agrees with that of the countable-class learner on all selectors. The inclusion of its countable outputs into the given hypothesis space is measurable, and the whole-output CMI is bounded by the countable-class theorem. The learner's measurable modification is taken separately for each completed iid law, with the same underlying rule for all laws. The reference law is fixed through the choice of $`G`$.

## Extension to completed-measurable trace tests

The dominated-marginal result only needs each classifier to be measurable and every prescribed finite trace feasibility event to be measurable in the completion of the corresponding iid law of $`\mu`$. The feature and hypothesis spaces may be arbitrary measurable spaces with these properties. The argument avoids a measurable choice of the low-population-disagreement witness. Indeed, for each tuple in the event $`E`$, choose any one witness just for that tuple. Its ghost event with at most four disagreements is measurable and has probability at least one half. For any measurable superset of the augmented event, Fubini therefore gives a section measure of at least one half at each tuple in $`E`$. The set of tuples where this section measure is at least one half is a measurable superset of $`E`$. Taking the infimum over majorants gives the same factor-two comparison for outer probability of $`E`$.

The augmented event used for the upper bound only tests whether some double-sample trace agrees with a finite prescription for its disagreements with $`g`$. This event is a finite union over the traces, intersected with the corresponding Borel tests on $`g`$. It is measurable in the completed product law by assumption. Its probabilities under permutations can therefore be averaged as before. The local bound now holds in outer probability, which suffices for the countable-subclass approximation. To define the learner on exceptional inputs, choose an arbitrary empirical minimizer on each such sample. These inputs are contained in a single reference-null set at each sample size, so the deterministic exceptional branch preserves measurability on the completed law of every dominated sample distribution. This extension supplies the same rates and empirical guarantee without an analytic hypothesis parameterization.

## Extension from the sharp outer uniform-convergence rate

There is a second sufficient condition for the dominated-marginal theorem. Let $`X`$ be standard Borel, assume each hypothesis is Borel as a function on $`X`$, and assume
$`\mathbb E^*\sup_{h\in H}|\widehat L(h)-L(h)|\le B\sqrt{d/N}`$
for every iid labeled law and every sample size $`N`$. Here $`\mathbb E^*`$ is outer expectation and $`B`$ is a fixed numerical constant. One can then obtain the dominated-marginal conclusion without measurable finite-trace feasibility. The empirical constant is $`O(1+B)`$, and the whole-output CMI constant is unchanged. The argument also explains why a single-law obstruction to measurable scalar empirical loss cannot persist under this uniform-convergence premise.

Fix the reference feature law $`\mu`$ and a countable $`L^1(\mu)`$-dense subfamily $`G\subset H`$ as before. Choose an integer $`k\ge 10000+160000 B^2d`$. For a fixed binary vector $`b`$ of length $`k`$, let $`T_b`$ consist of the feature tuples such that, for every positive integer $`j`$, some $`h\in H`$ and $`g\in G`$ satisfy
```math
 \mu(h\ne g)<1/j,\qquad h(x_i)=b_i,\qquad g(x_i)=1-b_i
 \quad(1\le i\le k).
```
Neither the witnesses nor $`T_b`$ have to be measurable. We show that $`T_b`$ has outer measure zero.

Suppose it has positive outer measure. No coordinate of a member of $`T_b`$ can be an atom, since its mass would give a positive lower bound on $`\mu(h\ne g)`$. Tuples with any repeated nonatomic features form a Borel null set. Discard these tuples and take a measurable hull of the remaining set. Increasing finite partitions from a countable Borel generator separate all of the coordinates of each distinct tuple eventually. The conditional means of the hull indicator on the product partitions tend to one almost everywhere in the hull by martingale convergence. Thus some product cell $`A_1\times\cdots\times A_k`$ with distinct cells $`A_i`$ of positive measure has hull density at least $`0.99`$. On this cell the restricted measurable hull has the same measure as the outer measure of the restricted $`T_b`$, by minimality of the original hull. For the product of the $`\mu(\,\cdot\,|A_i)`$ laws, the restricted $`T_b`$ has outer measure at least $`0.99`$.

For a new iid labeled law $`\nu`$, sample a uniform sector $`i`$, draw a feature from $`\mu(\,\cdot\,|A_i)`$, and label it $`b_i`$. Draw $`k`$ iid rows. On each sector pattern let $`K`$ be the number of occupied sectors, and pick the first feature in each occupied sector. With outer probability at least $`0.99`$, those first features extend to a tuple in the restricted $`T_b`$. Indeed the projection of that set onto any subset of sectors has outer probability at least $`0.99`$. Adding the remaining independent rows of a fixed sector pattern preserves this lower bound by Fubini, applied to measurable subsets of the complement. The finite sector-pattern partition then gives the claimed bound under $`\nu^k`$.

We have $`\mathbb E K/k\ge1-1/e`$ and $`\mathop{\mathrm{Var}}(K)\le k/4`$. For the variance, occupancy indicators have nonpositive pairwise covariance because $`(1-2/k)^k\le(1-1/k)^{2k}`$. Chebyshev's inequality gives $`K/k\ge 3/5`$ except on an event of probability below $`0.03`$. Markov's inequality and the assumed bound applied to the countable subfamily give
$`\sup_{g\in G}|\widehat L_\nu(g)-L_\nu(g)|\le 1/20`$
except on an event of probability at most $`0.05`$. On the intersection with the extension event, choose a witness pair $`h,g`$ from a full tuple in $`T_b`$, with $`j`$ large enough that the discrepancy also has $`\nu`$-mass at most $`1/20`$. This is possible because the feature marginal of $`\nu`$ has bounded density relative to $`\mu`$. On the $`K`$ designated rows, $`h`$ is right and $`g`$ is wrong. It follows that
```math
 L_\nu(h)-\widehat L_\nu(h)
 \ge \widehat L_\nu(g)-\tfrac1{10}-\widehat L_\nu(h)
 \ge 2K/k-1-\tfrac1{10} \ge \tfrac1{10}.
```
This holds on a set of outer probability at least $`0.91`$, contradicting $`B\sqrt{d/k}\le 1/400`$. Hence the outer measure of $`T_b`$ is zero.

For a sample of size $`n\ge k`$, if one $`h`$ disagrees on at least $`k`$ rows with every member of $`G`$, take a sequence in $`G`$ converging to $`h`$ in $`L^1(\mu)`$. Some fixed choice of $`k`$ disagreement positions occurs infinitely often. The subtuple belongs to $`T_b`$ for the prediction vector $`b`$ of $`h`$ there. The union over subtuples and prediction vectors is outer-null. For $`n<k`$ there are always fewer than $`k`$ disagreements. Thus the same countable subclass approximates every trace to within $`k`$ rows almost surely for all dominated feature laws. Use it whenever its empirical optimum is within $`k/n`$ of the class optimum, and use a proper minimizer otherwise. The latter branch is contained in a single reference-null set, so completed measurability and the CMI argument continue to hold. The empirical excess is bounded by $`583\sqrt{d/n}+\min(1,k/n)\le 583\sqrt{d/n}+\sqrt{k/n}`$.

## Extension from distribution-uniform convergence with any modulus

For a fixed class, the preceding argument uses the outer uniform-deviation bound at only one size $`k\ge10000`$. Thus distribution-uniform convergence in outer probability, with any class-dependent modulus, also suffices to find a finite $`k`$ for the same conclusion. In fact boundedness of the deviation implies that its outer expectation converges to zero uniformly over labeled laws. Choose any $`k\ge10000`$ at which the supremum of these outer expectations is at most $`1/400`$. This replaces the choice using $`B`$ in both Markov's inequality and the final contradiction, and the rest of the argument is unchanged.

In particular, for every fixed reference feature law one obtains the absolute empirical constant $`584`$ for all $`n\ge\max(d,k^2/d)`$, since $`k/n\le\sqrt{d/n}`$ there. The CMI bound for all dominated laws stays $`19{,}712d`$ nats. The cutoff depends only on the class's uniform-convergence modulus, and the learner still uses the reference law. This rules out an obstruction at arbitrarily large sample sizes for just one iid law within this uniformly convergent class setting. The [fixed-law obstruction](fixed-law-multiscale-obstruction.md) uses convergence separately under each law.
