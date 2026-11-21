# Boyer main enigma 2: general order-five bimagic square

Research started 2026-11-21. No solution, award acceptance, or payment is claimed.

## Exact target and printed reward

Find 25 pairwise distinct positive integers `a[i,j]`, `0 <= i,j < 5`, and constants `S,T` such that every row, every column, and both main diagonals have sum `S` and sum of entry-squares `T`. A complete proof that no such array exists also meets the mathematical target.

Christian Boyer's [2010 prize announcement](https://plus.maths.org/comment/8496), main enigma 2, offers the first solver €1,000 and a bottle of champagne. This is a fixed existence problem, not a request for a numerical record improvement. The printed reward goes to the solver. The original `multimagie.com/English/Enigmas.htm` page repeatedly timed out during source checks. Current willingness to honor the old offer has not been independently established. No sponsor contact, email, or submission has been made.

## Prior work and coordination

[Ajai Choudhry, arXiv:2610.00915v1](https://arxiv.org/html/2610.00915v1), submitted 1 October 2026, explicitly leaves the existence of a general order-five bimagic square open. Its new families concern other orders and do not settle this target. This is stronger status evidence than old prize catalogs, though it does not rule out an unindexed later solution.

The campaign's live GitHub issue searches for `Boyer`, `Okhotin`, and `magic square` initially returned no reserved target. The root coordinator confirmed no campaign reservation. Another agent owns Boyer enigma 6a, the order-six additive–multiplicative target; that work is separate.

## Exact algebraic approach and completed partial result

Affine changes `a -> u*a+v`, with rational `u != 0`, preserve equal line sums and equal squared line sums. Consequently a rational example with distinct entries can be scaled and shifted to a positive integer example. Conversely a positive integer example is rational. Positivity is therefore not the main construction obstacle.

Subtracting `S/5` makes every row, column, and main diagonal sum zero. The array then belongs to a rational linear subspace of the 25-dimensional matrix space. Equal squared line sums impose homogeneous quadratic equations. The research route is exact parameterization and algebraic elimination on this system, with complete pairwise-distinctness checks for any proposed rational point. Restricted families will not be counted as resolving the full problem.

The completed work analyzes the sufficient construction `A=Q-J/5`, where Q is rational orthogonal and fixes the all-ones vector. It proves that the determinant-positive branch with the required trace is symmetric and therefore repeats entries. In the determinant-negative branch it completely excludes one rational centralizer orbit of a four-cycle permutation, including all four orthogonal components and both projective parameter boundaries. The 16 surviving parameter points produce eight permutation matrices; the corresponding centered integer arrays have only two distinct entries. A separately checked permutation enumeration, transposition, and an immediate symmetry obstruction extend the exclusion to every permutation seed in this construction. No qualifying example was obtained.

- `orthogonal-reduction.md`: algebraic construction, determinant restriction, and scope.
- `centralizer-exclusion.md`: complete exact exclusion of the selected orbit.
- `centralizer_elimination.py` and `centralizer-b0*.json`: symbolic matrix checks, polynomial factors, and resultants for all four components.
- `verify_centralizer_points.py` and `centralizer-point-verification.json`: exact rational replay of all 16 surviving points.
- `centralizer-b2.json`: an additional rotation-component calculation; this seed lies in the same full centralizer-permutation orbit and is not a separate result.
- `permutation_seed_orbits.py` and its JSON output: the root coordinator's exhaustive permutation-seed classification used in the restricted corollary.
- `independent-review.md`: the separate agent's review, including regenerated matrix polynomials, independently factored resultants, every projective chart, and direct evaluation of all surviving points.

The independent review found no algebra error in these restricted results. It does not certify the original conjecture or any award. `final_checkpoint.json` records the final scope, counts, and file hashes. Every computation in this directory has completed.

An initial direct associated-matrix attempt was not conclusive. Centering and imposing `A[i,j]=-A[4-i,4-j]` leaves eight linear parameters; the squared-line conditions give coupled quadratic equations. A direct Groebner basis calculation produced large higher-degree expressions without a useful rational classification. An exploratory unit-circle parameterization also produced a degree-16 elimination factor but was not developed into a rational-point classification. These calculations were not used in the completed proof above and are not evidence against the full target.

The complete Boyer problem remains unsolved in this work. No award acceptance or payment is claimed.

## Discovery exclusions

- Kimberling's current rewards page changes post-1-January-2025 payments to donations to OEIS. These fail the user's direct-payment condition; repository issue 217 already discusses this family. [Sponsor source](https://faculty.evansville.edu/ck6/integer/unsolved.html).
- Nanongkai's [live Open € page](https://sites.google.com/site/dannanongkai/open) now marks the €5 questions **Discontinued** and the cut-query problem **Solved**. The July 2026 Prize Problem Ledger entries are stale on these points. The description-size question is not a currently payable target.
- The printed Boyer offer remains an eligibility uncertainty, not a guarantee of payment. This directory records mathematical work on that posted offer without asserting present organizer acceptance.
