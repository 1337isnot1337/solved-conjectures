# Monotonicity toward the boundary

Every doubly stochastic matrix of rank at most two satisfies Friedland and Minc's radial permanent monotonicity, in every order. The increase is strict on the segment away from the constant path. The entire hierarchy of Holens–Đoković inequalities also holds for these matrices. [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html) asks for a description covering arbitrary boundary matrices.

## Reduction to two count distributions

Let $J$ have entries $1/n$. By the [rank-two representation](binary_extremizers.md), every rank-two doubly stochastic matrix can be written
```math
 A_{ij}=\frac1n\left(1+\frac{(a_i-p)(b_j-p)}{p(1-p)}\right)
```
for $a,b\in[0,1]^n$ of common mean $0<p<1$. Indeed the rows lie on the line segment between two endpoint rows $u,v$ and have the form $a_i u+(1-a_i)v$. Then $`p\,u+(1-p)v`$ is uniform and $b_j=np u_j$ works. Rank one gives $J$.

Put $m=np$. For any such vector $a$, write $f_a$ for the density of its independent Bernoulli sum relative to $`\pi=\mathop{\mathrm{Bin}}(n,p)`$. With $d_n=n!/n^n$, $w_k=\pi(k)(n-k)p$, $\Delta f(k)=f(k+1)-f(k)$ and $b_t=p\mathbf1+t(b-p\mathbf1)$, the [occupation formula and count-chain Dirichlet identity](binary_occupation.md) give
```math
 t\frac{d}{dt}\,\frac{\mathop{\mathrm{per}}(J+t(A-J))}{d_n}
 =\sum_{k=0}^{n-1}w_k\,\Delta f_a(k)\,\Delta f_{b_t}(k).
```
We prove that the sum on the right is nonnegative for **any** two parameter vectors of the same mean. For each argument separately it is symmetric and multiaffine in the Bernoulli probabilities. On the slice with fixed sum one can minimize first in one argument and then in the other, reducing both to vectors with all interior coordinates identical. To see this, choose a minimizer maximizing the sum of squared coordinates. The objective with a pair sum fixed is affine in the squared difference. Two distinct interior values would force this affine function to be constant and would allow a larger squared difference. [Hoeffding's extremal principle](https://repository.lib.ncsu.edu/bitstream/1840.4/2268/1/ISMS_1955_128.pdf)

## The two neighboring edges

Integral $m$ is covered by the common-mode argument in the occupation note. Suppose $m=h+\delta$ with $h=\lfloor m\rfloor$ and $0<\delta<1$. A reduced vector has $s$ ones, $z$ zeros and $n-s-z$ identical interior entries. Its count has law $`s+\mathop{\mathrm{Bin}}(n-s-z,(m-s)/(n-s-z))`$. Both $h,h+1$ are in its support. For its density $f$, the adjacent ratio on the interior of the support is
```math
 r(k)=\frac{f(k+1)}{f(k)}
 =\left(1+\frac{s(m-k-1)}{m(k+1-s)}\right)
  \left(1+\frac{z(m-k)}{(n-k)(n-m-z)}\right).
```
Equivalently it is a positive constant times $(k+1)/(k+1-s)$ times $(n-k-z)/(n-k)$, hence is nonincreasing. The factored display gives $\Delta f(k)\ge0$ for $k<h$ and $\Delta f(k)\le0$ for $k>h$, including the support endpoints by direct inspection. Only the edge $h$ can contribute negatively to the sum. If $h=0$, both vectors have $s=0$ and $r(h)\ge1$. At $h=n-1$ both have $z=0$ and $r(h)\le1$.

It remains to take $1\le h\le n-2$ with densities $f,g$ satisfying $\Delta f(h)>0>\Delta g(h)$. Write $r=f(h+1)/f(h)$ and $q=g(h+1)/g(h)$. Log-concavity and positivity at the two central sites give
```math
 \frac{\Delta f(h-1)}{\Delta f(h)}\ge\frac1r,
 \qquad
 \frac{-\Delta g(h+1)}{-\Delta g(h)}\ge q .
```
For the first inequality use $f(h-1)\le f(h)/r$, also valid at a missing site; for the second use $g(h+2)\le qg(h+1)$.

For the increasing central edge of $f$, $z>0$ and the first factor of its ratio formula is at most one at both $h$ and $h+1$. The second factor is nonnegative there, including zero if $h+1$ is the top of the support. Therefore
```math
 r-1\le\frac{z\delta}{(n-h)(n-m-z)},\qquad
 1-r(h+1)\ge\frac{z(1-\delta)}{(n-h-1)(n-m-z)} .
```
This yields
```math
 \frac{-\Delta f(h+1)}{\Delta f(h)}
 \ge r\frac{(1-\delta)(n-h)}{\delta(n-h-1)} .
```
Apply the same result to the reflected distribution $k\mapsto n-k$ for $g$, now with reference parameter $1-p$, central ratio $1/q$, floor $n-h-1$ and fractional part $1-\delta$. This gives
```math
 \frac{\Delta g(h-1)}{-\Delta g(h)}
 \ge \frac1q\frac{\delta(h+1)}{(1-\delta)h}.
```
Divide the contributions at $h-1,h+1$ by the absolute contribution at $h$. Their respective lower bounds are
```math
 \frac{w_{h-1}}{w_h}\frac{\delta(h+1)}{rq(1-\delta)h},
 \qquad
 \frac{w_{h+1}}{w_h}rq\frac{(1-\delta)(n-h)}{\delta(n-h-1)} .
```
They have product exactly one, since $w_k$ is a constant times the mass function of $`\mathop{\mathrm{Bin}}(n-1,p)`$. Their sum is at least two. All the other terms are nonnegative. This proves the Dirichlet inequality also for nonintegral means.

The radial polynomial is nondecreasing, and when $A\ne J$ the strict van der Waerden equality case gives distinct endpoint values. A nonconstant polynomial cannot be constant on a subinterval, so the path is strictly increasing.

## Lower-order subpermanents

Differentiating at $t=1$ gives $`n\mathop{\mathrm{per}}A-\sigma_{n-1}(A)/n\ge0`$, with $\sigma_j$ the total order-$`j`$ subpermanent sum. This proves the top Holens–Đoković comparison in each order for rank at most two. London's 1981 theorem then gives
```math
 \sigma_j(A)\ge\frac{(n-j+1)^2}{nj}\sigma_{j-1}(A)
 \qquad(2\le j\le n)
```
in the same class. London's theorem was a reduction to the top order, and the unrestricted inequalities have counterexamples. [London's paper](https://doi.org/10.1080/03081088108817382) · [London's institutional abstract](https://cris.technion.ac.il/en/publications/on-the-%C4%91okovi%C4%87-conjecture-for-matrices-of-rank-two/) · [Wanless's counterexamples](https://users.monash.edu.au/~iwanless/abstracts/djokovic.html)

The [rational checks](verify_rank_two_monotonicity.py) use ordinary Bernoulli convolution to verify the local three-edge bound, including missing neighboring support sites, and compare the Dirichlet expression to direct matching sums. The literature search covered London's rank-two reduction, Hwang's block and repeated-row results, Wanless's counterexamples, and the live catalogue. No unconditional all-rank-two proof was located in the sources checked. Historical priority is unconfirmed. This theorem does not classify all boundary matrices.
