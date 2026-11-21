# Standard Simplex conjecture

Research checkpoint, 21 November 2026. Coordination: [issue 212](https://github.com/1337isnot1337/solved-conjectures/issues/212).

**Status: unresolved in this work.** The current checkpoint contains two proposed partial theorems. For every fixed number of cells, the regular-simplex partition uniquely maximizes balanced Gaussian noise stability at every sufficiently small positive correlation, and uniquely minimizes it among arbitrary-mass partitions at every sufficiently small negative correlation. Both thresholds are independent of the ambient dimension. Three mathematical reviews found no gap in each written assembly and its explicit first-moment dependency. Separate bounded positive and negative prior-work audits found no earlier theorem with the respective all-cell scopes in the inspected sources; they do not establish worldwide priority or external acceptance. The remaining correlation ranges are outside these results. No full-resolution count is added.

The directory also contains quantitative first-moment stability with a sharp exponent, the exact tail and noise comparisons used in the partial theorem, and a limit of an auxiliary-coordinate second-variation approach.

## Exact original target

The target is Isaksson–Mossel, *Maximally Stable Gaussian Partitions with Discrete Applications*, [arXiv:0903.3362v3](https://arxiv.org/pdf/0903.3362v3), Definition 1.3 and Conjecture 1.4, printed page 2; published in *Israel Journal of Mathematics* 189 (2012), 347–396, [DOI 10.1007/s11856-011-0181-7](https://doi.org/10.1007/s11856-011-0181-7).

Let $`3\le q\le n+1`$, let $`X,Y\in\mathbb R^n`$ be jointly standard Gaussian with $`\mathbb E[XY^T]=\rho I_n`$, and let $`\mathcal A=(A_1,\ldots,A_q)`$ be a measurable partition. Set

```math
S_\rho(\mathcal A)=\sum_{i=1}^q
 \mathbb P\{X\in A_i,\ Y\in A_i\}.
```

For unit regular-simplex vertices $`u_1,\ldots,u_q`$ with $`u_i\cdot u_j=-1/(q-1)`$ when $`i\ne j`$, define

```math
C_i=\{x:u_i\cdot x\ge u_j\cdot x\text{ for every }j\}.
```

Gaussian-null ties can be assigned arbitrarily. The full conjecture is the following pair of assertions.

| Correlation | Allowed competing partitions | Assertion |
|---|---|---|
| $`0\le\rho\le1`$ | $`\gamma_n(A_i)=1/q`$ for every cell | $`S_\rho(\mathcal A)\le S_\rho(\mathcal C)`$ |
| $`-1\le\rho<0`$ | Arbitrary cell masses | $`S_\rho(\mathcal A)\ge S_\rho(\mathcal C)`$ |

The absence of a volume restriction in the negative-correlation clause is part of the original statement. The target includes every cell count, every permitted ambient dimension, and the full correlation interval. A proof for one cell count, one correlation interval, or an added regularity or hyperstability hypothesis would not settle it. A counterexample to either universal clause would refute the conjunction.

## Why this is a substantial target

The original paper connects the Gaussian optimization to the Plurality is Stablest conjecture through invariance principles. It also gives consequences for approximation of MAX-$`q`$-CUT under the Unique Games Conjecture. The problem has been studied since the 2000s, with separate work on dimension reduction, small correlations, variational classification, and hardness of approximation. The 2026 three-cell theorem below still leaves the all-cell, all-correlation problem open. These are direct connections and a sustained research record, rather than a significance claim based only on the conjecture's name.

## Primary results and scope distinctions

| Source read | What the source supplies | What remains outside it |
|---|---|---|
| Heilman–Tarter, [Three candidate plurality is stablest for small correlations](https://doi.org/10.1017/fms.2021.56), 2021 | Dimension reduction for positive-noise optimizers and a three-cell small-correlation theorem | Classification at arbitrary correlation and arbitrary cell count |
| Heilman, [Hyperstable Sets with Voting and Algorithmic Hardness Applications](https://arxiv.org/pdf/2209.11216v1), 2022 | Variational formulas, negative-correlation dimension reduction, and conditional classification for three and four cells | Hyperstability is an extra hypothesis, not an established consequence of ordinary optimality |
| Heilman, [Three Candidate Plurality is Stablest for Correlations at Most 1/10](https://www.stevenheilman.org/~heilman/papers/corthreev3.pdf), Theorem 1.5 | Three-cell positive range $`0<\rho\le0.1082`$ and negative range $`-0.0234\le\rho<0`$ | Superseded ranges are not the current research frontier |
| Heilman, [Sharp Hardness for MAX-3-CUT and Quantum MAX-CUT](https://arxiv.org/pdf/2608.00333v1), Theorems 7.1 and A.1 | Three cells for $`-1/2\le\rho<0`$ with unrestricted masses, and $`0<\rho\le2/5`$ with equal masses | Section 1.4 explicitly leaves the remaining correlations and four or more cells unresolved |
| Heilman–Mossel–Neeman, [Standard Simplices and Pluralities are Not the Most Noise Stable](https://arxiv.org/pdf/1403.0885v3), Theorem 2.6 | Counterexamples to a prescribed **unequal-mass** extension | Does not refute the original balanced positive clause or free-mass negative minimum |
| Heilman, [On the Propeller Conjecture](https://arxiv.org/abs/2610.32158) | An unrestricted first-Gaussian-moment inequality | First moments are only one Hermite level of finite-correlation noise stability |

The 2026 hardness manuscript was obtained and read directly. Its abstract's resolution of specific hardness conjectures does not mean that the full Standard Simplex conjecture is resolved. We use the explicitly quantified Gaussian theorems and its future-work section.

The public `mxym/math` archive also contains an all-cell equal-mass first-moment theorem, [Equal Gaussian cells: the sharp simplex first-moment theorem](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md). Its full written argument was read and checked. It combines the published Gaussian multi-bubble perimeter theorem with a covariance deformation and a radial differential inequality. It explicitly stops at the first moment and does not claim finite-correlation optimality. This is an unrefereed public research manuscript. Its extremum and covariance identities are explicitly credited inputs to the deductions below; our checks are not a claim of external acceptance or of authorship of those prior results.

## Attack considered and actual progress

The initial question was whether an optimizer's stability after adjoining independent Gaussian coordinates forces additional shape conditions. The exact calculation in [TENSORIZATION_BARRIER.md](TENSORIZATION_BARRIER.md) gives, for an auxiliary Hermite mode of degree $`d`$,

```math
Q_{\rho,d}(f)=\rho^d B_\rho(f)+L_\rho(f).
```

For positive correlation, $`B_\rho\ge0`$, so every degree $`d\ge2`$ gives a weaker maximum-stability test than degree one. For negative correlation and the original unrestricted-volume minimization, every $`\rho^d`$ lies between $`\rho`$ and $`1`$, so degrees zero and one already imply all the remaining tests. Volume constraints, admissibility of normal fields, and approximation of unbounded Hermite polynomials are treated in the note.

This closes one attempted inference. It does not derive hyperstability, classify the degree-one form, prove local optimality of the simplex, or compare arbitrary competing partitions.

The next substantive question is a classification or sharp comparison in the base variables. A simple spherical rearrangement is inadequate for four or more cells: the primary 2026 source explains that spherical balls are not the triangular faces of a tetrahedral partition, and separate spherical optimization can discard the measure constraints. A semigroup interpolation based only on translated regular-simplex profiles also needs care because the unequal-mass extension is already false.

### Quantitative first-moment deduction

Heilman's [2014 paper](https://arxiv.org/pdf/1211.7138v2), Section 8, identifies quantitative stability for the balanced first-moment extremum as an input needed to extend its small-positive-correlation method beyond three cells. The public `mxym/math` proof supplies a nonnegative covariance-deficit integral. The completed argument in [FIRST_MOMENT_STABILITY.md](FIRST_MOMENT_STABILITY.md) derives a uniform quadratic covariance gap and a Gaussian assignment-margin estimate. For every fixed $`q\ge3`$, it gives a finite constant $`K_q`$ such that

```math
\inf_{\mathcal C}\sum_i\gamma_d(A_i\mathbin{\triangle}C_i)
\le K_q\left[F_q-\sum_i\left|\int_{A_i}x\,d\gamma_d\right|^2\right]^{1/2},
```

where $`F_q=(\mathbb E\max_{i\le q}Z_i)^2/(q-1)`$ is the **prior** exact maximum, the infimum is over central regular-simplex partitions, and $`d\ge q-1`$ is arbitrary. The source's first-moment extremum and covariance identities remain explicitly credited. A mirrored exchange of two small strips on one facet shows that the power one half cannot be increased.

The Hermite expansion then localizes any balanced partition whose positive-correlation noise value is within $`\eta`$ below the simplex benchmark to symmetric-difference distance at most

```math
K_q\sqrt{\rho(1-1/q)+\eta/\rho}.
```

This localization alone does not compare the noise values exactly at a fixed positive correlation. In particular, the first-moment deficit alone does not justify replacing the full objective by its degree-one part. The separate comparison estimates below supply the additional control in a low-correlation interval.

[The root review](ROOT_STABILITY_REVIEW.md), [the combinatorics review](FIRST_MOMENT_COMBINATORICS_REVIEW.md) and [the algebra review](FIRST_MOMENT_ALGEBRA_REVIEW.md) check the complete deduction, the ambient-dimension and singular-covariance cases, localization and sharpness. [STABILITY_PRIOR_AUDIT.md](STABILITY_PRIOR_AUDIT.md) records the bounded quantitative prior comparison and its remaining gaps. This is research progress only; no result-table entry or resolution count is added.

### Low positive correlation

The complete assembly is [SMALL_CORRELATION.md](SMALL_CORRELATION.md). For every fixed $`q\ge3`$, it constructs a positive constant $`\rho_q`$ such that

```math
S_\rho(\mathcal A)\le S_\rho(\mathcal C)
\qquad\text{for every }d\ge q-1,
\quad0<\rho\le\rho_q,
\quad\gamma_d(A_i)=1/q.
```

Equality forces a central regular-simplex partition, up to orthogonal transformations, relabeling, and null sets. The proof gives an existence threshold depending only on the number of cells, not a numerical correlation range.

Three ingredients control the terms that the first-moment localization leaves open:

- [NOISE_COMPARISON.md](NOISE_COMPARISON.md) gives a dimension-free weighted bound on all Hermite degrees at least two, a uniform one-sided simplex-potential bound, and the exact noise comparison identity.
- [TAIL_CONTROL.md](TAIL_CONTROL.md) bounds squared tail mass and moment errors by a small coefficient times truncated transfer cost. Conditioning onto the aligned moment subspace is used only for costs and moments; the higher-Hermite estimate remains in the original ambient space.
- [CORE_COERCIVITY.md](CORE_COERCIVITY.md) controls a core fractional partition despite its small mass imbalance and rotation error. Those errors enter quadratically and are absorbed by the tail potential.

The constants are chosen in the order: moment coercivity, tail radius, then correlation. The final inequality has strictly negative coefficients on both the core transfer cost and the tail transfer cost. It applies to arbitrary measurable competitors and does not require a pre-existing optimizer or smooth cell boundaries.

[The root review](SMALL_CORRELATION_ROOT_REVIEW.md), [the algebra review](NOISE_CORE_ALGEBRA_REVIEW.md), and [the combinatorics review](SMALL_CORRELATION_COMBINATORICS_REVIEW.md) check the complete proof. A [separate tail review](TAIL_CONTROL_COMBINATORICS_REVIEW.md) checks the cutoff argument in detail. Root authored the core coercivity and part of the potential argument; the algebra and combinatorics reviews independently check those portions.

[LOW_CORRELATION_PRIOR_AUDIT.md](LOW_CORRELATION_PRIOR_AUDIT.md) records the completed bounded exact-scope comparison. The expanded six-archive pass covers 292,845 native UTF-8 bodies, 1,871 converted PDFs, and bounded compressed text, with an independent AIM/OpenAI supplement and a broader native-term residual. The [semantic comparison](LOW_CORRELATION_ARCHIVE_SCOPE.md), compact manifests, source hashes, and explicit decoding limits accompany the scripts. The unrefereed partial theorem remains distinct from a full resolution of Standard Simplex.

### Sharp quantitative noise stability

[NOISE_STABILITY.md](NOISE_STABILITY.md) extracts a quantitative corollary after decreasing the same positive threshold. There are constants $`\widehat\rho_q,\nu_q>0`$, depending only on the number of cells, such that every balanced measurable partition in every allowed ambient dimension satisfies

```math
S_\rho(\mathcal C)-S_\rho(\mathcal A)
\ge\nu_q\rho\left[
\inf_{\mathcal D\in\mathscr S_{q,d}}
\sum_i\gamma_d(A_i\mathbin{\triangle}D_i)
\right]^2
\qquad(0<\rho\le\widehat\rho_q).
```

The proof divides competitors into large and small noise deficits. The small-deficit branch enters the same polar-aligned core neighborhood as the earlier theorem. Its weighted transfer bound then controls the partition distance by a union of Gaussian facet slabs. A balanced exchange of reflected strips shows that the squared-distance power is sharp, with noise deficit of order $`\rho t^2`$ and partition distance of order $`t`$, uniformly over this correlation interval and the ambient dimension.

The [combinatorics review](NOISE_STABILITY_COMBINATORICS_REVIEW.md) and [root review](NOISE_STABILITY_ROOT_REVIEW.md) check the global dichotomy, constants, alignment, and sharpness. This is a corollary within the same partial research program. It does not add a resolved conjecture or extend the proof to all correlations.

### Low negative correlation

[NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md) proves a corresponding proposed partial theorem with the original unrestricted-mass quantifier. For every fixed number of cells there is a positive threshold, independent of ambient dimension, on which the central regular simplex uniquely minimizes negative-correlation noise stability among all measurable partitions, including those with empty cells.

Three new estimates address the negative sign and the unrestricted masses:

- [WEIGHTED_NOISE.md](WEIGHTED_NOISE.md) controls the absolute higher-Hermite remainder by a transfer cost weighted with a Gaussian factor on the score space. It keeps all unused ambient coordinates in the original noise quadratic form.
- [NEGATIVE_POTENTIAL_TAIL.md](NEGATIVE_POTENTIAL_TAIL.md) gives a matching global winner-probability gap, its sharp first-order compact-core limit, and a weighted tail mass/moment estimate.
- [NEGATIVE_LOCALIZATION.md](NEGATIVE_LOCALIZATION.md) balances an arbitrary partition fractionally and shows that any competitor no worse than the regular benchmark has mass imbalance of order the correlation magnitude and lies in the same polar-aligned moment neighborhood.

The exact noise identity retains a positive degree-zero mass term. After core coercivity and tail restoration, the comparison bounds the deficit below by half the squared mass imbalance plus strictly positive multiples of the core and weighted tail transfer costs. Vanishing costs recover the regular partition almost everywhere. No optimizer-existence or smooth-boundary hypothesis is used.

The [root](NEGATIVE_ROOT_REVIEW.md), [algebra](NEGATIVE_ASSEMBLY_ALGEBRA_REVIEW.md), and [combinatorics](NEGATIVE_CORRELATION_COMBINATORICS_REVIEW.md) reviews check the complete assembly. The [analysis component review](NEGATIVE_COMPONENTS_ANALYSIS_REVIEW.md), separate [weighted-noise review](WEIGHTED_NOISE_COMBINATORICS_REVIEW.md), and [algebra](NEGATIVE_LOCALIZATION_ALGEBRA_REVIEW.md)/[combinatorics](NEGATIVE_LOCALIZATION_COMBINATORICS_REVIEW.md) localization reviews make the authorship and independent checking boundary explicit.

The [negative-specific source audit](NEGATIVE_PRIOR_AUDIT.md) and [independent archive comparison](NEGATIVE_ARCHIVE_COMPARISON.md) credit the older unrestricted three-cell theorem and the prior balanced first-moment input. The latter comparison rereads 22 archive bodies and four primary texts with exact scopes and hashes. It retains the earlier archive decoding limits. This remains a small-correlation partial theorem and adds no resolved conjecture.

## Source and archive record

[PRIOR_AUDIT.md](PRIOR_AUDIT.md) records the direct source comparisons, issue search, pinned archive screen, and remaining gaps. [PRIOR_SCAN.json](PRIOR_SCAN.json) records the exact native-text search coverage; [scan_native_prior.py](scan_native_prior.py) performs that screen on separately downloaded public archives.

No result index was changed. No Lean verification was attempted. This directory is a research checkpoint only.
