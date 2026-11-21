# Bounds from the shared primes

Write $D=\max_{i<j}\gcd(n_i,n_j)$ for a disjoint family of $k\ge2$ cosets. The results below concern the exact index pattern. The primes and their exponents may vary with the family.

## An additive bound for two primes

If all indices use just two primes $p<q$, in **any group**,
$$
k\le D+1+\lfloor\log_q D\rfloor.
$$
The same bound holds in a finite solvable group if only two primes divide more than one index, however many private primes occur. More generally, for a nonempty set $S$ of allowed primes in either of these senses and any $p_0\in S$,
$$
k\le D-1+\prod_{p\in S\setminus\{p_0\}}(\lfloor\log_p D\rfloor+2).
$$
For one allowed prime this gives the exact conjectured bound.

**Proof.** Take $b_i=n_i$ in the first setting. In the solvable case take $b_i$ to be the $S$-part of $n_i$. In both cases $\sum_i1/b_i\le1$, by ordinary counting or the [private-prime argument](README.md) respectively. Pairwise gcds of the $b_i$ still have maximum $D$. If all $b_i\le D$, counting already gives $k\le D$. Otherwise there are at most $D-1$ indices with $b_i\le D$.

For each remaining index clip its $p$-exponent at $\lfloor\log_p D\rfloor+1$ for every $p$. The resulting integer still exceeds $D$. No two clipped vectors are comparable coordinatewise, since otherwise the smaller clipped integer divides the gcd of the original pair. Deleting one coordinate is therefore injective on this set of vectors. The other coordinates give the product in the displayed bound. For two primes, delete the smaller prime's coordinate.

## Two-prime supports in the squarefree transfer

In either group setting of the [squarefree-gcd transfer](squarefree-gcds.md), assume also that each index is divisible by at most two **shared** primes. Then the **exact** inequality $D\ge k$ holds, with no bound on $k$.

Indeed the transfer gives disjoint arithmetic progressions with squarefree moduli, each supported on at most two primes. It suffices to prove the bound for these reduced moduli, which divide the original ones. Their supports intersect pairwise by the Chinese remainder theorem. If they share a prime $p$, split by residue modulo $p$. Within one bucket, divide the moduli and the differences of the representatives by $p$, retaining disjoint progressions. The bucket with the most members has at least $\lceil k/p\rceil$. If it contains just one member then $k\le p$. Otherwise all moduli in that bucket are now primes, and they must be the same prime $q$ since distinct primes give intersecting progressions. At most $q$ members fit there, so $k\le pq$, a common divisor of two original moduli in that bucket.

If the supports have no common prime, all three of $\{p,q\},\{p,r\},\{q,r\}$ occur and these are the only supports. To see this, start from two distinct intersecting supports. A support omitting their common prime must contain both other primes. Every subsequent support must meet each of those three edges. Write $p<q<r$, so the possible moduli are $pq<pr<qr$. If $qr$ repeats, every modulus is at most $D$ and counting suffices. If $pr$ repeats and $qr$ does not, all but one modulus are at most $D$. Their reciprocals sum to strictly less than one, giving $k-1<D$. In the remaining case the two larger moduli each occur once. A class modulo $pr$ occupies $q$ distinct residues modulo $pq$, so there are at most $pq-q$ classes modulo $pq$. If $pq$ repeats, $k\le pq-q+2\le pq\le D$. If it occurs just once, $k=3$ and the two larger moduli share the prime $r\ge5$.

## A nearly complete set of equal indices

In a finite nilpotent group suppose that $m-h$ disjoint cosets have index $m$, where $1\le h\le m$. Every further coset of index $n$ disjoint from them satisfies
$$
m/\gcd(m,n)\le h.
$$
If $h=1$, the entire complement is a Cartesian product in Sylow coordinates, with coordinate densities exactly $1/m_p$ for $m_p=p^{v_p(m)}$. In particular two further disjoint cosets have indices whose gcd is a multiple of $m$ strictly larger than $m$.

**Proof.** Work with the product of uniform measures on the Sylow coordinates. The uncovered set $E$ has measure $h/m$. For a subset $S$ of coordinates, put $m_S=\prod_{p\in S}m_p$. Upon fixing the coordinates in $S$, each occupied box either misses the fiber or covers a fraction $m_S/m$ of it. These occupied slices remain disjoint. A nonempty uncovered slice therefore has measure at least $m_S/m$ within the fiber, giving
$$
\mu_S(\operatorname{proj}_S E)\le h/m_S.
$$
The projected coset of index $n$ has measure $1/n_S$. Choose $S$ to consist of the primes for which $m_p>n_p$. This gives the first inequality.

When $h=1$, apply the projection inequality to each singleton. The product of the projections contains $E$ and has measure at most $1/m$, so equality holds everywhere and $E$ is that entire product. For each further coset, containment gives $n_p\ge m_p$ for every $p$, hence $m\mid n$. Two disjoint further cosets must be disjoint in some coordinate. Neither can equal the whole projection there, so both local indices strictly exceed $m_p$ and are divisible by $p m_p$. Their global gcd is divisible by $pm$.

This complement argument uses the sizes of boxes and finite fibers. The factors of the complementary product need not themselves be cosets. It rules out every proposed counterexample with largest pairwise gcd $m$ and at least $m-1$ cosets of index $m$, provided there are at least $m+1$ cosets in the family.

## Rounding the available space in a fiber

There is another obstruction when the cosets have several different indices. In the same finite nilpotent setting, let $S$ be any collection of Sylow coordinates and $B$ a positive integer. Write $T=S^c$ and $J=\{i:(n_i)_S\nmid B\}$, where $(n_i)_S$ is the product of the prime parts in $S$. Then
$$
 B\sum_{i\notin J}\frac1{n_i}
 +\mu_T\!\left(\bigcup_{j\in J}\operatorname{proj}_T C_j\right)\le B.
$$
Indeed, fixing the $T$ coordinates, each surviving box outside $J$ occupies an integer number of $1/B$ units of the $S$-fiber. Wherever any box in $J$ survives, the total of these integers is at most $B-1$. Integrating gives the bound. In particular the union term is at least $\max_{j\in J}1/(n_j)_T$ when $J$ is nonempty. If an exceptional index is supported entirely on $S$, this term equals one.

For example, consider two index-9 cosets, eight index-12 cosets and one each of indices 24, 27 and 36. This numerical pattern would refute Sun's conjecture if realizable. Take $S=\{3\}$ and $B=3$. The index-27 box projects onto the entire complementary factor. The index-12 and index-24 boxes alone require $3(8/12+1/24)=17/8$ units on average, exceeding the two available. This excludes the pattern in every finite nilpotent group without a search over subgroups.

[Lean verification of the projection count and rectangular equality case](RectangularComplement.lean) handles arbitrary finite sets of points in two coordinates. The two results compile with the repository's Lean 4.35.0 toolchain and use only `propext`, `Classical.choice` and `Quot.sound`. The group-to-fiber reduction is the written argument above.

The fiber estimate also has a version for **arbitrary finite groups and arbitrary subgroups**. Fix $K\le G$. For $C_i=g_iH_i$ put $b_i=[K:K\cap H_i]$ and let $U_i$ be the set of left $K$-cosets meeting $C_i$. With uniform measure on $G/K$ and $J=\{i:b_i\nmid B\}$, one has
$$
 B\sum_{i\notin J}\frac1{n_i}+\mu\!\left(\bigcup_{i\in J}U_i\right)\le B,
 \qquad \mu(U_i)=\frac{b_i}{n_i}.
$$
If a fiber meets $C_i$ at $y$, its intersection with $C_i$ is $y(K\cap H_i)$, of relative size $1/b_i$. Counting over fibers gives the formula for $\mu(U_i)$, and the same integer rounding as above proves the inequality. When $K$ is a normal Hall subgroup on a set of primes $S$, its intersection with each $H_i$ is the Hall $S$-subgroup of $H_i$. Thus $b_i=(n_i)_S$, so the preceding numerical exclusion also applies whenever a Sylow 3-subgroup of $G$ is normal.
