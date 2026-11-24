# Steinerberger’s greedy-energy Fourier conjecture

## Scope

The four Lean modules prove the unrestricted conjecture false. They construct an actual infinite sequence satisfying the source’s greedy minimization rule and prove that its truncated weighted absolute Fourier sum is not O(log n). This is a complete disproof of the original conjecture, not a finite-prefix numerical obstruction.

The written entry also proves a sharp limsup constant and invariance over all singleton initializations and tie-breaking rules. Those stronger supplements are not asserted by these Lean modules. They are not additional counted results.

## Exact source and attribution

Stefan Steinerberger, *Some Open Problems*, revision dated 31 March 2026, section 20, page 22, explicitly proposes

    W_n = Σ_{ℓ=1}^n (1/ℓ) |Σ_{a=1}^n exp(2π i ℓ x_a)| = O(log n)

for sequences that successively minimize the sum of the periodic kernel f(t)=t²−t+1/6. The indexed primary-source PDF was read directly, including its exact displayed Fourier estimate and the surrounding discussion. The unversioned live URL returned 404 on a direct fetch, while its indexed PDF remained available through the research tool.

The argument formalized is the van der Corput specialization of the existing repository proof in `results/steinerberger-greedy-fourier/PROOF.md`, especially the dyadic Fourier calculation and the alternating-binary lower bound. That proof was committed by Cinna Davis in `34862f40d7a8b4ee923a5a9ea1f8a9de9a895e43` on 24 November 2026. Florian Pausinger’s *Greedy energy minimization can count in binary*, Theorems 2.1 and 5.5, already provides the more general dyadic greedy structure and admissibility of the classical base-two van der Corput sequence. Ralph Kritzinger’s arXiv:2109.06298v4, Theorem 4 and Algorithm 3 (page 15), identifies the classical sequence for the corresponding minimum-point greedy algorithm. The formal proof does not assume either characterization. It proves admissibility directly using the two-point Bernoulli multiplication identity. No novelty or priority conclusion is claimed.

- Source conjecture: <https://faculty.washington.edu/steinerb/openproblems.pdf#page=22>
- Existing entry: <https://github.com/1337isnot1337/solved-conjectures/tree/main/results/steinerberger-greedy-fourier>
- Exact recorded proof commit: <https://github.com/1337isnot1337/solved-conjectures/blob/34862f40d7a8b4ee923a5a9ea1f8a9de9a895e43/results/steinerberger-greedy-fourier/PROOF.md>
- Pausinger: <https://doi.org/10.1007/s10231-020-00990-7>
- Kritzinger: <https://arxiv.org/abs/2109.06298v4>

## Statement audit

`kernel t` is the periodic second Bernoulli polynomial evaluated at the fractional part of t. Its endpoints agree, so this is the source’s function on R/Z. `IsGreedy x` requires every point to lie in [0,1) and every next point to minimize the actual sum of preceding kernel values against every real competitor. Minimization over all real representatives implies the exact circle minimization condition. Indices begin at zero: the source’s first point is our x 0, and its first n points are range n.

`weightedSum x n` is the literal sum over frequencies 1 through n, with the norm of the actual complex exponential prefix sum divided by the frequency. No energy statistic, squared Fourier statistic, averaged quantity, or relaxed minimizer replaces it. `GreedyFourierConjecture` uses mathlib’s asymptotic IsBigO at the natural-number atTop filter.

`vdc` is defined recursively for every natural input. `vdc_minimizes` proves its infinite greedy admissibility. `rotatedSum_norm` connects the auxiliary rotated exponential sum to the literal complex magnitude. At n_m=1+4+⋯+4^m, the exact magnitude at every frequency 4^j(2q+1), j≤m, is (2·4^j+1)/3. Injectivity and truncation lemmas show the selected frequencies really are distinct members of the conjectured finite sum.

A dyadic-block estimate gives Σ_{q<2^d} 1/(2q+1) ≥ d/4. Combining d disjoint valuation classes gives

    weightedSum vdc (n_(2d+1)) ≥ d²/8.

Meanwhile log(n_(2d+1)) ≤ (2d+2)log 4. Thus `weightedSum_violates` proves that for every nonnegative real C and every natural threshold N, some n≥N satisfies C log n < weightedSum vdc n. The endpoints `vdc_not_isBigO`, `conjecture_false`, and `counterexample` conclude the exact unrestricted disproof.

## Verification

Verification results and frozen hashes are recorded separately in `verification/receipt.json`. Completion requires a fresh strict build of all four source modules, a complete all-owned/private transitive axiom audit allowing only `propext`, `Classical.choice`, and `Quot.sound`, and exact stock-kernel replay of the four project modules. Repository-wide registration and publication checks are integration obligations handled separately. No repository-wide gate is claimed merely from these lane checks.

## Publication verification

The registered publication candidate passed a fresh run of `scripts/verify_steinerberger_greedy.py`: all four strict builds, the complete audit of 113 owned declarations including three private declarations, all 15 required endpoints, and exact stock-kernel replay. The [publication receipt](verification/receipt.json) pins the source, compiler, checker, verifier controls, object files, audit inventory and logs. Its source hashes agree with the independent review and [original lane receipt](verification/lane/receipt.json).

The aggregate `scripts/verify_lean.sh Conjectures.SteinerbergerGreedy` was also attempted during publication preparation while protecting the shared dependency cache from mutation. It exited 1 when Lake attempted to regenerate dependency artifacts in that read-only cache, including Mathlib `.ltar` files. The [actual aggregate log](verification/repository-lean.log) and [diagnostic receipt](verification/repository-lean.json) preserve that blocked result. The passing target-specific proof checks do not relabel it as a repository-wide pass. Hosted aggregate checks and deployment remain tracked in [issue #563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
