# Alexandersson’s parking-function excedance conjecture

**Refuted.** The excedance enumerator of parking functions of length 17 is not real-rooted. This disproves the unrestricted claim in [Alexandersson’s 2026 open-problem list](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) that these polynomials are real-rooted and consecutively interlacing.

A counting recurrence produces the coefficients exactly. At `t = −1/5`, the polynomial violates the Laguerre inequality required of any real-rooted polynomial. A separate counting recurrence agrees on the coefficients. Neither method estimates roots numerically.

- [Proof and rational certificate](PROOF.md)
- [Attribution, source search, and independent audit](AUDIT.md)
- [Exact checker](verify.py)
- [Discovery and review, issue #106](https://github.com/1337isnot1337/solved-conjectures/issues/106)

Run `python3 results/alexandersson-parking-excedance/verify.py` from the repository root. Internally reviewed computer-assisted disproof; not Lean-formalized or externally refereed.
