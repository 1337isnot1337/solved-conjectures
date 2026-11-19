# The unique tight set of six integer speeds

For a set $D$ of distinct positive integer speeds, let $`L(D)=\max_t\min_{d\in D}\|dt\|`$, with distance measured to the nearest integer. Dividing by the gcd preserves $L$. A six-speed set is tight if $L(D)=1/7$.

**Theorem 1.** Every tight six-speed set is a dilation of $`\{1,2,3,4,5,6\}`$.

**Theorem 2.** Up to permutation and coordinate sign changes, the only two-dimensional subtorus of $(\mathbb R/\mathbb Z)^7$ with loneliness $1/7$ is

```math
\{(t,2t,3t,4t,5t,6t,s):t,s\in\mathbb R/\mathbb Z\}.
```

In particular, every primitive seven-speed tuple of Euclidean norm at least $7\cdot42^{10}$ with loneliness below $1/7$ is $`\{1,2,3,4,5,6,7s\}`$ for some positive integer $s$, and its loneliness is $s/(7s+1)$.

Goddyn and Wong studied the equality cases of the Lonely Runner Conjecture. Cordella explicitly identifies the six-speed classification as the missing input for seven speeds and reports a search through speed 130. The following unrefereed computer-assisted proof covers all speeds. It uses the effective bounds of Yi, Gill and Bu. [Goddyn and Wong](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf) · [Cordella, §6.3](https://arxiv.org/html/2609.03444v2#S6.SS3) · [Yi, Gill and Bu, Theorem 11.1](https://arxiv.org/html/2610.40694v1#S11)

## Six speeds

Let $v$ be primitive, $`S=\sum_i v_i^2`$, and suppose $L(v)\le1/7$. Theorem 11.1(i) of Yi, Gill and Bu gives $L(v)>1/6-30^4/(2\sqrt S)$. The required lonely runner inequalities in four and five speeds are known. Thus $\sqrt S\lt B=21\cdot30^4=17{,}010{,}000$.

For an odd prime $p$, fold a residue $x$ to $`[x]_p=\min(x\bmod p,(-x)\bmod p)`$. Say a nonzero scalar $t$ witnesses a folded set if $`7[tx]_p>p`$ for each member $x$. Such a multiplier gives a time $t/p$ with loneliness strictly greater than $1/7$. The witness property is invariant under nonzero scaling and signs.

**Finite assertion.** For each of the 53 primes listed in the verifier, every six-element set of distinct nonzero folded residues either has a witness or equals the folded set of $a,2a,\ldots,6a$ for some $a\ne0$. The product $P$ of these distinct primes satisfies $`P>91^6 B^{18}`$.

Here is an exhaustive test of that assertion. For each ordered pair of members consider its folded quotient in the field. Scale the set so that a pair giving the smallest such quotient becomes $1,b$. Every other member exceeds $b$, and every pair has both folded quotients at least $b$. Enumerate the remaining four members in increasing order subject to those inequalities. The program stores two bit sets at each step, the eligible larger members and the multipliers witnessing the current prefix. Adding a member intersects the multiplier set with its own witnesses. At a prefix of length five, remove every candidate sixth member witnessed by any surviving multiplier. Compare each remaining sextuple against the complete list of folded dilations of $`\{1,\dots,6\}`$. Scaling, the increasing order, and the pair inequalities together preserve a representative of every possible obstruction. This search and the integer product comparison are replayed by the verifier. [Modular search](modular.cpp) · [Prime list and product check](verify.py)

The assertion also excludes witnessless sets of at most five distinct nonzero folded residues. Extend such a set first to five residues. Fix one of them. At most six folded dilations of the baseline can contain it, since this fixed residue must be $`[ja]_p`$ for some $1\le j\le6$, determining $a$ up to sign. Each such dilation that contains all five has at most one possible sixth member. There are $(p-1)/2-5>6$ choices. Choose a sixth that gives a different set. Its witness works for the original subset.

Put $`D_0=\prod_i v_i`$. A certified prime not dividing $D_0$ must give six distinct folded residues of the baseline shape, since the original tuple has no strict witness. Hence $S\equiv91a^2\pmod p$, where $`91=1^2+\dots+6^2`$. For each fixed coordinate $i$, every certified prime therefore divides

```math
D_0 F_i,\qquad F_i=\prod_{j=1}^6(91v_i^2-j^2S).
```

Indeed primes dividing $D_0$ are already accounted for. Both terms in each factor of $F_i$ lie between zero and $91B^2$, and $D_0\lt B^6$. Thus $`|D_0F_i|<91^6B^{18}\lt P`$. Divisibility forces $F_i=0$ over the integers for every $i$.

It follows that each $v_i$ is one of the six numbers $j\sqrt{S/91}$, $1\le j\le6$. Distinctness and positivity force the entire list, whose smallest member is an integer and whose gcd is that smallest member. Primitivity makes it one. Conversely, among $0,t,\dots,6t$ on the circle some pair is at distance at most $1/7$ by the gap sum, and $t=1/7$ gives equality. This proves Theorem 1.

## Seven-coordinate critical subtori

For a connected subtorus $U$, its loneliness is $`\max_{x\in U}\min_i\|x_i\|`$. A two-dimensional subtorus is the image modulo $\mathbb Z^7$ of a rational real plane $E$. Write $\ell_i$ for its coordinate forms. Suppose its loneliness is $1/7$. All forms are nonzero. A primitive integer vector on a line in $E$ with all entries nonzero and at least one pair of equal absolute entries must have absolute entries $1,\dots,6$ with one repeated. Indeed it has loneliness at most $1/7$ by inclusion in $U$. Five or fewer speeds give at least $1/6$ by the known lonely runner bounds, and Theorem 1 applies when there are six. In particular two forms cannot coincide up to sign on all of $E$, since there are infinitely many rational directions away from coordinate zeros and only finitely many primitive repeat vectors of this shape.

There are at least two distinct repeat lines avoiding all coordinate-zero forms. To see this, arrange the different rays of the signed forms $\pm\ell_i$ in cyclic order in the dual plane. The forms span the plane, so there are at least four rays and each consecutive angular gap is strictly less than $\pi$. The sum of one form on each of the two boundary rays lies strictly inside their gap and is proportional to no coordinate form. Its kernel imposes equality up to sign on the two associated coordinates and no coordinate vanishes identically there. Use two gaps that are neither equal nor antipodal to obtain two distinct rational lines. This applies the adjacent-ray argument of Yi, Gill and Bu twice. [Yi, Gill and Bu, Lemma 11.2](https://arxiv.org/html/2610.40694v1#S11)

Take primitive integer generators $w,z$ of those two lines. A signed coordinate permutation puts $w=(1,2,3,4,5,6,a)$ with $1\le a\le6$. The vector $z$ is a signed permutation of $(1,2,3,4,5,6,b)$ for some $1\le b\le6$. Fix its overall sign by taking its first entry positive. This gives $`6^2(7!/2)2^6=5{,}806{,}080`$ ordered pairs to check.

The following necessary test uses only Theorem 1. Discard dependent pairs and any plane with a forced equality up to sign. For each $i\lt j$ and $e=\pm1$ set $`A=w_i-ew_j`$, $`C=z_i-ez_j`$. The vector $Az-Cw$ spans the repeat line. If any coordinate vanishes, this line gives no test. Otherwise its absolute entries divided by their least value must comprise the integers one through six with one repetition. Exactly 132 pairs pass all these tests. In every one, six forms $`(w_i,z_i)`$ are proportional and their first coordinates are exactly $1,\dots,6$. The remaining form is independent, so the image plane gives the product in Theorem 2. Conversely the product has loneliness $1/7$ by Theorem 1 and a free choice of the last coordinate. This proves the classification. The enumeration follows Cordella's tight-repeat-vector method and includes every possible second generator from a free repeat line. [Plane verifier](planes.cpp) · [Cordella, §3](https://arxiv.org/html/2609.03444v2#S3)

## The large-norm seven-speed statement

The known lonely runner bounds for five and six speeds allow the application of Yi, Gill and Bu's Theorem 11.1(iii) at $n=7$. It puts every primitive tuple in the stated norm range with loneliness below $1/7$ on a critical plane. The classification just proved gives $`\{a,2a,3a,4a,5a,6a,c\}`$, with $\gcd(a,c)=1$. For $a\ge2$, at the times $t=(1/7+j)/a$, the last speed takes $a$ equally spaced phases. Some phase has distance at least $1/2-1/(2a)\ge1/4$, and all the other speeds have distance at least $1/7$. Thus $a=1$. At $t=1/7$, we also see that $7$ must divide $c$. [Yi, Gill and Bu, Theorem 11.1](https://arxiv.org/html/2610.40694v1#S11)

Write $c=7s$, $r=s/(7s+1)$ and $`f(t)=\min_{1\le j\le6}\|jt\|`$. Time $t=r$ witnesses loneliness at least $r$. For the upper bound take a component of $f>r$. It contains an interior maximum, which must be at height $1/7$. Indeed $1/8\le r$, $f\le1/7$, and any positive local maximum arises from waves of opposite slopes, giving a value with denominator at most $5+6=11$. No fraction in $(1/8,1/7)$ has so small a denominator. At a point attaining $1/7$, the seven phases $0,t,\ldots,6t$ are evenly spaced, so $t=k/7$. On the component every wave is concave because it avoids its zeros, hence so is their minimum. Its linear pieces have nonzero integer slopes. Consequently $`f(t)\le1/7-|t-k/7|`$ on that component, using a lift to the real line. Hence $`\|7st\|\le7s|t-k/7|<7s(1/7-r)=r`$. This proves the formula and the stated consequence. Smaller seven-speed tuples can have other values, as Cordella records. [Cordella, §6.3](https://arxiv.org/html/2609.03444v2#S6.SS3)

## Reproduction

Run from the repository root with Python 3.10 or later and a C++20 compiler.

```sh
python3 results/tight-six-speeds/verify.py
```

The programs use exact integer arithmetic throughout. The proofs have no Lean formalization.
