# Ryser’s design conjecture

There is an absolute $C>0$ with the following property for all sufficiently large $n$. Suppose a symmetric $(n,r,\lambda)$ design exists, $0<\lambda<r$, and $r\le n/(\log n)^C$. **Every complement of such a design has smaller permanent than every $(n-r)$-regular binary non-design of the same order.** Consequently every minimum at these complementary parameters is attained at a design. In particular this holds throughout $r\le n^{1-\epsilon}$ for every fixed $\epsilon>0$, and for all sufficiently large complements of finite projective planes. No ordering among nonisomorphic designs of identical parameters is assumed.

Quantitatively, write $H$ for a design incidence matrix, $G$ for any binary $r$-regular competitor, and $\overline X=\mathbf1\mathbf1^T-X$. Put

```math
 M_0=(r-\lambda)I+\lambda\mathbf1\mathbf1^T,\qquad E=\|GG^T-M_0\|_F^2.
```

If $E>0$, then uniformly over these matrices,

```math
 \frac{\operatorname{per}\overline G}{\operatorname{per}\overline H}
 =1+(1+o(1))\frac{E}{4n^4}.                                      \tag{1}
```

The hypotheses allow both $r$ and $\lambda$ to grow. They do not cover the incidences of projective planes themselves or the full [Ryser conjecture in Minc’s list](https://yair-lavi.com/mincs-list/conjecture-5/index.html). Complementation preserves being a symmetric design at these parameters by direct matrix multiplication. We use $r(r-1)=\lambda(n-1)$, in particular $n\le 1+r(r-1)\le r^2$.

## Matching moments and the required comparison

For a binary bipartite graph write $R_j$ for its number of $j$-matchings and $F_X(x)=\sum_j(-1)^j R_j x^{n-j}$. Its roots belong to $[0,4r]$, and $p_l(X)$ denotes their $l$th power sum. The [matching-moment calculation](../extremal-graphs/complement_matching_moments.md) gives, with $\Delta$ denoting the value on $G$ minus that on $H$,

```math
 \Delta p_1=\Delta p_2=\Delta p_3=0,\qquad \Delta p_4=-E.          \tag{2}
```

Indeed the fourth-moment difference is minus the difference of $\operatorname{tr}((XX^T)^2)$. The error matrix $D=GG^T-M_0$ has zero diagonal and margins, so $\operatorname{tr}(M_0D)=0$. The same squared error $E$ holds for column codegrees, since the Gram matrices have the same squared trace and the same margins and diagonal. In particular $H^TH=M_0$. The sum of absolute off-diagonal codegree deviations on either side is at most $E$, since they are integers.

We establish an absolute constant $c$ for which, for $l\ge5$ and $E\ge1$,

```math
 |\Delta p_l|\le(cl)^{cl}\left(E r^{l-4}+\mathbf1_{l\ge9} n r^{l-5}\right).           \tag{3}
```

All graph homomorphisms below respect a prescribed assignment of the two sides. Counts are labelled. Write $\operatorname{hom}(T,X)$ and $\operatorname{inj}(T,X)$ for homomorphisms and injective homomorphisms, respectively.

### Cycles and the six-vertex complete bipartite pattern

For an even cycle of length $2b$, $b\ge2$, its homomorphism count is $\operatorname{tr}((XX^T)^b)$ (or the transposed version). The difference satisfies

```math
 |\Delta\operatorname{hom}(C_{2b})|\le2^b E r^{2b-4}.             \tag{4}
```

Remove the common constant eigenvector and expand $( (r-\lambda)I+D)^b$. The linear trace vanishes and $|\operatorname{tr}D^j|\le E\|D\|_{\mathrm{op}}^{j-2}$ for $j\ge2$, with $\|D\|_{\mathrm{op}}\le r^2$ by the spectral range of the centered Gram matrix. Each term has power of $r$ at most $2b-4$. The design cycle count is $r^{2b}+(n-1)(r-\lambda)^b\le2r^{2b}$, using $n\le r^2$ and $b\ge2$. A connected unicyclic pattern of $e$ edges is this cycle with trees attached, each extra edge giving a factor $r$ for unrestricted homomorphisms. Its difference is at most $2^e E r^{e-4}$.

We also need a bound on the possible variation of $K_{3,3}$. For $X$ let $T_{abc}=\sum_j X_{aj}X_{bj}X_{cj}$, including triples with repeated indices. Their mean is $\mu=r^3/n^2$. The sum of their squares is $\sum_{ij}((X^TX)_{ij})^3$ by exchanging the sums. On off-diagonal entries expand $(\lambda+d)^3$, using $\sum d=0$, $|d|\le r$ and $\sum d^2\le E$. Since $\lambda\le r^2/n$, subtracting $n^3\mu^2=r^6/n$ gives

```math
 \sum_{a,b,c}(T_{abc}-\mu)^2\le n r^3+4rE.
```

This bound holds also for $H$ with error zero. Because $0\le T,\mu\le r$, expansion of $T^3$ about its mean gives $|\sum T^3-n^3\mu^3|\le4r\sum(T-\mu)^2$. The sum of cubes is precisely the unrestricted count of $K_{3,3}$. Thus its difference is $O(nr^4+r^2 E)$. Controlling this pattern improves the power of $n$ over a spanning-tree bound.

### Reducing connected test graphs

For a connected simple bipartite pattern $T$ of $v$ vertices and $e\ge1$ edges, the following estimate holds (a fixed orientation throughout):

```math
 |\Delta\operatorname{inj}(T)|\le (c_1(e+1))^{c_1(e+1)}
 \left[E r^{\max(v-3,0)}+\mathbf1_{e\ge9}(E r^{e-4}+n r^{e-5})\right].              \tag{5}
```

Induct on the number of vertices. Counts on one or two vertices are determined by the margins. If $z$ is a leaf adjacent to $a$, its number of extensions from an injective embedding of $T-z$ is $r$ minus the number of already used neighbors of $a$. Subtract one injective count with the edge $aw$ imposed for each already used possible $w$. Each resulting pattern is connected with one fewer vertex and no more than $e$ edges. The coefficient $r$ multiplies only the leading term, whose edge count has decreased by one. The displayed powers absorb this factor (if the pattern left has at most two vertices its difference is zero).

If a degree-two vertex $z$ is not a cut vertex, let $a,b$ be its distinct neighbors. From every injective embedding of the connected graph $T-z$, the number of extensions is the codegree of the two anchored images minus the number of already used common neighbors. Replace this codegree by $\lambda$ and subtract, for each possible already used vertex $w$, the injective count with $aw,bw$ imposed. The error from replacement on $G$ is at most $E r^{v-3}$; it vanishes on $H$. Indeed for any fixed distinct images of $a,b$ there are at most $r^{v-3}$ extensions to $T-z$, by growing a spanning forest from the two anchors, and the total absolute codegree error is at most $E$. The $\lambda$ coefficient is at most $r$ and occurs only when two edges were removed. The other terms again have at most $e$ edges and one fewer vertex. These facts verify every exponent on the right of (5) through the two reductions.

If neither reduction applies, $T$ has minimum degree at least two and every degree-two vertex is a cut vertex. If it has just one block (maximal biconnected subgraph), all degrees are at least three. Its two bipartition classes then each have at least three vertices, so $e-v\ge3$, with equality only for $K_{3,3}$. If there are multiple blocks, consider the two end blocks of the block-cut tree at opposite leaves. An end block cannot be a bridge ending in a degree-one vertex. In each such block every vertex except possibly its cut vertex has internal degree at least three, and the cut vertex has internal degree at least two. Both parts have at least three vertices: a part of size at most two would force every vertex on the other side to have degree at most two, impossible in a biconnected end block with just one interface. Thus each end block has at least six vertices and $e_{\rm block}-v_{\rm block}\ge3$ by degree sum and integrality. Cycle ranks $e-v+1$ add over blocks. In particular the whole pattern has $e-v\ge7$ here.

For $e-v\ge4$ choose any cycle of length $2b$. Its homomorphism counts on $G,H$ are bounded above by $2r^{2b}+2^b E r^{2b-4}$ by (4). Grow the other vertices along a forest from that cycle, with at most $r^{v-2b}$ choices. Bounding the two injective counts separately gives $O(2^e[r^{e-4}+E r^{v-4}])$. Such a terminal graph has at least nine edges, and $E\ge1$, so this is covered by (5). At the exception $K_{3,3}$, subtract from its already bounded homomorphism difference the differences of injective counts for all proper vertex-identification patterns. They are simple connected graphs on at most five vertices with at most nine edges, hence covered by induction. The special bound $O(nr^4+r^2E)$ fits (5) at $e=9$. This completes the induction. For the growth of the constant, one may run the entire recursion with the original $e$ held as a size ceiling: there are $O(e+1)$ summands per step, except for an absolute number of identifications at the fixed six-vertex pattern. Each step reduces vertex count. The depth is at most $e+1$, and the terminal cycle constants are at most $O(2^e)$. This gives the displayed form without repeated exponentiation of constants.

For unrestricted homomorphisms of a tree the difference is zero, since the count is $n r^e$. For a unicyclic graph use (4). For any other connected cyclic graph, $v\le e-1$. Express its homomorphism count as the sum of injective counts over all side-preserving vertex-identification patterns. Quotients are connected and have at most $v$ vertices and $e$ edges after merging parallel edges. Estimate (5) therefore gives for every connected simple pattern with at most $l$ edges a homomorphism difference of at most the right side of (3), enlarging $c$. There are at most $(l+1)^{l+1}$ partitions. Trees handle the few small edge counts separately.

Finally use the [Godsil path-tree identity](https://real.mtak.hu/33505/1/abert.pdf). For each Dyck shape of length $2l$, form its abstract rooted tree with one fresh vertex per up-step and reuse its parent when popping. The returning path-tree walks of that shape are precisely the homomorphisms of this tree to $X$ for which each new vertex differs from all its ancestors then on the stack. Summing over all possible roots and dividing by two gives the contribution to $p_l(X)$ (equivalently take the sum for both choices of root side and divide by two). Split these assignments by their exact vertex identifications. Each admissible partition contributes an injective count of a connected quotient. Convert it back to unrestricted counts by Möbius inversion on the two side-preserving partition lattices. The sum of absolute Möbius coefficients for a pattern on $a$ vertices is at most $a!$, by the cycle decomposition of permutations. There are at most $4^l$ shapes and $(l+1)^{l+1}$ admissible partitions for each. The total growth remains $(cl)^{cl}$ and all resulting simple graphs have at most $l$ edges. This proves (3).

## The complementary permanent

For $x\ge n/2$, expansion at infinity and (2) give

```math
 \log[F_G(x)/F_H(x)] = E/(4x^4)-\sum_{l\ge5}\Delta p_l/(l x^l).
```

Choose $L=\lceil10\log n\rceil$ and take the density exponent $C$ in the theorem sufficiently larger than the absolute $c$ in (3), for example $C=30(c+1)$. For $5\le l\le L$, division of the error bound by $E/x^4$ gives at most $(cl)^{cl}[(r/x)^{l-4}+\mathbf1_{l\ge9}(n/x)(r/x)^{l-5}]$. The powers in use are at least $l/5$. Since $r/x\le2/(\log n)^C$, their sum tends to zero by a geometric bound with ratio tending to zero. For $l>L$ the root bound gives $|\Delta p_l|\le2n(4r)^l$, so the remaining relative tail is $O(n^5(8r/n)^{L+1})=o(1)$ using $E\ge1$. These estimates are uniform on $x\ge n/2$. Also $E\le nr^3$ by regularity and the squared-trace formula. Hence $E/x^4=o(1)$ and $F_G/F_H=1+(1+o(1))E/(4x^4)$ there.

The exact complementary permanent is $\int_0^\infty e^{-x}F_X(x)\,dx$ by rook inclusion-exclusion. As in the [integral comparison proof](../extremal-graphs/complement_matching_moments.md), the truncated weight for $H$ on $x\ge n/2$ has mass at least $n!e^{-O(r)-O(1)}$, $x/n\to1$ in probability under its normalization, and the integrals below $n/2$ for $G$ and $H$ are both $O(n!e^{-c_0n})$. These follow solely from the common root bound, the gamma density, and $r=o(n)$. Thus the expected $x^{-4}$ is $(1+o(1))n^{-4}$, and the discarded tails are negligible even for $E=1$. This proves (1) and strict separation. In this comparison $E$ is four times the excess number of four-cycles, as in the [codegree identities](ryser_cycle_reduction.md).

The [source audit](ryser_source_audit.md) distinguishes this permanent conjecture from the unrelated Ryser–Woodall conjecture. Additional searches on complementary symmetric designs, minimum complementary permanents of projective planes, and matching moments retrieved the fixed-degree complementary *maximum* theory and the classical short-cycle formulas. No earlier theorem with this global comparison was identified. The graph-moment method itself has a substantial earlier literature, including [Wanless](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/counting-matchings-and-treelike-walks-in-regular-graphs/7707C8F592F77FDEF4EC32727C496734). This bounded source check does not certify historical priority.

## A gap in four-cycle counts at every design parameter

Even without the density hypothesis, every non-design at admissible parameters has excess four-cycle count $e_4=E/4$ satisfying

```math
 e_4+2\sqrt{e_4}\ge r-\lambda.
```

Let $D'=G^TG-M_0$. Both defects are centered and have squared Frobenius norm $E$. They satisfy $DG=GD'$ because $G$ commutes with $M_0$ by the constant margins. Let $s,s'$ count the nonzero rows of $D,D'$. Some nonzero row $z$ of $D$ has support at most $E/s$, since each nonzero entry is an integer. The vector $zG$ vanishes outside the $s'$ active columns of $D'$. By centering of $z$ and the binary entries of $G$, every coordinate of $zG$ has absolute value at most $\|z\|_1/2$. Hence

```math
 (r-\lambda-\sqrt E)\|z\|_2^2\le zGG^Tz^T=\|zG\|_2^2
 \le \tfrac{s'}4\|z\|_1^2\le \frac{s'E}{4s}\|z\|_2^2.
```

Transposition interchanges $s,s'$. The smaller of the two resulting upper bounds is at most $E/4$, proving the stated gap. In particular one excess four-cycle is already impossible when $r-\lambda>3$. This estimate is not needed for (1).

The [integer replay](verify_ryser_complementary.py) checks the signed fourth-moment identity, the triple-codegree bound and exact complementary permanents for 18 switches of three symmetric designs. Six switches tie the Fano complement at 144, illustrating the large-order qualification on strictness. The other examples have positive gaps 224 or 240 at order eleven and 35,740 at order thirteen. A separate enumeration checks 38 anchored-pattern reductions on the Fano plane and a switched graph.
