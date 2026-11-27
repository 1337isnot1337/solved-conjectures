# Independent mathematical review

The November 27, 2026 review checked
[the pinned primary proof](https://github.com/1337isnot1337/solved-conjectures/commit/3d7bc36f7643c0cd5c25ce6ffe98cf3537573c57)
and [the fractional rounding lemma](https://github.com/1337isnot1337/solved-conjectures/commit/fb4b6fadd049f595c18cc195fb53c799e3672f5c).
It found no mathematical gap in the parity-free statement.

- Graph Minors XVI, statement (2) in the proof of 4.2, forbids
  a whole grid row on the small side. A clean lifted row has
  every inter-cell edge on one side, so the linkage-rank bound
  applies to the branch-set model, not just to a contracted drawing.
- [Grohe–Kawarabayashi–Marx–Wollan, Lemma 4.1](https://www.cs.bme.hu/~dmarx/papers/grohe-stoc2011-topminor.pdf)
  explicitly uses a whole clique branch beyond the separator.
  The proof’s doubled linkage rules out each such separation of
  order less than the number of primary roots. The 8t+1 branches
  exceed the threshold of 3t.
- In a one-mate replacement, the possible sinks are the removed
  root and the newly used target exits. A residual path to a new
  exit would augment without removing the root, contradicting
  the contracted matroid. The simultaneous replacement keeps
  the target set. Any wrong mate would keep both parallel
  terminals linked with the contracted roots.
- Before loop erasure, the two flow supports contribute at most
  four original edge incidences per vertex, or three at a
  residual endpoint. This proves congestion two.
- The small-net and harmonic rounding calculation was checked
  separately. The private-leaf reduction to arbitrary demand
  graphs preserves both the required routing and the transversal.

The review also searched neighboring integral, edge-congestion,
fixed-label and bounded-congestion results and found no prior
direct uniform theorem. This is a mathematical review, not
journal refereeing or Lean verification. See [#1011](https://github.com/1337isnot1337/solved-conjectures/issues/1011)
for the review and publication record.
