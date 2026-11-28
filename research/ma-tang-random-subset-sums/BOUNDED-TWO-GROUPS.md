# Random subset sums in 2-groups with bounded nonelementary part

In the [Ma–Tang mixed-group example](ma-tang-subset-sum-threshold.md), a fixed odd factor next to a large elementary abelian 2-group forces an additional $`\log_2\log N`$ samples for coverage and equidistribution. A fixed abelian 2-group factor behaves differently.

**Theorem.** Fix a finite abelian 2-group $`H`$ and $`G_d=\mathbb F_2^d\times H`$ of order $`N`$. For any fixed $`0<\epsilon<1`$, a uniformly chosen $`k`$-element subset of $`G_d`$ has, simultaneously for all $`g\in G_d`$, a number of subset sums representing $`g`$ within relative error $`\epsilon`$ of $`2^k/N`$, with probability tending to one, if
```math
 k\ge\log_2 N+\omega(1).
\tag{1}
```
Here $`\omega(1)`$ can be any function tending to infinity. Conversely, success probability cannot tend to one for bounded $`k-\log_2 N`$, even just for coverage. The statements are uniform over finite abelian 2-groups with $`|2G_d|`$ bounded by an absolute constant.

## 1. Binary kernel and characters of the residual group

Take independent uniform samples first; at $`k=O(\log N)`$ collisions among the samples have probability $`o(1)`$. Both coverage and equidistribution are monotone when samples are appended, so it suffices to take
```math
 k=d+e+r,\qquad e=\dim_{\mathbb F_2}(H/2H),\quad r\to\infty,\quad r\le\log\log d,
```
with $`r`$ growing as slowly as is needed in (1). The quotient $`G_d/2G_d`$ is $`\mathbb F_2^{d+e}`$. Its projected sample columns define a uniform binary matrix $`A`$ with $`k`$ columns, and $`A`$ has full row rank with probability at least $`1-2^{-r}`$. In that case its kernel $`K`$ is a uniform $`r`$-dimensional binary subspace and can be parameterized by the map
```math
 t\mapsto(\ell_j\cdot t)_{j=1}^k
```
with independent uniform $`\ell_j\in\mathbb F_2^r`$, conditioned on this map being injective. Given $`K`$, the rows of $`A`$ are a uniform ordered basis of $`K^\perp`$. If $`2H=0`$, the quotient is the whole group and full rank gives exactly equal counts. Assume $`2H\ne0`$.

Let $`\chi`$ be any nontrivial character of $`2H`$ and extend it to a character of $`H`$ of order $`2^b`$, with $`b\ge2`$. Such extension exists by the decomposition of $`H`$ into cyclic groups, or the usual character extension theorem. Write its value on the $`j`$-th sample's $`H`$-coordinate as $`\exp(2\pi i z_j/2^b)`$, where $`z_j\in\mathbb Z/2^b`$. The vector $`c=(z_j\bmod2)_{j=1}^k`$ is a fixed nonzero binary linear combination of the $`e`$ quotient rows for $`H/2H`$. Given $`K`$ it is therefore uniform on $`K^\perp\setminus\{0\}`$.

For a fixed quotient fiber represented by $`u\in\mathbb F_2^k`$, its choice vectors are $`u+K`$ using binary addition. Relative to the sum at $`u`$, the character at the choice indexed by $`t`$ equals
```math
 F_u(t)=\exp\left(\frac{2\pi i}{2^b}
    \sum_{j=1}^k z_j(-1)^{u_j}(\ell_j\cdot t\bmod2)\right).
\tag{2}
```
Indeed, replacing the bit $`u_j`$ by $`u_j+\ell_j\cdot t\bmod2`$ changes its integer value by $`(-1)^{u_j}(\ell_j\cdot t\bmod2)`$. The full difference of the group sums lies in $`2H`$, so this phase uses precisely the chosen character on $`2H`$.

## 2. The top derivative is independent of the fiber

A single binary linear function $`f(t)=\ell\cdot t\bmod2`$, viewed as integer-valued, has additive derivative zero in any direction $`h`$ with $`\ell\cdot h=0`$. If $`\ell\cdot h=1`$, its derivative is $`(-1)^{f(t)}`$. When all $`b`$ chosen directions evaluate to one, its $`b`$-fold derivative is $`(-2)^{b-1}(-1)^{f(t)}\equiv2^{b-1}\pmod{2^b}`$. Consequently the $`b`$-fold multiplicative derivative of (2) is
```math
 (-1)^{\sum_j c_j\prod_{i=1}^{b}(\ell_j\cdot h_i)}.
\tag{3}
```
It does not depend on $`u`$ or the base point $`t`$. The $`2^b`$-th power of the Gowers $`U^b`$ norm of $`F_u`$ is the average over $`h_1,\ldots,h_b`$ of (3). By repeated Cauchy–Schwarz it is nonnegative and bounds $`|\mathbb E_t F_u(t)|^{2^b}`$. Thus the same nonnegative upper bound holds for all fibers $`u`$.

## 3. Randomness of the higher derivative

Use the unconditioned model of independent $`\ell_j\in\mathbb F_2^r`$ and independent fair bits $`c_j`$, then condition on $`\mathrm{rank}(\ell_1,\ldots,\ell_k)=r`$, $`\sum_j c_j\ell_j=0`$ and $`c\ne0`$. The resulting joint law is the one above, since every full rank column matrix has the same number $`2^{k-r}-1`$ of nonzero null vectors.

For all nonempty $`S\subseteq[r]`$ with $`|S|\le b`$, consider the coordinates
```math
 M_S=\sum_j c_j\prod_{a\in S}\ell_{j,a}\in\mathbb F_2.
```
The joint vector has $`D=O_b(r^b)`$ coordinates, and before conditioning its total variation distance from uniform is $`\exp(-\Omega_b(k)+O_b(r^b))`$. In fact any nonzero dual vector gives a nonzero multilinear Boolean polynomial $`P`$ of degree at most $`b`$. Such $`P`$ equals one on at least $`2^{-b}`$ of the cube: choose a highest-degree monomial, and for each fixed assignment of the other variables the sum mod 2 over that monomial's variables equals one. Since $`c_j`$ is a fair bit, the Fourier coefficient from the $`j`$-th summand is $`\Pr(P(\ell_j)=0)\le1-2^{-b}`$. Independence raises it to the $`k`$-th power. Sum the Fourier bounds over at most $`2^D`$ characters to obtain the total variation estimate.

The condition $`\sum_j c_j\ell_j=0`$ fixes the $`r`$ degree-one moment slots to zero. Conditional total variation still tends to zero exponentially fast, since the conditioning event has probability comparable to $`2^{-r}`$. The excluded rank failure and $`c=0`$ have prior probabilities at most $`2^{r-k}`$ and $`2^{-k}`$, respectively, so are still $`o(1)`$ after this conditioning. Hence in the actual model the higher moments are within $`o(1)`$ total variation of independent uniform bits, with linear moments zero.

For linearly independent directions $`h_1,\ldots,h_b`$, the Boolean polynomial $`\prod_i(\ell\cdot h_i)`$ has degree exactly $`b`$. After an invertible linear change of coordinates it is the product of the first $`b`$ coordinate functions; degree cannot decrease under an invertible linear change, since both it and its inverse weakly decrease degree. It therefore contains a nonzero higher-degree moment coefficient, so the ideal conditional expectation of (3) is zero. The probability that independent uniform directions $`h_i`$ are linearly dependent is $`O_b(2^{-r})`$. This proves
```math
 \mathbb E_{\rm sample}\|F_u\|_{U^b}^{2^b}
 \le O_b(2^{-r})+o(1),
```
with a bound independent of $`u`$, and even with the random norm itself independent of $`u`$. Markov implies all fiber biases tend to zero in probability. There are finitely many characters $`\chi`$ to check, since $`H`$ is fixed.

Within every first-coordinate quotient fiber, Fourier inversion in $`2H`$ now shows that its $`2^r`$ subset choices are equidistributed among the $`|2H|`$ residual possibilities, with relative error tending to zero in probability uniformly over fibers. Since $`2^r/|2H|=2^k/N`$, this proves the upper claim. The index-$`k`$ sample model transfers to uniform subsets by conditioning on distinctness, as above.

For the converse, the probability of full rank of the $`(d+e)\times k`$ uniform binary matrix is
```math
 \prod_{i=0}^{d+e-1}(1-2^{i-k})
 \le 1-2^{d+e-1-k}
```
when $`k\ge d+e`$, and zero otherwise. If $`k-\log_2N`$ is bounded above, this probability stays bounded away from one, while a missing quotient element forces failure of coverage. This also transfers to uniform subsets. Finally any finite abelian 2-group decomposes as $`\mathbb F_2^d\times H`$ with $`H`$ having no order-two cyclic factors; if $`|2G_d|\le J`$, then $`|H|\le J^2`$. There are only finitely many such $`H`$, giving the stated uniformity.

The case $`H=0`$ (elementary abelian 2-groups) is classical; see Erdős–Hall, *Some new results in probabilistic group theory* (1978), [Theorem 3](https://users.renyi.hu/~p_erdos/1978-45.pdf). The assertion here is the contrast for bounded non-elementary 2-group factors, not the already known elementary case.

## Consequence: a fixed-factor dichotomy

Combining this theorem with the mixed odd-factor obstruction and the universal exponential-potential upper bound gives a dichotomy for $`G_d=\mathbb F_2^d\times H`$ with any fixed finite abelian group $`H`$. If $`H`$ is a 2-group, there is no second-order $`\log\log N`$ cost. If $`H`$ has nontrivial odd-order part, the sharp second-order coefficient is $`1/\log2`$, for either high-probability coverage or high-probability pointwise $`\epsilon`$-equidistribution. Indeed the projection to the direct product with its odd-order part transfers the odd-factor failure of coverage (iid samples remain iid uniform after the projection), and the order of that quotient differs from $`N`$ by a fixed factor. The bounded-remainder lower bound transfers for every such odd part, with constants depending on $`H`$, by the prime-quotient argument in §4 of the [bounded-error note](ma-tang-subset-sum-threshold-bounded-error.md).

## Exact critical window for the cyclic factor of order four

For $`H=\mathbb Z/4\mathbb Z`$ take $`k=d+1+r`$ with $`r\ge0`$ fixed. Conditional on full row rank of the binary quotient map, the second-order moment slots $`M_{\{a,b\}}`$, $`a<b`$, in §3 tend to independent fair bits even for fixed $`r`$. Let $`Q`$ be the alternating $`r\times r`$ matrix whose upper off-diagonal entries are these moments. The binary Fourier bias analysis simplifies to an exact formula.

In a quotient fiber represented by $`u`$, the difference from its sum at $`u`$ is an even residue modulo four. Write $`q_u(t)\in\mathbb F_2`$ for its half. Use
```math
 (\ell\cdot t\bmod2)
 =\sum_a\ell_at_a-2\sum_{a\lt b}\ell_a\ell_bt_at_b\pmod4
```
in (2) before exponentiating. The linear coefficients of the numerator are even because $`\sum_j c_j\ell_j=0`$, and the resulting $`q_u`$ has quadratic coefficients $`Q_{ab}`$, independent of $`u`$. Flipping $`u_j`$ changes its linear part by $`c_j\ell_j`$. With probability $`1-o(1)`$, the $`\ell_j`$ with $`c_j=1`$ span all of $`\mathbb F_2^r`$, because in the independent-column model every pattern $`(c_j,\ell_j)=(1,v)`$ occurs with probability tending to one for fixed $`r`$, and conditioning has probability bounded away from zero. Hence as $`u`$ varies across representatives (allowing repeated representations of the same fiber), every linear form occurs.

For any quadratic Boolean form with polar matrix $`Q`$, the largest absolute bias over all its linear shifts is $`2^{-\mathop{\mathrm{rank}}(Q)/2}`$. Indeed, square the bias and average over the difference of the two arguments; orthogonality leaves only directions in $`\ker Q`$. On $`\ker Q`$ the derivative signs are a character, so the squared bias is either zero or $`|\ker Q|/2^r`$. At least one shifted bias is nonzero by Parseval. Thus, conditional on full quotient rank, the maximal relative representation-count error over all of $`G_d`$ equals $`2^{-\mathop{\mathrm{rank}}(Q)/2}`$ with probability $`1-o(1)`$. In particular coverage succeeds exactly when $`Q\ne0`$, up to an event of probability $`o(1)`$: nonzero rank makes the error strictly less than one, while zero rank gives a fiber whose two residual values are not both attained.

The unconditional limiting coverage probability is therefore
```math
 \left(\prod_{j=r+1}^{\infty}(1-2^{-j})\right)
 \left(1-2^{-\binom r2}\right).
```
For $`r=2`$ this is strictly below $`1/2`$. For $`r=3`$ it is at least $`(1-\sum_{j\ge4}2^{-j})(1-2^{-3})=(7/8)^2>1/2`$. Thus the least number giving coverage probability at least $`1/2`$ for this particular group is exactly $`d+4=\log_2 N+2`$ for all sufficiently large $`d`$. This value does not concern the worst group of the same order.
