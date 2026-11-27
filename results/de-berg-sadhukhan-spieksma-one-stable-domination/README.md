# de Berg–Sadhukhan–Spieksma’s one-stable domination conjecture

**Proved.** A deterministic algorithm maintains an
order-optimal linear-in-arrival-degree approximation for
minimum dominating set while adding at most one vertex per
arrival. It never deletes and does not need to know the
degree bound in advance. The result covers every prefix of
every vertex-arrival stream in the authors’ model.

- [Proof](PROOF.md)
- [Source and novelty audit](SOURCES.md)
- [Generic hitting-set lemma and weighted boundary](EXTENSIONS.md)
- [Exhaustive small-prefix check](verify.py)
- [Discovery and review issue #995](https://github.com/1337isnot1337/solved-conjectures/issues/995)

Lean status: none. This is a written proof with a finite
regression test for the algorithm and its accounting.

- [Independent mathematical review](REVIEW.md)
