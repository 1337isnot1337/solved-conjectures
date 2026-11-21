# A fixed two-row reset cannot propagate Wang's equality indefinitely

Research checkpoint: 20 November 2026, America/Chicago. This is a structural obstruction to one precise recursive construction. It is not a solution of Minc Problem 7 and does not exclude adaptive reset directions.

## Reset and direction update

Use the positive-border triangular construction and replacement polynomial H_B from `bordered_partition_lifts.md`. Choose a sign vector w on the N old core columns. A reset appends two rows whose old-core signs are respectively w and −w, with intervening sign ε=+1. Its determinant is four times the old determinant.

Let

```math
h(t)=H_B(tw_1,...,tw_N).
```

For the next reset, retain these old direction signs and append two signs α,β∈{−1,1}. Thus the next direction is (w,α,β). The new restricted polynomial is exactly

```math
\mathcal L_{\alpha\beta}h
=A_{\alpha\beta}(t)h''+B_{\alpha\beta}(t)h'+C_{\alpha\beta}(t)h,
\tag{1}
```

where

```math
\begin{aligned}
A_{\alpha\beta}(t)&=(t^2-1)(1+(\alpha+\beta)t+\alpha\beta t^2),\\
B_{\alpha\beta}(t)&=2(1-\alpha+\beta)t+4(\alpha+\beta)t^2+6\alpha\beta t^3,\\
C_{\alpha\beta}(t)&=2+2(\alpha+\beta)t+6\alpha\beta t^2.
\end{aligned}
\tag{2}
```

These operators record more information than the current permanent and its first replacement values. Their constant term is 2h(0)−h''(0), independently of α,β, consistent with the two-step formula.

## Derivation

Denote the two new variables by y,z. After the first appended row, restriction only in the old variables gives

```math
H_1(t,y)=(1+y)(1+t)h'(t)+2yh(t).
```

For the second row, the old signs are −w and the sign on the first new coordinate is +1. Therefore

```math
H_2(t,y,z)=(1+z)\bigl((t-1)\partial_t+(1+y)\partial_y\bigr)H_1(t,y)+2zH_1(t,y).
```

Differentiating while y is still independent of t, then substituting y=αt and z=βt, gives (1)–(2). Substituting before differentiating would give the wrong operator.

## The fixed choice (α,β)=(−1,+1)

For this direction update, the operator factors:

```math
\mathcal Lh
=-(1-t^2)^2h''+6t(1-t^2)h'+(2-6t^2)h
=-D_t\left[(1-t^2)D_t\bigl((1-t^2)h\bigr)\right].
\tag{3}
```

Define

```math
(\mathcal Uh)(x)=\operatorname{sech}^2x\,h(\tanh x).
```

With $`\mathcal Ah=D_t((1-t^2)h)`$, the substitution t=tanh x gives

```math
\mathcal U\mathcal Ah=D_x\mathcal Uh,
\qquad \mathcal U\mathcal Lh=-D_x^2\mathcal Uh.
\tag{4}
```

Consequently, if the same reset and direction update is iterated k times, its permanent P_k is

```math
P_k=(\mathcal L^kh)(0)
=(-1)^k\left.\frac{d^{2k}}{dx^{2k}}
\left(\operatorname{sech}^2x\,h(\tanh x)\right)\right|_{x=0}.
\tag{5}
```

Its determinant has absolute value 4^k|det A(B)|.

## All-order obstruction

**Proposition.** For every fixed starting triangular matrix and sign direction, this fixed reset rule produces at most finitely many matrices satisfying nonzero absolute permanent–determinant equality.

**Proof.** Only the even part h_even contributes to (5). If it is zero, every P_k is zero and there is never such an equality, since the determinants are nonzero.

Otherwise let

```math
Q(t)=(1-t^2)h_{\mathrm{even}}(t).
```

This is a nonconstant even polynomial of degree r≥2. Its leading coefficient q_r is nonzero. The even part of the function in (5) is Q(tanh x).

The nearest poles of tanh x are at x=±ia, a=π/2, and both have residue one. Thus Q(tanh x) has a genuine pole of order r at each point, with leading principal-part coefficient q_r. The next possible poles have modulus 3π/2.

Subtracting the principal parts at ±ia leaves a function analytic in a disc of any fixed radius between a and 3a. For the even Taylor coefficient of degree 2k, the leading two principal parts add, rather than cancel, since r is even. It follows that

```math
\left|[x^{2k}]Q(\tanh x)\right|
=2|q_r|\binom{2k+r-1}{r-1}a^{-2k-r}\bigl(1+O(k^{-1})\bigr).
\tag{6}
```

Lower-order principal parts contribute a lower power of k, and the analytic remainder contributes exponentially less. Multiplying by (2k)! and using (5) gives

```math
\frac{|P_k|}{4^k|\det A(B)|}
\sim\frac{2|q_r|a^{-r}}{|\det A(B)|}
(2k)!\binom{2k+r-1}{r-1}\pi^{-2k}
\longrightarrow\infty.
\tag{7}
```

Hence all sufficiently late matrices have permanent magnitude strictly larger than determinant magnitude. This proves the proposition. □

The argument also covers a starting matrix whose permanent is zero, provided h_even is not identically zero. No claimed recurrence for its small initial terms is needed.

## What this does and does not exclude

The obstruction applies to every fixed starting matrix and initial direction; the finite cutoff may depend on both. It is therefore stronger than failure of one seed or one small order. It excludes the repeated reset with the specified direction extension (w,−1,+1), even if occasional early steps attain Wang's equality.

It does not exclude choosing α,β differently at different steps, changing old direction signs, choosing a more restricted family with an additional invariant, or using other two- or three-step operations. The four operators (1) retain that distinction explicitly.

For any of the four operators, the coefficient of t^(d+2) produced from a nonzero leading term ct^d is αβ(d+2)(d+3)c. Thus there is no nonzero polynomial eigenfunction, and no nonzero finite-dimensional linear space of polynomials invariant under one of these operators. This elementary degree observation does not rule out a nonlinear invariant involving an increasing degree, nor an invariant formulated only for an attainable subclass of replacement polynomials.

No adaptive invariant that reaches every admissible order has been established. The exact operator reduction identifies the remaining question without treating the excluded fixed reset as a successful induction.
