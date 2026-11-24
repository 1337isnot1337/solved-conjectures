# Lean coefficient certificate

`lean/Conjectures/KauersKoutschanCertificate.lean` reproduces the exact rational polynomial operations in `verify.py` for both operators, with all six initial components independent, both parity classes and the four initial indices. It checks coefficient vectors (not sampled values of the polynomial variable).

- Lean 4.35.0, strict warning-as-error source check: exit 0.
- Source SHA-256: `b98df1fadf7b14633466a46282834597bc27a137c38ff040dec71a4c5c1a2745`.
- All six theorem declarations use only `propext`, `Classical.choice`, `Quot.sound`. The decisions are kernel reductions (`decide +kernel`).

Scope: the finite algebraic certificate, not yet the evaluation-homomorphism bridge, the all-index derivation of the moment recurrence, or the equality with the original permutation count. The full conjecture is not claimed Lean-verified. Project build and independent compiled-module replay remain pending.
