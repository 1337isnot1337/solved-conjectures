# Recovering unequal core shapes across a balanced tree edge

Let a tree have an edge whose two sides have orders $`a,b`$ differing by at most one, with $`a\le b`$. Root each side at its endpoint and strip initial vertices having just one child until reaching a vertex with zero or at least two children. Let the two remaining orders, minus one, be $`L,l`$, in descending order. A path rooted at one end gives zero. The ordinary chromatic symmetric function identifies the whole tree among all trees if

```math
2L+l\le n,\qquad n=a+b.
```

This permits arbitrary degrees at the two endpoints of the balanced edge. The ordinary chromatic symmetric function alone supplies the inputs to this reconstruction.

Consequently, delete an arbitrary edge of an arbitrary tree to obtain components of orders $`c,d`$, put $`g=\max(c,d)`$ and $`h=\min(c,d)`$, and replace the edge by a path. Write $`n`$ for the enlarged order. The resulting tree is determined among all trees if

```math
n\ge \max(2g-1,2g+h-3).
```

In particular equal end orders $`g\ge2`$ require at most $`3g-3`$ final vertices, compared with the earlier sufficient threshold $`4g-3`$. For ends of orders 5 and 8 the improved sufficient order is 18. The sign determined by the number of forest components converts Stanley's ordinary chromatic symmetric function to the unrooted spanning-forest polynomial $`U_T`$. The full tree-isomorphism problem remains open. [Stanley, §2](https://math.mit.edu/~rstan/pubs/pubfiles/100.pdf) · [Prior long-subdivision theorem](LONG-SUBDIVISION.md)

## Normalizing the end trees

Each variable $`x_i`$ has weight $`i`$. Write $`X=\sum_{i\ge1}x_i`$ and $`H=1/(1-X)`$ in the weight-completed ring. Let $`H_j`$ be the homogeneous part of weight $`j`$ and $`\tau_t`$ the truncation through $`t`$. Then $`H_0=1`$, and $`H_j`$ records the spanning forests of a path of order $`j`$: the ordered component sizes run once through all compositions of $`j`$. In particular $`y_j=H_j=x_j+\text{a polynomial in }x_1,\ldots,x_{j-1}`$. The $`y_j`$ form alternative independent homogeneous generators and the change of variables preserves the largest generator index. For the rooted path of order $`s`$ with its root at one end, the polynomial recording the forest components other than the root component is $`\tau_{s-1}H`$. Its sum with the ordinary forest polynomial is $`\tau_s H`$.

For an arbitrary rooted tree $`A`$ of order $`s`$, define $`P_A`$ by omitting the root component of each spanning-subforest monomial, $`Q_A=P_A+U_A`$, and $`G_A=\tau_s((1-X)Q_A)`$. Restoring the root component gives $`U_A=[X P_A]_s`$, so $`G_A`$ has degree at most $`s-1`$ and $`Q_A=\tau_s(HG_A)`$. Adding a unary root does not change $`G_A`$ by the rooted product identity. After stripping all such roots, a single vertex gives $`G_A=1`$. A nonunary root with core order $`r\ge3`$ has no fringe subtree of order $`r-1`$, and therefore

```math
G_A=-x_{r-1}+R(x_1,\ldots,x_{r-2})=-y_{r-1}+S(y_1,\ldots,y_{r-2}).
```

Its largest index and weighted degree both equal $`r-1`$, its constant term is one, and it is irreducible. Given $`G_A`$, the rooted core order is thus known (one for the unit), and its $`Q`$ is recovered by truncating $`HG_A`$ at that order. Rooted factorization recursively identifies the core: the portion below the top degree of $`Q`$ is the product of the child factors $`Q_E`$, each monic linear in its highest variable. [Preceding normalized factors](LONG-SUBDIVISION.md) · [Rooted forest-polynomial identities](https://arxiv.org/abs/2002.08186)

## The path generating series at an arbitrary cut

For any edge at all, root its two halves $`A,B`$ of orders $`a,b`$ at the ends of that edge. There is an exact identity

```math
U_T=[H G_A G_B]_{a+b}.
```

To see this, write $`g_i=[G_A]_i`$, so $`Q_A=\sum_i g_i\tau_{a-i}H`$. Accordingly $`P_A=\sum_i g_i\tau_{a-i-1}H`$ and $`U_A=\sum_i g_iH_{a-i}`$, and the same holds for $`B`$. The cut case contributes $`U_AU_B`$. The retained-edge case joins the two root components, so a monomial of weight $`w`$ in $`P_A P_B`$ receives the extra factor $`x_{a+b-w}`$. For the product $`g_i g'_j`$, the sum of the two contributions is precisely the ordinary polynomial of two end-rooted paths of orders $`a-i,b-j`$ joined by an edge, hence of a path on $`a+b-i-j`$ vertices. These two orders are positive by the degree bound. This proves the identity. A preexisting study of the same path-conjoined construction gives expansions for prescribed classes of end graphs. The recognition argument here uses the normalized factors for arbitrary rooted trees. [Qi, Tang and Wang, §3](https://arxiv.org/html/2406.01418v3#S3)

Suppose for now that every end factor in every competitor has no variable of index greater than a known $`M`$. Put $`F=G_A G_B`$. Rewriting in the $`y`$ generators gives $`U_T=\sum_k y_{n-k}F_k`$, where $`F_k=[F]_k`$. Recover $`F_k`$ successively for $`0\le k<n-M`$. Subtract the previously recovered terms. The coefficient of the first power of $`y_{n-k}`$ in the residual is exactly $`F_k`$. The coefficients in each $`F_j`$ contain no such variable since $`n-k>M`$, and all remaining restoring variables have smaller index. Thus $`\tau_{n-M-1}F`$ is recoverable in both the $`y`$ and the $`x`$ representation.

The coefficient of $`x_a x_b`$ in the ordinary polynomial counts edges with the specified split, including the case $`a=b`$. Choose any such edge in a competitor. Take $`M=b-1`$; the first extraction recovers $`\tau_a F`$. Because $`a\ge b-1`$, every possible variable index is already visible. Specifically the highest singleton coefficient of a nonconstant $`F`$ equals minus the number of factors of that highest index (one or two), so it cannot cancel. If there are no positive-index variables, both factors are units and the tree is a path. Otherwise the common detected maximum is $`L`$. Repeating the extraction at $`M=L`$ gives $`F`$ through degree $`D=n-L-1`$.

## A fringe count detects the complete smaller factor

If both factors reach degree $`L`$, the hypothesis gives $`n\ge3L`$. For $`n>3L`$, the cutoff $`D=n-L-1`$ already includes the whole degree-$`2L`$ product. For $`n=3L`$, only the homogeneous layer at $`2L`$ is missing. The residual after subtracting all recovered terms equals $`y_LF_{2L}`$. Dividing by $`y_L`$ restores that layer exactly. This applies to every competitor since both of its factors also have degree $`L`$.

Suppose exactly one factor reaches $`L`$, and write it in the path generators as $`-y_L+S`$. Its partner $`G_B`$ has no $`y_L`$. The negative of the coefficient of the first power of $`y_L`$ in the recovered truncation gives $`G_B`$ through degree $`n-2L-1`$. One more homogeneous layer is visible even when the product has further unknown terms. The coefficient of $`y_L^2`$ in $`U_T`$ equals $`-[G_B]_{n-2L}`$. Indeed the product $`F`$ is at most linear in $`y_L`$, so this second copy must be the restoring variable in $`y_LF_{n-L}`$. The coefficient operation here treats all the other $`y_j`$ as independent. Thus $`\tau_m G_B`$ is visible for $`m=n-2L`$. This cutoff is at least one since $`L\le b-1`$ and $`b-a\le1`$.

Convert the smaller truncated factor back to the $`x`$ variables. Here is an intrinsic stopping test for a rooted tree $`E`$ of order $`s`$. From $`\tau_m G_E`$ one knows, for $`1\le i\le m`$, the coefficients of singletons $`x_i`$ in $`HG_E`$. Through weight $`s`$ these count the vertices whose descendant fringe has size $`i`$, including the root when $`i=s`$. For $`i>s`$ each such singleton coefficient is one, since $`G_E`$ has no terms of those weights and has constant one. If $`E`$ has normalized degree $`d_E`$, the number obtained by summing these singleton coefficients through $`m`$ is exactly $`m`$ whenever $`m\ge d_E`$. All vertices except possible unary ancestors belong to the stripped core of order $`d_E+1`$, and beyond that core there is one successive fringe of each size up to $`s`$. At $`m=d_E`$ exactly the $`d_E`$ proper core vertices are counted. For the unit factor the tree is a path and the equality holds at every cutoff.

Conversely, if this sum is $`m\ge1`$, then $`d_E\le m`$. This is automatic if $`s\le m`$. Otherwise choose a vertex minimal under descent among those with fringe size greater than $`m`$. Its proper descendants all have fringe size at most $`m`$, and there are at least $`m`$ of them. The sum hypothesis forces exactly $`m`$ such descendants and exhausts all the small-fringe vertices. Every other vertex is necessarily an ancestor of the selected vertex: another branch would contain a leaf outside that fringe. Thus all additional ancestors are unary and the core order is at most $`m+1`$.

Since the target has $`m\ge l`$, the observed stopping equality transfers to every competitor. The smaller factor has degree at most $`m`$ and is now known in full. Formal division by this factor with constant term one recovers the larger through degree $`D`$. This reconstructs the entire larger factor since $`D\ge L`$ by the same near-balance inequality. In the equal-degree case unique factorization of the full product instead recovers the factors up to interchange and normalization by constant one. Both cases determine the two stripped rooted cores. If both assignments to the two half-orders are possible, they give the same unlabelled tree: all added unary vertices belong to the same connecting path between the two core roots, and their total number is fixed by $`n`$ and the core orders.

For the subdivision consequence, when $`n\ge2g-1`$ and $`n`$ is at least the original order $`g+h`$, the connector has an edge separating orders $`\lfloor n/2\rfloor`$ and $`\lceil n/2\rceil`$. Place the larger original core on the larger side if the parity requires it and distribute the new path vertices to fill the specified orders. Unary extension leaves the normalized factors unchanged, so $`L\le g-1`$ and $`l\le h-1`$. The other displayed bound gives $`n\ge 2L+l`$ as required. The argument includes the path on two vertices separately by its unique order. Neither numerical bound is asserted to be sharp.

## Source and scope

This is a further partial result for Stanley's original question based on the unmarked ordinary CSF. The arbitrary-edge path identity is a consequence of earlier rooted product recurrences; the new inverse uses the path generator as an independent variable and recovers the unseen smaller factor by an exact count of descendant fringe sizes. The earlier published long-edge result uses the sufficient cutoff twice the largest normalized degree in the centroid truncation. The bounded comparison included work on rooted variants, path bases and general path-conjoined constructions. No previously established theorem giving this balanced-edge recognition from the ordinary CSF was located. [Rooted CSF](https://arxiv.org/abs/2206.05392) · [Qi, Tang and Wang](https://arxiv.org/abs/2406.01418) · [Path-basis specialization](https://doi.org/10.1002/jgt.23060) · [Campaign](https://github.com/1337isnot1337/solved-conjectures/issues/315)

[Independent mathematical review](BALANCED-ARMS-REVIEW.md) · [Exact checker](verify_balanced_paths.py)
