# A fixed-law matrix bound suffices for the entire agnostic VC conjecture

This reduction uses the same observations to define both the output traces and the restriction entropies. Uniformly random weights on the training mistakes let every deleted position be compared at a common hypothesis law. It eliminates the auxiliary pilot, the varying-law integration problem, and the cost of merging canonical outputs. The final matrix inequality below remains a sufficient condition, not an established estimate.

Fix $`n\ge d\ge1`$, put $`t=n/d`$, $`B=\log(et)`$, and choose the coefficients of the [averaged entropy objective](averaged-pilot-entropy.md):
```math
 \tau=\sqrt t/B,\qquad a_j=\sqrt t/(j+1)^3,\qquad
 m_j=\lceil d2^j\rceil,\quad 0\le j\le\lfloor4\log_2 B\rfloor .
```
Work in the sufficiently large universal range of $`t`$ where $`m_j\le n`$. A fixed classifier suffices on the complementary bounded range after increasing the constant. Assume a finite or countably enumerated measurable class with fixed first representatives (or the corresponding coherent measurable selector). On a labeled sample, use the first representative of every trace on **all** of its features. Draw independent $`U_i`$ uniform on $`[0,2]`$. In the entropy objective use weighted mistake count $`\sum_i U_i\ell_i(h)`$, with $`\ell_i(h)=1[h(x_i)\ne y_i]`$. Take all restriction entropies on the same feature sample. Return one draw from the unique optimizer.

For any fixed sample the expected unweighted excess mistake count is $`O(\sqrt{nd})`$. Indeed, the entropy allowances sum to $`O(\sqrt{nd})`$ as in the earlier proof. The extra cost of the random weights is at most twice $`\mathbb E\sup_h|\sum_i(U_i-1)\ell_i(h)|=O(\sqrt{nd})`$. To see the latter, write the centered weights as independent random signs times independent amplitudes at most one. Conditional on the amplitudes the loss vectors have empirical normalized $`L^2`$ covering log cardinality $`O(d\log(C/r))`$ at radius $`r`$, by the [VC packing argument](known-feature-marginal.md#a-fixed-tree-of-classifiers); multiplying coordinates by bounded amplitudes only decreases distances. Chaining successive $`2^{-j}`$ nets of loss vectors, the sign expectation of the maximum absolute increment at level $`j`$ is $`O(\sqrt n\,2^{-j}\sqrt{d(j+1)})`$ by the sign MGF and a union bound. Add the $`O(\sqrt n)`$ contribution of one starting vector and sum the convergent series. This is a pointwise empirical guarantee.

The [subsequent proposed proof](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md) supplies the matrix estimate with a revised parameter schedule and proves the deletion bound for that schedule. The following sections record the earlier reduction.

## The deterministic quantity

Write $`N=n+1`$ and fix any block $`T`$ of $`N`$ observations. On its finite canonical support take an interior probability law $`q`$. Work on mean-zero $`L^2(q)`$, with $`f_i=h(x_i)-\mathbb E_q h(x_i)`$ and $`P_J`$ conditional expectation onto the joint predictions on $`J`$. Set
```math
 A_T(q)=\tau I+\sum_j a_j\,\mathbb E_{|J|=m_j} P_J,
 \qquad
 D_T(q)=\sum_{i=1}^N\|A_T(q)^{-1} f_i\|_{L^2(q)}^2 .
```
The learner's original CMI under any joint law is at most
```math
 C\left[d+\frac{(\sum_j a_jm_j)^2}{N\tau^2}
             +\mathbb E_{T,U}D_T(q_{T,U})\right] ,
 \tag{1}
```
where $`T`$ is iid, $`U`$ is the full independent vector of uniform weights, and $`q_{T,U}`$ is the full-block optimizer with the same parameters as at training size $`n`$. The middle term is $`O(d\log^{10}(et)/t)=O(d)`$. Thus a uniform bound $`D_T(q)\le Cd`$, or even its indicated iid average, would give the required information estimate in the stated measurable setting.

Use $`H^2(P,Q)=\sum_h(\sqrt{P(h)}-\sqrt{Q(h)})^2`$ below. In comparing different supports, both probability vectors are embedded by the actual hypothesis names.

## Removing a weighted loss

Keep the full support and all full feature restrictions fixed. Define $`r_i`$ by setting weight $`U_i`$ to zero. Varying this weight continuously through $`w`$ gives a probability path $`q(w)`$. Differentiation of the first-order condition as in the [pilot lemma](averaged-pilot-entropy.md#a-finite-optimization-lemma) gives
```math
 \left\|\frac{d\sqrt{q(w)}}{dw}\right\|_2^2
 =\tfrac14\|A_T(q(w))^{-1} f_i\|_{L^2(q(w))}^2 ,
```
with centering at $`q(w)`$; changing the label at most reverses the sign of the centered feature. Cauchy–Schwarz bounds the squared endpoint distance by $`U_i`$ times the integrated squared speed on $`[0,U_i]`$. Since $`U_i\le2`$, enlarge that integral to $`[0,2]`$. Uniformity converts this last integral to twice the expectation at an independent full weight at $`i`$. Summing gives
```math
 \mathbb E_U\sum_i H^2(q_{T,U},r_i)\le \mathbb E_U D_T(q_{T,U}).
 \tag{2}
```
All summands on the right are now evaluated at the same random optimizer.

## Removing a restriction coordinate

Still keeping the full hypothesis support, form $`r'_i`$ from $`r_i`$ by drawing restrictions from the remaining $`N-1`$ indices. Couple a uniform $`m_j`$-subset of $`[N]`$ to a uniform $`m_j`$-subset avoiding $`i`$: when it contains $`i`$, replace that index by a uniform index outside the original subset, otherwise keep it. Symmetry gives the desired marginal. Thus the fraction affected is $`m_j/N`$. In an affected pair of restrictions the other $`m_j-1`$ indices are identical. The binary conditional-entropy gradient bound from the [pilot lemma](averaged-pilot-entropy.md#a-finite-optimization-lemma) applies without change, yielding
```math
 H^2(r_i,r'_i)\le C(\sum_j a_jm_j/(N\tau))^2.
 \tag{3}
```

## Collapsing the identical representatives

At this point the two full hypotheses in each merged trace pair have exactly the same remaining loss and restriction predictions. The base entropy splits their mass equally in $`r'_i`$. Write $`\mu_i`$ for their combined total mass across all pairs, summing both endpoints. For each pair mark one endpoint of **smaller full-block mass** under $`q_{T,U}`$, breaking ties arbitrarily, and let $`E_i`$ be the marked set. Then $`r'_i(E_i)=\mu_i/2`$. Across all $`i`$, each full unit-distance edge is counted once. Integrating the one-inclusion edge bound on upper weight-level sets gives $`\sum_i q_{T,U}(E_i)\le d`$. Since $`Q(E)\le2P(E)+2H^2(P,Q)`$,
```math
 \sum_i\mu_i\le4d+4\sum_i H^2(q_{T,U},r'_i).
 \tag{4}
```
This avoids any assumption on ratios of neighbors' full probabilities.

Push $`r'_i`$ onto the actual first representatives after deletion, obtaining $`b_i`$. Its squared distance from $`r'_i`$ is $`(2-\sqrt2)\mu_i`$. Every first representative on the smaller sample also represents its full trace: an earlier identical full trace would be an earlier identical smaller trace. Let $`F_i`$ be the desired deleted-sample objective, and $`D_i`$ the set of collapsed doubletons in its support. By equal splitting, $`b_i`$ minimizes $`F_i(b)-\tau\log(2)b(D_i)`$. If $`q_{-i}`$ minimizes $`F_i`$ itself, full-entropy curvature and convexity of the other terms give
```math
 \tau\,\mathrm{KL}(b_i\Vert q_{-i})\le F_i(b_i)-F_i(q_{-i})
 \le \tau\log(2)\,b_i(D_i)=\tau\log(2)\mu_i .
```
The squared square-root distance is at most KL. Combining (2)–(4) by the triangle inequality yields the bound in (1) for the expected sum of the $`N`$ squared deletion distances to the full optimizer.

## Returning to the paired selectors

Condition on the other selector bits. The two possible training blocks arise by deleting one or the other of two entries from an iid union of size $`N`$. Couple their auxiliary weights by taking the corresponding subsets of the same full weight vector. Joint convexity of Jensen–Shannon divergence bounds the divergence of the actual output laws by the mean divergence in this coupling. For fixed weights it is bounded by the squared square-root distance between the two deletion laws, and hence by twice the sum of their squared distances to the full law. Exchangeability turns the expected bound into an average over all $`N`$ possible deletions. Tensorizing over the $`n`$ original selectors proves (1). The [sponsor's conjecture](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) still requires the remaining estimate.
