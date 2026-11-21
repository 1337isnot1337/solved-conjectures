# Horňák–Woźniak conjecture

Both conjectures in §4 of Horňák and Woźniak's *On arbitrarily vertex decomposable trees* hold. Every tripod passing their arithmetic admissibility tests admits a partition into connected pieces of any prescribed sizes. A four-arm tree with a one-edge arm has the same property whenever both its arm sequence and the remaining tripod's sequence pass the tests. [Original conjectures](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Journal article](https://doi.org/10.1016/j.disc.2007.04.008)

An [explicit construction](EXISTENCE.md) gives both kinds of decomposable trees for every prescribed shortest regular arm, answering two further questions from the authors’ 2010 problem collection.

The proof treats the first and last feasible counts of the larger part in the two-consecutive-size reduction. It also shows that three of the five admissibility tests suffice.

[Proof](PROOF.md) · [Literature check](NOVELTY.md) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/67)

**Lean status:** partial. [`HornakEndpoint.lean`](../../lean/Conjectures/HornakEndpoint.lean) proves the regular two-consecutive-size case for actual star graphs from the residue bounds and fifth-test witness. The exceptional-piece construction now includes the rho-zero, rho-one and rho-two largest-count endpoints under their stated endpoint equations, residue conditions and fifth-test input; see [`HornakChooseArm.lean`](../../lean/Conjectures/HornakChooseArm.lean), [`HornakCarries.lean`](../../lean/Conjectures/HornakCarries.lean) and [`HornakRhoTwo.lean`](../../lean/Conjectures/HornakRhoTwo.lean). Derivation of these hypotheses, the smallest-count endpoint, full source-test and AVD reductions, and existence constructions remain. Strict compilation, a 396-theorem axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

The standard-library check compares the arithmetic tests to direct partition searches on small trees and checks the local transfer by direct bin allocation. It also checks the admissibility of instances from the explicit construction.

```bash
python3 results/hornak-wozniak/verify.py
```

An optional symbolic cross-check uses `z3-solver` to test the two local endpoint implications as linear integer formulas. The written proof establishes the implications directly.

```bash
python3 results/hornak-wozniak/verify_symbolic.py
```
