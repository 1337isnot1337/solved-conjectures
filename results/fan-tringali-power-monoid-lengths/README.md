# Fan–Tringali’s power-monoid length-set conjecture

Lean formalization is **incomplete**. The checked [Boolean-box classification](../../lean/Conjectures/FanTringaliBasic.lean) is uniform in the finite coordinate set and includes atom and factorization-length classification. The checked [local gadget](../../lean/Conjectures/FanTringaliGadget.lean) proves unique horizontal and vertical quotients and excludes every square quotient. See [scope and remaining work](LEAN.md) and the [verification receipt](../../docs/verification/lean-fan-tringali-20261124-162051/receipt.json).

**Proved.** Every nonempty finite subset of the integers at least two is a length set in the power monoids in the original conjecture. In the reduced setting, the same construction prescribes the multiplicity of each length.

A finite grid gadget makes all atomic factorizations correspond to the maximal cliques of a graph. Encoding the grid in a sufficiently large radix preserves the factorizations and their atom status.

- [Complete proof and transfers](PROOF.md)
- [Independent audit](AUDIT.md)
- [Exact graph gadget checker](check.py)
- [Discovery issue #414](https://github.com/1337isnot1337/solved-conjectures/issues/414)
