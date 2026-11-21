# Sonntag–Teichert conjecture

Every tournament's hypergraph of inclusion-minimal dominating sets has at most one nontrivial connected component. The proof also classifies the disconnected cases for oriented graphs with missing arcs. After deleting isolated vertices of the hypergraph, the only possibilities are two disjoint stars.

- [Proof](PROOF.md)
- [Literature check](NOVELTY.md)
- [Reproducible checks](verify.py)
- [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/70)

**Lean status:** The [Lean proof](../../lean/Conjectures/SonntagTeichert.lean) establishes the tournament theorem in the equivalent no-separation formulation. The forward two-star classification for oriented graphs with missing arcs and a converse realization with arbitrary additional isolated vertices are also checked. The standalone strict source check, all-owned axiom audit and stock-kernel replay passed; the combined repository gate is pending.
