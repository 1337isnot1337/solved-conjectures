# Vizing’s conjecture

**Status.** Partial result. Connected graphs realize the symmetric extremal segment of the current aggregate bound. The conjecture for unrestricted pairs remains open. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/594)

## Statement and sources

For all finite nonempty simple graphs $`G,H`$, Vizing conjectured that $`\gamma(G\square H)\ge\gamma(G)\gamma(H)`$, where $`\gamma`$ is the domination number and $`\square`$ is the Cartesian product. Vizing’s 1968 paper states the exact question in §3, p. 133 of the English translation, under the name external stability number, and points to his 1963 paper. [Vizing, Some unsolved problems in graph theory](https://doi.org/10.1070/RM1968v023n06ABEH001252)

A bounded primary-source screen on 2026-11-24 found Steiner’s universal bound $`(5+\sqrt{73})/24`$ and Aliabadi and Krop’s subsequent $`2/3`$ bound in version 3. Krop withdrew his 2011 full-proof preprint because of an issue with label exchange. Searches by the conjecture name, Cartesian domination, source identifiers, extremal packing parameters, and formal statement located no earlier resolution of the unrestricted conjecture or this exact construction. Searches of the current repository branches and tracked issues and PRs located no duplicate. Priority for the partial result is provisional. [Steiner](https://arxiv.org/abs/2606.14414) · [Aliabadi and Krop, v3](https://arxiv.org/abs/2607.01109v3) · [Krop withdrawal](https://arxiv.org/abs/1109.0707v2) · [MathBench formal target](https://mathbench.ai/en/items/MBC1-T4S-P056)

Aliabadi and Krop’s Proposition 6.1 identifies a symmetric segment where their aggregate lower bounds certify exactly $`2/3`$. Their Remark 6.3 leaves open whether these parameter values occur in actual graph pairs. The construction below realizes every rational point on that segment and has fractional and independence-domination numbers equal to half the domination number. A direct count proves Vizing’s bound whenever one factor belongs to the constructed family.

## Theorem

Write $`\rho(G)`$ for the largest number of pairwise disjoint closed neighborhoods. Let $`\rho_{\{2\}}(G)`$ be the maximum total nonnegative integer weight with weight at most two on any closed neighborhood. Let $`\gamma_f(G)`$ be the minimum total nonnegative real weight with weight at least one on each closed neighborhood. Write $`\gamma^i(G)=\max_I\gamma_G(I)`$ over independent sets $`I`$, where $`\gamma_G(I)`$ is the minimum number of vertices of $`G`$ whose closed neighborhoods cover $`I`$. This is the independence-domination parameter used by Aharoni and Szabó. [Aharoni and Szabó, Vizing’s conjecture for chordal graphs](https://doi.org/10.1016/j.disc.2008.02.025)

For each rational $`p`$ with $`0<p\le 1/3`$, there exists a connected finite simple graph $`G`$ with
```math
\frac{\rho(G)}{\gamma(G)}=p,\qquad
\rho_{\{2\}}(G)=\gamma(G),\qquad
\gamma_f(G)=\gamma^i(G)=\frac{\gamma(G)}2.
```

For every finite graph $`H`$, this $`G`$ satisfies $`\gamma(G\square H)\ge\gamma(G)\gamma(H)`$.

## Construction

Choose a nonempty list $`m_1,\ldots,m_t`$ of even integers at least six. In block $`i`$, with $`m=m_i`$, the set $`X_i`$ of **centers** is a copy of the edge set of $`K_m`$. Make all centers, including centers from different blocks, one clique.

The remaining vertices in block $`i`$ are as follows.

- There is one star vertex $`s_v`$ for each vertex $`v`$ of $`K_m`$. Its neighbors are precisely the centers corresponding to edges incident with $`v`$.
- There are $`m`$ disjoint cliques $`B_{i,1},\ldots,B_{i,m}`$. Each contains a vertex $`b_{j,T}`$ for every $`(m-1)`$-subset $`T`$ of $`X_i`$. Its neighbors outside its own clique are precisely the centers in $`X_i\setminus T`$.

These rules specify every edge. The center clique connects every vertex. Put $`M=\sum_i m_i`$.

### Domination, fractional domination, and packing

If a set $`D`$ contains fewer than $`m_i`$ vertices in block $`i`$, extend its chosen centers from that block to a set $`T`$ of size $`m_i-1`$. One of the $`m_i`$ cliques in block $`i`$ contains no member of $`D`$. The vertex indexed by $`T`$ in that clique is undominated, since its closed neighborhood consists of that clique and $`X_i\setminus T`$. Thus every dominating set uses at least $`m_i`$ vertices in block $`i`$. Conversely, in every block choose the centers from a Hamiltonian cycle of its $`K_{m_i}`$. They meet every star, and a set of $`m_i`$ centers cannot lie in a set $`T`$ of size $`m_i-1`$. The chosen centers also dominate the center clique. Hence $`\gamma(G)=M`$.

Place fractional dominating weight $`1/(m_i-1)`$ on each center in block $`i`$, with zero elsewhere. Each star sees weight one. For each $`b_{j,T}`$, the weight seen in its own block is $`\bigl(\binom{m_i}{2}-(m_i-1)\bigr)/(m_i-1)=(m_i-2)/2`$. Each center sees all center weights, totaling $`M/2`$. This gives $`\gamma_f(G)\le M/2`$. Place integer packing weight one on every star, with zero elsewhere. Each center sees exactly two stars, each star sees itself, and every $`b_{j,T}`$ sees zero stars. Thus $`\rho_{\{2\}}(G)\ge M`$. For any feasible nonnegative packing weights $`z`$ and dominating weights $`w`$, symmetry of the closed-neighborhood relation gives
```math
\sum_v z(v)\ \le\ \sum_{v,u:\,u\in N[v]} z(v)w(u)\ \le\ 2\sum_u w(u).
```

Both bounds are therefore equalities.

The closed neighborhood of a center intersects every closed neighborhood, since each vertex sees a center. Among noncenters in the same block, two star neighborhoods meet at the corresponding edge of $`K_{m_i}`$. Two $`b_{j,T}`$ neighborhoods meet at a center because $`2(m_i-1)<\binom{m_i}{2}`$. This gives at most two packing vertices per block. The pair consisting of $`s_v`$ and $`b_{1,T}`$ with $`T`$ equal to the star of $`v`$ has disjoint neighborhoods. The neighborhoods of noncenters from different blocks are disjoint. Consequently $`\rho(G)=2t`$.

### Independence-domination number

All $`M`$ star vertices form an independent set. A center dominates exactly two of them, a star only itself, and each other vertex zero. Hence $`\gamma^i(G)\ge M/2`$.

Let $`I`$ be any independent set. It meets at most one vertex in each clique $`B_{i,j}`$. In a block of size $`m`$, choose a perfect matching of $`K_m`$ that is contained in none of the at most $`m`$ forbidden sets $`T`$ associated with those members of $`I`$. The matching centers dominate all stars of the block and every member of $`I`$ in its cliques. The centers chosen across all blocks also dominate any center in $`I`$.

To see that such a matching exists, fix a forbidden $`T`$ containing at least one perfect matching $`P`$. Any matching contained in $`T`$ is determined by its edges outside $`P`$. Indeed, after those edges are fixed, the uncovered vertices must be matched using edges of $`P`$, which leaves at most one choice. There are $`m/2-1`$ edges of $`T`$ outside $`P`$. For $`m=6`$, a matching different from $`P`$ uses both outside edges, since the symmetric difference is a union of even cycles of length at least four. Thus $`T`$ contains at most two matchings and six forbidden sets cover at most twelve of the fifteen matchings. For even $`m\ge 8`$, at most $`m2^{m/2-1}`$ matchings are forbidden. This is smaller than $`(m-1)!!`$, the total number of matchings. At $`m=8`$ the comparison is $`64<105`$. Increasing $`m`$ by two multiplies the forbidden count bound by $`2(m+2)/m`$ and the total by $`m+1`$, so the comparison persists. The matching centers use exactly $`M/2`$ vertices. This proves $`\gamma^i(G)=M/2`$.

### Domination in the Cartesian product

Take a dominating set $`D`$ of $`G\square H`$. Fix a block $`i`$, and put $`m=m_i`$. For each $`j\in\{1,\ldots,m\}`$, let $`P_j`$ be the set of second coordinates used by members of $`D`$ with first coordinate in $`B_{i,j}`$. For each $`h\in V(H)`$, set $`U_h=\{x\in X_i:(x,h)\in D\}`$.

If $`|U_h|<m`$, choose $`T`$ of size $`m-1`$ containing $`U_h`$. For every $`j`$, the vertex $`(b_{j,T},h)`$ must be dominated either by a member of $`D`$ in $`B_{i,j}\times\{h\}`$, or by a member with first coordinate $`b_{j,T}`$ and second coordinate in $`N_H[h]`$. No selected center of this block at $`h`$ can dominate it. This gives $`P_j\cap N_H[h]\ne\varnothing`$ for all $`j`$.

If $`|U_h|\ge m`$, add $`h`$ to each $`P_j`$. Each addition can be charged to a distinct member of $`D`$ in $`U_h\times\{h\}`$. The augmented sets dominate $`H`$, and their sizes sum to at most the number of members of $`D`$ whose first coordinate is a center of block $`i`$ or lies in one of its cliques $`B_{i,j}`$. The initial size of each $`P_j`$ was charged to its own clique. Hence that number is at least $`m_i\gamma(H)`$. The counted first-coordinate sets are disjoint across blocks. Summing proves the asserted product bound.

The product inequality for this family also follows from Brešar and Rall’s fair-reception theorem. Take the cliques $`B_{i,j}`$ as the reception sets. To dominate any such clique externally requires at least $`m_i`$ centers from its block, by the same witness $`T`$ used above. The number of reception sets required from that block is at most $`m_i`$, and centers from distinct blocks count separately. Thus the centers alone give the required external domination charge. The fair domination number consequently equals $`\gamma(G)`$. The product bound is an application of this established method as well as a direct count. Brešar and Rall’s earlier family $`F_k`$ has packing-to-domination ratio $`(k+1)/(2k+1)>1/2`$, outside the segment studied here. [Brešar and Rall, Fair reception and Vizing’s conjecture](https://doi.org/10.1002/jgt.20366)

### Realizing the segment

For rational $`p`$ in the stated range, $`2/p`$ is rational and at least six. If it is an even integer, use one block of that size. Otherwise express $`2/p`$ as a rational convex combination of two consecutive even integers at least six. Choose the multiplicities of their block sizes in that proportion. The resulting graph has $`M/t=2/p`$, so $`\rho(G)/\gamma(G)=2t/M=p`$.

For the pair $`(G,G)`$, the inputs to Aliabadi and Krop’s Proposition 6.1 are $`(p,1/2,p,1/2)`$, at which their aggregate bound equals $`2/3`$. Any real point on the segment is a limit of these rational points. Universal relations among the four factor parameters used by that optimization cannot exclude the whole minimizing segment. Adding the separate lower bounds based on $`\gamma_f`$ and $`\gamma^i`$ gives only $`1/2`$ on these factors. The product count gives an actual ratio of at least one. Improving the general constant requires an argument that also handles realizable factors at the minimizing inputs. Aliabadi and Krop’s Remark 6.2 identifies information about the Cartesian layers discarded in their aggregate argument. [Aliabadi and Krop, §6](https://arxiv.org/abs/2607.01109v3)

The separate bound from the fractional parameter is due to Fisher, and the one from independence domination is due to Aharoni and Szabó. The fair-reception bound has value one on the constructed factors. [Fisher, Domination, fractional domination, 2-packing, and graph products](https://doi.org/10.1137/S0895480191217806) · [Aharoni and Szabó](https://doi.org/10.1016/j.disc.2008.02.025)

## Verification

The symbolic audit checks the local witness for integral domination, the matching-count bound, and both directions of the packing and fractional-weight certificates. The product projection counts second coordinates once within each clique, charges inserted coordinates to distinct centers, and uses disjoint first-coordinate sets across blocks. The independent-set proof covers any center in the independent set through the joined center clique.

Run `python3 research/vizing-conjecture/verify.py` from the repository root. Exact enumeration confirmed that at block sizes six and eight the maximum number of perfect matchings in a forbidden set is two, across 945 and 196,980 forbidden sets containing a matching, respectively. The checker also tested interpolation for 1,053 input fractions. The general statements follow from the written proof. The unrestricted conjecture remains open. The partial result has no formal verification or independent review.
