# Erdős–Nešetřil conjecture

Tracking issue: [#339](https://github.com/1337isnot1337/solved-conjectures/issues/339).

**Status: open; all-degree bound for the fractional relaxation only.** No integral strong edge-coloring bound of the conjectured strength is obtained. We give an explicit local bound, combining two published ingredients with a neighborhood-cut decomposition. We have not found an earlier statement of this particular combination and do not claim priority.

## Target and status

The strong chromatic index of a finite simple graph $`G`$ is $`\chi'_s(G)=\chi(L(G)^2)`$, where $`L(G)`$ is its line graph. This is the minimum number of induced matchings in a partition of $`E(G)`$. The Erdős–Nešetřil conjecture ([Erdős Problem #149](https://www.erdosproblems.com/149)) proposes $`5\Delta^2/4`$ colors for even maximum degree $`\Delta`$, and $`(5\Delta^2-2\Delta+1)/4`$ for odd $`\Delta`$. Its asymptotic even-degree constant is tight on balanced blowups of the five-cycle.

- [Luo, Yu and Zhou, arXiv:2611.10883](https://arxiv.org/html/2611.10883v1), Introduction, state the exact general conjecture, and give a sharp fractional and asymptotically sharp result for the different bipartite Brualdi–Quinn conjecture. Their proofs do not cover nonbipartite graphs.
- [Hu and collaborators, arXiv:2611.25381](https://arxiv.org/abs/2611.25381), posted November 19, 2026, give a special Ore-degree result, not the general conjecture.
- [Davey, Hurley, de Joannis de Verclos, Kang and Volec, arXiv:2607.17421](https://arxiv.org/abs/2607.17421) give the integral bound $`1.73\Delta^2`$ for sufficiently large $`\Delta`$. Targeted searches by name, the Erdős number, and exact fractional coefficients found no full resolution.
- [Śleszyńska-Nowak, *Clique number of the square of a line graph*](https://arxiv.org/abs/1504.06585) gave $`\chi_f(L(G)^2)\le 1.75\Delta^2`$, using a global clique-number bound and the global fractional Reed bound. More recent global strong-clique bounds give better coefficients through that same combination.

## Local fractional bound

For an edge $`e=uv`$, put $`S_e=N_G(u)\cup N_G(v)`$. This contains $`u`$ and $`v`$ because $`uv\in E(G)`$. Define
```math
\sigma_e=\max\Big\{d_{G-\{u,v\}}(x)+d_{G-\{u,v\}}(y):
xy\in E(G),\ x\in S_e\setminus\{u,v\},\ y\notin S_e\Big\},
```
where the maximum over no edges is zero. Then
```math
\chi'_{{s},f}(G)=\chi_f(L(G)^2)
 \le \frac12\max_{uv\in E(G)}\left\{\sum_{x\in S_{uv}}d_G(x)+\frac{620}{1987}\sigma_{uv}^2\right\}.
```
In particular, for every nonempty $`G`$ of maximum degree $`\Delta`$,
```math
\chi'_{{s},f}(G)\le \Delta^2+\frac{310}{1987}(2\Delta-1)^2
 =\frac{3227}{1987}\Delta^2-\frac{1240}{1987}\Delta+\frac{310}{1987}.
```
The leading constant is about $`1.62406`$. The empty-graph case is immediate.

### Proof

Set $`F=L(G)^2`$, and let $`\omega_F(e)`$ be the size of the largest clique of $`F`$ containing $`e`$. The local fractional Reed inequality gives
```math
\chi_f(F)\le \frac12\max_{e\in E(G)}\bigl(d_F(e)+1+\omega_F(e)\bigr).
```
This is McDiarmid's local form, as stated in [Edwards and King, *Bounding the Fractional Chromatic Number of $`K_\Delta`$-Free Graphs*, Theorem 5](https://arxiv.org/pdf/1206.2384).

Fix $`e=uv`$ and abbreviate $`S=S_e`$. The edges representing the closed neighborhood of $`e`$ in $`F`$ are precisely the $`G`$-edges with at least one endpoint in $`S`$. Thus
```math
d_F(e)+1=\sum_{x\in S}d_G(x)-|E(G[S])|.
```
Let $`C_e`$ be a largest clique through $`e`$ in $`F`$. Split its edges of $`G`$ into internal edges (both endpoints in $`S`$), and crossing edges (one endpoint outside $`S`$). The internal portion has size at most $`|E(G[S])|`$. Let $`J`$ be the bipartite graph whose edge set consists of the crossing portion. No $`J`$-edge is incident to $`u`$ or $`v`$, since every neighbor of either is in $`S`$.

Two edges in $`J`$ conflict in the strong edge-coloring sense in $`G`$ because they lie in $`C_e`$. Whether two given edges conflict depends only on their endpoints and on the adjacencies between these endpoints, so they still conflict in $`G-\{u,v\}`$. Hence $`E(J)`$ forms a clique in $`L(G-\{u,v\})^2`$. By [Kumar, Mohar and Pragada, *An improved bound for the strong clique index of graphs*, Theorem 1.6](https://arxiv.org/html/2607.02698v1), the size of a bipartite subgraph $`J`$ whose edges form a strong clique in its host is at most $`620/1987`$ times the square of the host Ore-degree on its edges. The relevant Ore-degree here is at most $`\sigma_e`$. The crossing portion therefore has at most $`(620/1987)\sigma_e^2`$ edges.

Adding the bound for the two clique portions to $`d_F(e)+1`$ cancels the $`|E(G[S])|`$ term and proves the local bound. Finally $`\sum_{x\in S}d_G(x)\le2\Delta^2`$. A crossing edge's endpoint in $`S\setminus\{u,v\}`$ has lost at least one neighbor, either $`u`$ or $`v`$, in $`G-\{u,v\}`$; its endpoint outside $`S`$ has degree at most $`\Delta`$. Consequently $`\sigma_e\le2\Delta-1`$, giving the displayed general bound.

## Scope and further question

This is a bound for $`\chi_f`$, not for the integral $`\chi`$. No rounding argument with negligible loss is inferred. In the same proof, the stronger bipartite strong-clique conjecture of Faron and Postle (Conjecture 1.4 of Kumar–Mohar–Pragada) would conditionally give $`\chi'_{{s},f}(G)\le \Delta^2+(2\Delta-1)^2/8`$, still larger than the $`5\Delta^2/4`$ target. Thus even settling that subsidiary clique conjecture would not by itself close the gap in this local Reed approach.

## A barrier at coefficient $`3/2`$ for local and superlocal Reed

The preceding method cannot be sharpened to the conjectured $`5/4`$ coefficient merely by optimizing the exact local degree and clique values. The following bipartite family makes both the exact local and exact superlocal fractional Reed expressions at least $`(3/2-o(1))\Delta^2`$, even though the fractional Brualdi–Quinn theorem bounds the actual fractional strong chromatic index by $`\Delta^2`$.

For an integer $`\Delta\ge3`$, use left-side vertices $`u`$, a set $`X`$ of size $`\Delta-1`$, and disjoint sets $`B_1,B_2`$ of size $`\Delta-1`$ each. On the right use vertices $`v_1,v_2`$, a set $`A`$ of size $`\Delta-2`$, and disjoint sets $`Y_1,Y_2`$ of size $`\Delta-1`$ each. The edges are:

- all edges between $`\{u\}\cup X`$ and $`A`$;
- $`e_1=uv_1`$ and $`e_2=uv_2`$;
- all edges between $`B_i`$ and $`\{v_i\}\cup Y_i`$, for each $`i=1,2`$.

The maximum degree is $`\Delta`$. For either $`e_i`$, its set $`S_{e_i}`$ has exactly $`2\Delta`$ vertices, all of degree $`\Delta`$: namely $`A,\{v_1,v_2\},\{u\},B_i`$. There are exactly $`2\Delta-1`$ edges inside $`S_{e_i}`$, so
```math
d_{L(G)^2}(e_i)+1=2\Delta^2-2\Delta+1.
```
All $`\Delta(\Delta-2)`$ edges of the complete bipartite graph between $`\{u\}\cup X`$ and $`A`$, together with $`e_1,e_2`$, form a clique in $`L(G)^2`$. In particular $`\omega_{L(G)^2}(e_i)\ge\Delta^2-2\Delta+2`$. Hence the exact local Reed expression at both $`e_i`$ is at least
```math
\frac{3\Delta^2-4\Delta+3}{2}.
```
Moreover $`e_1,e_2`$ are adjacent in $`L(G)^2`$ because they share $`u`$. Their pair therefore gives the same lower bound for the superlocal expression, which averages the local expressions over an adjacent pair and takes the maximum; see [Chudnovsky, Edwards and King, *A superlocal version of Reed's conjecture*, Theorem 3](https://arxiv.org/pdf/1208.5188). The scope of this example is a limitation of these two upper-bound expressions, not a lower bound on the actual strong chromatic index.
