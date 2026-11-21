# Negative curvature inside the zero-diagonal candidate region

Research note, 20 November 2026 (America/Chicago). This is an exact obstruction to a proposed proof method for Minc Conjecture 44. It does not disprove the conjecture or establish a new order case.

## Purpose and source boundary

The [current Conjecture 44 page](https://yair-lavi.com/mincs-list/conjecture-44/index.html) states that any order-five counterexample must satisfy

```math
\frac{81}{6400}<\|A-U_5\|_F^2<\frac5{14},
\qquad U_5=(J_5-I_5)/4.
```

The same page reports an all-order asymptotic confinement result, but does not link the proof or state its complete constants. No explicit all-order radius is inferred from that asymptotic statement here.

Burghduff's 1995 result already gives a strict local minimum at `U_n`. The proposed stronger method was to prove positive semidefiniteness of the permanent Hessian throughout the candidate region, and then use convexity to extend the local result. The matrix below rules out that particular method, even within the explicitly stated order-five region.

## The exact matrix and direction

Let `P` be the permutation matrix of the cycle `1→2→3→4→5→1`, and define

```math
A=U_5+\frac3{10}(U_5-P)
=\frac{13(J_5-I_5)-12P}{40}.
```

Every entry on the diagonal is zero. The entries in the support of `P` are `1/40`, and all other off-diagonal entries are `13/40`. Thus `A` lies in the relative interior of the zero-diagonal doubly stochastic face. Moreover,

```math
\|A-U_5\|_F^2=\frac{27}{80}<\frac5{14}.
```

Use the integer tangent direction

```math
D=\begin{pmatrix}
0&8&0&-6&-2\\
3&0&-7&2&2\\
1&-2&0&3&-2\\
2&-5&1&0&2\\
-6&-1&6&1&0
\end{pmatrix}.
```

Its diagonal, row sums, and column sums are all zero. Since `max_ij |D_ij|=8`, the whole segment `A+hD`, `|h|<1/320`, stays in the relative interior of the zero-diagonal face. By continuity, a sufficiently short such segment also stays inside the displayed Frobenius ball.

Direct permanent expansion gives the polynomial identity

```math
\begin{aligned}
\mathop{\mathrm{per}}(A+hD)
={}&\frac{131951}{2560000}
-\frac{3159}{160000}h
-\frac{271}{3200}h^2\\
&+\frac{2367}{800}h^3
+\frac{16489}{20}h^4
+3444h^5.
\end{aligned}
```

Therefore

```math
\mathop{\mathrm{Hess}}_A(\mathop{\mathrm{per}})[D,D]
=-\frac{271}{1600}<0.
```

The permanent is consequently not convex throughout that candidate region.

## The same witness also excludes local quasiconvexity

Remove the cyclically invariant part of the direction and clear denominators:

```math
C=5D-\sum_{r=0}^4P^rD(P^{\mathsf T})^r
=\begin{pmatrix}
0&40&-1&-28&-11\\
14&0&-35&9&12\\
7&-11&0&15&-11\\
9&-23&4&0&10\\
-30&-6&32&4&0
\end{pmatrix}.
```

This is again a zero-diagonal, zero-margin tangent direction. The exact expansion now has no linear term:

```math
\mathop{\mathrm{per}}(A+hC)
=\frac{131951}{2560000}
-\frac{6413}{1600}h^2
-\frac{103}{80}h^3
+520326h^4+12638280h^5.
```

At `h=1/10000`, put `A_+=A+hC` and `A_-=A-hC`. Both matrices are strictly positive off the diagonal and doubly stochastic, and

```math
\|A_\pm-U_5\|_F^2=\frac{3375737}{10000000}<\frac5{14}.
```

Their permanent differences from the midpoint are

```math
\mathop{\mathrm{per}}A_+-\mathop{\mathrm{per}}A
=-\frac{100075946293}{2500000000000000000}<0,
```

```math
\mathop{\mathrm{per}}A_--\mathop{\mathrm{per}}A
=-\frac{100070140707}{2500000000000000000}<0.
```

Since `A=(A_++A_-)/2`, this also violates the defining midpoint inequality for quasiconvexity within the same candidate region. The matrices still have permanent strictly larger than `per U_5`.

## What the example does not show

The example has

```math
\mathop{\mathrm{per}}A-\mathop{\mathrm{per}}U_5
=\frac{21951}{2560000}>0.
```

The first direction `D` has a nonzero first derivative, so `A` is not a stationary point on the full face. Removing that derivative along the particular direction `C` does not make `A` stationary in every direction. The example does not exclude an estimate restricted to stationary minimizers or a monotonicity argument along rays from `U_n`.

The calculation uses one exact witness to audit the global Hessian proposal. It is not an enumeration, a finite-order proof of Conjecture 44, or a counterexample to that conjecture.

Run `python3 research/minc/inequalities/c44_hessian_certificate.py` for an independent exact expansion over all 120 permutations.

## References

- Yair Lavi, [Minc Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html), checked 20 November 2026.
- J. B. Burghduff, *Minimum permanents of doubly stochastic matrices with zero main diagonal*, Linear and Multilinear Algebra **40** (1995), 125–140, [DOI 10.1080/03081089508818428](https://doi.org/10.1080/03081089508818428). The primary publisher abstract states local minimality; the full paper was not obtained in this source check.

