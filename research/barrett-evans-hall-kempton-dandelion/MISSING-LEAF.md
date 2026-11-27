# Barrett–Evans–Hall–Kempton’s dandelion conjecture

**Exact missing-leaf case at every order.** Suppose a simple graph and its complement are connected. If the graph has a vertex $h$ of degree $n-2$ and its sole non-neighbour $l$ is a leaf, then the spectral sum is at least the dandelion value $D_n$. Equality is possible only for a dandelion with arbitrary edges among the ordinary pendants, or its complement. This is one structural case of the original conjecture, including orders below the non-effective threshold of the [large-order proof](LARGE-ORDER.md).

Let $w$ be the unique neighbour of $l$. The remaining $n-3$ vertices split into $r$ neighbours of $w$ and $q=n-3-r$ non-neighbours of $w$. We have $q\ge1$, since otherwise $w$ is universal in the graph and the complement is disconnected. For $r=0$ the graph is a generalized dandelion.

## Two comparators

Ignoring edges among the $n-3$ ordinary vertices, the graph has exactly the edges $lw,wh$, every edge from $h$ to an ordinary vertex, and every edge from $w$ to the $r$-cell. In the complement, the mandatory edges are $hl$, every edge from $l$ to an ordinary vertex, and every edge from $w$ to the $q$-cell. By Laplacian monotonicity these two independent-cell graphs give lower bounds $x_0,y_0$ for the two connectivities.

When $q=1$, denote the single vertex of the $q$-cell by $v$. If $v$ is adjacent in the original graph to every member of the $r$-cell, the complement itself is a generalized dandelion: $w$ is its leaf, $v$ the degree-two neighbour, and $l$ the almost-universal vertex. Otherwise an edge from $v$ to the $r$-cell is present in the complement. The original-graph comparator is a generalized bull, while the complement contains a dandelion with one extra edge from its stem to an ordinary pendant, the attaining family of [sharp separation](SHARP-SEPARATION.md).

## Explicit large-orders proof for this case

For a lower bound on $x_0$ ground $h$ in its Laplacian. Cauchy interlacing gives at least the smallest eigenvalue of this principal minor. The other $q$-cell leaves give eigenvalue one. On the stem and $r$ common neighbours, to test that the smallest eigenvalue exceeds $x<1$, eliminate the diagonal cells of entries $1-x$ and $2-x$. The remaining Schur pivot is
\[
(2-x)-\frac{1}{1-x}+\frac{r(1-x)}{2-x}.
\]
In particular for $r\ge29$, it is positive at $x=41/50$. For $r\ge1$ one can always use $x_0\ge\beta>7/15$ by monotonicity at $r=1$ and the principal block $B$ from the sharp-separation theorem.

For the complement comparator similarly ground $l$. The only non-leaf block is $w$ and its $q$ neighbours, with Schur pivot $q-y-q/(2-y)$ at $y<1$. For $q\ge2$ this gives $y_0\ge2-\sqrt2>117/200$. If $q\ge19$ the pivot is positive at $y=47/50$. Therefore, for $n\ge50$ and $q\ge2$, either $r\ge29$ and $x+y>281/200$, or $r\le28$, $q\ge19$ and $x+y>7/15+47/50$. Both exceed $1+\alpha+1/n>D_n$.

In the remaining $q=1$ noncomplementary-dandelion case, the generalized-bull comparator gives $x>1-1/(n-2)$ by the original authors' Corollary 4.6. The augmented complement comparator gives $y\ge\beta>7/15$ by grounding the high-degree vertex again. This also gives strict improvement over $D_n$ when $n\ge50$.

## Exact orders below fifty

[The verifier](check_leaf_near_universal.py) handles orders 10–49 by the two comparators for $q\ge2$ and the bull/augmented-dandelion comparators for $q=1$. At orders 4–9 it uses the first comparison where it succeeds, otherwise checking the arbitrary edge set on the ordinary vertices directly, with no restriction on that set. The case $r=0$ and the structural equality cases are treated exactly, not separated by numerical tolerances.

Every spectral lower comparison uses a positive-definiteness test on the block energy minus the rational threshold times the squared norm after centering. The constant vector is factored out by setting one block coordinate to zero; within-block zero-sum modes are checked separately. Positive definiteness uses integer Bareiss pivots. Bisection for the original cubic gives an upper rational bracket for $D_n$, with the two root intervals $(0,1)$ and $(n-1,n)$ established in the original paper. The code uses no floating-point arithmetic.

The unrestricted small-order range of Conjecture 2 is still open here: a graph competing with the dandelion has not been shown at every order to contain an almost-universal vertex whose unique non-neighbour is a leaf. [Issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
