# Lih–Wang convexity inequality

There is an $n_0$ such that **every** binary regular bipartite support of order $n\ge n_0$, normalized by its degree $1\le k\le n$, satisfies [Lih–Wang's conjecture](https://yair-lavi.com/mincs-list/conjecture-34/index.html). For $A=G/k$, $J_{ij}=1/n$ and $0<t\le1/2$,

```math
 \operatorname{per}((1-t)J+tA)<(1-t)\operatorname{per}J+t\operatorname{per}A
```

unless $A=J$. This statement is uniform over both the degree and the graph and covers sequences with $n/k$ tending to infinity arbitrarily slowly. It leaves the unrestricted weighted conjecture open.

## A lower bound for general weighted endpoints

For every doubly stochastic $A$ put $u=\|A-J\|_F^2$, $s=1+u=\sum a_{ij}^2$, $d_n=n!/n^n$ and $P(A)=\operatorname{per}A/d_n$. With an absolute constant $C$,

```math
 \log P(A)\ge \tfrac12 u-\tfrac12\log(1+u)-C.                 \tag{1}
```

Use the [multicolumn capacity bound](../nov20-independent/inequalities/explicit_eventual_zero_diagonal.md), Lemma 1. For $m$ omitted columns, $1\le m\le n$, average its logarithm over the sets of $n-m$ selected columns. Since $(1-a)\log(1-a)\ge-a+a^2/2$ on $[0,1]$, this yields

```math
 \log P(A)\ge\log(d_m/d_n)+(1-m/n)(-n+s/2)
       \ge\tfrac12\log(m/n)+(1-m/n)s/2-C_0.
```

The second inequality is Stirling's bound uniformly for positive $m\le n$, and $m=n$ gives the usual van der Waerden lower bound. Take $m=\lceil n/s\rceil$. Since $1\le s\le n$, we have $ms/n\le2$ and $\log(m/n)\ge-\log s$. This proves (1). The coefficient $1/2$ cannot be increased in an estimate with sublinear error. For example the [dense regular minimum theorem](../extremal-graphs/positive_density_minimum.md) gives normalized minima tending to $e^{u/2}$ for each fixed integer $u\ge1$ along $n=(u+1)k\to\infty$. A diagonal choice of orders as $u\to\infty$ proves the assertion.

## Closing the intermediate-degree range

Write $M=n/k$, so $u=M-1$. Put $q=99/100$, $\beta_k=(1-1/k)^{k-1}$ for $k\ge2$, and $a_k=\beta_k^k/d_k$. The [regular matching partition-function bound](regular-chord.md), its integral (2), the displayed tie-probability identity and $\int h\,dx=1$ give for every $0\le t\le1/2$

```math
 P((1-t)J+tA)\le \frac{M d_k^M}{d_n}(q a_k)^{M-1}
             =\frac{M}{q a_k}\,q^M\frac{\beta_k^n}{d_n}.        \tag{2}
```

The earlier result compared this expression with the endpoint using Schrijver's bound alone. That loses a factor of order $\sqrt n$ at slowly growing $M$. Here $a_k\ge c/\sqrt k$ by the explicit estimate in the linked proof. Stirling gives $d_n\ge c\sqrt n\,e^{-n}$. Thus (2) is at most

```math
 C\sqrt M\exp\{M(\log q+k[1+\log\beta_k])\}.
```

Since $k[1+\log\beta_k]=1/2+O(1/k)$ and $\log q<0$, there are fixed $k_0$ and $\epsilon>0$ such that this is at most $C\sqrt M e^{(1/2-\epsilon)M}$ for $k\ge k_0$. By (1) the normalized endpoint satisfies $P(A)\ge c e^{M/2}/\sqrt M$. Hence the ratio of the smoothed permanent to its endpoint is $O(M e^{-\epsilon M})$, uniformly in the half-interval and all $k\ge k_0$. For the finitely many $2\le k<k_0$, the original estimate in (1) of the linked proof bounds the same ratio by $M q^{M-1}/a_k$, which also tends to zero exponentially in $M$. For $k=1$ coordinate permutation reduces the whole curve to the PSD endpoint $I$, where the centered subpermanent coefficients are nonnegative and the quadratic coefficient is positive.

Take $M\to\infty$ and $k\ge2$. The common upper bound $E$ on the endpoint ratio tends to zero with $E\sqrt M\to0$. For $t\ge E$ the smoothed permanent is at most $E\operatorname{per}A\le t\operatorname{per}A$, strictly below the chord. For $0\le t\le E$, the [local Hessian theorem](../nov20-independent/inequalities/uniform_radial_permanent.md) gives convexity on that whole segment for all large orders, since $\|E(A-J)\|_F\le E\sqrt M\to0$. Comparing to the chord at both ends gives strictness throughout $0<t\le E$. Finally if $M$ stays bounded then $a_{ij}\le M/n$ and the [dense spectral comparison](../real-radius/dense_spectral_comparison.md) proves the assertion. An infinite sequence violating uniform eventual validity would have a subsequence in one of these two cases.

The matching polynomial comparison used for (2) is the theorem of [Davies, Jenssen, Perkins and Roberts](https://doi.org/10.1112/jlms.12056). The proof of (1) uses the multicolumn consequence of [Lelarge](https://arxiv.org/abs/1507.04739) and Gurvits cited in the linked lemma. No complete conjecture is counted here.
