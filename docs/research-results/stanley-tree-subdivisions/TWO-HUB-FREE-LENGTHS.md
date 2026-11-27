# Independent lengths at two hubs with recognizable cap shapes

Fix two branch vertices joined by a bare path. At each hub there are at least two exterior arms. Use the notation and terminal-block recognition of the [general two-hub proof](TWO-HUB-SUBDIVISIONS.md). The following condition is entirely on the fixed rooted ends. It gives no relation between the exterior lengths or between those lengths and the central distance.

**Theorem.** For each unary-stripped exterior cap, let $`\ell_i`$ be its number of leaves as a rooted tree, let $`d=\min(p,q)`$ for the two numbers of exterior arms, and assume the following.

- Any two caps with the same number of leaves are isomorphic as rooted trees.
- The largest $`\ell_i`$ is strictly smaller than the sum of the $`d`$ smallest leaf counts, with repetitions.

If every exterior arm has order at least $`K=\max(3,L+1,rL)`$, where $`r=p+q`$ and $`L`$ is the largest cap order minus one, the ordinary chromatic symmetric function determines the tree among all trees. The central path can have any positive length; all exterior edges may be subdivided independently without upper bounds. This includes arbitrary repetitions of any single nontrivial rooted cap. Unit caps are permitted alongside larger caps when the leaf-count condition holds. It also allows, for example, three different arbitrary cap shapes with three, four and five leaves, provided each leaf count is represented by just one shape. When all caps are single vertices the unrestricted result is already Wang, Yu and Zhang's theorem on trees with exactly two branch vertices. [Primary source](https://arxiv.org/html/2308.03980v3)

## The high boundary coefficients

By two-scale terminal recognition every competing tree has the same two-hub structure, cap multiset and exterior hub degrees. We recover all unary extension lengths without knowing the length $`h`$ of the central path. Let $`C_i`$ denote the cap on each arm, $`u_i`$ the number of added unary roots, $`N=n-\sum_i |C_i|=h+1+\sum_i u_i`$ and $`e=\sum_i\ell_i`$. Calculations in this section are polynomials in $`y`$ over the rational function field in $`x`$. Put
```math
 Y=\frac{y}{1-x},\qquad Z_C=F_C-Y.
```
The attachment factor for a cap extended by $`u`$ unary roots is $`Y+x^u Z_C`$. The degree of $`F_C`$ in $`y`$ is the number of rooted leaves: it is one for a leaf and follows from $`F_C=y+x\prod F_{C'}`$ by induction. Positive coefficients prevent cancellation. For a nontrivial stripped cap $`\ell_C\ge2`$, so $`Z_C`$ has the same degree and the same nonzero leading coefficient $`f_C(x)`$. [Attached rooted polynomial](https://www.davideisenstat.com/cv/EisenstatGR08.pdf)

Let $`C_T(x,y)`$ count connected subsets by vertex count and boundary size. The contribution containing both hubs is
```math
 x^N\prod_i(Z_{C_i}+Yx^{-u_i}).
```
In its expansion, choosing the $`Yx^{-u_i}`$ term at arm $`i`$ lowers the highest possible degree in $`y`$ by $`\ell_i-1`$. Denote this choice by omitting that arm's $`Z`$ term. Subsets meeting one hub have boundary degree at most one plus the sum of the leaf counts on that side, by the one-hub portion of the [allocation formula](TWO-HUB-SUBDIVISIONS.md). This is at most $`1+e-s`$, where $`s`$ is the sum of the $`d`$ smallest leaf counts. Subsets missing both hubs have boundary degree at most $`1+\max_i\ell_i`$. For one inside a single arm, at most one boundary edge points towards its attachment, and every downward boundary edge leads to a disjoint nonempty set of that arm's rooted leaves. An interval strictly inside the central path has two boundary edges. Since each hub has at least two exterior arms, the one-hub bound also dominates this last bound: the side containing the largest cap has at least its leaf count, while the opposite side has at least $`s`$ leaves.

First recover all extension lengths of the one-vertex caps, if present. The coefficient of $`y^e`$ comes only from the two-hub term. Each nonunit cap contributes its known leading coefficient. For a unit cap $`F_*=x+y`$, so its factor $`Z_*+Yx^{-u}`$ has leading coefficient $`(x^{-u}-x)/(1-x)`$. Dividing out the known factors and powers reveals
```math
 x^{-\sum u}\prod_{i\;\mathrm{unit}}(1-x^{u_i+1}).
```
Here the sum is over the unit arms. The lowest Laurent power determines the sum of their lengths. In the ordinary product that remains, the first nonconstant coefficient gives minus the multiplicity of the smallest exponent $`u_i+1`$. Divide by those factors and repeat to recover every unit extension.

Now process the nonunit classes in increasing order of leaf count. For each cap already processed, the multiset of its $`u_i`$ is known. Subtract from $`C_T`$ the explicit expression
```math
 x^N\prod_{i\;\mathrm{processed}}(Z_{C_i}+Yx^{-u_i})
       \prod_{i\;\mathrm{unprocessed}} Z_{C_i}.
```
This removes exactly those terms of the two-hub contribution which omit only processed arms, without allocating any arms to hubs. Suppose $`\ell`$ is the smallest unprocessed leaf count, with unique rooted cap shape $`C`$. The layer of $`y`$-degree $`e-\ell+1`$ of the difference receives no contribution from subsets missing one or both hubs since $`\ell\lt s`$. Keep the previously recovered unit factors intact. Among the nonunit factors, this layer can only come from omitting one arm of the new class and no others. Another omission of any nonunit lowers the degree further. The unit factors stay intact and contribute their known leading coefficients. Its coefficient is therefore
```math
 \frac{x^N}{1-x}\frac{\prod_{i\;\mathrm{nonunit}} f_{C_i}(x)}{f_C(x)}\prod_{i\;\mathrm{unit}}\frac{x^{-u_i}-x}{1-x}
       \sum_{i:C_i=C}x^{-u_i}.
```
Division by the known nonzero prefactor recovers the complete Laurent polynomial in the last sum. Its coefficients give every extension length within this cap class, including multiplicities. Iteration determines all decorated arm orders. Then $`h=N-1-\sum_i u_i`$ and the quadratic allocation identity gives the two exterior arm groups. This proves the unrestricted length assertion with its stated conditions on cap shapes.

The proof uses only the common ambient cap multiset through the terminal recognition and high boundary ranks. Branching within a cap, relative arm lengths, equality of lengths and central length one are all allowed. [Review and verification](TWO-HUB-SUBDIVISIONS-REVIEW.md) · [Exact boundary-layer check](verify_two_hub_free_lengths.py)
