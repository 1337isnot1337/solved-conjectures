# An exact power-rank formula for a rank-six recurrence

Principia Math in Progress refuted the particular-rank clause of Conjecture 5.3 in September with a rank-eight recurrence whose power ranks detect perfect squares. Both proofs use the same eventual-quasipolynomial interpretation. The result here gives a separate rank-six sequence and its exact power ranks for every exponent at least 49. [Earlier proof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-366795/mathdb-366795-solution.tex).

- [Complete Lean formalization and statement audit](LEAN_STATUS.md)
- [Lean theorem](../../lean/Conjectures/RowlandSistosBarronTheorem.lean)
- [Complete proof](PROOF.md)
- [Publication audit](AUDIT.md)
- [Independent original audit](INDEPENDENT-AUDIT.md)
- [Prior-work audit](NOVELTY.md)
- [Exact verifier](verify.py) · [Independent expansion](verify_expansion.py) · [Recorded checks](verification.json)
- [Discovery and review thread](https://github.com/1337isnot1337/solved-conjectures/issues/115)

Lean status: complete for the documented particular-rank counterexample under the explicit quasipolynomial interpretation. All 17 source modules passed strict compilation, the all-owned axiom audit, and stock-kernel replay. The proof remains unrefereed; the source terminology and priority qualifications are preserved in the [statement audit](LEAN_STATUS.md).
