# Horňák–Woźniak conjecture

Both conjectures in §4 of Horňák and Woźniak's *On arbitrarily vertex decomposable trees* hold. Every tripod passing their arithmetic admissibility tests admits a partition into connected pieces of any prescribed sizes. A four-arm tree with a one-edge arm has the same property whenever both its arm sequence and the remaining tripod's sequence pass the tests. [Original conjectures](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Journal article](https://doi.org/10.1016/j.disc.2007.04.008)

An [explicit construction](EXISTENCE.md) gives both kinds of decomposable trees for every prescribed shortest regular arm, answering two further questions from the authors’ 2010 problem collection.

The proof treats the first and last feasible counts of the larger part in the two-consecutive-size reduction. It also shows that three of the five admissibility tests suffice.

[Proof](PROOF.md) · [Literature check](NOVELTY.md) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/67)

**Lean status:** partial. [`HornakGraph.lean`](../../lean/Conjectures/HornakGraph.lean) defines the actual star-like graph and connected partitions, proves connectivity and localizes center-free connected pieces to one arm. [`HornakPacking.lean`](../../lean/Conjectures/HornakPacking.lean) and [`HornakMaximum.lean`](../../lean/Conjectures/HornakMaximum.lean) prove the exact ceiling-cost formula and total two-size packing criterion, construct the finite maximum, and prove its one-step budget bound and the transfer to fewer larger pieces. The graph realization of allocations, endpoint arguments, cited reductions and existence constructions remain. Strict compilation, an 82-theorem axiom audit and isolated stock-kernel replay passed; the combined repository gate is pending.

The standard-library check compares the arithmetic tests to direct partition searches on small trees and checks the local transfer by direct bin allocation. It also checks the admissibility of instances from the explicit construction.

```bash
python3 results/hornak-wozniak/verify.py
```

An optional symbolic cross-check uses `z3-solver` to test the two local endpoint implications as linear integer formulas. The written proof establishes the implications directly.

```bash
python3 results/hornak-wozniak/verify_symbolic.py
```
