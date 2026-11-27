# A strictly convex counterexample to countable polychromatic coloring

**Theorem.** There is a strictly convex norm $`N`$ on $`\mathbb R^5`$ and a fixed bounded countably infinite set $`M`$ such that every coloring $`\chi:\mathbb R^5\to\mathbb N`$ has an $`N`$-isometric copy of $`M`$ that misses a color. Here a copy means the image of a map preserving all pairwise distances, as in the [question after Theorem 2.1 of Frankl–Gehér–Sagdeev–Tóth](https://doi.org/10.1007/s00454-024-00702-5). The claim concerns a countably infinite palette, not the existence of a two-coloring with no monochromatic copy.

The independent selections are analogous to those from line segments in the authors' proof for polygonal norms (Section 3.2). Here we obtain independent selections from short arcs in a strictly convex norm, and each arc contains a tail of an associated copy.

## 1. The configurations and the required norm identities

Equip the five-space with an auxiliary Euclidean structure and write it as the orthogonal sum $`V\oplus U`$, where $`V`$ has orthonormal basis $`a,b,c`$ and $`U`$ is a plane with orthonormal basis $`e_1,e_2`$. Write its coordinates as $`(x,y,v,w)`$, meaning $`xa+yb+vc+w`$ with $`w\in U`$. Use $`|\cdot|`$ and $`\cdot`$ for the Euclidean norm and inner product. For $`i\ge1`$, set

```math
t_i=8^{-i}/16, p_i=t_i a+t_i^2 b,
```

```math
u(t)=\frac{e_1+t e_2}{\sqrt{1+t^2}}, \kappa(t)=\sqrt{1+4t^2},
```

```math
a_i=u(t_i), b_i=\frac{c-2t_i a}{\kappa(t_i)},
```

```math
A_i=\{p_i+\alpha a_i+\alpha^2 b_i:0\le\alpha\le\lambda_i\}.
```

The widths $`\lambda_i>0`$ will be fixed below. For $`i<k`$, put

```math
s_{ik}=t_i-t_k,\qquad h_{ik}=t_i+t_k,\qquad
r_{ik}=s_{ik}\sqrt{1+h_{ik}^2}=|p_i-p_k|>0.
```

In addition to the arcs $`A_i`$, use a single secondary sequence for each $`j\ge1`$:

```math
q_i^j=p_j+t_i a_j+t_i^2 b_j\qquad(i\ge1).
```

We construct one norm $`N`$ for which the following prescribed sets are on the unit sphere:

```math
S_P^+=\bigcup_{i\lt k}\frac{A_i-A_k}{r_{ik}},\qquad
S_S^+=\left\{\frac{q_i^j-q_k^j}{r_{ik}}:j\ge1,\ i\lt k\right\}.
```

We also prescribe the negatives of these sets. For the secondary set each vector is a Euclidean unit vector: $`a_j\in U`$ and $`b_j\in V`$ are orthogonal unit vectors, and the difference has exactly the two coefficients of $`p_i-p_k`$ in the basis $`a,b`$. More precisely, for $`y=h_{ik}/\sqrt{1+h_{ik}^2}`$ and $`B(y)=\sqrt{1-y^2}`$, its positive orientation is

```math
\frac{q_i^j-q_k^j}{r_{ik}}=B(y)a_j+y b_j.
```

## 2. Local graphs for the primary differences

For $`z\in(A_i-A_k)/r_{ik}`$, the $`y`$ coordinate is $`h_{ik}/\sqrt{1+h_{ik}^2}`$, regardless of the free arc parameters. Denote the map $`h\mapsto h/\sqrt{1+h^2}`$ by $`Y`$ and its inverse by $`h(y)=y/B(y)`$. Use the intervals

```math
I_i=Y\bigl([\tfrac78 t_i,\tfrac54t_i]\bigr).
```

All pairs with first index $`i`$ have $`y\in I_i`$ since $`t_k\le t_i/8`$ for $`k>i`$. For $`y\in I_i`$ and $`y'\in I_\ell`$ with $`i\ne\ell`$, write $`T=\max(t_i,t_\ell)`$. The gap between the preimage intervals is at least $`(7/8-5/32)T=(23/32)T`$, and $`Y'(h)=(1+h^2)^{-3/2}\ge1/2`$ throughout the relevant range $`0\le h\le(5/4)t_1<1/100`$. In particular,

```math
|y'-y|\ge T/4. \qquad (1)
```

In the chart for $`I_i`$ define $`t=h(y)-t_i`$, $`s=t_i-t`$, and $`r=s\sqrt{1+h(y)^2}`$. Here $`s\ge3t_i/4`$ and $`|t|\le t_i/4`$. Given $`w\in U`$, solve for $`\xi,\eta`$ by $`w=\xi u(t_i)-\eta u(t)`$. The two directions are independent since $`t\ne t_i`$; the solution is linear in $`w`$ with coefficients smooth in $`y`$ on a neighborhood of $`I_i`$. With $`X=\xi^2/\kappa(t_i)`$ and $`Z=\eta^2/\kappa(t)`$, define

```math
f_i(y,v,w)=B(y)-h(y)v-4\bigl(v-r(X-Z)\bigr)^2-rs(X+Z). \qquad (2)
```

At a prescribed primary vector from parameters $`\alpha`$ at $`i`$ and $`\beta`$ at $`k`$, one has $`t=t_k`$, $`r=r_{ik}`$, $`\xi=\alpha/r`$, $`\eta=\beta/r`$, and $`v=r(X-Z)`$. Substituting these into (2) and using $`h+s=2t_i`$ and $`h-s=2t_k`$ gives

```math
f_i(y,v,w)=B(y)-2t_i rX+2t_k rZ=x.
```

The right side is exactly the $`x`$ coordinate of the normalized difference. Thus (2) fits every independent choice of the two arc parameters, not just the centers.

Set $`\delta=1/4096`$. At $`(y,0,0)`$, the Hessian of $`-f_i`$ in the variables $`(y,v,w)`$ is block diagonal, with $`(y,v)`$ block and $`w`$ quadratic form given by

```math
\begin{pmatrix}D&D\\D&8\end{pmatrix},\qquad D=(1-y^2)^{-3/2},\qquad
2rs\left(\frac{\xi^2}{\kappa(t_i)}+\frac{\eta^2}{\kappa(t)}\right).
```

Indeed $`-B''=h'=D`$, $`X,Z`$ are quadratic in $`w`$, and at $`v=w=0`$ the squared term in (2) contributes only to the $`vv`$ entry. Since $`1\le D<2`$, the first quadratic form is at least $`(1/2)\,dy^2+4\,dv^2`$: apply $`2D|dy\,dv|\le(D/2)dy^2+2D\,dv^2`$. For the other block, $`r\ge s\ge3t_i/4`$, $`\kappa(t_i),\kappa(t)\le2`$, and $`|w|^2\le2(\xi^2+\eta^2)`$. It is therefore at least $`(9/32)t_i^2|w|^2`$. In particular the full Hessian is bounded below by $`(1/4)\mathop{\mathrm{diag}}(1,1,t_i^2,t_i^2)`$ at each $`(y,0,0)`$.

For each fixed $`i`$, compactness of $`I_i`$ and continuity allow a $`0<\rho_i\le t_i`$ so that on the convex box $`I_i\times[-\rho_i,\rho_i]\times\{w:|w|\le\rho_i\}`$ all of the following hold:

```math
\mathop{\mathrm{Hess}}(-f_i)\succeq \tfrac18\mathop{\mathrm{diag}}(1,1,t_i^2,t_i^2),
```

```math
|f_{i,y}|, \ |f_{i,v}|\le1,\qquad |\nabla_w f_i|\le t_i,
```

```math
|(f_i(y,v,w),y,v,w)-z_0(y)|\le\delta t_i^2,
```

```math
|(1,-f_{i,y},-f_{i,v},-\nabla_w f_i)-g_0(y)|\le\delta t_i^2, \qquad (3)
```

where $`z_0(y)=(B(y),y,0,0)`$ and $`g_0(y)=(1,h(y),h(y),0)`$. The last two errors vanish on $`v=w=0`$, since $`B'=-h`$ there, and the derivative inequalities have slack there. The Hessian bound has slack there as well for each fixed $`i`$.

Choose positive decreasing widths with $`\lambda_i\le\rho_i t_i/8`$, by taking this bound for $`i=1`$ and thereafter the minimum with half the preceding width. Every primary difference with $`i<k`$ now lies on the graph of $`f_i`$ over its box: its parameters are at most $`\lambda_i`$, so $`|w|\le2\lambda_i/r_{ik}\le\rho_i`$, and $`|v|\le2\lambda_i^2/r_{ik}\le\rho_i`$. For such a labeled positive vector let $`g_z=(1,-f_{i,y},-f_{i,v},-\nabla_w f_i)`$. For a negative primary vector set $`g_{-z}=-g_z`$. For every secondary vector, of either sign, use $`g_z=z`$. Labels can be retained if any vector has more than one presentation.

## 3. Support estimates for every pair

Let $`\varepsilon=10^{-6}`$ and let $`P_V,P_U`$ be the orthogonal projections. Use the even strictly convex penalty and its first-order remainder

```math
\Phi(z)=\varepsilon\bigl(|P_V z|^2+|P_U z|^4\bigr),\qquad
R(z',z)=\Phi(z')-\Phi(z)-\nabla\Phi(z)\cdot(z'-z).
```

We show that for every ordered pair of prescribed vectors,

```math
g_z\cdot(z'-z)+R(z',z)\le0. \qquad (4)
```

Every positive primary vector and its normal are within $`1/16`$ of $`a`$ by (3), since $`|z_0(y)-a|\le2y`$, $`|g_0(y)-a|\le2h(y)`$ and $`0<y\le h(y)<1/100`$. Every positive secondary vector and its normal are within $`1/16`$ of $`a_j`$ by their two-coordinate formula and $`|B(y)-1|\le y`$. The negative labels satisfy the corresponding estimates about the negative centers. In particular all prescribed vectors have Euclidean norm less than $`2`$. The Hessian of $`w\mapsto|w|^4`$ is $`4|w|^2 I+8ww^{\mathsf T}`$, so on the Euclidean radius-$`2`$ ball $`\mathop{\mathrm{Hess}}\Phi\preceq48\varepsilon I`$. Integrating the second derivative on any segment in that ball gives $`R(z',z)\le24\varepsilon |z'-z|^2`$.

**Positive primary vectors in the same box.** Put $`L=(\Delta y)^2+(\Delta v)^2+t_i^2|\Delta w|^2`$. Taylor's inequality for $`f_i`$ on the segment between the two projected coordinates in the box gives $`g_z\cdot(z'-z)\le-L/16`$ by (3). The derivative bounds in (3) give $`|\Delta x|\le |\Delta y|+|\Delta v|+t_i|\Delta w|`$, hence $`(\Delta x)^2\le3L`$. On the actual Euclidean segment between $`z,z'`$, the $`U`$ coordinate has norm at most $`\rho_i`$, so its quartic Hessian is bounded by $`12\rho_i^2 I`$. Consequently

```math
R(z',z)\le 24\varepsilon\big((\Delta x)^2+(\Delta y)^2+(\Delta v)^2
                          +\rho_i^2|\Delta w|^2\big)\le96\varepsilon L.
```

Here $`\rho_i\le t_i`$. Since $`96\varepsilon<1/16`$, this proves (4) in the same box, including equality when $`z=z'`$.

**Positive primary vectors in different boxes.** Use $`T`$ as in (1). By (3), the sum of the positional errors relative to $`z_0(y),z_0(y')`$ is at most $`2\delta T^2`$. The derivative of $`z_0`$ has norm at most $`2`$, so (1) gives $`|z'-z|\le2|\Delta y|+2\delta T^2\le3|\Delta y|\le3`$. The reference scalar product satisfies

```math
g_0(y)\cdot(z_0(y')-z_0(y))
=B(y')-B(y)+h(y)(y'-y)\le-\tfrac12|\Delta y|^2
```

by $`B''\le-1`$. The error in this scalar product upon replacing the positions and the normal is at most $`2(2\delta T^2)+3\delta T^2=7\delta T^2`$, using $`|g_0(y)|\le2`$. Thus $`g_z\cdot(z'-z)\le-(1/4)|\Delta y|^2`$ by (1) and $`112\delta<1/4`$. The remainder is at most $`216\varepsilon|\Delta y|^2`$, proving (4). Two negative primary vectors reduce to the corresponding positive pair by simultaneous negation, which preserves both terms of (4).

**Two secondary vectors, with arbitrary orientations and indices.** Both have Euclidean norm $`1`$ and $`g_z=z`$. Therefore $`g_z\cdot(z'-z)=-|z'-z|^2/2`$. This absorbs the global remainder bound $`24\varepsilon|z'-z|^2`$, without any separation assumption on the secondary directions.

**Mixed pairs and opposite-sign primary pairs.** Write $`\gamma=1/16`$ for the cap error above. The corresponding cap centers are orthogonal for any mixed pair because $`a\perp a_j`$, or antipodal for opposite-sign primary vectors. In either order,

```math
g_z\cdot z'\le2\gamma+\gamma^2,\qquad
g_z\cdot z\ge1-2\gamma-\gamma^2.
```

These bounds follow by expanding the inner products about the unit cap centers and using Cauchy–Schwarz. The difference is at most $`-1+4\gamma+2\gamma^2<-1/2`$. The radius-$`2`$ estimate gives $`R(z',z)\le384\varepsilon<1/2`$. This finishes the pair comparison, including both sign orders. The same cap estimate gives $`g_z\cdot z\ge3/4`$ for every label, and the remainder bound with $`z'=0`$ gives $`R(0,z)\le96\varepsilon`$.

## 4. One strictly convex body

Let the supremum below range over all prescribed labels of both signs. Define

```math
\ell_z(X)=1-\Phi(z)+(g_z-\nabla\Phi(z))\cdot(X-z),\qquad
F(X)=\Phi(X)+\sup_z\ell_z(X),\qquad K=\{X:F(X)\le1\}.
```

All affine slopes and intercepts are uniformly bounded, since the prescribed vectors and normals are bounded. Hence the supremum is finite, convex and Lipschitz. It is even because $`\ell_{-z}(X)=\ell_z(-X)`$. The squared and fourth powers of the Euclidean norms are strictly convex on their respective blocks, and any two distinct vectors differ in at least one block. Thus $`\Phi`$, and therefore $`F`$, is strictly convex. Also $`F`$ is coercive: $`\Phi(X)\ge\varepsilon(|X|^2-1/4)`$ by $`u^4\ge u^2-1/4`$, and the supremum is bounded below by any one of its affine terms. The estimate at the origin gives $`F(0)\le1-3/4+96\varepsilon<1`$. Thus $`K`$ is a compact, centrally symmetric, strictly convex body with $`0`$ in its interior, and its gauge $`N`$ is a strictly convex norm.

For every prescribed $`z'`$, (4) says $`\Phi(z')+\ell_z(z')\le1`$ for every label $`z`$. Its own term attains equality, so $`F(z')=1`$. No multiple $`\lambda z'`$ with $`\lambda>1`$ can belong to $`K`$, since the convex combination of that point with $`0`$ giving $`z'`$ would then have $`F(z')<1`$. Hence $`N(z')=1`$. This argument puts all prescribed directions on the unit sphere despite the infinitely many boxes and secondary placements.

## 5. The coloring contradiction

Fix $`M=\{p_i:i\ge1\}`$. This set is bounded and infinite since the $`t_i`$ are positive and distinct and tend to zero. The primary sphere identities with zero parameters give $`N(p_i-p_k)=r_{ik}`$ for $`i<k`$. The same identities give $`N(x_i-x_k)=r_{ik}`$ for every independent selection $`x_i\in A_i`$. Such selections are embeddings of the full $`M`$, because every off-diagonal distance is positive. Likewise, the secondary identities give $`N(q_i^j-q_k^j)=r_{ik}`$ for every fixed $`j`$ and all $`i<k`$. Thus $`\{q_i^j:i\ge1\}`$ is a copy of the full $`M`$, not just a copy of a tail.

Let $`\chi`$ be any coloring into $`\mathbb N`$ and fix a color $`d`$. If no $`A_i`$ is wholly color $`d`$, choose a point outside $`d`$ from each $`A_i`$; this gives a copy missing $`d`$. Otherwise, some $`A_j`$ is wholly color $`d`$. For every sufficiently large $`i`$ one has $`t_i\le\lambda_j`$, and then $`q_i^j=p_j+t_i a_j+t_i^2b_j\in A_j`$ by taking parameter $`t_i`$ in that arc. The single secondary copy for this $`j`$ therefore has a monochromatic tail. It uses only finitely many colors and misses a member of the infinite palette. In either case the copy is an embedding of the same fixed $`M`$, as required. $`\square`$

The standard-library companion `verify_dim5.py` checks the algebraic identities and rational margins exactly. The proof above supplies the all-indices and continuum-variable arguments, including the existence of every positive box width.
