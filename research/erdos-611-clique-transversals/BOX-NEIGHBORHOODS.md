# Bollobás–Erdős–Tuza maximal-independent-set conjecture

## A transversal theorem for neighborhoods with few intervals or boxes

**Theorem.** Fix $d\ge1$, aspect bound $A\ge1$, and $c>0$. Let the vertices of $G$ be a $d$-dimensional discrete torus $[q]^d$ with its cyclic coordinate orders. Suppose each open neighborhood is given as a union of axis-parallel cyclic boxes with aspect ratio at most $A$. Let $Q$ be the total number of boxes across all the neighborhood representations, and let $n=q^d$. There is a transversal for all inclusion-maximal independent sets of size at least $cn$ of size
```math
O_{c,d,A}\!\left(\frac{Q\log\log n}{\log n}+\sqrt n\right).
```
In particular this proves the strong form of [Erdős #611](https://www.erdosproblems.com/611) for every fixed $d,A$ and a bounded average number of such boxes per neighborhood. For $d=1$ this is a common cyclic order in which the neighborhoods have bounded average interval complexity; a linear order also suffices. The conjecture for arbitrary graphs remains open.

The thresholding acts on the intervals or boxes themselves, not on degrees. The proof does not require they be disjoint in a row or that their assigned scales be symmetric under exchanging endpoints.

## 1. A length band with few exceptional vertices

Take $B=\lceil(\log n)^2\rceil$, $b_0=\lceil\sqrt q\rceil$ and $b_j=b_0B^j$. Consider all bands $[b_j,b_{j+1})$ with $b_{j+1}\le q$. Their number is $\Theta_d(\log n/\log\log n)$. Classify a box by its shortest side length. Some band contains at most $O_d(Q\log\log n/\log n)$ boxes. Fix it, write $\ell=b_j$, $L=b_{j+1}=B\ell$, and put in $D$ every neighborhood owner with a box in the chosen band.

Every box of an owner outside $D$ is now short (minimum side below $\ell$) or long (every side at least $L$). A short box has volume at most $(A\ell)^d$.

## 2. A mesh and its exceptional short incidences

Choose a constant $0<\eta<1$ such that $(1+2\eta)^d(1-c)<1$; for $c=1$ any small $\eta$ works. In each cyclic coordinate use sample points with spacing $h=\lfloor\eta L\rfloor$ (the last gap on returning to the first point can be shorter). Their Cartesian product $H$ has size $O_{c,d}(n/L^d)$ and every vertex is within maximum-coordinate distance $h$ of some point of $H$. Rotate this mesh uniformly on the torus. Its size and covering property do not change.

For any rotation put in $D'$ every neighborhood owner having a short box containing at least one point of $H$. Since each vertex has probability $|H|/n$ of belonging to the rotated mesh, the expected number of such incidences is at most
```math
\frac{|H|}{n}\, Q(A\ell)^d=O_{c,d,A}(Q/B^d).
```
Some rotation achieves this as a bound on $|D'|$. Put $T=D\cup D'\cup H$. Since $L\ge\sqrt q$, its size satisfies the theorem.

## 3. Why the mesh hits the remaining large independent sets

Suppose a large maximal independent set $I$ misses $T$. Every sample point not in $I$ has a neighbor in $I$, by maximality. No member of $I$ owns a box in the excluded band or a short box meeting the mesh. Thus the union $U$ of all its long boxes covers $H$. Independence implies $U$ is disjoint from $I$, so $|U|\le(1-c)n$.

For a union of cyclic boxes with every side at least $L$, enlarging it in any one coordinate by $h$ multiplies its size by at most $1+2h/L$. In fact, on any line parallel to that coordinate, a nonempty fiber is a union of cyclic intervals, each connected component having length at least $L$. Each component gains at most $2h$ vertices. Sum this fact over all such lines. The expansion is still a union of boxes with every side at least $L$, so applying it successively in the $d$ directions gives
```math
|U+[-h,h]^d|\le(1+2h/L)^d |U|.
```
But the left side is $n$ because the mesh lies in $U$ and covers within distance $h$. This contradicts $(1+2\eta)^d(1-c)<1$.

## Scope

[Cooper–Hollars](https://arxiv.org/abs/2607.15486), Conjecture 7.2, ask the all-large-maximal-set version. [Cheng–Huang–Rong–Xu](https://doi.org/10.3934/fcnt.2026010) prove sublinear hitting for **maximum** sets in several geometric intersection graph classes. That adjacency model and target are distinct. Searches using common cyclic orders, bounded interval neighborhoods, cyclic boxes, and maximal independent transversals did not find the mesh-plus-scale assertion above. This is a bounded priority check and neither a resolution of the general conjecture nor a claim that all circular-arc graphs admit the proposed neighborhood order. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
