# The unique equality case for ten lonely runners

Let $v$ consist of nine distinct positive integer speeds relative to a stationary runner. Write $`L(v)=\max_t\min_i\|t v_i\|`$, where $`\|x\|`$ denotes distance to the nearest integer.

**Theorem.** The only primitive tuple with $L(v)\le1/10$ is $(1,2,3,4,5,6,7,8,9)$ up to order. Its loneliness is exactly $1/10$.

Here primitive means that the gcd of the speeds is one. Scaling all speeds by a common positive integer preserves loneliness. The lower bound for ten runners is already known. The classification here rules out every other equality case. Goddyn and Wong list a finite census; their one-entry acceleration theorem and Zhang's one-entry replacement result address specified families of speed sets. [Trakulthongchai](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v33i2p46) · [Goddyn and Wong](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf) · [Zhang](https://arxiv.org/abs/2608.13599)

## Bounding the product of the speeds

Assume $L(v)\le1/10$. Let $\Lambda$ be the orthogonal projection of $\mathbb Z^9$ to $v^\perp$. Since $v$ is primitive, extending it to an integer basis gives $`\det\Lambda=1/|v|_2`$. Use a Korkine–Zolotarev basis of this Euclidean lattice. Write $t_i$ for the squared Gram–Schmidt lengths, $1\le i\le8$. Set

```math
 B_r=4\big(1/(10-r)-1/10\big)^2,\qquad c_r=B_r-B_{r-1}.
```

The space spanned by $v$ and integer lifts of the first $r$ basis vectors is rational of dimension $r+1$ and has no identically zero coordinate. Its torus therefore has loneliness at least $1/(10-r)$ by coordinate coalescence and the known lower-dimensional lonely runner bounds. Nearest-plane rounding in reverse basis order bounds the distance to the circle of $v$ by $`\frac12\sqrt{\sum_{i\le r}t_i}`$. Indeed the rounding leaves each Gram–Schmidt coefficient of the projected difference in $`[-1/2,1/2]`$; the component parallel to $v$ can be absorbed into the circle parameter. The sup distance is at most the Euclidean distance. This gives $`\sum_{i\le r}t_i\ge B_r`$, including the possible equality at $L(v)=1/10$. [Allikvere, Lemma 3.3 and Proposition 3.4](https://arxiv.org/html/2609.02604v2#S3)

The Korkine–Zolotarev ratio bound gives $`t_{i+1}\ge3t_i/4`$. Each $`c_{i+1}/c_i>4/3`$, as can be checked directly with the displayed fractions. Allikvere's product minimization lemma therefore gives $`\prod_i t_i\ge\prod_i c_i=:K`$. Its hypotheses allow non-strict prefix inequalities. As $`\prod_i t_i=1/|v|_2^2`$, the arithmetic-geometric mean inequality gives

```math
 D:=\prod_{i=1}^9 v_i\le(9K)^{-9/2}.
```

Every $2\le d\le9$ divides some $v_i$, since otherwise $t=1/d$ would witness loneliness at least $1/d>1/10$. Hence $2520=\mathop{\mathrm{lcm}}(2,\ldots,9)$ divides $D$. [Allikvere, Lemmas 3.5–3.6 and 3.10](https://arxiv.org/html/2609.02604v2#S3)

## A shift test for residue classes

Fix $d\ge2$ and set $`g_i=\gcd(v_i,d)`$. If there is at least one speed not divisible by $d$, the condition

```math
  \sum_{d\nmid v_i}g_i\left\lceil\frac{2d}{10g_i}\right\rceil < d
```

implies $L(v)>1/10$.

The speeds divisible by $d$ comprise at most eight runners. Their known lonely runner bound gives a time with all their distances at least $1/9$. Take a nearby time $t_0$ at which their distances still exceed $1/10$ and none of the phases of the other speeds at the finitely many times $t_0+j/d$ hits either endpoint of the forbidden arc $`[-1/10,1/10]`$. If the divisible subset is empty, take any time avoiding those endpoints. A divisible speed keeps its phase at every translate. Another speed visits $d/g_i$ equally spaced phases with multiplicity $g_i$. On the arc of length $2/10$, at most $\lceil 2d/(10g_i)\rceil$ different phases can occur because the endpoints were avoided. A union bound over the $d$ translates proves the claim. This test uses only the residues modulo $d$ and the lower-dimensional bound. [Related common-divisor shift arguments](https://arxiv.org/html/2609.02604v2)

## The modular certificate

Use the 28 primes

```math
71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,
151,157,163,167,173,179,181,191,193,197,199,211.
```

They are coprime to 2520. For their product $P$ the exact inequality $`(2520P)^2(9K)^9>1`$ shows that one of them divides no speed.

For each listed $p$ we establish the following finite implication. If $p\nmid D$ and $L(v)\le 1/10$, then $v$ is congruent modulo $6p$ to a unit multiple of a signed permutation of the consecutive speeds. The checker follows these steps.

1. On the $p$-grid fold signs and enumerate every nine-element support without a strict $1/10$ witness up to common scaling. Normalize the pair with least folded quotient to $1,b$, then visit all increasing completions for which every pair has both folded quotients at least $b$. At each prefix intersect the available witness masks, removing only extensions that admit an actual witness. Every smaller witnessless support extends to a witnessless nine-element set. For each representative test every nonempty subset and enumerate all multiplicities totaling nine on each witnessless subset. [Prime-grid enumerator](../tight-six-speeds/modular.cpp)
2. For each resulting tuple $x$ of residues modulo $p$ try all primitive assignments $c$ modulo 2 and modulo 3. For modulus $q$, an actual strict witness is a pair $0\le t\lt p$, $0\le j\lt q$ with $`10[qt x_i+pj c_i]_{pq}>pq`$ for every coordinate, where brackets give the absolute folded residue. This is the time $t/p+j/q$. Discard assignments admitting a witness; also discard those excluded by the shift test ($q=2,3$ needs at least $q$ nonzero entries). Combine surviving mod-2 and mod-3 assignments $a,b$ by $c=3a+4b\bmod6$. Test the $6p$-grid.
3. For surviving assignments try every unit multiplier modulo $p$ and both units modulo 6 to find a common signed permutation of $1,\ldots,9$ giving $x$ and $c$ up to those multipliers. For fixed multiplier modulo $p$ the indices and signs, if present, are unique since $p>18$. The Chinese remainder theorem gives a unit modulo $6p$. Normalizing the original speeds by a common scalar modulo $p$ only reindexes $t$ on each grid. Folding a speed also signs its residue modulo the auxiliary modulus, for which every assignment has been included.
4. For every unaligned survivor try the shift test for every divisor of 6. Otherwise enumerate all its lifts modulo 12. If each lift admits a grid witness or is excluded by the shift test on a divisor of 12, then the original tuple is excluded. If a lift survives, perform the corresponding universal test for all lifts of the mod-6 assignment modulo 18. A true tuple would have to admit a surviving lift in both tests. Every unaligned survivor is excluded. [Lift and translate checker](../tight-eight-speeds/lifts.cpp) · [Exact integer checks and reproduction driver](verify.py)

## From a modular match to equality over the integers

For the prime not dividing $D$, put $m=6p$. There is a signed permutation $w$ of $(1,\ldots,9)$ with $w\equiv b v\pmod m$. If the directions were independent, $v$ and the integer vector $z=(w-bv)/m$ would span a coordinate-free plane. Its torus has loneliness at least $1/9$ by coordinate coalescence and the known bound for eight speeds. Every phase on it has a representation $sv+tz$ with $`|t|\le1/2`$ modulo the integer vector $z$. This differs from $(s-tb/m)v$ by $tw/m$, so its distance to the circle is at most $9/(2m)$. The loneliness function is 1-Lipschitz, hence

```math
  1/9\le L(\mathop{\mathrm{span}}(v,w))\le1/10+9/(2m)<1/9,
```

because every listed prime satisfies $m>405$. This contradiction forces parallelism. Primitivity and positivity give the claimed set. Its value at $t=1/10$ is $1/10$; the circular gap bound among $0,t,\ldots,9t$ gives the matching upper bound.

The proof uses published lower-dimensional lonely runner inequalities. Its equality classification is an unrefereed computer-assisted result without a Lean formalization. Reproduce all finite checks from the repository root with Python 3.10 or later and a C++20 compiler.

```sh
python3 results/tight-nine-speeds/verify.py
```
