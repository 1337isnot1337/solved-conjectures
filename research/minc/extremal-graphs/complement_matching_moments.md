# Maximum permanent when the line sum does not divide the order

Let $G$ be a simple $r$-regular bipartite graph with $n$ vertices per side and biadjacency matrix $X$. Write $c_{uv}$ for row codegrees, including $c_{uu}=r$, and set

```math
 D(G)=\sum_{u,v} c_{uv}(r-c_{uv})=nr^3-\mathop{\mathrm{tr}}((XX^T)^2).
```

This measures the shortfall in four-cycles relative to complete $r$-blocks, including when $r$ does not divide $n$. Uniformly for $2\le r=o(n)$, there is a common positive reference $Z_{n,r}$ independent of $G$ such that whenever $D(G)>0$,

```math
 \frac{\mathop{\mathrm{per}}(\mathbf1\mathbf1^T-X)}{Z_{n,r}}
 =1-(1+o(1))\frac{D(G)}{4n^4}.                                 \tag{1}
```

In particular if $r\nmid n$ and $r=o(\sqrt n)$, a binary $(n-r)$-regular matrix eventually beats **every** circulant in permanent. More generally the same holds if $r=o(n)$ and $`r\mathop{\mathrm{dist}}(n,r\mathbb Z)=o(n)`$ with $r\nmid n$. This is an all-order-of-growth comparison for [Minc’s Problem 12](https://yair-lavi.com/mincs-list/problem-12/index.html). It also reduces the [Problem 4](https://yair-lavi.com/mincs-list/problem-4/index.html) maximization to relative near-minimization of $D$ throughout sublinear complement degree. It does not identify exact optimizers with nearly tied nonzero deficits. Wanless treats the four-cycle comparison at fixed degree in [the original complementary permanent paper](https://users.monash.edu.au/~iwanless/papers/complementDM.pdf). Here all higher matching moments are controlled by the *actual* four-cycle deficit, with constants uniform in the degree.

## Matching moments

Let $R_j(G)$ count matchings of size $j$, and define $F_G(x)=\sum_{j=0}^n(-1)^jR_j(G)x^{n-j}$. Its zeros $\lambda_i$ are the squares of the nonnegative matching roots (pair the symmetric roots with multiplicity). They lie in $[0,4r]$. For $l\ge1$ write $p_l(G)=\sum_i\lambda_i^l$ and $`p_l^*=(n/r)p_l(K_{r,r})`$. We claim

```math
 0\le p_l(G)-p_l^*\le 4^l l^3 r^{l-4}D(G),\qquad
 p_l(G)-p_l^*=0\ (l<4),\qquad p_4(G)-p_4^*=D(G).               \tag{2}
```

We use the classical path-tree expression for matching moments: $p_l(G)/n$ is the expected number of length-$`2l`$ returning walks at the root of the self-avoiding path tree of a uniform vertex of $G$. Extending by one new vertex is an up-step and deleting the last vertex is a down-step. A returning walk has one of at most $4^l$ Dyck shapes. Both this expression and the root bound follow from [Godsil’s identity and the matching-measure theorem, Theorems 2.1–2.2](https://real.mtak.hu/33505/1/abert.pdf).

For a fixed shape initially choose the root uniformly. At each up-step choose a uniform random neighbor independently given the current vertex, including previously visited neighbors. Pop the last vertex at each down-step. Continue the process even after invalid choices. It represents a valid path-tree walk precisely when each up-step avoids the current stack of vertices. Its probability times $r^l$ is the expected walk count for that shape. Without this restriction the current stack, from root to tip, has the stationary simple random walk law of that length, since popped excursions do not affect the later choices.

At an up-step with $b$ opposite-side ancestors on the stack (the parent counts), use $\min(b,r)$ as the complete-block forbidden count. For the complete block this gives the correct survival recurrence, including after a first impossible extension. For an arbitrary graph, on surviving histories the forbidden count is at most $\min(b,r)$ because the surviving stack has distinct vertices. At this step the amount by which the graph's survival probability exceeds multiplication of its previous survival probability by $1-\min(b,r)/r$ is nonnegative and bounded by $1/r$ times the expected number of opposite-side ancestors nonadjacent to the tip. The latter expectation can be taken without conditioning or the survival indicator for this upper bound: it counts ancestors by position even on a stack with repetitions.

Let $P$ be the symmetric $2n$-vertex simple random walk transition matrix. For a stationary segment of odd length $2j+1$, its endpoint adjacency probability is $`r\mathop{\mathrm{tr}}(P^{2j+2})/(2n)`$. The length-one probability is one. All eigenvalues have modulus at most one, so $1-x^j\le j(1-x)$ for $0\le x\le1$ gives

```math
 \Pr(X_0\not\sim X_{2j+1})\le j\Pr(X_0\not\sim X_3)=j\delta,
 \qquad \delta=1-r\mathop{\mathrm{tr}}(P^4)/(2n)=D(G)/(nr^3).
```

There are at most $l$ ancestors and at most $l$ up-steps. At each step the error in the survival recurrence is at most $l^2\delta/r$. Earlier errors are multiplied by factors between zero and one, so the total error is at most $l^3\delta/r$. Multiplication by $nr^l$ and summation over shapes proves the upper estimate in (2) as well as nonnegativity. Before stack depth three the forbidden ancestors are absent or just the parent, so there is no difference. At $l=4$ only the shape of four consecutive up-steps followed by four down-steps can differ. Its fourth extension has a surplus $\delta/r$ because nonadjacency of the initial vertex to the three-step endpoint implies that the first three steps were self-avoiding (a repeated vertex would be an immediate backtrack here). The complete-block count uses two ancestors, permissible since $r\ge2$. This gives exactly $nr^4\delta/r=D(G)$.

## Integrating the root comparison

For all sufficiently large $n$ in the claimed range, define

```math
 Z_{n,r}=\int_{n/2}^\infty e^{-x} F_{K_{r,r}}(x)^{n/r}\,dx.
```

Every root is below $n/2$ in this regime, so the real power is well-defined. Rook inclusion-exclusion and $\int_0^\infty e^{-x}x^m dx=m!$ give the exact complementary permanent as $\int_0^\infty e^{-x}F_G(x)dx$. For $x\ge n/2$ the absolutely convergent logarithmic series and (2) give

```math
 \log\frac{F_{K_{r,r}}(x)^{n/r}}{F_G(x)}
 =\sum_{l\ge4}\frac{p_l(G)-p_l^*}{l x^l}
 =\frac{D(G)}{4x^4}(1+O(r/x)).                                 \tag{3}
```

Indeed the sum for $l\ge5$ is bounded by $(D/x^4)\sum_{l\ge5}4^l l^2(r/x)^{l-4}=O((D/x^4)r/x)$ uniformly as $r/x\to0$. The logarithm is nonnegative, and $D\le nr^3=o(n^4)$, so exponentiating supplies the corresponding first-order relative difference uniformly.

Under the probability weight $e^{-x}F_{K_{r,r}}(x)^{n/r}/Z_{n,r}$ on $x\ge n/2$, $x/n\to1$ in probability. Indeed the unnormalized weight is bounded by the gamma weight $e^{-x}x^n$, and on $|x-n|\le\sqrt n$ its ratio to that weight is at least $(1-4r/(n-\sqrt n))^n\ge e^{-O(r)}$. The gamma law there has mass bounded below by Stirling (its density is comparable to $1/\sqrt n$ throughout). Gamma tails beyond any fixed relative distance are exponentially small by the exponential Markov bound. Since $r=o(n)$, the assertion follows, and $\mathbb E x^{-4}=(1+o(1))n^{-4}$ by $x\ge n/2$.

On $4r\le x\le n/2$ the absolute integrand for $G$ is at most $e^{-x}x^n$; on $0\le x\le4r$ it is at most $(4r)^n$. Both truncated integrals are $O(n!e^{-c n})$ for some absolute $c>0$ eventually, by the same gamma bound and $r=o(n)$. As $Z_{n,r}\ge n! e^{-O(r)-O(1)}$ and a positive integer $D$ is at least one, these tails are negligible even on the scale $Z_{n,r}D/n^4$. Integrating (3) proves (1). If $D=0$ every row codegree is zero or $r$, forcing a union of $K_{r,r}$ components and $r\mid n$.

## The growing-complement circulant comparison

For a circulant zero pattern with step set $S$ and codegrees $c_g=|S\cap(S+g)|$, the periods with $c_g=r$ form a subgroup of order $h$ dividing both $r$ and $n$. If $r\nmid n$, it is proper in the sense $h\le r/2$. Since $S$ is a union of cosets, all $c_g$ are multiples of $h$. Thus on nonperiods $r-c_g\ge h$, and $\sum_g c_g=r^2$ gives

```math
 D(G)\ge n h(r^2-hr)\ge n r(r-1).
```

The last bound uses the minimum of $h(r-h)$ for integers $1\le h\le r/2$.

For the competitor let $n=br+q$, $0<q<r$. If $q\le r/2$ take complete $r$-blocks and one $r$-regular block of size $r+q$. Its row codegrees are at least $r-q$, since two $r$-subsets of $r+q$ intersect in at least $r-q$. Summing $c(r-c)\le q c$ gives $D\le(r+q)r^2 q$. Otherwise put $s=r-q$. Leave one residual block of size $2r-s$ after removing complete blocks, and split it into groups of sizes $\lfloor(2r-s)/2\rfloor,\lceil(2r-s)/2\rceil$. Take the complement within the residual block of a direct sum of two $(r-s)$-regular supports on these groups. Each row therefore contains its entire opposite group and at most $s$ sites in its own group. For two rows in the same group, $r-c\le s$; for two in different groups, $c\le2s$. Each summand is at most $2rs$, and the block contributes at most $8r^3s$. All other contributions are zero. In either case the competitor has $`D\le8r^3\mathop{\mathrm{dist}}(n,r\mathbb Z)`$. Under the claimed hypothesis its deficit is $o(D(G))$ for every circulant. Formula (1) now gives the strict permanent comparison. For fixed $r$ the eventual conclusion agrees with Wanless; the uniform growing-degree range and error relative to the realized deficit are the content here.

[Wanless’s 2010 paper](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/counting-matchings-and-treelike-walks-in-regular-graphs/7707C8F592F77FDEF4EC32727C496734) develops tree-like-walk subgraph expansions. We use the classical walk representation; the comparison here bounds its higher-order differences by the individual graph's fourth-moment deficit. The [exact replay](verify_complement_moments.py) checks the first nine matching power sums, the precise fourth deficit, and the complementary rook integral for 489 graphs by subset matching counts and Newton's identities.
