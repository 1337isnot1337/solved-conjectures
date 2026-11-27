# A finite reduction of the single-forbidden-graph classification

Call a finite graph H a path-perfectness constraint if every
H-free graph is path-perfect. Equivalently, it suffices that
every H-free vertex-critical graph have a spanning path. This
classification question is motivated by [Cameron–Clow, §1.2](https://arxiv.org/html/2506.19100v1#S1.SS2).
It is distinct from proving an arbitrary binding function as
in their Conjecture 7.5 and from the full Erdős–Hajnal problem.

The following advances reduce the exact classification to one undecided forbidden graph. The remaining
entry is a question about *all* H-free graphs, not their order.

- If H has a cycle, the [high-girth lift](HIGH-GIRTH-EDGE-LIFT.md)
  gives an H-free non-path-perfect graph. In fact no finite
  family of cyclic graphs suffices.
- If H contains an induced claw or induced pair of disjoint
  edges, the [claw-free](https://github.com/1337isnot1337/solved-conjectures/pull/1006)
  or [two-edge-free](https://github.com/1337isnot1337/solved-conjectures/pull/1009)
  counterexample also avoids H.
- A forest avoiding both of those induced graphs is a disjoint
  union of paths, with at most one nontrivial component since
  edges in distinct components give two disjoint edges. The
  nontrivial path has at most four vertices, since the first
  and last edges of a five-vertex induced path give two
  disjoint edges.
- All graphs of independence number at most four are
  path-perfect by the [attributed traceability deduction](../cameron-clow-independence-four-path-perfect/PROOF.md).
  The earlier [13-vertex obstruction](https://erdosproblemaday.com/report/640#explicit-13-vertex-path-witness)
  has independence number five, so it avoids and excludes
  every forbidden graph H with independence number at least six.
  These statements settle all edgeless H.
- For a single edge with up to three additional isolates,
  path-perfectness follows from the [three-isolate proof](EDGE-THREE-ISOLATES.md).
  With four isolates or more, the [four-isolate counterexample](EDGE-FOUR-ISOLATES.md)
  shows that path-perfectness can fail.
- For a three-vertex path with up to two additional isolates,
  path-perfectness follows from the [two-isolate proof](PATH-THREE-TWO-ISOLATES.md).
  Four isolates give independence number six. Only three
  additional isolates remain undecided.
- Four-vertex-path-free graphs are path-perfect by the
  source's Theorem 1.5. With one isolate, the
  [co-gem proof](CO-GEM-WEAK-TOUGHNESS.md) gives
  path-perfectness (independently reviewed). With two
  isolates, the [two-block transversal counterexample](PATH-FOUR-TWO-ISOLATES.md)
  shows that path-perfectness can fail. It also works for
  all larger numbers of added isolates.

The sole unresolved entry is a three-vertex path plus three isolates. The three new positive results have received
[independent review](FORBIDDEN-CLASS-REVIEW.md); these remain research
results rather than an unrestricted solution.
