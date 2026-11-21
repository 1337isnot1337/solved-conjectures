# Horňák–Woźniak conjecture

Both conjectures in §4 of Horňák and Woźniak's *On arbitrarily vertex decomposable trees* hold. Every tripod passing their arithmetic admissibility tests admits a partition into connected pieces of any prescribed sizes. A four-arm tree with a one-edge arm has the same property whenever both its arm sequence and the remaining tripod's sequence pass the tests. [Original conjectures](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Journal article](https://doi.org/10.1016/j.disc.2007.04.008)

An [explicit construction](EXISTENCE.md) gives both kinds of decomposable trees for every prescribed shortest regular arm, answering two further questions from the authors’ 2010 problem collection.

The proof treats the first and last feasible counts of the larger part in the two-consecutive-size reduction. It also shows that three of the five admissibility tests suffice.

[Proof](PROOF.md) · [Literature check](NOVELTY.md) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/67)

**Lean status:** partial. [`HornakRegularSource.lean`](../../lean/Conjectures/HornakRegularSource.lean) proves the regular and exceptional graph cases from source tests 1, 2 and 5. [`HornakLargeReduction.lean`](../../lean/Conjectures/HornakLargeReduction.lean) and [`HornakLargeSource.lean`](../../lean/Conjectures/HornakLargeSource.lean) prove every tripod partition whose parts exceed a positive shortest arm from tests 1 and 5 within the original finite index range; [`HornakRange.lean`](../../lean/Conjectures/HornakRange.lean) handles larger indices directly. The next-modulus upper-endpoint carry bound is proved in [`HornakAdmissibleRange.lean`](../../lean/Conjectures/HornakAdmissibleRange.lean). [`HornakCoarsen.lean`](../../lean/Conjectures/HornakCoarsen.lean) also proves refinement when discarded central pieces fit the otherwise unused shortest arm. The small-part and four-arm reductions, admissibility index ranges, existence constructions and combined gate remain. Strict compilation, an 878-theorem full-chain axiom audit and isolated kernel replay passed.

The standard-library check compares the arithmetic tests to direct partition searches on small trees and checks the local transfer by direct bin allocation. It also checks the admissibility of instances from the explicit construction.

```bash
python3 results/hornak-wozniak/verify.py
```

An optional symbolic cross-check uses `z3-solver` to test the two local endpoint implications as linear integer formulas. The written proof establishes the implications directly.

```bash
python3 results/hornak-wozniak/verify_symbolic.py
```
