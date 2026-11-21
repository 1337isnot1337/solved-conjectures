# Minc’s list

Research started 20 November 2026. Coordination: [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139).

## Scope

Only full open entries on [Yair Lavi’s Minc list](https://yair-lavi.com/mincs-list/) are eligible. The source marks 24 entries open at the start of this investigation. A finite-order extension, a conditional implication, a bound, an algorithm that merely enumerates the definition, or a renamed subproblem is not a completed entry. No Lean verification is in scope.

**Completed unqualified entries: 0.** One complete candidate theorem now gives a general FPRAS for the approximation formulation of Problem 18. Its exact scope, proof and priority audit are recorded below. A separate complete proposed proof now resolves the named Pula–Song–Wanless subsidiary conjecture, with a repaired reduction and independent uniqueness proof; it does not count as a full solution of Problems 14 or 15. No exact polynomial-time Perron computation is claimed.

## Assignments

| Entry | Name | Worker |
| --- | --- | --- |
| C5 | Ryser’s design conjecture | combinatorial |
| C6 | Monotonicity of normalized minimum permanents | combinatorial |
| C9 | Marcus’s block-permanent inequality | inequalities |
| C20 | Gyires’s ratio inequality | inequalities |
| C24 | Integrality of the minimum permanent | combinatorial |
| C30 | Chollet’s conjecture | sign_matrices |
| C34 | Lih–Wang convexity inequality | inequalities |
| C36 | Kräuter’s minimum sign-matrix permanent | sign_matrices |
| C42 | Lieb’s permanental dominance conjecture | root |
| C44 | Zero-diagonal doubly stochastic minimum | inequalities |
| P1 | Maximum permanent on a unitary orbit | root |
| P2 | Permanent dominance for degree-one characters | root |
| P3 | Permanent values of 3-regular matrices | combinatorial |
| P4 | Maximum permanent when k does not divide n | combinatorial |
| P5 | Vanishing Hadamard permanents | sign_matrices |
| P7 | Sign matrices with equal absolute permanent and determinant | sign_matrices |
| P8 | Monotonicity toward the boundary | root |
| P11 | Matrices below every circulant | combinatorial |
| P12 | Circulant maxima when k does not divide n | combinatorial |
| P13 | Real van der Waerden radius | root |
| P14 | Characterizing cohesive matrices | root |
| P15 | Characterizing barycentric matrices | root |
| P17 | Characteristic polynomial of permanental compounds | root |
| P18 | Perron root of permanental compounds | root |

## Evidence standard

For each proposed result record the original quantified statement, primary sources, recent status searches, a complete argument, and an independent attempt to find a gap. Computation can find a counterexample, but the final witness and inequality must be exact. New-result priority remains provisional even after literature searches. Research files will distinguish known statements, proved lemmas, conjectures, failed approaches and unresolved gaps.

## Initial exclusions

The ten entries already marked resolved by the source are excluded: conjectures 3, 4, 15, 17, 18, 27, 28, 35, 41, and problem 10. Existing results in this repository and prior results in other repositories also do not count as new.

## Sources

- H. Minc, *Theory of permanents 1982–1985*, Linear and Multilinear Algebra 21 (1987), 109–148, https://doi.org/10.1080/03081088708817786.
- G.-S. Cheon and I. M. Wanless, *An update on Minc’s survey of open problems involving permanents*, Linear Algebra and its Applications 403 (2005), 314–342, https://doi.org/10.1016/j.laa.2005.02.030.
- Yair Lavi, [Minc’s list](https://yair-lavi.com/mincs-list/), accessed 20 November 2026. The source’s individual pages supply exact statements and partial results; fresh literature checks are still required.

## Checked research checkpoints

- [Real van der Waerden radius](sinkhorn_frobenius_radius.md): new all-order certified lower radius `b(n)>=R_n` for `n>=3`, where `R_n` is the unique positive root of `T_n(R)=1+nR^2`, and `sqrt(n) R_n -> 1.5852...`; explicit corollaries are `b(n)>=1/(2sqrt(n))` for `n>=4` and `b(n)>=1/sqrt(n)` for `n>=64`. Uses Lavi's zero-margin subpermanent lemma. Sharp radius **still open**; the root reviewer checked the cited zero-margin lemma and deduction, while priority remains unverified. No completed entry is claimed.
- [Perron root of permanental compounds](../../results/perron-root-permanental-compounds/): complete candidate proof of an FPRAS for every nonnegative rational input and every compound degree, with deterministic zero detection. Independent reviews are in [sign-matrices/p18_independent_review.md](sign-matrices/p18_independent_review.md) and [inequalities/perron_review.md](inequalities/perron_review.md); the [prior-art audit](../../results/perron-root-permanental-compounds/source-audit.md) found no full-domain result. This settles the approximation formulation if the proof and novelty assessment withstand external review; it is not an exact computation theorem.
- [Gyires's ratio inequality](inequalities/gyires_spectral.md): a proved sufficient condition on a spectral-norm neighborhood, using cited prior results. The unrestricted conjecture remains open here.
- [Integrality of the minimum permanent](combinatorial/switch_descent_obstruction.md): an exact infinite-family obstruction to a proposed four-cycle descent strategy, with a six-cycle improvement. This disproves the proposed strategy lemma, not Conjecture 24.
- [Earlier open-path reduction](perron-compound.md): historical derivation and the convergence obstacle bypassed by the trace argument.


- [Permanent dominance for degree-one characters](abelian-dominance.md): proves the semiregular-action case for every character and the abelian-subgroup case in every order as consequences of Grone–Pierce and Lieb–Fischer. This is a structural subcase, not a full solution of Problem 2 or Conjecture 42; priority is unasserted.


- [Pula–Song–Wanless conjecture](../../results/pula-song-wanless/proof.md): complete proposed proof of the inclusive threshold `n>=m+sqrt(m)`, with a real-rooted-minor repair of the published equalization argument and an independent van der Waerden uniqueness proof. The known cohesive and non-barycentric directions are independently checked and credited. [Two written reviews](../../results/pula-song-wanless/review-inequalities.md) and [exact identity checks](../../results/pula-song-wanless/verify.py) accompany it. The [source audit](../../results/pula-song-wanless/source-audit.md) found no earlier full threshold proof; its limits are explicit. This is a subsidiary conjecture, not either unrestricted characterization problem.

## Further checked routes and remaining gaps

- [Integer regular-matrix minima](combinatorial/descent_research.md): a decomposable support cannot minimize for any `k>=2`; longer alternating-cycle changes have exact minor expansions. Their signs do not yield a universal descent theorem. Continuous minimizer cofactor identities cannot be assumed on the integer grid.
- [Brualdi's cohesive family](combinatorial/brualdi_boundary_notes.md): the symmetric-family reduction is unjustified without a full-face argument. A proposed principal-cofactor inequality has an exact counterexample.
- [Characteristic polynomial of permanental compounds](inequalities/compound_charpoly_obstruction.md): symmetric powers, Ryser transforms and trace encodings are exact, but do not currently improve the unrestricted algorithm. The needed multilinear evaluation step is unresolved.
- [Lih–Wang convexity](inequalities/lihw_stability_obstruction.md): the relevant interpolation need not be real rooted, and a coefficientwise chord bound is false. No full inequality is established.
- [Zero-diagonal minimum](sign-matrices/c44_research.md): exact obstructions rule out unconditional transpose averaging, principal-cofactor summation, and entropy conjugation averaging. [Exact certificate](sign-matrices/c44_obstructions.py). [Entropy nonconcavity](inequalities/entropy_nonconcavity.md) has a separate [rational certificate](inequalities/entropy_nonconcavity.py). These are counterexamples to auxiliary claims, not to Conjecture 44.
- [Sign-matrix constructions](sign-matrices/research.md): a fixed-determinant family has an exact path-partition recurrence, but its simplest closed subfamily misses admissible orders. The Hadamard signed-automorphism argument cannot force permanent vanishing. No all-order attainment or nonvanishing result is claimed.
- [Regular orbit images and abelian dominance](sign-matrices/abelian_review.md): a stronger absolute-sum inequality follows from Grone–Pierce and Lieb–Fischer. The proof is checked, but the original Grone–Pierce corollaries remain inaccessible and priority is unverified. The unrestricted dominance conjectures remain open.

All three parallel workers completed their written checkpoints. No extra full conjecture solution was obtained from these routes, and none of these partial results or obstructions increases the full-entry count. The ten-resolution target is unmet.
