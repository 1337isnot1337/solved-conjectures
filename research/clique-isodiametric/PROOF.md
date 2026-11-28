# Clique-isodiametric conjecture

Tracking issue: [#345](https://github.com/1337isnot1337/solved-conjectures/issues/345).

**Status:** the conjecture is false as a direct consequence of an earlier best-packing theorem. This note gives a self-contained finite cube estimate and matching uniform bounds for the associated vertex and edge extremal functions. It is not a claim of a new conjecture resolution or of external review.

**Earlier implication.** Borodachov, Hardin and Saff [(2007), equation (1.3) and Theorem 2.2](https://www.math.vanderbilt.edu/saffeb/texts/212.pdf) show that the largest achievable minimum distance $`\kappa_k`$ among $`k`$ points in the unit cube is asymptotic to $`2(\delta_d/(\omega_d k))^{1/d}`$. The cube of side $`2/\kappa_k`$ therefore has a $`K_k`$-free large-distance graph under the strict distance threshold $`2`$ and has volume asymptotic to $`(\omega_d/\delta_d)k`$. This alone contradicts the later conjecture in dimensions $`2,3,4`$, since $`\delta_d<1`$. The finite estimate below gives an elementary quantitative version of this implication; the upper estimate is uniform over all admissible measurable sets.

Let $`G_A`$ be the graph on a measurable set $`A\subseteq\mathbb R^d`$ joining two points exactly when their Euclidean distance is greater than $`2`$. Write $`\omega_d`$ for the volume of the unit ball and $`\delta_d`$ for the optimal packing density of Euclidean unit balls. Set
```math
V_{d,k}=\sup_{G_A\ K_k\text{-free}}|A|,\qquad
E_{d,k}=\sup_{G_A\ K_k\text{-free}}\tfrac12|\{(x,y)\in A^2:\|x-y\|>2\}|.
```
Doležal, Hladký, Kolář, Mitsis, Pelekis and Vlasák conjectured that $`V_{d,k}\le (k-1)\omega_d`$ in dimensions $`d\le 4`$.

**Theorem.** For every fixed $`d\ge 1`$, put $`b_d=\omega_d/\delta_d`$. For every $`k\ge 2`$,
```math
\big((b_d k)^{1/d}-2\big)_+^d\ \le\ V_{d,k}\ \le\ b_d(k-1),
```
where $`x_+=\max\{x,0\}`$. In particular,
```math
V_{d,k}=b_d(k-1)+O_d(k^{1-1/d}),\qquad
E_{d,k}=\tfrac12b_d^2(k-1)^2+O_d(k^{2-1/d}).
```
The conjectured inequality fails in dimensions $`2,3,4`$ for every sufficiently large $`k`$. The same asymptotic obstruction applies in every fixed dimension $`d\ge 2`$. This result does not identify extremal sets or exact finite-$`k`$ values.

### Vertex upper bound: average over translations of a packing

A periodic packing of unit balls has a full-rank lattice of periods, with $`m`$ representatives for its centers in a half-open fundamental cell $`T`$. Its density is $`m\omega_d/|T|`$. The supremum of periodic packing densities equals $`\delta_d`$. To see this, take arbitrarily large cubic windows where a near-optimal packing approaches its upper density, and retain the balls wholly contained in each window. The omitted balls that meet the window have centers within distance $`1`$ of the boundary. Their pairwise interior-disjoint unit balls lie in a shell of width at most $`4`$, so there are $`O_d(L^{d-1})`$ of them for window side $`L`$. Repeat the contained pattern with periods $`L\mathbb Z^d`$; distinct copies still have disjoint interiors. The resulting densities approach optimality.

Dilate the center set of a periodic packing by $`1+\epsilon`$ for any $`\epsilon>0`$, without changing the unit radius attached to each center. The resulting periodic center set $`P`$ has pairwise distances strictly greater than $`2`$, and density reduced by the factor $`(1+\epsilon)^{-d}`$. Such densities therefore still approach $`\delta_d`$.

Let $`T`$ denote the fundamental cell of the dilated period lattice $`\Lambda`$, with $`p_1,\ldots,p_m`$ representatives. Every translate $`P+t`$ contains at most $`k-1`$ points of $`A`$ by $`K_k`$-freeness. Tonelli gives
```math
(k-1)|T|\ \ge\ \int_T |(P+t)\cap A|\,dt
=\sum_{i=1}^m\sum_{\lambda\in\Lambda}\int_T{\bf1}_A(p_i+\lambda+t)\,dt
=m|A|.
```
For each fixed $`i`$, the sets $`p_i+\lambda+T`$ tile space as $`\lambda`$ varies. Hence $`|A|\le(k-1)\omega_d/\delta`$ for every density $`\delta`$ of a periodic packing with strict separation. Let $`\delta`$ approach $`\delta_d`$. This also proves finiteness of $`|A|`$ without assuming $`A`$ bounded.

### Vertex lower bound: periodize any clique in a cube

Let $`A=[0,L]^d`$. If $`G_A`$ contains a clique with $`k`$ vertices $`p_1,\ldots,p_k`$, the center set
```math
\{p_1,\ldots,p_k\}+(L+2)\mathbb Z^d
```
is a periodic unit-ball packing. Within each translate the center distances are greater than $`2`$. Between distinct translates, at least one coordinate difference has magnitude at least $`2`$. Equality is allowed here because ordinary sphere packing requires only disjoint interiors. The packing has density $`k\omega_d/(L+2)^d`$, which cannot exceed $`\delta_d`$.

Therefore $`A`$ is $`K_k`$-free whenever $`L+2<(b_dk)^{1/d}`$. Taking $`L`$ up to that endpoint from below proves the lower bound for the supremum. If the endpoint for $`L`$ is nonpositive, the lower bound is simply $`V_{d,k}\ge 0`$. Together the two bounds give the stated vertex asymptotic for fixed $`d`$.

### Edge asymptotic

If $`v=|A|`$, the set of ordered pairs in $`A^2`$ at distance at most $`2`$ has measure at most $`2^d\omega_d v`$, by integrating the measure of $`A\cap B(x,2)`$ over $`x\in A`$. Hence
```math
\tfrac12(v^2-2^d\omega_d v)\ \le\ e(G_A)\ \le\ \tfrac12v^2.
```
The vertex upper bound gives the edge upper bound. For the edge lower bound, use the $`K_k`$-free cubes with $`L=(b_dk)^{1/d}-3>0`$ for sufficiently large $`k`$. They have $`v=b_d(k-1)+O_d(k^{1-1/d})`$, giving the asserted lower asymptotic.

### Strict contradiction in dimensions 2, 3 and 4

Thue's theorem gives $`\delta_2=\pi/(2\sqrt3)<1`$.

For completeness, the classical Blichfeldt gauge proves $`\delta_d<1`$ for every $`d\ge 3`$. Define $`f(x)=(1-\|x\|^2/2)_+`$. At each point $`x`$, enumerate the $`m`$ nearby packing centers $`c_i`$ with $`f(c_i-x)>0`$. Put $`z_i=c_i-x`$. For $`m\ge1`$,
```math
m\sum_i\|z_i\|^2\ \ge\ \sum_{i\lt j}\|z_i-z_j\|^2\ \ge\ 2m(m-1).
```
The first inequality is the pair-difference sum identity; the second uses minimum center separation $`2`$. Thus $`\sum_i f(z_i)\le 1`$, also true if $`m=0`$. Average this over a periodic packing's fundamental cell as before. The center density is at most $`1/\int f`$. Radial integration gives
```math
\int_{\mathbb R^d}f(x)\,dx=\frac{2^{d/2+1}\omega_d}{d+2},\qquad
\delta_d\le \frac{d+2}{2^{d/2+1}}<1\quad(d\ge3).
```
The bound is strictly less than $`1`$ at $`d=3`$ and decreasing thereafter. Since $`b_d>\omega_d`$ for $`d\ge 2`$, the vertex lower bound exceeds $`(k-1)\omega_d`$ for every sufficiently large $`k`$, in particular in dimensions $`2,3,4`$ of the conjecture.

**Explicit planar witness.** Take $`A=[0,40]^2`$ and $`k=510`$. Any $`n`$ pairwise more-than-$`2`$ separated points in $`A`$ give a packing of density $`n\pi/42^2`$, so $`n\le42^2/(2\sqrt3)<510`$. The strict inequality follows from $`1764^2<3\cdot1020^2`$. Yet $`|A|=1600>509\pi`$, since $`509(22/7)=11198/7<1600`$.

### Attribution and scope

- M. Doležal, J. Hladký, J. Kolář, T. Mitsis, C. Pelekis and V. Vlasák, [A Turán-Type Theorem for Large-Distance Graphs in Euclidean Spaces, and Related Isodiametric Problems](https://doi.org/10.1007/s00454-020-00183-2), *Discrete & Computational Geometry* 66 (2021), 281–300. The conjecture appears in §5.1 of the [arXiv manuscript](https://arxiv.org/pdf/1904.07498v2) and in [the 2019 proceedings version, printed p. 628](https://www.iam.fmph.uniba.sk/amuc/ojs/index.php/amuc/article/download/1300/769/). The original paper proves the planar case $`k=3`$, unchanged by this argument. The authors themselves observed failure at $`k=3`$ for $`d\ge5`$; the above disproof concerns dimensions $`2,3,4`$ with $`k`$ growing.
- H. F. Blichfeldt, [The minimum value of quadratic forms, and the closest packing of spheres](https://doi.org/10.1007/BF01454863), *Mathematische Annalen* 101 (1929), 605–608, is the classical gauge reference.
- For the planar packing density, see A. Thue, *Über die dichteste Zusammenstellung von kongruenten Kreisen in einer Ebene* (1910), or H.-C. Chang and L.-C. Wang, [A Simple Proof of Thue's Theorem on Circle Packing](https://arxiv.org/abs/1009.4322).
- Periodizing a padded finite pattern and integrating over translations are classical. Here these tools give matching leading constants for the two extremal quantities above.
- This does not settle Bereg–Dumitrescu–Jiang's $`1/4`$ disk-covering conjecture. Its congruent-disk case would follow from the clique-isodiametric inequality applied to the union of unit disks at distance threshold $`4`$, but the implication need not reverse.
