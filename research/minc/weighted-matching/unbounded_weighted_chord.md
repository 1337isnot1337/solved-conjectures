# Lih–Wang convexity inequality

There is an absolute $`U<\infty`$ such that **every** doubly stochastic matrix $`A`$ with $`\|A-J\|_F^2\ge U`$ satisfies the strict half-chord inequality throughout $`0<t\le1/2`$. Here $`J_{ij}=1/n`$ and $`t`$ is the coefficient of $`A`$. The entries can have arbitrary weights. Thus any violations of [Minc C34](https://yair-lavi.com/mincs-list/conjecture-34/index.html) have bounded squared Frobenius norm, even across different orders. The [diffuse weighted theorem](../real-radius/diffuse_log_upper.md) also excludes all endpoints with sufficiently small maximum entry. Neither assertion supplies the conjecture in all orders.

Write $`d_n=n!/n^n`$, $`P(t)=\mathop{\mathrm{per}}((1-t)J+tA)/d_n`$, $`b=\sum a_{ij}^2=1+\|A-J\|_F^2`$ and $`q=b/n`$. We will prove $`\sup_{0\le t\le1/2}P(t)/P(1)\le e^{-c b}`$ for all sufficiently large $`b`$ and some absolute $`c>0`$.

## A bound from the maximum of a one-dimensional integrand

Let $`R(z)=\sum_m\sigma_m(A) z^m`$ be the weighted matching generating polynomial. Its zeros are negative real by the [Heilmann–Lieb theorem](https://doi.org/10.1007/BF01877590), and it has degree $`n`$ by the existence of a perfect matching. Write $`R(z)=\prod_{i=1}^n(1+z\lambda_i)`$, $`\lambda_i>0`$. For $`t>0`$, put $`v=t/(1-t)`$ and
```math
 L(y)=e^{-ny}((1-t)y)^n R(v/y)
     =e^{-ny}(1-t)^n\prod_i(y+v\lambda_i).
```
The gamma integral of the subpermanent expansion gives $`P(t)=n\int_0^\infty L(y)\,dy/d_n`$. Let $`y_*`$ be a maximum on the closed half-line. At an interior maximum the mean of $`1/(y_*+v\lambda_i)`$ is one, so $`y_*\le1`$; at a zero maximum the mean is at most one. Applying AM–GM to the ratios of the linear factors gives $`L(y)/L(y_*)\le e^{-n(y-y_*)}(1+y-y_*)^n`$. This holds to either side of an interior maximum and to the right of a boundary maximum. Integration from $`y_*-1`$ to infinity of the right-hand majorant gives $`e^n d_n/n`$. Consequently $`P(t)\le e^n L(y_*)`$, with no loss of a power of the order.

Define for $`0<s<1`$
```math
 F_A(s)=e^{ns}(1-s)^{2n}R\big(s/(1-s)^2\big).
```
For $`y>0`$ write $`s/(1-s)^2=v/y`$. Then
```math
 e^n L(y)=e^{nE_t(s)} F_A(s),\qquad E_t(s)=1-y-s+\log(t/s)\le0.               \tag{1}
```
Indeed $`y=v(1-s)^2/s`$, and differentiating in $`s`$ gives a unique maximum of $`E_t`$ at $`s=t`$ with value zero. The function $`F`$ is the [previously studied Poisson matching limit](../inequalities/hwang_substochastic_padding.md).

## Bounding the location when $`q\le2/9`$

For a weighted matching sampled with edge activities $`z a_{ij}`$, let $`x_i`$ be the probability row $`i`$ is unmatched and $`\bar x`$ its average. Its formula from $`R`$ is $`\bar x(z)=n^{-1}\sum_l(1+z\lambda_l)^{-1}`$, so $`z\bar x(z)`$ is increasing. The exact monomer recursion writes $`x_i=(1+z\sum_j a_{ij} x_{j\mid i})^{-1}`$, where $`x_{j\mid i}`$ is the unmatched probability of column $`j`$ after deleting row $`i`$. After any deletions every remaining monomer probability is at least $`1/(1+z)`$ by the same recursion and the row and column sums at most one. Applying this one level below column $`j`$ gives
```math
 x_{j\mid i}\le \phi(a_{ij}),\qquad
 \phi(a)=(1+z)/(1+2z-za).
```
The convex function $`\phi`$ lies below its chord between zero and one. Jensen's inequality for the reciprocal now gives
```math
 \bar x(z)\ge\frac{1+2z}{1+3z+(1+q)z^2}.                         \tag{2}
```
At positive $`y`$ the log derivative of $`L`$ is $`n(\bar x(v/y)/y-1)`$. By (2), $`\lim_{z\to\infty}z\bar x(z)\ge 2/(1+q)>1`$ if $`q<1`$, so the maximum is interior at $`v\le1`$. It satisfies $`z\bar x(z)=v`$. Thus $`z`$, and hence $`s`$, is largest for $`t=1/2`$. There $`z=1/y_*`$ and (2) implies $`y_*^2+2y_*+q-1\ge0`$. For $`q\le2/9`$ this gives $`y_*\ge1/3`$ and
```math
 s\le s_*=(7-\sqrt{13})/6 <0.566.                                  \tag{3}
```

## A dimension-free upper bound on the Poisson matching function

The following argument also works for an arbitrary nonnegative square or rectangular matrix $`D`$ with row and column sums at most one. Its Poisson matching function is
```math
 F_D(s)=e^{s\sum d_{ij}}\sum_M s^{|M|}\prod_{ij\in M}d_{ij}
             \prod_{i\text{ unmatched}}(1-sr_i)\prod_{j\text{ unmatched}}(1-sc_j)
```
where $`r_i,c_j`$ denote the margins. It agrees with (1)'s $`F_A`$ when the margins are one. To see its exact series, apply $`\prod_i(1-x_i\partial_{x_i})\prod_j(1-y_j\partial_{y_j})`$ to $`\exp(s\sum d_{ij}x_i y_j)`$ at all variables one. Expanding the exponential gives a sum over integer edge multiplicities $`m_{ij}`$, with weight $`\prod (s d_{ij})^{m_{ij}}/m_{ij}!`$ times $`\prod_v(1-\deg v)`$. Applying the row operators first gives the exponential times $`\prod_i(1-s\sum_jd_{ij}y_j)`$ at $`x=1`$. Each column operator either hits the exponential, leaving its monomer term, or differentiates one of the remaining row factors, matching that row with the column. This proves the identity, including its signs.

Let $`X`$ be a centered two-point variable with values $`a=1+\sqrt2`$ and $`-1/a`$, with probability $`1/(1+a^2)`$ at $`a`$. Its first moments are $`1,0,1,2`$, and $`\mathbb E X^d=2\mathbb E X^{d-1}+\mathbb E X^{d-2}`$ for $`d\ge2`$. These moments dominate $`|1-d|`$ at every nonnegative integer $`d`$. Use independent copies $`X_i`$ to bound the absolute row factors termwise and sum the absolute column factors exactly. This gives
```math
 F_D(s)\le \mathbb E\prod_j m(s(D^T X)_j),\qquad m(z)=2+(z-1)e^z .
```
Interchange of the series and expectation is legitimate since $`X`$ is bounded and all exponential series with polynomial degree weights converge absolutely. In particular $`m(z)\ge1`$ for real $`z`$.

For every real $`z`$, $`m(z)\le\exp(\alpha z^2/2)`$ for $`\alpha=7/5`$. For $`z\le0`$ integrate $`m'(z)=ze^z`$ to get $`m(z)\le1+z^2/2`$. On the positive half-line the derivative of the difference between the proposed majorant and $`m`$ has the sign of $`\alpha z^2/2-z+\log\alpha`$. If that quadratic has roots, the only possible minimum other than zero is the larger root $`z_+`$. It is less than $`89/100`$, since the quadratic is increasing beyond $`5/7`$ and positive at $`89/100`$. At the root the difference is $`(12/7-z_+)e^{z_+}-2>0`$, since the first term decreases for $`z>5/7`$ and $`(12/7-89/100)e^{89/100}>2`$. The elementary numerical inequalities here and below can be bounded by convergent rational series as in the checker.

Write $`M_X(z)=\mathbb E e^{zX}`$. For $`z\le0`$, $`(\log M_X)''(z)\le1`$ because its Bernoulli tilted probability for the positive atom decreases below its initial value, which is below $`1/2`$. Thus $`\log M_X(z)\le z^2/2`$ there. For all real $`z`$, the [Kearns–Saul Bernoulli bound](https://arxiv.org/abs/1405.4496) gives $`\log M_X(z)\le\kappa z^2/2`$, $`\kappa=\sqrt2/\log(1+\sqrt2)<1.61`$.

Introduce a standard real Gaussian vector $`G`$ to linearize the quadratic majorant $`\exp(\alpha s^2\|D^TX\|^2/2)`$. Integrating out the independent $`X_i`$ leaves $`\mathbb E\prod_i M_X(s\sqrt\alpha(DG)_i)`$. Put $`d_i=(DD^T)_{ii}`$. The matrix $`DD^T`$ is at most the identity in the positive semidefinite order by the substochastic margins. By [Gaussian Hölder](https://arxiv.org/abs/1306.2410) with exponents $`1/d_i`$ (omit zero rows), the logarithm is at most
```math
 \sum_i d_i\log\mathbb E\big[M_X(s\sqrt{\alpha d_i}\,g)^{1/d_i}\big],\qquad g\sim N(0,1).  \tag{4}
```
Using the appropriate quadratic bound on each half of the real line in the last expression gives
```math
 \log F_D(s)\le\|D\|_F^2\log\left(\frac1{2\sqrt{1-\alpha s^2}}+
                                  \frac1{2\sqrt{1-\alpha\kappa s^2}}\right)
              \le0.49\|D\|_F^2\qquad(0\le s\le0.566).
```
Apply this to (1) at the maximum allowed by (3). The [multicolumn lower bound](all_regular_chords.md) gives $`\log P(1)\ge (b-1)/2-\tfrac12\log b-O(1)`$. For $`q\le2/9`$ this yields the required exponential gap as $`b\to\infty`$.

## A direct column bound when $`q\ge2/9`$

At a given $`y\ge0`$ let each row independently propose a column with probability $`p=t/[t+(1-t)y]`$ and choose it with weights $`a_{ij}`$. Then $`L(y)=e^{-ny}[t+(1-t)y]^n`$ times the probability that no column receives more than one proposal. The column loads are negatively associated, so the latter probability is at most the product of the individual probabilities of load at most one. Negative association holds already for the one-hot indicators of each row (for disjoint coordinate sets the two positive increments from their zero configurations cannot both occur), is preserved by independent products and by taking disjoint increasing sums, and also bounds products of nonnegative decreasing functions. [Dubhashi and Ranjan](https://tidsskrift.dk/brics/article/view/20006)

For any column probabilities $`a_i`$ of sum one put $`q_j=\sum_i a_i^2`$. Its load is a sum of independent Bernoulli variables of means $`pa_i`$. We claim its probability $`H`$ of being at most one satisfies $`\log H\le-(1-q_j)(p-\log(1+p))`$. For $`p<1`$ write $`b_i=a_i/(1-pa_i)`$ and $`S=\sum b_i`$. Differentiate $`H=\prod_i(1-pa_i)(1+p S)`$ to obtain
```math
 -(\log H)'=p\sum_{i\ne j} b_i b_j/(1+p S).
```
Expanding $`b_i=a_i+(b_i-a_i)`$ gives $`\sum_{i\ne j} b_i b_j\ge 1-q_j+2\sum_i(b_i-a_i)(1-a_i)\ge(1-q_j) S`$. The last step uses $`q_j\ge a_i^2`$ and $`2(1-a_i)\ge1-a_i^2`$. Since $`S\ge1`$, integration proves the bound through $`p=1`$ by continuity. Summing over columns gives, at any $`p\in(0,1]`$,
```math
 n^{-1}\log(e^n L(y))\le
 1-v(1/p-1)+\log(v/(1+v))-\log p-(1-q)(p-\log(1+p)).            \tag{5}
```
For $`0<v\le1`$ the maximum in $`p`$ is given by $`v=p+(1-q)p^3/(1+p)`$, by differentiation, with $`p=1`$ allowed at $`q=v=1`$. The maximized bound increases with $`v`$: the partial derivative is $`1/[v(1+v)]-(1/p-1)\ge0`$. For the inequality use $`v\le p+p^3/(1+p)`$ and expand. The needed inequality is $`1/(1-p)\ge(1+2p)/(1+p)+p^3/(1+p)^2`$, which follows by subtraction for $`0<p<1`$. Therefore it suffices to take $`v=1`$. There $`p^2+(1-q)p^3=1`$. Denote the value by $`U(q)=2-1/p-\log(2p)-(1-q)(p-\log(1+p))`$.

The Schrijver–Bethe lower bound gives $`n^{-1}\log(e^n\mathop{\mathrm{per}}A)\ge h(q)`$, where $`h(q)=1+(1-q)\log(1-q)/q`$ and $`h(1)=1`$. Indeed average $`h(a_{ij})`$ with weights $`a_{ij}/n`$ and use convexity, immediate from its positive power series $`h(x)=\sum_{l\ge1}x^l/[l(l+1)]`$. [Gurvits's weighted lower bound](https://arxiv.org/abs/1106.2844) We have $`h'(q)\ge1/2`$, whereas $`U(q_2)-U(q_1)\le(1-\log2)(q_2-q_1)`$ for $`q_2\ge q_1`$ by (5). At $`q=2/9`$, the root is between $`0.78749`$ and $`0.78751`$, and $`h(q)>0.1203`$, $`U(q)<0.1153`$. The difference therefore stays above $`0.005`$ on the whole high-$`q`$ range. Combining with the integral bound and $`\log(e^n d_n)=O(\log n)`$ gives the desired exponential gap as $`n\to\infty`$ here.

Finally, if $`E=e^{-cb}`$ bounds the endpoint ratio, then $`P(t)\le E P(1)<1-t+tP(1)`$ for $`E\le t\le1/2`$. For $`0<t<E`$, the segment up to $`E`$ lies in the [uniform strict-convexity ball](../nov20-independent/inequalities/uniform_radial_permanent.md) since $`E\sqrt{b-1}\to0`$. Its chord to $`E`$ lies strictly below the target line in this open interval. This proves the claimed uniform large-distance theorem.

The ingredients screened in the source audit included Lih and Wang, McCullagh, the Davies–Jenssen–Perkins–Roberts upper matching theorem for regular simple graphs, monomer recursions and weighted matching partition functions, balls-in-bins negative dependence, and the two Gaussian and Bernoulli inequalities cited above. This is a partial result with no assertion of external review.

The [rational replay](verify_weighted_chord.py) checks the analytic constants and 96 exact matching recursions and column-collision bounds. It is separate from the asymptotic argument.
