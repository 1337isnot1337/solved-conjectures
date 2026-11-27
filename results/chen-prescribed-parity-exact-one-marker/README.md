# Chen’s prescribed-parity exact-one-marker conjecture

Given an undirected graph and a matching of prescribed demand pairs, with one required parity per demand, either t different demands have simple paths of vertex congestion at most two, or a vertex set of size bounded only by t meets every eligible path. This answers the second question in [Chen, Problem 6.5](https://arxiv.org/pdf/2609.26158#page=14).

* [Complete proof](PROOF.md).
* [Source and prior-resolution audit](SOURCES.md).
* [Independent AI mathematical review](REVIEW.md).
* [Why congestion two is necessary](WHY-CONGESTION-TWO.md), even for all-even demands.
* [Cover lower bound](COVER-LOWER-BOUND.md): order t log t even for all-even demands with private terminal leaves.
* [Signed supply edges and shared terminals](SIGNED-EXTENSION.md).
* [Research issue #1012](https://github.com/1337isnot1337/solved-conjectures/issues/1012).

The proof draft passed an independent AI mathematical re-read. This is not human refereeing or a claim about Chen’s separate moving-core question. No Lean formalization is included.
