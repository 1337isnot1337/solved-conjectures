# Erdős–Galvin–Hajnal’s Shelah-graph avoidance problem

**Relative to the consistency of ZFC, the existence statement is independent over ZFC with GCH.**

[Original Problem 4](https://www.renyi.hu/~p_erdos/1975-24.pdf) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/1037)

Erdős, Galvin and Hajnal asked whether ZFC proves, or CH implies,
that some graph of size and chromatic number $`\aleph_1`$ contains
no Shelah graph. Neither implication holds: the original authors
give a positive example under $`V=L`$, and in the GCH model of
Avraham, Devlin and Shelah every such graph avoiding Shelah graphs
is countably colorable.

The proof converts the avoidance condition into a partition into
countably many Hajnal–Máté-type induced graphs. The cited 1978
consistency theorem then applies to each part. The new contribution
is the reduction and its application to the original, broader
avoidance question, not either of the forcing constructions used
in the proof.

Cinna Davis supplied the club decomposition and applied it to the 1975 problem. An independent internal reviewer checked the argument. There is no Lean formalization or external referee report.

- [Proof](PROOF.md)
- [Independent review and reproducible checks](REVIEW.md)
- [Prior-art audit](PRIOR-ART.md)
- [Induced dichotomy and stationary partition consequence](CONSEQUENCES.md)
