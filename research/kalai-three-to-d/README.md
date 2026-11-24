# Kalai’s $3^d$ conjecture

**Partial research.** The conjectured face bound holds for centrally symmetric prismatoids whose bases are arbitrary hypersimplices. A face-count identity extends the bound to Cartesian products, joins and Minkowski additions of the qualifying bases. Equality in the hypersimplex family occurs exactly for simplex bases and the octahedral hypersimplex. The result leaves general prismatoids and unrestricted centrally symmetric polytopes open. [Issue #384](https://github.com/1337isnot1337/solved-conjectures/issues/384)

## Target and sources

Kalai’s 1989 conjecture asks whether a centrally symmetric $d$-dimensional polytope always has at least $3^d$ nonempty faces, counting the polytope itself. This is the face count, with equality at the cube and cross-polytope. The November 24, 2026 source check found results for simplicial, unconditional and locally anti-blocking polytopes and other classes, with no unrestricted resolution. The formula below uses exposed pairs of faces of a base polytope and its negative. Priority for the hypersimplex count and the combined closure argument is provisional. [Kalai’s first-person formulation](https://gilkalai.wordpress.com/2021/01/10/open-problem-session-of-huji-combsem-problem-5-gil-kalai-the-3%E1%B5%88-problem/) · [Sanyal–Werner–Ziegler](https://arxiv.org/abs/0708.3661) · [Sanyal–Winter](https://arxiv.org/abs/2308.02909)

## Face count and closure under operations on the base

Write $f(F)$ for the number of nonempty faces of a polytope $F$, including $F$. Put

```math
P(F)=\operatorname{conv}\bigl((F,1)\cup(-F,-1)\bigr),\qquad D=F-F.
```

The polytope $P(F)$ has dimension $\dim F+1$, even if $F$ is embedded in a larger ambient affine space. Its faces meeting just one of the two bases give $2f(F)$ possibilities. A face meeting both bases has a common horizontal exposing direction $u$, corresponding to the pair $(F^u,F^{-u})$ of maximizer faces of $u$ and $-u$ on $F$. Conversely, the vertical coefficient can always be chosen to tie the two maxima for any $u$, so this pair gives such a face, including the whole prismatoid when both entries are $F$. The pairs are in bijection with the faces of $D$, because the preimage of a face $D^u$ under subtraction from $F\times F$ is precisely $F^u\times F^{-u}$. Thus

```math
f(P(F))=2f(F)+f(F-F).
```

Projection onto the first entry of the face pairs is surjective, so $f(F-F)\ge f(F)$. More generally the exposed-pair argument shows that Minkowski addition cannot reduce the face count of either summand. If $F$ satisfies $f(P(F))\ge3^{\dim F+1}$, then so does $F+K$ for any $K$ whose affine span is parallel to a subspace of the direction space of $F$. The dimension stays the same, and both $f(F+K)$ and $f((F+K)-(F+K))$ are at least the respective terms for $F$.

For a product of bases $F_1,F_2$, both the base face counts and the difference-body face counts multiply. Set $u_i=f(F_i)$ and $v_i=f(F_i-F_i)$. Then

```math
3(2u_1u_2+v_1v_2)-(2u_1+v_1)(2u_2+v_2)
=2(v_1-u_1)(v_2-u_2)\ge0.
```

So the bound is preserved by products, with the factor three accounting for the prismatoid having just one extra dimension. It is preserved by joins as well. Embed the prismatoids of the two bases in complementary linear subspaces, using height one for both positive bases. The convex hull of these two positive bases in the hyperplane where the sum of heights is one realizes $F_1*F_2$. Its prismatoid is the free sum of the original prismatoids. The polar of a free sum is the Cartesian product of the polars. Polarity preserves the total number of nonempty faces since it exchanges the full and empty faces, and face counts multiply under products. This yields the bound for $P(F_1*F_2)$.

## Hypersimplex bases

Set $F=\Delta(k,n)=\{x\in[0,1]^n:\sum_i x_i=k\}$ with $1\le k\lt n$, so $\dim P(F)=n$. Coordinate complementation lets us assume $2k\le n$. A nonvertex face of $F$ is uniquely determined by disjoint sets $A,B$ of coordinates fixed at one and zero respectively, with $a=|A|\lt k$ and $b=|B|\lt n-k$. To see uniqueness, on the remaining coordinates the sum hypersimplex has an interior point relative to its sum hyperplane with every coordinate strictly between zero and one. Conversely, exposing a face of $F$ chooses its $k$ largest coordinate weights, so any nonvertex face has the stated form. The vertices contribute $\binom nk$ additional faces.

### The case $2k\lt n$

Use the $3^n$ ordered ternary partitions $(A,B,U)$ of the coordinate set. The top and bottom nonvertex faces can respectively be indexed by the patterns $a\lt k,\ b\lt n-k$ and $b\lt k,\ a\lt n-k$. Denote the size of their union by $Z$ and of their intersection by $I$. The remaining patterns are the main class $a,b\ge k$ of size $X$ and the two oppositely signed tails of equal size $Y$. One tail has $a\lt k,\ b\ge n-k$ and the other has $b\lt k,\ a\ge n-k$. Hence

```math
3^n=X+2Y+Z,\qquad 2f(F)=Z+I+2\binom nk.
```

All main-class patterns yield distinct faces of $D$. Use weights high on $A$, low on $B$, and intermediate on $U$. The maximizing bases are all $k$-subsets of $A$, and the minimizing bases all $k$-subsets of $B$. Because $A$ and $B$ are disjoint, they can be recovered as the sets of coordinates capable of being positive and negative respectively on the corresponding face of $D$.

For a pattern in the first tail, put $S=A\cup U$, $r=|S|\le k$. Choose once for every such $S$ an injection from $S$ into its complement, possible because $2k\lt n$. Let $L$ be the image of $A$ under this injection, write $a=|L|$, and let $M$ be the complement of $S\cup L$. Use weights high on $S$, low on $L$, and intermediate on $M$. Maximizers choose all of $S$ and $k-r$ elements of $M$. Minimizers choose all of $L$ and $k-a$ elements of $M$. Both choices are possible and strict below the available number of elements of $M$ whenever the choice size is positive, since $n-r>k$ and $n-a>k$. The coordinates identically $+1$ on the exposed face of $D$ are exactly $S$ and those identically $-1$ exactly $L$. Thus the tail assignment is injective, since $S,L$ recover $A$ and the original pattern. Use the sign-reversed assignment for the other tail.

If $r<k$, every coordinate of $M$ can have either sign, so such a tail face differs from all main-class faces. If $r=k$ and $a>0$, the number of identically negative coordinates is positive and below $k$. In a main-class face this number is zero or $k$. Discard the $\binom nk$ patterns with $r=k,a=0$ in each tail to avoid the remaining main-class overlap. A collision between opposite tails can occur only if $r=a<k$ in both, since the numbers of coordinates identically positive and identically negative are reversed between the two assignments, and $r\ge a$ in each. In a single tail there is at most one such pattern per $S$ of size $r<k$. Therefore

```math
f(D)\ \ge\ X+2Y-2\binom nk-\sum_{r=0}^{k-1}\binom nr.
```

The intersection $I$ contains at least $\sum_{r=0}^{k-1}\binom nr$ patterns, by taking $B=\varnothing$ and $|A|<k$. Combining the counts proves $2f(F)+f(D)\ge3^n$. When $k\ge2$, the intersection has further patterns with $A=\varnothing$ and $|B|=1$, so the bound is strict. For $k=1$, the prismatoid over the simplex has its $n$ top vertices linearly independent in its span and is a cross-polytope, which attains equality.

### The case $2k=n$

Here $F$ is centrally symmetric up to translation, so $f(D)=f(F)$. To prove the bound directly, let $T_k$ be the chance that at least $k$ coordinates in a uniformly chosen ternary pattern on $2k$ coordinates are in $A$. Let $p_k$ be the chance that exactly $k$ are in $A$ and put $e_k=\binom{2k}{k}/3^{2k}$, so $p_k=2^k e_k$. Inclusion–exclusion for the two color counts, including the vertex term, gives

```math
\frac{f(\Delta(k,2k))}{3^{2k}}=1-2T_k+2e_k.
```

Appending two independent ternary coordinates gives

```math
T_{k+1}-T_k
=-\frac49 p_k+\frac19\frac{2k}{k+1}p_k,
\qquad
\frac{e_{k+1}}{e_k}=\frac{2(2k+1)}{9(k+1)}.
```

The first formula loses patterns with exactly $k$ occurrences and no new occurrence, and gains those with $k-1$ occurrences and two new ones. The ratio of the probabilities of $k-1$ and $k$ occurrences is $2k/(k+1)$. The change of the displayed normalized face count is consequently

```math
e_k\,\frac{4(k+2)2^k-10k-14}{9(k+1)}.
```

This is zero at $k=1$ and positive for $k\ge2$. For instance $2^k\ge k+2$ when $k\ge2$ and $4(k+2)^2>10k+14$. The initial normalized value is $1/3$. Thus $f(F)\ge3^{2k-1}$ with equality precisely at $k=1,2$. In the second equality case $F=\Delta(2,4)$ is an octahedron and the prismatoid is its product with an interval, up to translation and shear.

## Exact controls and open scope

For all $2\le n\le7$ and $1\le k\le\lfloor n/2\rfloor$, an exact check enumerated every weak order on the coordinate weights. For each order it computed the maximizing and minimizing basis subsets and counted distinct single faces and distinct pairs. The resulting counts agree with the formulas and the inequality, including equality for $k=1$ and $(k,n)=(2,4)$. For instance for $\Delta(2,5)$ the counts were $f(F)=81$ and $f(D)=141$, so the prismatoid has 303 nonempty faces.

The face-count identity reduces the whole prismatoid case to $2f(F)+f(F-F)\ge3^{\dim F+1}$ for arbitrary $F$. The ternary assignment used above depends on the maximizer description for hypersimplices. General prismatoid bases and centrally symmetric polytopes without such a two-base description remain unresolved by this argument.
