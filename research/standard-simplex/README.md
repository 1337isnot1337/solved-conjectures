# Standard Simplex conjecture

Research checkpoint, 21 November 2026. Coordination: [issue 212](https://github.com/1337isnot1337/solved-conjectures/issues/212).

**Status: unresolved in this work.** The source screen has not found a full prior resolution. The accompanying calculation identifies a limit of an auxiliary-coordinate second-variation approach; it is not a conjecture resolution or a claimed new theorem of independent significance.

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

The public `mxym/math` archive also contains an all-cell equal-mass first-moment theorem, [Equal Gaussian cells: the sharp simplex first-moment theorem](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md). Its full written proof was read for scope. It combines the Gaussian multi-bubble perimeter theorem with a covariance deformation and a radial differential inequality. It explicitly stops at the first moment and does not claim finite-correlation optimality. This is an unrefereed public research manuscript; it has not been imported as an independently accepted premise here.

## Attack considered and actual progress

The initial question was whether an optimizer's stability after adjoining independent Gaussian coordinates forces additional shape conditions. The exact calculation in [TENSORIZATION_BARRIER.md](TENSORIZATION_BARRIER.md) gives, for an auxiliary Hermite mode of degree $`d`$,

```math
Q_{\rho,d}(f)=\rho^d B_\rho(f)+L_\rho(f).
```

For positive correlation, $`B_\rho\ge0`$, so every degree $`d\ge2`$ gives a weaker maximum-stability test than degree one. For negative correlation and the original unrestricted-volume minimization, every $`\rho^d`$ lies between $`\rho`$ and $`1`$, so degrees zero and one already imply all the remaining tests. Volume constraints, admissibility of normal fields, and approximation of unbounded Hermite polynomials are treated in the note.

This closes one attempted inference. It does not derive hyperstability, classify the degree-one form, prove local optimality of the simplex, or compare arbitrary competing partitions.

The next substantive question is a classification or sharp comparison in the base variables. A simple spherical rearrangement is inadequate for four or more cells: the primary 2026 source explains that spherical balls are not the triangular faces of a tetrahedral partition, and separate spherical optimization can discard the measure constraints. A semigroup interpolation based only on translated regular-simplex profiles also needs care because the unequal-mass extension is already false.

### Follow-up under investigation

Heilman's [2014 paper](https://arxiv.org/pdf/1211.7138v2), Section 8, identifies quantitative stability for the balanced first-moment extremum as an input needed to extend its small-positive-correlation method beyond three cells. The public `mxym/math` proof supplies a nonnegative covariance-deficit integral. We are checking whether it yields a uniform quadratic covariance gap and then a Gaussian assignment-margin bound for arbitrary near-maximizing partitions. We have not completed a new stability theorem or the extension of the noise-stability argument. Even a completed small-correlation theorem would remain partial progress toward the original target.

## Source and archive record

[PRIOR_AUDIT.md](PRIOR_AUDIT.md) records the direct source comparisons, issue search, pinned archive screen, and remaining gaps. [PRIOR_SCAN.json](PRIOR_SCAN.json) records the exact native-text search coverage; [scan_native_prior.py](scan_native_prior.py) performs that screen on separately downloaded public archives.

No result index was changed. No Lean verification was attempted. This directory is a research checkpoint only.
