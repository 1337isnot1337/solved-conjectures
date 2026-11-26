# A parameter family from the Hall–Littlewood limit

This note strengthens the exact interior counterexample in `PROOF.md`. It uses the same separating functional and resolves no additional conjecture.

Let $`L`$ be the degree-six functional defined there by

```math
\bigl(L(M_{600}),L(M_{510}),L(M_{420}),L(M_{411}),
L(M_{330}),L(M_{321}),L(M_{222})\bigr)
=(62,28,9,9,2,2,0).
```

The cone certificate in the main proof is independent of the parameters $`q,t`$.

## Exact Hall–Littlewood expansions

The standard Hall–Littlewood specialization is $`P_\lambda(x;0,t)=P_\lambda(x;t)`$. Its symmetrization formula is

```math
P_\lambda(x_1,x_2,x_3;t)
=\frac{1}{v_\lambda(t)}\sum_{w\in S_3}
w\left(x_1^{\lambda_1}x_2^{\lambda_2}x_3^{\lambda_3}
\prod_{i\lt j}\frac{x_i-tx_j}{x_i-x_j}\right),
```

where zero parts are included in the multiplicities $`m_r(\lambda)`$, and

```math
v_\lambda(t)=\prod_{r\ge0}\prod_{j=1}^{m_r(\lambda)}
\frac{1-t^j}{1-t}.
```

These are Macdonald, *Symmetric Functions and Hall Polynomials*, second edition, Chapter III, (2.1), printed page 208, and Chapter VI, (4.14)(ii), printed page 324. The [primary book PDF](https://math.berkeley.edu/~corteel/MATH249/macdonald.pdf) was inspected at these formulas. In particular,
$`v_{420}=1`$ and $`v_{411}=1+t`$.

Put $`\Delta=(x_1-x_2)(x_1-x_3)(x_2-x_3)`$. Multiplying the symmetrization formula by $`v_\lambda(t)\Delta`$ reduces each expansion below to a polynomial identity:

```math
v_\lambda(t)\Delta P_\lambda(x;t)
=\sum_{w\in S_3}\mathop{\mathrm{sgn}}(w)
w\left(x^\lambda\prod_{i\lt j}(x_i-tx_j)\right).
```

Expanding its six terms gives

```math
\begin{aligned}
P_{420}(x;0,t)
={}&m_{420}+(1-t)(m_{411}+m_{330})
 +(1-t)(2-t)m_{321}
\\ &+(1-t)(t^2-t+3)m_{222},
\\ P_{411}(x;0,t)
={}&m_{411}+(1-t)m_{321}+(1-t)^2m_{222}.
\end{aligned}
```

The multiplicities of the relevant monomial orbits are

```math
m_{420}(\mathbf1)=6,\qquad
m_{411}(\mathbf1)=m_{330}(\mathbf1)=3,\qquad
m_{321}(\mathbf1)=6,\qquad m_{222}(\mathbf1)=1.
```

Consequently their values at $`\mathbf1`$ are

```math
A(t)=27-28t+8t^2-t^3,\qquad B(t)=10-8t+t^2.
```

They are positive for $`0\lt t<1`$: both are decreasing on $`[0,1]`$, with $`A(1)=6`$ and $`B(1)=3`$.

## Strict separation on an interval

The displayed expansions and the definition of $`L`$ give

```math
L\left(\frac{P_{420}(x;0,t)}{P_{420}(\mathbf1;0,t)}\right)
=\frac{3(4t^2-23t+37)}{A(t)},
```

and

```math
L\left(\frac{P_{411}(x;0,t)}{P_{411}(\mathbf1;0,t)}\right)
=\frac{3(13-4t)}{B(t)}.
```

Their difference factors exactly as

```math
L\left(\frac{P_{420}(x;0,t)}{P_{420}(\mathbf1;0,t)}
-\frac{P_{411}(x;0,t)}{P_{411}(\mathbf1;0,t)}\right)
=\frac{3(1-t)(10t^2-35t+19)}{A(t)B(t)}.
```

For $`3/4\le t<1`$, the quadratic in the numerator is negative. Its derivative is $`20t-35<0`$ on this interval, and its value at $`t=3/4`$ is $`-13/8`$. Therefore the functional is strictly negative throughout this interval.

The point $`q=0`$ is a boundary point of the conjecture's parameter domain. We use it only to obtain admissible interior counterexamples by continuity. For each fixed $`0\lt t<1`$, the Macdonald coefficients extend continuously to $`q=0`$, with the Hall–Littlewood values above. One can see the regularity directly from the defining Hall inner product: in each fixed degree its power-sum Gram matrix has positive diagonal entries $`z_\rho\prod_i(1-q^{\rho_i})/(1-t^{\rho_i})`$ at $`q=0`$. Gram–Schmidt therefore has positive norm denominators there and produces coefficients continuous in $`q`$. The normalizing values at $`\mathbf1`$ are positive there. Hence, for every $`t\in[3/4,1)`$, there is $`\varepsilon(t)>0`$ such that

```math
L\left(\frac{P_{420}(x;q,t)}{P_{420}(\mathbf1;q,t)}
-\frac{P_{411}(x;q,t)}{P_{411}(\mathbf1;q,t)}\right)<0
\qquad(0\lt q\lt \varepsilon(t)).
```

Thus the failure occurs in a continuous parameter family inside the stated domain. The exact rational point $`q=1/10,t=9/10`$ in the main proof supplies an explicit interior example without relying on an unspecified continuity radius.

## Independent calculation

The expansions were obtained independently from the six-term symmetrization formula, without the branching implementation used to discover the candidate. Exact polynomial division by $`v_\lambda\Delta`$, evaluation at $`\mathbf1`$, and factorization of the functional difference reproduce all formulas above. The cone values were also recomputed independently in `independent_cone_check.py`; all 38 reduced products and all seven pure monomials have nonnegative functional value.
