# The complete six-speed loneliness spectrum below one sixth

For distinct positive integer speeds $v_1,\ldots,v_6$, put $L(v)=\max_t\min_i\|tv_i\|$, where $\|x\|$ is distance to the nearest integer. Call $v$ near-tight when $L(v)<1/6$. Divide the speeds by their gcd to obtain a primitive tuple.

**Theorem.** The six-speed values strictly below $1/6$ are exactly
$$
\left\{\frac{P-1}{6P}:P\ge7,\quad P\equiv1\ \text{or}\ 5\pmod6\right\}.
$$
Consequently every near-tight value $a/q$ in lowest terms has odd $q$ and $q-6a\in\{1,3\}$. This proves Cordella's Conjecture 6.2 and the six-speed case of Fan and Sun's amended Loneliness Spectrum Conjecture. Every primitive near-tight sextuple also satisfies $\max_i v_i<3q$, answering Cordella's Question 6.6 for six speeds. [Cordella, §§6.1 and 6.4](https://arxiv.org/html/2609.03444v2#S6) · [Fan and Sun](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v33i1p38)

Cordella proved the restrictions on three critical families, showed that only finitely many tuples fall outside them, and found nine such tuples in a search through speed 110. We prove that his nine exhaust the sporadic primitive tuples. Each row below is sorted.

| $L$ | Primitive sextuples outside the critical families |
|---|---|
| $2/13$ | $(1,2,5,6,7,8)$, $(2,5,6,8,10,11)$, $(1,4,5,6,7,22)$ |
| $3/19$ | $(1,2,3,5,8,18)$, $(2,3,5,6,8,11)$, $(2,5,6,7,8,11)$ |
| $4/25$ | $(1,3,4,5,18,46)$ |
| $5/31$ | $(1,3,4,5,7,24)$ |
| $6/37$ | $(1,4,5,6,7,33)$ |

We work up to permutations and individual sign changes. A tuple lies on a **critical family** if it belongs to the real column space of one of the following parameterizations, after these symmetries,
$$
(s,2s,3s,4s,5s,t),\qquad(s,3s,4s,5s,9s,t),\qquad
(s,t,s+t,2s+t,3s+t,3s+2t).
$$
For tuples on these families the necessary spectrum restriction and the speed bound follow from Cordella's Theorems 4.2 and 5.3, including Lemma 4.1 for the product families. The nine rows satisfy both conclusions directly. The six-speed lonely runner bound $L\ge1/7$ gives $P\ge7$. Every $P=6s+1$ with $s\ge1$ occurs on $(1,2,3,4,5,6s)$. The tuple $(1,5,6,11,16,17)$ attains $5/33$, giving $P=11$. Every $P=6s+11$ with $s\ge1$ occurs by Jain and Kravitz's Theorem 1.5, expressed there in terms of $1/2-L$. These are the two residue classes in the theorem. It remains to prove the table exhaustive. [Cordella, §§3–5](https://arxiv.org/html/2609.03444v2#S3) · [Jain and Kravitz, Theorem 1.5](https://escholarship.org/uc/item/3mx8w3js)

## A gap for planes and bounds for integer directions

For a rational subspace of $\mathbb R^6$, let its loneliness be the maximum of $\min_i\|x_i\|$ over its image in the torus. A plane is coordinate-free when no coordinate form vanishes identically.

**Lemma 1.** Every coordinate-free plane in six coordinates with loneliness strictly below $2/11$ is one of the three critical planes, up to signed permutations.

By the five-speed spectrum theorem, among five distinct speeds a value below $2/11$ must be $1/6$. The tight five-speed sets are the dilations of $(1,2,3,4,5)$ and $(1,3,4,5,9)$. Four or fewer distinct speeds give at least $1/5$. Therefore every primitive integer direction on the plane with no zero coordinate and with a repeated absolute speed has one of these two quintuples with one coordinate repeated. Two coordinate forms cannot agree identically up to sign, since then infinitely many primitive directions on the plane, away from the coordinate zeros, would belong to a finite list. [Five-speed spectrum](../five-speed-spectrum/PROOF.md) · [Cordella, §2.5](https://arxiv.org/html/2609.03444v2#S2.SS5)

There are two independent directions of this kind. In the dual plane cyclically order the distinct rays of the signed coordinate forms. Their span has rank two, so there are at least four rays and every consecutive gap has angle less than $\pi$. The sum of a signed form on either boundary of a gap lies inside it, parallel to no coordinate form. The kernel of the sum gives a rational repeat line avoiding coordinate zeros. Choose two gaps that are distinct even after identifying antipodal gaps.

Normalize one primitive repeat vector by signs and permutation, leaving ten choices. For each, try all signed permutations of a second repeat vector with positive first entry. On a candidate plane with generators $w,z$, the line where coordinates $i,j$ agree up to sign $e$ has generator $(w_i-ew_j)z-(z_i-ez_j)w$. Test every such line with no zero coordinate against the same two tight quintuples. Of 1,152,000 pairs, 190 survive independence and these necessary tests, and all 190 span one of the three listed planes up to signed permutation. The verifier checks equality of rational column spaces. Cordella already evaluated all three critical planes at $1/6$. This proves the gap. [Repeat-line enumeration](check-gap.cpp) · [Cordella's critical-plane calculation](https://arxiv.org/html/2609.03444v2#S3)

**Lemma 2.** Let $v$ be a primitive near-tight sextuple outside the three critical families, in a rational space $E$ of dimension $r$. Write $\Delta$ for the covolume of $\Lambda=E\cap\mathbb Z^6$ in $E$. Then
$$
|v|_2<C_r\Delta,\qquad
C_4=9075,\quad C_5=54450,\quad C_6=163350.
$$

Project $\Lambda$ orthogonally inside $E$ onto $F=E\cap v^\perp$. The resulting lattice has covolume $\Delta/|v|_2$, by extending the primitive vector $v$ to a basis and taking base times height. Let $\lambda_1\le\cdots\le\lambda_{r-1}$ be its successive minima for $F\cap[-1,1]^6$. Vaaler's central-section theorem gives this body volume at least $2^{r-1}$. Minkowski's second theorem gives $\prod_j\lambda_j\le\Delta/|v|_2$. This is the projection argument of Yi, Gill and Bu applied inside $E$. [Vaaler](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-p.pdf) · [Yi, Gill and Bu, Lemma 11.3](https://arxiv.org/html/2610.40694v1#S11)

Lift independent successive-minimum vectors to $w_j\in\Lambda$. Every point of the torus spanned by $v,w_1,\ldots,w_k$ is within sup distance $\frac12\sum_{j\le k}\lambda_j$ of the circle of $v$. Round the coefficients of the $w_j$ to nearest integers, and absorb their remaining components parallel to $v$ into the circle parameter. The loneliness function is 1-Lipschitz. The two-dimensional torus containing $v$ has loneliness at least $2/11$ by Lemma 1. In dimensions $3,4,5,6$ the respective lower bounds are $1/5,1/4,1/3,1/2$, from coalescing coordinates and the known lower-dimensional lonely runner inequalities. All these tori contain a vector whose coordinates are nonzero. [Yi, Gill and Bu, Lemma 11.2](https://arxiv.org/html/2610.40694v1#S11)

Using $L(v)<1/6$ gives strictly larger prefix sums for the $\lambda_j$ than for the first $r-1$ entries of
$$
(y_1,\ldots,y_5)=(1/33,\ 2/55,\ 1/10,\ 1/6,\ 1/3).
$$
Indeed the prefix bounds are $1/33,1/15,1/6,1/3,2/3$. Concavity gives $\log\lambda_j-\log y_j\ge(\lambda_j-y_j)/\lambda_j$. Summation by parts gives a positive sum on the right since $1/\lambda_j$ is nonincreasing. Thus $\prod\lambda_j>\prod y_j$, with both products truncated at $r-1$. Taking reciprocals proves the lemma.

In particular $|v|_2<163350$. If an integer matrix $A$ spans $E$, then $\Delta^2\le\det(A^\top A)$ for a full column basis, since the column lattice has integer index in $\Lambda$. These bounds apply after every signed coordinate permutation.

## Finite-field certificates

Write $[x]_p=\min(x\bmod p,(-x)\bmod p)$. A multiplier $t$ is a **witness** when $6[tv_i]_p\ge p$ for each coordinate. Time $t/p$ then excludes near-tightness. Every prime used is at least 53. Scaling by a nonzero residue, folding signs and permuting entries preserve the existence of a witness.

For each prime the first program enumerates every witnessless six-element folded set up to scaling. Among ordered pairs choose a pair with smallest folded quotient $b$, scale it to $1,b$, and enumerate the four remaining members in increasing order with every pair quotient folded to at least $b$. After fixing five members, remove every eligible sixth member witnessed by any multiplier common to the five. Read every survivor. This includes a representative of each orbit. For repeated residues, any witnessless set of support at most five extends to a witnessless six-element set. Check its five-element deletions and repeat every possible member. The checker also tests four-element deletions, rejecting the prime if any have no witness. This covers all nonzero multisets of size six at the accepted primes. [Enumerator](../tight-six-speeds/modular.cpp) · [Cover checker](check-fields.cpp)

We use distinct primes to lift modular alternatives to exact integer identities. If every counted prime divides the product of some integer evaluations, and their prime product exceeds the upper bound for that absolute integer product, one evaluation must vanish. For a row $h$ and parameter vector $u$ use $|hu|^2\le |u|_2^2\|h\|_2^2$. The verifier counts a prime separately for each assertion it passes. All the comparisons below use integers. [Driver](verify.py) · [Prime certificate](primes.json)

### From six to four parameters

1. At the primes counted for the first test every nonzero witnessless sextuple admits at least two signed additive relations, each on three distinct folded values and on a different triple of indices. If no such relation holds over the integers, take the product of the 80 nonzero forms $v_i\pm v_j\pm v_k$ with $i<j<k$, and multiply by $(\prod_i v_i)^2$. Every counted prime divides that integer to order at least two. Primes dividing a speed are covered by the squared product of the speeds. Every other counted prime divides two different factors among the 80. With $B=163350$, the verifier checks $P^4>(B^2)^{12}(3B^2)^{80}$. This is a contradiction. Thus some true additive triangle exists.

2. Sign and order that triangle as $a+b+c=0$, write $c=-a-b$, and use the five parameters $(a,b,d,e,f)$. They occur among signed speeds, so their Euclidean norm is at most $|v|_2$. Their speed matrix has Gram determinant three. Lemma 2 bounds their squared norm by $3\cdot54450^2$. If the three folded anchor values are distinct, the second modular test requires another relation of one of two types. Either an anchored difference $a_i-a_j$ equals a signed extra speed, or a signed sum of two extras equals an anchor. Here $a_i$ denotes one of $a,b,c$. There are 54 linear forms up to overall sign. The list is invariant under permuting the signed anchors, reversing their common sign, and signing or permuting the extras. This is why the test can use one ordering of each modular triangle. A collision of folded anchors either makes a speed zero or makes some $a_i-a_j$ zero modulo $p$, since $a+b+c=0$. The six speed forms and the three anchor differences account for all such primes. All nine are nonzero over the integers for the tuples under consideration. For the 63 rows together the checker establishes $P^2>\prod_h(3\cdot54450^2\|h\|_2^2)$. Some one of the 54 additional relations therefore holds over the integers.

3. The two resulting signed shapes are, up to order,
$$
A_0u=(x,y,x+y,x-y,z,w),\qquad
A_1u=(x,y,x+y,z,x+z,w).
$$
For each shape the certificate gives a list $H_i$ of further linear forms. The program tries every embedding into every witnessless folded multiset, allowing both relative signs of $y,z,w$ after fixing the sign of $x$. Every embedding must make some listed form zero modulo $p$ for the prime to count. The six speed rows cover zero residues. The four parameters are individual signed speeds, so their squared norm is less than $B_i^2=9075^2\det(A_i^\top A_i)$. In each shape the verifier checks $P_i^2>\prod_{h\in\operatorname{rows}(A_i)\sqcup H_i} B_i^2\|h\|_2^2$. Since no speed vanishes over the integers, a listed form does. [Line covers](covers.json)

### From three parameters to the finite list

Eliminate one parameter in each new equation $hu=0$. If $h_j\ne0$, multiply all speed rows by $h_j$ and use the coefficients $h_j a_i-a_jh_i$ on the remaining parameters. Drop maps with forced zeros or repeated absolute speeds. Identify signed-permutation equivalents over the rationals. For the latter test, choose ordered independent speed rows as a basis and express every row in that basis by Cramer's rule. Clear a common denominator, normalize row signs and order, and minimize over choices of basis and signs of the basis parameters. The key retains the denominator. Equal keys give equal rational spaces up to signed permutation. The resulting fifteen maps all have denominator one, so parameters can be taken to be individual signed speeds.

For each map $A$ of rank three and its proposed rows $H$, visit every point $(1,i,j),(0,1,j),(0,0,1)$ of the projective parameter plane at each tested prime. Every point must give a zero speed, a witness, or some $hu=0$ modulo $p$. These tests attain $P^2>\prod_{h\in\operatorname{rows}(A)\sqcup H}163350^2\|h\|_2^2$ for every map. A parameter that reduces to zero is covered by the speed rows. Hence another equation vanishes over the integers. Eliminate and canonicalize again, discarding the three known critical planes. There are 78 noncritical two-parameter maps. [Projective-plane checker](../five-speed-spectrum/sieve.cpp) · [Elimination and exact product checks](verify.py)

Let $A$ now be one such map. Its entire torus has loneliness at least $2/11$ by Lemma 1. For a primitive parameter direction $(x,y)$, the lifts of its circle in $\mathbb R^2$ are parallel lines spaced $1/\sqrt{x^2+y^2}$ apart because $(-y,x)$ is primitive. Under $A$, a move of Euclidean length $d$ changes each phase by at most $d\max_i\|A_i\|_2$. Thus if the circle has loneliness below $1/6$,
$$
x^2+y^2 < 33^2\max_i\|A_i\|_2^2 .
$$
The checker exhausts the closed disk given by this bound, taking $x\ge0$ and both signs of $y$. A common denominator in the parameterization only scales the speeds and has no effect on loneliness. Sort and divide the resulting speeds by their gcd. Remove tuples with zero or repeated speeds or on a critical plane. Membership in the third critical family is tested by trying every signed ordered pair of distinct speeds as its first two parameters.

A rational witness discards a tuple. The exact threshold test checks the left endpoints $(6k+1)/(6v_i)$ of the intervals on which $\|v_it\|\ge1/6$ for $0\le t\le1/2$. If the six closed unions intersect, their first common point is such an endpoint. For the true survivors the exact maximum occurs when two active triangular waves have opposite slopes, so $t(v_i+v_j)$ is an integer for some $i<j$. A strict maximum below $1/6$ is positive, and lies away from any cusp of an active wave. Enumerating those pair-sum times gives the nine entries and exact values in the table. This proves the theorem. [Disk and exact-value checker](check-leaves.cpp)

## Reproduction and status

Run from the repository root with Python 3.10 or later and a C++20 compiler.

```sh
python3 six-speed-spectrum/verify.py
```

The proof uses the repository's five-speed theorem and the cited literature. The verifier recompiles the searches and recomputes the prime products and all final cases. The result is an unrefereed computer-assisted proof without a Lean formalization.
