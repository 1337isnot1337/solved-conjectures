# Gyires's stronger Gram inequality: an interior reduction

Research theorem, 20 November 2026 (America/Chicago). The argument below is complete, but it does not resolve Gyires's conjecture or its stronger Gram form. Boundary minima remain uncontrolled.

Put `d_n=n!/n^n`. A sufficient inequality for the inequality clause of Minc Conjecture 20 is

\[
\frac{\operatorname{per}(A)^2}{\operatorname{per}(AA^T)}\ge d_n
\qquad (A\in\Omega_n).
\]

The exact original statement and current status are at https://yair-lavi.com/mincs-list/conjecture-20/index.html . The result here concerns the displayed stronger ratio, not the original symmetrized denominator directly.

To see the sufficiency precisely, use the Fischer polynomials defined below. The original denominator is

\[
\operatorname{per}(AA^T)+\operatorname{per}(A^TA)+2\operatorname{per}(A^2)
=\|q_A+q_{A^T}\|_F^2,
\]

because `\langle q_A,q_{A^T}\rangle_F=\operatorname{per}(A^2)`. The proposed Gram bound for both `A` and `A^T`, followed by the triangle inequality, bounds this squared norm by `4 per(A)^2/d_n`. An equality characterization requires separate equality control; the structural theorem below does not supply it.

## Theorem

Define

\[
R(A)=\frac{\operatorname{per}(A)^2}{\operatorname{per}(AA^T)}.
\]

At any local minimum of `R` on the doubly stochastic polytope, two rows with the same support must be equal. In particular, every local minimum in the interior of the polytope is the uniform matrix `J_n/n` (here `J_n` denotes the all-ones matrix).

Consequently, if the stronger Gram inequality fails in any order, its minimum in that order is attained on the boundary. At a minimizing boundary matrix, each class of rows with identical supports consists of identical rows.

## Fischer-space formulation

For the rows of `A`, write

\[
\ell_i(x)=\sum_j a_{ij}x_j,
\qquad q_A(x)=\prod_{i=1}^n\ell_i(x).
\]

On homogeneous polynomials use the real Fischer inner product

\[
\langle x^\alpha,x^\beta\rangle_F
=\begin{cases}\alpha!,&\alpha=\beta,\\0,&\alpha\ne\beta.\end{cases}
\]

Let `L(q)=[x_1...x_n]q`. Direct expansion gives

\[
L(q_A)=\operatorname{per}A=:c>0,
\qquad \|q_A\|_F^2=\operatorname{per}(AA^T)=:N>0.
\]

The first strict inequality follows because a doubly stochastic matrix has a supported permutation; all coefficients are nonnegative. The second also follows directly since `q_A(1)=1`.

## Two-row mixing and curvature

Fix rows `i,j` with identical support. For real `t` near zero, replace them by

\[
(1-t)a_i+t a_j,
\qquad t a_i+(1-t)a_j.
\]

Because their positive supports coincide, this operation stays nonnegative for both signs of sufficiently small `t`. It preserves all row and column sums. Set

\[
s=t(1-t),\qquad
h=(\ell_i-\ell_j)^2\prod_{r\ne i,j}\ell_r.
\]

Then exactly

\[
q_{A_t}=q_A+s h.
\]

The map `t -> s` has derivative one at zero, so `s` also ranges through a two-sided interval about zero. Write

\[
d=L(h),\qquad b=\langle q_A,h\rangle_F,\qquad H=\|h\|_F^2.
\]

Along this feasible curve,

\[
R(s)=\frac{(c+s d)^2}{N+2s b+s^2 H}.
\]

If `A` is a local minimum, the first derivative vanishes. Since `c>0`, this gives

\[
dN=cb.
\]

Substituting this identity into the second derivative yields

\[
R''(0)=\frac{2c^2(b^2-NH)}{N^3}\le0.
\]

Cauchy--Schwarz gives the inequality. At a local minimum the second derivative is also nonnegative, so equality must hold in Cauchy--Schwarz. Hence `h` is a real scalar multiple of `q_A`.

But every row sums to one, and therefore

\[
h(1,\ldots,1)=0,
\qquad q_A(1,\ldots,1)=1.
\]

The scalar multiple is zero. Polynomial rings over the reals have no zero divisors, and none of the row linear forms is zero. Thus `h=0` forces `ell_i=ell_j`, proving that the rows are equal.

For an interior local minimum every pair of rows has the same full support. All rows are equal, and the column sums then force every entry to be `1/n`.

## Compactness and the exact unresolved boundary issue

The ratio is continuous on the compact doubly stochastic polytope, since the denominator is positive. It therefore attains a minimum. The uniform matrix has ratio `d_n`; if a smaller value exists, every global minimizer lies on the boundary by the theorem.

The proof cannot de-average rows with different supports. If one row has a positive entry where the other has zero, negative mixing parameters create a negative matrix entry. Only a one-sided curve is then feasible, and a nonnegative first derivative is compatible with a boundary minimum. Treating this one-sided condition as stationarity would be a gap.

This is also why the theorem does not complete an induction on the number of zeros. Sparse fully indecomposable support patterns can have distinct row supports; the theorem does not decompose such a matrix into smaller blocks. For an actual block diagonal matrix `A=B direct_sum C`, the ratio factors as `R(B)R(C)`, and `d_r d_s>=d_(r+s)`, but arbitrary boundary supports need not have this form.

## A related coefficient warning

The multinomial formulation of the stronger inequality is still a useful full-domain target. If `p_alpha=[x^alpha]q_A` and `pi_alpha=d_n/alpha!`, the desired statement is

\[
\sum_\alpha\pi_\alpha\left(\frac{p_\alpha}{\pi_\alpha}\right)^2
\le\left(\frac{p_{(1,\ldots,1)}}{d_n}\right)^2.
\]

It cannot be justified by ordinary concavity of the logarithm of the normalized coefficient array. For `A=(I+P_4)/2`, with `P_4` a four-cycle permutation, `alpha! p_alpha=1/4` at both `alpha=(2,0,2,0)` and `(0,2,0,2)`, but it is `1/8` at their midpoint `(1,1,1,1)`. Real stability supplies exchange and differential inequalities; it does not supply the stronger midpoint concavity needed by that shortcut.

The derivative calculation was independently reviewed by the parent agent. This structural reduction is not entered as a solved conjecture.
