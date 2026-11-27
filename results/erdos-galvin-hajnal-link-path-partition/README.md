# Erdős–Galvin–Hajnal’s link-path partition problem

Erdős, Galvin and Hajnal asked whether ZFC proves that a triple system on the first uncountable ordinal can avoid the three-edge tight path and still have no uncountable independent set.

Cinna Davis gives a negative answer to that provability question, relative to the consistency of ZFC. In one model every triple system avoiding the path has a countable proper coloring. The counterexample under the continuum hypothesis comes from the original 1975 paper. The new step encodes every edge of the triple system by a collision in a bounded coloring of vertex pairs.

The written proof passed an independent mathematical review within the repository. It has no Lean formalization or external referee report.

- [Proof of both consistency directions](PROOF.md)
- [Primary statements and priority audit](PRIOR-ART.md)
- [Independent review](REVIEW.md)
- [Finite-shadow transfer and its sharp load estimate](SHADOW-TRANSFER.md)
- [Finite encoding checks](verify_encoding.py)

The [companion density theorem](density/) gives the six-point rainbow criterion and both possible asymptotic constants at the first uncountable ordinal. Its [higher-cardinal extension](density/REGULAR-HOSTS.md) gives the corresponding conditional limits at successors of infinite regular cardinals.
