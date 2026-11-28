# Erdős 774: ternary-minimal simplicial supports with unbounded rational nullity

Date: 21 November 2026.

This is a structural counterexample to a proof shortcut, not a resolution of Erdős 774. It strengthens the earlier generic-matrix warning inside the actual simplicial boundary matrices under consideration. The construction gives no unbounded dissociated coloring number and no estimate deciding the minimal-support local-lemma criterion.

No new-result priority is claimed. The purpose is to determine which circuit-counting statements can legitimately be used in the present proof search.

## 1. Statement

Let $`E_{n,k}`$ be the columns $`\partial e_I`$, $`I\in\binom{[n]}k`$, where $`\partial`$ is the usual oriented simplicial boundary. A nonempty set $`S`$ of columns is *ternary-minimal* if it supports a nonzero kernel vector with coefficients in $`\{-1,0,1\}`$, but no proper subset does.

### Proposition

For every integer $`m\geq1`$, there is a two-dimensional abstract simplicial complex $`K_m`$ with


```math
f_0(K_m)=44m+4,\qquad
f_1(K_m)=174m+6,\qquad
f_2(K_m)=124m+4
\tag{1}
```


such that:

1. Its rational space of two-cycles has dimension $`m+1`$.
2. Its only nonzero ternary two-cycles are $`z_m`$ and $`-z_m`$, where $`z_m`$ has nonzero coefficient on every triangle.
3. The support of $`z_m`$ contains $`m`$ pairwise disjoint proper rational circuits. Each has 76 triangles and primitive integer coefficient height four.

For every $`k\geq4`$, joining $`K_m`$ with the boundary of a simplex on $`k-2`$ new vertices gives a ternary-minimal support in $`E_{n,k}`$, whenever


```math
n\geq k+44m+2.
\tag{2}
```


It has $`(124m+4)(k-2)`$ facets and rational nullity $`m+1`$.

Consequently, at the critical scale $`k=\lfloor n/(C\log n)\rfloor`$, with one fixed $`C>0`$, ternary-minimal supports can have rational nullity growing linearly in $`n`$. Rational-circuit enumeration, or any assertion of bounded rational nullity for these supports, cannot be used without a different reduction.

## 2. The linear system to be realized

Use coordinates


```math
x_0,\quad x_{j,1},x_{j,2},x_{j,4}\qquad(1\leq j\leq m)
```


and impose the $`2m`$ equations


```math
x_0-2x_{j,1}+x_{j,2}=0,\qquad
3x_0-4x_{j,1}+x_{j,4}=0.
\tag{3}
```


Call this matrix $`A_m`$. Its kernel consists exactly of


```math
x_0=a,\qquad
x_{j,1}=a+b_j,\quad
x_{j,2}=a+2b_j,\quad
x_{j,4}=a+4b_j.
\tag{4}
```


The parameters $`a,b_1,\ldots,b_m`$ are free, so the rational nullity is $`m+1`$.

If all coordinates in (4) are ternary, then $`a`$ and every $`b_j`$ are integers. The four entries $`a,a+b_j,a+2b_j,a+4b_j`$ have range $`4|b_j|`$, while a ternary vector has range at most two. Thus $`b_j=0`$ for every $`j`$. The only nonzero ternary kernel vectors are therefore the all-one vector and its negative.

Every row of $`A_m`$ sums to zero. The absolute column sums are $`4m`$ for column zero; six for each $`x_{j,1}`$; and one for each $`x_{j,2}`$ or $`x_{j,4}`$.

## 3. An explicit annulus patch

For disjoint ordered triples $`(a,b,c)`$ and $`(u,v,w)`$, let


```math
\begin{split}
\mathcal A(abc;uvw)
={}&[a,b,v]+[a,v,u]+[b,c,w]
\\ &+[b,w,v]+[c,a,u]+[c,u,w].
\end{split}
\tag{5}
```


Here brackets denote oriented triangles. Direct cancellation of the six boundary sums gives


```math
\partial\mathcal A(abc;uvw)
=\partial[a,b,c]-\partial[u,v,w].
\tag{6}
```


To puncture an oriented sphere face $`[a,b,c]`$, use a private middle triple $`(u,v,w)`$ and an inner boundary triple $`(d,e,f)`$, and replace that face by


```math
\mathcal A(abc;uvw)+\mathcal A(uvw;def).
\tag{7}
```


The patch has twelve triangles, retains the old outer boundary, and contributes the negative of the inner boundary. It replaces one face, so the number of triangles increases by eleven.

The private middle triple matters. Even if several outer faces meet, or several inner boundaries are identified with the same shared loop, no triangle collapses and no duplicate triangle is created. Every patch triangle contains a private middle vertex. Edges incident to an inner boundary vertex outside its boundary loop have a private middle endpoint belonging only to that hole. Thus the only edges shared between different holes after identification are the designated boundary-loop edges.

Each patch has a connected triangle-adjacency graph through its non-boundary edges and meets all three old outer edges. Replacing faces in this way preserves connectivity of the triangle-adjacency graph of the original sphere, when inner boundary edges are excluded.

## 4. Realizing $`A_m`$ by punctured spheres and caps

Create $`2m`$ pairwise vertex-disjoint oriented three-edge loops, denoted $`\beta_1,\ldots,\beta_{2m}`$. They use $`6m`$ vertices.

For each coordinate $`x_i`$, construct an oriented chain $`P_i`$ on a connected punctured sphere, with boundary


```math
\partial P_i=\sum_{\ell=1}^{2m}(A_m)_{\ell i}\beta_\ell.
\tag{8}
```


The construction is explicit:

- For $`P_0`$, start with a bipyramid over a cycle on $`2m+2`$ vertices. Its sphere has $`2m+4`$ vertices and $`4m+4`$ oriented triangles. Replace $`4m`$ faces by the two-annulus patch (7). Identify their inner boundaries with the loops according to column zero of $`A_m`$, choosing orientations to give the specified positive signs.
- For each $`P_{j,1}`$, start with a bipyramid over a four-cycle, namely an octahedral sphere. Replace six of its eight faces by (7). Two holes map with negative sign to row $`2j-1`$, and four with negative sign to row $`2j`$.
- Let $`P_{j,2}`$ and $`P_{j,4}`$ be single triangular caps on the corresponding loops, with positive boundary orientation.

All original sphere vertices and all middle triples are private to their surface and hole. Only the inner boundary triples are shared. Equation (6) supplies (8), with no appeal to triangulating a quotient space.

The triangle sets of the $`P_i`$ are disjoint. Taking all these triangles and all their faces therefore defines an ordinary abstract simplicial complex $`K_m`$.

### Exact counts

The central chain has


```math
(4m+4)+11(4m)=48m+4
```


triangles. Each negative chain has $`8+11\cdot6=74`$ triangles, and there are $`2m`$ one-triangle caps. Thus


```math
f_2=(48m+4)+74m+2m=124m+4.
```


The private vertices of the central surface number $`(2m+4)+3(4m)=14m+4`$. The $`m`$ negative surfaces contribute $`m(6+3\cdot6)=24m`$ private vertices. Adding the $`6m`$ shared-loop vertices gives $`f_0=44m+4`$.

Before gluing boundary loops, the central punctured sphere has $`78m+6`$ edges and the negative surfaces have $`120m`$ edges in total. There are $`30m`$ boundary-edge copies, identified with $`6m`$ shared edges; the caps add no new edges. Hence $`f_1=174m+6`$, proving (1).

## 5. Exact kernel reduction

Choose the standard increasing orientation of every triangle. In these coordinates each $`P_i`$ has coefficients $`\pm1`$ on its triangle set.

Every edge not in a shared loop occurs in exactly two triangles of one surface, with opposite signed contributions in $`P_i`$. A two-cycle $`w`$ therefore has equal ratios


```math
\frac{w_\sigma}{(P_i)_\sigma}
```


across every such adjacent pair of triangles. The private-edge triangle-adjacency graph of each surface is connected by the patch construction. Thus $`w`$ has one constant coefficient ratio $`x_i`$ on each entire $`P_i`$. The same assertion is immediate for a one-triangle cap.

Consequently every two-cycle has a unique expression


```math
w=\sum_i x_iP_i.
\tag{9}
```


The remaining boundary equations are precisely the shared-loop equations. Since the $`\beta_\ell`$ have disjoint edge supports, equation (8) gives


```math
\partial w=0\quad\Longleftrightarrow\quad A_mx=0.
\tag{10}
```


This argument works over the rationals and over the integers. In the integer case each $`x_i`$ is integral because it is the ratio of an integer triangle coefficient to $`1`$ or $`-1`$.

It also preserves the ternary condition exactly:


```math
w\in\{-1,0,1\}^{f_2}
\quad\Longleftrightarrow\quad
x\in\{-1,0,1\}^{3m+1}.
\tag{11}
```


Equations (4), (10), and (11) prove the claimed nullity and show that the only nonzero ternary cycles are


```math
z_m=\sum_iP_i,\qquad -z_m.
```


Every triangle occurs with coefficient $`1`$ or $`-1`$. The full support is therefore ternary-minimal.

### Proper rational circuits

Set $`a=0`$, set one $`b_j=1`$, and set all other parameters to zero. The resulting cycle is


```math
P_{j,1}+2P_{j,2}+4P_{j,4}.
\tag{12}
```


It has $`74+1+1=76`$ triangles and primitive integer height four. Its support is a rational circuit: on this support, the kernel reduction leaves only the parameter $`b_j`$, and every nonzero value uses every triangle of all three groups. Removing any triangle forces that group's coefficient to zero and hence $`b_j=0`$.

These circuits are disjoint for different $`j`$. Each omits the entire nonempty central surface, so each is a proper subset of the ternary-minimal support.

## 6. Transfer to every growing dimension

Fix $`k\geq4`$, let $`B`$ be a new vertex set of size $`r=k-2`$, and write


```math
\tau=\partial e_B.
```


The join has facets $`F\cup(B\setminus\{b\})`$, where $`F`$ is a triangle of $`K_m`$ and $`b\in B`$. They are $`k`$-sets. The chain


```math
z_m\wedge\tau
\tag{13}
```


is a nonzero ternary cycle on all of them.

The full kernel on these facets is exactly


```math
\{y\wedge\tau:y\in\ker\partial|_{C_2(K_m)}\}.
\tag{14}
```


Here is a direct proof. Fix a triangle $`F`$. Boundary rows containing all three vertices of $`F`$ and omitting two vertices of $`B`$ relate the coefficients on the two corresponding facets. These pairwise equations force their coefficient list to be a scalar multiple of the boundary coefficient list of $`\tau`$. Thus a cycle has the form $`y\wedge\tau`$. The remaining boundary rows, containing two vertices from $`K_m`$, then give $`\partial y=0`$. Conversely the derivation identity for $`\partial`$ shows that every such wedge is a cycle.

No homology-dimension formula is needed. Since every nonzero coefficient of $`\tau`$ is $`1`$ or $`-1`$, (14) preserves ternarity and rational nullity. The support is ternary-minimal, its size is multiplied by $`r`$, and its vertex count is


```math
(44m+4)+(k-2)=k+44m+2.
```


For $`k=3`$, use $`K_m`$ itself.

At $`k=\lfloor n/(C\log n)\rfloor`$, choose


```math
m=\left\lfloor\frac{n-k-2}{44}\right\rfloor.
```


For all sufficiently large $`n`$, this is positive and (2) holds. Since $`k=o(n)`$, one has $`m\sim n/44`$. Thus rational nullity is unbounded, indeed linear in $`n`$, among the actual ternary-minimal supports at this scale.

## 7. What this does and does not rule out

The proposition rules out two unrestricted shortcuts for this family:

1. Treating every ternary-minimal support as a rational circuit.
2. Assuming a dimension-independent bound on the rational nullity of a ternary-minimal support.

It does not prove that the minimal-support weighted incidence diverges, nor that the full simplicial family requires arbitrarily many dissociated colors.

In fact, each constructed support by itself has dissociated coloring number exactly two. Its only forbidden ternary support is the full set, so any partition into two nonempty parts works. Every proper subset is dissociated, and its hereditary extraction fraction is $`(|S|-1)/|S|`$. Separated unions of these examples remain two-colorable and cannot resolve Erdős 774.

The construction is not an amplification argument. It establishes a limitation on the objects a successful counting argument must handle.

## 8. Primary comparison and verification

The [prior E774 registry](https://erdosproblems.ai/wiki/research/erdos_774/approaches) and its simplicial, decomposable-cycle, and joined-boundary pages were reviewed before this attempt. Those avoidance results do not assert that all ternary-minimal supports are rational circuits. This construction does not contradict them.

For broader context, [Dey–Hirani–Krishnamoorthy, *Optimal Homologous Cycles, Total Unimodularity, and Linear Programming*](https://arxiv.org/abs/1001.0338), also described on the [author's research page](https://www.cs.purdue.edu/homes/tamaldey/homology.html), explains why general simplicial boundary matrices do not inherit graph-incidence total unimodularity. The present argument does not invoke their theorem: the annulus identity and kernel reduction prove the required statements directly.

Bounded searches for simplicial Graver bases, flat cycles, ternary-minimal supports, and prescribed boundary matrices did not locate this exact parameterized construction. That search does not establish novelty, and none is claimed.

The offline files are:

- [Explicit generator and checker](check_erdos774_simplicial_minimality.py).
- [Base witness](erdos774-simplicial-minimality-witness.json) for $`m=1`$.
- [Verification report](erdos774-simplicial-minimality-check.json).

The checker verifies uniqueness and nondegeneracy of simplices, all private-edge components, the exact reduced boundary matrix, the counts in (1), explicit integer kernel vectors, and a modular rank lower bound that certifies the rational nullity. It also checks the join at $`k=4`$, for $`m=1,2`$.

These finite checks verify the implementation and explicit witnesses. The all-$`m`$, all-$`k`$ statements follow from the proof above, not from extrapolating those checks. No full paid target is completed.

## 9. Weighted Gaussian sum: exact scope and remaining gap

This separate analytic check uses the author-recorded [weak stable-lattice Gaussian theorem](https://erdosproblems.ai/wiki/research/erdos_774/lemmas/stable_lattice_free_energy). That theorem states that a stable rank-$`d`$, determinant-one lattice $`L`$ satisfies


```math
\theta_L(t)=\sum_{v\in L}e^{-\pi t^2\|v\|^2}
\leq e^{\epsilon(t)d}\qquad(t\geq T_0),
\tag{15}
```


where $`T_0`$ is absolute and $`\epsilon(t)\downarrow0`$. Its full proof is an external input here; this section records a consequence and its limit, not a new proof of (15).

For the full simplicial family set


```math
N=\binom nk,\quad
K=\ker\partial\cap\mathbb Z^N,\quad
d=\binom{n-1}k,\quad
\sigma=n^{k/[2(n-1)]}.
```


The [prior simplicial extraction manuscript](https://erdosproblems.ai/wiki/research/erdos_774/routes/simplicial_extraction) identifies $`K`$ as an exterior-root lattice and proves that $`L=K/\sigma`$ is stable. At the fixed-$`C`$ scale, $`\sigma\to e^{1/(2C)}>1`$.

Fix a fraction $`\rho>0`$, choose $`1<\sigma_0<e^{1/(2C)}`$, and let $`q>1`$ be fixed. Put


```math
t=\sqrt{\frac{\log q}{2\pi}},
\qquad
\eta_q=\epsilon(\sigma_0t).
```


Take $`q`$ large enough that $`\sigma_0t\geq T_0`$. For all sufficiently large $`n`$, $`\sigma\geq\sigma_0`$. Because the squared norm of a ternary vector is its support size, (15) gives the exact macroscopic-tail estimate


```math
\begin{split}
&\sum_{\substack{z\in K\cap\{-1,0,1\}^N
\\ |\mathop{\mathrm{supp}}z|\geq\rho N}}
q^{-|\mathop{\mathrm{supp}}z|}
\\ &\quad\leq
e^{-(\rho/2)N\log q}\theta_K(t)
\leq
\exp\left(\eta_qd-\frac{\rho}{2}N\log q\right)
\\ &\quad\leq
\exp\left[N\left(\eta_q-\frac{\rho}{2}\log q\right)\right].
\end{split}
\tag{16}
```


For sufficiently large fixed $`q`$, one has $`\eta_q\leq(\rho/4)\log q`$, so this tail is at most $`e^{-(\rho/4)N\log q}`$. Thus the external Gaussian input controls relations occupying a fixed positive fraction of all columns.

It does not control the full weighted sum in the way a direct first-moment coloring proof would require. Define


```math
Z_{n,k}(q)
=\sum_{z\in K\cap\{-1,0,1\}^N}q^{-|\mathop{\mathrm{supp}}z|}.
```


Packing $`M`$ elementary boundaries with disjoint facet supports, as in the [earlier counting diagnosis](minimal-support-counting-gap.md), gives


```math
M\geq
\frac{\binom n{k+1}}{(k+1)(n-k-1)+1},
\qquad
Z_{n,k}(q)\geq
\left(1+2q^{-(k+1)}\right)^M\longrightarrow\infty
\tag{17}
```


for every fixed $`q>1`$. The coefficients of the selected cycles can independently be $`0,1,-1`$, which explains the factor two. The limit follows from $`Mq^{-(k+1)}\to\infty`$, proved by the same fixed-constant binomial estimate as before.

Equations (16) and (17) are compatible: the obstruction to the full sum may occur on supports that are a vanishing fraction of $`N`$. The [phase-entropy manuscript](https://erdosproblems.ai/wiki/research/erdos_774/routes/moment_phase_entropy) uses a different small-parameter theta inequality to extract one large dissociated set; it does not supply a bounded partition.

This route stops at the small and intermediate **minimal** supports. The Gaussian estimate above supplies no uniform local incidence bound for those supports and no conclusion about a bounded or unbounded number of dissociated colors.



The uniform construction and the conditional Gaussian algebra passed a [separate independent review](SIMPLICIAL_REVIEW.md). The coordinator also replayed the explicit generator and rank checks.
