# Erdős–Gallai–Tuza clique-transversal conjecture

Partial result for [Erdős #611](https://www.erdosproblems.com/611) and [issue #830](https://github.com/1337isnot1337/solved-conjectures/issues/830). Work in the complement H so that maximal cliques become maximal independent sets. Write τ_{≥k}(H) for the least size of a set that hits all maximal independent sets of size at least k, and ν(H) for the largest induced matching.

## Entropy bound and deletion robustness

For 1≤k<n, put c=k/n. Then
```math
\tau_{\ge k}(H)\le 1+\left\lfloor
\frac{\log\left(\sum_{j=0}^{\nu(H)}\binom{n}{2j}\right)}{-\log(1-c)}
\right\rfloor .
```
If k=n, there is at most one target, requiring at most one vertex.

By [Alekseev's 2007 theorem](https://doi.org/10.4213/dm967), the number M of maximal independent sets is at most the number of induced matchings, including the empty matching. An induced matching is uniquely specified by its endpoints, giving M≤Σ_{j≤ν} binom(n,2j). A uniform t-element vertex set misses a given target with probability
```math
\frac{\binom{n-|S|}{t}}{\binom n t}\le (1-c)^t.
```
For the displayed t the union bound is strictly less than one (or taking all vertices is already sufficient). Thus if ν(H)=o(n), then τ_{≥cn}(H)=o(n) at every fixed c>0, even when there are also small maximal independent sets. Quantitatively, for 0<2ν/n≤1/2 the numerator is at most n times the binary entropy at 2ν/n. For ν=0 use the numerator zero. The entropy tail estimate follows by summing the binomial probabilities with parameter 2ν/n: every factor p^j(1−p)^{n−j} for j≤pn is at least exp(−n entropy(p)).

In particular, if a counterexample sequence has smallest maximal independent set at least cn and τ(H)≥δn for fixed c,δ>0, then **after deleting any at most min(c,δ)n/2 vertices, the residual still contains an induced matching with a linear number of edges**, with uniform constant depending only on c and δ. Indeed, any maximal independent set of H−D extends to a maximal independent set of H using only vertices of D, so the residual minimum rank is at least cn−|D|. A transversal for H−D, with D adjoined, hits every maximal independent set of H, since any maximal set disjoint from D remains maximal there. Thus τ(H−D)≥δn−|D|. Applying the entropy bound with both remaining ratios bounded below forces linear ν(H−D).

In the original graph a linear induced matching in the complement is an induced complete multipartite graph whose parts all have size two, and the conclusion is robust under the same arbitrary vertex deletions. This constraint is compatible with the previously obtained two-sided connectivity core and can be applied inside that core.

## The logarithm cannot be removed at fixed induced matching number

There are split graphs H on n=2m vertices with ν(H)=1, every maximal independent set of size at least n/6, and transversal number Ω(log n). Thus the order O(log n) from the upper bound for fixed ν is sharp, even at induced matching number one.

Take a clique Y of size m and an independent set X of size m. Include every Y–X edge independently with probability 1/2. The maximal independent sets containing a point of Y are exactly {y}∪(X∖N(y)) for y∈Y. The only other possible maximal set is X. Chernoff and a union bound give |X∖N(y)|≥m/3 for every y with probability 1−o(1).

Let t=floor((log₂ m)/2). For any fixed T of size at most t, and any y∈Y∖T, the chance that y is adjacent to every point of T∩X is at least 2^(−t). This ensures the associated maximal independent set avoids T. These events use disjoint random edges for different y, so the probability T hits them all is at most exp(−(m−t)2^(−t)). The number of candidate T is at most (2m+1)^(t+1). This count is exp(O(log²m)), whereas the negative exponent above has order √m; thus with probability 1−o(1) not one such T is a transversal. Finally each edge touches Y, and edges with distinct Y endpoints cannot lie together in an induced matching since the endpoints in Y are adjacent.

## Scope

The [original paper](https://doi.org/10.1016/0012-365X(92)90681-5) and [problem archive](https://www.erdosproblems.com/611) ask for unrestricted behavior. The counting theorem is prior work; the entropy estimate, the robust exclusion for a counterexample, and the split-graph lower construction are applications. Large induced matchings are not excluded by the original lower-rank hypothesis, so the general question stays open.
