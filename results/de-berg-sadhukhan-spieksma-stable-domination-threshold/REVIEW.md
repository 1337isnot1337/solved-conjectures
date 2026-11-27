# Independent mathematical review

A separate project reviewer audited the original written proof
pinned to [research commit 5b58d10f](https://github.com/1337isnot1337/solved-conjectures/commit/5b58d10f17f0d24505284072facda6983bb8c882).
The review checked the exact published Section 5 question, the
full path-gadget domination identity, the local projection, its
approximation and recourse transfers, the construction of fixed
bipartite hard streams, and every local repair in the degree-two
scheme. The review found no mathematical blocker. It verified that
the hard window in the original Lemmas 3.3–3.4 applies to any
sequence of approximate sets on the prescribed input, so fixing
the final proper edge coloring for the construction gives no
necessary foreknowledge to the output algorithm.

The reviewer independently enumerated 599,184 local selections
for path-gadget parameters two through seven, checked all 27
externally supported port lifts, and verified the offset and
projection on 777,117 translated dominating sets over all 75
labeled original graphs of orders one through four. They also
checked all sixteen external edges of a full-capacity four-by-four
bipartite instance. These are supplemental checks, not the proof.

Two source corrections from the review are included: the
maximum-degree question comes first under Dominating Set in
the published Section 5, and Corollary 2.2(ii) already implies
existence at degree two. The new contribution to the original
question is the subcubic lower bound. The explicit degree-two
algorithm and the independently obtained matching path lower
bound additionally quantify the dependence on the error tolerance.

This is an independent project mathematical review, not a Lean
formalization or external journal referee report. The review and
publication record is tracked in [issue #996](https://github.com/1337isnot1337/solved-conjectures/issues/996).
