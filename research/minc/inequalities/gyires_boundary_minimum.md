# A strict boundary local minimum of the Gyires Gram ratio

Research note, 20 November 2026 (America/Chicago). This is an exact obstruction to a proposed proof strategy. The order-three Gyires inequality is already known. Nothing here is claimed as a new case or a resolution of an open conjecture.

Let

```math
R(A)=\frac{\mathop{\mathrm{per}}(A)^2}{\mathop{\mathrm{per}}(AA^T)},\qquad
U=\frac12\begin{pmatrix}0&1&1\\1&0&1\\1&1&0\end{pmatrix}.
```

Then `U` is a strict local minimum of `R` on the full doubly stochastic polytope `Omega_3`, although

```math
R(U)=\frac14>\frac29=d_3.
```

Its support is fully indecomposable and its three row supports are distinct. Thus the interior reduction cannot be completed by excluding all fully indecomposable boundary local minima. A proof of the full inequality still needs a quantitative bound on the values of possible boundary minima.

## Ambient first derivative

Write `c(A)=per(A)` and `N(A)=per(AA^T)`. Direct calculation gives

```math
c(U)=N(U)=\frac14,\qquad
\nabla c(U)=\frac14J_3,
```

and

```math
\frac{\partial N}{\partial a_{ij}}(U)
=\begin{cases}3/8,&i=j,\\1/2,&i\ne j.\end{cases}
```

Therefore the ambient gradient of `R` is exactly

```math
\nabla R(U)=\frac18I_3,
\qquad DR(U)[D]=\frac18\mathop{\mathrm{tr}}D. \tag{1}
```

For a feasible perturbation of `U`, every diagonal entry of `D` is nonnegative, so (1) is nonnegative. It is positive for every direction that opens a diagonal entry.

## The boundary face

The tangent space of the zero-diagonal doubly stochastic face is one-dimensional. Put

```math
K=\begin{pmatrix}0&1&-1\\-1&0&1\\1&-1&0\end{pmatrix},
\qquad A(u)=U+uK.
```

The feasible range on that face is `|u|<=1/2`. Exact expansions are

```math
\mathop{\mathrm{per}}A(u)=\frac14+3u^2,
```

```math
\mathop{\mathrm{per}}(A(u)A(u)^T)
=\frac14+\frac34u^2+6u^4+12u^6.
```

Consequently,

```math
R(A(u))=\frac14+\frac{21}{4}u^2+O(u^4). \tag{2}
```

One can also see the positive face increment without a series:

```math
\mathop{\mathrm{per}}A(u)^2
-\frac14\mathop{\mathrm{per}}(A(u)A(u)^T)
=\frac3{16}u^2(7+40u^2-16u^4).
```

The last factor is positive on `|u|<=1/2`.

## Coupled face and inward perturbations

First derivatives along rays alone would not establish a strict local minimum. The mixed perturbations can be controlled explicitly.

Let `D` have zero row and column sums, and let `d_i=D_ii>=0`. Set `epsilon=d_1+d_2+d_3`. Define a symmetric zero-margin matrix `Z(d)` by

```math
Z_{ii}=d_i,\qquad
Z_{ij}=\frac{d_k-d_i-d_j}{2}
\quad(\{i,j,k\}=\{1,2,3\}).
```

Then `D-Z(d)` has zero diagonal and zero margins, and hence equals `uK` for a unique real `u`. Moreover,

```math
\|Z(d)\|_F\le\sqrt{5/2}\,\epsilon. \tag{3}
```

The function `R` is analytic on a neighborhood of `U`, since its denominator is positive there. Taylor expansion in `Z`, uniformly for small `u`, gives

```math
\begin{aligned}
R(U+uK+Z)-R(U)
&=R(U+uK)-R(U)+DR(U)[Z]\\
&\quad+O(|u|\|Z\|_F+\|Z\|_F^2)\\
&=\frac18\epsilon+\frac{21}{4}u^2
+O(u^4+|u|\epsilon+\epsilon^2),
\end{aligned}
```

using (1)-(3). Shrinking the neighborhood makes the absolute value of the error at most `epsilon/16+(21/8)u^2`. Hence every sufficiently small feasible perturbation satisfies

```math
R(U+D)-R(U)\ge\frac1{16}\epsilon+\frac{21}{8}u^2.
```

Equality on the right requires `epsilon=u=0`. Nonnegativity of the `d_i` then gives `d=0`, so `Z=0` and `D=0`. This proves strict local minimality on the full polytope.

## Radial ratio monotonicity also fails here

With `J_3` now denoting the all-ones matrix, let

```math
B(t)=J_3/3+t(U-J_3/3),\qquad 0\le t\le1.
```

The exact radial polynomials are

```math
\frac{\mathop{\mathrm{per}}B(t)}{d_3}
=1+\frac38t^2-\frac14t^3,
\qquad
\frac{\mathop{\mathrm{per}}(B(t)B(t)^T)}{d_3}
=1+\frac3{32}t^4+\frac1{32}t^6.
```

Thus `d R(B(t))/dt` at `t=1` equals `-1/8`. The ordinary permanent is nondecreasing on this segment, with derivative zero at the endpoint, but the Gram ratio decreases near the endpoint. No Holens-Djokovic counterexample is needed for this separate obstruction.

The ambient gradient, face polynomials, series coefficient, and radial derivative are checked by exact SymPy arithmetic in `gyires_boundary_certificates.py`. The local-minimum proof itself is the analytic argument above, not a numerical search.

The original conjecture and its known order-three scope are at [Minc Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html). The all-order interior theorem is in [gyires_interior_reduction.md](gyires_interior_reduction.md).
