# Dahlberg–She–van Willigenburg conjecture

The conjecture says that the chromatic symmetric function $X_T$ of any tree $T$ with a vertex of degree at least four has a negative elementary-basis coefficient. It appears as Conjecture 6.1 of [Dahlberg, She, and van Willigenburg](https://arxiv.org/abs/1901.02468). The problem remains open in the sources checked.

Wolfgang's necessary condition for $e$-positivity is that $T$ admits a connected partition of every type. [Barth and Fournier](https://doi.org/10.1016/j.disc.2006.01.006) and [Tom](https://arxiv.org/abs/2409.12934) exclude degree at least five and degree four with no leaf neighbor. [Zheng](https://arxiv.org/abs/2008.05038) and Tom exclude four-legged spiders. [Tang, Wang, and Wang](https://arxiv.org/abs/2610.39481) recently excluded all caterpillars of maximum degree four. [Li](https://arxiv.org/abs/2503.09484) formulates coefficient tests and related questions.

## Coefficients using one part size with a single exception

Let $d\ge2$, $1\le r\lt d$, and $n=jd+r$ with $j\ge1$. For $v\in V(T)$, let $g_d(v)$ count edges whose component away from $v$ has order divisible by $d$. Then

```math
[e_r e_d^j]X_T=(-1)^j\sum_{v\in V(T)}(1-d)^{g_d(v)}.
\tag{1}
```

There is also a formula for the sum of two coefficients:

```math
[e_{d+r}e_d^{j-1}]X_T+[e_re_d^j]X_T
=r\sum_{S}(-1)^{j-c(S)-h(S)}d^{c(S)}(d-1)^{h(S)}.
\tag{2}
```

Here $S$ ranges over connected vertex sets of order $r$ such that every component of $T-S$ has order divisible by $d$. Write $c(S)$ for the number of components. Write $h(S)$ for the total number of edges within these components whose deletion splits their component into two sets of orders divisible by $d$. Formula (2) evaluates the signed connected-partition sum in Li's Corollary 4.3 via divisibility of single-edge splits.

**Proof of (1).** Specialize to $d$ colors, with $e_d=1$, $e_r=t$, and all other elementary functions zero. At $t=0$ the colors $x_i$ are the distinct roots of $x^d=(-1)^{d-1}$. For a tree of order $k$ rooted at $w$, the sum of proper-coloring weights with root color $x_i$ is $C_w x_i^k$. The constant $C_w$ is a product over edges of $d-1$ if the subtree below that edge has order divisible by $d$, and of $-1$ otherwise. This follows recursively from

```math
\sum_{h\ne i}x_h^\ell =
\begin{cases}
(d-1)x_i^\ell,& d\mid\ell,\\
-x_i^\ell,& d\nmid\ell .
\end{cases}
```

The colors as functions of $t$ are the roots of $x^d+(-1)^r t x^{d-r}+(-1)^d=0$. At zero their derivatives are $(-1)^{r+1}x_i^{1-r}/d$. Differentiate the weight of each coloring by singling out one vertex $v$. Condition on the color of $v$ and root the tree there. This gives a contribution $(-1)^{r+1}C_v\sum_i x_i^{n-r}/d$. Now $C_v=(-1)^{n-1-g_d(v)}(d-1)^{g_d(v)}$ and $x_i^{n-r}=(-1)^{j(d-1)}$, giving (1).

**Proof of (2).** This time specialize $e_d=1$ and $e_{d+r}=t$, with the other elementary functions zero. There are $d$ colors tending to the same nonzero roots as before and $r$ colors tending to zero. At zero the derivative at each nonzero root is the negative of the corresponding derivative in the proof of (1), by implicit differentiation of $x^{d+r}+(-1)^dx^r+(-1)^{d+r}t=0$. Colorings using only these $d$ colors therefore give the negative of (1) at the linear term.

As $t\to0^+$, divide the other $r$ colors by $t^{1/r}$. They are the roots of $y^r=(-1)^{r-1}$ up to $O(t^{d/r})$ by the same polynomial and the simplicity of these limiting roots. For colorings using these colors exactly at the vertex set $S$, the weight sum factors into the two chromatic symmetric functions of $T[S]$ and $T-S$, evaluated on their respective color families. All edges crossing $S$ join distinct families. If $|S|>r$, the contribution is $o(t)$ by homogeneity. If $0\lt|S|\lt r$, simultaneous rotation of the limiting small colors shows that the leading evaluation of $X_{T[S]}$ is zero. The error is $O(t^{(|S|+d)/r})=o(t)$.

For $|S|=r$, the coefficient contributed by the small colors is $[e_r]X_{T[S]}$. It equals $r$ when $T[S]$ is connected and vanishes otherwise. This follows from the power-sum expansion for a tree and multiplicativity over components. Each remaining component contributes zero unless its order is divisible by $d$, again by rotation. For a component of order $dj'$ with $h'$ internal edges splitting it into multiples of $d$, the rooted-color formula gives the value $d(-1)^{j'-1-h'}(d-1)^{h'}$. Multiplying over the components gives (2).

## Matching forms for the coefficients using sizes two and three

Suppose $n$ is odd and $T$ has a matching missing a single vertex $u$. Give vertices in the bipartition class of $u$ sign $+1$ and the others sign $-1$. Use $u$ as root. Then

```math
[e_3 e_2^{(n-3)/2}] X_T =
-1+2^{\deg(u)}
 +\sum_{\substack{w\ne u\\w\ \mathrm{matched\ to\ its\ parent}}}\sigma(w)2^{\deg(w)}.
\tag{3}
```

The [independent check of the earlier Li counterexample](../results/li-coefficient-sign/independent_check.py) uses the corresponding two-color deletion calculation. The matching in (3) identifies exactly which vertices contribute, without enumerating their deletion forests. The two-color specialization has $X_T(y,z)=(yz)^{(n-1)/2}(y+z)$, so $[e_1e_2^{(n-1)/2}]X_T=1$. In (2) with $r=1,d=2$, the deletion of a vertex $w\ne u$ leaves components of even order exactly when $u$ and the mate of $w$ lie in the same component. That requires that the mate be the parent of $w$. All other vertices are still matched. At the colors $i,-i$ each even component with balanced bipartition contributes 2. The component containing the two unmatched vertices contributes $-2$ if they lie in the same bipartition class, which happens exactly when $\sigma(w)=-1$. Deleting $u$ leaves a perfectly matched forest and gives $2^{\deg(u)}$. This proves (3).

If $n$ is even and $T$ has a perfect matching $M$, there is a two-vertex formula:

```math
[e_3^2 e_2^{(n-6)/2}]X_T =
n-\sum_{w}2^{\deg(w)-1}
+\sum_{\{u,v\}\in\mathcal P}(-1)^{\operatorname{dist}(u,v)-1}
 2^{\deg(u)+\deg(v)-1}.
\tag{4}
```

This applies for $n\ge6$. The pairs in $\mathcal P$ are nonadjacent vertices whose connecting path starts and ends with edges of $M$.

To see this, use three colors $z,y_1,y_2$ with $y_1+y_2=-z$ and $y_1y_2=1+z^2$. Then $e_1=0$, $e_2=1$, $e_3=z+z^3$, so the coefficient of $z^2$ is the left side. With no vertex colored $z$, the term is $2(1+z^2)^{n/2}$. With just $w$ colored $z$, exactly one component of $T-w$ has one unmatched vertex and it contributes a factor $y_1+y_2=-z$. The other $\deg(w)-1$ components are balanced, giving the second term. With two vertices $u,v$ colored $z$, they must be nonadjacent. At $z=0$ their two mates must lie in the same component or the product of the two-color evaluations is zero. This is exactly the path condition in $\mathcal P$. The component with both mates contributes $2$ if their bipartition classes differ and $-2$ otherwise. The remaining components are balanced. There are $\deg(u)+\deg(v)-1$ components in total, giving (4).

## An infinite family for Li's coefficient question

Problem 4.9 of [Li](https://arxiv.org/abs/2503.09484) asks if $[e_3e_2^{(n-3)/2}]X_T$ is always negative for an odd-order tree of maximum degree four with connected partitions of every type. The [31-vertex result in this collection](../results/li-coefficient-sign/) already answers it in the negative, including the non-spider reading. Its source audit records an earlier spider counterexample from the work of Horňák–Woźniak and Zheng. The following calculation extends the non-spider obstruction to an infinite family.

Use the non-spider caterpillar $G_a$ from Proposition 5.2 of [Tang, Wang, and Wang](https://arxiv.org/abs/2610.39481). It consists of a central vertex $v$ with two leaves, a pendant path of length $a-2$ from $v$, and a neighbor $w$ of $v$ with one leaf and a pendant path of length $a$. Path lengths count the vertices beyond the attaching vertex. The order is $2a+3$. The cited proposition proves that this tree has all connected partition types for $a\equiv2\bmod 4$ and $\gcd(2a+3,15)=1$, including $a=60t+10$ for every $t\ge0$.

Match $v$ to one of its leaves, $w$ to its leaf, and the two even paths in consecutive pairs. The unmatched vertex $u$ is the second leaf of $v$. In (3), $u$ and the other leaf of $v$ contribute $2$ each. The leaf of $w$ contributes $-2$. Along the length-$a$ path the downstairs endpoints of matching edges are in the positive class and contribute $2a-2$. Along the length-$(a-2)$ path they are in the negative class and contribute $-2a+6$. Thus

```math
[e_3 e_2^{a}]X_{G_a}= -1+2+2-2+(2a-2)+(-2a+6)=5.
```

This also explains why the connected-partition information and this particular coefficient can both pass while the chromatic symmetric function has a negative coefficient elsewhere. The general conjecture still requires a sign obstruction for degree-four trees beyond the families already excluded.

The proposed odd-order reduction in Li's Problem 4.8 also fails. [Horňák and Woźniak, Table 2](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) list the arbitrarily vertex-decomposable spider with arm *orders* $(2,5,31,57)$. The lengths beyond the central vertex are $(1,4,30,56)$, so this degree-four tree has even order 92. It has exactly one leaf adjacent to its center.

## Trees with branching vertices separated by long paths

Take a tree $H$ with at least one edge. For each vertex $v$ of $H$, put $k_v=\deg_H(v)$ and choose a number $\ell_v$ of additional leaves. Make $T$ by replacing every edge $e$ of $H$ by a path of length $L_e$ and adjoining $\ell_v$ pendant leaves directly to $v$. Suppose every $k_v+\ell_v\le4$ and every vertex with $k_v+\ell_v=4$ has $\ell_v\ge1$.

- There is an absolute constant $C$ such that $X_T$ is not $e$-positive if there is at least one degree-four vertex and every $L_e\ge C\log|V(T)|$. The constant is independent of $H$.
- If the number of degree-four vertices is odd, the same conclusion holds for every $L_e\ge150$.

This uses color transfer along paths, as in [Tang, Wang, and Wang](https://arxiv.org/abs/2610.39481), together with the rank-one limit of that transfer. The logarithmic statement also handles even numbers of degree-four vertices by evaluating at an interior zero of one local factor.

### Transfer and local factors

Use $m$ colors $x_i$ with elementary functions $e_1=0$, $e_2,\ldots,e_m\ge0$, and $\sum_{j=2}^m(j-1)e_j=1$. Set $K_{ij}=1$ for $i\ne j$, $K_{ii}=0$, $D=\operatorname{diag}(x_i)$ and $P=KD$. With the endpoints of a path of length $L_e$ fixed at colors $i,j$, the sum of the weights on its interior vertices is $(P^{L_e-1}K)_{ij}$. Directly attached leaves have weight sum $-x_i$ when the adjacent vertex has color $i$. Thus the weight at a vertex of $H$ is $x_i(-x_i)^{\ell_v}$.

Put $R(z)=\prod_i(z+x_i)$ and $J(z)=\sum_i x_i/(z+x_i)$. Expanding the determinant of the diagonal matrix minus a rank-one matrix gives

```math
\det(zI-P)=R(z)(1-J(z))=z^m-\sum_{j=2}^m(j-1)e_jz^{m-j}.
```

In the specializations below, the eigenvalue 1 is simple and all other eigenvalues have modulus less than 1. For the four-color specialization this follows from strict positivity of $e_2,e_3,e_4$ and the triangle inequality in the displayed polynomial. Equality on the unit circle forces $z=1$. The three-color specialization is checked explicitly below. Set $b_i=1/(1+x_i)$. The right and left eigenvectors are $b_i$ and $x_i b_i$, respectively, since $J(1)=1$. The left eigenvector multiplied by $K$ is the row $b^\top$. Write

```math
F_{k,\ell}=\sum_i x_i(-x_i)^\ell b_i^k,\qquad B_2=F_{2,0}.
```

The eigenprojection times $K$ is $b b^\top/B_2$. On a compact neighborhood of either positive four-color specialization used below there are constants $M\lt \infty$ and $0\lt \rho\lt 1$ with

```math
B_2P^{L-1}K=b b^\top+E_L,\qquad \|E_L\|_\infty\le M\rho^{L}.
\tag{5}
```

For example, integrate the resolvent $(zI-P)^{-1}$ against $z^{L-1}$ on a fixed circle strictly between the other eigenvalues and 1 to bound the residual power. The color roots stay bounded, and $R(1)>0$ keeps all $1+x_i$ away from zero. These estimates are uniform over permutations of the color roots.

For reference, with $B=R(1)$, differentiation of $1-J(z)=\det(zI-P)/R(z)$ gives

```math
F_{1,0}=1,\qquad F_{2,0}=\frac{\sum_j j(j-1)e_j}{B},\qquad
F_{3,0}=\frac{\sum_j j(j-1)^2 e_j}{2B}.
```

Here $R'(1)=(m-1)B$, since $\sum_j j e_j=B$. Using $x_i b_i=1-b_i$, $e_1=0$, $\sum_i x_i^2=-2e_2$ and $\sum_i x_i^3=3e_3$, the other needed factors are

```math
F_{1,1}=1,\quad F_{2,1}=F_{2,0}-1,\quad F_{1,2}=1-2e_2,\quad
F_{3,1}=F_{3,0}-F_{2,0},\quad F_{2,2}=F_{2,0}-2,\quad
F_{1,3}=1-2e_2-3e_3 .
```

### An absolute bound for odd parity

Use $m=3$ and $e_2=e_3=1/3$. The characteristic polynomial of $P$ is $(z-1)(z^2+z+2/3)$. The two other eigenvalues have modulus $\sqrt{2/3}$, mutual distance greater than 1, and distances greater than 1 from the eigenvalue 1. The three colors satisfy $x_i^3+x_i/3-1/3=0$, giving $|x_i|\lt0.9$, $\|P\|_\infty\lt 2$ and $\|b\|_\infty\le10$. The two other spectral projections, written by Lagrange interpolation in $P$, each have norm at most 9. Thus the difference between $P^t$ and its rank-one limit is bounded by $18(2/3)^{t/2}$ in row-sum norm.

The local factors for total degree at most three are $1,8/5,7/5,1,3/5,1/3$ in the order $(1,0),(2,0),(3,0),(1,1),(2,1),(1,2)$. The factors for total degree four with $\ell\ge1$ are $-1/5,-2/5,-2/3$ for $(3,1),(2,2),(1,3)$.

Root $H$ at any vertex. For a child with a path to its parent, the message to the parent is the vector of sums of coloring weights conditional on the parent's color, excluding the weight of the parent. We prove that each message can be written $a(b+\delta)$, with a nonzero real $a$ and $\|\delta\|_\infty\le10^{-6}$. Its sign is the product of the signs of the local factors in the corresponding subtree of $H$.

Indeed, at a vertex $v$, factor out the product of its child message scalars. The new conditional vector at $v$ is then $U_i=x_i(-x_i)^{\ell_v}\prod_w(b_i+\delta_{w,i})$. The product has at most three factors. Its leading scalar after the transfer to the parent is $b^\top U/B_2$. The numerator differs from $F_{k_v,\ell_v}$ by at most $3\cdot10\cdot 3\cdot 11^2\cdot10^{-6}\lt0.1$. All vectors are invariant under conjugation combined with permuting the conjugate color labels, so the scalar is real. Its modulus exceeds $1/16$, since $B_2=8/5$ and $|F_{k_v,\ell_v}|\ge1/5$. The error in the message is bounded in norm by $18(2/3)^{(L_e-1)/2}\cdot 2\cdot 11^3$. Dividing by the modulus of the scalar gives an error less than $10^{-6}$ when $L_e\ge150$. These bounds also apply when the child product is empty. At the root the final sum uses $\sum_i U_i$, whose sign equals that of the root's local factor by the same product estimate. Hence the full specialization has sign $(-1)^s$, where $s$ is the number of degree-four vertices. Negative evaluation at these nonnegative elementary values precludes $e$-positivity.

### A logarithmic bound for either parity

If a vertex has three directly attached leaves and total degree four, the tree has no matching covering all but at most one vertex. Wolfgang's connected-partition test then excludes $e$-positivity using blocks of size two with at most one singleton. We may therefore assume all degree-four vertices have type $(3,1)$ or $(2,2)$.

Use $m=4$. The normalization implies $e_2+2e_3+3e_4=1$, and the two degree-four factors simplify to

```math
F_{3,1}=\frac{-e_2+6e_4}{B},\qquad
F_{2,2}=\frac{-2e_2+4e_4}{B}.
```

Choose one of these types that actually occurs. Set $e_4=1/30$ and choose $e_2=6e_4$ for the first type or $e_2=2e_4$ for the second. Determine $e_3$ by the normalization. These values are strictly positive. At this point the chosen local factor vanishes, the other does not vanish, and all factors for degree at most three are positive by the formulas above. Perturb $e_2$ by $\tau$ and $e_3$ by $-\tau/2$. The vanishing factor has a simple zero at $\tau=0$. Fix constants in (5) on a sufficiently small neighborhood along this curve.

Write $N=|V(T)|$, $L=\min_e L_e$, and $Y(\tau)=B_2(\tau)^{|E(H)|}X_T(e(\tau))$. Expanding (5) at each edge gives a sum over subsets $A\subseteq E(H)$ where the error is used. The term for $A=\varnothing$ is $\prod_v F_{k_v,\ell_v}(\tau)$. If $V(A)$ is the set of vertices incident to edges of $A$, the absolute value of any term is at most

```math
(M_1\rho^L)^{|A|}\prod_{v\notin V(A)}|F_{k_v,\ell_v}(\tau)|
\tag{6}
```

with an absolute $M_1$. Every unexposed vertex contributes its exact local factor. At the exposed vertices, each color and each incident factor is bounded on the fixed neighborhood. There are at most $2|A|$ such vertices, each of degree at most four, so these bounds cost only a constant to the power $|A|$.

Let $S$ be the vertices of the vanishing type, $s=|S|\ge1$, and $U=\prod_{v\notin S}|F_{k_v,\ell_v}(0)|$. At $\tau=0$, contributions are possible only when $V(A)\supseteq S$, so $|A|\ge s/2$. The other factors are bounded away from zero, allowing the omitted exposed factors in (6) to be charged by increasing the absolute constant. Since $|E(H)|\le N$, this yields

```math
|Y(0)|\le 2U(M_2N\rho^L)^{s/2}
```

once $M_2N\rho^L\lt1/2$. At $\tau=1/N$, all factors have modulus at least $c/N$ for some absolute $c>0$. The contribution of the nonempty $A$'s is bounded relative to the empty term by $(1+M_3N^2\rho^L)^N-1$. The empty term has modulus at least $c_1 U(c_2/N)^s$, because each of the nonvanishing factors changes by a relative $O(1/N)$. If $L\ge C\log N$ with a sufficiently large absolute $C$, we have $\rho^L\le N^{-6}$. These estimates give $|Y(0)|/|Y(1/N)|=o(1)$ uniformly, including when $s$ grows.

On the other hand, if $X_T$ is $e$-positive, the ratio of the values of each surviving monomial at $\tau=1/N$ and $\tau=0$ is at most $(1+C_1/N)^N$, since the sum of its exponents is at most $N$. The zero variables are the same at both points. The ratio of the positive normalization factors $B_2^{|E(H)|}$ is also bounded. Consequently $0\lt Y(1/N)\le C_2Y(0)$, which contradicts the estimates. All constants can be taken uniformly since there are just two choices of the vanishing type. Increasing the constant in the lower bound on $L$ handles the bounded range of $N$.
