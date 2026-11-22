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
