# Prescribed parity: what the double cover does and does not give

The [parity-free theorem](PARITY-FREE-HALF-INTEGRAL.md) yields
a congestion-four Erdős–Pósa bound for prescribed-parity
**walks**, with congestion measured by the number of different
walks containing a vertex. This does not answer the second
question of [Chen, Problem 6.5](https://arxiv.org/pdf/2609.26158#page=14),
which is about simple paths.

For each supply vertex v take two copies (v,0),(v,1) and
for each supply edge uv put edges (u,0)(v,1) and (u,1)(v,0).
For a demand s,t of prescribed parity p use the demand
(s,0),(t,p) in the cover. These demands form a matching.
Every cover path projects to a walk of the required parity.
Every walk of that parity lifts, and can be shortened to
a path in the cover while keeping its endpoints: the parity
condition is already encoded in those endpoints.
A congestion-two packing in the cover projects to a
congestion-four packing of walks, because each original
vertex has two copies. A transversal in the cover projects
to a set of no greater size hitting all the prescribed walks,
and therefore also all prescribed-parity simple paths.

This route cannot compare the packing of walks to that of
simple paths, even if every demand is active for simple paths.
For N pairs, give the i-th pair a private two-edge path
s_i--m_i--t_i. Attach a private triangle at m_i, sharing no
other vertices. Also add a private vertex a_i adjacent to s_i.
Use one common vertex c adjacent to a_i and t_i for every i.

Each pair has an odd simple path s_i--a_i--c--t_i. But after
deletion of c, the only simple s_i-to-t_i path is the
two-edge path through m_i: the triangle is attached at its
one cutvertex and cannot change the parity of a simple path.
Thus the simple-path transversal number is 1, and every
simple odd path uses c, so congestion two permits at most
two. In contrast, each pair has a private odd walk avoiding c:
take the main path and traverse its triangle once from m_i
back to m_i. Those N walks are vertex-disjoint between pairs.

For the positive bounded-odd-cycle-transversal case, if a set
B of size b makes the supply graph bipartite, remove B first.
For each surviving pair keep it only if its required parity
agrees with the bipartition of its component. All supply paths
for the remaining pairs have the required parity. The
parity-free theorem therefore gives the valid bound
`b+f(t)` when congestion two cannot route t different demands
of the required parities. The unresolved case has no such
bound on b; the example above explains why lifting and then
discarding parity-breaking detours is not a valid replacement.
