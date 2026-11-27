# Scope and prior work

## Original question

Ben Cameron and Alexander Clow, [On Gyárfás’ Path-Colour
Problem, arXiv:2506.19100v1, §7](https://arxiv.org/html/2506.19100v1#S7),
Problem 7.1 asks for the least forbidden-star leaf count at
which a graph can have chromatic number larger than every
path span. They explicitly ask whether all claw-free graphs
are path-perfect. Their Theorem 1.4 proves a factor-two
upper bound for claw-free graphs, not equality or a
counterexample. The construction here answers the full
question with least count three.

The separate co-diamond-free theorem is [issue #1002](https://github.com/1337isnot1337/solved-conjectures/issues/1002).
Neither that theorem nor this counterexample resolves
Gyárfás' original boundedness question or the unrestricted
Erdős–Hajnal odd-cycle problem #640. In particular this
counterexample's chromatic number is four, not larger than
the candidate constant four in Gyárfás' original question.

## Dependencies and credit

- [Chen and Shan, *A characterization of edge-chromatic
  3-critical graphs*, Lemmas 2.6–2.7](https://arxiv.org/pdf/2606.27131)
  supply the triangle replacement and classical Jakobsen
  edge-Hajós join lemmas. These are dependencies, not
  claimed new results. Their [original project census](https://github.com/chenle02/edge-3-critical-graphs-data)
  helped identify a two-terminal non-Hamiltonian pattern
  at order 15. The final proof reconstructs a smaller
  two-diamond gadget directly from the subdivided K4 and
  uses no census completeness assumption.
- [Cranston and Rabern, *Subcubic Edge-Chromatic Critical
  Graphs Have Many Edges*](https://doi.org/10.1002/jgt.22116)
  and [Woodall's follow-up](https://doi.org/10.1002/jgt.22423)
  study criticality and Hajós chains. Their density
  conclusions do not assert path-perfectness or address
  the edge-dominating trail obstruction.
- [Bullock, Frick and Singleton (2007)](https://doi.org/10.1016/j.disc.2005.11.063)
  give claw-free nontraceable graphs, including a smallest
  2-connected pair. Nontraceability alone does not imply a
  gap between chromatic number and path spans. The new
  construction directly enforces chromatic vertex-criticality.
- The relation of paths in line graphs to dominating
  trails is standard; the short needed direction is
  proved directly in the package.

## Prior-resolution search

Checked the source's arXiv record, author publication lists
([Cameron](https://www.smcs.upei.ca/~brcameron/research.html),
[Clow](https://www.alexanderclow.com/publications)), exact
problem/statement/number searches, and literature aliases
combining “claw-free,” “path-perfect,” “nontraceable,”
“vertex-critical,” “line graph,” “edge-chromatic critical,”
“dominating trail,” and “spanning trail.” The already known
claw-free counterexamples to traceability and the 3-critical
graph literature above are distinct from a demonstrated
gap for vertex coloring versus path spans. No exact prior
resolution or overlapping repository claim was located.
This is a bounded search, not a universal certification of
publication priority.

The final witness needs no computer search in its proof.
The verifier reconstructs it from the stated operations
and directly checks the four-color obstruction and every
three-color edge-deletion instance in the 35-vertex root.
