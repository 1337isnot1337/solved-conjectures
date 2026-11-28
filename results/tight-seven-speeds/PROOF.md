# The three tight speed sets for eight lonely runners

**Prior work (note added 28 November 2026).** The classification of tight seven-speed sets proved below was already public when this proof was written. Lee Marshall, [ai-math-results, `results/lonely-runner-tight-6-7`](https://github.com/LeeMarshall1113/ai-math-results/tree/a43cb0b9e0b6f762118b2acb8ee62cd31bdcbc89/results/lonely-runner-tight-6-7), release `v2026.10.29c` published 29 October 2026, with the repository archived at [doi:10.5281/zenodo.23842047](https://doi.org/10.5281/zenodo.23842047), Theorem B2, states that every seven-speed set with loneliness at most 1/8 is a dilate of a permutation of the consecutive speeds or of one of the two sets (1, 2, 3, 4, 5, 7, 12) and (1, 4, 5, 6, 7, 11, 13). Priority for the classification belongs to that work, and it should be cited as the original source. The proof below was first committed on 18 November 2026. It is kept as a later derivation. It is not a first resolution, and it is no longer listed in the ranked results table.

Write $`L(v)=\max_t\min_i\|tv_i\|`$, where $`\|x\|`$ is the distance to the nearest integer. We use seven distinct positive integer speeds relative to an eighth, stationary runner. Divide by their gcd to make them primitive.

**Theorem.** The primitive seven-speed sets with $L(v)\le1/8$ are precisely

```math
\{1,2,3,4,5,6,7\},\qquad
\{1,2,3,4,5,7,12\},\qquad
\{1,4,5,6,7,11,13\}.
```

All three have $L(v)=1/8$.

The eight-runner lower bound is known. Goddyn and Wong list both nonconsecutive examples and report a bounded census. The contribution here is exhaustiveness for arbitrary integer speeds. We use the repository's six-speed spectrum theorem and seven-coordinate plane calculation. This is an unrefereed computer-assisted proof. [Rosenfeld](https://doi.org/10.1090/mcom/4243) · [Goddyn and Wong, §1](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf) · [Six-speed spectrum](../six-speed-spectrum/PROOF.md) · [Critical planes](../tight-six-speeds/PROOF.md)

## Two geometric bounds

For a rational vector space write $L(E)$ for the maximum of $`\min_i\|x_i\|`$ on its image modulo the integer lattice. A space is coordinate-free here if no coordinate vanishes identically.

**Plane gap.** A coordinate-free rational plane in seven coordinates with $`L(E)<5/33`$ is, up to signed coordinate permutation, the product plane $(s,2s,3s,4s,5s,6s,t)$.

Indeed the first two six-speed spectrum values are $1/7$ and $5/33$. The only primitive tight sextuple is $(1,2,3,4,5,6)$. Five or fewer distinct speeds have loneliness at least $1/6$. Thus on every rational line of $E$ with nonzero coordinates and a repeated absolute speed, a primitive generator has entries of absolute values $1,2,3,4,5,6$ with one repeated. These are precisely the necessary conditions used in the published seven-coordinate plane enumeration. For clarity, no two coordinates can agree identically up to sign, since this would permit only finitely many primitive directions away from the coordinate zeros. In the dual plane, cyclically adjacent rays of the signed coordinate forms yield two distinct repeat lines away from all coordinate zeros. For two adjacent rays, the sum of their representatives is interior to their angular gap, and its kernel imposes a signed equality. Choose two gaps that are neither equal nor opposite. The enumeration checks all $5{,}806{,}080$ candidate pairs of repeat generators and finds that all 132 survivors span the stated product plane. [Plane argument and enumeration](../tight-six-speeds/PROOF.md)

A primitive tuple on this product plane with $`L(v)<1/7`$ has the form $`\{1,2,3,4,5,6,7s\}`$ and has loneliness $s/(7s+1)$. The product-plane calculation proves this for every such tuple. Thus on a product plane $L(v)\le1/8$ already forces the consecutive set. [Product-plane calculation](../tight-six-speeds/PROOF.md#the-large-norm-seven-speed-statement)

**Norm bound.** Every primitive seven-speed tuple with $L(v)\le1/8$ satisfies

```math
 \|v\|_2\le B=28\cdot21\cdot15\cdot10\cdot6\cdot3=1{,}587{,}600.
```

Project $\mathbb Z^7$ orthogonally onto $v^\perp$. Its covolume is $`1/\|v\|_2`$ since $v$ is primitive. For the successive minima $`\lambda_1\le\dots\le\lambda_6`$ of this lattice with respect to $`v^\perp\cap[-1,1]^7`$, Vaaler's section-volume bound and Minkowski's second theorem give $`\prod_j\lambda_j\le1/\|v\|_2`$. Lift independent vectors attaining these minima to integer vectors. Rounding the lift coefficients, as in the six-speed proof, gives

```math
 L(E_{k+1})\le L(v)+\tfrac12\sum_{j=1}^k\lambda_j
```

on the $(k+1)$-dimensional space spanned by the first $k$ lifts and $v$. These spaces are coordinate-free. By successive coordinate coalescence and the known lonely runner bounds for at most six speeds, their loneliness is at least $1/7,1/6,1/5,1/4,1/3,1/2$, respectively. Hence the prefix sums of the minima dominate those of $(1/28,1/21,1/15,1/10,1/6,1/3)$. For these entries $y_j$, concavity gives $`\log\lambda_j-\log y_j\ge(\lambda_j-y_j)/\lambda_j`$. Summing by parts with the nonincreasing weights $1/\lambda_j$ shows that $`\prod\lambda_j\ge\prod y_j`$. This proves the norm bound. [Yi, Gill and Bu, Lemmas 11.2–11.3](https://arxiv.org/html/2610.40694v1#S11) · [Vaaler](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-p.pdf) · [Earlier prefix bounds for speed products, Remark 3.9](https://arxiv.org/html/2609.02604v2#S3.SS6)

## Modular matches force integer directions

Suppose $v$ lies on no signed product plane, has $L(v)\le1/8$, and satisfies $w\equiv b v\pmod p$ for a signed permutation $w$ of one of the three displayed tuples and $b\ne0$ modulo a prime $p$. If $v,w$ are independent then $z=(w-bv)/p$ is an integer vector independent of $v$. On the plane spanned by $v,z$, represent a phase as $sv+tz$, taking $`|t|\le1/2`$ modulo the integer vector $z$. This phase lies within $`\|w\|_\infty/(2p)`$ of the phase $(s-tb/p)v$. The loneliness function is 1-Lipschitz in this distance. The plane contains $v$, so the plane gap gives

```math
 \frac5{33}\le L(\mathop{\mathrm{span}}(v,w))\le \frac18+\frac{13}{2p}.
```

Every prime used below is at least 251, for which this inequality is false. Therefore any such modular match forces $v$ to be parallel to $w$. Primitivity and positivity recover the entire speed set.

## Exhausting the congruences

Use the following seventeen primes:

```math
251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349.
```

Their product $P$ satisfies $`7^7 P^2>B^{14}`$. By the arithmetic-geometric mean inequality, $`\prod_i v_i\le(\|v\|_2/\sqrt7)^7\lt P`$. Thus one prime in the list divides no speed.

We verify the following finite assertion for **every** listed prime. A primitive seven-speed tuple with no coordinate zero modulo $p$ either has a strict $1/8$ witness at a time with denominator dividing $2p$ or $3p$, or its residues modulo $p$ are a signed permuted dilation of one of the three stated shapes.

1. Fold the nonzero residues to $`[x]_p=\min(x\bmod p,(-x)\bmod p)`$. First enumerate distinct seven-element folded sets without a multiplier $t$ such that $`8[tx]_p>p`$ for every member. We need one representative per orbit under multiplication by a nonzero scalar. Normalize the pair with smallest folded quotient to $1,b$. Enumerate the remaining larger members in increasing order, requiring both folded quotients of every pair to be at least $b$. Intersect the possible witnessing multipliers after each addition. For a six-member prefix, remove every extension for which a remaining multiplier witnesses the seventh member. This leaves a representative of every witnessless orbit. [Shared modular enumerator](../tight-six-speeds/modular.cpp)

2. Every witnessless smaller support extends to a witnessless seven-element set, since adding a speed cannot create a witness. For each seven-element representative, every five-element subset has a witness at denominator $p$, as the checker verifies. For each six-element subset without a witness, repeat each possible member to form every seven-entry multiset with this support. Include these multisets and all the distinct-support representatives other than known shape matches in the remaining tests.

3. For $q=2$ and $3$ test whether an assignment $c_i\bmod q$ is possible for the signed coordinates of the original speeds. Primitivity excludes the all-zero assignment. For each assignment the checker asks whether there are $0\le t\lt p$ and $0\le k\lt q$ with

```math
 8[qt x_i+pk c_i]_{pq}>pq\qquad\text{for every }i,
```

where folding for modulus $pq$ has the same meaning. These are precisely the strict witnesses on the grid $t/p+k/q$, with residues $x_i$ modulo $p$ and $c_i$ modulo $q$. Choosing signs on the speeds to reach the folded representative also signs the residues modulo $q$, and all assignments are tried. The common rescaling modulo $p$ just reindexes $t$. If every nonzero assignment has a witness, exclude this representative. After the two tests there are no remaining candidates for any of the seventeen primes. [Mixed-modulus and product verifier](verify.py)

For the prime that divides no speed, the finite assertion now forces a modular match, and the geometric argument forces an integer match. To verify equality on each of the three actual sets, the checker computes the exact maximum over times $t=k/(a+b)$ for all distinct speeds $a,b$ in the set. At an interior maximum below $1/2$ two active distance waves have slopes of opposite sign, giving $(a+b)t\in\mathbb Z$; simultaneous peaks at height $1/2$ are impossible for these sets, which contain both odd and even speeds after normalization including speed one. Each maximum is $1/8$.

Run the proof checks with Python 3.10 or later and a C++20 compiler from the repository root.

```sh
python3 results/tight-seven-speeds/verify.py
```

The six-speed spectrum and critical-plane classification have separate verifiers in this repository. All three results await independent mathematical review and Lean formalization.
