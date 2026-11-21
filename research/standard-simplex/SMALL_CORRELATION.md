# Standard Simplex conjecture: a small positive correlation regime

Proposed partial theorem, 21 November 2026. The proof below combines the credited all-cell balanced first-moment extremum with quantitative covariance coercivity and the new comparison notes in this directory. It concerns a positive interval of correlations next to zero for every fixed number of cells. It does not resolve the Standard Simplex conjecture for all positive correlations, its negative-correlation clause, or the full named conjecture. The [root](SMALL_CORRELATION_ROOT_REVIEW.md), [algebra](NOISE_CORE_ALGEBRA_REVIEW.md), and [combinatorics](SMALL_CORRELATION_COMBINATORICS_REVIEW.md) reviews found no gap in the written argument. The [bounded source audit](LOW_CORRELATION_PRIOR_AUDIT.md) is complete. These checks are not external acceptance or a worldwide-priority claim; no resolution count changes.

## 1. Statement

For a Gaussian partition $`\mathcal A=(A_1,\ldots,A_q)`$, write

```math
S_\rho(\mathcal A)
=\sum_{i=1}^q\langle1_{A_i},T_\rho1_{A_i}\rangle_{L^2(\gamma_d)}.
```

**Proposed partial theorem.** For every integer $`q\ge3`$, there exists $`\rho_q>0`$ such that the following holds in every dimension $`d\ge q-1`$: if $`\mathcal A`$ is any measurable Gaussian partition with $`\gamma_d(A_i)=1/q`$, then

```math
S_\rho(\mathcal A)\le S_\rho(\mathcal C)
\qquad(0<\rho\le\rho_q), \tag{1}
```

where $`\mathcal C`$ is a central regular-simplex partition. Equality holds exactly for central regular-simplex partitions, up to orthogonal transformations, relabeling, and Gaussian null sets.

The constant $`\rho_q`$ depends only on $`q`$, not on $`d`$. No numerical value or useful asymptotic dependence on $`q`$ is asserted.

## 2. Inputs and notation

Put $`r=q-1`$, $`c=c_q`$, $`F_q=c^2`$, and $`\ell=\ell_q=c\sqrt{2/r}`$. The source boundary is explicit:

- [FIRST_MOMENT_STABILITY.md, Sections 2--3](FIRST_MOMENT_STABILITY.md) credits the earlier balanced first-moment extremum and covariance identities, and derives the uniform quadratic covariance deficit.
- [NOISE_COMPARISON.md](NOISE_COMPARISON.md) proves the higher-Hermite estimate, the uniform potential estimate, the global polar-alignment estimate, and the exact noise identity.
- [TAIL_CONTROL.md](TAIL_CONTROL.md) proves the small tail mass/moment estimates and sharp potential convergence on a fixed compact core.
- [CORE_COERCIVITY.md](CORE_COERCIVITY.md) proves local first-moment coercivity with quadratic mass and rotation errors.

Use $`\kappa_{\mathrm g}>0`$ for the global aligned constant in the noise-comparison note, so

```math
D\le\varepsilon/\kappa_{\mathrm g},\qquad
\|M-M_{\mathcal C}\|_F^2=2D-\varepsilon
\le C_{\mathrm g}\varepsilon,
\quad C_{\mathrm g}=2/\kappa_{\mathrm g}-1>0. \tag{2}
```

For the local core lemma, write its constants as $`\delta_0>0`$, $`0<\kappa\le1`$, and $`K<\infty`$. Decreasing its positive $`\kappa`$ to at most one preserves that lemma. Whenever its neighborhood assumptions hold,

```math
\varepsilon_{\mathrm c}\ge\kappa D_{\mathrm c}
-K\left(\|e_{\mathrm c}\|^2+
 \|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2\right). \tag{3}
```

Here $`A_{\mathrm c}`$ is the square moment matrix in the fixed regular coordinates, and $`\varepsilon_{\mathrm c}`$ is allowed to be negative.

The two further constants are

```math
H=144(q-1),\qquad b=2^{2-q}\phi(1)\phi(2)>0.
```

Let $`\eta_q(R)=2(q-1)\eta_r(R)`$, with $`\eta_r`$ from the tail-control note. Thus $`\eta_q(R)\to0`$ and

```math
\|e_{\mathrm t}\|^2+\|M_{\mathrm t}\|_F^2
\le\eta_q(R)W_{\mathrm t}. \tag{4}
```

All these constants depend only on $`q`$.

## 3. Choose constants in a fixed order

First set

```math
\tau=\kappa/8,\qquad
K_*=(1+\tau)K+(1+\tau^{-1}).
```

Choose $`R\ge\sqrt2`$ sufficiently large that

```math
\eta_q(R)\le\min\left(\frac{\delta_0^2}{16},\frac{b}{2K_*}\right). \tag{5}
```

For this fixed $`R`$, compact-core potential convergence supplies a number $`\rho_{\mathrm c}>0`$ such that

```math
L_{\rho,\mathrm c}\ge(1-\kappa/8)\rho D_{\mathrm c}
\qquad(0<\rho\le\rho_{\mathrm c}). \tag{6}
```

Choose

```math
\rho_q=\min\left(
\frac14,\frac{c^2}{2},\frac{\delta_0^2}{16C_{\mathrm g}},
\frac{\kappa\ell}{8H},\frac{b}{2H},\rho_{\mathrm c}
\right)>0. \tag{7}
```

There is no circular dependence: the covariance and local-core constants are fixed first, then the tail radius, then the correlation threshold.

## 4. A competing partition has nearly optimal moments

Fix $`0<\rho\le\rho_q`$. It suffices to consider a partition $`\mathcal A`$ with

```math
S_\rho(\mathcal A)\ge S_\rho(\mathcal C_0), \tag{8}
```

where $`\mathcal C_0`$ is any regular-simplex partition. All regular-simplex partitions have the same noise value by orthogonal invariance.

Let $`M`$ be the moment matrix of $`\mathcal A`$, $`F=\|M\|_F^2`$, and $`\varepsilon=c^2-F\ge0`$. The Gaussian spectral expansion gives

```math
\frac1q+\rho F
\le S_\rho(\mathcal A)
\le\frac1q+\rho F+\rho^2(1-1/q). \tag{9}
```

For the upper bound, the total squared norm of the cell indicators is one, and the sum of their degree-zero squared norms is $`1/q`$. Dropping the further nonnegative degree-one norm only enlarges the remainder bound. Apply the lower bound in (9) to $`\mathcal C_0`$ and the upper bound to $`\mathcal A`$. Assumption (8) implies

```math
0\le\varepsilon\le\rho(1-1/q)\le\rho. \tag{10}
```

In particular, $`F\ge c^2/2>0`$ by (7).

Choose the **same polar-aligned regular partition** $`\mathcal C`$ used in (2), and let $`E`$ be its $`r`$ dimensional score subspace. Extend a partial polar isometry if necessary; the global alignment estimate is valid at singular covariances. Equations (2) and (10) give

```math
\|M-M_{\mathcal C}\|_F\le\sqrt{C_{\mathrm g}\rho}
\le\delta_0/4. \tag{11}
```

This is a statement about this chosen $`\mathcal C`$, not an infimum over unrelated simplex partitions.

## 5. The core satisfies the local coercivity hypotheses

Condition the original cell indicators on $`E`$ to obtain fractional labels $`f_i(z)`$. This preserves their masses and all moments: the original moment row space is contained in $`E`$. It also preserves the absolute transfer costs and the linear potential loss, by the fixed-sign identity in the tail-control note. The original noise value is still evaluated before conditioning.

Replace the conditioned labels by $`\mathcal C`$ outside $`|z|\le R`$, obtaining the core fractional partition. Use $`M_{\mathrm t}`$ and $`e_{\mathrm t}`$ for the discarded moment and mass perturbations. The core moment matrix is $`M_{\mathrm c}=M-M_{\mathrm t}`$ and its mass error is $`e_{\mathrm c}=-e_{\mathrm t}`$.

Since $`W_{\mathrm t}\le1`$, equations (4), (5), and (11) imply

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F
\le\delta_0/4+\sqrt{\eta_q(R)}\le\delta_0/2,
\qquad \|e_{\mathrm c}\|\le\delta_0/4. \tag{12}
```

In fixed regular coordinates, the rectangular-to-square moment map is an isometry on centered rows. Thus (12) implies the local core hypotheses in (3).

The full aligned square moment matrix is symmetric, so its core skew part is the negative of the discarded tail skew part. Hence

```math
\|e_{\mathrm c}\|^2+
\|\mathop{\mathrm{skew}} A_{\mathrm c}\|_F^2
\le\eta_q(R)W_{\mathrm t}. \tag{13}
```

For the core fractional partition, the exact first-moment identity is

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F^2
=2D_{\mathrm c}-\varepsilon_{\mathrm c}.
```

Using (3) and (13),

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F^2
\le(2-\kappa)D_{\mathrm c}+K\eta_q(R)W_{\mathrm t}. \tag{14}
```

Now restore the tail moments. The inequality $`|u+v|^2\le(1+\tau)|u|^2+(1+\tau^{-1})|v|^2`$ and (4), (14) give

```math
\|M-M_{\mathcal C}\|_F^2
\le(1+\tau)(2-\kappa)D_{\mathrm c}
 +K_*\eta_q(R)W_{\mathrm t}.
```

Since $`\tau=\kappa/8`$ and $`0<\kappa\le1`$,

```math
(1+\tau)(2-\kappa)
=2-3\kappa/4-\kappa^2/8\le2-\kappa/2.
```

Consequently,

```math
\|M-M_{\mathcal C}\|_F^2
\le(2-\kappa/2)D_{\mathrm c}+\frac b2W_{\mathrm t}. \tag{15}
```

## 6. Absorb all terms in the exact noise identity

Set $`h_i=1_{A_i}-1_{C_i}`$ in the original ambient space. The exact identity is

```math
S_\rho(\mathcal A)-S_\rho(\mathcal C)
=-2L_\rho+\rho\|M-M_{\mathcal C}\|_F^2
 +\sum_i\langle h_i,R_{\rho,d}h_i\rangle. \tag{16}
```

The core and tail potential bounds give

```math
L_\rho\ge(1-\kappa/8)\rho D_{\mathrm c}
 +b\rho W_{\mathrm t}. \tag{17}
```

The weighted higher-Hermite estimate applies in the original dimension. Because $`W_{\mathrm c}\le D_{\mathrm c}/\ell`$,

```math
\sum_i\langle h_i,R_{\rho,d}h_i\rangle
\le H\rho^2(W_{\mathrm c}+W_{\mathrm t})
\le H\rho^2\left(D_{\mathrm c}/\ell+W_{\mathrm t}\right). \tag{18}
```

Substitute (15), (17), and (18) into (16):

```math
S_\rho(\mathcal A)-S_\rho(\mathcal C)
\le\rho\left[
 \left(-\frac\kappa4+\frac{H\rho}{\ell}\right)D_{\mathrm c}
 +\left(-\frac{3b}{2}+H\rho\right)W_{\mathrm t}
\right].
```

By the last two explicit restrictions on $`\rho`$ in (7),

```math
S_\rho(\mathcal A)-S_\rho(\mathcal C)
\le-\rho\left(\frac\kappa8D_{\mathrm c}+bW_{\mathrm t}\right)\le0. \tag{19}
```

This proves (1). It also shows that any competitor satisfying (8) must have $`D_{\mathrm c}=W_{\mathrm t}=0`$.

Both costs integrate nonnegative transfer mass against strictly positive normal distance off finitely many score-tie hyperplanes. Those hyperplanes are Gaussian null sets. Thus vanishing of both costs implies that all conditioned labels equal the corresponding regular labels almost everywhere. Since the conditioned labels are conditional expectations of indicators and take the values zero or one, the original indicators equal the regular cylindrical indicators almost everywhere as well. This proves the equality statement.

## 7. Scope and dependency boundary

The conclusion is an interval $`0<\rho\le\rho_q`$ for every fixed number of cells and every allowed ambient dimension. It leaves all larger correlations and the negative-correlation clause unresolved. It is not a finite-dimensional numerical check, but it remains a partial theorem toward the original named conjecture.

The mathematical dependency is the credited all-cell balanced first-moment extremum and covariance comparison. The proof does not import an unrestricted-mass first-moment theorem, does not identify conditioned and original noise stability, and does not assume the full Standard Simplex conjecture. The use of unequal masses is confined to the explicit quadratic-error core lemma.

The [completed bounded literature comparison](LOW_CORRELATION_PRIOR_AUDIT.md) distinguishes low correlation $`\rho\downarrow0`$ from small noise $`\rho\uparrow1`$ and inspects prior all-cell consequences of the recent balanced first-moment theorem. Its source limits remain separate from the mathematical proof review. [NOISE_STABILITY.md](NOISE_STABILITY.md) derives the sharp quadratic noise-deficit estimate from this same argument after shrinking the threshold.
