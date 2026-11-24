# A positive existential linear bound for the Feldheim tail ratio

This answers the weaker linear-rate question in [Steinerberger's problem list, §24](https://faculty.washington.edu/steinerb/openproblems.pdf) in the **existential** sense, despite failure of both proposed constants. It does not assert linear growth at arbitrarily large thresholds. In fact, the Weibull examples in [the counterexample](PROOF.md) show that eventual or arbitrarily late linear growth can fail even for smooth distributions.

Let $X,Y$ be independent with the same absolutely continuous distribution on the nonnegative reals, of unbounded support. Use $m$ for a median, and $\mu$ for the mean when finite. At some $0<z\le3m$,
```math
R(z)=\frac{\Pr(X+Y\ge2z,\ \min(X,Y)\le z)}
     {\Pr(X+Y\ge2z,\ \min(X,Y)\ge z)}
\ge\frac12\ge\frac{z}{6m}.
```
If $\mu<\infty$, the same threshold also satisfies $R(z)\ge z/(12\mu)$. In particular, the conditional probability in [Feldheim–Feldheim's theorem](https://arxiv.org/abs/1609.03004) is at least $1/3$ somewhere below three medians. The proof imposes no bound on the density and assumes neither log-concavity nor monotone hazard.

## A doubling-quantile lemma

Write $S(t)=\Pr(X\ge t)$ and let $q_j$ be the first point with $S(q_j)=2^{-j}$, setting $q_0=0$. The survival function is continuous, positive at every finite point, and tends to zero. Thus the quantiles exist, $q_1>0$ is the first median, and $q_j\to\infty$. In particular $q_1\le m$. Put $d_j=q_j-q_{j-1}$.

There is a first index $j\ge1$ with $d_j\le d_{j+1}+d_{j+2}$, and $q_j\le3q_1$. Indeed, if the reverse strict inequality holds for every $1\le k\le N$, summing and cancelling gives
```math
d_{N+1}+\sum_{k=3}^{N+2}d_k<d_1.
```
Failure at $k=1$ also gives $d_2<d_1$, so $q_{N+2}<3q_1$. The failures cannot persist, since $q_j$ diverges. If the first success is at $j=1$ then $q_j=q_1$, and otherwise apply the bound with $N=j-1$.

## The probability comparison

Take $z=q_j$ and $x\in[q_{j-1},q_j]$. The successful spacing inequality says
```math
 2z-x\le 2q_j-q_{j-1}\le q_{j+2}.
```
Consequently, for either choice of the variable below $z$, the event that this variable lies in $[q_{j-1},q_j]$ and the other is at least $q_{j+2}$ contributes to the numerator. These two events are disjoint up to null boundaries. It follows that
```math
 R(z)\ge
 \frac{2\big(S(q_{j-1})-S(q_j)\big)S(q_{j+2})}{S(q_j)^2}
 =\frac{2(2-1)}4=\frac12.
```
Since $z\le3q_1\le3m$, the displayed median-normalized bound follows. Also $\mu\ge q_1 S(q_1)=q_1/2$, whence $z\le6\mu$ and the mean-normalized bound.

This proof treats only universal existential coefficients, not their optimal values. It does not claim either of the two author-proposed constants, which the companion proof disproves.
