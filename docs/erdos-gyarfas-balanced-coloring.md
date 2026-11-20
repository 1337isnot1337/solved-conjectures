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
