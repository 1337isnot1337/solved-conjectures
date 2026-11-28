# Lih–Wang convexity inequality

**There exists an integer $`n_0`$ such that Lih–Wang's inequality holds for every doubly stochastic matrix in every order $`n\ge n_0`$.** It is strict away from the uniform matrix and the uniform endpoint on the required half-segment. The argument gives no effective $`n_0`$. The [catalogue conjecture](https://yair-lavi.com/mincs-list/conjecture-34/index.html) still requires every finite order. Its order-three midpoint equality also prevents carrying the large-order strictness statement over verbatim.

We combine the [uniform large-distance theorem](unbounded_weighted_chord.md) with a bound on every substochastic core, including concentrated and nonsymmetric ones. The core estimate is quantitative and applies in all dimensions.

## The Poisson matching function

For any nonnegative square matrix $`D`$ with margins at most one, use the function $`F_D`$ in the large-distance theorem. Write
```math
 H(D)=\sum_{ij}[d_{ij}+(1-d_{ij})\log(1-d_{ij})],\qquad b=\|D\|_F^2 .
```
Then $`\log F_D(1)\ge H(D)`$ and for $`0\le t\le1/2`$,
```math
 \log F_D(t)\le 2t^2 H(D)-\tfrac1{250}t^2 b.                     \tag{1}
```
For the lower bound, apply the [multicolumn estimate](../nov20-independent/inequalities/explicit_eventual_zero_diagonal.md) to the [doubly stochastic completion](../inequalities/hwang_substochastic_padding.md) of $`D`$ of order $`m+M`$, selecting its $`m`$ distinguished columns. Normalize by $`d_{m+M}=(m+M)!/(m+M)^{m+M}`$. The omitted factor $`d_M/d_{m+M}`$ tends to $`e^m`$. In a distinguished column of sum $`c_j`$ on the core, the $`M`$ other entries are $`(1-c_j)/M`$, whose total contribution to the log bound tends to $`-(1-c_j)`$. The completion's normalized permanent tends to $`F_D(1)`$ by the exact matching expansion. This gives the lower bound, including saturated margins. Rectangular inputs can also be padded with zero rows or columns.

For the upper bound use the moment argument of the [large-distance theorem](unbounded_weighted_chord.md), now with $`X`$ supported on $`a=29/12`$ and $`-1/a`$ and centered by masses $`144/985,841/985`$. Its variance is one and $`a-1/a>2`$, so the moment recurrence again dominates all $`|1-j|`$. Use $`\alpha=36/25\ge7/5`$ in the bound on $`2+(z-1)e^z`$. Before the last Gaussian integral in that argument we have
```math
 F_D(t)\le \mathbb E_X\exp(\alpha t^2\|D^T X\|^2/2).
```
The log on the right is convex as a function of $`t^2`$ and vanishes at zero, so on this interval it is at most $`4t^2`$ times its value at $`t=1/2`$. By Gaussian Hölder that last value is at most $`\sum_i d_i\log I(\sqrt{d_i})`$, for $`d_i=\sum_j d_{ij}^2`$ and
```math
 I(w)=\mathbb E\big[M_X(3wg/5)^{1/w^2}\big],\qquad g\sim N(0,1).
```
The following uniform scalar bound is certified below:
```math
 \log I(w)\le\tfrac14+w^2/12-1/1000\qquad(0\lt w\le1).              \tag{2}
```
In a substochastic row, Cauchy–Schwarz gives $`d_i^2\le(\sum_j d_{ij})(\sum_j d_{ij}^3)\le\sum_j d_{ij}^3`$. Finally $`x+(1-x)\log(1-x)\ge x^2/2+x^3/6`$ by the positive series. Substitution yields (1).

### Scalar certificate

The [standalone certificate](verify_poisson_chord.py) uses integer rectangular sums for one scalar integral, independently of any matrix dimension. Here are the error bounds needed to reproduce it. Put $`K(z)=\log M_X(z)/z^2`$ with $`K(0)=1/2`$. The formula
$`K(z)=\int_0^1(1-s)(\log M_X)''(sz)\,ds`$ implies $`|K'|<1/2`$. Indeed the third derivative of the log moment generating function is $`(a+1/a)^3 p(1-p)(1-2p)`$ at a tilted Bernoulli probability $`p`$. The absolute value of the Bernoulli factor is at most $`1/8`$ (its maximum is $`1/(6\sqrt3)`$). Integrating $`s(1-s)`$ gives the claim. Also $`0\le K\le (a+1/a)^2/8<1.01`$ by the same second-derivative formula and the variance bound for a Bernoulli variable.

The Gaussian integrand including its density is $`(2\pi)^{-1/2}\exp(-g^2[1/2-(9/25)K(3wg/5)])`$. Partition $`w\in[0,1]`$ and $`|g|\in[0,12]`$ into cells of width $`1/512`$, keeping the two signs. At the center of each rectangle round $`3wg/5`$ to the nearest multiple of $`1/512`$. The change in $`K`$ anywhere in the rectangle is less than $`1/200`$, since it is at most $`\tfrac12[(3/5)(12+1)/1024+1/1024]`$. The grid values of $`K`$ are rounded upwards to millionths using 40-digit decimal upper endpoints. Each call to correctly rounded exponential or logarithm is enlarged by one representable unit, and the intervening arithmetic rounds upward. All divisors in these operations are positive and exact. The table entry at zero uses its exact value. [Python Decimal operations](https://docs.python.org/3/library/decimal.html#decimal.Decimal.exp)

For the exponential at the worst point of the rectangle use the smallest $`|g|`$ and the upper bound on $`K`$. Round its nonnegative decay exponent downward to a multiple of $`1/4096`$. For index $`j`$ approximate $`e^{-j/4096}`$ from above by the recursion $`U_0=10^9`$, $`U_{j+1}=\lceil4096U_j/4097\rceil`$, in billionths; $`4096/4097\ge e^{-1/4096}`$. Multiply by the upper normalizing constant $`399/1000`$. Both omitted tails together cost less than $`10^{-7}`$ by $`K<1.01`$ and the elementary Gaussian tail estimate $`\int_{12}^\infty e^{-cx^2}dx\le e^{-144c}/(24c)`$. For each $`w`$ interval use the first seven nonnegative exponential Taylor terms at its lower endpoint to bound the right side of (2) after exponentiation from below. The certificate checks all 512 final comparisons as rational inequalities; the least slack exceeds $`4908/10^6`$. It uses the standard Python library.

## All asymptotic regimes

Write $`B=A-J`$, $`u=\|B\|_F^2`$, $`P_n(B)=\mathop{\mathrm{per}}(J+B)/d_n`$. Suppose a sequence of violating or non-strict nonuniform matrices has orders tending to infinity. The [large-distance theorem](unbounded_weighted_chord.md) bounds $`u`$. If $`u\to0`$ along a subsequence, strict convexity on the [uniform local ball](../nov20-independent/inequalities/uniform_radial_permanent.md) excludes it. Thus pass to $`0<c\le u\le C`$. The [Frobenius stability bound](../nov20-independent/inequalities/uniform_frobenius_stability.md) implies $`P_n(B)\ge1+c'`$ for a fixed $`c'>0`$. Uniform coefficient bounds for centered matrices of bounded Frobenius norm and operator norm at most one give $`|P_n(tB)-1|\le K t^2`$ for $`0\le t\le1/2`$. [Coefficient bound, equation (2)](../real-radius/hilbert_schmidt_limit.md) In particular arbitrarily small positive $`t`$ cannot violate the chord. If $`P_n(B)\to\infty`$ the same bound excludes the entire half-interval. We may therefore suppose $`P_n(B)`$ bounded and the coefficients of the alleged violations converge to $`t\in(0,1/2]`$.

We spell out how to use the [localized/diffuse factorization](../combinatorial/positive_density_integrality.md). Its splitting and factorization proof needs only double stochasticity, a bounded Frobenius norm and a bounded normalized endpoint permanent. Integrality is used later in that paper. Independently sort rows and columns by decreasing Euclidean norm and pass to their coordinatewise limit $`L`$, a nonnegative substochastic square-summable infinite matrix. Such permutations preserve the whole permanent path. If needed take a subsequence throughout. Averaging outside a slowly growing principal square gives a centered matrix $`H_n`$ converging in Frobenius norm to $`L`$ after padding by zeros. Averaging instead within that square gives a centered $`D_n`$ whose largest row and column norms tend to zero. The two-class permutation entropy and cut estimate in that proof shows $`\|D_n\|_{\rm op}\le\rho<1`$ along this subsequence, using the bounded endpoint. It also proves, uniformly for $`0\le z\le1`$,
```math
 P_n(zB)=P_n(zH_n)P_n(zD_n)+o(1).
```
Indeed the cited proof factors fixed coefficients by separating the index sets of the connected test graphs. Its tail estimate is uniform on a disk of radius greater than one: approximate the localized part by a fixed finite centered matrix and use bounded polynomial degree in that part. The same proof works when the localized limit vanishes, with the finite centered approximation taken to be zero. Both factors are paths of genuine doubly stochastic matrices and are at least one.

For clarity, (1) passes to the localized factor even when $`L`$ has infinitely many nonzero rows. For fixed $`m`$, let $`H_{n,m}`$ be the centered stochastic completion of the first $`m`$ rows and columns of $`L`$ in order $`n`$. As $`n\to\infty`$ with $`m`$ fixed this converges in Frobenius norm to the padded truncation $`L_m`$, and $`P_n(zH_{n,m})\to F_{L_m}(z)`$ uniformly on $`[0,1]`$ by the finite matching expansion for padding. Also
```math
 \lim_{m\to\infty}\limsup_{n\to\infty}\sup_{0\le z\le1}
 |P_n(zH_n)-P_n(zH_{n,m})|=0 .
```
To verify the uniformity, choose a single fixed finite centered matrix $`K`$ approximating $`L`$ to Frobenius error below $`1/8`$ as in the cited factorization. It approximates all sufficiently large truncations of $`L`$ to error below $`1/4`$. For all sufficiently large $`n`$ (allowed to depend on $`m`$), the two remainders after subtracting $`K`$ then have norm below $`1/2`$. The same finite-degree-in-$`K`$ argument uniformly bounds both series on a fixed disk of radius larger than one, with constants independent of $`m`$. In each fixed coefficient the difference is bounded by a constant times $`\|H_n-H_{n,m}\|_F`$ by the centered graph expansion and Hölder. Its iterated limit is zero. Truncating the uniformly bounded analytic series proves the display. Thus, along $`t_n\to t`$, (1) implies $`\log P_n(t_n H_n)\le 2t_n^2\log P_n(H_n)+o(1)`$.

For the diffuse factor the [determinant approximation](../real-radius/hilbert_schmidt_limit.md) gives $`\log P_n(t_n D_n)\le t_n^2\log P_n(D_n)+o(1)`$, since the positive logarithmic determinant series starts in degree two. Combining the factors and $`2t_n^2\le t_n`$ yields $`P_n(t_n B)\le P_n(B)^{t_n}+o(1)`$. But $`1-t_n+t_n P_n(B)-P_n(B)^{t_n}`$ stays bounded away from zero: $`P_n(B)`$ ranges in a compact subinterval of $`(1,\infty)`$ and $`t_n\to t\in(0,1)`$. This contradiction proves the theorem.

The scalar certificate verifies an inequality used at all orders. It does not enumerate matrix orders or verify the remaining finite orders. Prior convexity results and the Poisson completion against which the comparison was checked are cited above; no independent priority or external proof review is claimed.
