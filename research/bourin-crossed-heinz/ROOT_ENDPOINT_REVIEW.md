# Root review of the endpoint extension

Date: 21 November 2026. Files reviewed: `ENDPOINT.md` and
`SINGULAR_ENDPOINT.md`. The root worker supplied the positive-definite
resolvent argument; this is therefore an independent check of the singular
extension and its assembly, not an independent authorship claim for that
ingredient.

Verdict: the fixed-pair endpoint statements pass. The singular endpoint is
handled by its actual interior limit, not by assigning a discontinuous value
at zero. The proof gives no interval uniform over matrix pairs and does not
resolve Bourin's conjecture. No priority claim is made.

## Prior theorem checked

I opened the [current primary record](https://arxiv.org/abs/2611.22363)
and read Theorem 1.1 and its proof in the
[five-page v2 manuscript](https://arxiv.cnoctave.top/pdf/2611.22363).
Tian and Xu prove the operator-norm inequality for every finite order,
positive semidefinite pair, and interior parameter. Their proof normalizes
the sum to have norm two, uses scalar tangent bounds for the power sums,
and decomposes the crossed sum into a product of two contractions plus a
third contraction. This is sufficient for the complementary-block step.
It does not supply the missing general Ky Fan inequality.

## The limit and equality subspaces

On the active space, $`S=A+B>0`$. With support projections $`P_A,P_B`$,
the interior limit is

```math
L=P_AB+P_BA=(P_A+P_B-I)S=JS.
```

The identity follows by expanding the product and using $`P_AA=A`$ and
$`P_BB=B`$. Since $`-I\leq J\leq I`$,

```math
L^*L=SJ^2S\leq S^2,\qquad |L|\leq S.
```

If the top-$`k`$ sums are equal, every maximizing spectral projection
$`P`$ of $`|L|`$ also maximizes for $`S`$: both inequalities in
$`\mathop{\mathrm{tr}}(P|L|)\leq\mathop{\mathrm{tr}}(PS)\leq N_k(S)`$
must be equalities. The positive difference $`S-|L|`$ annihilates $`P`$.
Both matrices commute with $`P`$, so squaring on its range is legitimate.
It follows that $`(I-J^2)P=0`$.

The $`-1`$ eigenspace of $`J`$ is the common kernel of $`A,B`$, which has
already been removed. The $`+1`$ eigenspace is their common support
intersection. Thus

```math
P_AP=P_BP=P,\qquad LP=L^*P=SP.
```

This argument applies to every possible projection at a repeated cutoff.
Also, all selected singular values are positive: eigenvalue monotonicity
and equality of their sums force the selected values to equal the
corresponding positive eigenvalues of $`S`$. Unselected zero singular
values therefore cause no derivative problem.

## Regularization and the improper integral

For $`E_0=\log_+A-\log_+B`$ and
$`E_\delta=\log(A+\delta I)-\log(B+\delta I)`$, the finite-dimensional
spectral expansion is

```math
E_\delta=E_0+\log\delta\,(P_B-P_A)+o(1).
```

The logarithmic term has zero trace against $`PD`$, where $`D=A-B`$,
because $`(P_B-P_A)P=0`$ and trace is cyclic. Applying the
positive-definite integral to the regularized pair and shifting its
integration variable gives

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}(PDE_\delta)
=4\int_\delta^\infty
\mathop{\mathrm{tr}}\bigl[PK_v^2(I-K_v^2)^{-1}\bigr]\,dv,
\qquad
K_v=(S+2vI)^{-1/2}D(S+2vI)^{-1/2}.
```

For every $`v>0`$, $`\|K_v\|<1`$ and the integrand is nonnegative.
The trace expansion gives a finite limit on the left. Monotone
convergence therefore proves convergence of the improper integral at
zero. No subtraction of divergent integrals is used.

The positive integrand vanishes exactly when $`K_vP=0`$, equivalently
$`DP=0`$, since $`P`$ commutes with $`S+2vI`$. Hence the limiting trace
is zero exactly when $`DP=0`$.

## Derivative and global equality alternative

The supported matrix powers extend analytically through the interior
limit for this fixed pair. The displayed derivative $`H`$ in the draft
is correct. Using $`P_AP=P_BP=P`$ and cyclicity gives

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}(PH)
=-\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}(PDE_0).
```

On each selected positive singular subspace, $`L`$ is positive and its
left and right singular vectors coincide. The Ky Fan directional
derivative is consequently the maximum of these traces over the full
maximizing family. Compactness supplies a strictly negative derivative
if every such projection has $`DP\ne0`$.

If an attaining projection instead has $`DP=0`$, it reduces both
matrices and $`A=B=S/2`$ on its range. The selected block is fixed for
all parameters. The cited operator-norm theorem bounds the complementary
block by the largest complementary eigenvalue of $`S`$, which cannot
exceed the selected cutoff. Ties do not alter the Ky Fan sum. This proves
global equality in the stated alternative.

If the limit sum is already strictly below $`N_k(S)`$, continuity is
enough. Otherwise the preceding derivative dichotomy applies. Reflection
$`C_{1-t}=C_t^*`$ covers the other endpoint. Taking the minimum over the
finitely many active Ky Fan indices gives one positive neighborhood for
this fixed pair. It does not give a common neighborhood over all pairs.

## Checks and limits

The proof includes zero matrices, a nontrivial common kernel, singular
individual summands, cutoff multiplicities, and the full active-space
trace norm. The value $`\log_+`$ on the kernel is explicitly defined in
the draft and is not the positive part of a logarithm. No finite numerical
screen is needed for these arguments. No Lean work was performed.
