# The self-Gram occupation polynomial is not stable or Lorentzian

Date: 20 November 2026 (America/Chicago).

This is a proof-method obstruction for Gyires's stronger Gram inequality. It is not a counterexample to Gyires, a new order of that conjecture, or a claim of historical novelty.

For a doubly stochastic matrix $`A`$, define

```math
F_A(x)=\mathop{\mathrm{per}}(A\mathop{\mathrm{diag}}(x)A^{\mathsf T}).
```

Then $`F_A(\mathbf1)=\mathop{\mathrm{per}}(AA^{\mathsf T})`$, and
$`[x_1\cdots x_n]F_A=(\mathop{\mathrm{per}}A)^2`$. Thus a suitable coefficient theorem for $`F_A`$ would be relevant to the stronger Gram form of Gyires. The two-step polynomial with distinct matrices was already known to be unstable in the campaign notes. The special choice of the same matrix on both sides does not fix the problem.

Take

```math
A=\frac12
\begin{pmatrix}
1&1&0&0
\\ 0&1&1&0
\\ 0&0&1&1
\\ 1&0&0&1
\end{pmatrix}
=\frac12(I_4+P_4).
```

Exact expansion gives

```math
F_A(t,y,y,y)=\frac{y^2}{128}(5t^2+8ty+5y^2).
\tag{1}
```

In particular,

```math
F_A(t,1,1,1)=\frac{5t^2+8t+5}{128},
```

whose discriminant is $`-36`$. Real specialization preserves real stability, allowing the zero polynomial, so this nonzero univariate specialization proves that $`F_A`$ is not real stable.

The homogeneous collapse in (1) also excludes Lorentzianity. Nonnegative linear substitutions preserve homogeneous Lorentzian polynomials. If $`F_A`$ were Lorentzian, the same would hold for $`G(t,y)=128F_A(t,y,y,y)`$, and every quadratic derivative of $`G`$ would have a Hessian with at most one positive eigenvalue. But

```math
\partial_y^2G=10t^2+48ty+60y^2,\qquad
\nabla^2(\partial_y^2G)=
\begin{pmatrix}20&48\\48&120\end{pmatrix}.
```

This symmetric matrix has positive trace and determinant $`96>0`$, so both eigenvalues are positive. Hence $`F_A`$ is not Lorentzian.

The desired scalar inequality nevertheless holds strictly:

```math
\mathop{\mathrm{per}}A=\frac18,\qquad
F_A(\mathbf1)=\frac9{64},\qquad
(\mathop{\mathrm{per}}A)^2-\frac{4!}{4^4}F_A(\mathbf1)
=\frac5{2048}>0.
```

Thus only the proposed stability and Lorentzianity mechanism is refuted. A proof of Gyires would need another property of the occupation polynomial or a direct comparison with its central coefficient.

The companion script gyires_self_gram_obstruction.py verifies (1), the central coefficient, the two permanents, the discriminant, and the Hessian determinant using exact symbolic arithmetic. The primary target and its current open status are recorded on [Lavi's Conjecture 20 page](https://yair-lavi.com/mincs-list/conjecture-20/index.html). The polynomial calculation above is self-contained.

## Closure property used

The nonnegative-substitution and differentiation properties used above are Theorem 2.10 and Corollary 2.11 of P. Brändén and J. Huh, [Lorentzian polynomials](https://arxiv.org/pdf/1902.03719), Annals of Mathematics 192 (2020), 821–891. The quadratic signature condition is part of the definition. These are classical inputs to the obstruction, not new assertions of this note.
