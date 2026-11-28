## Real-rootedness in lattices of flats

**Chow polynomials** encode combinatorial information about ranked posets, including lattices of flats of matroids. Caiolo, Ferroni and Hoster conjectured that the dual Chow polynomial of the characteristic kernel is real-rooted for every matroid. They also predicted real-rootedness for the dual right augmented polynomial. The claims are Conjecture 7.3 and its accompanying expectation in the original paper. [Caiolo–Ferroni–Hoster](https://arxiv.org/html/2605.28474v1#S7.SS2)

## The rank-five test case

A **matroid flat** is a closed set for matroid closure. The flats form a lattice ordered by inclusion, and each flat has a rank. In a rank-five matroid, every chain from the bottom to the top is described by some decreasing list of internal ranks from $4,3,2,1$ when traversed downward. Each polynomial is a sum over those lists. The term for a list multiplies its flag count by a product of signed geometric sums in the rank gaps. The two products differ in the first gap from the top. [Propositions 4.6–4.7](https://arxiv.org/html/2605.28474v1#S4)

## Formalization target

For each prime power $q\ge17$, take a field $F$ of size $q$ and a degree-four extension $K$. On the disjoint union of the one-dimensional $F$-subspaces of $K\times K$ and a copy of the underlying set of $K$, exhibit a simple matroid of rank five. Its dual Chow polynomial has degree four and is positive everywhere on the real line. Its dual right augmented polynomial has degree five and has the single real root $-1$, which is simple. In particular, neither polynomial splits over $\mathbb R$.

## Existing proof and platform scope

The repository gives a written proof and a Lean proof of this counterexample family. The mission imports the exact theorem statement and its rank-five polynomial definitions into the Prove2Me environment. The construction adapts Bérczi, Coron, Eur and Li’s hyperplane-coalescence method to the dual invariants. The certificate must track how those hyperplanes change the flag counts and certify real-root behavior across the entire prime-power family. [Written proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/caiolo-ferroni-hoster/PROOF.md) · [Lean theorem](https://github.com/1337isnot1337/solved-conjectures/blob/main/lean/Conjectures/CaioloFerroniHoster.lean)

The payload uses Mathlib matroids, extended rank, finite fields and real polynomials. Flat flags are counted on the finite ground type in the theorem. The exact rank threshold and the ordinary inverse Kazhdan–Lusztig supplement have separate statements in the source record. [Result record](https://github.com/1337isnot1337/solved-conjectures/tree/4207a936b7bc1b722ad3f8d1b0fa090e8763b048/results/caiolo-ferroni-hoster)

## Selected references

- Giovanni Caiolo, Luis Ferroni and Elena Hoster, *Dual Chow polynomials of matroids and posets*, 2026. [arXiv:2605.28474v1](https://arxiv.org/abs/2605.28474v1)
- Gergely Bérczi, Basile Coron, Christopher Eur and Shiyue Li, *Chow polynomials and chain polynomials of matroids are not log-concave*, 2026. [arXiv:2610.17135v1](https://arxiv.org/abs/2610.17135v1)
- If you use this result, please credit the authors named in the result record and cite the original conjecture, the [project homepage](https://itsdavis.com/), and the [specific proof or result record](https://github.com/1337isnot1337/solved-conjectures/tree/4207a936b7bc1b722ad3f8d1b0fa090e8763b048/results/caiolo-ferroni-hoster) you used.
