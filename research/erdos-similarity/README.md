# Erdős’s similarity conjecture

**Status** · Open. This note gives a sufficient covering condition for eliminating exceptional dilations and a counterexample to deducing that condition from near-linear Hausdorff gauges and Fourier nullity. [Issue #532](https://github.com/1337isnot1337/solved-conjectures/issues/532)

## Target and source audit

For every infinite $A\subseteq\mathbb R$, there should be a measurable set of positive Lebesgue measure containing no set $x+tA$ with $t\ne0$. Erdős’s 1974 problem 4.33.7 gives this statement and points to sequences with only one limit point. For bounded infinite $A$, one can take a strictly monotone subsequence approaching a limit from one side, translate the limit to zero, and reflect if needed. Avoiding that subset suffices to avoid $A$. [Erdős, p. 204](https://users.renyi.hu/~p_erdos/1974-27.pdf)

A bounded witness already avoids every unbounded pattern. Yip proved the stronger avoidance statement with a witness of near-full measure in every unit interval. The geometric case was proved in the October 2026 OpenAI manuscript and explained by Iosevich and Yavicoli. Jiang and Xi covered null sequences with adjacent ratios bounded below. Kovač’s manuscript covers additional ranges of logarithmic gaps. The earlier general claim arXiv:2001.02395 was withdrawn. The 2026-11-24 primary-source search found no resolution of the full conjecture. [Yip, v2](https://arxiv.org/abs/2611.14056v2), [Iosevich and Yavicoli](https://arxiv.org/abs/2611.02454v1), [Jiang and Xi](https://arxiv.org/abs/2610.11449v1), [Kovač](https://hexagonmath.org/pdf/2610.00176v1), [withdrawal](https://arxiv.org/abs/2001.02395)

Kulkarni and Mora Cuéllar construct dense compact witnesses whose exceptional dilation sets are null for every finite positive measure with positive logarithmic Fourier decay. They also get near-linear Hausdorff gauge bounds, with the allowed gauges depending on the pattern. The question here is what these bounds can yield by intersecting rescaled copies of a witness. The compact-set construction uses a mixed-radix deletion related to the Erdős–Kakutani constructions. The property at issue is persistence for all prescribed ratios near the identity, together with the two thinness properties. Searches for compact null sets with that combination found no prior proof. Priority remains provisional. [Kulkarni and Mora Cuéllar, Theorems 1.2–1.3](https://arxiv.org/abs/2611.15734v1), [Elekes and Steprāns, §2](https://www.impan.pl/shop/publication/transaction/download/product/88860), [Yavicoli, thick-set intersections](https://doi.org/10.1007/s00209-022-02992-y)

## A sufficient condition for rescaling a witness

For $K\subseteq[0,1]$ compact, write $D_K(A)$ for the positive magnitudes of the dilations of copies contained in $K$, allowing either sign. Write $N(F,r)$ for the least number of intervals of length $r$ that cover a bounded set $F$. The lower box dimension is $\liminf_{r\to0}\log N(F,r)/\log(1/r)$ for nonempty $F$.

**Proposition.** Fix $0<a\le b<\infty$ and $m\ge2$. Suppose $K$ has measure greater than $1-\varepsilon$ and $D=D_K(A)\cap[a/2,2b]$ has lower box dimension below $1-1/m$ or is empty. For almost every $(s_2,\ldots,s_m)$ in any sufficiently small box around $(1,\ldots,1)$, the set

```math
K\cap s_2K\cap\cdots\cap s_mK
```

contains no copy with $a\le |t|\le b$. Its measure is at least $1-m\varepsilon-o(1)$ as the radius of the box tends to zero.

Indeed a surviving copy would give $t_1=|t|\in D$ and $t_i=|t|/s_i\in D$, hence $(s_2,\ldots,s_m)=(t_1/t_2,\ldots,t_1/t_m)$. The map on the right is Lipschitz on $[a/2,2b]^m$. Take $d<1-1/m$ above the lower box dimension and a sequence of radii $r\downarrow0$ with $N(D,r)\le r^{-d}$. Covering the product at these radii puts the image inside $r^{-md}$ boxes of side $O(r)$. Its outer measure in $\mathbb R^{m-1}$ is zero. For the measure bound, each near-identity $s_iK$ misses at most $\varepsilon+O(|s_i-1|)$ of $[0,1]$, by scaling length and allowing for the portion outside the interval. Add the deficits. The empty case follows directly.

In particular it suffices, on each compact scale interval exhausting the nonzero scales, to obtain this lower box bound with some $m$ fixed while the density of $K$ tends to one. Apply the proposition on each interval with summable measure deficits, and intersect the compact witnesses.

## A compact set where thinness does not suffice

**Theorem.** There is a compact $D\subseteq[1,2]$ with the following properties.

1. $\mathcal H^{h_\theta}(D)=0$ for every $0<\theta<1$, where $h_\theta(r)=r\exp((\log(1/r))^\theta)$ for sufficiently small $r$.
2. Every finite positive Borel measure $\mu$ with $|\widehat\mu(\xi)|=O((\log(2+|\xi|))^{-p})$ for some $p>0$ has $\mu(D)=0$.
3. For every $m\ge2$ there is $\eta_m>0$ such that whenever $s_1=1$ and $|s_i-1|<\eta_m$ for $2\le i\le m$, there is an $x\in[1,2]$ with $s_ix\in D$ for every $i$. In particular $D$ has lower box dimension one.

Thus the thinness properties alone allow an open box of bad ratio tuples at the identity for every finite number of factors. This example concerns the geometry of a candidate exceptional set. The proof makes no identification of $D$ with an actual $D_K(A)$.

### Construction and the gauge estimates

Let $B_n=(n+100)^4$, $Q_0=1$ and $Q_n=\prod_{j=1}^n B_j$. Take an open interval $I_n$ in the circle $\mathbb R/\mathbb Z$ with left endpoint $\lfloor B_n/2\rfloor/B_n$ and length

```math
\epsilon_n=\frac{1}{B_n}\left\lfloor\frac{B_n}{100\sqrt{\log(n+100)}}\right\rfloor.
```

Define $D=[1,2]\cap\bigcap_{n\ge1}\{x:Q_{n-1}x\bmod1\notin I_n\}$. It is compact. The stage-$n$ deletion removes exactly $B_n\epsilon_n$ of the $B_n$ equal subintervals inside each surviving grid interval of length $1/Q_{n-1}$, apart from endpoints. Therefore outside the countable set of grid endpoints, $D$ is covered at stage $n$ by at most $Q_n\prod_{j\le n}(1-\epsilon_j)$ closed intervals of length $1/Q_n$. The sum of their gauge costs is bounded by

```math
\exp\!\left(-\sum_{j\le n}\epsilon_j+(\log Q_n)^\theta\right).
```

Here $\log Q_n=O(n\log n)$ and $\sum_{j\le n}\epsilon_j\gg n/\sqrt{\log n}$. The displayed bound tends to zero for every $\theta<1$. The grid endpoints have zero Hausdorff measure for each of these gauges.

### Fourier nullity

For each $n$, choose the triangular tent $\phi_n$ of height one centered on $I_n$, with support the closure of $I_n$ and value zero at its endpoints. It is a translate of the convolution on the circle of two indicators of the centered interval of length $\epsilon_n/2$, divided by $\epsilon_n/2$. Its mean is $\epsilon_n/2$ and the sum of absolute values of its Fourier coefficients is 1. Indeed the centered tent has nonnegative Fourier coefficients summing to its value at zero. The coefficients are bounded by $C/(\epsilon_n k^2)$ at nonzero frequency $k$ by integrating the interval indicator. Take $R_n=\lceil C_0\epsilon_n^{-2}\rceil$ with $C_0$ fixed sufficiently large. Then the absolute Fourier tail beyond $R_n$ is at most $\epsilon_n/8$. The real trigonometric polynomial

```math
P_n(z)=1-\sum_{|k|\le R_n}\widehat\phi_n(k)e^{2\pi ikz}+\epsilon_n/8
```

majorizes $1-\phi_n\ge1_{I_n^c}$. It is nonnegative, has mean $1-3\epsilon_n/8$, and has Fourier coefficient sum in absolute value at most 3.

The frequencies $Q_{j-1}$ satisfy $Q_{j-1}>2\sum_{i<j} R_iQ_{i-1}$ for all sufficiently large $j$. This follows from $R_i=O(\log(i+100))$, the geometric growth of successive $Q_i$, and $Q_{j-1}/Q_{j-2}=B_{j-1}$. For $L_n=\lfloor(\log n)^{3/4}\rfloor$, use the nonnegative majorant

```math
1_D(x)\le\prod_{j=n}^{n+L_n-1} P_j(Q_{j-1}x).
```

In the expansion every nonzero coefficient choice in the product has frequency at least $Q_{n-1}/2$ in absolute value, by taking the largest index with nonzero frequency. The sole zero-frequency term is the product of the means. The total absolute sum of the other coefficients is at most $3^{L_n}$. Integration against a measure with the given decay therefore bounds $\mu(D)$ by

```math
\mu(\mathbb R)\exp\!\left(-\tfrac38\sum_{j=n}^{n+L_n-1}\epsilon_j\right)
+O_\mu\!\left(3^{L_n}(\log Q_{n-1})^{-p}\right).
```

The first term tends to zero since $\sum_{j=n}^{n+L_n-1}\epsilon_j\gg(\log n)^{1/4}$. The second tends to zero since $L_n=o(\log n)$ and $\log Q_{n-1}\gg n$. This argument applies directly to $\mu$ even if it gives mass outside $D$.

### Persistence under nearby ratios

Fix $m$. Choose $N$ so that for every $n\ge N$, $m\epsilon_n\le1/24$ and $B_n\ge8m$. Take a surviving grid interval of length $1/Q_{N-1}$ in $[1,2]$ through the first $N-1$ stages. Its middle half $J$ is taken into that same surviving interval by each map $x\mapsto s_ix$ if the ratios are sufficiently close to one. Fix such ratios in $[1/2,2]$.

At any subsequent stage $n$, write $Q=Q_{n-1}$ and suppose the current closed interval $J$ has length $L\ge1/(2Q)$ and satisfies all previous conditions for every ratio. For a single ratio $s_i$, the $n$th forbidden intervals in $x$ have period $1/(s_iQ)$ and length $\epsilon_n/(s_iQ)$. At most $2QL+2$ can meet $J$. The union removed by all $m$ ratios has length at most $m(4\epsilon_n L+4\epsilon_n/Q)\le12m\epsilon_n L\le L/2$. Its complement in $J$ has at most $m(2QL+2)+1\le8mQL$ interval components. One component is a closed interval of length at least $1/(16mQ)\ge1/(2Q_n)$. Use it as the next $J$. The initial interval has the required length at stage $N$. Taking the intersection of the nested closed intervals gives $x$ with every $s_ix\in D$.

If the lower box dimension of $D$ were below $1-1/m$, the covering argument in the proposition would make the set of ratio tuples of $m$ points in $D$ null. The persistence just proved gives it interior. Taking all $m$ yields lower box dimension one.

## Audit and scope

The Hausdorff estimate counts actual surviving grid cells and discards only a countable set of endpoints. In the Fourier estimate, a block length sublinear in $\log n$ keeps the sum of the absolute Fourier coefficients small enough for every positive logarithmic rate. The interval induction tests all scales in a specified finite tuple and keeps one common interval at each stage. The radius of the initial neighborhood may depend on the number of scales.

Run `python3 research/erdos-similarity/verify.py` for exact rational controls of the interval induction and the rule excluding small nonconstant Fourier frequencies. The analytic claims follow from the proofs above. The conjecture remains open. This is AI-assisted research with provisional priority and independent review pending.
