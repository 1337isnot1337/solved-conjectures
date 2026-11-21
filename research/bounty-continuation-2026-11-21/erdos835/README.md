# Erdős 835: coloring constraints and their limits

21 November 2026. Coordination: [issue 236](https://github.com/1337isnot1337/solved-conjectures/issues/236). Completed bounty targets from this investigation: zero.

## Exact target

Does there exist an integer k>2 such that

```math
\chi(J(2k,k))=k+1?
```

The vertices are the k-subsets of a 2k-element ground set. Two vertices are adjacent when they differ by exchanging one element. The question asks for a proper coloring with k+1 colors. A positive answer requires one full coloring for some k>2; a negative answer must exclude every k>2.

The [Conjectures.io target](https://conjectures.io/problems/erdos835-erdos-835) offers a solver-directed token reward, with a changing dollar estimate. Its exact Lean task and current acceptance conditions are documented in the [target and prior-work audit](target-and-local-compatibility.md). No proof has been submitted, accepted for an award, or paid here.

Ma and Tang already exclude composite k+1. The earlier public research notes give the Steiner-partition formulation, complement symmetry, exact pair counts, and feasible pair moments. Those results are credited in both notes below. No new full solution or priority claim follows from this work.

## Reviewed deductions

| Note | Proved scope | Remaining gap |
| --- | --- | --- |
| [Local compatibility](target-and-local-compatibility.md) | A coloring of the radius-two Johnson ball is equivalent to a Latin square and a common array satisfying simultaneous row-pair and column-pair one-factorization conditions. Each single color can satisfy its matching conditions separately. Keevash's theorem supplies every individual fixed-width window for sufficiently large admissible prime parameters. | The independently constructed colors need not partition the same array. A coloring of one ball or one fixed-width window is not a coloring of the full graph. |
| [Cubic feasibility barrier](erdos835-cubic-feasibility-barrier.md) | The symmetrized cubic tensor is uniquely forced and has an exact hyperdeterminant coefficient formula. The specified one-vertex-conditioned linear-indicator covariance matrices are positive semidefinite for every even k≥2. All five three-vertex color-equality probabilities are nonnegative for every even k≥14. | These necessary conditions remain feasible and therefore yield no contradiction in that range. They do not supply a joint coloring distribution or establish feasibility of every higher-order semidefinite relaxation. |

The cubic result is proved uniformly. Its finite checks only audit the normalizations and algebra. It does not count as a solution of any new parameter case or of the existential bounty target.

## Verification

The coordinator independently checked the moment normalization, harmonic lift, operator eigenvalues, conditional covariance blocks, uniform sign estimates, and short-distance geometry split. Another worker independently checked the geometry and sign calculations. The local compatibility note also received two independent written reviews.

The [symbolic verifier](verify_erdos835_cubic_barrier.py) compares the projector tensor and coefficient formula on 245 small triple orbits, derives all four exceptional-geometry coefficient polynomials symbolically, and checks the two uniform polynomial estimates and six hyperdeterminant derivations. Its [exact output](erdos835-cubic-barrier-verification.json) records the scope. Run it from this directory with Python 3 and SymPy. It imports [the hyperdeterminant helper](check_erdos835_hyperdet.py). The [direct projector diagnostic](check_erdos835_cubic.py) is also retained for reproducibility.

No Lean verification or completed proof of the full conjecture is claimed.
