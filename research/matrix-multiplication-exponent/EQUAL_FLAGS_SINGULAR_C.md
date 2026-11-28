# One exact tagged branch with arbitrary C compression

Status: an exact restriction bound with equal input and output flag dimensions. The local C map can be singular. This argument does not cover moving Laurent idempotents, several source families, or unequal flag dimensions.

Let
```math
\widehat S_{q,M}
 =U_{ABCD}(q)W_{CD}(q)W_{AD}(M)W_{BD}(M),
```
and, for a linear map $`L:\mathbb C^{q^2}\to C'`$, let
```math
T_L=\sum_{i,j=1}^q\sum_{f=1}^M
 A_{i,f}B_{j,f}\,L(C_{ij})D_{ij}.
\tag{1}
```
Assume every outer row and every outer column contains a nonzero column of $`L`$. Then $`T_L`$ is concise at $`A`$ and $`B`$, each of dimension $`qM`$.

## 1. Bound

If $`T_L`$ is an exact local restriction of $`\widehat S_{q,M}`$, then
```math
\mathop{\mathrm{rank}}L\le q^{3/2}.
\tag{2}
```
If the bipartite support graph
$`E=\{(i,j):L(C_{ij})\ne0\}`$ is connected, the stronger bound is
```math
\mathop{\mathrm{rank}}L\le q.
\tag{3}
```

The A and B maps in such a restriction are square and invertible, because the target is concise there. The q common source-label projectors therefore descend to q pairs of idempotents $`(P_h,Q_h)`$ satisfying
```math
(P_h\otimes I)T_L=(I\otimes Q_h)T_L,\qquad
\sum_hP_h=I_A,\quad \sum_hQ_h=I_B.
\tag{4}
```
They are pairwise orthogonal within each local endomorphism algebra.

For completeness, all A/B transfers of (1) can be read off from its independent D labels. Write an A endomorphism in outer blocks $`X_{i'i}`$ and a B endomorphism in blocks $`Y_{j'j}`$. For every edge $`(i,j)`$, the equation
$`(X\otimes I)T_L=(I\otimes Y)T_L`$ forces all $`X_{i'i}`$, $`i'\ne i`$, and all $`Y_{j'j}`$, $`j'\ne j`$, to vanish. Each vertex is incident to an edge, so both maps are block diagonal. On that edge the remaining equation is
$`X_i=Y_j^{\mathsf T}`$. Consequently there is one arbitrary flag matrix per connected component of E, copied to every A and B vertex in that component.

Let component $`\nu`$ have $`a_\nu`$ A vertices and $`b_\nu`$ B vertices. Equation (4) gives flag idempotents $`p_{h,\nu}`$ with $`\sum_hp_{h,\nu}=I_M`$. Choose an h for which $`p_{h,\nu}\ne0`$. Applying $`P_h`$ to the output also selects the single source h sector. The C span of that source sector has dimension at most q, regardless of its D map. On the target, contracting D to any $`D_{ij}`$ in component $`\nu`$ leaves a nonzero A/B flag matrix $`p_{h,\nu}`$ multiplied by $`L(C_{ij})`$. Thus every such column belongs to the same at-most-q-dimensional C image. It follows that
```math
\mathop{\mathrm{rank}}L\le
 \sum_\nu \min\{q,a_\nu b_\nu\}
 \le\sqrt q\sum_\nu\sqrt{a_\nu b_\nu}
 \le\sqrt q\sqrt{\sum_\nu a_\nu\sum_\nu b_\nu}
 =q^{3/2}.
\tag{5}
```
For a connected graph there is only one summand, proving (3).

Only the larger quotient incidence is used: after one source sector is selected, its entire C image has dimension at most q. No assumption about the rank of C or the linear independence of its surviving columns is made.

## 2. Sharpness when q is a square

Let $`q=m^2`$, and suppose $`m\mid M`$. Partition the q A outer labels into m groups $`I_g`$ of size m, and the q B outer labels into m groups $`J_g`$ of size m. Let L retain exactly the coordinate columns in
```math
E=\bigcup_{g=1}^m I_g\times J_g.
```
It has rank $`m^3=q^{3/2}`$, and every vertex is incident to E.

Here is an exact restriction attaining (2). Label the q source h sectors by $`h=(g,t)`$, $`g,t\in[m]`$. A source A flag has coordinates $`(a,k)\in[m]\times[M/m]`$; a source B flag has coordinates $`(b,\ell)`$ in the same set. Label the q source C/D wire coordinates by $`c=(a',b')\in[m]^2`$. Define
```math
\begin{aligned}
A_{(g,t);a,k}\longmapsto A_{I_g(a);t,k},\qquad
B_{(g,t);b,\ell}\longmapsto B_{J_g(b);t,\ell},
\\ C_{(g,t);a',b'}\longmapsto C_{I_g(a'),J_g(b')},
\\ D_{(g,t);a',b';a,k;b,\ell}
\longmapsto
 \delta_{a,a'}\delta_{b,b'}\delta_{k,\ell}
 D_{I_g(a),J_g(b)}.
\end{aligned}
\tag{6}
```
The pair $`(t,k)`$ labels all M output flag values. Expanding the source shows that (6) gives exactly (1) on E, with coefficient one. The source D leg is explicitly tagged by h, so every displayed D dependence is local and allowed.

This construction has support density $`q^{-1/2}`$. It does not meet the subpolynomial-loss criterion for the geodesic trade.

## 3. Scope

The proof uses the q exact complementary source idempotents after invertible A/B maps. Under a degeneration these idempotents may acquire poles and coalesce. The argument therefore establishes an exact restriction bound only. The earlier square-C Laurent bound uses a different saturation argument and does not justify extending this proof to singular C in a limit.
