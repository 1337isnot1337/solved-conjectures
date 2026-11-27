# Source, proof, and verification audit

## Exact target and priority

This is Conjecture 6 of Wayne Barrett, Emily Evans, H. Tracy Hall and Mark Kempton, *New conjectures on algebraic connectivity and the Laplacian spread of graphs*, Linear Algebra and its Applications 648 (2022), 104–132. [Journal article](https://doi.org/10.1016/j.laa.2022.04.021) · [Original preprint, conjecture and equality remark](https://arxiv.org/pdf/2201.04225#page=24). We prove both its quantified inequality for all weights in the unit interval at all orders $`n\ge5`$ and the following uniqueness remark for the interior equality cases. The authors proved attainment by $`SE(s)`$ in Theorem 4.8; we use their computation rather than claim it as new.

The priority search used the article title and DOI, the exact strengthened equation, its hyperbolic-bound and Nordhaus–Gaddum reformulations, the $`SE(s)`$ name, and references under Barrett, Evans, Hall, and Kempton. The related [Einollahzadeh–Karkhaneei paper](https://arxiv.org/abs/1901.02047) gives the ordinary unweighted Laplacian spread bound. The [2023 Barrett–Cameron–Evans–Hall–Kempton paper](https://doi.org/10.1016/j.laa.2023.01.016) proves the ordinary bound in the weighted balanced setting and separately discusses evidence for stronger bounds. [Li–Ji’s 2026 argument](https://arxiv.org/abs/2607.03711) concerns the ordinary spread conjecture. None supplies the term $`2xy/n`$. The [Cheeger and normalized-Laplacian work](https://doi.org/10.1016/j.amc.2024.128920) uses different spectral quantities. We did not find an exact resolution in searches of the preprint and subsequent spectral literature, the OpenAI mathematics catalogue, Hexagon, Mathlib-indexed material, or this repository’s existing result files and tracking issues. This is a bounded literature search, not a proof of bibliographic completeness.

## Mathematical review

- The proof uses one-edge interpolation only after strict endpoint inequalities have been proved for connected complementary simple graphs. A disconnected endpoint can satisfy just one needed linear form, and the two separately disconnected endpoints are analyzed directly rather than averaged.
- The rounding argument is at a **global minimizer**, not at an arbitrary choice of eigenvector or graph. After a feasible perturbation preserving both test energies, strict coordinate monotonicity forces the actual eigenvalues to agree with both test energies. This also covers possible eigenvalue multiplicity. Distinct edge-incidence vectors rule out two visible fractional weights.
- The conductance estimate in Einollahzadeh–Karkhaneei retains the squared range before the final simplification in their equation (3); the complement bound (10) does not use the discarded range hypothesis. The two small connectivities imply the extrema are at distance three even if the range is below one. Opposite-side unmatched neighbors of a matched pair augment the matching and can be discarded from the enumerator, but no converse is needed.
- The diameter-four leading minors were checked by independently expanding the tridiagonal continuants and reducing them modulo $`X^2-nX+n`$. The last remainder is $`n[(ac-1)(X-2)+b(a-1)(c-1)]`$. Both evaluations for each of the first four remainders have nonnegative coefficients in $`a-1,b-1,c-1`$ with positive constants. The within-cell modes are all covered by the scalar bound.
- All graph and comparator spectral decisions are strict. Approximate arithmetic proposes thresholds only in the small-order C++ program; acceptance is exclusively by integer calculations. The final output checks the expected graph totals as well as the individual certificates. Python uses rational numbers for candidate thresholds and integer Bareiss pivots.

## Orders five through ten

For an integer witness $`t`$ on denominator $`D=256`$, start with the symmetric matrix
```math
DnL-t(nI-J),
```
and delete the last row and column. This is the quadratic form on the subspace of representatives with last coordinate zero. Since its full constant vector lies in its kernel, the principal block is positive definite if and only if $`\lambda_2>t/D`$. The checker encloses the successive Schur complements with integer interval endpoints on denominator 8192. For a Schur update subtract an enclosure for the product of two off-diagonal entries divided by the positive pivot. For each interval endpoint the integer division is rounded outwards, using the appropriate extremum of the positive denominator. A positive lower endpoint of each pivot proves positive definiteness. The guard rejects any entry outside magnitude $`2^{30}`$ in scaled integer units before subsequent products; every product of two guarded values fits in signed 64-bit arithmetic, as does subtracting any rounded quotient in the enclosing update. Every reported pair of thresholds also satisfies the strict endpoint inequality by an integer comparison. In particular no eigensolver tolerances, floating-point intervals or empirical spectral gaps are premises.

Use [nauty geng](https://users.cecs.anu.edu.au/~bdm/nauty/nug28.pdf) to generate all connected simple graphs up to isomorphism. The local check used version 2.9.3. With a shell supporting `pipefail`, and assuming the binary is called `geng` (on Debian/Ubuntu it is typically `nauty-geng`), run from this directory:

```sh
set -euo pipefail
python3 check_small_parameters.py
c++ -std=c++17 -O3 check_small_graphs.cpp -o /tmp/check-se
for n in 5 6 7 8 9 10; do
    geng -cq "$`n" | /tmp/check-se "`$n"
done
```

| Order | Connected graphs | Both supports connected | Uncertified |
|---|---:|---:|---:|
| 5 | 21 | 8 | 0 |
| 6 | 112 | 68 | 0 |
| 7 | 853 | 662 | 0 |
| 8 | 11117 | 9888 | 0 |
| 9 | 261080 | 247492 | 0 |
| 10 | 11716571 | 11427974 | 0 |

These checks certify the simple endpoint theorem only at the listed orders. The proof on all larger orders, and the passage to arbitrary real weights, are separate components of the full argument. No Lean check or external refereeing is claimed.

As a separate arithmetic cross-check, compile [the interval implementation](check_small_graphs_interval.cpp) with `-O3 -std=c++17 -fno-fast-math -ffp-contract=off` and use the same input. It uses outward-rounded IEEE-754 operations instead of scaled integer division. It independently found no uncertified graph at order 10 among the 11,427,974 connected complementary endpoints. The primary result does not depend on this floating-point implementation.
