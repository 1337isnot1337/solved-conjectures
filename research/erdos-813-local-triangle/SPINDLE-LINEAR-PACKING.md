# Erdős–Hajnal local triangle conjecture

**Linear cleanup obstruction.** In the random Hermitian construction of Mattheus and Verstraëte, at its published vertex-retention rate, with high probability there is an absolute constant $c>0$ such that at least a fraction c of the retained vertices must be deleted to obtain a spindle-free induced subgraph. The proof works over all sufficiently large characteristics. The spindle also occurs with high probability at retention $p\ge q^{-10/7+\varepsilon}$. This excludes even sublinear induced cleanup at the published rate. It does not exclude correlated pencil signs, edge deletion, or another graph construction, and does not settle Erdős #813.

## Independent parameters for the two diamonds

In the [rational frame](PRIME-FIELD-SPINDLE-FRAMES.md), let B use λ and let D use an independent norm-one parameter μ, namely $D=T(B_\mu)$. The other five lines $u,v,w,A,C$ stay fixed. Each diamond's required intersections are unital by the one-parameter argument, and the extra edge $vw$ still meets at $Q_1$. All desired equalities hold identically; every required inequality holds on at least the formal diagonal $(\lambda,\mu)=(i,i)$ over the Gaussian rationals. As before, choose a witnessing minor for each projective inequality. On the Cartesian product of the two norm-one sets, each of the finitely many nonzero polynomials in λ and μ has at most $O(q)$ zeros: write it as polynomial in μ, bound the roots of a nonzero coefficient in λ, then bound the remaining μ-roots in each row. Exclude finitely many characteristics as in the rational frame. There remain Θ(q²) good pairs. Each has seven distinct secants, a projective frame, and the same forest of splitting constraints at $Q_1$, so the split survival probability is $2^{-11}$.

The [pair invariants](SPINDLE-ORBIT-PACKING.md) $J(B,w)$ and $J(D,v)$ constrain λ and μ respectively, each to at most two possibilities. Choose one good pair per joint invariant; this gives Θ(q²) disjoint ordered projective unitary orbits, each of size Θ(q⁸). The total number M of ordered potential copies is Θ(q¹⁰).

## Five lines suffice to fix the projective unitary map

For every good parameter pair, fixing any five specified lines pointwise **as elements of the set of secants** forces the identity projective unitary map. To see this, represent the lines by nonisotropic pole vectors (or dual covectors). The four fixed lines $v,w,A,C$ pass through $Q_1$; any two of their vectors span the same degenerate plane and have nonzero Hermitian inner product. An isometry fixing each pole line acts on it by a norm-one scalar, and these scalars must agree across any nonorthogonal pair.

If the five labels include u, they include two of the four fixed pencil lines. The pole of u is outside their plane. Its Hermitian inner products with the four fixed poles are all nonzero: in dual coordinates the first coefficients of (v,w) are b, and those of (A,C) may be taken to be $1-b$. These three independent vectors must therefore have the same scalar. If the five labels omit u, they include at least three fixed pencil lines and at least one of B,D. The latter pole is outside their plane, since B and D do not pass through $Q_1$. That pole cannot be orthogonal to two distinct pencil poles, since the orthogonal complement of their plane is an isotropic line. Again these three independent vectors must have the same scalar. This proves the stabilizer claim.

For potential ordered pairs of copies with exactly r common secants, first fix one copy and a correspondence of r labels. For $r\le5$ bound the number of second parameter pairs by $O(q^2)$; for $r=6$ at least one pair invariant is available, leaving $O(q)$. For $r=7$ both are available, leaving $O(1)$. Apply the earlier stabilizer bounds when $r\le4$ and the trivial five-line stabilizer above when $r\ge5$. Thus the numbers of ordered copy pairs for $r=1,\ldots,7$, including identical indices at r=7, are bounded by constants times
```math
q^{16},\ q^{14},\ q^{14},\ q^{13},\ q^{12},\ q^{11},\ q^{10},
```
respectively.

## Independent vertex retention

Write Z for the number of potential copies surviving both independent splits and independent vertex retention. Its mean is Θ(q¹⁰p⁷). Vertex-disjoint copies are independent, and an r-overlap survives jointly with probability at most $p^{14-r}$. Thus the seven overlap contributions to the relative variance are bounded by constants times $q^{e_r-20}p^{-r}$, where $e_r$ are the displayed exponents. At $p\ge q^{-10/7+\varepsilon}$ these terms tend to zero: the seventh term uses ε, and the first six have strictly negative exponents already at ε=0. In particular, at $p=L^2/q$ with $L=\log q$, with high probability $Z\ge c_0q^3L^{14}$.

We need a sharper estimate than an application of Markov to the number of intersecting pairs. Ignore the random split for this upper bound. Put $N=q^2(q^2-q+1)$ for the number of secants. For a secant x, let $d_x$ count potential copies containing x whose other six vertices are retained, regardless of whether x is retained. By transitivity the mean is the same for each x:
```math
m=\frac{7M}{N}p^6=\Theta(L^{12}).
```
In the variance of $d_x$, the terms from pairs with no common vertex other than x vanish by independence. For r≥2 common vertices the probability that both indicators are one is $p^{13-r}$. Summing over x counts each ordered pair r times. Also $d_x$ is independent of the indicator ${\bf 1}_x$ that x is retained. Therefore
```math
\mathbf E\!\left[\sum_x {\bf 1}_x(d_x-m)^2\right]
\le \sum_{r=2}^7 O\bigl(q^{e_r}p^{14-r}\bigr)
= O(q^3L^{22}) = o(Np\,m^2).
```
Indeed the q-exponents for these terms are (2,3,3,3,3,3), and their log-exponents are (24,22,20,18,16,14). Markov now gives $`\sum_x{\bf 1}_x(d_x-m)^2=o(Np\,m^2)`$ with high probability. The total retained vertex count is $(1+o(1))Np$ with high probability by the binomial variance bound. Consequently $\sum_x{\bf 1}_x d_x^2=O(q^3L^{26})$ with high probability, using $(m+t)^2\le2m^2+2t^2$.

The graph on the Z surviving copies, adjacent when they intersect, has at most $\tfrac12\sum_x {\bf 1}_x d_x^2$ edges, since we upper bounded all split-surviving degrees by the corresponding retention-only degrees. It has an independent set of size at least $Z^2/(Z+2E)$, where E is its number of edges. This is Ω(q³L²), since $Z\ge c_0 q^3L^{14}$ and $E=O(q^3L^{26})$. Every induced spindle-free subgraph must delete at least one vertex from each of these disjoint copies. Because $Np=\Theta(q^3L^2)$, the required deletion is a positive fraction, as claimed.
