# The eight-speed Loneliness Spectrum Conjecture

For eight distinct positive integer speeds let $L(v)=\max_t\min_i\|t v_i\|$, where $\|x\|$ is the distance from $x$ to the nearest integer. Call $v$ primitive when its entries have gcd one.

**Theorem.** The values strictly below $1/8$ are exactly
$$
\left\{\frac{s}{8s+1}:s\in\mathbb Z_{>0}\right\}.
$$
This proves Kravitz’s original Loneliness Spectrum Conjecture for eight speeds. Up to scaling and permutation, every tuple giving one of these values is either in the [17-row table](sporadic.txt) or has the form $W\cup\{8s\}$ for $s\ge1$ and
$$
W\in\big\{\{1,2,3,4,5,6,7\},\{1,2,3,4,5,7,12\},\{1,4,5,6,7,11,13\}\big\}.
$$
The classification agrees with Cordella’s 29 primitive tuples through maximum speed 40. The three sporadic tuples beyond that cutoff have largest speeds 56, 62 and 80. [Kravitz](https://arxiv.org/abs/1912.06034) · [Cordella, §6.3](https://arxiv.org/html/2609.03444v2#S6.SS3)

## The three product planes

Write $L(E)=\max_{x\in E}\min_i\|x_i\|$ for a rational subspace. Its image in the torus is compact. Consider a rational two-plane $E$ containing a vector with all coordinates nonzero and of distinct absolute values. We claim that if $L(E)<3/23$, then $E$ is, up to signs and permutation, a product plane $(uW,b)$ for one of the three $W$ above.

On any rational line in $E$ with a repeated absolute coordinate and no zero coordinate, there are at most seven distinct speeds. Six or fewer have loneliness at least $1/7$. For seven speeds the only spectrum value below $3/23$ is $1/8$, and the three primitive sets attaining it are the three $W$. Thus each such line has a primitive generator formed from one $W$ by repeating one entry and applying signs and a coordinate permutation. [Seven-speed spectrum and classification](../seven-speed-spectrum/PROOF.md)

There are at least two independent such lines. Arrange the distinct rays of the signed coordinate forms on $E$ in cyclic order in the dual plane. Consecutive rays bound a gap of angle less than $\pi$. A sum of boundary forms lies inside that gap, hence its kernel equates two coordinates up to sign without vanishing identically on any coordinate. Two gaps neither equal nor antipodal give distinct lines. This is the adjacent-ray argument used in the seven-coordinate classification. [Yi, Gill and Bu, Lemma 11.2](https://arxiv.org/html/2610.40694v1#S11)

Normalize the first generator $w$ to a positive $W$ followed by its repeated entry. Enumerate the possible second generators $z$ with every permutation and with every sign pattern modulo overall sign. Reject dependent pairs, and reject identical coordinate forms up to sign. For every $i,j$ and $e=\pm1$ take $a=w_i-ew_j$, $b=z_i-ez_j$. The vector $az-bw$ lies on the corresponding repeat line. Whenever all coordinates are nonzero, its set of absolute values divided by its minimum must be one of the three $W$. Of 1,137,991,680 pairs, 546 satisfy the tests. In each, seven of the coefficient pairs $(w_j,z_j)$ are proportional and the corresponding entries $w_j$ form one $W$. Since the plane has rank two, this is precisely a product plane. [Exhaustive plane verifier](planes.cpp)

## Spectrum on the product planes

A primitive positive tuple on such a plane has the form $(AW,b)$ with $\gcd(A,b)=1$ and $A\ge1$. The seven speeds $W$ all have distance at least $1/8$ at time $1/8$. At times $(1/8+j)/A$ the seven phases are fixed and the phase of $b$ takes $A$ equally spaced values. For $A\ge2$ some value has distance at least $1/2-1/(2A)\ge1/4$. Hence $L<1/8$ requires $A=1$. Testing $t=1/8$ then forces $8\mid b$.

Put $b=8s$ and $f(t)=\min_{x\in W}\|xt\|$. The maxima of $f$ are at $t_0=1/8,3/8,5/8,7/8$ modulo one, all of height $1/8$. All other positive local maxima have height at most $2/17$. To check these finite assertions, any positive maximum here has height below $1/2$ (the sets contain an odd and an even speed including 1) and has active slopes of opposite signs. Thus $(a+b')t$ is integral for two distinct speeds in $W$. The verifier checks every such point. For $s=1$ the same exact computation on the eight speeds gives $1/9$ for consecutive $W$, and $2/17$ for the other two.

Suppose $s\ge2$ and put $r=s/(8s+1)\ge2/17$. Each component of $\{t:f(t)>r\}$ contains a peak of height $1/8$. Between consecutive zeros of the speed waves their minimum is concave, because each wave is a concave tent on this interval. Its slopes on its linear pieces are nonzero integers. Hence the peak $t_0$ is unique on the component and
$$
f(t)\le1/8-|t-t_0|.
$$
If $f(t)>r$ then $\|8st\|\le8s|t-t_0|<8s(1/8-r)=r$. This proves the upper bound.

At $t=r=1/8-1/(8(8s+1))$, speeds congruent to 2 through 6 modulo 8 have distances at least $1/4-13/136>1/8$. The only speed congruent to 1 is 1, which has distance $r$. A speed congruent to 7 starts at phase $7/8$ and moves left by at most $13/136$, so its distance is at least $1/8$. Finally $8sr\equiv-r\pmod1$. This proves the exact value $r$ for every $s\ge2$ and every $W$. The consecutive family supplies every value in the theorem.

## The finite proof off these planes

Let $v$ be primitive with $L(v)<1/8$ and on none of the three types of product plane. Every rational plane containing $v$ has loneliness at least $3/23$. The projection and rounding argument of the seven-speed proof applies in dimension eight. For clarity, project the integer lattice orthogonally to $v^\perp$. It has covolume $1/|v|_2$. For its sup-norm successive minima $\lambda_i$, Vaaler and Minkowski give $\prod\lambda_i\le1/|v|_2$. The space spanned by $v$ and the first $j$ integer lifts has loneliness at most $L(v)+\tfrac12\sum_{i\le j}\lambda_i$, by reducing the lift coefficients to absolute values at most $1/2$. The lower bounds in dimensions two through eight are $3/23,1/7,1/6,1/5,1/4,1/3,1/2$ from the plane gap and coordinate coalescence. Subtract $1/8$ and double these bounds. Their successive increments from zero are
$$
(1/92,4/161,1/21,1/15,1/10,1/6,1/3).
$$
The partial sums of the minima strictly dominate those of these increments $y_i$. Summing $\log\lambda_i-\log y_i\ge(\lambda_i-y_i)/\lambda_i$ by parts gives $|v|_2<1/\prod y_i=209{,}960{,}100$. [Projection, successive minima and rounding](../seven-speed-spectrum/PROOF.md#reducing-to-a-finite-set-of-primes) · [Coordinate coalescence](https://arxiv.org/html/2610.40694v1#S11)

For every $d=2,\ldots,8$ some speed is divisible by $d$, or $t=1/d$ is a witness to $L\ge1/8$. Hence $840\mid D=\prod v_i$. The product $P$ of all 26 primes from 151 through 283 inclusive satisfies $8^8(840P)^2>209960100^{16}$. Since $D\le(|v|_2/\sqrt8)^8$, one of those primes divides no speed.

If a nonzero integer vector $w\equiv a v\pmod m$ satisfies $92\|w\|_\infty\le m$, it must be parallel to $v$. Otherwise $z=(w-av)/m$ spans with $v$ a plane every phase of which is within $\|w\|_\infty/(2m)$ of the circle of $v$, by reducing the $z$ coefficient modulo one. The plane would have loneliness strictly below $1/8+1/184=3/23$. Thus the absolute coordinates of a short modular vector determine the primitive speeds, or exclude the class if one is zero or two are equal.

For each of the 26 primes the verifier performs the following exhaustive tests. Details of the signed unit normalization and binary lifts are given in the [seven-speed proof](../seven-speed-spectrum/PROOF.md#exhausting-the-modular-possibilities).

1. Enumerate eight-element folded supports up to units by normalizing the smallest folded quotient to a pair $1,b$. Intersect their witness masks at threshold $1/8$. Every witnessless support of smaller size extends to such an eight-element support. Test all subsets and all multiplicities to cover eight coordinates.
2. Lift every surviving class modulo $m$ to the $2^8$ children modulo $2m$. At even $m$, the unit $1+m$ lets us fix the lift of the first odd entry. All-even classes violate primitivity. With exactly one odd speed, the seven even speeds admit a time of loneliness at least $1/8$, and one of that time and its translate by $1/2$ gives the odd speed distance at least $1/4$.
3. For odd $t\le m$ exclude children on which all centered distances are at least $(2m)/8$ in numerator units, or on which all are at most $(2m)/92$. In the latter case keep the normalized short direction whenever its absolute coordinates are nonzero and distinct. On a primitive tuple the residue vector has full order $2m$, so the short vector at $t$ is nonzero. Recurse on unresolved children. The verifier fails if any node remains unresolved at depth twelve.
4. Remove the proven product families. For every remaining normalized direction check the possible first time of simultaneous distance at least $1/8$ on $[0,1/2]$. This is an entering endpoint $(8j+1)/(8x)$ for some coordinate $x$. Exactly the [17 table rows](sporadic.txt) survive. For each, evaluate all candidate maxima $t=k/(a+b)$ as above. Every reduced value has denominator one more than eight times its numerator. [Modular and exact verifier](verify.py)

**Consequences.** Each primitive near-tight tuple of reduced loneliness $p/q$ has $\max v_i\le21q/17$, with equality at $(1,5,6,7,8,11,13,21)$. On the product families the ratio is below one, and direct comparison gives the sharp ratio on the table. Zhu’s triangle conjecture also holds for eight integer distances. Each $W$ contains an additive triangle, as does every sporadic row by direct test. A triangle-free distance set therefore has $L\ge1/8$ and admits an eight-coloring by half-open arcs of length $1/8$ at a maximizing time. [Coloring argument and statement of Zhu’s conjecture](../seven-speed-spectrum/PROOF.md#exact-values-and-consequences)

The written proof and computational certificates await independent mathematical review and Lean formalization.
