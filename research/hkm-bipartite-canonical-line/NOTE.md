# A Jacobi-tail criterion for the complete-bipartite canonical-line conjecture

Let $`E_{a,b}`$ be the Ehrhart polynomial of the symmetric edge polytope of $`K_{a+1,b+1}`$, where $`0\le a\le b`$ and $`d=a+b+1`$. We consider the assertion that all roots of $`E_{a,b}`$ have real part $`-1/2`$. This survives the refutation of the broader complete-multipartite assertion and is explicitly stated in [Michałek, *Symmetric edge polytopes*, Oberwolfach Report 43/2019, p. 2710](https://publications.mfo.de/bitstream/handle/mfo/3791/OWR_2019_43.pdf?isAllowed=y&sequence=1). The [original HKM paper](https://arxiv.org/pdf/1612.07538#page=12) proved the property for smaller part sizes at most 3. [Kölbl, Theorem 3.3(e)](https://arxiv.org/html/2404.02136#S3), gives a conditional implication for the next bipartite size; Remark 4.7 explains the failure of straightforward higher-dimensional sign induction. The $`h^*`$-real-rootedness theorem in [Higashitani–Jochemko–Michałek, Thm. 4.8](https://arxiv.org/html/1807.07678#S4) is not the assertion about the Ehrhart polynomial itself.

**Results.** We obtain an exact all-parameter Jacobi-tail criterion, verify its first bridge is always positive, and give a symbolic certificate for all $`b\ge a`$ if $`a\le14`$ (equivalently, smaller graph part at most 15), with simple zeros on the canonical line. For arbitrary $`a,b`$, at least $`b-a+1`$ distinct roots lie on the line with odd multiplicity. The bounded-width verification treats infinitely many graphs but is not a resolution of the unrestricted complete-bipartite assertion.

## 1. The cross-polynomial expansion

Let $`\mathcal C_j(z)`$ be the Ehrhart polynomial of the cross-polytope in dimension $`j`$. Define
```math
q_j(x)=i^{-j}\mathcal C_j((ix-1)/2),\qquad p_j=j!q_j.
```
These are polynomials over the reals; $`p_0=1,p_1=x`$, and
```math
p_{j+1}=xp_j-j^2p_{j-1}.
\tag{1}
```
This follows immediately from the cross-polytope recurrence, for example [Kölbl, Prop. 1.11](https://arxiv.org/html/2404.02136#S1).

Write
```math
C_i=4^{-i}\binom{2i}{i}\binom ai\binom bi,\qquad
H_j=\sum_{i=j}^a\binom ij C_i.
```
The $`h^*`$-formula in [Higashitani–Jochemko–Michałek, Thm. 4.1](https://arxiv.org/html/1807.07678#S4) and the cross-degree expansion in [Kölbl, Prop. 4.3](https://arxiv.org/html/2404.02136#S4) give
```math
Q(x):=i^{-d}E_{a,b}((ix-1)/2)=\sum_{j=0}^a H_jq_{d-2j}(x).
\tag{2}
```
Indeed the $`j`$-th coefficient in the unrotated cross expansion is $`(-1)^jH_j`$; rotation contributes another factor $`(-1)^j`$. Directly, substitute $`u=(1+t)/(1-t)`$ into $`h^*(t)/(1-t)^{d+1}`$ and use $`t/(1+t)^2=(1-u^{-2})/4`$ to obtain the same expansion.

## 2. An unconstrained root-count bound

For an integer $`D`$, let $`J_{D+1}`$ be the real symmetric tridiagonal matrix of size $`D+1`$ with zero diagonal and successive off-diagonal entries $`1,2,\ldots,D`$. Its spectral measure at the first unit vector has $`D+1`$ distinct support points of positive weights: the eigenvector recurrence determines any eigenvector from its first coordinate, which cannot be zero. Equation (1) gives $`p_j(J_{D+1})e_1=j!e_{j+1}`$ for $`0\le j\le D`$. Thus the $`p_j`$, $`j\le D`$, are mutually orthogonal for that positive measure.

With $`D=d`$, (2) is orthogonal to all real polynomials of degree less than $`d-2a`$. If $`Q`$ had fewer than $`d-2a`$ distinct real roots of odd multiplicity, multiplying $`Q`$ by the product of the corresponding monic linear factors would give a constant-sign polynomial. It would be nonzero on at least one support point, since $`Q`$ has degree $`d`$ and every root of the multiplier is already a root of $`Q`$. This contradicts orthogonality. Therefore $`Q`$ has at least $`d-2a=b-a+1`$ such real roots. The same proof applies to any palindromic Ehrhart numerator of cross-degree $`a`$, and does not require $`\gamma`$-positivity.

## 3. A short Jacobi tail

For $`a\ge1`$, use (1) forward and backward about $`p_{b+1},p_b`$ to express the monic normalization of (2) as
```math
P(x):=\frac{d!}{H_0}Q(x)=A(x)p_{b+1}(x)-B(x)p_b(x).
\tag{3}
```
Specify this pair by starting the two-component recurrence at $`p_{b+1}\leftrightarrow (1,0)`$ and $`p_b\leftrightarrow (0,1)`$, not by unrestricted polynomial division. Tracking degrees and the parity in (1) gives $`A`$ monic of degree $`a`$ and parity $`a`$, and $`B`$ of degree at most $`a-1`$ and parity $`a-1`$.

The first joining weight $`w=[x^{a-1}]B`$ is strictly positive for all $`a,b`$. Only $`p_d`$ and $`p_{b+1-a}`$ in (2) contribute to this coefficient. Forward recurrence gives the first contribution $`(b+1)^2`$; backward recurrence gives the other contribution, and
```math
w=(b+1)^2\left(1-\frac{C_a}{H_0}
 \frac{(b+a+1)!(b+1-a)!}{(b+1)!^2}\right).
\tag{4}
```
For example, the leading $`p_b`$-coefficient in the backward expansion of $`p_{b+1-a}`$ is $`\bigl((b+1-a)!/b!\bigr)^2`$. The factorial ratio in (4) equals
```math
\sum_{j=0}^a\binom aj\frac{a(a-1)\cdots(a-j+1)}{(b+2-a)(b+3-a)\cdots(b+1-a+j)}.
\tag{5}
```
This is terminating Chu–Vandermonde with numerator parameters $`-a,-a`$ and denominator $`b+2-a`$. On the other hand $`H_0/C_a=\sum_j C_{a-j}/C_a`$, and its terms are the corresponding ones in (5) with each denominator factor reduced by 1 and with an extra factor
$`\bigl(4^{-(a-j)}\binom{2(a-j)}{a-j}\bigr)\big/\bigl(4^{-a}\binom{2a}a\bigr)\ge1`$. The inequality is strict for $`j=1`$. This proves (4) is positive.

Set $`S_0=A,S_1=B/w`$, both monic. Starting with these, form consecutive negative remainders under ordinary Euclidean division; at each stage divide by the positive leading coefficient if there is one. If the degrees fall one at a time and all those coefficients are positive, parity makes each quotient exactly $`x`$. Hence for positive constants $`u_1,\dots,u_{a-1}`$,
```math
S_{k-1}(x)=xS_k(x)-u_k S_{k+1}(x).
```
It follows that $`A`$ and $`B/w`$ are the characteristic polynomials of one $`a`$-vertex path matrix and its deletion at the first vertex, respectively, with zero diagonal and squared off-diagonal entries $`u_1,\ldots,u_{a-1}`$. Join that path to $`J_{b+1}`$ with a single edge of squared weight $`w`$. Expansion of the tridiagonal determinant across the joining edge gives (3). The full matrix is symmetric and all its off-diagonal entries are nonzero. Thus $`P`$ has $`d`$ distinct real zeros. This is a sufficient criterion; a failure of this specific tail certificate would not alone refute the conjecture.

The test concerns two polynomials of degrees $`a`$ and $`a-1`$, independent of the larger part $`b`$. It is not the coefficient sign induction of [Kölbl, Corollaries 4.5–4.6](https://arxiv.org/html/2404.02136#S4), which expands into Ehrhart polynomials for several different families and encounters negative coefficients.

## 4. A symbolic certificate for infinitely many graphs

The companion [symbolic verifier](symbolic_tail.py) works over $`\mathbb Q[z]`$ with $`b=a+z`$. It expresses (2) in the $`q_{b+1},q_b`$ basis, which gives the pair in (3) up to separate positive scalar factors. It obtains these expansions by clearing the positive products of indices that occur when reversing or advancing the recurrence for $`q_j`$; all the multipliers are positive on $`z\ge0`$. Binomial coefficients in $`b`$ are exact falling factorial polynomials. The resulting two integer/rational coefficient polynomials are propagated by pseudo-division in $`x`$. This implements ordinary remainder up to positive scaling whenever the divisor's leading coefficient is positive. A common factor in $`z`$ is divided out only once its coefficients are all nonnegative and its constant is positive; all leading coefficients are checked by this same positivity test. Thus the signs are exact on the entire real ray $`z\ge0`$, and in particular at every applicable integer. Every step decreases the $`x`$-degree by exactly one on the ray.

With the argument $`14`$, the verifier checks $`a=1,\ldots,14`$; the case $`a=0`$ is the cross-polytope recurrence itself. This is a uniform-in-$`b`$ symbolic verification, not a scan through finite graph sizes. The full proof would require a uniform argument for the remainder signs at arbitrary $`a`$, or a different proof altogether. A separate [interlacing supplement](INTERLACING.md) treats a smaller range of widths.

Targeted searches found the original complete-bipartite formulation, the $`h^*`$-formula and $`h^*`$-real-rootedness result, and Kölbl's cross-degree method. They did not find this fixed-prefix Jacobi criterion or an exact prior resolution of the full bipartite canonical-line assertion. This is a bounded priority screen, not a first-discovery claim.
