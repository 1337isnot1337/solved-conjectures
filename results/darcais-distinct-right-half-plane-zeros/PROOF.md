# Infinitely many distinct right-half-plane zeros of D’Arcais polynomials

**Result.** The D’Arcais polynomials have infinitely many pairwise
distinct zeros in the open right half-plane. More precisely, there are
a fixed positive integer $M$ and a complex number $`z_*`$ with
$`\Re z_*>0`$ such that for every sufficiently large prime $`p`$ there is
a zero $w_p$ of $P_{Mp}$ satisfying $`(Mp)w_p\to z_*`$ as $p\to\infty$.

There are also constants $B,\delta>0$ and a set of indices of
positive lower density such that, for every sufficiently large
index $n$ in the set, $P_n$ has a zero $w$ with
$|w|\le B/n$ and $\Re w\ge\delta/n$.

This proves the distinct-zeros assertion asked in Section 4 of
[Charlton–Heim–Neuhauser–Stumpenhusen–Tröger, arXiv:2608.18842v2](https://arxiv.org/html/2608.18842v2#S4).
Their earlier theorem already refutes the Hurwitz conjecture and
establishes a positive lower density of counterexample indices. The
claim here is about the values and scale of zeros, not a new
refutation of that conjecture or a claim about the first counterexample.

## 1. Scaled entire limit

Write $u(m)=\sigma_{-1}(m)$ for $m\ge1$, and let $`u^{*k}(n)`$
denote the $`k`$-fold **additive** convolution. By the generating
function,
```math
P_n(x)=[q^n]\exp\!\left(x\sum_{m\ge1}u(m)q^m\right)
=\sum_{k=1}^{n}\frac{u^{*k}(n)}{k!}x^k
\quad(n\ge1).
```
Set $U=\zeta(2)$, $C=U^2\zeta(3)$. Prefix sums of $u$ are bounded
by $UN$, since $\sum_{m\le N}u(m)=\sum_{d\le N}d^{-1}\lfloor N/d\rfloor$.
The squares satisfy
```math
\sum_{m\le N}u(m)^2
\le N\sum_{d,e\ge1}\frac{\gcd(d,e)}{d^2e^2}
\le CN,
```
where the second inequality follows by separating the common gcd.
In particular $`(u*u)(t)\le Ct`$ for every positive integer $t$, by
Cauchy–Schwarz. For $k\ge2$, the remaining $k-2$ factors are summed
over the simplex with coordinate sum at most $n$. In each coordinate,
a nonincreasing nonnegative weight has $u$-weighted sum at most
$U$ times its unweighted sum, by summation by parts and the prefix
bound. Applying this to the simplex indicator one coordinate at a
time gives
```math
0\le u^{*k}(n)
\le Cn U^{k-2}\binom{n}{k-2}
\le \frac{C U^{k-2}}{(k-2)!}\,n^{k-1}. \tag{1}
```
The first inequality also covers $k=2$ with the empty simplex tuple.

For every fixed $k\ge2$, Starr’s convolution asymptotic is
```math
\frac{u^{*k}(n)}{n^{k-1}}
=
\frac{\zeta(2)^k}{(k-1)!\zeta(2k)}\sigma_{1-2k}(n)+o(1).
\tag{2}
```
A direct derivation is included below. Take $n=Mp$ for primes
$p\nmid M$ tending to infinity. For every fixed $s<0$,
$\sigma_s(Mp)=\sigma_s(M)(1+p^s)\to\sigma_s(M)$.
Consequently
```math
F_n(z):=\frac{nP_n(z/n)}{z}
\longrightarrow
F_M(z):=a_0+\sum_{j\ge1}a_jz^j,
```
where the removable value at zero is included and
```math
a_0=\sigma_{-1}(M),\qquad
a_{k-1}=\frac{\zeta(2)^k\sigma_{1-2k}(M)}
{k!(k-1)!\zeta(2k)}
\quad(k\ge2).
```
Convergence is locally uniform by (1). Also (1) bounds the growth of
$`F_M`$ by a constant times
```math
1+|z|\sum_{j\ge0}\frac{(U|z|)^j}{(j!)^2}
\le 1+|z|\exp(2\sqrt{U|z|}),
```
since the sum is dominated by the square of
$\sum_{j\ge0}(U|z|)^{j/2}/j!$. Thus $`F_M`$ is entire of order at
most $1/2$, in particular strictly less than one.

## 2. An unstable limiting zero

An entire real function $F$ of order less than one with $F(0)>0$
and all its zeros in $\Re z\le0$ has its first four coefficients
satisfying
```math
a_1a_2-a_0a_3\ge0. \tag{3}
```
To see this, Hadamard factorization in order less than one gives
the genus-zero product $F(z)=F(0)\prod_{\lambda}(1-z/\lambda)$.
Its finite products, taking nonreal zeros in conjugate pairs,
converge locally uniformly and are real polynomials with all
zeros in the closed left half-plane. For a finite product of
degree at least three, its reciprocal polynomial also has
all zeros in the closed left half-plane. The second Hurwitz
minor of this reciprocal is (3), with the corresponding
finite-product coefficients. Nonnegativity in the closed
half-plane follows by first translating the reciprocal
polynomial by a small positive real argument, then taking the
translation to zero. If there are fewer than three factors, (3)
is immediate from the nonnegative coefficients of real factors
for negative roots or paired nonreal left-half-plane roots.
Taking the finite-product limit proves (3). This also covers
a finite number of zeros, since any remaining exponential factor
would be constant in order less than one.

For $`F_M`$, the first three nonconstant coefficients are
```math
a_1=\tfrac54\sigma_{-3}(M),\qquad
a_2=\tfrac{35}{96}\sigma_{-5}(M),\qquad
a_3=\tfrac{175}{3456}\sigma_{-7}(M).
```
These constants follow by substituting the classical zeta values
at $2,4,6,8$. Thus $a_1a_2/a_3\le9\zeta(3)\zeta(5)$. Choose
$M$ with $\sigma_{-1}(M)>9\zeta(3)\zeta(5)$, possible for
factorials, since every integer from 1 through $L$ divides $L!$
and the harmonic sums diverge. Then $a_1a_2-a_0a_3<0$.
By (3), $`F_M`$ has a zero $`z_*`$ in $\Re z>0$.

Fix a small closed disk around $`z_*`$ lying in that half-plane and
containing no other zero of $`F_M`$. Local uniform convergence and
Rouché's theorem give zeros $`z_p`$ of $`F_{Mp}`$ in the disk for
every sufficiently large prime $`p`$. The zeros may be chosen with
$`z_p\to z_*`$: Rouché applies to arbitrarily small concentric
circles, and these exclude the possibility of a distinct limiting
zero in the initial disk. Since $`z_*\ne0`$, the numbers
$w_p=z_p/(Mp)$ are nonzero right-half-plane zeros of $P_{Mp}$,
with $w_p\to0$. They therefore take infinitely many distinct
values.

## 3. Uniform location on a positive-density set of indices

Fix $M$ as above and set $K=2\zeta(2)\sigma_{-1}(M)$. Consider
multiples $n$ of $M$ with $\sigma_{-1}(n)\le K$. On this family
the constant coefficients of $F_n$ are bounded by $K$;
(1) bounds all higher coefficients. Every sequence of these
indices going to infinity therefore has a subsequence whose
$F_n$ converge locally uniformly to an entire function of
order at most $1/2$, by diagonal extraction of coefficients
and the same summable majorant. The limit has constant
coefficient at least $\sigma_{-1}(M)$, because $M\mid n$.
By (2), its first three nonconstant coefficients satisfy
```math
a_1\le\tfrac54\zeta(3),\qquad
a_2\le\tfrac{35}{96}\zeta(5),\qquad
a_3\ge\tfrac{175}{3456}.
```
Thus this limit also violates (3) strictly and has a zero in
the open right half-plane.

It follows that some uniform $B,\delta>0$ work for all
sufficiently large indices in the family. Otherwise one can
choose an increasing sequence $n_j$ from it such that $F_{n_j}$
has no zero with $|z|\le j$ and $\Re z\ge 1/j$. Extract a locally
uniform limit. A small disk about a right-half-plane zero of the
limit lies inside these expanding regions for all sufficiently
large $j$, so Rouché's theorem contradicts the asserted absence
of zeros there.

The family has lower density at least $1/(2M)$. In fact
$\sigma_{-1}(Mt)\le\sigma_{-1}(M)\sigma_{-1}(t)$, since each
divisor of $Mt$ is a product of a divisor of $M$ and a divisor
of $t$, and all the weights are positive. The prefix bound
from Section 1 gives average at most $\zeta(2)$ for
$\sigma_{-1}(t)$ over $1\le t\le T$. At least half the $t$
therefore obey $\sigma_{-1}(t)\le 2\zeta(2)$, so their multiples
$Mt$ satisfy the cutoff $K$. Rescale the zeros of $F_n$ by
$1/n$ to obtain the claimed quantitative location.

## Appendix: fixed-convolution asymptotic

For a positive cutoff $D$, let
$u_D(m)=\sum_{d\mid m,\ d\le D}1/d$.
The argument bounding the sum of squares also gives
```math
\sum_{m\le N}(u(m)-u_D(m))^2
\le N\sum_{d,e>D}\frac{\gcd(d,e)}{d^2e^2}.
```
The double-sum tail tends to zero. For fixed $k\ge2$, telescope
the difference of the $`k`$-fold convolutions into terms with
one factor $u-u_D$ and $k-1$ factors bounded by $u$. Pair the
tail factor with any other factor by Cauchy–Schwarz, then use
the prefix bound on the rest. This bounds
$`|u^{*k}(n)-u_D^{*k}(n)|/n^{k-1}`$ by a constant depending on $`k`$
times the square root of the double-sum tail, uniformly in $n$.

For bounded divisors $d_1,\ldots,d_k\le D$, let $g=\gcd(d_1,\ldots,d_k)$.
The number of positive integer solutions to $\sum_i d_i x_i=n$
is
```math
\frac{g\,\mathbf 1_{g\mid n}}{(k-1)!\prod_i d_i}\,n^{k-1}
+O_{k,D}(n^{k-2}).
```
Indeed the rational generating function
$q^{\sum_i d_i}/\prod_i(1-q^{d_i})$ has order-$`k`$ poles precisely
at the $`g`$th roots of unity; the leading contribution from
each is the same multiple of $n^{k-1}$ times its root-of-unity
phase. All other poles have order at most $k-1$.
Multiplying by the weights $\prod_i d_i^{-1}$, dividing by
$n^{k-1}$, and letting $D$ grow gives (2), because the unrestricted
sum of leading coefficients is absolutely convergent:
```math
\sum_{g\mid n}g^{1-2k}
\sum_{\gcd(e_1,\ldots,e_k)=1}\prod_i e_i^{-2}
=\sigma_{1-2k}(n)\frac{\zeta(2)^k}{\zeta(2k)}.
```
The unrestricted majorant can be formed by summing over all $g\ge1$,
so truncating at $\max d_i\le D$ gives an error tending to zero
independently of $n$.

## Source and priority

- S. Charlton, B. Heim, M. Neuhauser, J. Stumpenhusen, and R. Tröger,
  [*A Positive Proportion of the Reduced D’Arcais Polynomials is not
  Hurwitz*](https://arxiv.org/html/2608.18842v2), September 2026
  revision. Section 3 uses a negative reciprocal Hurwitz minor
  for the non-Hurwitz result, records (2) and the threshold
  $9\zeta(3)\zeta(5)$, and credits Starr for (2). Section 4
  explicitly asks whether the distinct positive-half-plane roots
  are infinite. The local scaling, normal convergence, and
  genus-zero argument above address that question.
- S. Starr, [*Asymptotics of the D’Arcais numbers at small k*,
  Corollary 2.2](https://arxiv.org/html/2601.18599v4), credits its
  antecedents in Ramanujan and Lemke Oliver–Shrestha–Thorne.
- Exact searches through November 24, 2026 did not identify a
  prior answer to this distinct-zeros question. The original
  Hurwitz conjecture itself was already resolved and is not
  counted as a new conjecture resolution here.
