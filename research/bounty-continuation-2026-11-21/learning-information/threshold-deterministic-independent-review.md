# Independent review of the deterministic threshold extension

21 November 2026. This review concerns the written mathematics in
[DETERMINISTIC.md](https://github.com/1337isnot1337/solved-conjectures/blob/3e4579facf515e3a51ca6c271a332b0acb52b9f2/results/steinke-zakynthinou-thresholds/DETERMINISTIC.md)
and [PRIORITY.md](https://github.com/1337isnot1337/solved-conjectures/blob/3e4579facf515e3a51ca6c271a332b0acb52b9f2/results/steinke-zakynthinou-thresholds/PRIORITY.md),
at commit `3e4579facf515e3a51ca6c271a332b0acb52b9f2`.
The coordinating agent checked the added arguments independently of
their author. This is a review of the same threshold target already
recorded in the result directory, not an additional solved problem.

## Definition and scope

The original [Steinke–Zakynthinou paper](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf), Definition 3, defines a learner on an ordered sample and averages conditional information over an iid paired pool. It does not impose permutation invariance on the learner. The distinction matters: the new deterministic learner uses its input positions. The arbitrary-order empirical guarantee remains pointwise, while exchangeability is used in the information calculation.

I checked the extension against the original CMI, not evaluated CMI or
a distribution-dependent learner. The result still returns a finite
closed real threshold and permits arbitrary feature atoms and labels.
The deterministic and efficiency clauses in the original reward apply
to this same threshold question. This review neither adjudicates those
bonuses nor claims external acceptance.

## 1. The symmetric accurate distribution

At each repeated feature, ordering positive labels before negative labels
makes the loss first increase and then decrease as a virtual cut passes
the group. Every interior loss is at least the smaller of the two endpoint
losses. The endpoint rounding therefore preserves the global empirical
minimum and can only improve the chosen cut's loss.

The augmented ordering keys may contain the labels. This is allowed in
the auxiliary argument: the transformed labeled observations remain iid,
and replacing one original observation replaces one augmented observation.
The tree argument uses these properties and the order, not independence
of features and labels. Independent tags only distinguish identical
feature-label pairs and disappear from the computed projected law.

The rounding choice costs at most one bit. The previously reviewed
properization then preserves empirical predictions with the stated
information bound. The rational branch rule has expected increase at
depth $`j`$ at most $`128\sqrt n\,2^{-j/4}`$, whose sum is less than
$`1024\sqrt n`$.

Conditioning on excess at most $`2048\lceil\sqrt n\rceil`$ has
probability at least one half on every sample. For a law $`P`$ and its
conditioned law $`P'`$, comparison with the unconditioned pool mixture
$`Q`$ gives

```math
D(P'\Vert Q)
\le\log2+2\int\log^+(dP/dQ)\,dP
\le\log2+2D(P\Vert Q)+2/e.
```

The bound on the negative part follows after changing measure to $`Q`$.
Averaging over selectors and using the mixture-minimizing identity for
relative entropy proves the information bound for the conditioned
distribution. No sample-dependent conditioning event is treated as
information-free.

## 2. The selected row when features repeat

The conversion from an accurate parameter $`V`$ to an observed feature
$`W`$ requires at most a flag for the parameter above the sample maximum.
Given that flag, $`W=V`$ or $`W=V-1`$. This establishes the claimed
information bound for $`W`$.

Uniformly choose a selected row at feature $`W`$. If the pool contains
$`m`$ occurrences of $`W`$ and the sample contains $`\hat m`$, compare
this row law with weights equal to pool multiplicities divided by $`m`$.
A row can contain one or two pool occurrences, and either case gives
conditional relative entropy at most $`\log(m/\hat m)`$.

Under the comparison law that resamples the selector independently,
$`\hat m=d+\mathop{\mathrm{Bin}}(r,1/2)`$ when the pool has $`d`$ double
rows and $`r`$ single rows, with $`m=2d+r`$. The integral identity and
$`t\le((1+t)/2)^2`$ imply

```math
\mathbb E\frac1{1+\hat m}
\le\frac2{m+1},\qquad
\mathbb E\frac m{\max(1,\hat m)}\le4.
```

Applying the entropy inequality to the logarithm, and charging the
selector-resampling cost $`I(W;S\mid T)`$, gives

```math
I(J;S\mid T)
\le2I(W;S\mid T)+\log4<100.
```

Thus the proof bounds the actual row index, including duplicate features.
It does not silently substitute information about the threshold value
for information about a supporting row.

## 3. The deterministic-priority lemma

I checked both rank estimates. Revealing rows in decreasing order of
their forbidden initial-segment lengths leaves every later forbidden
segment intact after preceding successful reveals. This proves the
exponential avoidance bound for sampling ranks without replacement.
It yields the stated expectation bound for the best ratio.

For the coordinatewise estimate, after conditioning on a row's rank,
the two allowed losses in forbidden-segment size account for integer
ties and the removed rank. The case $`p_i>1/2`$ is immediate; otherwise
integrating the resulting geometric tail gives
$`\Pr(F=i)\le2e^2p_i`$. The proof separately avoids dividing by
$`n-1`$ when $`n=1`$.

Ordering by the pool-average weights gives a one-based rank $`K`$ that
determines the selected row given the pool and priorities. The reference
law proportional to $`k^{-2}`$ gives entropy at most
$`\log2+2\mathbb E\log K`$. The dyadic counting variable has expectation
at most five and bounds the number of rows below every ratio threshold.
Combining this with the coordinate estimate and

```math
\sum_i p_i\log^+(p_i/q_i)\le D(p\Vert q)+1/e
```

proves the displayed entropy bound in the lemma. For
$`B=I(J;S\mid T)<100`$, the numerical upper bound is below 6000 nats.

## 4. Input order, output decoding, and computation

For any fixed permutation of the paired pool, the permuted pool has the
same law and the correspondingly permuted selector stays independent
uniform. The symmetric row-weight vector permutes accordingly.
Consequently averaging the random-priority conditional entropy is
exactly the same information calculation as applying the fixed
one-based-position rule to the actual ordered input. This argument
does not give an adversarial-pool CMI bound and does not claim one.

Given the pool, the selected row and the priorities, the final parameter
has at most four possibilities: either of the row's two features, with
or without one added. The additional entropy is at most $`\log4`$.
The learner itself is deterministic, so its conditional output entropy
is its original CMI. The loose 7000-nat bound follows.

Every row of positive weight supports an accurate parameter. The decoder
at a maximum feature chooses the better of the closed threshold there
and the threshold one unit above it. It therefore preserves the
pointwise empirical accuracy even when the input order is adversarial.

The exact-computation argument sums polynomially many rational leaf
probabilities with polynomial bit length. Clearing all their denominators
still produces polynomial bit length. Sorting, summation, filtering and
priority comparison consequently have the claimed polynomial bounds,
under the comparison model for real features or the bit model for
rational inputs.

## Review outcome

The added written proof passes this review, conditional on the previously
reviewed shifted-tree and properization lemmas. It supports the claimed
deterministic proper learner, its all-sample empirical bound, and the
stated original-CMI bound. This review did not independently rerun the
new implementation's enumeration and is not Lean verification.

The completion count remains one proposed bounty solution. The
randomized construction, finite-coin implementation and deterministic
extension are three versions of that one result.
