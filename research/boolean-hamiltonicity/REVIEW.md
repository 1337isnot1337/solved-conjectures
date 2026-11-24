# Adversarial review and verification scope

## Review status

This package contains research lemmas and explicit obstructions. It does not
contain a proof of Boolean P != NP. The review below is internal review by
parallel AI research workers in the same session. It is not independent
external review, journal review, or Lean verification.

The root integrated the notes and independently read the arguments and
replayed the finite verifiers. The three parallel workers divided their
initial work between cycle layers and restrictions, circuit invariants, and
primary-source scope. Cross-review then tested their arguments separately.

## Mathematical review receipts

| Item | Review performed | Outcome |
| --- | --- | --- |
| LAYERS Sections 1–5 | Circuit-invariant worker checked the first-overlap coefficient, adjacent three-cut tails, uniqueness of the pair union, and the two-extra-vertex contraction including the ordinary polynomial identity. Root checked the full argument. | No gap found. |
| LAYERS Theorem 7.1 | Circuit and source workers independently derived the outgoing-choice bound. Circuit worker and root checked the monotone saturation, exact cutoff computation and fixed-constant quantifiers. | No gap found. Monotone output is distinguished from a polynomial monotone circuit. |
| LAYERS Corollary 7.2 | Circuit worker checked mixed-radix successor decoding, the register sizes, polynomial loop bounds, and the first-return test without a visited array. | No gap found for each fixed integer c. |
| INVARIANTS Sections 1–4 | Layer worker checked affine-span gate bounds, the formula/DAG distinction, the cut rank examples and the Hamiltonicity modules, including the one-module case. Root checked the direct circuit-connectivity rank bound. | No gap found. The valid rank lower bound has only linear scale in the number of variables. |
| INVARIANTS quadratic example | Layer worker checked the binary cross-matrix rank counting, union bound and characteristic restriction for the sign matrix. | No gap found. The monotone ALL_CUTS construction is stronger and does not need this example. |
| ALL_CUTS | All three parallel workers checked the probability constants, pruning budget, globally induced matching, same-side edges, tensor rank and zeta equivalence. | One domain clarification: Lemma 3 now explicitly assumes D >= 1. The application uses D = 512. No remaining gap found. |
| SUPPORT_QUOTIENT | Circuit worker checked the support ideal, Hamming-ball isomorphism, union convolution, exact direct-table cost, dimension estimates, ordinary-lift consequence and grading obstruction. Root read the argument. | No gap found. The dimension estimate is not used to claim every implicit representation is large. |
| README and ATTACKS | Layer, circuit and source workers checked the complexity quantifiers, NP certificate, uniform/nonuniform implications, homogeneous extraction overhead and the narrow scope of each failed transfer. | No gap found in the stated implications. The target lower bound remains absent. |

No review certified the missing invariant theorem. There is no decisive
P-versus-NP step in this package for a reviewer to accept. A future attempt
must supply that step and receive a separate review.

## Finite verification

Run from the repository root:

```bash
python3 research/boolean-hamiltonicity/verify_layers.py
python3 research/boolean-hamiltonicity/verify_invariants.py
python3 scripts/check_readme_verification.py
```

The layer verifier checks all loopless directed graphs on 2, 3 and 4
vertices: 4, 64 and 4096 inputs. It obtains multilinear coefficients from
truth-table Möbius inversion and separately from cycle-family
inclusion-exclusion. It also checks all the corresponding images of the
two-extra-vertex restriction. It checks first-overlap counts through six
vertices, obtaining 1, 12, 120 and 1200 monomials.

For each c in {0, 1, 2}, it checks the sparse cutoff and monotone saturation
against independent cycle enumeration, compares their full coefficient
prefixes, and checks every single-arc monotonicity relation on the small
input cubes. It separately checks the on-demand mixed-radix implementation
against the Cartesian-product successor choices and the first-return
decision procedure against cycle enumeration.

The invariant verifier uses exact fractions and arithmetic in the prime
fields with 2, 3 and 5 elements. It checks the explicit ranks, coefficient
counts and the false additive-rank inequality. It checks the valid gate
bounds on every pair of two-variable Boolean functions and a fixed sample
of four-variable functions. It enumerates actual cycles in all 340 inputs
of the module gadget for one through four modules.

The versioned [CHECKS.json](CHECKS.json) records the commands, exit codes,
outputs and hashes of the proof and verifier files at the local checkpoint.
The dedicated GitHub Actions workflow replays the two finite verifiers.
Hosted job results must be reported separately from this local receipt.

These are exact finite checks of the supplied examples and algorithms.
The written arguments establish the general statements. Neither the
finite checks nor the internal reviews prove the target asymptotic lower
bound. No Lean files were changed or rebuilt. The upstream arithmetic
theorem is used under the standing repository assumption, without claiming
that this session independently rebuilt it.

## Coordination and provenance

The current AGENTS.md, issues, recent PRs, commits and research directory
were inspected before opening [issue #251](https://github.com/1337isnot1337/solved-conjectures/issues/251).
The public Discussions listing returned a GitHub loading error; the issue
records that limitation. The related BSS campaigns were cross-linked.

The first mathematical checkpoint is commit
[`94960b3`](https://github.com/1337isnot1337/solved-conjectures/commit/94960b3df8c061c04d06c8bded849b9928d24500).
[PR #253](https://github.com/1337isnot1337/solved-conjectures/pull/253)
contains the review branch and subsequent strengthening. These research
notes do not add a solved-conjecture row or change any formalization status.

Original source authors are credited in [SOURCES.md](SOURCES.md). The
graph-CNF and induced-matching method is identified as established prior
methodology. Elementary coefficient identities, sparse-input enumeration,
and the reviewed auxiliary observations are not claimed as new named
conjecture resolutions.

