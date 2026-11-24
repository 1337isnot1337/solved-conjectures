# Publication audit — 2026-11-24

**Mathematical review: pass for the exact stated scope.**

Re-read Sections 2 and 5 of the original preprint. The tail-recurrence rank is the sum of exponential-polynomial degrees plus one. Verified the bivariate coefficient identity and least admissible r by residue modulo three and by the upper tail. Krawtchouk K₁ and K₂ zeros give exactly one parity loss and two square losses; the K₄ and K₅ factorizations restore the next admissible degree for M≥49, with the necessary boundary ranges satisfied. Thus the bounded square indicator would be eventually periodic if the rank were eventually quasipolynomial, which is impossible. Replayed verify.py (blob 7808faf611fe56c67b9ad485fda6c4374b45cedc) through M=100, including all degree checks from 49 and modular recurrence checks from 1 to 8; all passed. Prior independent audit and recorded longer run are retained. The source does not define pseudo-polynomial; Stanley's standard synonym supports the interpretation, but author confirmation is not claimed. Earlier fixed-rank and general-rank results are credited and excluded from new counts.

Source: Rowland–Sistos Barrón, *Complexity of powers of a constant-recursive sequence*, [arXiv:2501.14643v1](https://arxiv.org/html/2501.14643v1), Conjecture 5.3, particular-rank clause.

Research provenance: [original proof](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/rowland-sistos-barron/PROOF.md), original blob `16e4d26787097f1d22dbc0d59d09e7336922e35b`; [issue #115](https://github.com/1337isnot1337/solved-conjectures/issues/115). Earlier review receipts remain in the source note or companion audit. No Lean verification or external referee acceptance is asserted.
