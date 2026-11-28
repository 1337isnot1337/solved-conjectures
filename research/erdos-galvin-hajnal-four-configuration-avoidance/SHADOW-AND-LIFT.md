# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

**Status:** complete graph reformulation and a three-pattern consistency result, not a complete answer to 9/C.

[Problem 9/C, p. 482](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=58) asks for a 3-uniform hypergraph on $\omega_1$ of chromatic number $\aleph_1$ omitting $\mathcal T_1,\mathcal T_3,\mathcal T_4,\mathcal T_9$. These are, respectively, the loose triangle (three pairwise single intersections, all different), three triples on four points, the suspension of the four-vertex path, and the pattern $abx,aby,xyz$ on five distinct vertices. The sources are EGH's diagrams 1, 3, 4, and 7; copies are not induced.

## Exact reformulation as a triangle-vertex partition problem

The requested system exists if and only if there is a graph $G$ on $\omega_1$ such that:

1. $G$ is $K_4$-free, and every vertex neighborhood induces a disjoint union of stars and isolated vertices (equivalently it is $P_4$-free, not just induced-$`P_4`$-free).
2. Every countable vertex coloring of $G$ has a monochromatic triangle.

For the forward direction, take $G$ to be the pair shadow. Every triangle $abc$ in the shadow is a hyperedge. In fact, if $abc$ were not an edge, pick triples extending its three pairs. The third point of each selected triple is outside $`\{a,b,c\}`$. If those third points are distinct, the triples form $\mathcal T_1$. If exactly two are the same, those two triples share a pair, and the third meets their two other vertices but not the shared pair, giving $\mathcal T_9$. If all three are the same, there is $\mathcal T_3$. All three cases are forbidden. Thus the original system is exactly the set of all shadow triangles. The absence of $\mathcal T_3$ now forbids $K_4$ in the shadow, and absence of $\mathcal T_4$ forbids a four-vertex path in any vertex neighborhood. A connected triangle-free graph with no four-vertex path is a star if it has an edge.

Conversely, take all triangles of a graph satisfying (1)–(2). The absence of $K_4$ excludes $\mathcal T_3$ and $\mathcal T_9$: for $\mathcal T_9$, the repeated pair and its two distinct petals would be the vertices of a $K_4$ in the shadow. The neighborhood condition excludes $\mathcal T_4$. If a loose triangle $abx,bcy,caz$ existed, its shadow contains the triangle $abc$. That is an edge too, and at $a$ the edges $abx,abc,acz$ make the path $x,b,c,z$ in the link, again impossible. Thus all four are omitted.

In the consistent rainbow model of [the link-path proof](https://github.com/1337isnot1337/solved-conjectures/pull/1047), every $\mathcal T_4$-free system on $\omega_1$ is countably colorable. Hence the existence requested in 9/C fails in that model. This direction does not need the other three forbidden configurations.

## Omitting the three overlap configurations under CH

Under CH there is an $\aleph_1$-chromatic 3-graph on $\omega_1$ omitting $\mathcal T_3,\mathcal T_4,\mathcal T_9$ simultaneously. We use [EGH Theorem 10.5](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=45) and [Moore's rectangular pair coloring](https://arxiv.org/abs/math/0501524). The loose triangle is not excluded by this argument.

Take a macro-system $H_0$ on $\omega_1$ with no uncountable independent set, in which every shared pair is the bottom pair (the two least points) of both triples. Replace each macro vertex $v$ by a disjoint fiber $V_v$ of size $\aleph_1$. Impose a fixed enumeration by $\omega_1$ on each fiber.

For each macro base pair $u<v$, independently color the pairs in $V_u\times V_v$ by ordinals below $\omega_1$ so that any product of two uncountable subsets of the two fibers sees every color. This is Moore's coloring on the two copies of $\omega_1$, assigning a default value to pairs with equal fiber index; the theorem gives a pair with strictly increasing indices and hence the default does not interfere. Associate distinct colors to the macro apices $w$ with $uvw\in H_0$. An actual pair in $V_u\times V_v$ is eligible at macro apex $w$ only if it has the color associated with $w$. Thus an actual base pair is eligible in at most one apex fiber, and any rectangle of uncountable subsets of $V_u,V_v$ contains eligible pairs for every macro apex of $uv$.

For each $w$, enumerate all countably infinite matchings consisting of eligible actual base pairs for $w$, with indices below $\omega_1$. This is possible because CH gives $(\aleph_1)^{\aleph_0}=\aleph_1$. At the vertex $z\in V_w$ with index $\xi$, choose a matching of eligible pairs that meets every enumerated matching of index at most $\xi$. To do so, run through those requirements in a sequence of length at most $\omega$, choosing on each step an edge disjoint from the finitely many endpoints already used. Add a triple for every chosen pair with apex $z$.

A repeated physical pair must come from a repeated macro pair, or from two edges over the same macro triple. In the first situation, the repeated macro pair must be a base pair in both. Eligibility then puts both actual apices in the same macro fiber, so in fact the two macro triples coincide. In the second situation an arm pair determines the same actual apex and one endpoint of its chosen matching; hence it cannot repeat. This proves that every repeated pair is a base, and that every triple has at most one repeated pair. The latter gives $\mathcal T_3$- and $\mathcal T_4$-freeness: each configuration has a triple with two different pairs also belonging to other triples of the configuration. Every co-neighborhood of a repeated pair lies within a single fiber, and no edge contains two vertices of a single fiber. This gives $\mathcal T_9$-freeness.

Finally, given a countable coloring of the actual vertices, choose for each fiber a color occurring uncountably often. The induced countable coloring of the macro vertices has a monochromatic macro triple $uvw$, with apex $w$. Let $A\subseteq V_u,B\subseteq V_v,C\subseteq V_w$ be the uncountable sets of the chosen common color. Moore's property gives a countably infinite matching of eligible pairs in $A\times B$: repeatedly remove the finitely many previously used endpoints and apply the rectangular property. Its enumeration index is bounded in $\omega_1$. Choose $z\in C$ past it; the prescribed matching at $z$ meets that requirement. So there is a monochromatic triple, as desired.

This argument does not claim $\mathcal T_1$ avoidance. Even within one macro triple a loose triangle can arise from two disjoint base pairs at one apex and a cross base pair at a second apex. Ensuring that each apex matching has no such cross-pair in the *whole* eligible pair graph while keeping the rectangle requirements is not supplied by the construction.
