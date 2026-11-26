# Wang–Yang’s Eulerian square conjecture

Wang and Yang’s Conjecture 4.3 asserts strict positivity of all minors of $[A(n+k,k)]_{n,k\ge1}$, where $A(m,j)$ counts permutations of $m$ letters with $j-1$ descents. Write $E(a,b)$ for the number of permutations with $a$ ascents and $b$ descents, so they have $a+b+1$ letters. The source matrix has entries $E(n,k-1)$. Reversing a permutation gives $E(a,b)=E(b,a)$. Below the symmetric extension includes $a=0$. [Wang–Yang, §4](https://cfc.nankai.edu.cn/_upload/article/files/ca/07/264e89bc4d9bb418a6d91d482b90/ef62459f-bec2-470d-8199-b57a790de20a.pdf) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/804)

**Proposition.** Every principal minor of the symmetric matrix $E$ is strictly positive, for arbitrary finite index sets. Every two-by-two minor of $E$ with increasing row and column indices is strictly positive. The principal-minor assertion inside Wang and Yang’s indexing uses rows $S$ and columns $S+1$, for finite $S\subseteq\{1,2,\ldots\}$.

## A Gram integral

Let $p_j$ denote the density of the sum of $j$ independent uniform variables on $[0,1]$, with $p_1$ the indicator of $(0,1)$ up to endpoints. The cardinal-spline formula gives $p_{a+b+2}(b+1)=E(a,b)/(a+b+1)!$. It also follows by inclusion–exclusion for the volume of a cube slice and the explicit formula for Eulerian numbers. The symmetry $p_j(x)=p_j(j-x)$ and convolution therefore give

```math
\frac{E(a,b)}{(a+b+1)!}=\int_0^\infty p_{a+1}(x)p_{b+1}(x)\,dx.
```

The spline identity is classical. [Wang–Xu–Xu, Theorem 1.1](https://arxiv.org/abs/0808.2349)

Multiplication by the gamma integral for $(a+b+1)!$ gives a Gram matrix with functions $g_a(x,t)=t^a p_{a+1}(x)$ and positive measure $t e^{-t}\,dt\,dx$ on the positive quadrant. On $0<x<1$ the function $g_a(x,t)$ equals $(tx)^a/a!$. A linear combination with distinct $a$ vanishing almost everywhere there gives a polynomial in $t$ vanishing almost everywhere for almost every fixed $x$ in that interval. Every coefficient vanishes. Thus every finite family of the $g_a$ is linearly independent, proving strict positivity of its Gram determinant.

## Arbitrary row and column pairs

The densities $p_j$ are log-concave, by closure of log-concavity under convolution. For $0<x<y$ and $u\ge0$, log-concavity on interval support gives

```math
p_j(x)p_j(y-u)\ge p_j(y)p_j(x-u).
```

When the right side is positive, $x,y-u$ lie between $x-u$ and $y$ and have the same sum as the endpoints. Integrating over $0<u<1$ gives the nonnegative determinant for $(p_j,p_{j+1})$ at $(x,y)$. In the common interior of the supports the adjacent ratios $p_{j+1}(x)/p_j(x)$ are nondecreasing. Multiplying successive ratios proves the same two-row inequality for any $j<k$. If either point is outside the common interior, the nested supports $(0,j)\subset(0,k)$ give the inequality directly, up to measure-zero endpoints.

For the normalized matrix $B(a,b)=E(a,b)/(a+b+1)!$, the two-by-two determinant is the integral over $x<y$ of the product of the respective two-row spline determinants. This is the two-function integral Cauchy–Binet identity, so every such minor of $B$ is nonnegative. All entries of $B$ are positive. The factorials $H(a,b)=(a+b+1)!$ have strictly positive two-by-two minors because $H(a',b)/H(a,b)$ strictly increases with $b$ for $a'>a$. Multiplying the two strict/weak cross-product inequalities proves the two-by-two assertion for $E$.

Mixed minors of higher order remain open here. Brenti’s ordinary Eulerian triangle has entries indexed by the permutation length and descent number. Mao’s order-three result uses those indices. [Mao’s paper](https://arxiv.org/abs/2608.29224)
