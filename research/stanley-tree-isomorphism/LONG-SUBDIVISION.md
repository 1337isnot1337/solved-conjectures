# Recognizing a tree after a long subdivision of any chosen edge

Let $`S`$ be any finite tree with a chosen edge. Deleting that edge gives components of orders $`c,d`$, rooted at the old endpoints. Replace the edge by a path, and let $`n`$ be the resulting number of vertices. If

```math
n\ge 4\max(c,d)-3,
```

then the ordinary chromatic symmetric function distinguishes the resulting tree among all finite trees. The endpoint trees may have different orders, shapes, and arbitrary branching. The chosen edge and its endpoints are not part of the input to reconstruction. In particular, every edge of every tree can be subdivided sufficiently many times to obtain a tree determined by its chromatic symmetric function. The conclusion concerns the subdivided tree; Stanley's question for the original tree remains open. [Stanley's question, §2](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf) · [Research issue 315](https://github.com/1337isnot1337/solved-conjectures/issues/315)

## A polynomial unchanged by adding unary roots

Give $`x_i`$ weight $`i`$, write $`\tau_j`$ for truncation through weight $`j`$, and put $`X=\sum_{i\ge1}x_i`$ in the weighted formal power series ring. For a rooted tree $`D`$ of order $`b`$, let $`P_D`$ record each spanning subforest by the sizes of the components other than the root component. Let $`U_D`$ record all component sizes and $`Q_D=P_D+U_D`$. All three have integer coefficients, $`P_D`$ has constant one, and $`U_D`$ is homogeneous of weight $`b`$. The ordinary CSF and $`U_D`$ of the underlying tree determine each other by Stanley's signed power-sum expansion. The root-branch recurrence $`P_D=\prod_E Q_E`$ follows by retaining or cutting the edge to each child $`E`$. The full $`Q_D`$ determines the rooted tree: its part below weight $`b`$ is $`P_D`$, and each child factor is monic and linear in its variable $`x_{|E|}`$, absent from the rest of that factor. Unique factorization recovers the child factors with multiplicity; induction recovers their rooted shapes. [Rooted forest polynomials and attachment identities](https://arxiv.org/abs/2002.08186) · [Centroid reconstruction](https://github.com/1337isnot1337/solved-conjectures/blob/ab20f88a53a401c50391a59cc622cd9b2882e8ef/research/stanley-tree-isomorphism/CENTROID.md)

Define

```math
G_D=\tau_b\bigl((1-X)Q_D\bigr).
```

Restoring the omitted root component in each forest gives $`U_D=[XP_D]_{[b]}`$, where the brackets retain terms of weight $`b`$. Consequently the weight-$`b`$ part of $`(1-X)Q_D`$ vanishes and $`\deg_w G_D\le b-1`$. If $`D'`$ adds a new root with the old root as its only child, $`P_{D'}=Q_D`$. Discarding its vanishing top part gives $`G_{D'}=\tau_b((1-X)Q_D)=G_D`$.

Strip all consecutive unary roots. If a single vertex remains, $`G_D=1`$. Otherwise the remaining tree has order $`r\ge3`$ and at least two children at its root. Its $`P`$ has no $`x_{r-1}`$ term: an off-root connected component of size $`r-1`$ would leave the root isolated, forcing that root to have only one child. The monomial $`x_{r-1}`$ in $`G`$ therefore has coefficient $`-1`$. Weight bounds exclude any other term involving this variable, so

```math
G_D=-x_{r-1}+R(x_1,\ldots,x_{r-2}),\qquad R(0)=1.
```

This is irreducible over the rationals. For every nonunit $`G_D`$, its largest variable index equals its weighted degree $`r-1`$. Finally, given its original order $`b`$, one recovers the full branch factor by $`Q_D=\tau_b(G_D/(1-X))`$. Thus unary roots cost no degree in $`G_D`$ and cause no ambiguity when reconstructing an arm of specified order.

## Recovering two factors at a finite cutoff

Suppose two rooted arms $`A,B`$ of order $`p`$ supply $`\tau_p(Q_AQ_B)`$. Multiplying by $`(1-X)^2`$ and truncating gives exactly $`\tau_p(G_A G_B)`$. Let $`L`$ be its largest variable index, with $`L=0`$ for a constant. In any possible pair, each nonunit factor has its greatest variable with coefficient $`-1`$ and has constant coefficient one. The highest index among the two factors is at most $`p-1`$. Its singleton coefficient in the product is therefore minus the number of factors with that highest index and survives truncation. Hence every competing pair with the same truncation has the same $`L`$, and both its factors have weighted degree at most $`L`$.

If $`p\ge2L`$, that truncation gives the full product. Unique factorization recovers all nonunit factors, normalized by their constant coefficient. Since there are exactly two arms, any missing factors are units. Applying the preceding recovery formula at order $`p`$ identifies both arms, up to interchange. The test $`p\ge2L`$ uses only the observed truncation; a bound on the complexity of the competitor's arms is unnecessary.

## Odd and even order

Set $`g=\max(c,d)`$. First let $`n=2h+1`$. The hypothesis implies $`h\ge g`$ and $`h\ge2(g-1)`$: these follow from $`h\ge2g-2`$ for $`g\ge2`$, and for $`g=1`$ every odd relevant order has $`h\ge1`$. The connector has a vertex with exactly $`h`$ sites on either side. Indeed, starting at the endpoint with the $`c`$-vertex component, put $`h-c`$ path vertices on its side, and analogously put $`h-d`$ on the other side. There is exactly one remaining interior vertex for the hub. This is the unique centroid. Each of its two rooted arms has order $`h`$ and is one original endpoint tree with a possibly empty unary stem. Their $`G`$ factors therefore have degree at most $`g-1`$.

Every odd tree of order $`2h+1`$ has a unique centroid, and all its centroid branches have order at most $`h`$. A component of a spanning forest of size $`>h`$ must contain the centroid. In every monomial of $`U`$ with such a part, delete its unique variable of index $`>h`$, keeping multiplicities. This recovers exactly the product of centroid branch factors through weight $`h`$. The singleton coefficient of $`x_h`$ is two for the target. In any competitor this counts order-$`h`$ branches: smaller branches contain no such variable, and an order-$`h`$ branch supplies it once. These two branches exhaust all $`2h`$ off-centroid vertices. We therefore have the two-arm input at $`p=h\ge2(g-1)\ge2L`$ and recover the entire tree.

Now let $`n=2h`$. For $`g\ge2`$, the integer bound gives $`h\ge2g-1`$, hence $`p=h-1\ge g`$ and $`p\ge2(g-1)`$. The connector has a central edge cutting the tree into two halves of size $`h`$. Both endpoints of this central edge lie strictly inside the connector: on either side one can put the respective core, $`p-c`$ or $`p-d`$ unary vertices, and then the endpoint of the central edge. Each endpoint has precisely one child in its half, an order-$`p`$ arm. The case $`g=1`$ is also covered for even $`n\ge4`$, where $`p\ge1`$. The tree of order two is unique.

An edge splitting a tree into equal halves, if present, is unique. It is detected by the coefficient of $`x_h^2`$ in $`U`$: the corresponding forest has two components and thus deletes exactly one edge. Every competitor has the same equal split. A spanning-forest component of size $`>h`$ contains both central vertices and their edge. Keeping that edge joins the two root components in the forests on the two halves. Deleting the unique component variable $`>h`$ therefore gives exactly $`\tau_{h-1}(P_{H_1}P_{H_2})`$, where $`H_i`$ are the halves rooted at the edge. To have residual weight at most $`h-1`$, the joined component indeed has size at least $`h+1`$. Each $`P_{H_i}`$ is the product of the child factors at its endpoint. At cutoff $`p=h-1`$, the singleton coefficient of $`x_p`$ is two. There are $`p`$ available child vertices in each half, so each endpoint has exactly one order-$`p`$ child in every competitor. We recover $`\tau_p(Q_AQ_B)`$ and again have $`p\ge2L`$. Reattaching these two recovered arms to the endpoints of an edge determines the entire tree. This covers both parities and includes paths.

For example, given end trees of orders 5 and 8, the guaranteed orders start at 29. An odd order-29 example has $`p=14`$, with respectively 9 and 6 unary vertices on the arms. An even order-30 example has the same two order-14 arms and a central edge. At either parity the cutoff 14 recovers a product of weighted degree at most 14, regardless of the rooted shapes of the two end trees. These are sufficient thresholds; no assertion of optimality is needed.

## Relationship to prior work

Qi, Tang and Wang define the identical construction for arbitrary rooted end graphs as a path-conjoined graph. Their §3 gives CSF expansions with a clique or cycle end and studies positivity for specified families. Aliste-Prieto, de Mier and Zamora prove the rooted product identities and complete rooted reconstruction. Orellana and Scott reconstruct trees under edge-labelled cut data, while the centroid truncations used here were already recorded in this campaign. Wang, Yu and Zhang cover trees with two vertices of degree at least three, and Crew reconstructs trunk order and pendant twig lengths. Arbitrary endpoint trees here may have arbitrarily many branching vertices and the long internal connector need not be a pendant twig. The bounded search on path-conjoined, edge-subdivided and homeomorphic trees, long internal paths and recently published reconstruction theorems located no previous all-competitor recognition result for arbitrary ends at sufficiently long connector length. [Qi–Tang–Wang, §3](https://arxiv.org/html/2406.01418v3#S3) · [Rooted recurrence](https://arxiv.org/abs/2002.08186) · [Edge-labelled cuts](https://arxiv.org/abs/1308.6005) · [Wang–Yu–Zhang](https://arxiv.org/abs/2308.03980) · [Crew](https://arxiv.org/abs/2106.04417) · [Prior centroid-edge extraction](https://github.com/1337isnot1337/solved-conjectures/blob/ab20f88a53a401c50391a59cc622cd9b2882e8ef/research/stanley-tree-isomorphism/CENTROID-EDGE.md)

[Independent review](LONG-SUBDIVISION-REVIEW.md) · [Exact checker](verify_long_subdivision.py)
