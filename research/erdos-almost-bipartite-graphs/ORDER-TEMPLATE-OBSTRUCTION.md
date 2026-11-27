# Order-template obstructions to slowly growing bipartization

A limitation of the methods around [Erdős's arbitrary-cardinal
conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/1015).
This note is not a standalone named-conjecture claim. It concerns the
possible next goal of a single graph satisfying substantially smaller
bounds than every fixed power \(n^{1+\epsilon}\).

For a finite graph \(H\), let \(\beta(H)\) be its minimum number of
edge deletions to become bipartite, and for an infinite graph \(G\)
put \(h_G(n)=\sup_{|V(H)|=n,\ H\subseteq G}\beta(H)\).

## A general counting obstruction

Fix \(r\ge 1\). Let \(T_m\) be a graph on the increasing \(r\)-tuples
from \([m]\), whose edges are chosen by a fixed set of order/equality
patterns on pairs of tuples. Thus every order-preserving injection
of ground sets sends edges to edges. If one \(T_N\) contains an odd
cycle \(C\), write \(s\) for the fewest distinct ground elements
used by the two endpoints of any edge of \(C\). Then, for \(m\ge N\),
\[
\beta(T_m)\ \ge\ \frac{\binom{m}{s}}{\binom{N}{s}}.
\]
In particular, \(s\ge r+1\); if every adjacent pair has disjoint
supports, then \(s=2r\).

To prove the bound, take any two-coloring of \(T_m\). Each \(N\)-subset
of \([m]\) supplies an ordered copy of \(C\) and so a monochromatic
edge in it. If an edge belonging to one of these copies uses \(j\)
ground elements, it can be counted for at most
\(\binom{m-j}{N-j}\le \binom{m-s}{N-s}\) of the \(N\)-subsets.
Double-counting gives the bound for every two-coloring. Minimizing
over all two-colorings is equivalent to minimizing the number of
deleted edges.

If \(G\) contains \(T_m\) as a subgraph for every \(m\), take the
largest \(m\) with \(\binom{m}{r}\le n\). Add extra vertices to
the embedded copy as needed. Edge-bipartization number cannot
decrease under adding vertices and edges, hence
\[
h_G(n)=\Omega\bigl(n^{s/r}\bigr).
\]
The constant depends on the template and its chosen odd cycle, not
on \(n\) or the embedding in \(G\).

## Consequences

- A host containing every finite subgraph of a fixed ordinary
  \(r\)-shift has \(h_G(n)=\Omega(n^{1+1/r})\); the specified
  odd cycle in [the fixed-shift note](SHIFT-EXPONENT-SHARP.md)
  has \(s=r+1\). No assumption of induced containment is needed.
- A fixed disjoint-type graph on all \(r\)-tuples with any odd
  cycle has a **quadratic** bipartization profile, along all
  sufficiently large \(n\). This rules out simply substituting
  such an entire template to obtain a near-linear edge bound.
  Small finite chromatic numbers, as investigated by
  [Avart–Łuczak–Rödl](https://doi.org/10.4064/fm226-2-6),
  do not force a small two-color edge defect. Thin subgraphs
  that do not contain all the finite templates are not ruled out.
- By Halevi–Kaplan–Shelah, [Corollary 4.5 and
  Corollary 5.21](https://doi.org/10.1090/tran/8570), their
  \(\omega\)-stable uncountably chromatic graphs, superstable
  graphs of chromatic number above the continuum, and sufficiently
  chromatic graphs interpretable in stationary stable theories
  contain all the finite subgraphs of some ordinary shift.
  Consequently, in these classes \(h_G(n)\ge c n^{1+\delta}\)
  for some positive \(c,\delta\) depending on \(G\). In particular,
  they cannot realize \(h_G(n)=O(n\log n)\) at the same
  chromatic thresholds. This does not assume the discredited
  unrestricted strong Taylor conjecture.

These are barriers to fixed homogeneous constructions, not a universal
power-law lower bound. At exact chromatic number \(\aleph_1\),
Lambie-Hanson's forest layering already allows an arbitrarily slowly
diverging multiplier of \(n\). [Prior-resolution note](PRIOR-RESOLUTION.md).
The existence of such a graph above arbitrarily large cardinals does
not follow from these observations. They also do not settle
[Lambie-Hanson's Question 6.2](https://arxiv.org/abs/1902.08177),
which asks about finite chromatic growth, not edge bipartization.
