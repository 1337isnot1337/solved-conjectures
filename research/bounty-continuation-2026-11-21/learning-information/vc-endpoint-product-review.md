# Independent review of the VC-one endpoint and disjoint-product reductions

21 November 2026. This reviews the written arguments in the repository's [VC-one endpoint reduction at 9eee924](https://github.com/1337isnot1337/solved-conjectures/blob/9eee924bcd1d78d12655e39c0c8e5aa941092fd1/research/steinke-zakynthinou-agnostic-vc/endpoint-reduction.md) and [disjoint-product theorem at e0219b7](https://github.com/1337isnot1337/solved-conjectures/blob/e0219b79d7f7ce0691d7bb029b0a51a27b493787/research/steinke-zakynthinou-agnostic-vc/disjoint-products.md). Both are partial results toward the [original US$500 agnostic VC conjecture](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf). Neither has a separate prize under that offer. This review does not change the completed-bounty count.

## 1. Endpoint reduction

The stated domain restriction is necessary to the countable-core argument as written. For a countable instance domain there are countably many finite restrictions. Retaining one representative of each realized restriction gives a countable class with the same optimum on every finite labeled sample. This is an exact finite-sample statement, not an approximation in the unknown distribution.

For a fixed base hypothesis, the disagreement sets on that core are laminar: a crossing pair, its intersection, and the base hypothesis would shatter the corresponding two points. The finite laminar-family ordering and compactness argument give a common order in which every disagreement set is convex. Adding a final copy of the base hypothesis keeps each nonempty interval away from both ends. Positive summable weights place each actual hypothesis strictly inside its own coordinate interval. Whenever two initial-segment cuts differ, a hypothesis from their difference has its interior coordinate strictly between them. This establishes the existence of a proper decoded hypothesis even for a non-discrete countable order.

The two signed endpoint losses have the exact identity

```math
 l_0(s(h))+l_1(s(h))=1+\ell(h;x,y)-b,
```

where $`b`$ is the base hypothesis's loss on that row. Choosing one endpoint independently per row therefore gives the correct original empirical objective after expectation and multiplication by two. Empty disagreement sets cause no problem: their equal cuts have opposite endpoint signs.

For a fixed original sample, the random discrepancy is a sum of two signed prefix processes and fixed signed bits. The ordinary maximal inequality gives expected absolute prefix maximum at most $`2\sqrt n`$; the fixed-bit term has expected absolute value at most $`\sqrt n`$. The factor one half from endpoint selection yields the claimed $`3\sqrt n`$ bound. Comparing the decoded learner with an original empirical minimizer uses this discrepancy twice, and gives total excess at most $`2(C_L+6)\sqrt n`$.

The decoder only needs the selected cut immediately below and immediately above its threshold. It must use the open interval between those cuts; an actual interior coordinate there has exactly the same selected synthetic predictions. If the threshold lies outside $`[0,1]`$, the zero and one defaults still give a nonempty decoding interval, because all actual cuts lie strictly between them. Identifying the final base copy with the original base hypothesis preserves the original predictions.

The information argument keeps all auxiliary endpoint coins independent of the original selector. Conditional on those coins, the transformed supersample is a valid iid supersample for the threshold algorithm. For either occupied-boundary rank $`K`$, redraw the selector while retaining the threshold and full pool. Avoiding $`k`$ distinct cuts either is impossible because it excludes both members of a pair, or forces at least $`k`$ independent selector bits. Thus

```math
 \Pr_{\mathrm{ref}}(K>k)\le 2^{-k}.
```

With $`\lambda=(\log 2)/2`$, both the exponential moment and the corresponding positive-integer geometric-code normalizer are at most $`1+\sqrt2`$. The KL cost of restoring the true selector is exactly the base learner's conditional information. The entropy variational inequality therefore gives

```math
 H(K\mid v,T,U)\le C_I+2\log(1+\sqrt2).
```

Subadditivity suffices for the two ranks; they need not be independent. Including the base threshold output gives $`3C_I+4\log(1+\sqrt2)`$. Revealing the independent endpoint coins can only enlarge the original conditional-information quantity being bounded. The countable-domain measurability statement matches the construction.

## 2. Subsampling and disjoint products

The important first inequality has the direction stated in the proof. For independent selector bits conditional on a supersample,

```math
 \sum_{i=1}^r I(A;S_i\mid T)\le I(A;S\mid T).
```

The other selectors remain hidden in each term on the left. Revealing them would produce the opposite useful comparison and would not prove the proposed smoothing estimate.

Under a uniform pairing and ordering of $`2r`$ candidate observations, the changed observation occupies a uniform pair position. With probability one half its unchanged mate is used. Joint convexity of Jensen–Shannon divergence then gives one half of the base learner's marginal selector information at that position. Averaging the position gives the claimed expected neighboring JS bound $`B_r/(2r)`$. The random pairing and order do not reveal the other pair selectors.

The random range of local sample sizes is also handled correctly. When the component size increases from $`m`$ to $`m+1`$, the two uniform integer ranges have total variation $`O(1/m)`$. On their common part, replace a uniformly chosen member of the old candidate subset by the new observation with probability $`2r/(m+1)`$. The resulting candidate subset is uniform in the larger sample. Conditional on this replacement, all unchanged candidates and the two alternatives are iid; the preceding bound applies. The finitely many small sizes are absorbed in a universal constant. This proves the expected add-one bound $`O((1+B)/(m+1))`$.

To compare two replacement alternatives, the common-sample kernel is a legitimate intermediate law, including when one component is empty. The stated JS–Hellinger comparisons and the triangle inequality give a constant times the sum of the two add-one costs. Other component outputs have independent, identical laws, so adjoining them does not change the relevant divergences. Mapping the tuple to its combined function cannot increase information.

If a fresh observation lies in component $`j`$, its number of common predecessors has law $`\mathop{\mathrm{Bin}}(n-1,\pi_j)`$. The exact identity

```math
 n\pi_j\,\mathbb E\frac1{M_j+1}=1-(1-\pi_j)^n\le1
```

turns the add-one denominator into a bound independent of both the component's mass and the number of components. Summing gives $`O(\sum_j(1+d_j))=O(d)`$ after removing constant classes. The algorithm does not need the probabilities $`\pi_j`$.

For empirical accuracy, the two disjoint uniform subsets and the random pairing give the stated finite-population VC discrepancy. The derivation of the fixed-design Rademacher bound from the iid VC inequality is sound: conditional on magnitudes, the grouped signed coefficients have independent fair signs, and their expected magnitudes are common and at least the singleton probability $`1/e`$. Jensen's inequality then reduces to iid resampling with fair label flips. Zero coefficients can receive independent auxiliary signs. For small sample sizes the trivial bound is sufficient.

Because local subsample size is comparable to the component size, the local excess in counts is $`O(\sqrt{m_jd_j})`$. Independent hypothesis choices on the disjoint parts make the empirical optimum decompose exactly. Cauchy–Schwarz gives

```math
 \sum_j\sqrt{m_jd_j}\le\sqrt{n\sum_jd_j}=\sqrt{nd}.
```

## 3. Scope of this review

The two written proofs pass this review under their stated assumptions and the already reviewed proper threshold theorem. This review does not replay their finite diagnostic programs, provide Lean verification, establish a reduction of arbitrary VC classes to these structures, or claim sponsor acceptance. The subsequent real-interval theorem is a separate argument and is not certified by this file.
