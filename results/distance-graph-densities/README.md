# Distance graphs with three missing differences

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

Carraher et al., arXiv Conjecture 38 proved for all admissible parameters. Conjecture 39 fails for every `k=50,59,68,…`. The [corrected formula](CLASSIFICATION.md) gives all densities for gaps five and seven.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
c++ -std=c++20 -O3 results/distance-graph-densities/verify.cpp -o /tmp/verify-distance-graphs
/tmp/verify-distance-graphs
python3 results/distance-graph-densities/counterexample.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

The complete real character-value formulas for gaps five and seven have passed source, standard-axiom and independent kernel checks for every positive parameter. The connection to the extremal density theorem remains a separate integration step. See [the status report](../../docs/lean-status.md) for checked scope and remaining dependencies.

## Supporting files

- [`CLASSIFICATION.md`](CLASSIFICATION.md)
- [`counterexample.py`](counterexample.py)
- [`verify.cpp`](verify.cpp)
