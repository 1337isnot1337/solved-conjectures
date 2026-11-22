# A uniform bound for all starting points of fixed polynomial height

**Theorem.** For every fixed real $`A\ge1`$, there is a constant $`c_A>0`$ such that for every integer $`t\ge1`$ and every $`0\le n\le t^A`$,
```math
f(n,t)=\#\{s_t(n+i):1\le i\le t\}\ge c_A t .
```
Here $`s_t(m)`$ is the component of $`m`$ supported on primes strictly below $`t`$. In fact, for $`t^{3/2}\le n\le t^A`$, a positive proportion depending only on $`A`$ have $`s_t(n+i)>t`$. A sequence with $`f(n,t)/t\to0`$ must have $`\log n/\log t\to\infty`$. The [sponsor’s statement](https://conjectures.io/problems/erdos461-erdos-461) allows such starting points.

## The logarithmic mass of the small factors

For every $`n`$ one has
```math
(t-1)!\ \mid\ \prod_{i=1}^t s_t(n+i).
```
For each $`p<t`$, each power $`p^j`$ divides at least $`\lfloor t/p^j\rfloor`$ of the numbers in the interval. Summing valuations proves the assertion. Thus the sum of the logarithms of the components is at least $`t\log t-O(t)`$. If $`n\le t^{3/2}`$, any number in the interval with a prime factor at least $`t`$ has smooth component at most $`2\sqrt t`$. All other numbers have components equal to themselves, at most $`2t^{3/2}`$, and are pairwise distinct. Comparing with the logarithmic lower bound gives at least $`(1/2-o(1))t`$ of the latter numbers. This settles the small-height range.

For the rest take $`t^{3/2}\le n\le t^A`$. We shall prove that, for some fixed $`0<\eta\le1/4`$ depending on $`A`$,
```math
\#\{1\le i\le t:t^{1-\eta}\le s_t(n+i)\le t\}\le t/4
\tag{1}
```
for all sufficiently large $`t`$. The interval of possible sizes just below $`t`$ is where a small range could otherwise carry almost all the logarithmic mass.

## Averaging the divisibility count over possible components

Cover $`[t^{1-\eta},t]`$ by all the dyadic integer blocks $`[S,2S)`$ meeting this interval, and write $`I`$ for their union. Thus $`t^{3/4}/2\le S\le t`$ and $`\sum_{s\in I}1/s\le\eta\log t+O(1)`$ uniformly. For pairs $`(s,r)`$ with $`s\in I`$ and $`n<sr\le n+t`$, the count with $`\ell\mid r`$ is exactly
```math
N_\ell=\sum_{s\in I}\left(\left\lfloor\frac{n+t}{\ell s}\right\rfloor-
                                  \left\lfloor\frac n{\ell s}\right\rfloor\right).
```
There exists $`\beta=\beta(A)>0`$, independent of $`\eta`$, such that for every $`1\le\ell\le t^{1/10}`$,
```math
N_\ell=\frac{t}{\ell}\sum_{s\in I}\frac1s+O_A(t^{1-\beta}).
\tag{2}
```

To see the saving, take $`x=n`$ or $`n+t`$, an integer $`1\le h\le t^{1/10}`$ and the phase $`g(s)=hx/(\ell s)`$ on one block. Choose an even integer $`k\ge4(A+2)`$. Its $`k`$th derivative is positive and lies between $`\lambda=k!hx/(\ell(2S)^{k+1})`$ and $`2^{k+1}\lambda`$. Throughout these ranges
```math
\lambda\ll_A t^{-1},\qquad \lambda S^k\gg_A t^{2/5}.
```
The first follows from $`S\ge t^{3/4}/2`$ and $`hx\le2t^{A+1/10}`$; the second from $`x\ge t^{3/2}`$, $`\ell\le t^{1/10}`$ and $`S\le t`$. The fixed-order derivative estimate therefore gives
```math
\left|\sum_{S\le s<2S}\exp(2\pi i g(s))\right|
       \ll_A S t^{-\beta_0}
```
for some $`\beta_0(A)>0`$. Explicitly, the three normalized terms in that estimate are bounded by constants times $`S^{-2/2^k}`$, $`\lambda^{1/(2^k-2)}`$ and $`(\lambda S^k)^{-2/2^k}`$. Endpoints change at most two summands. [J. Arias de Reyna, explicit van der Corput derivative estimate, introductory theorem](https://arxiv.org/html/2407.02094v1)

The Erdős–Turán discrepancy inequality with $`\lfloor t^{1/10}\rfloor`$ frequencies now bounds the discrepancy of $`\{x/(\ell s)\}`$ on the block by $`O_A(t^{-1/10}+t^{-\beta_0}\log t)`$. Integrating the distribution function over $`[0,1]`$ gives the same error for its mean fractional part relative to $`1/2`$. Subtract the two endpoint sums and use $`\sum_{\rm blocks} S=O(t)`$ to obtain (2), decreasing $`\beta`$ if necessary.

## Sieving the cofactor

Choose $`0<\alpha<\min(1/20,\beta/8)`$ and $`z=\lfloor t^\alpha\rfloor`$. If $`s=s_t(n+i)`$ then $`r=(n+i)/s`$ has no prime divisor less than $`t`$. For any weights $`\lambda_d`$, $`1\le d\le z`$, with $`\lambda_1=1`$, its contribution is at most the nonnegative majorant $`(\sum_{d\mid r,\ d\le z}\lambda_d)^2`$, which equals one on every such cofactor. This includes $`r=1`$.

For completeness take $`G=\sum_{q\le z}\mu^2(q)/\varphi(q)`$, $`y_q=\mu(q)/(\varphi(q)G)`$ and $`\lambda_d=d\sum_{d\mid q,\ q\le z}\mu(q/d)y_q`$. Then $`\lambda_1=1`$ and $`|\lambda_d|\le d`$. Möbius inversion and $`\gcd(d,e)=\sum_{q\mid d,e}\varphi(q)`$ give
```math
\sum_{d,e\le z}\frac{\lambda_d\lambda_e}{[d,e]}
=\sum_{q\le z}\varphi(q)\left(\sum_{q\mid d,\ d\le z}\lambda_d/d\right)^2
=\frac1G .
```
Here $`G\gg\log z`$, since $`\varphi(q)\le q`$ and squarefree integers have positive density. These are the elementary Selberg upper-sieve weights.

Sum the majorant over all pairs and apply (2) at $`\ell=[d,e]\le z^2`$. The resulting upper bound is
```math
\frac{t}{G}\sum_{s\in I}\frac1s+O_A(z^4 t^{1-\beta})
\ \ll\ \frac{t(\eta\log t+O(1))}{\alpha\log t}+o_A(t).
```
The implied constant in the main term is absolute. Since $`\alpha`$ was chosen independently of $`\eta`$, take $`\eta>0`$ small enough to obtain (1).

## Completing the range bound

Let $`L`$ count components below $`t^{1-\eta}`$, and $`V`$ those above $`t`$. The latter values are pairwise distinct, because a repeated value would divide a nonzero difference less than $`t`$. By (1), $`L+V\ge3t/4`$. Every component is at most $`n+t\le2t^A`$. The logarithmic mass estimate implies
```math
t\log t-O(t)\le t\log t-\eta L\log t+(A+1)V\log t .
```
If $`V<t/4`$, then $`L\ge t/2`$ and this inequality forces $`V\gg_A t`$. If $`V\ge t/4`$ the same conclusion holds directly. Decreasing $`c_A`$ covers the finitely many small $`t`$, for which $`f(n,t)\ge1`$.

The [exact checker](check_polynomial_height.py) verifies the floor-count identity on 64 moduli, the rational sieve identity for 13 truncations, and the factorial divisibility on 150 windows. The analytic bound uses the cited derivative theorem; these finite checks address the arithmetic implementation. The lookup of the problem page, original discussion and related short-interval literature yielded no claim here of first priority for the polynomial-height result. [Erdős problem and discussion](https://www.erdosproblems.com/forum/thread/461)
