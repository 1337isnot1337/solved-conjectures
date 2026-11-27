# A finite reduction of the single-forbidden-graph classification

Call a finite graph H a path-perfectness constraint if every
H-free graph is path-perfect. Equivalently, it suffices that
every H-free vertex-critical graph have a spanning path. This
classification question is motivated by [Cameron–Clow, §1.2](https://arxiv.org/html/2506.19100v1#S1.SS2).
It is distinct from proving an arbitrary binding function as
in their Conjecture 7.5 and from the full Erdős–Hajnal problem.

The following advances reduce the exact classification to four
undecided finite forbidden graphs. Each undecided entry is a
question about *all* H-free graphs, not a bound on their order.

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
  Five isolates give independence number six. Only four
  additional isolates remain undecided.
- For a three-vertex path with up to two additional isolates,
  path-perfectness follows from the [two-isolate proof](PATH-THREE-TWO-ISOLATES.md).
  Four isolates give independence number six. Only three
  additional isolates remain undecided.
- Four-vertex-path-free graphs are path-perfect by the
  source's Theorem 1.5. The 13-vertex obstruction has no
  four-vertex path with three anticomplete independent vertices:
  the direct four-set check in [verify_forbidden_residual.py](verify_forbidden_residual.py)
  verifies this in the credited graph. Therefore all
  forbidden graphs consisting of a four-vertex path and
  at least three isolates fail. One and two additional
  isolates remain undecided.

The resulting unresolved list is an edge plus four isolates,
a three-vertex path plus three isolates, and a four-vertex path
plus either one or two isolates. No assertion is made about the
four outcomes. The positive results above are marked research
until independently reviewed.
