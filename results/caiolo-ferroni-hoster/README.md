# Caiolo–Ferroni–Hoster conjecture

Complete proposed disproof of [Conjecture 7.3](https://arxiv.org/html/2605.28474v1#S7.SS2) and its accompanying augmented real-rootedness assertion. For every prime power q ≥ 17, a simple rank-five matroid constructed by hyperplane coalescence has a dual Chow polynomial with no real roots and a dual right augmented polynomial with exactly one real root, at -1. The proof credits Bérczi–Coron–Eur–Li's original construction method and applies the dual gamma identity of Caiolo–Ferroni–Hoster.

- [Complete proof](PROOF.md)
- [Lean theorem](../../lean/Conjectures/CaioloFerroniHoster.lean)
- [Lean review and replay](LEAN_REVIEW.md)
- [Exact verifier](verify_counterexample.py)
- [Exact rank threshold (supplement)](RANKS.md), with [Lean theorem](../../lean/Conjectures/CaioloFerroniHosterRanks.lean) and [exact checks](verify_ranks.py)
- [Internal mathematical and source audit](AUDIT.md)
- [Discovery and attribution: issue #111](https://github.com/1337isnot1337/solved-conjectures/issues/111)

Run `python3 verify_counterexample.py` with SymPy 1.14.0 installed. Both exact recursions and the symbolic sign certificate passed. Lean verifies the full family, including the matroid and its two dual polynomials. The result is internally reviewed but unrefereed; priority is not asserted. The two related assertions count as one result. The supplement proves that dual Chow real-rootedness holds for all matroids of rank r exactly when r ≤ 4.
