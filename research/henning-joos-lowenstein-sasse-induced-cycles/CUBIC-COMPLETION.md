# Henning–Joos–Löwenstein–Sasse induced cycles conjecture

**Exact cubic completion.** For every finite simple subcubic graph $S$, there is a finite simple cubic graph $G$ whose gap from the conjectured bound is exactly the optimum gap for a weighted version on $S$. When $S$ is connected, $G$ is connected, and if any vertex of $S$ has degree below three, $G$ has a bridge. In symbols, the exact identity is
```math
c_{\rm ind}(G)-\frac{|V(G)|}{2}
 = \max_{C\,:\,S[C]\text{ is 2-regular}}
       \sum_{v\in C}(\deg_S(v)-2)
   -\frac12\sum_{v\in V(S)}(\deg_S(v)-2).
```
The empty selection is permitted. In particular, if $S$ has minimum degree at least two, the right-hand side counts only its degree-three vertices: a failure to cover half the branch vertices by induced disjoint cycles in any connected such graph yields an ordinary cubic counterexample. No lower bound on that right-hand side is established here.

## A sharp rooted attachment

Take the [three-square graph $B$ and a safe interface edge $xy$](TIGHT-FAMILY.md). Subdivide $xy$ by a new root $z$ to obtain the 13-vertex one-terminal graph $H$. With $z$ avoided the optimum is six because $H-z=B-xy$. With $z$ included its two neighbors must be selected. Suppressing $z$ and restoring $xy$ then gives an induced 2-regular set of $B$, so the optimum in this state is at most seven. It is exactly seven: choose the six-cycle of $B$ that uses one port per side in every block and crosses the designated interface on $xy$, and subdivide that edge in the cycle. Thus $a(H)=6$ and $m(H)=7$. In particular the rooted inequality in the [bridge reduction](README.md) is sharp, and joining two copies of $H$ at their roots gives a 26-vertex tight cubic graph with a bridge.

## Completion and its objective

For each $v\in V(S)$, put $t_v=3-\deg_S(v)$. Attach $t_v$ disjoint copies of $H$ by a single edge from $v$ to each new root. This makes every vertex cubic and introduces exactly $13\sum_v t_v$ vertices.

All the attachment edges are bridges. An induced union of cycles can use none of them, and hence cannot select both endpoints of any such edge. Its selected set $C$ inside $S$ must itself induce a union of cycles. For each copy of $H$ attached to a vertex outside $C$, the optimum contribution is seven. For a copy attached to a vertex in $C$, it is six because the root must be absent. All copies can be optimized independently conditional on $C$. Consequently
```math
 c_{\rm ind}(G)=7\sum_v t_v+
     \max_{C\,:\,S[C]\text{ is 2-regular}}\sum_{v\in C}(1-t_v).
```
Subtracting half the completed order proves the stated identity since $1-t_v=\deg_S(v)-2$.

The identity makes connected subcubic graphs with degree-two paths a concrete search domain for potential bridged counterexamples. It also covers graphs of degree one or zero, where the corresponding negative vertex weights contribute to the total but cannot occur in a selected cycle.
