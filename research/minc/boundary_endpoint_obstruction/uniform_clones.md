# Monotonicity toward the boundary

Let $A\ne J_h$ be any fixed doubly stochastic matrix of order $h$, where $J_h$ has every entry $1/h$. Put $C=A\otimes J_l$, $N=hl$, and let $\sigma_k(C)$ be the sum of its order-$k$ subpermanents. Define $H_k=\sigma_k(C)/\sigma_k(J_N)$ and $H_0=1$. For every fixed even integer $r\ge2$, for all sufficiently large $l$,
```math
 \Delta^r H_k>0\qquad(0\le k\le N-r),\qquad \Delta H_k=H_{k+1}-H_k.                 \tag{1}
```
In particular the entire sequence is strictly convex and $H_{k+1}>H_k$ for $k\ge1$, since $H_0=H_1=1$. These are all the adjacent Holens–Đoković inequalities. The normalized radial permanent is strictly convex and strictly increasing away from the uniform matrix. The conclusion includes bases with disconnected support and bases that themselves exhibit arbitrarily many radial oscillations. The operation replaces each entry by an $l$-square block of equal weight. Friedland and Minc's [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html) asks for a characterization at the original multiplicity. [Wanless’s counterexample](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf), [oscillations](oscillations.md), [repeated direct sums](repeated_blocks.md)

## Degrees away from the singular endpoint

Put $P_l(t)=\mathop{\mathrm{per}}((1-t)J_N+tC)/d_N$, where $d_N=N!/N^N$. Expansion by the rows that use $C$ gives $P_l(t)=\sum_k\binom Nk t^k(1-t)^{N-k}H_k$. If $c_j=[t^j]P_l(t)$, inversion of this Bernstein representation gives
```math
 (N)_r\Delta^r H_k
  =\sum_{j\ge r}(j)_r c_j\frac{(k)_{j-r}}{(N-r)_{j-r}},
```
where falling factorials with more factors than a nonnegative integer in the numerator are zero. Terms with $j>N$ are absent. Each fixed coefficient tends to that of
```math
 F(t)=\det\big(I-t^2(A-J_h)^T(A-J_h)\big)^{-1/2}.
```
The centered matrix is $(A-J_h)\otimes J_l$ and has vanishing maximum row and column norms. The [uniform coefficient estimate and diffuse limit](../real-radius/hilbert_schmidt_limit.md) give these limits and $|c_j|\le K R^j$ for every fixed $R>\|A-J_h\|_{\rm op}$. For the coefficient limit when the norm is one, first scale the centered matrix by $1/2$. For $k/N\to t<1$, the falling-factorial ratio is bounded by $(k/(N-r))^{j-r}$ when $N>r$; hence the display tends to $F^{(r)}(t)$ by geometric domination. When the centered operator norm is below one the same result holds even at $t=1$. The even Taylor coefficients of $F$ are all positive because $A\ne J_h$, using its product over nonzero singular values. Thus $F^{(r)}>0$ for even $r$ on this entire range.

It remains to treat disconnected support and $k/N\to1$. Permute rows and columns independently to place the $c\ge2$ connected components on diagonal blocks of sizes $h_a$. Each component is square by balance. Conversely connectivity implies $\|A-J_h\|_{\rm op}<1$: equality in the row-wise Jensen bound $\|Ax\|^2\le\|x\|^2$ forces $x$ constant on the columns sharing each row, hence throughout every component.

## Row replacement and Fourier coordinates

Write $s=N-r-k\ge0$, so $s=o(N)$, and put $G(s)=H_{N-s}$. Then $\Delta^r H_k=(-1)^r\Delta^rG(s)$. Replacing $s$ uniformly chosen rows of $C$ by uniform rows gives mean permanent $d_N G(s)$, by expanding along the replaced rows. For $\Delta^r G(s)$ choose $s+r$ ordered distinct rows. Replace the first $s$, use the difference (uniform minus original) at the next $r$, and keep all other rows. Row multilinearity proves the identity.

In a clone row of base type $i$, choose column type $j$ with probability $a_{ij}$ and then choose one of its $l$ copies uniformly. Given that exactly $l$ choices have each column type, the probability of a bijection is $d_l^h$. Thus each average permanent is $d_l^h$ times a coefficient enforcing the column-type totals. Write $z_j=e^{i\theta_j}$,
```math
 v_i=\sum_j a_{ij}z_j,\qquad w=h^{-1}\sum_j z_j,\qquad
 Q_0=e^{-i\sum_j\theta_j}\prod_i v_i .
```
Use one reference column in each component. Write its phase as $\phi_a$ and the other column phases in that component as $\phi_a+\xi_j$, with reference offsets zero. Fix $\phi_c=0$ by common rotation. This unimodular change of torus coordinates leaves normalized Fourier integrals unchanged. The $h-c$ internal coordinates are $\xi$; there are $c-1$ relative phases $\phi$.

The function $Q_0$ depends only on $\xi$. Its modulus is one only at zero internal offset. Indeed each row achieving modulus one requires all its neighboring phases equal. Near zero,
```math
 \log Q_0=-\tfrac12\xi^T T\xi+O(|\xi|^3)
```
with $T$ positive definite on these offsets: the covariance is the sum of the row variances, whose kernel consists of component constants; the linear term cancels by the column margins. Put $w_0=\sum_a(h_a/h)e^{i\phi_a}$ and $P(\phi)=1-|w_0|^2$. It vanishes only at zero. Its quadratic term $P_2$ is the weighted variance of the component phases and is positive definite on $\phi_c=0$.

For bounded $s$, pass to a fixed value. For small $\xi$, factor $Q_0^l$ out of the Fourier integrand. The $s+r$ distinct rows then contribute $s$ ratios $R_i=w/v_i$ and $r$ factors $R_i-1$. At $\xi=0$ the population mean of $R_i$ is $|w_0|^2$. Sampling a fixed number without replacement converges to independent samples of the base row types. After rescaling $\xi$ by $1/\sqrt l$, the integral for $(-1)^r\Delta^rG(s)$, apart from positive normalization, tends to the product of a positive Gaussian integral and
```math
 \int |w_0|^{2s} P(\phi)^r\,d\phi>0 .
```
The tail outside a small internal neighborhood is exponentially small by $|Q_0|^{l-s-r}$, and the internal integral is dominated by a Gaussian there. This includes $s=0$.

## A growing sublinear number of uniform rows

Suppose now $s\to\infty$, and set $p=s/(N-r)\to0$. First sample the $r$ marked rows without replacement. Among the other $N-r$ rows independently use a uniform row with probability $p$, conditioning on exactly $s$ replacements. Introduce a Fourier angle $\eta$ for this last count, and put
```math
 b_i=(1-p)v_i+p e^{i\eta}w,\qquad Q=e^{-i\sum_j\theta_j}\prod_i b_i,
 \qquad D_i=(w-v_i)/b_i.
```
Up to the positive factors $d_l^h/d_N$ and the inverse binomial point probability, $\Delta^rG(s)$ equals
```math
 \int e^{-is\eta} Q^l\, M_r\,d\xi\,d\phi\,d\eta,
 \qquad M_r=\mathbb E_{\rm distinct}\prod_{u=1}^r D_{i(u)}.                \tag{2}
```
The population is the $N$ clone rows. Where a denominator vanishes, use the original polynomial integrand, omitting one factor $b_i$ for each marked row.

We detail the estimates because the two Fourier scales can separate arbitrarily slowly. There is a constant $a>0$ depending only on $A$ such that for all small $p$,
```math
 |Q|^l\le\exp[-a l|\xi|^2-a lp(|\phi|^2+|\eta|^2)]                        \tag{3}
```
using distances modulo $2\pi$. For a convex combination of unit complex numbers, one minus its squared modulus is the weighted sum of pairwise squared differences (over unordered pairs). Pairs of original choices control $|\xi|^2$ by connectivity inside each component. Summing original/uniform cross pairs over rows gives $2h p(1-p)(1-\cos(\eta)|w|^2)$ by the column margins. Its unweighted factor vanishes only at common phase and $\eta=0$, and its quadratic term there controls the relative phases and $\eta$. Compactness gives the torus bound. Apply $u\le\exp(-(1-u^2)/2)$ for $0\le u\le1$ to conclude (3).

Scale $\xi=X/\sqrt l$, $\phi=Y/\sqrt s$, $\eta=Z/\sqrt s$. On bounded sets in these scaled coordinates,
```math
 e^{-is\eta}Q^l\longrightarrow
   \exp[-X^TTX/2-P_2(Y)-Z^2/2],\qquad
 s\,\overline D\longrightarrow -P_2(Y),                                     \tag{4}
```
where bars over row quantities denote their population means. To verify this, $\overline R=|w_0|^2+O(|\xi|(|\xi|+|\phi|))$ near the origin: equality holds at $\xi=0$, and the first derivatives at common phase vanish by the column margins. Write $b_i=v_i[1+p(e^{i\eta}R_i-1)]$. In $l\sum_i\log[1+p(e^{i\eta}R_i-1)]$, the quadratic remainder is $O(lp^2(|\eta|+|\xi|+|\phi|)^2)=o(1)$. The linear term is $Np(e^{i\eta}\overline R-1)$, with $Np-s=rp$; expansion gives (4) for the phase. For the mean of $D_i$, replacing its denominator $1+p(e^{i\eta}R_i-1)$ by one incurs $O(p(|\xi|+|\phi|)(|\eta|+|\xi|+|\phi|))$. This proves the mean limit.

In the marked product replace sampling with replacement by sampling distinct rows using partition inclusion–exclusion:
```math
 M_r=\frac{N^r}{(N)_r}\sum_{\pi}\mu(\pi)N^{|\pi|-r}
                  \prod_{B\in\pi}\overline{D^{|B|}}.
```
For a singleton factor, use (4); for a block of size $b\ge2$, $D_i=O(|\xi|+|\phi|)$, so its contribution after scaling is $O(s^{b/2}/N^{b-1})$ on bounded sets. This tends to zero since $s=o(N)$. Hence $s^r M_r\to(-P_2(Y))^r$.

For dominated convergence, within a fixed small angular neighborhood the same Taylor bounds give $s|\overline D|\le C(1+|X|+|Y|+|Z|)^2$, and the nonsingleton bounds give a polynomial majorant for $s^r M_r$. Multiply by the Gaussian from (3). When $|\xi|$ is small but $\phi$ or $\eta$ is outside that neighborhood, the denominators $b_i$ stay uniformly away from zero for small $p$ since $|v_i|$ is near one. After the internal Gaussian integral the remaining tails are bounded by a polynomial in $s$ times $e^{-a's}$. At $|\xi|$ bounded away from zero, omit the at most $r$ marked factors and bound the original integrand by $2^r|Q|^{l-r}$; the exponential decay in $l$ dominates all rescaling powers. This justifies (4) inside the integral (2). After rescaling and multiplying by $(-1)^rs^r$, its limit apart from the positive Jacobian is the integral of $P_2(Y)^r$ times the positive Gaussian in (4). It is strictly positive, since $c\ge2$.

All possible subsequences of degree positions have now been treated. This proves (1). Differentiating the Bernstein expansion twice gives a positive combination of the second differences, including the one-sided endpoint values. The strict increase follows from $P_l'(0)=0$. The argument proves eventual inequalities under a particular enlargement, with no assumption on the initial matching sequence. The cited direct-sum paper addresses a different enlargement. Our searches of the Holens–Đoković, monotonicity, cloning and Kronecker-product literature do not establish independent priority for (1).

The [integer and rational replay](verify_uniform_clones.py) constructs all matching profiles by a clone-count recurrence and tests 90 marked-row coefficients against separate type-count polynomials. It also checks 150 strict second differences on connected and disconnected examples.
