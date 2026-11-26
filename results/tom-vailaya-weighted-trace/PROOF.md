# Proof of Tom–Vailaya’s weighted trace conjecture

**Status:** Proof of the trace identity in Conjecture 74 of Foster Tom and Aarush Vailaya, [*The chromatic symmetric function of graphs glued at a single vertex*](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v33i2p9), *Electronic Journal of Combinatorics* 33(2) (2026), #P2.9. It is Conjecture 5.16 in the [arXiv version](https://arxiv.org/pdf/2503.19344#page=29). This does not assert entrywise positivity of the weighted forest-triple matrix, nor a general resolution of Ellzey's positivity or unimodality conjecture. No priority is claimed.

Let $`G`$ be any natural unit interval graph (NUIG) on $`[n]`$, $`n\ge2`$, and let $`G^{\mathrm{cl}}`$ be the directed multigraph obtained by orienting every edge increasingly and identifying vertices $`1,n`$. All directed edges and their multiplicities are retained; a loop prohibits proper colorings. Write $`F_G(q)`$ for the weighted forest-triple matrix of Tom–Vailaya Definition 21. Then
```math
 X_{G^{\mathrm{cl}}}(x;q)=\mathop{\mathrm{tr}} F_G(q).
```
The closure in their Definition 58 is defined for $`n\ge2`$; no closure of a one-vertex input is asserted. There is no connectedness assumption.

## Finite color matrices and two test gadgets

Fix $`N\ge1`$, let $`x=(x_1,\dots,x_N)`$, and work over $`\mathbb Q(q,x_1,\dots,x_N)`$. Define the color matrix $`A_H`$ of a labelled graph $`H`$ on $`[m]`$ to have last color as the row index and first color as the column index, with entry
```math
 (A_H)_{b,a}
 =\sum_{\substack{\kappa\text{ proper}\\\kappa(1)=a,\ \kappa(m)=b}}
 q^{\mathop{\mathrm{asc}}(\kappa)}\prod_{u=2}^{m}x_{\kappa(u)}.
```
The one-vertex graph gives the identity operator. If $`H+J`$ glues the last vertex of $`H`$ to the first of $`J`$, then $`A_{H+J}=A_J A_H`$ by splitting a coloring at the common vertex. Multiplying the first color by its variable and summing the last color gives $`X_H(x;q)=\mathbf 1^\top A_H x`$, where $`x`$ on the right is a column. Finally, $`\mathop{\mathrm{tr}} A_G=X_{G^{\mathrm{cl}}}(x;q)`$: diagonal terms have equal first and last colors, and the factor for the last vertex supplies exactly one variable for the identified vertex. Each arc of $`G`$ corresponds to one arc of the closure, counted with multiplicity, and arcs that become loops force the diagonal terms to vanish.

For $`1\le j\le N`$, put
```math
 f_j(b)=[z^{j-1}]\,x_b\prod_{c\lt b}(1+qzx_c)\prod_{c>b}(1+zx_c).
```
Let $`B`$ have columns $`f_j`$. At $`q=1`$, the $`b`$-entries $`x_b e_{j-1}(x\setminus x_b)`$ are evaluations of a common degree-$`j`$ polynomial in $`x_b`$, with zero constant term and leading coefficient $`(-1)^{j-1}`$, since
```math
 x_b e_{j-1}(x\setminus x_b)=\sum_{s=0}^{j-1}(-1)^s e_{j-1-s}(x)x_b^{s+1}.
```
Thus $`B`$ is invertible, by the Vandermonde determinant after extracting $`x_b`$ from each row and making a triangular change of polynomial basis. Also $`f_1=x`$ and
```math
 (\mathbf 1^\top B)_j=[j]_q e_j(x)=:v_j.
```
Indeed, each set of $`j`$ colors contributes once for each distinguished color $`b`$, with power $`q`$ equal to the number of chosen colors smaller than $`b`$. Here $`[j]_q=1+\cdots+q^{j-1}`$, $`[0]_q=0`$, and $`[j]_q!`$ is the product of the first $`j`$ positive $`q`$-integers. Use $`v`$ also for the corresponding infinite row, after finite specialization, where $`v_j=0`$ for $`j>N`$.

The first test gadget is the complete graph $`K_j`$. Summing $`A_{K_j}f_1`$ includes the first color weight. Fixing the last color $`b`$, choose the other $`j-1`$ distinct colors and order them: their internal ascent enumerator is $`[j-1]_q!`$, and their arcs to $`b`$ supply $`q`$ for each color smaller than $`b`$. Therefore
```math
 A_{K_j}f_1=[j-1]_q! f_j.
```
Likewise Tom–Vailaya Proposition 37 gives $`F_{K_j}(q)\mathbf e_1=[j-1]_q!\mathbf e_j`$, including $`j=1`$ by their Proposition 22. Here $`\mathbf e_j`$ denotes a standard column, not the elementary symmetric function.

The second gadget is the path edge $`P_2`$, whose color operator is $`A_{P_2}(b,a)=x_b q^{[a<b]}`$ for $`a\ne b`$ and zero otherwise. Set $`f_{N+1}=0`$. We claim
```math
 A_{P_2}f_j=f_{j+1}+q[j-1]_q e_j(x)f_1.
```
For a proof, fix the output color $`b`$ and group terms by the $`j`$-element set $`S`$ of colors used in the input term $`f_j(a)`$ (so $`a\in S`$). If $`b\in S`$, then the term for $`a=b`$ is absent. Let $`s`$ be the rank of $`b`$ in $`S`$, and let $`r`$ be the rank of $`a`$. The $`q`$-exponent is $`r-1+[r<s]`$, and as $`r`$ ranges over the ranks other than $`s`$, these exponents are $`1,\dots,j-1`$. If $`b\notin S`$, write $`s-1`$ for the number of elements of $`S`$ smaller than $`b`$. The same exponents as $`r`$ ranges over $`1,\dots,j`$ are $`1,\dots,j-1`$ together with the extra exponent $`s-1`$. The first list over all $`S`$ gives the term $`q[j-1]_q e_j(x)f_1`$; the extra exponents over $`S`$ avoiding $`b`$ give $`f_{j+1}`$.

By Tom–Vailaya Proposition 23, the matrix in the $`f_j`$ basis is exactly the upper-left $`N\times N`$ block $`D`$ of $`F_{P_2}(q)`$ after specializing to $`x_1,\dots,x_N`$. For the infinite specialized matrix, its only possible nonzero transitions out of a state $`j>N`$ are $`j\to j+1`$: the other possible transition $`j\to1`$ has coefficient $`q[j-1]_q e_j(x)=0`$. Consequently the rows $`vF_{P_2}(q)^i`$ vanish on all states $`j>N`$, and their restrictions are $`v_{\le N}D^i`$.

These restricted rows for $`0\le i<N`$ form a basis of the dual space. In color coordinates they are $`\mathbf 1^\top A_{P_2}^i`$. At $`q=1`$,
```math
 A_{P_2}=x\mathbf 1^\top-\mathop{\mathrm{diag}}(x_1,\dots,x_N).
```
Inductively $`\mathbf 1^\top A_{P_2}^i`$ is the row $`((-x_b)^i)_b`$ plus a linear combination of rows $`((-x_b)^d)_b`$, $`0\le d<i`$: right multiplication by the diagonal part raises the power by one, while the rank-one term contributes a scalar times the constant row. The triangular change from Vandermonde rows is invertible. Thus the original rows over $`\mathbb Q(q,x)`$ are independent.

## Determine the general transfer by reflection

Let $`H^r`$ be the reflection of a labelled graph on $`[m]`$ by $`u\mapsto m+1-u`$, with edges of $`H^r`$ again oriented increasingly. For any NUIG $`H`$, $`X_H(x;q)`$ is symmetric in $`x`$ (Shareshian–Wachs, as recalled by Tom–Vailaya §2). Reversing labels exchanges ascents with descents. Reversing the order on the $`N`$ colors reverses ascents once again and reverses the variable order. Symmetry therefore gives $`X_{H^r}(x;q)=X_H(x;q)`$.

Let $`C_G=B^{-1}A_GB`$. Fix $`1\le j\le N`$ and $`0\le i<N`$, and compare $`K_j+G+P_{i+1}`$ with its reflection $`P_{i+1}+G^r+K_j`$. Both are NUIGs, since endpoint gluing preserves the interval condition. In the color description the former has polynomial
```math
 [j-1]_q!\,v_{\le N}D^i C_G\mathbf e_j.
```
By Tom–Vailaya Propositions 27 and 29, the reflected graph has polynomial
```math
 [j-1]_q!\,vF_{P_2}(q)^iF_{G^r}(q)\mathbf e_j
```
after the same finite specialization. The two gadgets and the tail property justify these expressions, including $`i=0`$. Equality for all $`i`$ and independence of the rows give the exact identity
```math
 C_G=\left(F_{G^r}(q)(x_1,\dots,x_N)\right)_{[N]\times[N]}.
```

By Tom–Vailaya Proposition 25, the forest index sets are empty on diagonal entries $`j\ge n\ge2`$, before weights are even attached. For $`N\ge n-1`$ the trace of this finite corner is therefore the entire forest-triple trace, specialized. This proves
```math
 X_{G^{\mathrm{cl}}}(x;q)
 =\mathop{\mathrm{tr}}F_{G^r}(q)(x_1,\dots,x_N)
```
and in particular symmetry in $`x_1,\dots,x_N`$. The closure of $`G^r`$ is isomorphic as a directed multigraph to the edge reversal of the closure of $`G`$. Reversing the order of the colors, then using the just-proved symmetry, shows that these two closures have the same polynomial (the loop case is zero). Apply the last trace identity to $`G^r`$ to obtain
```math
 X_{G^{\mathrm{cl}}}(x;q)=\mathop{\mathrm{tr}} F_G(q)(x_1,\dots,x_N).
```
Since this holds in every sufficiently large finite specialization, it holds for the full functions. Equivalently, both sides are stable symmetric functions homogeneous in the $`x`$'s of degree $`n-1`$ and specialization to $`N\ge n-1`$ is faithful in this degree.

## Prior context

- Tom–Vailaya Theorem 60 proved the $`q=1`$ trace; Conjecture 74 asks for the full weighted identity with arc multiplicities retained; their paper reports computational checks for all NUIGs on up to eight vertices.
- The matrix-comparison argument of Tom–Vailaya §4 tests open graphs using paths and complete graphs. This proof adapts that strategy to a weighted color basis, with an elementary finite Vandermonde check and an exact no-return rule for indices $`>N`$.
- Vailaya, [*Proper circular arc graphs are e-positive*](https://arxiv.org/abs/2609.33124v3), gives a more general multiple-endpoint color/tableau theory at $`q=1`$, and leaves general $`q`$-positivity open. This weighted single-endpoint trace identity does not prove positivity or furnish a multiple-endpoint generalization.
