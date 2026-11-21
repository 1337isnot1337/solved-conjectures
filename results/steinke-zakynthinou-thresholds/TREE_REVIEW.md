# Independent audit of the shifted-tree threshold candidate

21 November 2026. Reviewed the complete
[candidate proof](PROOF.md)
at SHA256
`d8dbbfac80b7711af85df8e116a7d7a3e788fafadfeac22cf90bbfaf56388476`.
This is the version with scale
$`\sigma_j=128\sqrt n\,2^{-j/4}`$.

**Mathematical assessment:** the argument passes this independent review.
I found no missing mathematical hypothesis or invalid inference in the
written construction and its uniform accuracy/CMI proof. This assessment
does not certify novelty, present honoring of the prize, external
acceptance, or payment. Those require separate checks. No numerical
experiment is used as a proof.

## 1. Exact target comparison

I opened the primary
[COLT 2020 open-problem paper](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)
directly. Definition 3 is the original iid-pool conditional mutual
information used in the candidate. Conjecture 6 requires a uniform CMI
bound and an expected empirical-loss guarantee on every individual
labeled sample. For real thresholds, the VC dimension is one, so the
candidate's absolute constants and $`n^{-1/2}`$ empirical excess match
these quantifiers. Section 3 explicitly offers US$15 for the improper
threshold version. It does not require an efficient or deterministic
learner for that base amount.

The candidate produces ordinary binary functions on the original real
domain. It does not substitute evaluated CMI, a realizable-data
guarantee, a distribution-dependent algorithm, or an average-input
accuracy statement. Its open-threshold outputs are allowed by the
separately stated improper version.

## 2. Folded alignment and zero activation

The most delicate step is valid, including the two folds and singleton
children.

For adjacent samples $`z^0=C\cup\{u\}`$,
$`z^1=C\cup\{v\}`$, the folded union word has $`M+2`$ positions.
Each sample word is obtained by deleting exactly two positions, the
oriented copies of the absent record. Infinity retains both distinct
oriented identifiers. At a common oriented anchor $`a`$, indexing
each word forward from $`a`$ identifies relative position $`r`$
with union position $`r+k_b`$, for $`0\le k_b\le2`$. Thus paired
positions are separated by at most two union steps. This includes
positions that cross the original printed origin, because the indexing
starts at the common anchor on the cycle.

The union loss is 1-Lipschitz along every cycle edge. At the two folds,
the neighboring hypotheses are identical, so the loss difference is
zero. Removing the absent observation subtracts a number in
$`\{0,1\}`$. Corresponding own-sample costs therefore differ by at
most three. The proof's bound four is safe. It follows that paired
child minima differ by at most four and paired logits by at most
$`8/\sigma_j`$.

For a fixed common output $`(a,V)`$, the terminal abstract tree
position is $`-V\bmod M`$. Every corresponding parent interval
therefore has the same size and the same number of leaves on either
side of the anchor. If it contains neither source sample's unmatched
record, both intervals contain only common identifiers. Walking the
prescribed number of steps left and right from the anchor in the
common cyclic order gives exactly the same identifier sequence in
both samples. This is stronger than a mere bounded rank discrepancy.
Their child sequences consequently agree as well, including a child
consisting of a single leaf.

For an observation $`u`$, its binary loss as a function of a threshold
changes on the forward leg only across the edge immediately after
$`u^+`$, and on the reverse leg only across the edge immediately
before $`u^-`$. Both changing edges are incident to a copy of $`u`$.
There is no loss jump at infinity or at the closing first-threshold
fold. A contiguous interval omitting both copies of $`u`$ cannot
contain an internal edge at which its contribution changes. Its
contribution is therefore constant across that interval. The same
argument applies to $`v`$ in its source word.

On the identical common sequence, the difference of the two sample
losses is the difference of those two constant contributions. It is
one constant on the entire parent. Each child minimum shifts by that
constant, so the difference of the child minima, and hence the logit,
is identical. This proves the asserted zero-activation property.
Nested intervals also make the active depths an initial segment.

## 3. The augmented-output density is the actual density

The learner can compute its oriented output $`a`$, its selected
uniform shift $`\theta`$, and
$`V=\theta-\mathop{\mathrm{pos}}_z(a)\bmod M`$. This augmentation
is a measurable, permutation-invariant operation on its own execution.
It does not use a supersample or a ghost record.

For a fixed sample and any $`(a,V)`$, there is exactly one compatible
shift,
$`\theta=V+\mathop{\mathrm{pos}}_z(a)\bmod M`$, and exactly one
terminal abstract tree position. Thus


```math
q_z(a,V)=M^{-1}\prod_j p_{z,j}
```


is the actual mass of that augmented output. The two sample laws have
the same abstract path on common outputs. The shift may depend on
$`a`$; the calculation does not condition on an output-selected
shift as though it were still independent. It instead uses the
bijection of joint outcomes exactly.

Logistic child log-probabilities are 1-Lipschitz in the logit. Combined
with zero activation, this gives the stated bound by
$`8\sum_j I_j/\sigma_j`$. Since the active depths form a prefix,
the geometric sum gives the squared bound in equation (11) of the
candidate.

With $`\eta=1-2^{-1/4}`$, every internal depth has
$`2^j\lt M\le4n`$. The resulting uniform common-support log-ratio
bound is at most


```math
\frac{8\sqrt2}{128\eta}<1.
```


The elementary estimate $`\eta>1/8`$ used to verify this constant
is correct. Therefore transport by a factor at most $`e`$ works
in both directions on the entire common support.

## 4. Exchangeability is used in the valid direction

Conditional on an unordered iid source sample, its distinguished
replacement record is uniform among the $`n`$ source records.
The learner and its augmentation depend only on the sorted labeled
sample and their own random choices, not on which source record was
designated as the replacement. At a fixed depth-$`j`$ output node,
the number of distinct record identifiers present is at most the
number of leaves. Two copies of one record do not increase that
number beyond the leaf count, and infinity does not count as a
record. Therefore the own-sample activation charge is at most


```math
\frac{\lceil M/2^j\rceil}{n}\le8\,2^{-j}.
```


This conditional exchangeability remains valid even though the output
node depends on the sample and its labels. The distinguished source
index is uniform after that unordered sample is fixed. Restricting to
common outputs only decreases the nonnegative own-sample sum.

The opposite-sample unmatched record cannot be charged by this argument
directly. The proof correctly transports its event to its own output
law using the pointwise density-ratio bound first. This yields the
stated combined charge


```math
\mathbb E\sum_{\mathrm{common}}(q_0+q_1)I_j
 \le16(1+e)2^{-j}.
```


The missing support consists exactly of outputs naming the source's
unmatched feature, with either orientation and any $`V`$. The same
own-sample symmetry bounds its expected total mass by $`1/n`$ for
each source. No assertion of uniform ghost placement under the wrong
sample law is needed.

## 5. Information calculation and constants

The positive-mass Jensen–Shannon estimate follows from
$`\log x\le x-1`$ and
$`(p-q)/(p+q)=\tanh(\tfrac12\log(p/q))`$. The missing-support
contribution is exactly half the missing mass times $`\log2`$.
Combining the squared likelihood-ratio and activation estimates gives


```math
\mathbb E\mathop{\mathrm{JS}}(q_0,q_1)
 \le\frac1n\left[
 \log2+
 \frac{1+e}{128\eta^2(1-2^{-1/2})}
 \right].
```


I recomputed the constant: the common-support factors are
$`64/(128^2\eta^2)`$, $`16(1+e)`$, and $`1/8`$, whose product
is $`(1+e)/(128\eta^2)`$. The remaining series is
$`\sum_j2^{-j/2}`$.

Independent selector-bit entropy tensorization gives


```math
I(O;S\mid T)
 \le\sum_i I(O;S_i\mid T,S_{-i}).
```


After averaging over the iid pool and other selector bits, each term
is the adjacent-sample Jensen–Shannon divergence just bounded.
Unused pool records do not enter either learner law. Multiplying by
the number of selector bits yields the candidate's absolute constant
$`C_I`$. This is an iid-averaged bound. The proof does not claim a
constant bound for every deterministic pool, which would require a
different argument.

## 6. Accuracy, atoms, and output class

The expected child-minimum increase is at most $`\sigma_j`$, and
these increases telescope to the terminal loss minus the root
minimum. Summing the scales gives $`128\sqrt n/\eta`$ on every
fixed distinct-feature dataset, without a label-distribution
assumption.

I independently proved the complete
[random-tag rounding transfer](reviewed-sources.json).
For arbitrary atoms, the signed bridge satisfies
$`\mathbb E\max_g\sup_u|E_g(u)|\le4\sqrt n`$, and the
output-only endpoint rule gives the total empirical excess bound


```math
\left(\frac{256}{\eta}+8\right)\sqrt n.
```


The strict tag comparison at a canonical cut, infinity, the canonical
all-one cut, and the null event of tag collisions are covered in that
transfer. Adjoining all independent ghost tags and using the chain
rule transfers the augmented CMI bound to the original classifier
without increasing its constant. It does not rely on a false general
claim that conditioning decreases mutual information.

The learner and information proof use only finite order comparisons,
labels, counts, and canonical identifiers. They therefore apply
directly to lexicographically ordered tagged records. No global
order embedding of $`\mathbb R\times(0,1)`$ into $`\mathbb R`$
is required.

The final output is closed or open at the returned real feature,
or is identically zero. The open output is permitted only because
the claimed target is the improper version. All postprocessing uses
the virtual output alone, so the information comparison is valid.

## 7. Review disposition

The pinned written argument proves the claimed uniform mathematical
statement, subject to the usual measurable randomized-algorithm
interpretation stated in the note. I found no mathematical correction
to request. A separate primary-literature and current-status review
is still necessary before any new-resolution or payable-bounty claim.
The proper threshold target, efficient-implementation bonus, general
VC conjecture, and stronger fixed-pool information statement are not
certified by this review.

The exact original drafts named by review hashes are preserved in [reviewed-sources.json](reviewed-sources.json). The consolidated [proof](PROOF.md) combines the checked construction and properization.
