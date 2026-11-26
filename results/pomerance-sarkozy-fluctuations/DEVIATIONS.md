# Rare square-root deviations of the Pomerance–Sárközy count

Let $`g(n)=\#\{m\le n:m+\omega(m)>n\}`$ as in the [one-point fluctuation theorem](PROOF.md). Put $`L=\log\log X`$ and take $`n`$ uniformly up to $`X`$ (assign the finitely many undefined normalizations arbitrarily). While the square-root scaling has a degenerate ordinary limit, it has a nontrivial large-deviation law.

**Theorem.** The laws of
```math
Y_X=\frac{g(n)-\log\log n}{\sqrt L}
```
satisfy a large-deviation principle with speed $`\sqrt L`$ and good rate function
```math
 I(x)=\sup_{t\in\mathbb R}\{tx-\Lambda(t)\},\qquad
 \Lambda(t)=\int_{\mathbb R}
  \bigl[\log(1+(e^t-1)\overline\Phi(s))-t\overline\Phi(s)\bigr]\,ds.
```
Here $`\overline\Phi=1-\Phi`$ is the standard normal tail. In particular $`I`$ is symmetric, is strictly positive away from zero, and satisfies $`I(x)\sim\sqrt\pi\,x^2/2`$ as $`x\to0`$. This statement does not assign a separate named conjecture count.

## 1. The exponential-scale comparison

As in the core proof, retain $`H=\lfloor10L\rfloor`$ offsets and prime divisibilities only in $`y<p\le z`$, but now take
```math
 y=\exp(L^{3/4}),\qquad z=X^{1/L^6},\qquad R=\lfloor L^3\rfloor,\qquad
 B=\left\lceil\frac{\sqrt L}{\sqrt{\log L}}\right\rceil.
```
The expected reciprocal mass of the omitted primes is $`O(\log L)`$. Counting multiples of products of distinct primes as in the core gives, uniformly in the offset, the bound $`(eC\log L/B)^B`$ times an absolute constant for $`B`$ or more omitted divisors. The union over $`H`$ offsets is superexponentially small at speed $`\sqrt L`$, since $`B\log(B/(eC\log L))\gg\sqrt{L\log L}`$. The far offsets $`h>H`$ similarly have total exceptional probability $`\exp(-cL)`$ by the all-prime factorial bound. The restriction $`n\ge\sqrt X`$ has superexponentially small complement.

For the retained incidences, the same truncated Bonferroni proof gives the errors $`O((2H z+1)^{R+1}/X)`$ and $`O(2^{R+2}(C L^2)^{R+1}/(R+1)!)`$; both are superexponentially small at this speed. The per-prime independent Bernoulli replacement and then the Poisson replacement cost $`O(H^2/y+H/y)`$ in total variation. This is also superexponentially small. There is therefore a coupling, except on a superexponentially small event, with independent Poisson variables $`Z_h`$ of common mean $`\lambda=L+O(\log L)`$.

In this coupling the difference of the two counts is at most
```math
 W=\sum_{h=1}^H\mathbf{1}_{\{|Z_h-h|\le B\}}
```
except on the preceding exceptional events. Its independent summands have total mean at most $`2B+1=o(\sqrt L)`$, by summing over all integer thresholds against one Poisson variable. For any fixed $`\eta>0`$, the exponential Markov inequality for independent indicators gives
```math
 \Pr(W\ge\eta\sqrt L)
 \le\left(\frac{e(2B+1)}{\eta\sqrt L}\right)^{\eta\sqrt L}
```
for large $`L`$ (rounding the threshold only strengthens the bound). This is superexponentially small at speed $`\sqrt L`$. Thus $`Y_X`$ is exponentially equivalent at that speed to $`(G-L)/\sqrt L`$, with
```math
 G=1+\sum_{h=1}^H\mathbf{1}_{\{Z_h>h\}} .
```
Indeed, $`\log\log n-L=O(1)`$ on the retained range. The coupling argument works for the distribution of $`Y_X`$, so needs no simultaneous construction across different $`X`$.

## 2. The limiting cumulant and rate

Write $`p_h=\Pr(Z_h>h)`$. The core proof gives $`\mathbb E G=L+O(\log L)`$ and the Gaussian approximation uniformly for $`s_h=(h-\lambda)/\sqrt\lambda`$ in compact intervals. For fixed $`t`$ the scaled logarithmic moment generating function is
```math
 \frac1{\sqrt L}\log\mathbb E e^{t(G-L)}
 =\frac{t(\mathbb E G-L)}{\sqrt L}
 +\frac1{\sqrt L}\sum_{h=1}^H F_t(p_h),\quad
 F_t(p)=\log(1+(e^t-1)p)-tp.
```
The first term tends to zero. On any bounded $`t`$-interval, $`F_t(p)`$ and its first two $`t`$-derivatives are bounded in absolute value by a constant times $`p(1-p)`$: each is smooth jointly, and vanishes at both endpoints $`p=0,1`$. The normalized tail of the sum of $`p_h(1-p_h)`$ outside $`|s_h|\le A`$ is $`O(1/A)`$, by the same Chebyshev argument as the one-point proof. The Riemann sums therefore converge to the displayed $`\Lambda(t)`$. Its derivatives are obtained under the integral; it is finite and differentiable on all of $`\mathbb R`$, with
```math
 \Lambda''(t)=\int_{\mathbb R}
 \frac{p(s)(1-p(s))e^t}{(1-p(s)+p(s)e^t)^2}\,ds>0,
 \quad p(s)=\overline\Phi(s).
```
Also $`\Lambda'(0)=0`$, and its derivative tends to $`+\infty`$ as $`t\to+\infty`$: the nonnegative derivatives $`F_t'(p(s))`$ for $`t\ge0`$ increase to $`1-p(s)`$, of infinite integral. The corresponding negative limit follows from symmetry, since $`F_t(1-p)=F_{-t}(p)`$. The usual full-domain Gärtner–Ellis theorem now gives the large-deviation principle for the model, and exponential equivalence transfers it to $`Y_X`$.

Finally $`\Lambda''(0)=\int \Phi(s)\overline\Phi(s)\,ds=1/\sqrt\pi`$ from the core variance calculation. Strict convexity and expansion at zero give the stated quadratic behavior of $`I`$. The result describes fixed square-root displacements at exponential accuracy; it does not establish exact large-deviation prefactors, exceptional extrema, or fixed-offset collisions.

### The rate is cubic at infinity

As $`|x|\to\infty`$, the same rate has $`I(x)\sim |x|^3/6`$. To see this for $`x>0`$, put
```math
 q_t(s)=\frac{p(s)e^t}{1-p(s)+p(s)e^t}.
```
For $`t\ge0`$, the contribution to $`\int(q_t-p)`$ from $`s\le0`$ is bounded by the integrable function $`1-p(s)`$. On $`s\ge0`$, subtracting $`p`$ costs a bounded integral. For fixed $`0<\varepsilon<1`$, the Gaussian tail lower bound implies $`p(s)e^t\to\infty`$ uniformly on $`0\le s\le(1-\varepsilon)\sqrt{2t}`$; hence $`q_t(s)\to1`$ there. For $`s\ge(1+\varepsilon)\sqrt{2t}`$, $`q_t(s)\le2e^tp(s)`$, and the integral of this bound is $`o(1)`$ by the Gaussian tail upper bound. The intermediate interval has length $`2\varepsilon\sqrt{2t}`$, and $`q_t\le1`$. Letting $`\varepsilon`$ decrease shows
```math
 \Lambda'(t)\sim\sqrt{2t},\qquad
 \Lambda(t)\sim(2\sqrt2/3)t^{3/2}.
```
The maximizer in the Legendre formula has $`\Lambda'(t_x)=x`$, so $`t_x\sim x^2/2`$ and $`I(x)\sim x^3/6`$; symmetry gives the negative side. This is an asymptotic of the fixed rate function, not a uniform statement for displacements that grow with $`X`$.
