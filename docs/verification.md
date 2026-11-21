# Verification

[Home](../README.md) · [Catalogue](../CONTENTS.md) · [Lean status](lean-status.md)

## Requirements

- Python 3.12, matching CI. The Hadamard audit uses NumPy. The Frankl window enumeration uses NumPy and SciPy. The Chow checks use SymPy 1.14.0.
- A C++20 compiler available as `c++` for distance-graph checks and the lonely-runner spectrum/equality verifiers. Some Python entry points compile and launch C++ programs themselves.
- For formal proofs: Lean and Mathlib pinned in [the shared Lean package](../lean/). Use its `lean-toolchain` and `lake-manifest.json`; do not substitute a different toolchain.

Run commands from the repository root with Python assertions enabled (do not use `python -O`). Keep the whole checkout: some verifiers reuse code in sibling result directories.

The [Hadamard order-2396 replay](../results/hadamard-2396/) compares the C++ output with the archived pairs and runs a separate Python audit.

The partial-result entries contain their replay commands for the [Frankl generator theorems](../results/frankl-generator-families/), [two-speed insertion](../results/lonely-runner-two-insertions/) and [abelian cover certificate and sharpness example](../results/erdos-gyarfas-abelian-covers/). Their current formalized scope and remaining dependencies are recorded in the [Lean status](lean-status.md).

## Analytic proofs without computation

The [Dospolova–Germanskov–Zaporozhets disproof](../results/dospolova-germanskov-zaporozhets/PROOF.md) is analytic throughout. The strict Gaussian-range argument applies to every nontrivial Gaussian-bounded compact, including bounded discontinuous processes; Vitale's published normalized intrinsic-volume limit excludes every sequence c^k/k! with positive c. Three [independent reviews](../results/dospolova-germanskov-zaporozhets/ROOT_REVIEW.md) check the separability argument, strictness and normalization. The source audit credits Vitale and Long, and actual image inspection resolved an OCR ambiguity in an earlier inequality. There is no numerical verifier or new workflow step for this proof.


The [Ferreira–Simon stochastic-order proof](../results/ferreira-simon-stochastic/PROOF.md) and [diagonal Mittag–Leffler proof](../results/ferreira-simon-diagonal/PROOF.md) establish their full real-parameter statements by integral identities and pointwise comparisons. Neither depends on numerical tests, finite enumeration or computer algebra. Their separate [stochastic audit](../results/ferreira-simon-stochastic/AUDIT.md) and [diagonal audit](../results/ferreira-simon-diagonal/AUDIT.md) reconstruct the argument and check normalization, domains, strictness and convergence. No new executable verifier or workflow test is assigned to these analytic proofs. Source and priority review are documented separately in each package.

The [Simon stable-infimum proof](../results/simon-stable-infimum/PROOF.md) is also analytic. Its [independent audit](../results/simon-stable-infimum/AUDIT.md) verifies the source normalization, prior Mellin transform, Brownian endpoint, positivity and parameter monotonicity of the logarithmic Lévy kernels, exponential integrability and independent mean-one multiplier. Conditional Jensen gives the full convex order. There is no numerical verifier or workflow test for this argument; the [source audit](../results/simon-stable-infimum/SOURCES.md) documents priority separately.

## Computer-assisted proof of Roos–Seiringer's conjecture

The [Roos–Seiringer package](../results/roos-seiringer-kernel/) proves positivity of the radial Dirichlet kernel on the whole positive real axis, together with its continuous value at zero. Analytic arguments cover arguments at most one and at least forty. On the intervening interval, an analytic derivative bound transfers each exact midpoint enclosure to a whole closed interval.

```bash
python3 results/roos-seiringer-kernel/verify.py
```

The standard-library verifier uses only integers and rational numbers. It retains 160 series terms, encloses pi by signed Machin-series remainders, rounds every operation outward at 384 binary fractional bits, and adds the proved full series-tail allowance. The 184 successful closed intervals cover exactly [1,40], including shared endpoints. Independent full replays reproduce 367 evaluations, maximum subdivision depth eleven, the strictly positive margin in the [proof](../results/roos-seiringer-kernel/PROOF.md), and the [recorded output](../results/roos-seiringer-kernel/check-output.json). The computation is essential, not a finite sample of kernel values. Both [mathematical](../results/roos-seiringer-kernel/ALGEBRA_REVIEW.md) and [root](../results/roos-seiringer-kernel/ROOT_REVIEW.md) reviews passed; no Lean verification is claimed.

## Computer-assisted proof of Lyon's conjecture

The [Lyon package](../results/lyon-gamma-median/) proves the monotonicity assertion on the entire positive half-line. Its exact certificate is an essential part of the proof. Analytic bounds cover the two tails; the [written interval criterion](../results/lyon-gamma-median/PROOF.md) uses known convexity of the gamma median to extend each certified inequality throughout a real cell.

```bash
python3 results/lyon-gamma-median/verify.py
```

The standard-library verifier independently checks 4258 rational median brackets and 4256 cells covering exactly the interval from one tenth to seven. Every sign assertion uses 128-bit-scaled integer intervals with outward rounding, convergent series and explicit signed remainder bounds. The JSON data are proposed brackets, not trusted quantile values. Both independent full replays passed with minimum margin 38316221661991044002598352939471477 divided by 2^128. Typical replay time is one to two minutes. The package has no Lean formalization; the unformalized marker does not erase the essential role of the exact certificate.

## Computational checks

The [Chen–Khare–Sahi proof](../results/chen-khare-sahi-macdonald/PROOF.md) reduces every degree-six Muirhead-semiring representation to 38 displayed products and seven pure monomials. An exact rational functional is nonnegative on all of them and negative on the specified normalized Macdonald difference. This exhaustive reduction proves nonmembership in the full semiring. The [independent reviews](../results/chen-khare-sahi-macdonald/ROOT_REVIEW.md) also verify the rectangular-translate and continuous-parameter families.

```bash
python3 results/chen-khare-sahi-macdonald/verify.py
python3 results/chen-khare-sahi-macdonald/independent_cone_check.py
python3 results/chen-khare-sahi-macdonald/independent_orthogonality_check.py
```

All three scripts use only exact integers and fractions from the Python standard library. The main verifier checks the full cone, cleared-denominator Macdonald difference equations, and exact normalized separator value. The other scripts independently regenerate the cone values and derive both polynomials from the Hall inner product on all eleven partitions of six before specialization to three variables. Numerical linear programming was used only during discovery and is not a proof premise.


The [Ferreira–Simon beta-prime proof](../results/ferreira-simon-beta-prime/PROOF.md) is a complete analytic Mellin-transform argument for the full parameter range. Its [two](../results/ferreira-simon-beta-prime/ALGEBRA_REVIEW.md) [independent reviews](../results/ferreira-simon-beta-prime/ROOT_REVIEW.md) check the normalization, domains, positive-series interchanges, and uniqueness step. The standard-library script checks 18 exact identities in formal parameters; these are supplementary algebra checks, not a finite-parameter proof.

```bash
python3 results/ferreira-simon-beta-prime/verify.py
```


The [Han–Sabag–Kostina–Hassibi checker](../results/han-sabag-kostina-hassibi/verify.py) performs 16 exact rational and symbolic checks of the feasible Lyapunov solution, all four sparse power thresholds, the strict objective gap, the determinant factorization and the open family. SymPy supplies only symbolic identity checks. The [written proof](../results/han-sabag-kostina-hassibi/PROOF.md) supplies the exhaustive classification and full disproof.

```bash
python3 results/han-sabag-kostina-hassibi/verify.py
```


The [Gröchenig checker](../results/grochenig-zero-density/verify.py) runs 784 exact standard-library checks of finite Gaussian-block identities, signs, normalization, geometric error budgets, and interval counts. The [written proof](../results/grochenig-zero-density/PROOF.md) constructs the infinite counterexample and proves convergence and both upper-density bounds. The checks diagnose algebra and transcription errors; no finite screen establishes the infinite assertion.

```bash
python3 results/grochenig-zero-density/verify.py
```



The [López Pouso–Segura node disproof](../results/lopez-pouso-segura-quadrature/PROOF.md) has an exact rational comparison at the two-point Gauss–Legendre rule and an all-large-even-degree argument from the Legendre differential equation. The [independent audit](../results/lopez-pouso-segura-quadrature/AUDIT.md) reconstructs the perturbation coefficients, the central normalization, the Gaussian weight conversion and the strictly positive fourth-order term, with analytic remainder justification. Symbolic consistency checks supplement the written proof; no finite root screen or Lean formalization is used.

The [Vishnyakova checker](../results/vishnyakova-root-radius/verify.py) uses SymPy for 73 exact algebraic checks of the generating recurrence, reflection, finite Vandermonde identity, tridiagonal characteristic polynomials, matrix quadratic estimate, reciprocal-segment crossing, and sharpness witness. The [written proof](../results/vishnyakova-root-radius/PROOF.md) covers every degree, every positive weight, and arbitrary independent parameters. The finite checks diagnose algebra and transcription errors; they are not the unrestricted proof.

```sh
python3 results/vishnyakova-root-radius/verify.py
```

The [Novelli–Thibon checker](../results/novelli-thibon/verify.py) independently converts permutation fundamental expansions to Schur coefficients using Kostka numbers. It checks all first-moment identities for 209 partition pairs and all 135 hook coefficients through size six, and exactly matches the source's printed polynomial. These finite checks verify conventions; the [written proof](../results/novelli-thibon/PROOF.md) establishes both identities for every size. The script uses only the Python standard library.

```bash
python3 results/novelli-thibon/verify.py
```

The [López Pouso–Segura checker](../results/lopez-pouso-segura-bessel/verify.py) checks exact polynomial and rational identities used by the analytic proof, with the square of pi treated as a formal variable. The full all-index signs, strict monotonicity, and limits follow from the [written argument](../results/lopez-pouso-segura-bessel/PROOF.md), which has two independent internal reviews. The checker uses only the Python standard library and performs no floating-point root screen.

```bash
python3 results/lopez-pouso-segura-bessel/verify.py
```

The [McCrea checker](../results/mccrea-single-crossover/verify.py) independently enumerates profile words and checks both generating-function rewrites and mean values. It uses only the Python standard library; the full parameter claim is proved in the accompanying note.

```bash
python3 results/mccrea-single-crossover/verify.py
```

The [Chen–Kitaev–Zhang verifier](../results/chen-kitaev-zhang-records/verify.py) checks exact polynomial identities, regenerates the sixteen certificates in the credited tail argument, and checks the class conventions by enumerating separable permutations through length eight. The new result is the full written all-length proof. The [Zhu verifier](../results/zhu-jacobi-stirling/verify.py) independently constructs sparse integer polynomials from the original recurrence and expands the complete determinant by permutations. It verifies the disproof identity, including its negative coefficient. Both scripts use only the standard library.

```bash
python3 results/chen-kitaev-zhang-records/verify.py
python3 results/zhu-jacobi-stirling/verify.py
```

The Fang–Zhang–Zhao infinite-log-convexity and Sun–Zhao iterated-ratio disproofs were already public before this campaign. Their duplicate result packages and computational workflow entries have been removed. The [priority correction](../research/campaign-20261121/PRIOR_RESOLUTION_CORRECTION.md) links the immutable prior proofs. Existing unique Lean modules are preserved, with their exact previously checked scope in [Lean status](lean-status.md#formalizations-of-previously-resolved-results). The separate prior Sturm reproof remains only as [credited research](../research/fang-zhang-zhao-sturm/).

These are the commands in [the verification workflow](../.github/workflows/verify.yml). They include finite tests, exact certificates, and exhaustive searches; their mathematical roles are explained in the corresponding proof notes. A passing computation is not a claim that a full theorem has been formalized.

The [Bessel-ratio verifier](../results/kvz-bessel-unimodality/verify.py)
compares independently multiplied rational series coefficients with the
Wronskian derivative identity and checks the leading terms in all sign
branches. These finite checks diagnose transcription errors; the
[written argument](../results/kvz-bessel-unimodality/PROOF.md) proves the
full classification for all orders and scales in the conjecture.

The [Wright verifier](../results/ferreira-simon-wright/verify.py) checks
the general curvature identity as an exact polynomial in three variables,
its two parameter-polynomial specializations, and the displayed derivative
values. The [analytic proof](../results/ferreira-simon-wright/PROOF.md) supplies
the uniform convergence and whole intervals of counterexamples.

The [gamma-quotient verifier](../results/kvz-gamma-quotient/verify.py)
uses exact rational arithmetic for 115 checks of half-integer determinant
signs, integer rank cutoffs, and gamma-moment normalization. The complete
all-order result follows from the [integral proof](../results/kvz-gamma-quotient/PROOF.md),
not from these finite diagnostics.

The [Fuss–Catalan verifier](../results/alexandersson-fuss-catalan/verify.py)
enumerates small paths directly to check the north/east convention and
both marked factors against the classical formula. Its all-parameter
real-rootedness proof is written separately and uses no numerical roots.

The workflow also regenerates the two compact CUT certificate sources with
`results/cut-arithmetic-periodicity/generate_weight_certificates.py` into a
temporary directory and compares them byte for byte with the checked-in files.
Generation alone does not check a proof. The accepted Lean workflow checks the
finite tables, their collision and lower-option interpretation, and both actual
recursive-game identities through `CutPeriodWeightTheorem`.

```bash
python3 -m pip install sympy==1.14.0
python3 results/kvz-bessel-unimodality/verify.py
python3 results/ferreira-simon-wright/verify.py
python3 results/kvz-gamma-quotient/verify.py
python3 results/alexandersson-fuss-catalan/verify.py
python3 results/sagan-swanson-normality/verify_model.py
python3 results/bernardi-morales-delta/verify.py
python3 results/bernardi-morales-delta/verify_events.py
python3 results/gilmore-crossing-nesting/verify.py
python3 results/chow-conjecture/verify.py
python3 results/erdos-granville-pomerance-spiro/verify.py
python3 results/hornak-wozniak/verify.py
python3 results/sonntag-teichert/verify.py
python3 docs/nss/sanity_check.py --output /tmp/nss-sanity-results.json
python3 results/l-solitaire-limit-shapes/verify.py
python3 results/pham-denominator-degree/verify.py
python3 results/pham-denominator-degree/verify.py --dual --brute-depth 13
(cd results/pham-denominator-degree && python3 -m unittest discover -s tests -v)
python3 results/graffiti-pc-318/verify.py
python3 results/li-coefficient-sign/verify.py
python3 results/li-coefficient-sign/independent_check.py
python3 results/batista-egyptian-fractions/verify.py
python3 results/erdos-607-line-sizes/verify.py
python3 results/rectangle-partition-asymptotics/verify.py
python3 results/spivey-multiplayer-war/verify.py
python3 results/cut-family-b/verify.py
python3 results/cut-arithmetic-periodicity/verify.py
c++ -std=c++20 -O3 results/distance-graph-densities/verify.cpp -o /tmp/verify-distance-graphs
/tmp/verify-distance-graphs
python3 results/distance-graph-densities/counterexample.py
python3 results/oravcova-sotak/verify.py
python3 results/two-difference-motzkin/verify.py
python3 results/symmetric-four-point-density/verify.py
python3 results/nonmixed-gap-packing/verify.py
python3 results/haralambis-three-differences/verify.py
python3 results/five-speed-spectrum/verify.py
python3 results/tight-six-speeds/verify.py
python3 results/six-speed-spectrum/verify.py
python3 results/tight-seven-speeds/verify.py
python3 results/tight-eight-speeds/verify.py
python3 results/eight-speed-spectrum/verify.py
python3 results/seven-speed-spectrum/verify.py
python3 results/tight-eleven-to-fourteen/verify.py
python3 results/tight-nine-speeds/verify.py
python3 results/zhang-deletion-values/verify.py
```

The latest workflow is the executable reference when new checks are added.

## Perron root of permanental compounds

Run `python3 results/perron-root-permanental-compounds/verify.py` with assertions enabled. It uses only the Python standard library and checks 126 exact cyclic-permanent identities, 81 Newton inequalities and 2,048 support/zero-root comparisons. These finite checks validate the reduction formulas. They do not implement the permanent approximation sampler or prove the FPRAS's unbounded scope; those claims depend on the [written proof](../results/perron-root-permanental-compounds/proof.md), Gurvits's theorem and the Jerrum–Sinclair–Vigoda theorem. The result has no Lean verification or computer-assisted proof badge.

## Malek's conjecture

Run `python3 results/malek-subpermanent/verify.py` with assertions enabled. The standard-library checker verifies the exact scalar upper constants, the two expansions used to compute them, the positive cubic certificate, the all-order shifted polynomial, and the remaining small-degree coefficient. These are algebraic checks of the [written proof](../results/malek-subpermanent/proof.md), not a finite matrix search. The unbounded statement rests on the analytic argument and its cited inputs. Two internal review receipts and a bounded source audit accompany it. No Lean verification is included.

## Pula–Song–Wanless conjecture

Run `python3 results/pula-song-wanless/verify.py` with assertions enabled and SymPy 1.14.0 installed. The script audits generic derivative/crossing identities, 72 coefficient ODE/variance cases, 48 direct permanent counts and 42 exact barycenter inequalities. The full proof, including the real-rooted-minor reduction repair and independent uniqueness argument, is [written separately](../results/pula-song-wanless/proof.md). These finite checks do not establish the unbounded statement on their own. No Lean verification is included.

## Zhang's Question 8.4

Run `python3 results/zhang-deletion-values/verify.py` with assertions enabled. The standard-library script checks the closed deletion-value formula in all 779 cases with `3 <= n <= 40`, the strict inequality in all 740 cases with `n >= 4` and `r <= n-2`, and the witness time used in the second case. The [elementary proof](../results/zhang-deletion-values/PROOF.md) is unconditional; the finite check confirms the formula in the stated range. No Lean verification is included.

## Baricz–Pogány coefficient positivity

The existing result package's standard-library diagnostic is `python3 results/baricz-pogany-coefficients/verify.py`. It checks the formal-series identities and finite source fixtures described in its [landing page](../results/baricz-pogany-coefficients/). The general statement rests on the written proof; no formal verification is claimed.

## Oravcová–Soták distance-graph classification

Run `python3 results/oravcova-sotak/verify.py` with assertions enabled. The standard-library script checks the 65 spectrum-table sets and their exact `L(D)`, the 62 periodic colourings, the three exceptional sets, the 37 loop certificates for the four one-parameter families, the two-parameter family, and the small cases of the clique lemma. The classification is [proved relative to](../results/oravcova-sotak/PROOF.md) the repository's five- to eight-speed spectrum classifications. The optional SAT scan in `search/` is independent of those classifications and is not run by CI. No Lean verification is included.

## Lean proofs

```bash
bash scripts/verify_lean.sh
```

The script builds each accepted module sequentially, builds the shared root imports, runs `ProofAudit.lean` with warnings treated as errors, and independently rechecks the listed compiled modules with `leanchecker`. The audit covers private declarations as well as public theorems, and rejects project axioms even when unused. Sequential builds keep large finite reductions from competing for memory. [The Lean workflow](../.github/workflows/lean.yml) runs the same audit in CI.

`scripts/replay_lean.py` checks that the replay list exactly matches the project
source-import closure. It stages those compiled objects, including their server
and private data, and replaces only the project entry in Lean's import path.
The unchanged pinned `leanchecker` then replays the two project namespaces.
This avoids repeated dependency-directory scans and excludes unfinished cached
modules. It does not change the kernel or omit any accepted proof module.

After building and auditing a separate candidate, replay its exact local import
closure from `lean/` with:

```bash
lake env python3 ../scripts/replay_lean.py --root Conjectures.DenominatorTheorem
```

The helper derives the closure from the selected source, requires every project
source and compiled object, stages only that closure, and propagates checker
failure. Cross-namespace candidates use the complete accepted-module mode.
`python3 scripts/test_replay_lean.py` checks the closure, staging, missing-object,
and failure-propagation rules with isolated fixtures. The kernel executable is
unchanged in both modes.

The [status report](lean-status.md) records the exact statements checked and dependencies that remain. Partial certificates do not establish the full conjecture. Accepted proofs permit only `propext`, `Classical.choice`, and `Quot.sound` as transitive axioms, as required by [the repository instructions](../AGENTS.md).

## What the checks establish

The two `results/bernardi-morales-delta/` verifiers use only the Python standard library. `verify.py` directly constructs the delta process and checks all membership coefficients for 71 fixed maps and 111,721 process pairs, including nonsurjective maps. It also checks 25 arbitrary-matrix determinant identities in sizes two through six. `verify_events.py` builds the source's cyclic I/J event matrices literally and compares every membership coefficient for 342 marked-surjection profiles and 438,952 exact determinants. These are independent finite checks of the [tree proof](../results/bernardi-morales-delta/PROOF.md) and [event proof](../results/bernardi-morales-delta/EVENT_PROOF.md), which cover every admissible parameter.

`results/gilmore-crossing-nesting/verify.py` compares the literal matrix product and the independently implemented recurrence through row seven, and compares the first column with all perfect matchings on at most twelve vertices. All four variables remain formal. The [written proof](../results/gilmore-crossing-nesting/PROOF.md) proves the identity in every row.

`results/chow-conjecture/verify.py` compares signed-permutation enumeration with the refined recurrence through rank six, checks the separate Stembridge identity through rank 32, and checks exact degree, squarefreeness, consecutive gcd, and cutoff identities. These are finite consistency checks. The [written proof](../results/chow-conjecture/PROOF.md) uses Savage–Visontai's published theorem and a separate strictness argument for every rank.

`results/sonntag-teichert/verify.py` enumerates the minimal dominating sets of every labelled tournament through order six and every labelled oriented graph through order five. It also checks the two-star construction. The [proof](../results/sonntag-teichert/PROOF.md) covers every order.

`results/hornak-wozniak/verify.py` compares the five arithmetic tests against direct allocation of prescribed parts on small trees and checks the local transfer lemma by enumerating allocations. The [written proof](../results/hornak-wozniak/PROOF.md) covers both conjectures. The optional [symbolic check](../results/hornak-wozniak/verify_symbolic.py) uses `z3-solver` for the local endpoint implications.

`results/erdos-granville-pomerance-spiro/verify.py` checks finite instances of the quadratic-root bounds, the bilinear congruence lift and local sieve counts, and the cofactor identities in the [written partial result](../results/erdos-granville-pomerance-spiro/). The asymptotic statements use the analytic proofs.

`results/graffiti-pc-318/verify.py` uses only the Python standard library. It checks all 419,235 labeled graphs on 2–7 vertices with at most `n+1` missing edges; 7,337 satisfy the original hypothesis and each passes the total-domination test. A sharp five-vertex counterexample to a one-unit relaxation is separately verified. See [the all-order proof](../results/graffiti-pc-318/PROOF.md), **credited to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334)**. This is not a Lean proof.

`results/l-solitaire-limit-shapes/verify.py` is the original embedded PDF attachment, extracted byte-for-byte. The finite search checks all pick-layer sets and integer partitions for deck sizes 1 through 14 and separately verifies the specific counterexample for sizes 1 through 1000. Exhaustive tests do not replace the general argument in the PDF.

`results/pham-denominator-degree/verify.py` checks a finite certificate of 26 coefficients and applies Pham's *proved* degree bounds to deduce the entire rational-function identity. Optional `--dual` checks a second exact identity.

The Li verifier also checks all 6,842 partition types of 31 and the coefficient `+29` using exact edge-cut and coloring calculations. Its independent parity-based check is included. The original PDF has the verifier embedded as an attachment.

## Reporting a check

Record the commit, command, toolchain, and result. Distinguish computational tests, source builds, axiom audits, kernel replay, and hosted CI. Do not infer that an unrun check passed.

## Loneliness on a fixed hyperplane

The complete original note is formally verified in the exact 72-module
`LonelinessHyperplaneMain` closure. The fresh gate checks strict sources,
every owned declaration including raw private declarations, all 106 named
theorem endpoints, and every exact stock-kernel target. The original
[statements and evidence](../results/loneliness-on-a-hyperplane/LEAN.md)
include the uniform-over-shifts estimate, exact positive-N counts and degree
bound, Haar-shift law, endpoint formula and sharpness.

Run `python3 results/loneliness-on-a-hyperplane/verify.py` for the additional
finite circle maxima, endpoint congruences and shifted examples.

## Complete rectangle proof and finite plane certificates

The accepted Lean root includes the full growing-rectangle theorem, including
its real-position tiling interpretation and uniform quantifiers over `w ≥ h`.
Its 46 proof modules passed source checks and independent kernel replay; the
final rectangle audit checked 587 theorem declarations. See the
[exact statement and receipt](../results/rectangle-partition-asymptotics/LEAN.md).

The accepted plane development includes all 64 finite certificate blocks and
their normalization and geometric soundness proofs. The matrix checks all
122,880 indexed cases by kernel reduction. The two complete hosted matrix
runs passed; [the source receipts](../results/five-speed-spectrum/plane-certificate-receipts.json)
bind their sources and generator. Run `python3 scripts/verify_plane_certificates.py --row N` for one row, with `0 ≤ N < 8`. The full accepted package is checked
by `scripts/verify_lean.sh`.

The accepted four-speed coordinate cutoff 5,832 is unconditional. The plane
classification and five-speed cutoff 279,841 retain `FourSpeedGap` as an
explicit premise. Neither the finite matrix nor that conditional cutoff is
a proof of the exhaustive five-speed classification.

## Selecting accepted-package checks

The full Lean workflow derives the transitive source closure of both
accepted roots and `ProofAudit`. Any change to that closure, the pinned
configuration, or the verification scripts runs the complete build, axiom
audit, and unchanged independent kernel checker. Missing roots, missing
imports, unknown change information, and manual runs also select the full
gate. Only candidate-only or documentation-only changes can skip it.

A skipped job is not a new proof receipt. Each unregistered candidate has
its own complete closure checks. Negative controls check transitive public
imports, missing-source handling, newly registered candidates, and stale
dependent-object rejection after a candidate source error.

## Frankl high-girth theorem

Run `python3 scripts/verify_frankl_high_girth_theorem.py --jobs 4` from the
repository root after preparing the pinned Lean package. This focused gate
rebuilds the exact 64-module theorem closure with warnings treated as errors,
audits every owned declaration against the standard three-axiom whitelist,
requires 35 named endpoints, and replays every project module with the
unchanged stock checker. It rejects changed source, object, compiler,
checker, or gate hashes.

[Successful hosted run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44516856625) ·
[Original receipt](verification/frankl-components-44516856625/high-girth-theorem.json).
This verifies the complete high-girth frequency theorem. The cyclic
span-four theorem has separate finite graph, transport, coverage, and final
assembly gates. The registered full package is checked by
`scripts/verify_lean.sh`.

## Complete two-speed insertion gate

From the repository root with the pinned toolchain and Mathlib cache:

```sh
python3 scripts/verify_two_insertions_exact.py --plan
python3 scripts/verify_two_insertions_exact.py
```

The exact source model fixes all 27 project modules, 49 required theorem
endpoints, the toolchain configuration, and all transitive gate helpers.
The gate rebuilds every project source with warnings treated as errors and
no linter override, audits all owned declarations and raw private names,
then replays each of the 27 modules as an exact singleton target with the
unchanged stock checker in a fresh one-worker process. It rehashes the
sources, helpers, compiler, checker, every compiled facet, and proof
evidence before writing a passing receipt.

[Run 44524198858/job 135562276051](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44524198858/job/135562276051)
passed for source snapshot `9f51470529423e8135c08de881cd56f5b1fd9a95`.
It checked 563 owned declarations, including 424 theorems and 11 private
declarations. The [original receipt](verification/two-insertions-exact-44524198858/receipt.json)
and [authenticated original evidence](verification/two-insertions-exact-44524198858/)
are public. Receipt preservation performs byte and policy validation;
it is not an additional Lean proof run. This component pass is separate
from the full merged-package gate.

## Six-speed spectrum realization

```sh
python3 scripts/verify_six_spectrum_realization.py --plan
python3 scripts/verify_six_spectrum_realization.py
```

This dedicated gate rebuilds the exact 11-module closure, treats all source
warnings as errors without disabling linters, audits every owned declaration
and raw private name, requires theorem kind for all 15 endpoints, and replays
all 11 modules as exact singleton stock-kernel targets. Source, configuration,
transitive helper, compiler, checker, object and process-evidence hashes are
fixed and rechecked.

The [passed original receipt](verification/six-spectrum-realization-44527134869/receipt.json)
and [authenticated evidence](verification/six-spectrum-realization-44527134869/)
cover 392 owned declarations, 306 theorems and 30 private declarations.
The gate establishes realization of the proposed six-speed values; universal
classification and the full accepted-package verification are separate.

## Complete fixed-hyperplane theorem

All original statements of the fixed-hyperplane note are registered. They
use the original ordered positive, pairwise-distinct integer sample and
the actual time maximum. The general normal is primitive and real-admissible;
the endpoint formula alone additionally requires every normal coordinate
to be nonzero.

The theorem closure proves the deterministic bound and exact containing-torus
maximum, the uniform `O(1/N)` probability error over all shifts, fixed-shift
and independent Haar-shift laws, the exact finite proper-subspace description,
the denominator quasipolynomial, the actual subthreshold numerator at every
`N≥1` with degree at most `k−2`, the endpoint frequency including `k=2`,
and the sharp `(1,2,3)` example. No density, finite-fan, Ehrhart, counting
or classification statement is an unproved premise.

[Run 44531509741/job 135585736594](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44531509741/job/135585736594)
freshly checked the exact 72-module closure at `ee1f018fef258cdd54f73af31cdaf6485fd151cb`.
Sources used warnings as errors with no linter override. The all-owned audit
checked 1,403 declarations, including 1,149 theorems and 44
private declarations, and confirmed theorem kind for all 106 required
endpoints. Only `propext`, `Classical.choice` and `Quot.sound`
were allowed. All 72 modules passed exact singleton stock-kernel replay in
fresh one-worker processes.

The [unchanged raw receipt](verification/hyperplane-main-exact-44531509741/receipt.json)
has SHA-256 `1c0d6a6fbe2ea16bbcfa88808ec8d83f0e412217e76c03803780ff0737fa1c15`.
The [preservation record](verification/hyperplane-main-exact-44531509741/preservation.json)
authenticates the actual original source, object, audit, log and progress
bytes. Artifact `14535236819` has ZIP SHA-256 `27d65f3b5d667260dfad8d639f6d1182a3b5e54c032a2e2954d7764e060fe638`.

Registration adds 63 previously unregistered proof modules and 102 new
required endpoints, with all 72 checked source blobs guarded. The accepted
list has 969 proof modules plus two roots. This completes the fixed-hyperplane
result; verification of the merged accepted package remains a separate gate.
The [result-level scope](../results/loneliness-on-a-hyperplane/LEAN.md)
records the precise sample, formulas and distributional formulation.

## Conditional nine-through-thirteen speed norm reduction

The 81-module closure of `LonelinessTightNormBounds` is checked and
registered. For a positive primitive `k`-tuple with `9≤k≤13` and actual
loneliness value at most `1/(k+1)`, it proves the literal squared-norm
cutoff and a listed prime dividing no speed, under the explicit hypothesis
`∀ m, 1≤m → m<k → LonelyRunnerBound m`. The basis geometry,
nearest-plane bounds, all 7,936 KZ subset rows and prime-product margins
are proved internally.

[Run 44530735399/job 135583044214](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44530735399/job/135583044214)
passed at `8162a5dfbe89e441600e7a3bbcc03b573df0880e`: all 81 strict source checks, the all-owned
audit of 1,696 declarations (1,445 theorems and 538 private declarations),
all 25 required theorem endpoints, and all 81 exact singleton stock-kernel
replays. Sources and audit used warnings as errors without a linter override;
the only allowed axioms were `propext`, `Classical.choice` and `Quot.sound`.

The [unchanged receipt](verification/loneliness-large-norm-exact-44530735399/receipt.json)
has SHA-256 `fba4b952a87271f9691e983dd69dafc0be5c07617e412884eb82f2894ec2fef5`.
The [preservation record](verification/loneliness-large-norm-exact-44530735399/preservation.json)
authenticates the actual original sources, objects, audit and process records.
Artifact `14535137698` has ZIP SHA-256
`b6678fb2e27c872d01a2bbd6bea9982abc42411e79999b6c4113961195ab3366`.

Registration adds 64 proof modules and 25 required endpoints. The accepted
list then contains 1,033 proof modules plus two roots. The merged-package
gate remains separate. Lower-runner assumptions, exhaustive modular
classification and final uniqueness remain open, so no result directory
becomes complete from this reduction.
[Exact hypotheses, cutoffs and scope](loneliness-large-norm-lean.md).





