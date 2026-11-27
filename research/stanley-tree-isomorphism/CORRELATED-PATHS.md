# Which path correlations can be read linearly from the chromatic symmetric function?

This research note concerns the ordinary chromatic symmetric function of an unmarked tree. It gives an obstruction to recovering the joint distances of two paths from the same vertex by universal linear transformation, an exact description of the additive statistics available to a forest-level linear functional, and a positive description of which unions of paths can be counted. The obstruction also holds within a single diameter and survives uniform grafting. It gives no pair of trees with equal chromatic symmetric functions.

## An obstruction on connected trees, even with the diameter supplied

For a tree $`T`$ put $`n_j(v)=\#\{w:d(v,w)=j\}`$. The number of ordered pairs of distinct length-$`j`$ paths sharing the specified initial vertex, summed over that vertex, is
```math
W_j(T)=\sum_v n_j(v)(n_j(v)-1).
```
Every individual path count is linear in the chromatic symmetric function on trees, by Martin, Morin and Wagner. There is no corresponding linear extraction of $`W_5`$, even restricted to trees on nine vertices all of diameter five. [Single path theorem](https://arxiv.org/abs/math/0609339)

Here are the four trees, labelled only to specify their edges. An entry $`uv`$ denotes the edge between the two displayed digits.

| Tree | Edges | Ordered pairs of paths at maximum length |
| --- | --- | ---: |
| $`A`$ | 01, 02, 03, 04, 15, 16, 57, 78 | 6 |
| $`B`$ | 01, 02, 03, 14, 15, 26, 37, 68 | 6 |
| $`C`$ | 01, 02, 03, 04, 15, 16, 27, 78 | 2 |
| $`D`$ | 01, 02, 03, 14, 25, 36, 47, 48 | 8 |

The exact [finite identity check](verify_correlated_path_trade.py) enumerates all 256 spanning edge sets of each tree, assigning their component-size partitions. The two sums of all coefficients agree, so $`X_A+X_B=X_C+X_D`$ by Stanley's power-sum expansion. The two correlation sums are twelve and ten. Thus even the diameter and order cannot select a linear map extracting this endpoint correlation. The four entries are a signed relation between different trees. The diameter-five reconstruction theorem already identifies each individual tree. [Original CSF expansion](https://doi.org/10.1006/aima.1995.1020) · [Diameter-five reconstruction](https://www.mat.univie.ac.at/~slc/wpapers/FPSAC2025/78.pdf)

The obstruction persists at unbounded orders and with arbitrarily complicated branching. Given any rooted tree $`H`$ of height $`h`$, identify its root with each vertex of a base tree, using disjoint copies. In a fixed proper colouring of the base, the contribution from a copy rooted at a vertex of colour $`i`$ is a homogeneous colour series $`f_i`$ depending only on $`i`$. The chromatic symmetric function of the expanded tree is consequently the substitution $`x_i\mapsto f_i`$ in the original function. This substitution preserves every linear relation. It can first be performed with finitely many colours and then in every number of colours. In particular the four grafted trees still satisfy the same relation.

Write $`M`$ for the number of vertices of $`H`$ at distance $`h`$ from its root. The four new diameters are all $`5+2h`$. A path of that length must join deepest vertices in copies whose base vertices have distance five, since paths within one copy have length at most $`2h`$. At a deepest vertex of the copy over $`v`$, the number of endpoints at this new diameter is $`M n_5(v)`$. There are $`M`$ such choices of initial vertex per copy. The new correlation equals
```math
M^3W_5(T)+M^2(M-1)\sum_v n_5(v).
```
The last term cancels in the signed relation by linearity of ordinary path counts. Hence the discrepancy is exactly $`2M^3`$ for every rooted decoration, including stars of unbounded degree and trees with arbitrarily many branch vertices.

Another family comes from Zheng's established expansion of a three-legged spider in products of path functions. Let $`S(a,b,c)`$ denote the tree with one hub and three legs of the indicated lengths. Put $`n=6k+1`$ and $`Q_i=X_{P_i}X_{P_{n-i}}`$. Zheng's formula gives
```math
X_{S(a,b,c)}=X_{P_n}+\sum_{i=1}^c (Q_i-Q_{b+i}).
```
For $`S(3k,2k,k),S(2k,2k,2k),S(4k,k,k)`$ this yields $`2X_{S(3k,2k,k)}=X_{S(2k,2k,2k)}+X_{S(4k,k,k)}`$ by $`Q_i=Q_{n-i}`$. The same-root correlations at length $`5k`$ are respectively zero, zero and two. These spiders are already known to be distinguished individually. [Zheng's spider expansion](https://doi.org/10.1016/j.jcta.2022.105608)

## Forest-level linear statistics

Use the ordinary forest polynomial $`U_F=\sum_{A\subseteq E(F)}\prod_C u_{|C|}`$, where $`C`$ ranges over the vertex components after retaining $`A`$. For forests this differs from the power-sum form of $`X_F`$ only by the universal signs in each degree. Suppose an invariant of finite forests is additive under disjoint unions, and in each order is a linear function of the coefficients of $`U_F`$. Then there exist constants $`a_k`$ such that, on every forest,
```math
f(F)=\sum_{k\ge1}a_k\#\{S\subseteq V(F): |S|=k,\ F[S]\text{ is connected}\}.
```
Each such expression has the required two properties.

Indeed the polynomials $`U_{P_k}=u_k+g(u_1,\ldots,u_{k-1})`$ freely generate the polynomial ring over the rationals by triangular substitution, so the forest polynomials span it. Put $`\varepsilon(u_1)=1`$ and $`\varepsilon(u_k)=0`$ for $`k>1`$. Then $`\varepsilon(U_F)=1`$ for every forest. The linear functional $`f`$ on the graded polynomial ring satisfies the derivation rule at $`\varepsilon`$ by bilinearity and forest multiplicativity. Every such derivation is $`\sum_k a_k\partial_{u_k}`$ evaluated at $`\varepsilon`$. For $`k>1`$ the derivative picks one connected component of size $`k`$ and leaves all other vertices isolated. Every connected vertex subset supplies exactly one such choice of retained edges. The first derivative counts the isolated vertices of the all-singleton forest, giving the number of vertices of the original forest. This proves both directions.

In particular the tree-only linear path-count functional cannot be applied to arbitrary induced forest factors in the colour-alphabet coproduct. An even smaller witness there is $`U_{P_4}+U_{P_3\sqcup P_1}=U_{K_{1,3}}+U_{2P_2}`$, but only the first summand contains a length-three path. This distinguishes the forest-level issue from the connected-tree obstruction above.

## Positive data from unions of random paths

For any fixed simple graph $`H`$, choose a uniformly random map $`f:V(H)\to V(T)`$. Connect the image of each edge by its unique path in $`T`$, and let $`L_H`$ be the number of *distinct* edges used. The whole probability generating polynomial of $`L_H`$ is a linear function of $`U_T`$. If a random edge subset of $`T`$ retains each edge with probability $`q`$, then conditional on $`f`$ the probability that all required paths survive is $`q^{L_H}`$. Conditional instead on the component-size partition $`\lambda`$, this probability is
```math
\prod_{K\in\mathrm{comp}(H)}
\frac{\sum_j\lambda_j^{|V(K)|}}{|V(T)|^{|V(K)|}}.
```
The probability of each partition is its coefficient in $`U_T`$ times $`q^{n-\ell(\lambda)}(1-q)^{\ell(\lambda)-1}`$. This proves the formula. Injective sampling gives the corresponding counts by inclusion-exclusion over vertex identifications. Two stars sharing a labelled center and any connected test graph on the same number of labels give the same union statistic, since that union is the subtree spanning those labels.

Conversely the laws of all such union sizes recover $`U_T`$ once the order is given. At $`q=1/2`$ the partition law is simply its coefficient divided by $`2^{n-1}`$. Varying the orders and multiplicities of the components of $`H`$ gives every joint moment of the power sums of this random partition. Power sums through degree $`n`$ determine a partition by Newton's identities, after padding with zeros. Polynomials in these power sums therefore separate the finitely many possible partitions; finite interpolation recovers the mass at each one. This one-parameter description retains all of the original invariant while revealing that a union of paths measures a common edge once. The missing separately weighted same-root distances cannot be recovered by the analogous linear transformation above. The general nonlinear reconstruction problem remains open.

## Internal check

The WadeDavis Codex session derived this research obstruction and the equivalence for random unions. A separate internal mathematical reviewer checked the graft formula, forest derivation, moment inversion, reflected-index spider formula, all four exact forest enumerations and 20 graft checks. The same-diameter example and its grafts concern linear extraction. This note has no catalogue entry.
