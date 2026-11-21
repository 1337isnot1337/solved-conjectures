# Coordinator review of the full proper-threshold construction

Reviewed 21 November 2026. This is a mathematical audit of the complete
written construction, not a Lean certificate, external referee report,
priority determination, or prize decision.

The audited source versions are:

- `threshold-shifted-tree-candidate-proof.md`, SHA256
  `d8dbbfac80b7711af85df8e116a7d7a3e788fafadfeac22cf90bbfaf56388476`;
- `threshold-properization-information-lemma.md`, SHA256
  `eadb9c59a88f144ad800a5684da425c09e5d8700783a51b332a3c06c6a59a965`;
- `threshold-random-tag-rounding.md`, SHA256
  `51e1527b0be258ab2dcc4c93d9e61aee8bc3c5c3438baa112ac69a71cb36f014`.

The mathematical theorem passes this audit. The result covers every
positive sample size, every individual labeled real sample, and every
iid distribution on real features and binary labels. The final output
is a closed threshold with a finite real parameter. The statement is
the separately rewarded real-threshold case of Conjecture 6, not the
full general-VC conjecture.

## 1. What the learner actually sees

The algorithm uses only its selected training sample and independent
private randomness. The full paired sample, the other member of a
replacement pair, and the union ordering appear only in the proof.
The lexicographic tag construction is directly measurable on the
product Borel space. No global order embedding into the real line or
distribution-dependent quantile map is assumed.

Sorting removes dependence on input indices. Oriented copies of the
observed features and the infinity endpoint are uniquely identifiable
once tags distinguish features. The augmented relative shift is an
analysis output; discarding it cannot increase information.

## 2. Folded alignment and exact inactive-node cancellation

For two samples differing in one observation, their folded cycles are
obtained by deleting two oriented positions from a single union cycle.
Starting at a common oriented anchor, equal cyclic offsets in the two
shorter cycles have union offsets differing by at most two. The union
loss is 1-Lipschitz along every cycle edge, including both folds. Removing
one observation changes a loss by zero or one, so aligned own losses
differ by at most three. The proof safely uses four.

An abstract node interval containing the anchor has the same number of
positions to the anchor's left and right in the two shifted cycles. If
neither own unmatched observation occurs in its own interval, the two
lists of common oriented identifiers coincide. A first divergence while
walking in either direction would require encountering one of the two
unmatched identifiers, contradicting inactivity.

For an individual observation, the threshold-loss contribution changes
only across an edge incident to one of its two oriented copies. A
contiguous common interval omitting both copies has constant contribution.
Thus the two empirical-loss arrays differ by one constant on an inactive
parent. Their two child minima shift equally, and the child logit is
exactly unchanged. This includes intervals wrapping a fold and children
consisting of one leaf.

## 3. Density comparison and iid averaging

The output pair consisting of oriented anchor and relative shift determines
one original shift and one abstract terminal leaf. The probability mass is
therefore exactly one over the cycle length times the product of the
branch probabilities on that leaf's fixed abstract path. This is a
bijection, not an exchange of marginal and conditional path laws.

The absolute derivative of either logistic log probability is at most
one. Only active nodes contribute to the log-density ratio, each by at
most eight divided by its noise scale. The scale

```math
\sigma_j=128\sqrt n\,2^{-j/4}
```

makes the complete common-support likelihood ratio at most $`e`$ in both
directions. Squaring the active geometric sum gives precisely the
coefficient in the authored equation(11). Active depths are an initial
segment, although the geometric estimate would also hold for an arbitrary
subset of depths.

Conditional on a sample's unordered observations, the distinguished
replacement index is uniform among them. The algorithm and its own
augmented output do not use that index. Consequently the expected charge
that this observation occurs in a depth-$`j`$ parent is bounded by its
leaf count divided by $`n`$. This bound applies to each observation under
its own output law. For the other observation's event, the common-support
density ratio transports the expectation to that other law before
exchangeability is used. There is no unsupported bound on ghost mass in
an adaptively chosen interval.

Missing support consists of outputs at the changed feature. Its expected
mass on each side is at most $`1/n`$ by the same designated-index argument.
On common support the Jensen-Shannon integrand is at most one eighth of
the total mass times squared log-density ratio. These are the original
subprobability masses, not renormalized common laws. The missing support
is charged separately, with no omitted normalization or binary-entropy
term. The convergent depth sum yields the stated adjacent bound.

The selector tensorization is valid because selector bits are independent
conditional on the paired pool. The sum of conditional single-bit mutual
informations, with all other bits revealed, bounds the full information
from above. Averaging each term over the iid pool gives exactly the
adjacent-sample Jensen-Shannon expectation just bounded.

## 4. Accuracy and arbitrary atoms

At each visited node, the expected increment in its minimum loss is at
most its noise scale. These increments telescope to terminal loss minus
the global minimum. Their geometric sum is bounded by a constant times
$`\sqrt n`$ on every fixed distinct-feature input; no iid hypothesis is
needed for accuracy.

The tag-rounding identity uses tags strictly below the selected tag,
which is the correct convention for a closed virtual threshold. Both
ordinary endpoint losses are at least the original empirical minimum.
Choosing the endpoint with interpolation coefficient at least one half
therefore gives the stated pointwise factor-two bound. The maximum signed
tag bridge over feature groups has expectation at most $`4\sqrt n`$ by
squared symmetrization and the finite martingale maximal inequality.
This supremum controls an adaptively selected group and tag; neither is
incorrectly treated as independent of the learner.

For information, independent tags are attached to both members of every
pool pair. Adjoining the full tag array to the output cannot decrease
information, and its independence from the selector makes the chain-rule
comparison exact. This supplies the original CMI bound for all atomic or
nonatomic real-feature distributions.

## 5. Properization and the adaptive rank code

The companion lemma defines its rank code on every reference triple,
including those for which the sampled selector would not have produced
the fixed output query. Avoiding the first $`k`$ distinct pool feature
groups either is impossible, because a pair lies wholly in them, or
requires at least $`k`$ distinct fair selector decisions. The resulting
geometric tail remains valid with repeated features and contradictory
labels at the same feature.

Under the reference law the output and pool have their actual joint
marginal and the selector is independently resampled. Its relative
entropy from the actual law is exactly the output's original CMI. The
variational entropy inequality charges the adaptive query correctly.
Both the exponential moment and the normalizing partition sum equal
$`1+\sqrt2`$ at $`\lambda=(\log2)/2`$, giving the exact bound

```math
I(Q,K;S\mid T)\le2I(Q;S\mid T)+2\log(1+\sqrt2).
```

The successor, no-successor sentinel, and selected-maximum cases give a
finite real closed-threshold parameter with exactly the original output's
predictions on the training sample. Conditioning on the full pool permits
decoding from the rank code solely in the proof. The implemented learner
never needs the full pool. Empirical accuracy is unchanged.

## 6. Explicit constants and independent finite diagnostic

Writing $`\eta=1-2^{-1/4}`$, the authored improper information constant is

```math
C_I=\log2+\frac{1+e}{128\eta^2(1-2^{-1/2})},
```

and its total-loss accuracy constant is $`C_L=256/\eta+8`$. The elementary
bounds $`\eta>1/8`$, $`e<3`$, and $`1-2^{-1/2}>1/4`$ show $`C_I<9`$
and $`C_L<2056`$. The proper information constant is less than 21.
Thus the single constant 4096 safely satisfies both inequalities in the
sponsor's statement. No parameter optimization is needed for the theorem.

The standalone [exact boundary checker](verify.py)
independently tests all sorted replacement pairs and binary union labels
for sample sizes one through six. Its
[receipt](verification.json) records4092 sample-label
pairs,8001024 aligned leaf comparisons,2266688 aligned nodes, and677552
inactive nodes. All assertions pass; the largest observed leaf-cost
difference is exactly three. The checks cover the finite indexing and
wrap conventions. They are not used to infer the theorem for untested
sample sizes and are not a separate mathematical completion.

## 7. Exact source and remaining nonmathematical checks

The [primary COLT 2020 paper](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf),
Definition3 and Conjecture 6, was reopened and compared directly. It
requires original CMI averaged over an iid paired pool for every
distribution, and expected empirical excess on every individual dataset.
The constructed proper learner has those quantifiers. Section 3 separately
offers US$20 for this proper real-threshold problem and US$15 for its
improper version. These are alternatives for one problem.

The independent literature and current-offer check is recorded separately.
Internal proof review does not establish priority against unseen work,
sponsor acceptance, or a payment. No sponsor contact or submission is
part of this audit.

The exact original drafts named by review hashes are preserved in [reviewed-sources.json](reviewed-sources.json). The consolidated [proof](PROOF.md) combines the checked construction and properization.
