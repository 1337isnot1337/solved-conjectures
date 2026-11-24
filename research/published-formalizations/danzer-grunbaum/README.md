# Danzer–Grünbaum’s conjecture

Published-resolution formalization, not a new discovery. [Tracking issue #525](https://github.com/1337isnot1337/solved-conjectures/issues/525). Campaign started 2026-11-24 15:25 UTC.

## Sources and exact scope

L. Danzer and B. Grünbaum, *Über zwei Probleme bezüglich konvexer Körper von P. Erdös und von V. L. Klee*, Math. Z. 79 (1962), 95–99, [author archive](https://faculty.washington.edu/moishe/branko/BG31.Zwei%20Probleme.pdf). The acute-set conjecture is the bound of 2d−1 points in Euclidean dimension d≥2, with all angles determined by triples of distinct points strictly acute. This is separate from their true result that a non-obtuse set has at most 2^d points.

P. Erdős and Z. Füredi, *The Greatest Angle Among n Points in the d-Dimensional Euclidean Space*, 1983, pp. 275–283, [DOI](https://doi.org/10.1016/S0304-0208(08)73398-X), gave the original exponential-size disproof (Theorem 2.2).

We formalize the explicit later construction of V. Harangi, *Acute Sets In Euclidean Spaces*, SIAM J. Discrete Math. 25 (2011), Example 4.1, [DOI](https://doi.org/10.1137/100808095), [author PDF](https://www.renyi.hu/~harangi/papers/acute.pdf), equations (7)–(10). Use his parameters ε₁=1/100, ε₂=2/100, ε₃=3/100 and uniformly scale by 100. The resulting integer vectors are

    (100,0,0,1), (-100,0,0,1), (0,100,0,2), (0,-100,0,2),
    (0,0,100,3), (0,0,-100,3), (40,40,40,100), (-40,-40,-40,100).

The exact dot-product predicate is positive for all 336 ordered triples of distinct points; minimum integer dot product is 1. All eight points are distinct. Casting to real coordinates preserves these strict inequalities. In dimension four this contradicts 8 ≤ 7, so the full universal bound is false. No claim to determine the optimal cardinality for dimension four or to formalize Erdős–Füredi's stronger exponential lower bound.

## Audit plan

An injective enumeration indexed by Fin m represents precisely a finite set of m points. The strict positivity of the coordinate dot product at the middle point is equivalent to an acute Euclidean angle. All three indices must be distinct. The final statement quantifies over all d≥2 and all finite acute sets, rather than only d=4.

Bounded searches on 2026-11-24 of repository issues and code, Mathlib, FormalConjectures, Lean Pool and web sources did not identify a completed proof of this specific acute-set disproof. The distinct true non-obtuse theorem has a formalization. Priority and completeness of the search are not guaranteed.

**Status:** complete candidate source written; Lean compilation, axiom audit, independent kernel replay and accepted-package integration are pending. No verification credit yet.
