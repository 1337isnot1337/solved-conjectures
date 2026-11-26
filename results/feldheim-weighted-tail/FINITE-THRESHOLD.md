# An explicit finite-threshold bound for weighted tails

The [weighted Feldheim–Feldheim proof](PROOF.md) gives an infinite limsup for all the stated independent laws, including atomic laws. Here we show a different, quantitative fact for nonatomic laws: a fixed positive excess already occurs at a threshold bounded by a constant times the median of the minimum. The distributions need not coincide.

Let $X_1,\ldots,X_n$ be independent, nonnegative and nonatomic, each of unbounded support; $n\ge2$. Let $\lambda_i>0$ sum to one, and set
```math
c=\min\left(1,\frac{1-\max_i\lambda_i}{\max_i\lambda_i}\right),
\qquad L=\left\lceil\frac2c\right\rceil,\qquad C=2(1+1/c).
```
If $m$ is a median of $\min_iX_i$, there exists $0<z\le C m$ such that
```math
 \frac{\Pr(\sum_i\lambda_iX_i>z)}{\prod_i\Pr(X_i>z)}-1
 \ \ge\ 2^{-L}\log2 .
```
The same threshold is at most $2C\mathop{\mathrm{E}}[\min_i X_i]$ when this mean is finite.

## Spacing lemma for the combined survival function

Let $S_i(x)=\Pr(X_i>x)$ and $S=\prod_i S_i$. Write $q_j$ for the first point with $S(q_j)=2^{-j}$ and $q_0=0$. Then $q_1>0$ is the first median of the minimum, and $q_j\to\infty$. Put $d_j=q_j-q_{j-1}$. We use the first $j\ge1$ satisfying
```math
d_j\le c\sum_{r=1}^L d_{j+r}.
```
If all earlier inequalities fail and $j\ge L+1$, sum their strict reverses for $1\le k\le j-1$. For each $L+1\le i\le j$, the terms with $k=i-L,\ldots,i-1$ contain $d_i$, so $q_{j-1}>cL\sum_{i=L+1}^j d_i$. Since $cL\ge2$, this implies $q_j\le2q_L$. Whenever the first inequality fails, $q_{L+1}<(1+1/c)q_1$ directly. In particular all $q_j$ before a success, and the successful $q_j$ itself, are bounded by $Cq_1$. The divergence of the quantiles guarantees success.

## Rectangles

Take $z=q_j$. Besides the event where all variables exceed $z$, keep the $n$ events where one variable $X_i$ is in $[q_{j-1},z]$ and every other variable exceeds $q_{j+L}$. They are disjoint up to probability zero. For each of these events, the possible loss in the weighted sum at the low variable is at most $\lambda_i d_j$. The gain of the other variables is strictly greater than $(1-\lambda_i)(q_{j+L}-q_j)\ge\lambda_i d_j$, by the spacing inequality and the choice of $c$. Thus each lies in the strict weighted-tail event.

After dividing by $S(z)$, event $i$ contributes
```math
 \left(\frac{S_i(q_{j-1})}{S_i(z)}-1\right)
 \prod_{k\ne i}\frac{S_k(q_{j+L})}{S_k(z)}
 \ \ge\ 2^{-L}\left(\frac{S_i(q_{j-1})}{S_i(z)}-1\right);
```
the omitted survival ratio is at most one. The product of the $n$ positive ratios in the parentheses before subtracting one is exactly two. Since $a-1\ge\log a$, the sum of the parenthesized terms is at least $\log2$. This proves the claim. The mean bound follows from $\mathop{\mathrm{E}}[\min_iX_i]\ge q_1/2$.

The original weighted conjecture is qualitative and does not provide this finite cutoff. This proof extends the [quantile-spacing argument for identical laws](../steinerberger-feldheim-tail/LINEAR-EXISTENCE.md) and does not claim an optimal finite threshold or coefficient. Targeted searches for this exact median-of-the-minimum statement did not locate an earlier proof.
