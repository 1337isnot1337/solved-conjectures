# Failure of an adjugate-style first-derivative flow

Status: an exact counterexample to one concrete polynomial-size potential construction, independently reviewed and reproduced by the weighted-protocol worker. It does not exclude arbitrary Boolean potentials. The modular rank certificate is checked by the companion script `verify_gradient_flow.py`; no numerical rank computation is used.

## 1. The attempted construction

For a numerical matrix `X`, write

```math
L_r(b)=\sum_jX_{rj}b_j,\qquad
P(b)=\prod_{r=1}^mL_r(b),\qquad
P_{\widehat r}(b)=\prod_{k\ne r}L_k(b),
\qquad\chi(b)=\prod_j(2b_j-1).
```

All row-deleted products have small circuits. They are also the first derivatives of `P` with respect to its linear factors. If `X` is invertible, they span exactly the same space as the ordinary partial derivatives of `P`:

```math
\partial_{b_j}P=\sum_rX_{rj}P_{\widehat r}.
```

This suggests a discrete counterpart of a gradient or adjugate-based vector field. Allow the full ansatz

```math
Q_i(b)=\chi(b)\left[
\sum_{r=1}^m
\bigl(a_{ir}(1-b_i)+d_{ir}b_i\bigr)P_{\widehat r}(b)
+c_i\delta_0(b)\right].                         \tag{1}
```

All `2m^2+m` coefficients are arbitrary complex scalars. They may depend in any manner on the numerical matrix and its true permanent. Thus the test below does not merely reject one proposed formula for those coefficients. It allows every possible coefficient choice in this first-derivative ansatz.

The affine weights in the flipped coordinate are included. Setting `a_ir=d_ir` would give a narrower constant-coefficient gradient ansatz. The anchor term `c_i delta_0` gives additional freedom at the origin and its neighboring vertices.

## 2. The exact linear system

Because `chi(T_i b)=-chi(b)`, division by `chi(b)` on the Boolean cube turns the desired divergence equation into

```math
P(b)-(-1)^m y\delta_0(b)
=\sum_{i,r}\left[
a_{ir}P_{\widehat r}(b|_{b_i=0})
+d_{ir}P_{\widehat r}(b|_{b_i=1})\right]
+\sum_i c_i\bigl(\delta_0(b)+\delta_0(T_i b)\bigr).
                                                               \tag{2}
```

For example, the two evaluations of
`(a(1-b_i)+d b_i)P_hat_r(b)` add to
`a P_hat_r|_(b_i=0)+d P_hat_r|_(b_i=1)` at either Boolean value of `b_i`. Thus (2) is precisely the condition for (1), with no relaxation or additional constraint.

For a fixed numerical matrix and `y`, it is a linear system in `2m^2+m` unknowns, with one equation for each Boolean point.

## 3. A seven-by-seven counterexample

Take

```math
X=\begin{pmatrix}
4&6&4&6&2&6&4\\
6&1&3&3&5&6&4\\
4&3&1&4&5&4&1\\
3&6&4&5&5&4&6\\
2&2&3&3&4&5&2\\
6&3&5&5&5&2&4\\
2&4&5&4&4&1&1
\end{pmatrix}.
```

Exact permutation sums give

```math
\det X=-9352,\qquad\mathop{\mathrm{per}}_7(X)=53592404.
```

Use the true value `y=53592404`. Equation (2) has `2*7^2+7=105` unknown coefficients. Form its integer coefficient matrix with columns ordered as follows:

1. for `i=0,...,6` and then `r=0,...,6`, the `a_ir` column followed by the `d_ir` column;
2. the seven `c_i` columns;
3. as an extra final column, the right-hand target `P(b)+y delta_0(b)`.

Order Boolean rows lexicographically, so the bit tuple is the seven-digit binary expansion of its row number, with the leftmost bit most significant. Retain the first 106 rows, numbered 0 through 105. The resulting augmented square matrix has determinant

```math
64147\pmod{1000003}.
```

The modulus is prime and this residue is nonzero. Hence this 106-by-106 integer determinant is nonzero over `C`. The augmented matrix has rank at least 106, whereas the 105-column coefficient matrix has rank at most 105. The system is inconsistent over `C`.

Thus no coefficients in (1) give a valid Boolean-potential certificate for this true numerical permanent instance. The matrix is invertible, so replacing the row-deleted products by arbitrary linear combinations of ordinary first derivatives, including coefficients obtained from an inverse or adjugate of `X`, does not avoid the counterexample.

## 4. Verification and scope

The companion script computes the permanent and determinant by exact permutation sums. It constructs the augmented matrix directly from the displayed Boolean evaluations and computes the square minor by modular Gaussian elimination. It checks primality by trial division, so the calculation has no external mathematical software dependency. The observed output is recorded in the script's assertions.

This is a finite, reproducible algebraic counterexample to the complete ansatz (1). It does not lower-bound potentials with nonlinear coefficients in `b`, higher mixed derivatives, a different circuit structure, or general instance-dependent arithmetic circuits. In particular, it does not refute the polynomial-size hypothesis in `BOOLEAN_POTENTIALS.md`.

The later critical-incidence argument refutes that all-instance polynomial-size hypothesis separately, conditional on the reviewed transfer lemma and imported permanent border lower bound. The finite counterexample here remains an unconditional failure of the specific attempted construction.

The attempted construction was chosen because all its basis polynomials have small shared circuits and first-derivative/adjugate methods often supply compact continuous identities. The obstruction here is exact: even allowing arbitrary numerical coefficient choices and affine dependence on the flipped coordinate leaves the Boolean residual outside their span.
