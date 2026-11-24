# Benfield–Lippard’s stable Waring-gap symmetry conjecture

**Disproved.** Conjecture 10.1 predicts reflection symmetry of the stable exception set whenever the exponent is a power of two. Exponents 64 and 128 both have a strictly positive symmetry defect. This also refutes the authors’ intended finite-domain version of Conjecture 10.2.

The proof identifies the entire stable exception monoid in each counterexample, not a finite range of tested offsets. A small exact arithmetic certificate and a separate Apéry-set argument verify the defects.

- [Proof and exact certificate](PROOF.md)
- [Independent audit](AUDIT.md)
- [Discovery issue #398](https://github.com/1337isnot1337/solved-conjectures/issues/398)

The [parity conjecture](../benfield-lippard-waring-gap-parity/) is separate. No claim is made about the asymptotic ratio.

## Lean status

**Incomplete.** [Checked partial formalization and verification receipt](LEAN.md). The full stable-gap identification and genus/Frobenius formulas remain unformalized.
