# Barrett–Evans–Hall–Kempton’s dandelion conjecture

**Sharp asymptotic separation.** Among connected complementary pairs not in the generalized dandelion family of the [large-order theorem](LARGE-ORDER.md), the limiting minimum of the sum of algebraic connectivities is $1+\beta$, where $\beta$ is the smallest eigenvalue of
```math
B=\begin{pmatrix}1&-1&0\\-1&3&-1\\0&-1&2\end{pmatrix}.
```
In particular $\beta>\alpha=(3-\sqrt5)/2$ and $\beta<1/2$. The same limiting minimum holds if both diameters are required to be three. This gives a sharp positive gap above the conjectured dandelion minimum at large orders, rather than just an unspecified gap.

Use the notation of the large-order proof. Consider a sequence with both graphs connected and with limiting superior of $x+y$ strictly below $1+\beta$. Assume $x\le y$. Since $1+\beta<3/2$, the two-star argument still gives localization of both unit Fiedler vectors: if $b$ delocalizes then the moment inequality localizes $a$ and $x<1$; if $a$ delocalizes then $x\ge1/2-o(1)$ and so $y<1$ by a fixed margin. The symmetric argument applies. Thus $M=a_l$ and $b_h$ are bounded below after sign choice, $lh$ is absent from $G$, and $y\ge1-o(1)$. The argument at $h$ still makes every other uniformly bounded-degree vertex of $G$ adjacent to $h$. As before the second largest coordinate $Z$ satisfies $(2-x)Z\le M+o(1)$, implying $x\ge\alpha-o(1)$ and therefore $y\le1+\beta-\alpha+o(1)$.

## The leaf and its neighbour

If $l$ has degree at least two, its row gives $Z\ge(1-x/2)M$. Combined with the upper bound, this forces $(2-x)(1-x/2)\le1+o(1)$, so $x\ge2-\sqrt2-o(1)>\beta$. This is impossible. Hence $l$ is a leaf, with its sole neighbour $w$ having $a_w=(1-x)M$. This vertex attains $Z$: if a different vertex attained $Z$ it would have bounded degree and its edge to $h$ would give $xZ\ge Z-o(1)$, because $l$ has no edge to it and all other coordinates are at most $Z$.

Let $T$ be the maximum coordinate outside $`\{l,w\}`$. If $T$ is bounded below along a subsequence, its maximizing vertex has bounded degree and is adjacent to $h$ but not $l$. Its row has only the possible contribution from $w$ below zero, so $(2-x)T\le Z+o(1)$. If $T$ is small the same upper estimate is immediate since $Z$ has a positive lower bound. If $w$ has an extra neighbour besides $l,h$, its row gives
```math
xZ\ge (Z-M)+(Z-a_h)+(Z-T).
```
All further summands are nonnegative. It follows that
```math
(3-x-1/(2-x))(1-x)\le1+o(1).
```
For $x$ bounded away below $\beta$, the left side is strictly bigger than one. Indeed multiplying its difference from one by $2-x$ gives exactly $\det(B-xI)$, which is positive below the smallest eigenvalue. Thus $w$ has only $l,h$ as neighbours.

## The almost-universal endpoint

If $h$ has any additional neighbour in $G^c$ besides $l$, its row makes the second largest $b$-coordinate $Z_b$ at least $(2-y)b_h-o(1)$. This is bounded away from zero. A vertex attaining $Z_b$ is neither $l$ nor $w$, whose $G$-degrees are bounded. It is adjacent in $G^c$ to both, by the forced structure of $l,w$. In its complementary row the only possible negative contribution comes from $h$. Hence
```math
(3-y)Z_b\le b_h+o(1).
```
This implies $(3-y)(2-y)\le1+o(1)$ and so $y\ge(5-\sqrt5)/2-o(1)=1+\alpha-o(1)$. But the earlier bound is $y\le1+\beta-\alpha+o(1)<1+\alpha$. Thus the only complementary neighbour of $h$ is $l$, proving that the sequence is eventually generalized dandelion as before.

## Attainment of the limiting gap

Start from the dandelion $l-w-h$, with $h$ joined to all other vertices, and add the edge $wv$ to one of the ordinary pendant vertices $v$. The three named local vertices $l,w,v$ then have principal Laplacian block $B$. Both diameters remain three once there is another ordinary pendant vertex. Testing a unit eigenvector of $B$, extended by zero and then centered, gives $x\le\beta+o(1)$. For the reverse inequality, use the Fiedler vector in the subspace constant on all other pendants: any orthogonal internal mode has eigenvalue one. The coordinate at $h$ tends to zero by its growing degree, and the common ordinary-pendant coordinate is $O(1/n)$ by the zero-sum condition. Thus the local triple carries asymptotically all the squared mass. Along a subsequence its eigenvalue equation tends to a nonzero eigenvector equation for $B$, yielding $x\to\beta$.

In the complement, $h$ is a leaf, so a centered coordinate test at $h$ gives $y\le n/(n-1)$. The same localization and nonadjacent-extrema argument gives $y\ge1-o(1)$: the larger connectivity is at least $1-o(1)$ under this sum bound, while the first graph's value is below $1/2$. Thus $x+y\to1+\beta$. This graph is not a generalized dandelion up to complement: its leaf $l$ has degree-three neighbour, and for large $n$ the complementary leaf $h$ has neighbour of degree $n-2$, not two. This attains the separation.

For the bounds on $\beta$, $B-\alpha I$ is positive definite by its leading minors: its determinant is positive since $(2-\alpha)(1-\alpha)=1$, giving $\det(B-\alpha I)=\alpha>0$. At $x=1/2$ the determinant is negative, so $\beta<1/2$. [Issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
