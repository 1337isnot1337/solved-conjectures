# Independent mathematical review

**Outcome:** No gap found in an independent AI mathematical re-read. This is not external human refereeing.

The reviewed main argument appears at research revision [1cf98b4](https://github.com/1337isnot1337/solved-conjectures/blob/1cf98b4ec14939da2dc5e451164ac0b7982d65d6/research/chen-prescribed-parity-exact-one-marker/COMPLETE-PROOF-DRAFT.md), blob `c62f73c65adbe00b6e0d932e1887d37cfdd6c04f`. The staged [proof](PROOF.md) preserves its argument. It adds related-work citations, links, and this review record.

1. **Induction and whole pairs.** The unique positive component below each separator follows from the induction and gives the tangle axioms. Marx–Wollan's Theorem 3.3 in print, Theorem 6 in [arXiv v3](https://arxiv.org/pdf/1305.1331v3#page=6), supplies the exact bounded deletion. The one-gate argument then either hits paths at boundedly many gates or makes a packing of different demands.
2. **Odd clique and odd bricks.** The parity normalization and all-odd unit faces check. [Rooted grid minors, Statement 2.1](https://arxiv.org/pdf/1307.8138#page=4), preserves the selected model connectors and only enlarges root cells. Hence the private face switch is a switch in the original graph and the lifts have load at most two.
3. **Odd handles.** The ordered wiring gives disjoint extensions. The tail exchange strictly reduces the cost even if the alternative arm starts on the handle: the old tail to its occupied port cannot use only a handle with both ports vacant. The annular construction gives each connection its own ring. Two connections of a single demand use disjoint angular intervals, so the full route is simple rather than a walk.
4. **Bipartite large block.** The definition in [Heinlein §6](https://d-nb.info/125238162X/34#page=59) puts the lifted one-gate separator within tangle order. The same-gate paths are covered first; then the private leaf reduction keeps demand identities and preserves both load and the cover map. The separate parity-free rooted-grid argument does not depend on any step of the prescribed-parity proof.

The all-even lower bound and congestion-one example are separate from the positive theorem. Independent checks did not constitute a formally verified proof.
