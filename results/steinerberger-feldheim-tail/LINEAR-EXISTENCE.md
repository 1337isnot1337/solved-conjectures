# Smaller universal linear coefficients for the Feldheim tail ratio

This answers the weaker linear-rate question in [Steinerberger's problem list, §24](https://faculty.washington.edu/steinerb/openproblems.pdf) in the **existential** sense, despite failure of both proposed constants. It does not assert linear growth at arbitrarily large thresholds; the Weibull examples in [the counterexample](PROOF.md) rule that out even for smooth distributions.

Let $X,Y$ be independent with the same nonatomic distribution on the nonnegative reals, of unbounded support. Let $m$ be a median and $\mu$ the mean when finite. Define the crossing ratio
```math
R(z)=\frac{\Pr(X+Y\ge2z,\ \min(X,Y)\le z)}
     {\Pr(X+Y\ge2z,\ \min(X,Y)\ge z)}.
```
There is a threshold $0<z<2m$ with
```math
 R(z)\ge\frac49\ge\frac{2z}{9m}.
```
The same threshold satisfies $z\le3\mu$ when $\mu$ is finite, and hence $R(z)\ge4z/(27\mu)$. No density bound, shape restriction, or numerical approximation is used.

## The first quantile interval that does not shrink rapidly

Write $S(x)=\Pr(X\ge x)$ and let $q_j$ be the first point where $S(q_j)=2^{-j}$, with $q_0=0$. The survival function is continuous, positive at each finite point, and tends to zero. Thus the quantiles exist and diverge, and $q_1$ is the first median, no greater than $m$.

Put $d_j=q_j-q_{j-1}$. Let $k$ be the first index with $d_{k+1}\ge d_k/2$. It exists because otherwise all spacings would be bounded by a summable geometric series. Up to $k$, $d_j\le 2^{1-j}q_1$, so $q_k<2q_1$.

Let $a=(q_{k-1}+q_k)/2$, $t=2^{-k}$, and $s=S(a)/t\in[1,2]$. Two rectangles suffice:

- At $z=a$, put one variable in $[q_{k-1},a]$ and the other at least $q_k$. They sum to at least $2a$. The two choices of the lower variable are disjoint up to probability zero, so $R(a)\ge 2(2-s)/s^2$.
- At $z=q_k$, put one variable in $[a,q_k]$ and the other at least $q_{k+1}$. The spacing inequality gives $q_{k+1}\ge 2q_k-a$. The two rectangles therefore show $R(q_k)\ge s-1$.

For $s\le3/2$ the first bound is at least $4/9$, and for $s>3/2$ the second exceeds $1/2$. This gives the result at one common threshold $z\le q_k$.

## Mean normalization

The survival integral gives $\mu\ge\sum_{j=1}^k 2^{-j}d_j$. Hence
```math
3\mu-q_k\ge \tfrac12d_1+\sum_{j=2}^k(3\cdot2^{-j}-1)d_j .
```
Every coefficient of $d_j$ for $j\ge2$ is negative. Replacing those spacings by their geometric upper bounds and extending the sum to infinity gives the lower bound
```math
 d_1\left(\tfrac12+\sum_{j=2}^\infty(3\cdot2^{-j}-1)2^{1-j}\right)=0 .
```
Thus $z\le q_k\le3\mu$.

The constants here are explicit but not claimed to be optimal. The argument refines the earlier two-future-quantile proof recorded in [issue #396](https://github.com/1337isnot1337/solved-conjectures/issues/396); neither the old nor the new positive coefficient restores Steinerberger’s original constants.
