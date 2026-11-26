# Heim–Neuhauser–Tröger’s plane-partition polynomial Turán conjecture

**Proved.** The plane-partition polynomials satisfy the strict Turán inequality at every index $n\ge12$ and every real parameter $x\ge1$, as asserted in [Conjecture 2](https://doi.org/10.1007/s00026-022-00604-4). The specialization $x=1$ was already known.

A Fourier sign comparison proves the large-index range uniformly. Exact rational boxes cover the entire continuous saddle-parameter interval, and integer coefficient checks handle the remaining indices. No sampling assumption is used.

- [Lean theorems and verification receipt](FORMALIZATION.md)
- [Complete proof and reproduction instructions](PROOF.md)
- [Source and independent audit](AUDIT.md)
- [Exact Fourier certificate](heim-neuhauser-fourier-certificate.py)
- [Exact finite polynomial certificate](heim-neuhauser-plane-partition-check.py)
- [Discovery and review, issue #388](https://github.com/1337isnot1337/solved-conjectures/issues/388)

The written proof uses exact arithmetic. Lean verifies the inequality throughout the stated real-parameter and index ranges. External refereeing remains open.
