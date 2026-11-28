# Erdős–Gyárfás balanced coloring conjecture

Research log for [issue #45](https://github.com/1337isnot1337/solved-conjectures/issues/45). The general conjecture remains open.

For every integer $r\ge3$, an $r$-edge-coloring of the complete graph on
$r^2+1$ vertices must have $r+1$ vertices whose induced edges omit a
color. Equivalently, its color graphs cannot all have independence number at
most $r$.

## Literature

- [Erdős and Gyárfás, Conjecture 1 and p. 80](https://doi.org/10.1016/S0012-365X(98)00323-9)
  pose the statement, prove the three- and four-color cases, and construct
  a sharp $r^2$-vertex example from an affine plane when one exists.
- [Gyárfás, §2.2](https://doi.org/10.1016/j.ejc.2023.103695) revisits the
  problem and the related threshold where the tested subset size is the
  ceiling of the number of vertices divided by $r$.
- [Xia and Szeider](https://arxiv.org/abs/2610.24484) give a proof of the
  five-color case using certified computations. The [Erdős Problems wiki](https://erdosproblems.ai/wiki/problems/extremal_graph_theory/E0617)
  indexes other fixed-case claims and reviews, including a reported gap in
  the seven-through-nine-color manuscripts it reviewed. These claims do
  not cover the general statement.
- [The Erdős Problems wiki research record, §4](https://erdosproblems.ai/wiki/research/erdos_617/independent/small_independence_and_packing_obstructions)
  already excludes $r$ disjoint monochromatic $r$-cliques of a single
  color. This excludes any extension of the affine-plane construction
  that keeps the old line cliques. The same research record gives lower
  bounds on how many old edges must be recolored.
- [Clique residue and affine repair, §3](https://erdosproblems.ai/wiki/research/erdos_617/independent/clique_residue_and_affine_repair)
  uses the independent-transversal obstruction on a prescribed set of
  disjoint full cliques. The useful threshold is an independent set
  of size $r-t+1$ outside $t$ cliques.
- [OutBlade's notes, §2](https://github.com/OutBlade/erdos-notes/blob/main/notes/617-balanced-colourings.md)
  bound the product of fractional clique cover numbers in two colors.

The general claim was checked against the original paper, the coauthor's
retrospective, recent arXiv results, the problem archive and its linked
research reports, and public code repositories in November 2026. No proof
or counterexample for the full conjecture was found.

## When the residue forces complete cross matchings

Suppose a hypothetical balanced coloring contains $t\ge2$ vertex-disjoint
cliques of order $r$ in color $i$. Let $R$ be the other vertices and let
$s$ be the independence number of their color-$`i`$ graph. If
$s\ge r-t+2$, the color-$`i`$ graph on the packed cliques is a rook graph.
In other words, between every two packed cliques there is a perfect
matching, and the matchings identify the vertices consistently across
all cliques. For any maximum independent set $S$ in $R$, each vertex
of $S$ is adjacent in color $i$ to precisely one of the resulting columns,
and those columns are distinct.

### Proof

Write $Q_1,\ldots,Q_t$ for the cliques. Every external vertex has at most
one edge of color $i$ to a given $Q_j$, since the other $r-1$ colors
must each occur in the $r$ edges into that clique. In particular, the
edges of color $i$ between any two cliques form a matching.

The [transversal lemma in the prior packing argument](https://erdosproblems.ai/wiki/research/erdos_617/independent/clique_residue_and_affine_repair)
says that if $m\ge2$ parts have size at least $m-1$, the edges between
any two form a matching, and there is no independent transversal, then
all parts have size $m-1$ and the matchings are perfect and consistent.
For $m=1$, the no-transversal condition simply requires the only part
to be empty.

Fix $S$ of size $s$, and set $m=r+1-s$. In every $Q_j$ the vertices
having no neighbor in $S$ form a list of size at least $r-s=m-1$.
For any $m$ of the $t$ lists, an independent transversal would
extend $S$ to an independent set of order $r+1$. The lemma forces
all lists to have size $m-1$. Thus every member of $S$ has one
neighbor in each $Q_j$ and these neighbors are distinct in each
clique. The lists are joined by perfect matchings if $m\ge2$.
They are consistent when $m\ge3$ by applying the lemma to a
selection containing any given three lists. When $m\le2$ the
lists have size at most one and consistency is immediate.

Now remove one vertex $u$ from $S$. Each list gains exactly one vertex,
the neighbor of $u$. Because $s\ge r-t+2$, we have $m+1\le t$.
Applying the lemma to any $m+1$ enlarged lists gives a perfect matching
between each pair. Every old list vertex already has its old mate,
so the two newly available vertices must be matched to each other.
Doing this for every $u$ proves the assertion about the full
matchings and about the corresponding columns.

### Edge consequence

The packed cliques, their cross matchings, and edges from $S$ into
the cliques force the following lower bound, with the last term
counting edges of color $i$ entirely within $R$.

```math
e(G_i) \ge t\binom r2+r\binom t2+st+e(G_i[R]).
```

In particular, if $r\ge13$ and $t\ge2r/3$, the two clique terms
alone exceed the average color budget $r(r^2+1)/2$. In that range a
sparsest color with such a packing must therefore satisfy
$\alpha(G_i[R])\le r-t+1$. This comparison uses
$r^2-12r-9>0$ for $r\ge13$. It complements the prior bound at
$s=r-t+1$, which forces $t-1$ matched columns across the $t$ cliques.

The argument assumes a large packing of monochromatic cliques. The
arbitrary coloring case includes color graphs for which no such packing
has been established.
