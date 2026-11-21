# Coordinator review of the learning-information checkpoint

Date: 21 November 2026. This review concerns the exact auxiliary statements in the three linked notes. It does not certify a solution of either paid target.

## The target and measurable scope

The [general target note](vc-information-complexity-target.md) preserves the quantifiers of Conjecture 6 in the primary COLT paper: one distribution-independent learner must have the information bound for every iid distribution and the empirical-error bound on every individual dataset. The original information concerns the whole hypothesis. The known proper-realizable impossibility theorem has a stronger error requirement and does not refute this agnostic statement. The November 2026 manuscript read here concerns evaluated information in the realizable setting and expressly leaves original CMI open.

The auxiliary canonical-selection arguments are restricted to a finite or countable measurable class with a fixed enumeration, unless a coherent measurable selection is separately supplied. This avoids silently claiming a measurable well-order for an arbitrary class.

## Uniform trace sampler and its limitation

Every representative selected on a subsample is also first in its full-pool trace class. Uniform sampling over distinct traces therefore has relative entropy log(M/N) against the uniform full-pool representatives, where M and N are the respective trace counts. The induced one-inclusion graph has at most d times its vertex count edges; deleting one coordinate merges exactly the pairs in that coordinate's matching. The logarithmic deletion estimate and exchangeability telescope to the stated 2d log 2 bound. Labels do not affect this sampler.

The sampler has no general empirical accuracy guarantee. Its low information alone is not a solution.

## Trace Gibbs bound

I independently checked the full [trace-Gibbs proof](trace-gibbs-cmi-lemma.md), in addition to the [separate agent review](INDEPENDENT_REVIEW.md). No correction was required.

A representative lost by replacing one observation has a full trace joined to its new representative by an edge in the removed coordinate. That coordinate's edge set is a matching. The layer-cake argument applies the VC edge bound to every weight superlevel set. Full trace weights on the endpoints of a unit edge have ratio exp(η), because their binary losses differ by one. Adding one observation creates at most two refinements per trace and gives Z_T ≤ 2Z_0, in the direction used by the proof.

The exchangeability step is valid because both the representative selection and total loss are invariant under permutations of the sample. It controls expected missing-support mass, not a worst-fixed-pool bound.

On the common support, the log-density tilt has range at most 2η. The variance bound for its log partition gives the stated directed KL bound. Both output laws can be decomposed with the same mixture weight equal to the smaller common-support mass. Revealing an independent mixture flag therefore charges at most log 2 on the residual branch, with no extra binary-entropy term. Conditional independence of selector bits then gives the stated tensorization inequality.

These steps establish exactly the bound displayed in the lemma. At η=λ/√n it is bounded independently of n for fixed λ and d.

## Exact accuracy failure

In the target note's one fixed VC-dimension-one point-function class, take M=ceil(exp(λm)), repeat each of M zero-labeled points r=Mm² times, and let n=M²m². The zero trace has weight one, and each of the M other traces has weight exp(−λm). Their total probability is at least one half. Each has error 1/M, so expected excess is at least 1/(2M)=m/(2√n).

This disproves a uniform order-1/√n empirical-error guarantee for this specific fixed-temperature learner. It does not refute the existence of a different learner. The information and accuracy calculations concern the same temperature and class, so the limitation cannot be removed by treating them as statements about different algorithms.

## Threshold facts

The [threshold note](agnostic-threshold-cmi-route.md) restricts outputs to observed feature values and infinity. A fixed full pool distinguishes all such threshold functions by their prediction vectors, including repeated features. Loss vectors and predictions determine each other given the pool's labels. Original and evaluated CMI are consequently equal for these canonical outputs.

For independently flipped labels, the centered prefix-loss errors are a martingale. The comparison of the perturbed and original minimizing cuts, followed by Doob's L2 inequality, gives the stated empirical excess 8√(p(1−p))/((1−2p)√n). At p=1/4 this is 4√3/√n. Only cuts between complete equal-feature groups are allowed; bounding by the maximum over all indexed prefixes is a valid upper bound. No information estimate follows from this accuracy proof.

The fixed-tree information lemma is also valid: the logistic log-partition Hessian is at most one quarter, yielding a one-eighth squared-logit bound. The path KL chain rule retains the adaptive visited-node expectation, and the child-minimum increments telescope to terminal empirical loss. Its tree and terminal hypotheses must be common to the compared datasets. No data-dependent quantile tree, arbitrary-atom distribution, or complete infinite threshold construction has been supplied by that lemma.

## Randomized near-minimum reduction

The [near-minimum note](threshold-near-minimum-information-gap.md) defines the actual private-band learner and retains complete equal-feature groups. Its empirical excess is at most 2/√n on every dataset. I checked its three information reductions independently.

First, a candidate threshold lost under one replacement must be the feature of that replaced observation and must occur uniquely in its sample. Exchangeability bounds its expected output mass by 1/n. The common-weight mixture argument therefore charges at most 2 log 2 in the full selector tensorization. Eligibility changes at common candidate values remain in the unbounded common-law term; they have not been hidden in this support estimate. The displayed loss difference has exactly the claimed two-step form.

Second, after independent proof-only tags distinguish equal-feature entries, the original pairing conditional on the sorted pool is uniform. Its selected set is a uniform n-subset. The learner is independent of that pairing conditional on the selected entries. The chain-rule identity subtracting I(W;M|ω) is consequently valid and has the stated sign. Adding the independent tags leaves the original CMI unchanged, and the learner still cannot cut inside an equal-feature group.

Third, the displayed finite mutual-information sum is exactly the information of that randomized band learner under uniform subsampling. A universal constant bound for it would be sufficient for the paid proper-threshold target. The note correctly states that it is unproved, and that failure for one fixed pool would not refute the original iid-averaged conjecture.

## Outcome

The auxiliary information bounds, the exact accuracy counterfamily, the canonical-threshold equality, the noisy-label accuracy estimate, and the fixed-tree conditional estimate pass this review. The constant-information accurate learner is still missing. No full proof, disproof, Lean verification, prize submission, or qualifying bounty completion follows.
