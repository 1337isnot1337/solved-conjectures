# Bétermin’s FCC/BCC cold-spot conjecture

For every positive Gaussian scale, the translations minimizing the Gaussian lattice sum of FCC or BCC are exactly the deep holes (points farthest from the lattice). This proves the geometric assertion in [Bétermin’s Remark 5.10](https://doi.org/10.1007/s00365-019-09494-x).

The printed BCC coordinate needs correction: in unscaled cubic coordinates a deep hole is `(1/2, 1/4, 0)`, not `(1/2, 1/2, 0)`. The same proof classifies all minimizing translations of the checkerboard lattices and their duals in every dimension at least three. It does not optimize over lattice shapes.

The BCC case also gives the all-parameter result for the dual type-A lattice in rank three. A separate theta-product argument proves the entire dual type-A family. [All-rank theorem](../../docs/research-results/dual-a-universal-cold-spots/README.md)

- [Complete proof](PROOF.md)
- [Primary sources, priority, and independent audit](AUDIT.md)
- [Supplementary finite diagnostics](verify.py)
- [Discovery and review, issue #371](https://github.com/1337isnot1337/solved-conjectures/issues/371)

The proof does not use numerical testing. Internally reviewed; not Lean-formalized or externally refereed.
