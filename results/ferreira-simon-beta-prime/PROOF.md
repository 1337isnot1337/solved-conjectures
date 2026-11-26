# Ferreira–Simon's conjecture

Complete proposed proof of Conjecture 1 in Ferreira and Simon, *Convolution of beta prime distribution*, [arXiv:2108.09244v2](https://arxiv.org/pdf/2108.09244), printed page 20. The source and prior-resolution audit is separate.

## Statement

Write $`B_{p,q}`$ for a beta random variable with density

```math
\frac{t^{p-1}(1-t)^{q-1}}{\mathrm B(p,q)},\qquad 0\lt t<1,
```

and $`B'_{p,q}`$ for a beta-prime random variable with density

```math
\frac{\Gamma(p+q)}{\Gamma(p)\Gamma(q)}
\frac{x^{p-1}}{(1+x)^{p+q}},\qquad x>0.
```

Here $`\mathrm B(p,q)=\Gamma(p)\Gamma(q)/\Gamma(p+q)`$. All random variables multiplied, divided, or added on the same side of the following identity are independent.

**Theorem.** For every $`a>0`$ and $`0\lt b<1/2`$,

```math
B'_{a,b}+\widetilde B'_{a,b}
\overset{d}{=}
B'_{2a,b}
\left(1+\sqrt{\frac{B_{a,1/2}}{B_{b,1/2-b}}}\right).
\tag{1}
```

This is the complete parameter range of the source's Conjecture 1. The argument uses ordinary beta integrals, Euler's transformation, and the quadratic transformation [DLMF 15.8.15](https://dlmf.nist.gov/15.8.E15). No numerical certificate or finite-parameter restriction is involved.

## The Mellin transform of the sum

Put $`S=B'_{a,b}+\widetilde B'_{a,b}`$. Its Mellin transform, given in the source's Proposition 5, is

```math
\mathbb E S^s
=C_{a,b}(s)H_{a,b}(s),
\tag{2}
```

where

```math
C_{a,b}(s)
=\frac{2^{2a+s}\Gamma(a+b)^2\Gamma(2b-s)\Gamma(2a+s)}
{\Gamma(2a)\Gamma(b)^2\Gamma(2a+2b)},
\tag{3}
```

and

```math
H_{a,b}(s)
={}_3F_2\!\left(
\begin{matrix}a+s/2,\ a+(s+1)/2,\ 1/2
\\ a+1/2,\ a+b+1/2\end{matrix};1\right).
\tag{4}
```

For completeness, the needed version of (2) follows directly as follows. Convolving the two beta-prime densities and then using $`z=4t(1-t)`$ on the two symmetric halves of the convolution integral gives

```math
f_S(x)=\frac{\Gamma(a+b)^2}{\Gamma(2a)\Gamma(b)^2}
\frac{x^{2a-1}}{(1+x)^{a+b}}
{}_2F_1\!\left(a+b,a;a+1/2;
-\frac{x^2}{4(1+x)}\right).
```

Pfaff's transformation, [DLMF 15.8.1](https://dlmf.nist.gov/15.8.E1), converts this to

```math
f_S(x)=\frac{\Gamma(a+b)^2}{\Gamma(2a)\Gamma(b)^2}
\frac{4^{a+b}x^{2a-1}}{(x+2)^{2a+2b}}
{}_2F_1\!\left(a+b,1/2;a+1/2;
\frac{x^2}{(x+2)^2}\right).
```

Consequently, after $`x=2y/(1-y)`$,

```math
\mathbb E S^s
=\frac{2^{2a+s}\Gamma(a+b)^2}{\Gamma(2a)\Gamma(b)^2}
\int_0^1 y^{2a+s-1}(1-y)^{2b-s-1}
{}_2F_1(a+b,1/2;a+1/2;y^2)\,dy.
```

For $`-2a\lt s<0`$, all series coefficients and integration weights are nonnegative. Tonelli's theorem and the beta integral give

```math
\int_0^1y^{2a+s+2n-1}(1-y)^{2b-s-1}\,dy
=\frac{\Gamma(2a+s+2n)\Gamma(2b-s)}
{\Gamma(2a+2b+2n)}.
```

The elementary duplication identity for rising factorials cancels the factor $`(a+b)_n`$ and gives (2)–(4). The resulting series converges since its excess is $`b-s>0`$. This also verifies finiteness in the interval used below.

## A conditional beta integral

Fix throughout this section

```math
-2a\lt s<0,
\qquad 0\lt b<1/2.
```

For $`0\lt u<1`$, define

```math
J_s(u)=\int_0^1
v^{2b-s-1}(1-v^2)^{-b-1/2}(u+v)^s\,dv.
```

The integral converges at both endpoints: $`2b-s>0`$ and $`1/2-b>0`$. Substitute

```math
v=\frac{1-y}{1+y},
\qquad x=\frac{1-u}{1+u}\in(0,1).
```

The powers of $`1+y`$ cancel exactly, leaving

```math
J_s(u)=2^{-2b}(1+u)^s
\int_0^1 y^{-b-1/2}(1-y)^{2b-s-1}(1-xy)^s\,dy.
\tag{5}
```

Euler's beta-integral representation therefore yields

```math
J_s(u)=2^{-2b}(1+u)^s
\mathrm B(1/2-b,2b-s)
{}_2F_1(-s,1/2-b;b+1/2-s;x).
\tag{6}
```

The denominator parameter here is exactly one plus the first numerator parameter minus the second. Thus DLMF 15.8.15 applies without analytic continuation or branch choices:

```math
{}_2F_1(A,B;1+A-B;x)
=(1+x)^{-A}
{}_2F_1\!\left(A/2,(A+1)/2;1+A-B;
\frac{4x}{(1+x)^2}\right),
\qquad |x|<1.
\tag{7}
```

Take $`A=-s`$ and $`B=1/2-b`$. The two elementary identities

```math
(1+u)(1+x)=2,
\qquad \frac{4x}{(1+x)^2}=1-u^2
```

turn (6) into

```math
J_s(u)=2^{s-2b}\mathrm B(1/2-b,2b-s)
{}_2F_1\!\left(-s/2,(1-s)/2;b+1/2-s;1-u^2\right).
\tag{8}
```

This is the step that evaluates the square-root mixture for arbitrary $`a`$.

## The Mellin transform of the proposed factor

Let $`U=B_{a,1/2}`$ and $`V=B_{b,1/2-b}`$ be independent, and put

```math
Q=1+\sqrt{U/V}.
```

Writing $`U=u^2`$ and $`V=v^2`$ in their density integrals gives

```math
\mathbb E Q^s
=\frac{4}{\mathrm B(a,1/2)\mathrm B(b,1/2-b)}
\int_0^1u^{2a-1}(1-u^2)^{-1/2}J_s(u)\,du.
\tag{9}
```

Insert (8), and then set $`t=1-u^2`$. The remaining integral is

```math
\frac12\int_0^1t^{-1/2}(1-t)^{a-1}
{}_2F_1\!\left(-s/2,(1-s)/2;b+1/2-s;t\right)dt
=\frac{\mathrm B(1/2,a)}2\,T_{a,b}(s),
```

where

```math
T_{a,b}(s)
={}_3F_2\!\left(
\begin{matrix}-s/2,\ (1-s)/2,\ 1/2
\\ b+1/2-s,\ a+1/2\end{matrix};1\right).
\tag{10}
```

Every numerator parameter in this expansion is positive, so Tonelli again justifies termwise integration. Its excess is $`a+b>0`$. Combining constants in (9) gives the exact identity

```math
\mathbb E Q^s
=K_b(s)T_{a,b}(s),
\qquad
K_b(s)=\frac{2^{s-2b+1}\sqrt\pi\,\Gamma(2b-s)}
{\Gamma(b)\Gamma(b+1/2-s)}.
\tag{11}
```

Equivalently, by gamma duplication,

```math
K_b(s)=\frac{\Gamma(b-s/2)\Gamma(b+(1-s)/2)}
{\Gamma(b)\Gamma(b+1/2-s)}.
```

## Transforming the sum's hypergeometric factor

We next connect (4) and (10) directly, rather than invoking a table of generalized hypergeometric transformations. The beta-integral representation of (4) is

```math
H_{a,b}(s)=
\frac{1}{\mathrm B(1/2,a+b)}
\int_0^1t^{-1/2}(1-t)^{a+b-1}
{}_2F_1\!\left(a+s/2,a+(s+1)/2;a+1/2;t\right)dt.
```

Euler's transformation, also DLMF 15.8.1, gives

```math
{}_2F_1\!\left(a+s/2,a+(s+1)/2;a+1/2;t\right)
=(1-t)^{-a-s}
{}_2F_1\!\left((1-s)/2,-s/2;a+1/2;t\right).
```

Thus the outer weight becomes $`t^{-1/2}(1-t)^{b-s-1}`$. Expanding and integrating this positive series proves

```math
H_{a,b}(s)=
\frac{\mathrm B(1/2,b-s)}{\mathrm B(1/2,a+b)}
T_{a,b}(s)
=\frac{\Gamma(a+b+1/2)\Gamma(b-s)}
{\Gamma(a+b)\Gamma(b+1/2-s)}T_{a,b}(s).
\tag{12}
```

All beta parameters are positive in the chosen interval, and the final series has the already-checked positive excess $`a+b`$.

Gamma duplication now verifies

```math
C_{a,b}(s)
\frac{\Gamma(a+b+1/2)\Gamma(b-s)}
{\Gamma(a+b)\Gamma(b+1/2-s)}
=\frac{\Gamma(2a+s)\Gamma(b-s)}
{\Gamma(2a)\Gamma(b)}K_b(s).
\tag{13}
```

The first factor on the right is the Mellin transform of $`B'_{2a,b}`$. Equations (2), (11), (12), and (13) therefore show that, for every $`-2a\lt s<0`$,

```math
\mathbb E S^s
=\mathbb E(B'_{2a,b})^s\,\mathbb E Q^s
=\mathbb E(B'_{2a,b}Q)^s.
\tag{14}
```

## Uniqueness and completion

The negative-power interval in (14) determines the positive law. Explicitly, the Mellin transforms of both sides are holomorphic on the connected strip

```math
-2a<\mathop{\mathrm{Re}}s\lt b.
```

For the sum, finiteness of negative moments in this strip was shown above; positive moments below $`b`$ follow from the beta-prime density and the elementary bound on a positive power of a sum. For the product, the beta-prime factor has exactly this moment strip. The factor $`Q\geq1`$ has all negative moments, and for $`0\lt s\lt b`$,

```math
Q^s\leq C_s(1+V^{-s/2}),
```

whose expectation is finite since $`s/2\lt b`$. Moments at two interior strip endpoints dominate the transform on any closed substrip; a slightly larger closed substrip also dominates the powers of the logarithm needed for differentiation. This proves the asserted holomorphy.

The identity theorem extends (14) throughout that strip, including the imaginary axis. At $`s=it`$, the two transforms are the characteristic functions of $`\log S`$ and $`\log(B'_{2a,b}Q)`$. Uniqueness of characteristic functions proves (1). Since $`a>0`$ and $`0\lt b<1/2`$ were arbitrary, the entire conjecture follows. ∎

## Scope

This proof settles the stated beta-prime distribution identity. The nearby complete-monotonicity equivalence in the source's Conjecture 2 and the Mills-ratio assertion in Conjecture 3 are different statements with prior refutations; they are not included as additional results here. Consequences for complete monotonicity in the parameter range implied by (1) are consequences of this one identity, not separate counted conjectures.
