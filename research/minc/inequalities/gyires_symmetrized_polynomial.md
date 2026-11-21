# The symmetrized row polynomial does not supply stability

Research checkpoint, 20 November 2026 (America/Chicago). This is an exact obstruction to a sufficient proof method for Gyires's inequality. It does not refute the inequality or increase the completed-conjecture count.

## Why the polynomial is relevant

For a real matrix A, let p_A(x) be the product of its row linear forms. For homogeneous polynomials, use the Fischer inner product

```math
\langle f,g\rangle_F=\sum_\alpha\alpha! f_\alpha g_\alpha.
```

Expansion of the row products gives the permanent Cauchy–Binet identity

```math
\langle p_A,p_B\rangle_F=\mathop{\mathrm{per}}(AB^{\mathsf T}).
```

Consequently, for q_A=p_A+p_{A^{\mathsf T}},

```math
\|q_A\|_F^2=
\mathop{\mathrm{per}}(AA^{\mathsf T})+
\mathop{\mathrm{per}}(A^{\mathsf T}A)+
2\mathop{\mathrm{per}}(A^2),
\qquad
[x_1\cdots x_n]q_A=2\mathop{\mathrm{per}}A.
```

Thus the original [Gyires inequality](https://yair-lavi.com/mincs-list/conjecture-20/index.html) is exactly

```math
([x_1\cdots x_n]q_A)^2\ge d_n\|q_A\|_F^2,
\qquad d_n=\frac{n!}{n^n}.
```

When A is doubly stochastic, q_A/2 has value one and every first partial derivative equal to one at the all-ones vector. It therefore has the balance conditions of the proposed stable-polynomial norm inequality discussed in [the polarization note](gyires_polarization.md). That norm inequality is itself unproved. The polynomial q_A need not be stable or Lorentzian, so stability does not justify applying such a theorem directly to q_A. This does not rule out the stable-polynomial approach through the two summands: a valid norm theorem for p_A and p_{A^T} would give both stronger Gram inequalities, and the triangle inequality would then give the original weak Gyires inequality. The obstruction here concerns only the proposed closure under this particular sum.

## Exact counterexample to the closure claim

Take the doubly stochastic matrix

```math
A=\begin{pmatrix}
0&1&0&0\\
1/3&0&1/3&1/3\\
1/3&0&1/3&1/3\\
1/3&0&1/3&1/3
\end{pmatrix}.
```

The two products of linear forms specialize to

```math
p_A(t,y,y,y)=\frac{y(t+2y)^3}{27},
\qquad
p_{A^{\mathsf T}}(t,y,y,y)=ty^3.
```

Hence

```math
G(t,y):=27q_A(t,y,y,y)
=t^3y+6t^2y^2+39ty^3+8y^4.
```

At y=1, the derivative of this real cubic is

```math
\frac{d}{dt}G(t,1)=3(t+2)^2+27>0.
```

It has exactly one real zero and two nonreal conjugate zeros. Real specialization of a real stable polynomial is stable or zero, and a nonzero real univariate stable polynomial has only real zeros. This proves that q_A is not real stable.

The same example is not Lorentzian. Nonnegative linear substitutions and partial derivatives preserve Lorentzian polynomials. But

```math
\partial_t\partial_yG=3t^2+24ty+117y^2,
\qquad
\nabla^2(\partial_t\partial_yG)
=\begin{pmatrix}6&24\\24&234\end{pmatrix}.
```

This Hessian has positive trace and determinant 828, so both eigenvalues are positive. That contradicts the required quadratic signature. The closure properties are Theorem 2.10 and Corollary 2.11 of P. Brändén and J. Huh, [Lorentzian polynomials](https://arxiv.org/pdf/1902.03719), Annals of Mathematics 192 (2020), 821–891.

The obstruction also occurs for strictly positive doubly stochastic matrices. Replace A by (1-epsilon)A+epsilon J_4, where J_4 has entries 1/4. As epsilon decreases to zero, the specialized polynomial coefficients and the displayed differentiated Hessian vary continuously. The two nonreal zeros persist for all sufficiently small positive epsilon, as does the positive-definite quadratic Hessian. Thus excluding boundary matrices does not repair either closure claim.

## The original inequality is satisfied at the witness

Direct expansion gives

```math
\mathop{\mathrm{per}}A=\frac29,
\qquad
\mathop{\mathrm{per}}(AA^{\mathsf T})=
\mathop{\mathrm{per}}(A^{\mathsf T}A)=\frac29,
\qquad
\mathop{\mathrm{per}}(A^2)=\frac8{81}.
```

The Gyires ratio is therefore

```math
\frac{4(\mathop{\mathrm{per}}A)^2}
{\mathop{\mathrm{per}}(AA^{\mathsf T})+
\mathop{\mathrm{per}}(A^{\mathsf T}A)+2\mathop{\mathrm{per}}(A^2)}
=\frac4{13}>\frac3{32}=d_4.
```

The [exact checker](gyires_symmetrized_polynomial.py) verifies the polynomial identities, norm identity, signature and ratio. No statement about the conjecture follows merely from checking this witness. The unresolved question is the central-coefficient inequality on the actual symmetrized row-polynomial class, without assuming stability or Lorentzianity.

The inequalities worker independently checked both product formulas, the cubic derivative and the positive-definite quadratic Hessian. The root's exact checker passed, including the Fischer norm identity and all four permanent values. This is an internal check of the obstruction, not an external review or a full Gyires result.
