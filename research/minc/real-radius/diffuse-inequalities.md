# Lih–Wang convexity inequality and Gyires’s ratio inequality

The [signed permanent asymptotic](diffuse-limit.md) has consequences for
two further entries of Minc's list. Let $A_n=J_n+B_n$ be doubly stochastic.
Assume the nuclear norms of $B_n$ stay bounded, their operator norms stay
below a fixed $\rho<1$, and their largest Euclidean row and column norms
tend to zero. Then, for all sufficiently large orders in this sequence,

1. If $A_n\ne J_n$, the radial permanent
   $t\mapsto\operatorname{per}(J_n+tB_n)$ is strictly convex on $[0,1]$.
   Thus the entire open chord lies strictly above the curve.
2. If $A_n\ne J_n$, each of the two self-Gram inequalities
   $(\operatorname{per} A_n)^2>d_n\operatorname{per}(A_n A_n^T)$ and
   $(\operatorname{per} A_n)^2>d_n\operatorname{per}(A_n^T A_n)$
   holds. These imply the strict inequality in Gyires's conjecture.

At $J_n$ the conjectured inequalities are equalities. The corresponding
[entry for Lih–Wang](https://yair-lavi.com/mincs-list/conjecture-34/index.html)
only requires the half-chord nearest $J_n$. The
[entry for Gyires](https://yair-lavi.com/mincs-list/conjecture-20/index.html)
combines the two self-Gram terms with $2\operatorname{per}(A_n^2)$.
These eventual conclusions leave both unrestricted conjectures open.

## Derivatives and the chord

Write $p_n(t)=\operatorname{per}(J_n+tB_n)/d_n$ and
$D_n(t)=\det(I-t^2B_n^TB_n)^{-1/2}$, using the analytic branch at zero.
The coefficient estimates in the signed permanent proof give more than
the value at $t=1$. For every $1<R<1/\rho$, the coefficientwise
differences tend to zero in each fixed degree, while their tails on
$|t|\le R$ tend uniformly to zero as the degree cutoff tends to infinity.
Indeed one may use the bound there with any $R'$ between $R$ and $1/\rho$;
the geometric factor $(R/R')^k$ absorbs the square-root prefactor.
Consequently $p_n-D_n$ tends uniformly to zero on $|t|\le R$. Cauchy's
derivative estimate gives
$\sup_{0\le t\le1}|p_n''(t)-D_n''(t)|=o(1)$.

Each factor $(1-t^2s_i^2)^{-1/2}$ in $D_n$ has nonnegative even
coefficients. The coefficient of $t^2$ in their product is
$\|B_n\|_F^2/2$, hence $D_n''(t)\ge\|B_n\|_F^2$ on $[0,1]$.
For $\|B_n\|_F>1/1000$ this gives strict convexity eventually.
The [local Hessian theorem](../nov20-independent/inequalities/uniform_radial_permanent.md)
covers all smaller positive norms on the entire segment.

## The Gram comparison

Let $B=B_n$ and $s_i$ be its singular values. The centered matrices
$BB^T$ and $B^TB$ meet the same hypotheses: their singular values are
$s_i^2$, their nuclear norms are at most $\rho\sum s_i$, and each of
their Euclidean row norms is at most $\rho$ times the corresponding
row norm of $B$ or $B^T$. Column norms agree with row norms by symmetry.
Since $A_n A_n^T=J_n+BB^T$, the signed permanent asymptotic gives

~~~math
\frac{(\operatorname{per}A_n)^2}{d_n\operatorname{per}(A_nA_n^T)}
=\prod_i\sqrt{\frac{1+s_i^2}{1-s_i^2}}+o(1)
\ge \exp(\|B\|_F^2)+o(1).
~~~

The quotient step is valid because all determinant terms are at least
one and uniformly bounded above by bounded nuclear norm and the fixed
operator-norm gap. Transposition covers the other self-Gram inequality.
This gives eventual strictness whenever the Frobenius norm exceeds a
fixed positive threshold.

For completeness take $0<r=\|B\|_F\le10^{-5}$. The local theorem gives
$\operatorname{per}(A_n)/d_n\ge1+r^2/32$. For any centered $H$,
the [centered coefficient theorem](../nov20-independent/sign/centered_permanental_coefficients.md)
gives $|\sigma_k(H)|\le 2\,(200\|H\|_F)^k$. Also
$n^k(n-k)!/n!\le e^k$: the geometric mean of the largest $k$ factors of
$n!$ is at least $(n!)^{1/n}\ge n/e$. For $H=BB^T$ or $B^TB$ we have
$\|H\|_F\le r^2$ and $\sigma_1(H)=0$. Summing the geometric series
from degree two gives
$\operatorname{per}(J_n+H)/d_n\le1+4(200e)^2r^4<1+r^2/16$.
This proves both self-Gram inequalities throughout the omitted small
norm range.

Finally Cauchy–Schwarz in the complex Gaussian moment model gives
$\operatorname{per}(A_n^2)\le
\sqrt{\operatorname{per}(A_nA_n^T)\operatorname{per}(A_n^TA_n)}$.
Indeed one pairs the product of the row linear forms in a standard
circular Gaussian with the conjugated product for the columns. The two
strict self-Gram inequalities therefore give Gyires's four-term bound.

This argument applies McCullagh's determinant model in the signed
bounded-nuclear-norm regime proved in the linked note. The
corresponding implications where earlier hypotheses already supply
the necessary asymptotic controls are attributable to that prior work.
