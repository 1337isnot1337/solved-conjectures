# Horňák–Woźniak conjecture

Both conjectures in §4 of Horňák and Woźniak's *On arbitrarily vertex decomposable trees* hold. Every tripod passing their arithmetic admissibility tests admits a partition into connected pieces of any prescribed sizes. A four-arm tree with a one-edge arm has the same property whenever both its arm sequence and the remaining tripod's sequence pass the tests. [Original conjectures](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Journal article](https://doi.org/10.1016/j.disc.2007.04.008)

An [explicit construction](EXISTENCE.md) gives both kinds of decomposable trees for every prescribed shortest regular arm, answering two further questions from the authors’ 2010 problem collection.

The proof treats the first and last feasible counts of the larger part in the two-consecutive-size reduction. It also shows that three of the five admissibility tests suffice.

[Proof](PROOF.md) · [Literature check](NOVELTY.md) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/67)

**Lean status:** partial. [`HornakGroupGraph.lean`](../../lean/Conjectures/HornakGroupGraph.lean) proves every positive tripod partition containing a part larger than the positive shortest arm from source tests 1 and 5 in the original finite index range; it groups small parts and refines a realizable coarse partition. [`HornakRegularSource.lean`](../../lean/Conjectures/HornakRegularSource.lean) also proves the regular and exceptional graph cases from tests 1, 2 and 5. The case where every part is at most the shortest arm, the four-arm reduction, existence constructions and combined gate remain. Strict compilation, a 910-theorem full-chain axiom audit and isolated kernel replay passed.

The standard-library check compares the arithmetic tests to direct partition searches on small trees and checks the local transfer by direct bin allocation. It also checks the admissibility of instances from the explicit construction.

```bash
python3 results/hornak-wozniak/verify.py
```

An optional symbolic cross-check uses `z3-solver` to test the two local endpoint implications as linear integer formulas. The written proof establishes the implications directly.

```bash
python3 results/hornak-wozniak/verify_symbolic.py
```
