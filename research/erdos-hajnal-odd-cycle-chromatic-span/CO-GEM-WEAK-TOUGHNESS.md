# Co-gem-free vertex-critical graphs are traceable

Let the co-gem be an induced four-vertex path and an isolated
vertex. Every co-gem-free vertex-critical graph has a Hamiltonian
path, and consequently all co-gem-free graphs are path-perfect.
The new structural step is a weak toughness inequality for all
cuts of these critical graphs. We then use Qiuyu Chen's published
resolution of Nikoghosyan's conjecture as a dependency, not as a
result of this work.

## Weak toughness from separator patterns

Let G be co-gem-free and vertex-critical. It is connected:
if some proper component had the full chromatic number, deleting
a vertex of another component would not lower it. We claim that
for every vertex set S, the number of components of G-S is at
most |S|+1.

Otherwise choose an inclusion-minimal violating S. Let t=|S|
and c be the number of components of G-S, so c>=t+2. If a
vertex x in S has neighbors in d of those components, adding x
back gives exactly c+1-d components. By minimality this is at
most t. Thus every x meets at least c-t+1>=3 components.

Call x mixed on a component C if x has both a neighbor and a
nonneighbor there. In that case an edge uv of C crosses between
the two sets, say x sees u but not v. For any other component
E, choose a third component D distinct from C and E that x
meets; this is possible because x meets at least three. For a
neighbor w of x in D, the vertices v,u,x,w induce a four-vertex
path. Any nonneighbor of x in E would be anticomplete to that
path and give a co-gem. Therefore x is complete to every
component other than C. In particular it can be mixed on only
one component.

Call a component exceptional if it is mixed on by some vertex
of S. With m mixed vertices in S, there are at most m
exceptional components. The remaining c-m or more components
are modules: every vertex outside such a component either
sees it entirely or misses it entirely. Each component of
G-S is a cograph, since an induced four-vertex path in one
would have an isolated vertex in any other component. A module
C in a vertex-critical graph must itself be vertex-critical.
Indeed if deleting v from C did not reduce its chromatic
number, start with a coloring of G-v in one fewer than the
chromatic number of G. Recolor C using only the colors already
used on C-v; outside neighbors are complete to C and so use
none of those colors. This would color G with too few colors.
A vertex-critical cograph is a clique because cographs are
perfect. So all nonexceptional components are cliques.

## A bound on compatible split patterns

Let I choose one representative from each nonexceptional
component. The representatives are independent. Every mixed
vertex of S sees all of I. For a pure vertex x of S, write
A_x for its neighbor set among I. If two sets A_x,A_y had all
four of the regions of their two-way Venn diagram nonempty,
we obtain a co-gem. If x and y are adjacent, take one exclusive
neighbor of each to form the induced path through x,y.
If they are nonadjacent, use one exclusive neighbor of x
and one common neighbor to form the induced path ending at y.
In either case a representative outside their union is the
isolated vertex.

Hence the splits of I by the pure vertices are pairwise
compatible. Choose one reference representative and complement
each A_x that contains it. After this operation all sets miss
the reference. Compatibility is unchanged, and now each
pair of subsets is nested or disjoint. In this laminar family,
a representative's membership pattern is determined by the
smallest set containing it, or by belonging to none. Thus
there are at most t-m+1 patterns; complementing the chosen
columns does not change how many patterns there are.

There are at least c-m>=t-m+2 representatives. Two therefore
have the same pattern, and their two clique components have
identical adjacency to all of S, since mixed vertices see
both completely. Delete a vertex of the smaller clique,
color the resulting graph with one fewer color, and recolor
the entire smaller clique using distinct colors of the
unchanged larger clique. Those colors avoid its neighbors
in S and the cliques have no edges between them. This
contradicts vertex criticality, proving the claimed cut bound.

## From the cut bound to a spanning path

For |V(G)|<=1 the assertion is immediate. Otherwise add a
universal vertex u. The new graph is still co-gem-free,
because the forbidden graph has no universal vertex. In a cut
that disconnects it, u must belong to the deleted set. The
cut bound of G implies that the number of remaining components
is at most the size of the enlarged cut. This is exactly
1-toughness, and the enlarged graph has at least three vertices.

Apply [Qiuyu Chen's theorem for 1-tough co-gem-free graphs](https://github.com/canghaimeng/Nikoghosyan-conjecture),
also described in [Euler, §7.1](https://arxiv.org/abs/2610.19864).
This is the result conjectured by
[Nikoghosyan](https://doi.org/10.1155/2013/673971); the older
higher-toughness result of [Shan](https://doi.org/10.1002/jgt.70090)
would not suffice. Deleting u from a Hamiltonian cycle gives
a spanning path of G. Now take a vertex-critical induced
subgraph of the full chromatic number inside each given induced
subgraph. Its spanning path proves path-perfectness.

Searches pairing “co-gem-free” or “P4+P1-free” with “path-perfect,”
“vertex-critical,” “traceable,” “scattering number,” and
“weak toughness” found the Hamiltonicity dependency and
critical graph finiteness papers, but not this separator
argument or this exact path-perfectness assertion. We did not
run Lean or reverify the existing Hamiltonicity result.
