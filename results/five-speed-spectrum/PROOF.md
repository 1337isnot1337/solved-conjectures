# The five-speed loneliness spectrum below one fifth

For five distinct positive integer speeds $D$, write $`L(D)=\max_{t\in[0,1]}\min_{d\in D}\|dt\|`$, where $`\|x\|`$ denotes distance to the nearest integer. Dividing all speeds by their gcd preserves $L$. Call a set **primitive** if its gcd is one.

**Theorem.** The values of $L(D)$ strictly below $1/5$ are exactly

```math
\left\{\frac{s}{5s+1}:s=1,2,3,\ldots\right\}.
```

This proves the five-speed case of Kravitz's Loneliness Spectrum Conjecture. The result concerns the entire five-speed spectrum below the threshold. The original conjecture has counterexamples at other numbers of speeds. [Kravitz, 2021](https://doi.org/10.5070/C61055383) · [Fan and Sun, 2026](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v33i1p38)

**Classification outside the two known families.** Call a set critical-family if it contains a dilation of $`\{1,2,3,4\}`$ or $`\{1,3,4,7\}`$. Exactly twelve primitive sets outside these families have $`L<1/5`$.

| Value | Primitive sets outside the two families |
|---|---|
| $1/6$ | $(1,3,4,5,9)$ |
| $2/11$ | $(1,2,3,5,8)$, $(1,3,4,5,18)$, $(1,4,5,6,7)$ |
| $3/16$ | $(1,3,4,5,11)$, $(1,7,8,9,15)$, $(2,5,7,8,9)$ |
| $4/21$ | $(2,3,5,8,19)$, $(3,5,8,9,13)$, $(3,5,8,11,13)$ |
| $6/31$ | $(1,3,4,5,27)$, $(1,4,5,6,27)$ |

Cordella found all twelve examples and their values by enumerating speeds through 130. His Theorem 6.4 left finitely many possible exceptions to the spectrum prediction. The new claim is the exhaustiveness of his list over all speeds. This is a computer-assisted, unrefereed proof. [Cordella, §6.2](https://arxiv.org/html/2609.03444v2#S6.SS2)

## The finite problem

Cordella's Lemma 4.1 and Theorem 4.2 give the claimed form on both critical families. In particular $`D=\{1,2,3,4,5s\}`$ realizes $s/(5s+1)$ for every positive integer $s$. Yi, Gill and Bu's Corollary 11.6(ii) proves that every primitive five-speed set with $`L<1/5`$ outside those families has Euclidean norm strictly below $B=33750$. We use these two papers as mathematical inputs. Write $v$ for the ordered positive speed vector under consideration. [Cordella, §4](https://arxiv.org/html/2609.03444v2#S4) · [Yi, Gill and Bu, §11.1](https://arxiv.org/html/2610.40694v1#S11.SS1)

For an odd prime $p$ write $`[x]_p=\min(x\bmod p,(-x)\bmod p)`$. A residue vector has a **witness** if some multiplier $t$ makes $`5[tv_i]_p\ge p`$ for every coordinate. The rational time $t/p$ then gives $L\ge1/5$. Existence of a witness is invariant under nonzero modular scaling, coordinate sign changes and permutations. Thus a vector with $`L<1/5`$ lacks a witness at every prime.

We use the following elementary observation twice. Suppose that for every prime in a finite set, at least one member of a fixed list of nonzero integers is divisible by that prime. Then the product of these distinct primes divides the absolute product of the integers. An upper bound strictly smaller than the prime product gives a contradiction.

## First reduction to three parameters

Call an equation $`v_i+v_j=v_k`$ an additive relation, allowing $i=j$. The first finite check certifies a set of primes $p\ge53$ with product greater than $(5B)^{111}$. At each such prime every set of five distinct nonzero folded residues without a witness has at least two additive relations up to signs, or contains a folded dilation of $`\{1,3,4\}`$. In counting relations, a doubled speed and its target count once, and each unordered triple of distinct entries counts once. For distinct nonzero folded residues and $p\ge53$, there is at most one sign choice up to overall sign on each such triple.

Here is how the check covers every set. Among ordered pairs of distinct entries choose the smallest folded quotient $b$, and scale its denominator to one. The normalized set is $1\lt b\lt c\lt d\lt e$, since any smaller remaining entry would be a smaller quotient by one. The ratios in both directions of every pair must fold to at least $b$. For each admissible $b,c,d$, start with every compatible $e>d$. For each multiplier witnessing the first four entries, remove each $e$ witnessed by the same multiplier. Inspect every surviving set for the asserted additive relations. The program may discard a prime as soon as one counterexample to this modular assertion appears. Only fully checked primes count toward the product.

To lift this assertion, suppose the integer tuple has at most one relation and contains no dilation of $`\{1,3,4\}`$. Form the following list, omitting identically zero values at this tuple.

- The five speeds and the twenty forms $`v_i\pm v_j`$ for $i\lt j$.
- The forty forms $`2v_i\pm v_j`$ for $i\ne j$ and the forty forms $`v_i\pm v_j\pm v_k`$ for $i\lt j\lt k$.
- If the sole relation is $x+y=z$ in distinct speeds, the six forms $y-3x,\ 3y-x,\ y+4x,\ 4y+x,\ 3y+4x,\ 4y+3x$.

The last six are nonzero under the supposition. A prime dividing none of the entries preserves distinct nonzero folded speeds and can create no extra additive relation. If a folded dilation of $`\{1,3,4\}`$ occurs, its three distinct coordinates give an additive relation. This must be the existing relation $x+y=z$. After dividing by $x$, the ratio $y/x$ must be one of $3,1/3,-4,-1/4,-4/3,-3/4$ modulo $p$. Indeed the signed triple $(x,y,-z)$ permutes a multiple of $(1,3,-4)$, up to overall sign, since $p\ge53$. One of the six forms must then vanish modulo $p$. Thus every certified prime divides the product of our list. Each of the at most 111 factors has absolute value at most $5B$ by Cauchy–Schwarz. The certified prime product rules this out.

Consequently there are two additive relations, or there is a dilation of $`\{1,3,4\}`$. Two different additive relations have independent coefficient rows. In the dilation case, after permuting coordinates use $`v_1+v_2=v_3`$ and $`3v_1=v_2`$. There are 50 possible additive rows in five positive coordinates, hence 1,225 unordered pairs, plus this last case.

The verifier identifies their kernels with nine three-dimensional spaces up to signed coordinate permutation, discarding kernels that force a zero or a repeated absolute speed. The certificate gives each space as the column span of a $5\times3$ matrix $A$. For reproducibility, two independent rows $r,s$ define their span by the ten minors $`r_i s_j-r_j s_i`$ up to a common factor. The complementary signed three-row minors of $A$ define its annihilator by the same coordinates. The checker compares these integer vectors after dividing by their gcd and fixing their sign. For discarded cases it checks membership of a coordinate row or a signed pair row in the span of $r,s$ by all three-row minors. Each listed $A$ contains the three signed unit rows. A signed permutation of $v$ in its column span therefore has form $Au$ with $u\in\mathbb Z^3$ and $`\|u\|_2\le\|v\|_2\lt B`$.

## Second reduction to two parameters

For each matrix $A$, the certificate supplies a list $H$ of integer rows of length three. The lists were found by fitting lines through modular points. Their validity follows from the following independent exhaustive test.

For a given prime, visit all projective points $(1,i,j),(0,1,j),(0,0,1)$ over $\mathbb F_p$. At each point $u$ either a coordinate of $Au$ vanishes, the vector has a witness, or $hu=0$ for some $h\in H$. Count the prime only if all points pass. Let $P$ be the resulting product, computed separately for each $A$. The check establishes, in exact integers,

```math
P^2>\prod_{r\in\mathop{\mathrm{rows}}(A)\,\sqcup\,H} B^2\sum_j r_j^2.
```

For an integer parameter with no witnesses, every counted prime must divide some $ru$ in this list. This also holds when $u$ reduces to zero. If all $ru$ were nonzero, Cauchy–Schwarz and the divisibility observation would contradict the displayed inequality. The speed coordinates are nonzero, so $hu=0$ over the integers for some listed $h$.

Choose an index $j$ with $h_j\ne0$. With the other two entries of $u$ as free parameters, a speed row $a$ becomes the pair of coefficients $`a_i h_j-a_jh_i`$ for $i\ne j$, after multiplying all speeds by $h_j$. Only the ratio of the two free parameters matters. Take coprime representatives $x,y$, allowing a common sign change, with $0\lt x\le B$ and $`|y|\le B`$, and also check $(0,1)$. The bound holds because both original parameters were entries of $u$. Drop maps with a forced zero speed, repeated absolute speeds, or a forced critical quadruple. Removing identical maps leaves 164 maps.

## Exhausting the rational directions

At each of the primes 50021 and 50023, for each remaining map, the verifier tests every slope $r$ on $(1,r)$ for a witness. For each surviving slope modulo 50021 it tries each $1\le x\le B$. If $y_0=rx\bmod 50021$, the only lifts in $`[-B,B]`$ can be $y_0$ and $y_0-50021$. Test the second prime using $y/x\bmod 50023$, and retain coprime parameters. Both primes exceed $B$, so $x$ is invertible. Convert every surviving direction to sorted primitive absolute speeds and apply the original distinctness, norm and critical-family restrictions. Exactly 317 different quintuples remain.

For each candidate an exact rational witness suffices to discard it. For the others the maximum can be computed at times $`a/(d_i+d_j)`$ with $i\lt j$. For a maximum strictly between zero and $1/2$, the minimum of the five triangular waves must have active slopes of opposite signs. Their distances agree, so their phases are negatives modulo one. A maximum of $1/2$ occurs only when every phase is $1/2$ and is also covered by a pair sum. Reflection reduces the numerators to $`0\le2a\le d_i+d_j`$. Comparing fractions gives exactly the twelve rows grouped in the table. This proves the classification and the theorem.

## Five-distance consequence of Zhu's conjecture

If a set of five integer distances gives a triangle-free distance graph on $\mathbb Z$, it has no additive relation. Every entry in the table and both critical families have such a relation. Hence some time $t$ satisfies $`\|td\|\ge1/5`$ for every distance. Color the integer $m$ by $`\lfloor 5\{mt\}\rfloor`$. Two phases in the same half-open interval have circular distance strictly less than $1/5$, so this is a proper five-coloring. This proves the five-distance instance of Zhu's triangle conjecture. [Barajas and Serra, 2008](https://doi.org/10.1016/j.disc.2007.07.061)

## Reproduction

Run from the repository root with Python 3.10 or later and a C++20 compiler.

```sh
python3 results/five-speed-spectrum/verify.py
```

The verifier reads the nine maps and their proposed line covers, rebuilds the C++ arithmetic search, and recomputes all finite assertions, including the twelve exact values. All prime-product comparisons use unbounded integers. There is no Lean formalization of this result. [Verifier](verify.py) · [Finite-field enumeration](sieve.cpp) · [Line certificates](cover.json)
