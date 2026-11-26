# Tom–Vailaya’s weighted trace conjecture

Complete proposed proof of [Conjecture 74](https://doi.org/10.37236/14403) for every natural unit interval graph on at least two vertices. Gluing its first and last vertices gives a directed multigraph. Its ascent-weighted chromatic quasisymmetric function equals the trace of the published forest-triple matrix, with every arc counted, including both arcs of a digon.

A single finite color basis identifies these matrices by testing endpoint gluings with cliques and paths. The result extends the existing trace identity from the ordinary chromatic symmetric function to the full ascent parameter. It does not assert that the trace has nonnegative elementary coefficients or resolve Ellzey’s conjecture.

- [Complete written proof](PROOF.md)
- [Source and review record](AUDIT.md)
- [Lean scope and receipt](FORMALIZATION.md)
- [Independent exact-arithmetic check](verify.py)
- [Discovery and review thread](https://github.com/1337isnot1337/solved-conjectures/issues/338)

Replay the supplementary check from the repository root:

    python3 results/tom-vailaya-weighted-trace/verify.py

The computation is supplementary to the internally reviewed written proof. Lean verifies the color-matrix trace, endpoint gluing product and path-edge transfer. The forest-triple identification is written and external refereeing is pending.
