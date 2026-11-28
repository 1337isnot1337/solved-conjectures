# Mao–Wang's conjecture: Eulerian clause research

Status: unresolved. No finite row or auxiliary statement is counted as a solution.

Issue: [#83](https://github.com/1337isnot1337/solved-conjectures/issues/83).
Date: 2026-11-20.

## Exact target

Use the source convention $A(0,0)=1$ and $A(n,j)=\langle n,j-1\rangle$ for $n\geq1$. Thus the ordinary row is $xA_n^{\mathrm{std}}(x)$, not the degree-$`n-1`$ Eulerian polynomial.

The required row of the ordinary matrix square is

```math
B_n(x)=x\sum_{j=1}^{n}A(n,j)A_j^{\mathrm{std}}(x).
```

The first rows are $B_1=x$, $B_2=2x+x^2$, $B_3=6x+8x^2+x^3$, and $B_4=24x+66x^2+22x^3+x^4$.

Source: [Mao–Wang, arXiv:2607.01572v1](https://arxiv.org/pdf/2607.01572), Section 4, Conjecture 4.1.

## A published transformation theorem does not apply

Let $\mathcal A^\circ(1)=1$ and $\mathcal A^\circ(x^m)=xA_m^{\mathrm{std}}(x)$ for $m\geq1$. Then $B_n=\mathcal A^\circ(xA_n^{\mathrm{std}})$.

Brenti's claim that this transformation preserves all polynomials with nonpositive real roots was disproved by Brändén and Jochemko (2022). The positive theorem of [Athanasiadis (2025)](https://doi.org/10.1112/jlms.70083) applies to the cone

```math
\mathcal P_d=\left\{
\sum_{k=0}^d c_k x^{d-k}(1+x)^k:c_k\geq0
\right\}.
```

The Eulerian input does not generally belong to this cone. Already

```math
xA_3^{\mathrm{std}}(x)
=x(1+x)^2+2x^2(1+x)-2x^3.
```

Uniqueness of this basis expansion gives a negative coordinate. Ordinary real-rootedness, reciprocity, or gamma-positivity is therefore not a valid invocation of the published theorem.

## A natural refinement and exact recurrence

Define the homogeneous ordinary Eulerian polynomial

```math
H_j(u,v)=\sum_{r=0}^{j-1}\langle j,r\rangle
u^{j-1-r}v^r
```

and the degree-$`n-1`$ three-variable polynomial

```math
R_n(u,v,w)=
\sum_{j=1}^{n}A(n,j)w^{n-j}H_j(u,v).
```

Then $B_n(x)=xR_n(1,x,1)$. Let

```math
L=(u+v)+uv(\partial_u+\partial_v).
```

The ordinary Eulerian recurrence gives $LH_j=H_{j+1}$. Substituting the source recurrence for $A(n,j)$ gives

```math
R_{n+1}=T R_n,\qquad R_1=1,
```

where

```math
T=L(1+w\partial_w)
+w(1+u\partial_u+v\partial_v).
```

Equivalently,

```math
T=(u+v+w)
+(uv+uw)\partial_u+(uv+vw)\partial_v
+w(u+v)\partial_w
+uvw(\partial_u\partial_w+\partial_v\partial_w).
```

This is an exact identity. It does not assert that $T$ preserves stability.

One tempting conjecture is that every $R_n$ is real-stable. That would imply the required univariate real-rootedness by specializing $u=w=1$.

## The stability invariant is false

The companion [exact certificate](refinement_certificate.py) constructs

```math
P(t)=R_{22}(2t+3,4t+11,4t+2)
```

using integer polynomial arithmetic. It verifies

```math
\deg P=21,\qquad \gcd(P,P')=1,\qquad
\#\{\text{real zeros of }P\}=19.
```

The final count uses exact rational Sturm arithmetic, not floating-point root approximations. The script prints the primitive integer polynomial so the computation can be checked with a second implementation.

All three direction coefficients $2,4,4$ are positive. If $R_{22}$ were real-stable, substituting these three affine functions of any upper-half-plane $t$ would be nonzero. A real polynomial with two nonreal roots has one root in that half-plane. Hence this is an exact obstruction to the proposed stability invariant.

This does **not** refute the original conjecture, which only requires the specialization $xR_n(1,x,1)$. Early successful line checks were insufficient and are not used as evidence for a theorem.

## Weaker univariate route examined

Put $P_n(x)=R_n(1,x,1)=B_n(x)/x$ and

```math
S_n(x)=
(\partial_u\partial_wR_n+\partial_v\partial_wR_n)(1,x,1).
```

Homogeneity reduces the recurrence to

```math
P_{n+1}(x)
=(n+1+nx)P_n(x)+x(1-x)P'_n(x)+xS_n(x).
```

For $n\geq3$, $S_n$ has nonnegative coefficients and degree at most $n-3$. At a simple negative zero $r$ of $P_n$, a consecutive-interlacing induction would require

```math
\big((1-r)P_n'(r)+S_n(r)\big)P_n'(r)>0.
```

No bound establishing this inequality has been proved. Nonnegative coefficients alone give no control of the signs at negative arguments, and the degree gap prevents a direct interlacing assertion between $S_n$ and $P_n$.

The refinement and the required inequality are preserved here as a precise stopping point. The stronger false stability assertion must not be used to fill this gap.
