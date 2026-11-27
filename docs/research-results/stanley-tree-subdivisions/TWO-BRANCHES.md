# Recognizing trees with two copies of a rooted branch

Let a new vertex join the roots of two disjoint copies of a rooted tree $`A`$ of order $`b`$. The resulting tree has $`2b+1`$ vertices. Each of the following conditions suffices for its ordinary chromatic symmetric function to distinguish it among all trees.

* For every $`1\le L\le b-2`$ of the same parity as $`b`$, at least one of $`L,L+1`$ is absent among the orders of the proper fringe subtrees of $`A`$. The fringe subtree at a vertex consists of that vertex and all its descendants. This condition includes every rooted tree in which each vertex has an even number of children, including arbitrary full binary trees.
* The combined multiset of branches at the roots of two copies of $`A`$ can be recovered from their product of branch factors through weight $`b-1`$, among all possible pairs of order-$`b`$ rooted trees. Explicit sufficient cutoffs appear below. For example, the root of $`A`$ may have two or more copies of any one rooted tree as its children. This second criterion also extends along a unary stem of arbitrary length.

The first result uses coefficient parity in the unrooted polynomial. The second uses positivity of a moment integral to recover the attachment once the combined branches one level below the hub are known. Their hypotheses allow unbounded order and diameter. Stanley's general tree-isomorphism question remains open. [Stanley, §2](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf) · [Centroid campaign](https://github.com/1337isnot1337/solved-conjectures/issues/315#issuecomment-7208148563)

## The information seen at the hub

Use the [rooted forest polynomials](https://github.com/1337isnot1337/solved-conjectures/blob/ab20f88a53a401c50391a59cc622cd9b2882e8ef/research/stanley-tree-isomorphism/CENTROID.md). For a rooted tree $`D`$, the coefficient of a monomial in $`P_D`$ counts spanning subforests by the orders of their components after the root component is omitted. In $`U_D`$ that component is included. Set $`Q_D=P_D+U_D`$. For $`|D|=b`$, the part of $`Q_D`$ of weight below $`b`$ is $`P_D`$, and its part of weight $`b`$ is $`U_D`$. Its constant coefficient is one. Write $`f_{[j]}`$ for the weight-$`j`$ homogeneous component and $`\tau_s f`$ for truncation through weight $`s`$. Put $`x_0=1`$ and, for $`j\ge0`$, define

```math
\Phi_j(f)=\sum_{w=0}^j x_{j-w}f_{[w]}.
```

Restoring the root component gives $`\Phi_b(P_D)=U_D`$. Rooting the original tree at its hub gives the product $`Q_A^2`$. The connected-component counts in Stanley's power-sum formula determine the unrooted forest polynomial.

The hub is the unique centroid. Any tree with the same chromatic symmetric function has the same odd order, so it too has a unique centroid. A component larger than $`b`$ in a spanning forest must contain that centroid. Deleting its component variable from each such term of the unrooted polynomial gives the product of the competitor's branch factors through weight $`b`$. The largest variable index in this truncation is $`b`$, and the coefficient of $`x_b`$ is two. The two branches of size $`b`$ exhaust the $`2b`$ vertices off the centroid. Call them $`B`$ and $`C`$. We obtain

```math
\tau_b(Q_BQ_C)=\tau_b(Q_A^2),
\qquad \Phi_{2b+1}(Q_BQ_C)=\Phi_{2b+1}(Q_A^2).
```

For $`1\le j\lt b`$, the coefficient $`[x_j]Q_D`$ counts proper fringe subtrees of size $`j`$. A single omitted-root monomial with one component variable cuts exactly the edge above that fringe. The coefficient $`[x_b]Q_D`$ is one. The truncated equality over the integers therefore gives $`[x_j](Q_B+Q_C)=2[x_j]Q_A`$ for every $`1\le j\le b`$.

## A parity obstruction to unequal branches

Work over the field with two elements in this section. Let $`K=Q_A/Q_B`$ in the weighted formal series ring. The constant coefficient is one. Frobenius and the truncated equality give

```math
Q_C=\tau_b(Q_BK^2)
   =\sum_{j=0}^{\lfloor b/2\rfloor} K_{[j]}^2\,\tau_{b-2j} Q_B .
```

If all $`K_{[j]}`$ with $`1\le j\le\lfloor b/2\rfloor`$ vanish, then $`Q_B=Q_C`$ over this field. The polynomials distinguish rooted trees even in characteristic two. In fact, $`P_D`$ is the product of the child factors $`Q_E`$, each monic and linear in the variable of largest index $`x_{|E|}`$ with the remaining terms independent of that variable. Unique factorization recovers the factors with their multiplicities in every characteristic, and induction on order recovers the rooted tree. Thus $`B\cong C`$. Over the rationals the two truncated squares have equal constant-one square roots through weight $`b`$, which recovers the entire $`Q_A=Q_B`$ and gives $`A\cong B`$. [Rooted factorization](https://github.com/1337isnot1337/solved-conjectures/blob/ab20f88a53a401c50391a59cc622cd9b2882e8ef/research/stanley-tree-isomorphism/CENTROID.md) · [Aliste-Prieto, de Mier and Zamora](https://arxiv.org/abs/2002.08186)

Otherwise let $`h`$ be the first such nonzero index and put $`m=2h`$, $`L=b-m`$. For every true branch $`D`$, we have $`\Phi_b(Q_D)=U_D+U_D=0`$ over this field. Apply this identity to $`Q_C`$ and subtract the identity for $`Q_B`$. Moving the homogeneous square factors through $`\Phi_b`$ gives

```math
0=\sum_{j=h}^{\lfloor b/2\rfloor} K_{[j]}^2\,\Phi_{b-2j}(Q_B).
```

If $`L=0`$, the only summand is $`K_{[h]}^2`$, a contradiction. For $`L>0`$, differentiate in $`x_L`$. All squares have zero derivative, every term with $`j>h`$ has remaining variables of index below $`L`$, and $`\partial_{x_L}\Phi_L(Q_B)=1+[x_L]Q_B`$. Consequently $`[x_L]Q_B=1`$ in this field.

Write $`H=Q_C+Q_B`$. Its lowest weight is $`m`$, with $`H_{[m]}=K_{[h]}^2\ne0`$. Also $`\partial_{x_r}H=0`$ for $`r>L`$, since the expression for $`H`$ uses squares multiplied by truncations of $`Q_B`$ through weight at most $`L`$. By the full unrooted equality,

```math
\Phi_{2b+1}(Q_B H)=\Phi_{2b+1}(Q_A^2+Q_B^2).
```

Every monomial on the right is one variable times a square, so its mixed derivatives in distinct variables vanish. Choose $`r=b`$ and $`s=L+1`$. They are distinct, both exceed $`L`$, and $`r+s>b`$. On the left, $`\partial_{x_r}\partial_{x_s}(Q_B H)=0`$ since $`Q_B`$ has weight degree $`b`$. Differentiating the restoring variable in $`\Phi_{2b+1}`$ once leaves the two contributions $`(\partial_{x_s}(Q_B H))_{[m]}`$ and $`(\partial_{x_r}(Q_B H))_{[m]}`$, because $`2b+1-r-s=m`$. Their sum equals

```math
\bigl([x_b]Q_B+[x_{L+1}]Q_B\bigr)K_{[h]}^2=0 .
```

We have $`[x_b]Q_B=1`$, hence $`[x_{L+1}]Q_B=1`$ as well. The integer counts of fringes of sizes $`L`$ and $`L+1`$ in $`B`$ must both be positive. The exact singleton coefficient identity then forces both sizes to occur in $`A`$. This contradicts the first hypothesis. For a rooted tree with only even child counts, every fringe has odd order by induction, so the hypothesis applies.

## Recovering the branches one level below the hub

We now work over the rationals. At weights below $`b`$, the truncated equality says that $`P_BP_C`$ and $`P_A^2`$ agree through weight $`b-1`$. These are the combined products of the child factors at the two branch roots. If recovery at this cutoff gives the same combined multiset, then $`P_BP_C=P_A^2`$ exactly. Comparing at weight $`b`$ in the original truncated equality now yields $`U_B+U_C=2U_A`$. Indeed $`U_D`$ has weight $`b`$, and $`P_D`$ has constant one.

For positive real $`t`$, set $`p_D(t)=\sum_{j=0}^{b-1}(P_D)_{[j]}(x)\,t^{b-j}`$. Homogenizing the product identity gives $`p_B(t)p_C(t)=p_A(t)^2`$. Choose a positive measure with positive masses at $`b`$ distinct positive numbers, and take the variables $`x_i`$ to be its moments $`\int t^i\,d\mu(t)`$. Then $`U_D(x)=\int p_D(t)\,d\mu(t)`$. All three polynomials are positive at every atom. The arithmetic-geometric mean inequality gives $`p_B(t)+p_C(t)\ge2p_A(t)`$ there, with equality only if $`p_B(t)=p_C(t)`$. The integrals are equal, so $`p_B-p_C`$ vanishes at all $`b`$ atoms. Its leading term cancels; it has degree at most $`b-1`$ and vanishes identically. With the support fixed and the positive masses varying, the first $`b-1`$ moments range over an open subset of $`\mathbb R^{b-1}`$ by the Vandermonde rank. Hence the polynomial identity $`P_B=P_C`$ holds in the indeterminates $`x_i`$, and $`P_BP_C=P_A^2`$ implies $`P_B=P_C=P_A`$. Rooted factorization gives $`B\cong C\cong A`$.

For an explicit sufficient condition at a child order $`g`$, let $`m_g`$ be the number of children of that order in *two* copies of $`A`$, let $`s_g`$ count their distinct rooted shapes, and let $`r_g`$ count all rooted shapes of order $`g`$. The [factor extractions](https://github.com/1337isnot1337/solved-conjectures/blob/ab20f88a53a401c50391a59cc622cd9b2882e8ef/research/stanley-tree-isomorphism/CENTROID.md) and [moment criterion](https://github.com/1337isnot1337/solved-conjectures/blob/ab20f88a53a401c50391a59cc622cd9b2882e8ef/research/stanley-tree-isomorphism/CENTROID-EDGE.md) recover the combined multiset when, at every occurring order,

```math
b-1\ge g\min(2m_g,r_g,4s_g).
```

All competing child orders are at most $`b-1`$. If instead $`A`$ has $`j\ge2`$ children all of one rooted shape of order $`g`$, the coefficient of $`x_g`$ gives $`2j`$ children of that maximum size in the combined forest; these exhaust its total order. The cutoff $`b-1=jg\ge2g`$ suffices by the [two-moment proof for equal factors](REPEATED-BRANCHES.md), whose formal comparison at weight $`2g`$ applies to the $`2j`$ factors.

The second criterion used only the truncation through weight $`b`$. Add a new root with just one child $`A`$, forming a branch of order $`b+1`$. The combined child product in any competitor is known through weight $`b`$. Its largest child size $`b`$ has multiplicity two, so each competitor has exactly one such child. Their child factors satisfy the original equation through weight $`b`$ and therefore recover $`A`$. Iteration gives the unary-stem extension.

## Source and finite checks

The rooted factorization assumes the attachment vertex is supplied. Orellana and Scott reconstruct from edge-labelled centroid cuts. The present input is the ordinary unrooted chromatic symmetric function. The prior search for equal-branch doubles, reflected binary trees and centroid branches also located the known caterpillar, two-branching-vertex and proper-tree classes. It located no theorem covering all repeated branches under either criterion here. [Orellana–Scott, §5](https://arxiv.org/abs/1308.6005) · [Loehr–Warrington](https://arxiv.org/abs/2206.05392) · [Wang–Yu–Zhang](https://arxiv.org/abs/2308.03980) · [Orellana–Tomba](https://arxiv.org/abs/2611.18940)

Run the finite check from the repository root.

```sh
python3 docs/research-results/stanley-tree-subdivisions/verify_two_branches.py
```

The checker compares all 8,116 unordered pairs of equal-order rooted branches through order eight against the repeated targets, including all 6,670 pairs at order eight. It checks the coefficient of each proper fringe order, compares the full gluing formula against direct edge-subset enumeration through order four, and distinguishes the 18 mixed allocations with the same combined child multiset as a repeated target by the sum of the two unrooted branch polynomials. An explicit pair of unequal formal factors at order three satisfies both parity equations and has the required consecutive fringe counts. The parity identities alone thus permit unequal formal factors. [Checker](verify_two_branches.py)
