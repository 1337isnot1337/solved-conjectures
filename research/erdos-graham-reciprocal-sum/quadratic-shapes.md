# Quadratic tail numerators

**Theorem.** There is a finite set of nonzero rational numbers $\mathcal R$, independent of the sequence, with the following property. Suppose the product-cleared numerator of a rational reciprocal sum agrees on arbitrarily long consecutive intervals with a nonconstant rational quadratic polynomial $Q$. Write the polynomial uniquely as

```math
Q(X)=a(X+\rho)(X+\rho+1)+c.
```

Then $c\ne0$ and $a/c\in\mathcal R$. Both the translation $\rho$ and the scale are unrestricted. The denominators of the reciprocal sum need only be positive integers eventually greater than one. [Exact tails and the backward-square theorem](quadratic-tails.md)

**Consequence for Erdős–Graham.** Suppose a strictly increasing positive integer sequence has

```math
\frac{a_n^2}{a_{n+1}}=1+\frac2n+\frac{b}{n^2}+\frac{d}{n^3}+o(n^{-3}).
```

Rationality of its reciprocal sum forces $b\in\mathbb Q$ and $d-b^2/2\in\{-2/R:R\in\mathcal R\}$. Thus a single finite set of exceptions works for every second-order coefficient $b$. The earlier result also excludes every even integral $b$ regardless of $d$. [Integer shifts](quadratic-tails.md)

## Reducing all translations to the same two curves

The gcd stabilization and persistent-prime arguments of the linked proof apply to an arbitrary quadratic. The second difference bounds the common divisors, and a rational root would give a zero modulo a persistent denominator prime on a later agreement interval. Thus $Q$ is irreducible and $c\ne0$. Divide the polynomial and both recurrence variables by its centered constant term after gcd reduction. The identities are homogeneous and the finitely many primes dividing the scaling factor can be omitted. Equivalently, the two square conditions at a root are unchanged by scaling their roots and square roots in the same way. The normalized polynomial in $T=X+\rho$ is $A T(T+1)+1$, with $A=a/c$.

Let $\alpha$ be its root in the $T$ coordinate and put $z=2A\alpha+A$. Translation preserves the neighbouring polynomial values, so the two conditions give

```math
z^2=A^2-4A,\qquad h^2=-4A,\qquad
S=(A-z)^2+4(4A-2z)h=B^2\quad\text{in }K=\mathbb Q(z)
```

for a choice of $h,B\in K$. Both $z$ and $h$ are nonzero. In addition to using $N(S)$, use the second necessary identity

```math
(\operatorname{Tr} B)^2=\operatorname{Tr} S+2N(B).
```

The signed rational variable $w=N(B)/(4A)$ fixes the sign in both formulas simultaneously.

**Rational $h$.** Put $s=-h/2$, so $A=-s^2$. Expanding the norm and trace yields

```math
w^2=4s^3+48s^2-63,\qquad Z^2=s^2+16s+2-2w,\qquad Z=\operatorname{Tr}(B)/(2s).
```

Retain $s=-8$ as a possible exceptional parameter. Otherwise write $x=Z/(s+8)$ and eliminate $w$. The resulting equation, quadratic in $s$, is

```math
(s+8)^2x^4-2(s^2+16s+2)x^2+s^2+4=0.
```

Its discriminant in $s$ is $16(-31x^6+45x^4+3x^2-1)$. Hence $x$ is the first coordinate of a rational point on

```math
H_1:\quad y^2=-31x^6+45x^4+3x^2-1.
```

This implication still holds when the quadratic degenerates to a linear equation, since its discriminant is then a square. For each $x$ there are at most two values of $s$. The leading coefficient $(x^2-1)^2$ vanishes only at $x=\pm1$, where the linear coefficient is $-16$.

**Nonrational $h$.** Now $h$ is a rational multiple of $z$. Put $t=2z/h$, so $A=4-t^2$. The two identities yield

```math
w^2=4t^3-48t^2-24t+257,\qquad Z^2=(4-t^2)(2-t^2+8t+2w),\qquad Z=\operatorname{Tr}(B)/2.
```

Set $x=Z/(4-t^2)$, whose denominator is nonzero. Eliminating $w$ gives

```math
(4-t^2)x^4-2(2-t^2+8t)x^2-(t-16)^2=0.
```

Its discriminant in $t$ is $16x^2(x^6-3x^4-45x^2+63)$. If $x=0$, then $t=16$. Otherwise $x$ is the first coordinate of a rational point on

```math
H_2:\quad y^2=x^6-3x^4-45x^2+63.
```

Here the leading coefficient in $t$ vanishes only at $x=\pm1$, where the linear coefficient is 16. Each $x$ again supplies at most two parameters.

The sextics have discriminants $-2^{22}3^{10}7^2\cdot31$ and $-2^{22}3^{12}7^3$. Each smooth projective model has genus two, so Faltings's theorem gives finitely many rational points. Taking the resulting values of $-s^2$ and $4-t^2$, together with the two exceptional parameter values, proves finiteness. The complete rational-point calculation subsequently excluded every shape. [Point lists and sieve](rational-points.md) [Faltings, 1983](https://geodesic.mathdoc.fr/item/IM_1983__73_143051/) · [Symbolic verification](check_quadratic_shapes.py)

## Recovering the growth coefficients

Take $\rho=-b/2$ and compare the exact numerator with $F_n=(n+\rho)(n+\rho+1)$, which is positive for large $n$. Its successive ratio is $1+2/(n+\rho)$. The logarithmic differences of $C_n/F_n$ are $O(n^{-3})$, giving $C_n=A_0F_n+O(1)$ with $A_0>0$. The first differences of this error are $O(n^{-1})$ by the ratio identity. Two further differences prove $\Delta^3 C_n\to0$. Integrality gives eventual equality with a quadratic in $\mathbb Q[X]$. Comparing coefficients shows $A_0,\rho\in\mathbb Q$ and $C_n=A_0 F_n+c_0$ eventually. The theorem now gives $R=A_0/c_0\in\mathcal R$.

Writing $x=n+\rho$ gives the exact formula

```math
\frac{C_{n+1}}{C_n}
=1+\frac{2}{x}-\frac{2/R}{x(x(x+1)+1/R)}.
```

The difference between this ratio and $a_n^2/a_{n+1}$ is $O(1/a_n)$, smaller than every negative power of $n$. Expanding gives $b=-2\rho$ and $d=2\rho^2-2/R$. When $b$ is an even integer, $\rho$ is an integer and the bounded-gap disagreement theorem already precludes rationality. The bounty itself assumes only convergence of the ratio to one. [Sponsor's target](https://conjectures.io/problems/erdos243-erdos-243)

## Excluding a shape for every rational translation

A small-prime obstruction for $P(T)=R T(T+1)+1$ can eliminate the shape even when that prime divides the denominator of the time translation or the scaling factor of the actual polynomial. The following argument transfers the obstruction to infinitely many primes.

Use a prime $p$ of integral coefficients and a **simple** root $r$ of $P$ modulo $p$. Start at $v_0=-P(r+1)$ and take all possible predecessors for $j=1,\ldots,d$ using

```math
v_j(v_j+P(r-j+1))=P(r-j)v_{j-1}.
```

If no path of length $d$ exists, no rational translate or nonzero rational multiple of $P$ can agree on arbitrarily long intervals with an exact tail. To see this, lift $r$ to a root $\alpha\in\mathbb Z_p$ by Hensel's lemma. Build the finite tree of all characteristic-zero paths with $\alpha$ substituted for $r$. Each vertex is integral over $\mathbb Z_p$, by the monic quadratic equation for each successive coordinate. Take a finite Galois extension of $\mathbb Q$ containing the roots and all path coordinates for each conjugate root, and embed it in $\overline{\mathbb Q}_p$ using the chosen lift. A lift of residue Frobenius in the decomposition group fixes $\alpha\in\mathbb Q_p$. It cannot fix all coordinates of any path of length $d$, since such a path would reduce to one over $\mathbb F_p$.

Chebotarev now gives infinitely many unramified rational primes with this Frobenius element, choosing a place above each to realize the element itself. Discard the finitely many primes where coefficients or path coordinates have poles or distinct vertices over the same parent coincide. Reduction preserves the finite trees at the remaining primes: the monic quadratic at each vertex splits into the reductions of its two roots, with multiplicity. The reduced $\alpha$ is rational over the residue field, and no full path above it has all coordinates in that field. Discard also the primes dividing the scale or translation denominators and the scale numerator. Over each remaining prime the translated and scaled polynomial inherits the same obstruction, since the time translation just shifts the root and the scale rescales all $v_j$. A sufficiently long agreement interval would produce the missing path.

The following ratios pass the initial elliptic-curve reductions or occur as exceptional values in the genus-two argument. Each nevertheless gives an empty backward set at a simple root.

| $R$ | $p$ | $r$ | Backward set sizes |
|---:|---:|---:|:---|
| $-16$ | 11 | 4 | 1, 2, 4, 5, 2, 0 |
| $-64$ | 13 | 3 | 1, 2, 1, 0 |
| $-252$ | 19 | 6 | 1, 2, 2, 0 |
| $-1932$ | 31 | 9 | 1, 2, 0 |
| $-2700$ | 11 | 4 | 1, 2, 4, 5, 2, 0 |
| $63/16$ | 11 | 4 | 1, 2, 4, 5, 2, 0 |
| $-36225/256$ | 19 | 16 | 1, 2, 2, 2, 2, 0 |

For $H_1$, the points with $x=\pm1$ give the parameter $s=4$. The separate exceptional parameter is $s=-8$. For $H_2$, the points with $x=\pm1,\pm3,\pm3/5$ give $t=16$, $-2,1/4$, and $193/16,52$ respectively. The value $t=-2$ gives a zero leading coefficient. All the other resulting shapes, as well as the exceptional $t=16$, appear in the table. The rational-point sieve excludes every other affine first coordinate. [Complete calculation](rational-points.md) [Reproducible modular checks](shape_obstructions.py)
