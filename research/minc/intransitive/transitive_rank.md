# Permanent dominance for degree-one characters

For every transitive permutation group $H\le S_n$, every degree-one character $\chi$ of $H$, and every complex Hermitian positive semidefinite $A$ of rank $r$ satisfying $256r\le\sqrt n$,

```math
\left|\sum_{g\in H}\chi(g)\prod_i A_{i,g(i)}\right|\le\operatorname{per}A.
```

In particular, for each fixed rank this holds in every sufficiently large transitive degree. The numerical constant gives an explicit uniform statement. The general problem includes intransitive actions and ranks above this range. [Minc Problem 2](https://yair-lavi.com/mincs-list/problem-2/)

## Two estimates for a group action

A zero diagonal gives a zero row. Otherwise diagonal scaling reduces to a correlation matrix, since both sides scale by the same positive factor. Write $w_g=\prod_i A_{i,g(i)}$. We have $|w_g|\le1$. For unit Gram vectors, the uniform complex-sphere bound yields

```math
 P=\operatorname{per} A\ge(r)_n\exp(-nH_{r-1})\ge(n/(e^2r))^n .
```

Here $(r)_n$ is the rising factorial and $H_{r-1}$ the harmonic number. The second inequality uses $(r)_n\ge n!\ge(n/e)^n$ and $H_{r-1}\le1+\log r$. In particular $|H|\le(n/(e^2r))^n$ suffices for every normalized character. [Ma, Lemma 3.1](https://arxiv.org/html/2609.37461v1#S3)

Now use $m$ packets of $k$ rows and set $G_{ij}=\operatorname{per}A_{ij}$. The packet vectors $F_i=\sqrt{k!}\,\mathrm{Sym}(v_{i1}\otimes\cdots\otimes v_{ik})$ have Gram matrix $G$. Put $D=\prod_i G_{ii}>0$ and $h_{ij}=G_{ij}/\sqrt{G_{ii}G_{jj}}$. The sharp two-packet estimate bounds the permanent on the union of packets $i,j$ below by $G_{ii}G_{jj}+(2^k-1)|G_{ij}|^2$. We use [Tubbenhauer, Lemma 7A.1](https://arxiv.org/html/2611.22058v1#S7.SS1), including its normalization, and [Lieb's inequality](https://www.jstor.org/stable/24901474) on disjoint pairs of packets.

For a nonidentity permutation $\tau$ of the packets let $L$ be the sum of $\lfloor j/2\rfloor$ over its cycles of length $j$. There is a matching of $L$ cycle edges with product of $|h_{ij}|^2$ at least $|\prod_i h_{i,\tau(i)}|$. If the latter is positive, rotate a maximum matching uniformly on each cycle. Each directed edge is selected with probability $\lfloor j/2\rfloor/j\le1/2$ (choose the orientation uniformly for a two-cycle). Since $\log|h_{ij}|\le0$, the expected log product gives the claim. The case of a zero product is immediate. Hence the two-packet bound and Lieb's inequality give

```math
 P/D\ge\prod_{ij\text{ matched}}(1+(2^k-1)|h_{ij}|^2)
 \ge1+(2^{kL}-1)\left|\prod_i h_{i,\tau(i)}\right| .
```

The second inequality expands the product and uses that the product of any subset of the edge weights dominates their full product. If $k\ge3\log_2(2m)$, summing the last bounds proves

```math
 \sum_{\tau\in S_m}\left|\prod_i G_{i,\tau(i)}\right|\le P . \tag{1}
```

Indeed a permutation moving $s$ points has $L\ge s/3$ and there are at most $m^s$ such permutations. The sum of $(2^{kL}-1)^{-1}$ over all nonidentity permutations is at most $2\sum_{s\ge2}(m2^{-k/3})^s\le1$. This controls the absolute values of the packet-permutation sums after the internal permutations have been summed. [Related cycle estimate for individual permutations](../orbit-bounds/primitive_dominance.md)

## Minimal blocks and group size

Assume $r\ge1$, so $n\ge65536$. For a primitive group outside $A_n,S_n$, Bochert's bound gives a base of size at most $n/2$. Since a base image determines the element, $|H|\le n^{n/2}$ and the sphere estimate suffices. For $A_n$ only the trivial linear character occurs and its sum is $(P+\det A)/2$. For $S_n$ the two character sums are the permanent and the determinant. In both cases $0\le\det A\le P$. [Bochert bound and a stronger modern theorem](https://arxiv.org/abs/1802.06972)

For an imprimitive transitive group, take a smallest non-singleton proper block. Its translates give $m$ blocks of size $k$ with $mk=n$. Its setwise stabilizer induces a transitive primitive group $K$ on the block. Indeed a proper nontrivial block of $K$ would remain a block of $H$, since translates leaving the containing block are disjoint from it. Label the other blocks using group elements taking the first block to each of them. Then $H\le K\wr S_m$.

If $(k!)^m m!\le(n/(e^2 r))^n$ the group size bound suffices. Otherwise $(k!)^m m!\le k^n m^m$ implies $m^{1-1/k}<e^2r<\sqrt n/32$. This excludes $k=2$, for which the left side equals $\sqrt{n/2}$. It also excludes $3\le k\le n^{1/4}$, for which $m\ge n^{3/4}$ and the left side is at least $\sqrt n$. Thus $k>n^{1/4}\ge\log_2 n$ (the last inequality holds for $n\ge2^{16}$). It follows that

```math
 m<2e^2r<\sqrt n/16,\qquad k>16\sqrt n,\qquad
 k>m,\quad k>r,\quad k\ge3\log_2(2m).
```

Here $m^{1/k}\le2$ and $2m\le n$. If $K$ does not contain $A_k$, use Bochert's bound again. Then $|H|^{1/n}\le \sqrt k\,m^{1/k}\le2\sqrt n<n/(e^2r)$.

It remains to consider $K=A_k$ or $S_k$. Let $N$ be the kernel on the blocks and $B=N\cap A_k^m$. The projection of $N$ on the first block is normal in $K$ and has index at most $m!$, since the setwise stabilizer modulo $N$ embeds in $S_m$. As $k>16\sqrt n$ and $m<\sqrt n/16$, one has $|A_k|>m!$. Simplicity of $A_k$ therefore forces the projection to contain $A_k$, and the same holds at each coordinate. The commutator $[N,N]$ lies in $B$ and projects onto $A_k$ in every coordinate, so $B$ is subdirect in $A_k^m$.

A subdirect subgroup of $S^m$ for a nonabelian simple group $S$ is a product of diagonal copies of $S$, with independent automorphisms allowed on the coordinates of each copy. To verify this, inductively project away the last factor. By Goursat's lemma the last factor is independent, or is an isomorphic image of a simple quotient of the preceding product. Such a quotient comes from exactly one direct factor, since the images of different factors commute and are normal. This adds the last coordinate to the corresponding diagonal copy. The partition into coordinate sets is intrinsic: two coordinates lie in the same part precisely when their pair projection is the graph of an isomorphism. Conjugation by $H$ preserves $B$ and permutes the coordinates transitively. It preserves this intrinsic partition, so its parts have equal size. [Goursat's lemma](https://doi.org/10.2478/tatra.v64i0.374)

If $B\ne A_k^m$, every part has at least two coordinates and $|B|\le(k!)^{m/2}$. Since $[N:B]\le2^m$,

```math
 |H|^{1/n}\le(2m)^{1/k}\sqrt k\le2\sqrt n<n/(e^2r).
```

This leaves $A_k^m\subseteq H$.

## Summing alternating cosets

Every degree-one character of $H$ is trivial on $A_k^m$ by perfectness. Each coset of $A_k^m$ in the whole wreath product specifies a block permutation $\tau$ and the parities of the $m$ internal bijections. The sum of the monomials in that coset is

```math
 \prod_i\frac{G_{i,\tau(i)}\pm\det A_{i,\tau(i)}}2
 =2^{-m}\prod_iG_{i,\tau(i)},
```

because the rank of every $k$-square cross block is at most $r<k$. There are at most $2^m$ such cosets over each $\tau$. The triangle inequality followed by (1) bounds the absolute character sum by $P$. This finishes the transitive case claimed above.

The proof also shows that when the subgroup contains $A_k^m$ the same conclusion holds for arbitrary degree characters factoring through $H/A_k^m$, provided $r<k$ and $k\ge3\log_2(2m)$. Independently, the packet Frobenius upper bound in [the rank-two block-permanent proof](../orbit-bounds/marcus_packets.md) applies to $\sum_{g\in S_k\wr S_m}|w_g|$: applying the row-norm bounds to the entrywise absolute cross blocks leaves their Frobenius norms unchanged. Consequently for rank two, $m\ge4$, $k\ge2$, that proof gives dominance for every character of every subgroup contained in this wreath product, even when $n$ is below the threshold above.

The [catalogue](https://yair-lavi.com/mincs-list/problem-2/), the [2022 survey](https://arxiv.org/abs/2202.01867), the 2026 papers above and searches for transitive groups, rank-dependent subgroup dominance, bases of imprimitive groups and symmetric packet inequalities were checked. The packet-pair inequality, sphere estimate and group structure inputs are prior work. Historical priority of their combination here is unverified.
