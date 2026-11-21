# Independent review of the adaptive modal certificate

21 November 2026. Reviewed source: [the coordinator's adaptive modal note](adaptive-modal-certificate.md), SHA-256 `9a7099e6b2469f3e05a8c1885233e8fb51461858996950e9f6e683128ba21e4e`. This is a proof review, not a finding of novelty, a sponsor decision, or a separate bounty.

**Result: the stated theorem and its proof pass.** No mathematical correction is requested.

## 1. The combinatorial inequality

For each deletion view, the selected description is its modal fitted-model description, with fixed tie-breaking. Its dissent count is the number of its incident pair-deletion fits that differ from this description. Grouping views by the selected description is legitimate even when the same functions have different descriptions: within a group the functions agree, and extra distinct-description groups only weaken the bound.

Choose a minimum-dissent representative from each group. If two representatives have different selected descriptions, their shared fit cannot equal both. Orient the representative edge outward from a representative for which that fit is dissenting. Distinct outgoing edges correspond to distinct dissenting fits, so the outdegree $`d_i`$ is at most the minimum group dissent $`s_i`$.

The majorization direction is correct. For any $`\ell`$ vertices in a $`g`$-vertex tournament, the sum of their outdegrees is at most

```math
\binom\ell2+\ell(g-\ell),
```

which equals the sum of the largest $`\ell`$ entries of $`(0,1,\ldots,g-1)`$. The total degree sums agree. Hence the transitive score vector majorizes the actual score vector. Convexity and monotonicity give

```math
\sum_i w(s_i)\le\sum_i w(d_i)\le\sum_{d=0}^{g-1}w(d).
```

For $`w(x)=1/((x+1)(x+2))`$, both derivative signs stated in the source are correct, and the finite sum is $`1-1/(g+1)`$. The bound by one is therefore valid and slightly loose.

For one description group, let $`q`$ be the total augmented-sample errors of its classifier. Every group member has $`r_j+X_j=q`$. Its distinct omitted blocks account for at most all $`q`$ errors. If $`q=0`$, every summand is defined to be zero. Thus

```math
\sum_{j\text{ in group}}w(t_j)\frac{X_j}{r_j+X_j}
\le w(s_i).
```

Summing these inequalities over groups proves the claimed deterministic score bound. It does not assume that different groups have the same total error count.

## 2. Probability and computation

For a fixed omitted block, the retained sample preserves its original ordered iid law. Its pair-deletion seeds are mutually independent. The omitted block is independent of the retained data and of the view's fitting seeds. Therefore its error count, conditional on that view, has the required binomial distribution. Nothing here requires the learner to be invariant under permutations.

The random dissent count and retained error count are measurable from the view alone. They can both be used inside the moment inequality. Applying Markov to this single variable, followed by the pointwise increasing inverse of $`F_{n,r}`$, does not require a union bound over either count. The cases where the proposed level is at least $`F_{n,r}(1)`$ are correctly assigned the trivial endpoint one.

The actual algorithm uses only the supplied models, their stored descriptions, and their predictions on the supplied sample. The pair-deletion models in the proof are not required computations. Rational confidence inputs permit certified upper bisection for the finite polynomial inverse.

## 3. Combining classifiers and retained limits

The modal and Gibbs models need not be the same. Nevertheless, if both separately allocated confidence guarantees hold, selecting whichever reports the smaller bound is valid for the selected model. The stated union-bound allocation is sufficient. No unjustified post-selection use of one certificate for the other classifier occurs.

The general summable convex-weight version follows from exactly the same deterministic argument. No optimality claim is made for the chosen rational weight. The original unanimity theorem keeps a sharper constant when every supplied description agrees.

The proof requires iid blocks, coherent training order, and a sound description-based equality interface. It does not obtain function equality from matching finitely many predictions. It also does not provide coverage conditional on a selected event, or a risk statement about a different model trained on all observations. The separate target/prior audit remains necessary before any claim about the historical cash offer.
