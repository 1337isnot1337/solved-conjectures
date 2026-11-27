# Henning–Joos–Löwenstein–Sasse induced cycles conjecture

**An exact edge-expansion test for counterexamples.** A sparse replacement of edges in a tight graph could create a violating graph; the following formula gives its exact optimum and an obstruction for the original twelve-vertex template. The transformed graph can be cubicized while preserving its gap via [exact cubic completion](CUBIC-COMPLETION.md).

## Replacement formula

Let $B$ be a finite simple cubic graph, and let $S\subseteq E(B)$. Replace each edge $uv\in S$ by $u x$, $y v$, and the triangle on $x,y,z$, with all new vertices private to that edge. Write $H$ for the resulting subcubic graph. The degree-three vertices of $H$ are its original vertices and the new vertices $x,y$; each $z$ has degree two. Thus the half-bound on branch vertices is $|V(B)|/2+|S|$.

For an original vertex set $C\subseteq V(B)$, let $F$ range over all 2-regular spanning edge sets on $C$ in $B[C]$, not necessarily induced. Write $D=E_B(C)\setminus F$ for the omitted chords. Then the maximum weight of an induced union of cycles in $H$, counting its degree-three vertices, is exactly
```math
\max_{(C,F):\,D\subseteq S}
  \left[\,|C|+2\,|S\cap(F\cup E_B(V(B)\setminus C))|\,\right].
```
Taking $C=F=\varnothing$ is allowed.

In a selected cycle set, each replacement triangle either selects both of $x,y$ or selects neither. Indeed $z$ needs both its neighbors if selected, and without both the only available degree of a selected $x$ or $y$ is at most one. If both are selected and $z$ is also selected, the two old endpoints are excluded, since $x,y$ already have degree two. If both are selected and $z$ is not selected, both old endpoints must be selected and the gadget acts as an edge in the projected cycle set. Conversely both outside endpoints absent always allow the isolated triangle, and adding it is optimal at weight two. A retained old edge with both endpoints selected is mandatory; an expanded edge between two selected endpoints may be omitted by leaving its triangle empty. These are exactly the chord condition and the weights in the formula.

For a single expanded edge $e=uv$, the same proof yields
```math
 \max\{c_{\rm ind}(B-e),\,2+m_{=}(B,e)\},
\qquad
 m_{=}(B,e)=\max\{|C|: B[C]\text{ is 2-regular and }
          (u\in C)\Leftrightarrow(v\in C)\}.
```
Thus if $B$ is tight with $c_{\rm ind}(B)=|V(B)|/2=k$, a single expansion violates the conjectured bound precisely when $c_{\rm ind}(B-e)\le k$ and $m_{=}(B,e)\le k-2$. The cubic completion would then have $ |V(B)|+16$ vertices and inherit the negative gap exactly. A base with $c_{\rm ind}(B)>k$ never violates the bound under a single expansion: an optimum either has equal membership, in which case it gains two, or it has opposite membership, in which case it remains feasible in $B-e$.

## What obstructs the route on the tight ring family

Suppose a tight graph $B$ admits a distribution on optimal induced unions of cycles such that the endpoints of each edge have equal selection status with probability at least $1/2$. For any choice of $S$, the expected number of expanded edges with equal endpoints is at least $|S|/2$. Taking $F=E_B(C)$ in the replacement formula therefore achieves the half-bound on branch vertices. This sufficient condition permits arbitrary simultaneous expansions.

The [three-square tight graph](README.md) has such a distribution: use one left and one right port in each square, choosing the used matching edge at each interface uniformly and independently. This makes every matching edge equal in endpoint status, and every internal edge equal with probability exactly $1/2$ because its two selections depend on different interfaces.

The same condition holds for the [joined tight family](TIGHT-FAMILY.md). Choose a single fair bit. In one state, use the interface edge $xy$ in the six-cycle of every constituent copy and in the assembly use all the outside seam edges instead; in the other state, use the alternative matching edge within every copy and no seams. In each copy choose the two other interfaces uniformly and independently. The marginal selection inside a copy is the same as the original three-square distribution. The remaining seam edges are always equal in endpoint status. Thus the exact tight family stays above or at half under every subset of these edge expansions, not just one edge or one order.
