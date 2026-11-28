# Sokal's Boros–Moll conjecture

Status (20 November 2026): unresolved. This checkpoint proves exact identities and records failed sufficient methods. It does not claim coefficientwise Hankel total positivity.

Coordination: [issue #101](https://github.com/1337isnot1337/solved-conjectures/issues/101).

## Full target and sources

The primary [positivity-problems page maintained by Bishal Deb](https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html), problem P1.6, attributes to Alan Sokal the following conjecture:
```math
 B_n(x)=\sum_{k=0}^n \binom{n+k}{k}\binom{2n-2k}{n-k}x^k,
 \qquad
 (B_n(1+y))_{n\ge0}\text{ is coefficientwise Hankel totally positive.}
```
Every minor of $[B_{i+j}(1+y)]_{i,j\ge0}$ must have nonnegative coefficients in $y$. This includes arbitrary increasing row and column index sets.

Sokal's [July 2025 lecture](https://clisby.net/guttmann2025/talks/Alan_Sokal.pdf), slide 28, lists the Boros–Moll coefficientwise Hankel problem among unresolved examples. Numerical Stieltjes-moment positivity for fixed $x>0$ is already due to Boros and Moll; it is not the target.

The usual Boros–Moll convention $P_n(a)$ satisfies
```math
 B_n(x)=4^nP_n(x/2-1).
```
Thus source normalizations must be compared before using a theorem about $P_n$.

## Generating function

Let $C(z)=(1-\sqrt{1-4z})/(2z)$, with the formal branch having $C(0)=1$. Put $j=n-k$. The classical binomial generating identity
```math
 \sum_{k\ge0}\binom{2k+j}{k}z^k
 =\frac{C(z)^j}{\sqrt{1-4z}}
```
gives
```math
 \begin{aligned}
 G(z,x)&=\sum_{n\ge0}B_n(x)z^n
 \\ &=\frac1{\sqrt{1-4xz}}
   \sum_{j\ge0}\binom{2j}{j}\bigl(zC(xz)\bigr)^j
 \\ &=\frac1{\sqrt{1-4xz}\sqrt{1-4zC(xz)}}.
 \end{aligned}
```

Set $f=zC(xz)$ and $q=fC(f)$. Then
```math
 f=z+xf^2,\qquad q=f+q^2,\qquad G=q',
```
and eliminating $f$ gives
```math
 z=q(1-q)\bigl(1-xq(1-q)\bigr).
```
The last identity expresses the generating series as the derivative of two composed quadratic inverses. It is not an all-minor positivity theorem.

## Differential recurrence

Direct coefficient comparison proves, for every $n\ge0$,
```math
 (n+1)B_{n+1}(x)
 =\bigl(2(n+1)x+4n+2\bigr)B_n(x)
  +2x(x-2)B_n'(x),\qquad B_0=1.
```
To check this uniformly, write
$t_{n,k}=\binom{n+k}{k}\binom{2n-2k}{n-k}$.
The coefficient identity is
```math
 (n+1)t_{n+1,k}
 =(4(n-k)+2)t_{n,k}+2(n+k)t_{n,k-1}.
```
For $0\le k\le n$, substitute the factorial expressions, or use
```math
 \frac{t_{n,k-1}}{t_{n,k}}
 =\frac{2k(2(n-k)+1)}{(n+k)(n-k+1)}.
```
The boundary $k=n+1$ follows from
$(n+1)\binom{2n+2}{n+1}=2(2n+1)\binom{2n}{n}$.
At $x=1+y$, the derivative multiplier is $2(y^2-1)$; its negative constant term prevents a direct argument using a positive differential operator.

## A two-state matrix integral

Define polynomials $F_n(s)$ by
```math
 F_0(s)=1,\quad F_1(s)=1+s,\quad
 F_{n+1}(s)=(s+2)F_n(s)-F_{n-1}(s).
```
Equivalently,
```math
 F_n(s)=\sum_{k=0}^n\binom{n+k}{2k}s^k.
```
Then
```math
 B_n(x)=\frac{4^n}{\pi}\int_0^1
 (1-v)^nF_n\!\left(\frac{xv}{1-v}\right)
 \frac{dv}{\sqrt{v(1-v)}}.
```
This is a polynomial integrand after multiplication by $(1-v)^n$.
Indeed, the coefficient of $x^k$ on the right is
```math
 \frac{4^n}{\pi}\binom{n+k}{2k}
 B\!\left(k+\frac12,n-k+\frac12\right)
 =\binom{n+k}{k}\binom{2n-2k}{n-k}.
```

For $s\ge0$, the symmetric matrix
```math
 J(s)=
 \begin{pmatrix}s+1&\sqrt{s}\\ \sqrt{s}&1\end{pmatrix}
```
is positive definite, has trace $s+2$, and has determinant 1. Cayley–Hamilton and the initial values therefore give
$F_n(s)=e_1^\mathsf TJ(s)^ne_1$.
Consequently, with
```math
 K(v,x)=4
 \begin{pmatrix}
 1-v+xv&\sqrt{xv(1-v)}
 \\ \sqrt{xv(1-v)}&1-v
 \end{pmatrix},
```
we have
```math
 B_n(x)=\frac1\pi\int_0^1
 e_1^\mathsf TK(v,x)^ne_1
 \frac{dv}{\sqrt{v(1-v)}}.
```
For every fixed $x\ge0$, $K(v,x)$ is positive semidefinite. The spectral theorem and positive integration thus give a positive moment measure. This is another derivation of the already known numerical moment property, not a resolution of Sokal's coefficientwise conjecture.

The distinction is concrete:
```math
 B_0(x)B_2(x)-B_1(x)^2=2x^2-2x+2.
```
The unshifted determinant has a negative coefficient despite numerical moment positivity for every $x\ge0$. At $x=1+y$ it becomes $2+2y+2y^2$, but this single determinant does not prove the conjecture.

Averaging moment families that individually have coefficientwise positive Hankel minors does not automatically preserve that coefficientwise property. Any proposed use of the matrix integral must address this gap.

## An implicit-series sufficient route fails

The inverse equation is $q=z\Phi(q)$, where
```math
 \Phi(u)=\frac1{(1-u)(1-xu(1-u))}.
```
After $x=1+y$,
```math
 [y]\Phi(u)=\frac{u}{(1-u+u^2)^2}
 =u+2u^2+u^3-2u^4-4u^5-2u^6+\cdots.
```
Thus $\Phi$ is not even coefficientwise nonnegative in $u,y$. A criterion requiring a coefficientwise Pólya-frequency implicit series cannot be invoked for this representation.

Multiplying $B_n$ by $n!$ produces a simpler exponential generating-function problem. Dividing a Stieltjes-moment sequence by $n!$ is not a general positivity-preserving operation, so a theorem about $n!B_n$ would not settle the stated target.

## Prior work checked

- The primary P1.6 statement and Sokal's 2025 lecture agree that the target is coefficientwise positivity of all Hankel minors.
- Repository file searches for Boros and Domb found no existing result or active lane. Public issue searches for Boros/Hankel, Boros/coefficientwise, little Domb, and Domb/Sokal found no direct full resolution.
- Bao-Xuan Zhu, [*Coefficientwise Hankel-total positivity from a universal cumulant lifting*](https://arxiv.org/html/2611.01172v1), posted 31 October 2026, was read at Theorems 1.6–1.7 and the implicit-equation/prefactor criteria in Section 6. The paper explicitly resolves the functional-digraph component conjecture. Its full searchable HTML contains neither Boros nor Domb. Theorem 6.8 concerns exponential coefficients and independent powers, keeping its structural parameters fixed. No application to the present ordinary coefficient sequence has been proved here.
- Gu, Liu and Xie, [*Inequalities for Higher-Order Logarithmic Differences of Boros–Moll Coefficients*](https://arxiv.org/abs/2610.25381), October 2026, concerns fixed coefficient-index inequalities and reciprocal Hausdorff moments. Its abstract is not a proof of P1.6. Full arXiv HTML retrieval failed in this audit.
- The separate infinite q-log-convexity conjecture for the usual $P_n$ is weaker than a suitable Hankel theorem and uses a different normalization. It is not silently substituted for P1.6.

These are bounded searches, not an exhaustive novelty certificate. Before any future solution is counted, its exact scope must receive a fresh prior-resolution audit.

## Diagnostic checks

Exact symbolic coefficient comparison matched the recurrence through $n=7$ and the beta-integral coefficient identity through $n=8$. The identities are proved uniformly above; the finite checks only guard against normalization errors. No root approximations or finite-minor checks are used as proof.

The remaining task is an argument for arbitrary Hankel minors after the shift $x=1+y$. The matrix integral, scalar recurrence, and inverse equation have not yet supplied it.
