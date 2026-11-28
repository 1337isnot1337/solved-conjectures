# Coulangeon–Lazzarini’s two-shell conjecture

**Result.** The conjecture is false. An explicit integral lattice of dimension $`10`$ has first two nonzero shells that are spherical $`2`$-designs and a third shell that is not. In fact no dimension-independent finite number of initial shells suffices, even for orthogonally indecomposable lattices.

## Statement

Conjecture 21 of R. Coulangeon and G. Lazzarini, [*Spherical designs and heights of Euclidean lattices*](https://doi.org/10.1016/j.jnt.2014.02.015), J. Number Theory **141** (2014), 288–315 ([author preprint](https://arxiv.org/pdf/1401.2891), §5.3, p. 15), asks whether spherical $`2`$-designs on the first two nonempty positive-radius layers of a lattice force spherical $`2`$-designs on all layers. It does not assume irreducibility or unimodularity. Theorem 22 of the preprint proves the implication through dimension $`6`$. The argument below refutes the all-lattice assertion, not any claim about the least counterexample dimension or stationarity for the height.

## Counterexample and arbitrary delay

For a finite nonempty subset $`X`$ of a sphere of radius $`r`$ about $`0`$ in $`\mathbb R^n`$, the spherical $`2`$-design criterion is
```math
\sum_{x\in X}x=0,\qquad
\sum_{x\in X}xx^{\mathsf T}=\frac{|X|r^2}{n}I_n .
```
This follows by testing the coordinate polynomials $`x_i`$ and $`x_i x_j`$. The sphere has vanishing first moments, zero off-diagonal second moments, and equal diagonal second moments summing to $`r^2`$.

Fix a positive integer $`k`$, put $`n=4k+2`$, and take $`v=(0,1,\ldots,1)\in\mathbb Z^n`$. Set
```math
 L_k=2\mathbb Z^n\;\cup\;(v+2\mathbb Z^n).
```
It is a full-rank lattice: it is the preimage of the two-element binary linear code $`\{0,\bar v\}`$ under reduction modulo $`2`$. The standard Construction A description is not needed for anything beyond closure under addition.

All vectors in the nonzero coset have $`4k+1`$ odd coordinates, so their squared norms are at least $`4k+1`$. The first $`k`$ positive squared norms of $`L_k`$ are exactly $`4,8,\ldots,4k`$: below $`4k+1`$ all vectors are in $`2\mathbb Z^n`$, where norms squared are multiples of $`4`$, and $`4j`$ is attained by taking $`j`$ coordinates equal to $`2`$. Every such shell is invariant under coordinate permutations and independent sign changes. Sign changes give zero first moments and off-diagonal second moments; permutations give equal diagonal second moments. Each of the first $`k`$ shells is therefore a spherical $`2`$-design.

The next positive squared norm is $`4k+1`$, attained in the nonzero coset precisely at
```math
 (0,\epsilon_2,\ldots,\epsilon_n),\qquad \epsilon_i\in\{-1,1\}.
```
There is no vector from $`2\mathbb Z^n`$ at this norm. The quadratic polynomial $`x_1^2-x_2^2`$ averages to $`-1`$ on this shell and to $`0`$ on its ambient sphere. Thus this shell is not a $`2`$-design. Taking $`k=2`$ gives the claimed dimension-$`10`$ counterexample, with shell norms squared $`4,8,9`$.

The 2-design property is invariant under scaling. If even-integral rather than integral norm convention is wanted, multiply $`L_k`$ by $`\sqrt2`$. One can also normalize covolume to $`1`$.

## Orthogonally indecomposable witnesses

The index-two example deliberately leaves one coordinate unused. A different binary code avoids that decomposition.

Again fix $`k\ge1`$, now partition $`n=6k+2`$ coordinates into $`A,B,C`$ of sizes $`2k,2k+1,2k+1`$. In $`\mathbb F_2^n`$ use the binary linear code
```math
 D=\{0,\mathbf1_{A\cup B},\mathbf1_{A\cup C},\mathbf1_{B\cup C}\}.
```
Let $`L=\{x\in\mathbb Z^n:\bar x\in D\}`$. The three nonzero codewords have weights $`4k+1,4k+1,4k+2`$, so as before the first $`k`$ positive shells come from $`2\mathbb Z^n`$ and are $`2`$-designs. The $`(k+1)`$st shell consists of sign choices of unit entries on either $`A\cup B`$ or $`A\cup C`$, with zeros elsewhere. Its mean $`x_i^2`$ equals $`1`$ for $`i\in A`$ and $`1/2`$ for $`i\in B`$, so it is not a $`2`$-design.

If $`L=L_U\perp L_W`$ were an orthogonal decomposition into two nonzero lattices, each shortest vector would lie in one summand: otherwise its two nonzero summand components would both have norm at least the shortest norm of $`L`$, contradicting the Pythagorean formula. The shortest vectors of $`L`$ are exactly $`\pm2e_i`$. Therefore the two summand spaces must be the coordinate subspaces of complementary nonempty coordinate sets $`I,J`$. For every $`x\in L`$ its coordinate restrictions to $`I,J`$ would then belong to $`L`$, so the code $`D`$ would be closed under restriction to either part. No two nonzero elements of $`D`$ have disjoint supports; closure under restriction would force every codeword’s support to lie on one side of the partition. All three nonzero words have pairwise intersecting supports and their union is the entire coordinate set, a contradiction. This proves orthogonal indecomposability. In particular $`k=2`$ supplies an indecomposable witness of dimension $`14`$.

## Scope and priority

This is a direct proof for the exact spherical-shell conjecture, without relying on computation. It uses elementary parity lattices; no novelty is claimed for Construction A, or for the individual lattice constructions considered as unlabeled lattices. The specific observation is that these lattices have arbitrarily many initial spherical $`2`$-design shells before a failing shell. Exact-phrase, author-name, and construction-based searches found no previous answer to the published question in the sources inspected. This is not proof of historical priority. For related earlier work on degree-2 designs of minimal shells, see [Böttcher, Fukshansky, Garcia and Maharaj, *Spherical 2-designs and lattices from Abelian groups*](https://arxiv.org/abs/1510.08804). Their setup is not the initial-shell claim considered here.
