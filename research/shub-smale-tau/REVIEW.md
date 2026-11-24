# Review and verification scope

Research remains open. No full τ bound, BSS separation or Lean formalization is claimed.

## Mathematical review

Four parallel workers covered consecutive roots, arithmetic and prime selection, source/BSS transfer, and integration with alternative attacks. Each substantive argument was read by a worker other than its author. This is internal adversarial review, not external peer review.

The review checked the generalized Vandermonde sign argument at zero and positive evaluation points; the noncancellation in Cauchy–Binet; preservation of rank by the bitwise evaluation/coefficient basis change; denominator clearing in interpolation; first-nonzero-coefficient divisibility even when the cofactor vanishes at zero; and disjoint Hensel neighborhoods in the fixed-p-adic example.

For the classical BSS transfer, the review checked arbitrary fixed complex constants, finite algebraic extension coordinates, equality of all coordinates, nonzero generic divisors, shared numerator/denominator circuits, and integer specialization. The specialization need not be found uniformly: the lower-bound target minimizes over all circuits. After the generic vanishing polynomial has been constructed, the remaining coefficient denominators depend only on the transcendence parameters, so root identities survive specialization after clearing them.

Review corrections included the zero-root edge case in the factorial estimate, the direction of the sufficient prime-weight inequality, the restriction n >= 1 for the nested-log consecutive bound, and explicit padding for the BSS input-length convention.

The first-jet construction was separately reviewed: multiplying by an inverse of the derivative modulo the squarefree root polynomial gives identical nonzero derivatives at all prescribed roots. Neither that interpolation nor the off-root interpolation is claimed to have small circuit size.

## Exact checks

The local command `python3 research/shub-smale-tau/verify.py` passed with:

- 11,553 carry, signed digit-gate and consecutive-product checks;
- all 120 unordered nontrivial digit cuts for n = 2 through 7, checking the original power evaluations, binomial coefficient ranks, and both squarefree rank tables, plus the small-minor sign check;
- off-root interpolation, common first jets and bounded-jet erasure on four distinct root sets;
- the explicit equal-jet polynomial through N = 8, including its exact derivative values, coefficient content and squarefreeness by polynomial gcd;
- first-coefficient divisibility and prime-power collision identities on the specified empty, singleton and nontrivial root sets;
- the squarefree modular-average identity for the first one through five primes, with finite-field root counts checked independently;
- certified factorizations and cyclotomic incidences for M = 2, 6, 30 and 210, checking every supplied prime by trial division and every product exactly; the prime counts are 1, 2, 6 and 20;
- finite Hensel-lift counts and derivative valuations for the Koiran–Portier–Rojas family through n = 3 at p = 2, 3 and 5.

The unchanged root README also passed `python3 scripts/check_readme_verification.py` on the fetched snapshot: 68 result rows. No results-table entry was added. The unrelated full collection computations and Lean build were not rerun for these research notes.

The path-filtered `shub-smale-tau.yml` workflow runs the same finite verifier. For [PR #263](https://github.com/1337isnot1337/solved-conjectures/pull/263), both dedicated checks passed on head `4da59858901462066618478db5a764ba31dba4f7` before merge. Later-checkpoint hosted status is recorded in its PR; a local pass is not reported as a hosted pass.

## Provenance

The BSS reduction is a reconstruction of Shub–Smale's supplied manuscript, not an original separation. The p-adic family is Example 1.16 of Koiran–Portier–Rojas, arXiv:1309.0486v1. The finite-palette combination uses that example and the elementary Chebyshev recurrence. The remaining algebraic obstructions and arithmetic estimates are presented as proved research lemmas without a novelty claim.

The pinned Anthropic statement and proof linkage were inspected. Its validity is the repository's standing premise; its Lean build was not replayed here. No missing implication has been replaced with an axiom or a computational screen.

## Second mathematical checkpoint

The squarefree rank strengthening was independently derived and reviewed by three workers. The cyclotomic support proof was separately checked without importing a primitive-divisor theorem. The unit-resultant equivalence and the weighted root-selected-rank equivalence were reviewed with their zero-gate and empty-root edge cases. These equivalences expose unresolved statements; neither is presented as a new bound. The explicit jet multiplier has degree 2N−1, all roots simple and real, and exactly the prescribed N integer roots. Dividing its content preserves the masking.


## Continued research checkpoint

The algebra of the proposed 2002-based optimization was independently checked. Deeper adversarial review found an explicit failure in the cited multivariate valuation proof; the arithmetic bound was changed to conditional status before publication. The unconditional replacement uses Risler's Proposition 3.1, whose primary scanned statement and model were inspected. Three workers checked the counterexample to the separate 2003 C_p valuation claim. The charged block-product construction was independently reviewed, including fixed rational constants, padded monic division, duplicate evaluation points, and final positive denominator clearing. The inverse equivalence was separately checked in both directions; it does not assume a short Boolean-ideal membership certificate. The strict-total-positivity example was checked by a uniform determinant perturbation bound.

The independent reductions and the explicitly conditional calculations have written mathematical review. The arithmetic source issue remains unresolved. The existing finite verifier remains a regression check for the earlier identities; its successful run is not a numerical verification of the imported fewnomial theorem or the new asymptotic bounds. No new Lean theorem or conjecture resolution is claimed.

The continued checkpoint also passed exact finite checks of the shifted-cyclotomic Newton hull, the simple Q_2 root and parallel initial faces in the mixed-volume counterexample, every one of the 430 geometric-sum cut minors for n=2 through 4, and divided-difference identities with repeated prescribed roots and a nonconstant cofactor through N=8. These checks do not verify an asymptotic root bound. Markdown fences and local links were checked for the changed notes.

## Normalization, prime averaging and quadratic folds

The source-transfer worker proposed the rational-to-integer and monic transformations. The arithmetic worker and root independently checked the majorant point, the divisibility of a rational root's shifted numerator into f(t), the divided-difference gate rules, the power-of-z denominator invariant and both complete gate counts. Zero intermediate registers and nonzero constant outputs were checked separately. These reductions are not claimed as new formulations of the conjecture: the cited Qi Cheng manuscript already counts rational roots.

The arithmetic worker derived the integer and projective-rational larger-sieve inequalities. Source-transfer and root reviewed the Vandermonde bounds, primitive linear-factor divisibility, identically zero reductions modulo a prime and the direction of the reciprocal-average condition. The multiquadratic cover is a stress test, not a short-circuit counterexample: extracting its even part gives an integer-root polynomial at constant-factor overhead. The simultaneous Galois selection lemma is elementary; its prime realization imports Chebotarev and supplies no effective costs or cross-prime root identifications.

The consecutive-root worker proved the matrix-power cyclotomic restriction, the positive factorial-multiple extraction and the rational Chebyshev restriction. Both other workers reviewed the relevant proofs. Source-transfer and root independently checked the fold-chain argument, including squarefreeness of the collision curve, exclusion of real line components, common complex components, the convex-arc lattice bound and the summation giving (7/6)log₂N−6. This applies only to compositions of quadratics. The finite search is incomplete and supplies neither an optimal depth nor an asymptotic family.

The finite-prime inverse imitation was independently reviewed at the level of the Gauss valuation of rational functions, including zero errors and common monic denominators. Its quantifiers fix the prime palette before constructing the imitation. It does not refute adaptive selection or exact inversion. The remaining square-compression bound in CIRCUIT_HISTORY.md is explicitly conditional on the unresolved unrestricted arithmetic fewnomial import; its base near 1.929697 is not an unconditional bound.

The exact verifier additionally passed the rational/monic coefficient identities on the specified rational root sets with repeated roots and both leading signs; the ten-root quadratic-composition identity; every gate and prescribed root of the N=8,16,32 fold certificates, with 54,101,304 gates and verified nonzero leading terms; and all 19 two-by-two digit-cut minors for the finite-prime imitation at n=2,3 and primes 2,3. Those checks are distinct from the general written arguments. No Lean file was changed and no formal verification of these new statements is claimed.

## Unary polynomial gates and low-degree factors

The source-transfer worker extended the composition-factor obstruction to sums and, following root's suggested extension, to arbitrary arithmetic DAGs with unary polynomial gates. The arithmetic and consecutive-root workers and root independently reviewed the full proof in ORACLE_FACTORS.md. It is a consequence of finite jet computation and Bürgisser's factor-reconstruction method; no priority claim is made.

The review checked the generic smooth point, the formal unit used to remove a factor's arbitrary multiplicity, coefficientwise regularity of the perturbed implicit branch, the bidegree truncation, scalar-gate accounting over C(epsilon), the resultant degree in reconstruction, the selected nonzero minor, and removal of variable-dependent divisions. The proof never assumes that the factor divides the truncated polynomial. The deliberately loose bound O((s+n²+t+1)(d+1)^16) includes each introduced scalar gate and applies to border complexity with arbitrary constants, not to constant-free complexity.

The final approximants are polynomials with regular Laurent coefficients and were compared with the pinned Statement.Approximates interface. This is a written mathematical argument, not a formal verification or a finite computation of the theorem. It rules out the specified low-degree-factor transfer under the accepted border lower bound; it supplies no root-count bound and no cheap Boolean normal form.

## Anchored extraction, deformations and arithmetic selection

The consecutive-root worker derived the anchored identity T_N(F_N Q)=F_N ΔQ and its charged implementation. Source-transfer and root independently checked the lower-bidiagonal quotient-module matrix, including repeated nodes, and the separate scalar construction of N and the Pascal coefficients. The output is q!lc(Q)F_N. The proof pays polynomially for q=deg Q; it does not replace that degree by circuit size. The translation-equivariant obstruction and finite-probe density argument were checked with their domain and nonuniformity restrictions. Review corrected a final-denominator claim: clearing a rational circuit gives a polynomial multiple, not necessarily a constant multiple.

The source-transfer worker and root independently obtained the generating-function identity for the coalescing Boolean inverse. The integer-only recurrence was checked by the arithmetic worker. Review made the integral model explicit: reduction modulo powers of t takes place over Q(y)[[t]], where t is not invertible, rather than in the generic Q(t,y) algebra. The spacing-preserving Newton construction was checked to be exactly the inverse representative for a power of H. It changes multiplicities and does not compute a Boolean trace.

The arithmetic worker's Frobenius-selection argument was reviewed by source-transfer and root. The coefficient field is the fixed field of the centralizer, so selected noncentral actions need not be defined over Q. The finite Newton example was checked both before and after reduction modulo (x−1)(x−2). Repeated-root inputs are excluded from the finite-etale argument explicitly, and a repeated-root example shows why that exclusion matters. The binomial harmonic bound and exact factor counts of fixed integer quadratic iterates were reviewed by the consecutive-root worker and root. The Schur irreducibility statement is classical and is used only to test a history-free harmonic rule.

The dense square-chain extension was checked with the full degree of the unknown cofactor. The prime-counting argument counts roots outside F_p with their multiplicities in that cofactor. The half-degree and three-quarters-degree arguments count paired local fibers, including zero targets and repeated outer roots. The consecutive-root worker independently checked the valuation-doubling proof and its sharp six-root example; root checked all sections and the cited Walker statements. These density hypotheses are not supplied by a general circuit with many integer roots.

The elliptic specialization note is a routine consequence of Mazur's Theorem (7′) and Stange's Propositions 2.1 and 2.2(i),(v), with the primary numbered statements inspected. Its proof was reviewed by the arithmetic worker and root. The nonvanishing of every selected bounded-index factor, bad-discriminant roots, constant inputs, and the fixed additional gate cost were checked. No uniform bound on the input degrees in terms of circuit length is assumed.

The standard-library verifier additionally passes 32 symbolic anchored-difference and exact-quotient cases, including repeated quotient nodes; 310 deformation coefficients checked against independent subset finite differences and their defining inverse equations; the harmonic CRT bound for M=1,...,100; the failed intersective iterate modulo 61; nine stages of the exact Newton formula; and the six-root square-chain identity. The finite checks do not verify any asymptotic theorem. Display-math fences, relative links, whitespace and repaired citation autolinks were also checked. No Lean file was changed.

For PR #272, the site build and one dedicated exact-checks job passed on final head 9f82f02fcfe8e180878b4ceb9caeffbc33464abf. The dedicated check also passed on merge 41a4d2af42ea5a884deb22e85934e68e82539bbc. Other duplicated or unrelated jobs were still queued at this inspection; the merge-triggered site job was cancelled by a newer build. No complete collection or Lean verification is inferred from these statuses.

## Powered-cofactor extraction

The consecutive-root worker proved the logarithmic power-lifting identity and combined it with endpoint transport and a charged small-degree Bezout certificate. Root and both other workers independently reviewed the algebra, repeated-root bases, overlapping bases, shifts that avoid the cofactor support, and the complete division-free gate accounting. The integer certificate uses scaled Newton identities and Cayley--Hamilton; no exact scalar division is treated as a free gate. The proof also permits an uncomputed nonzero rational scalar in front of the supplied powers: integrality of the constructed polynomial and monicity of F_N force the output scalar to be an integer.

The arbitrary-order obstruction has separate quantifiers. Exact factorial normalization is a reduction to integer factorial complexity, not a lower bound. The permanent obstruction applies to a compiler over symbolic coefficient rings and uses the pinned border theorem; it does not refute nonuniform extraction on integer inputs or extraction with an unspecified scalar.

The standard-library verifier checks 18 power-lifting identities and six complete extractions, including adjacent roots that require a larger shift, repeated and overlapping bases, an irreducible quadratic, roots in the prescribed interval, and a nonintegral supplied scalar whose product with the cofactor is integral. Each full check independently verifies the scaled coefficient-matrix certificate and the final polynomial identity. These finite checks do not establish the asymptotic theorem or a tau bound.
