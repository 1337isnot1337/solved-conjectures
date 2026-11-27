# Chen’s parity-free exact-one-marker conjecture

**Status:** Proved.

For any undirected supply graph with arbitrarily many paired
terminals, either there are as many prescribed-pair paths as
requested, using each vertex at most twice, or a vertex set
of bounded size hits all such paths. The bound is independent
of the size of the host graph and the number of demands.

This resolves the first question in Chen’s Problem 6.5. The
separate [prescribed-parity question](https://github.com/1337isnot1337/solved-conjectures/issues/1012)
remains open. No Lean formalization was performed.

- [Proof](PROOF.md)
- [Fractional multicut lemma](FRACTIONAL-MULTICUT.md)
- [Sources and scope](SOURCES.md)
- [Independent review](REVIEW.md)
- [Residual-flow replay](verify.py)
