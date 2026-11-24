# Feldheim–Feldheim’s weighted tail conjecture

## Scope review

The terminal theorem is the original Conjecture 1 for every real weight strictly between zero and one and arbitrary independent nonnegative real random variables whose laws have no compact almost-sure support. It retains different laws, atoms and singular laws. Its conclusion is the literal extended-nonnegative-real infinite limsup of the actual probability ratio. The denominator is positive at every finite threshold, by the proved upper-tail/noncompact-support bridge; the division convention does not introduce artificial infinities.

The stronger intermediate law theorem needs only unboundedness above. The final theorem derives that hypothesis from nonnegativity and absence of compact almost-sure support. Compact support is represented by existence of an actual compact set containing the variable almost surely, and its equivalence with an almost-sure upper bound is proved. Independence is converted to the actual product of the pushforward laws; the weighted-tail event and both marginal tails are transferred by measure-map identities.

This review covers the thirteen modules whose hashes are in ROOT_REVIEW.json. The reviewer authored the four Windows modules and three Stieltjes modules, so those seven are explicitly excluded from this review's independence claim. Their separate agent reviews and verification receipts must be bound before publication.

## Argument review

The argument is the one recorded in results/feldheim-weighted-tail/PROOF.md at commit 2f800fa5191a1d747f126fa20f7e9c2b3730b085. The named proposers are Naomi Dvora Feldheim and Ohad Noy Feldheim, Conjecture 1 in section 1.1 of Mean and Minimum of Independent Random Variables, arXiv:1609.03004v3. Cinna Davis recorded the repository proof. The existing qualification about worldwide priority must remain. Numbering from older versions must not be silently substituted for the cited v3 numbering.

An eventual bound on the actual ratio gives the rectangle inequality for the two negative log tails. Adding the two orientations gives a fixed-weight approximate Wright inequality for their sum. The unit-interval proof first bounds the integral of a nonnegative endpoint-zero deviation, then its interior and boundary values. The component argument chooses actual nearest zeros around a positive deviation and rescales that interval; it does not assume the deviation is globally nonnegative.

The formalization handles jumps by forward averages. Monotonicity supplies integrability and the pointwise sandwich; right continuity supplies the pointwise limit. The same averaging preserves the fixed-weight Wright error. Passing the chord estimate to the limit therefore includes atoms, rather than silently imposing continuity of the laws.

The convex approximation is an actual supremum of affine minorants. The supporting slope is constructed from a nonempty bounded set of left slopes, and the chord inequality bounds every left slope by every right slope. This proves the required minorant through the value minus the chord error. The subsequent supremum is proved convex and bounded between the original function and that function minus a fixed constant; an envelope or stability theorem is not assumed.

The proved Windows theorem then supplies near-affine windows with arbitrarily large rise beyond any threshold. The rectangle inequality bounds each centered marginal's oscillation. On the weighted slice the combined defect stays bounded while one marginal increment grows at least min(t,1-t) times the window rise minus a fixed constant. This factor is strictly positive for every retained weight.

Fubini identifies the literal product-measure weighted-tail probability with the conditional survival integral. All integrands are shown measurable and integrable. The slice lower bound uses the actual law, not a density. The final reduction exposes the log-tail integral inequality only as an intermediate parameter, then the terminal module discharges it with the separately proved atom-safe Stieltjes theorem. The final endpoints contain no stability, convex-envelope, window, density, inverse-level, or Stieltjes hypothesis.

The contradiction chooses a sufficiently large natural window-rise parameter using the positive exponential factor and positive min(t,1-t). It therefore exceeds any proposed eventual ratio bound, at arbitrarily large thresholds. A separate order/filter lemma converts this into the stated infinite limsup.

## Publication limits

The higher-dimensional norm statement and finite-threshold supplements are excluded. One existing entry may contribute one completed result after the complete twenty-module closure passes strict builds, the all-owned/private transitive axiom audit, stock-kernel replay, and final source binding. At this review snapshot these full-closure checks remain pending. No completed-result count is authorized by this review alone.

## Final source binding

The final twenty-source freeze was checked against both the working files and the copied verification sources. The five changed modules (Average, Analysis, Probability, Reduction, Limits) were reread. Their changes resolve order-lemma elaboration, explicit set arguments, deprecated names, and a boundedness auto-parameter; their definitions and theorem statements are unchanged. The original theorem file is byte-identical to the reviewed endpoint. The thirteen reviewed module hashes and full frozen-manifest hash are recorded in ROOT_REVIEW.json. The integrated strict build, axiom audit and kernel replay remain separate pending checks.
