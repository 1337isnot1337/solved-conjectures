# Lean formalization: complete fixed-hyperplane theorem

The original statements in [PROOF.md](PROOF.md) are formally verified in
the exact dependency closure of
[LonelinessHyperplaneMain](../../lean/Conjectures/LonelinessHyperplaneMain.lean).
The development proves the actual probability and counting statements from
their definitions. It assumes no orbit-density, finite-subspace-cover,
rational-fan, Ehrhart, or counting formula as an extra premise.

## Normal, sample and maximum

The coordinate type is finite. `PrimitiveNormal m` means that the gcd of the
absolute coordinates of the integer normal is one; nonzeroness and integer
Bézout coefficients are proved from that condition. `RealAdmissible m`
means that the real kernel contains a vector with every coordinate positive
and with pairwise distinct coordinates.

For box size `N`, the sample consists of labelled functions into `Fin N`.
Adding one to each coordinate gives precisely the ordered integer vectors
in `[1,N]^k`. The sample is filtered by the exact integer relation and
coordinate injectivity. Every admissible velocity is counted once. No
primitive-velocity restriction is imposed.

`torusVelocityValue` is the actual supremum over circle time, and the
development proves that this supremum is attained. The equivalent real-lift
maximum is attained on `[0,1]`. The containing-torus profile is

\[
L_m(s)=\frac12-
 \frac{\|m\cdot((1/2,\ldots,1/2)-s)\|_{\mathbb R/\mathbb Z}}
      {\sum_i|m_i|}.
\]

The exact hyperplane maximum has an explicit attaining point. Every
orthogonal integer velocity satisfies `L(v,s) ≤ L_m(s)` at every shift.
The normal may have zero coordinates for these statements and for the main
probability theorem.

## Checked original conclusions

| Conclusion | Lean endpoint |
| --- | --- |
| Exact shifted hyperplane maximum and attainment | `shifted_hyperplane_maximum`, `shifted_hyperplane_attainment` |
| Upper bound for every orthogonal integer velocity | `orthogonal_velocity_value_le` |
| Uniform inverse-box-size probability estimate over all shifts | `exists_torus_uniform_probability_rate` |
| Eventual nonempty samples and a vanishing failure probability | `exists_uniform_probability_rate`, `uniformFailureProbability_tendsto_zero` |
| Fixed-shift limiting distribution at the exact profile | `fixedShift_torus_cdf_tendsto` |
| Uniform Haar distribution of the profile | `haar_predictedValue_isUniform` |
| Independent Haar-shift limiting distribution for the actual sampled maximum | `independentShiftLaw_cdf_tendsto_uniform` |
| Exact finite proper-rational-subspace description of every fixed subthreshold event | `RealSubspace.hyperplane_closed_sublevel_finite_union` |
| Exact denominator quasipolynomial | `positiveBoxAdmissible_quasipolynomial` |
| Exact numerator quasipolynomial of degree at most `k−2` for every positive box size | `positiveBoxBelow_progression_polynomials` |
| Exact unshifted endpoint frequency for full-support normals | `endpointFrequency_tendsto` |
| Sharp inverse-box-size example on `v₁+v₂=v₃` | `sharp_uniform_failure_probability_two_sided` |

These names are in `Loneliness.Hyperplane`, except for the displayed
`RealSubspace` subnamespace.

For each positive tolerance, the probability-rate theorem supplies constants
and a threshold beyond which the sample is nonempty and the probability of
an error at least that tolerance, with a supremum over all shifts, is at most
`K/N`. The finite probability definitions are totalized when a small box
has no sample. Eventual nonemptiness is proved and suffices for all limiting
statements.

The fixed-shift and independent-shift limits are expressed as convergence
of cumulative distribution functions. The independent-shift law is the
actual average of the Haar pushforward law for each sampled velocity; its
limit is uniform on `[1/2−1/(2A), 1/2]`, with `A=∑|mᵢ|`.
The proof establishes the link from the sampled maxima to that law.

For fixed `s` and `u<L_m(s)`, the numerator counts the literal event
`L(v,s)≤u`. Its residue-class polynomials agree with that count for every
`N≥1` and have degree at most `k−2`. The denominator has an exact
quasipolynomial of degree at most `k−1`, including `N=0`.

For the endpoint formula only, the shift is zero and every normal
coordinate is nonzero. Set `Q=2` if `A` is even and `Q=A` otherwise.
The verified limit is

\[
\lim_{N\to\infty}\Pr(L(v,0)=L_m(0))
 =
 \frac{\varphi(Q)}
 {Q^{k-1}\prod_{p\mid Q}(1-p^{-(k-1)})}.
\]

The theorem includes `k=2`. The residue argument proves the canonical
point's order and primitivity, the exact hit criterion, the original-box
residue frequencies and the required summable tails. The numerical
`1/4` endpoint example is an instance of this general formula at the
normal `(1,1,−1)`. The sharpness development separately proves the profile
`1/3`, the exact value `1/4` for every positive multiple of `(1,2,3)`,
the attaining time `1/(4g)`, and matching inverse-box-size bounds.

## Exact verification evidence

[Run 44531509741 / job 135585736594](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44531509741/job/135585736594)
checked source commit `ee1f018fef258cdd54f73af31cdaf6485fd151cb` with Lean 4.35.0 and Mathlib
`56a005855ea17e0b0958f73ec801ae140b0a1679`.

All 72 project modules were freshly compiled with warnings treated as errors
and no linter override. The audit checked every owned declaration, including
raw serialized private declarations: 1,403 declarations, 1,149
theorems and 44 private declarations. All 106 required endpoints
were checked to have theorem kind. Only `propext`, `Classical.choice`
and `Quot.sound` were allowed as transitive axioms.

Every one of the 72 modules then passed a fresh process of the unchanged
pinned stock checker as an exact singleton target. The receipt binds the
source bytes, all emitted proof-object facets, compiler/checker binaries,
verification helpers, commands, logs and declaration inventory. The
preservation process authenticated the actual original archive bytes and
every recorded evidence file; it ran no new Lean proof check.

- [Unchanged raw receipt](../../docs/verification/hyperplane-main-exact-44531509741/receipt.json), SHA-256 `1c0d6a6fbe2ea16bbcfa88808ec8d83f0e412217e76c03803780ff0737fa1c15`.
- [Preservation record](../../docs/verification/hyperplane-main-exact-44531509741/preservation.json).
- Original artifact `14535236819`, ZIP SHA-256 `27d65f3b5d667260dfad8d639f6d1182a3b5e54c032a2e2954d7764e060fe638`.
- [Earlier strict/theorem-audit receipt](../../docs/verification/hyperplane-main-original-44525844153/receipt.json), retained with its original scope.

The checked closure is registered in the accepted root, required endpoint
audit and replay list. The repository-wide accepted-package check is a
separate gate; this component receipt does not claim a new pass of that
larger package.
