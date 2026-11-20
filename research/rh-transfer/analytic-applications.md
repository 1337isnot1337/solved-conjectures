# Analytic targets and prior-art exclusions

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). This note records the root worker's additional screening. The accepted input is exactly the zeta/Dirichlet result at [archive commit 9d5316e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). No Lean verification is in scope.

## Complete consequences and their provenance

The full Lindelöf hypothesis follows by a classical implication; a conductor-uniform proof for every Dirichlet character is in [dirichlet-applications.md](dirichlet-applications.md). The proof has been read independently: the holomorphic logarithm, nested-disc bounds, conductor-uniform convexity, principal-character pole, and imprimitive Euler factors are all accounted for. This is inherited mathematics, not a newly discovered implication.

The exact Simm–Wei derivative-moment statement needs more care. [Najnudel–Wei, 16 November 2026, Theorems 1.2 and 1.3](https://arxiv.org/html/2611.21551v1) give the full normalized complex moment limit under Lindelöf. The original [Simm–Wei Conjecture 1, equation (1.26)](https://arxiv.org/html/2409.03687v2) uses a ratio asymptotic. Its leading coefficient can vanish at complex parameters, so those two formulations must not be identified without qualification. The full derivation and the coefficient-zero argument are in [simm-wei.md](simm-wei.md). A notation defect is not being advertised as a new conjecture disproof.

The original Abel-summed Chebyshev prime-bias conjecture is being checked separately. Neither the unweighted prime race nor linear independence of zero ordinates follows from accepting Dirichlet GRH.

## Targets excluded by prior art

These exclusions prevent old or already claimed work from being counted as fresh solutions. A preprint's existence is evidence of a prior claim; it is not independent validation of that claim.

| Named target | Primary evidence | Decision |
|---|---|---|
| Pomerance's P-integer conjecture | [Hajdu–Saradha–Tijdeman 2011](https://arxiv.org/abs/1107.5191) gave an RH-conditional classification. [Yang–Togbé, J. Number Theory 140 (2014), 226–234](https://doi.org/10.1016/j.jnt.2014.01.014) proved it unconditionally. | Already proved; exclude. |
| Euler–Gauss idoneal-number completeness | [Weinberger 1973](https://matwbn.icm.edu.pl/ksiazki/aa/aa22/aa2221.pdf) gives the classical conditional route. The [October 2026 quasi-RH manuscript](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex) already advertises related consequences; [Liang, 17 November 2026](https://hexagonmath.org/2611.00500v1) claims a full proof. | Not a new transfer discovery; recent claim not independently certified here. |
| Patterson's cubic Gauss-sum first moment | [Dunn–Radziwiłł, Annals of Mathematics 200 (2024), 967–1057](https://annals.math.princeton.edu/2024/200-3/p03) assumes GRH for Hecke L-functions over Q(omega), a larger input family than rational Dirichlet GRH. [OpenAI's September 2026 paper and scope record](https://github.com/openai/math/blob/main/lean/docs/023.md) already claim the unconditional first moment over all primary Eisenstein primes. | Prior full claim; also the older conditional proof requires the wrong L-function family for a direct substitution. |
| Zhu's infinite log-concavity conjecture for xi coefficients | [Liu–Mao, 4 October 2026](https://arxiv.org/abs/2610.04972) explicitly claims an unconditional proof of strict infinite log-concavity. The RH implication is also already known from Brändén's theorem. | Exclude from new-priority targets; no independent certification of the October manuscript. |
| Montgomery–Vaughan character-sum bound | The bound of order square-root q times log-log q is a classical GRH consequence. October 2026 quasi-GRH implications and [Bhattacharjee–Bhattacharya, hexagon 2610.00256](https://hexagonmath.org/2610.00256v3) make additional prior claims. | Do not count a fresh application of the old theorem as an original solution. |
| Ankeny–Artin–Chowla conjecture | [Reinhart, arXiv:2410.21864](https://arxiv.org/abs/2410.21864), revised 2025, gives a counterexample; the author's publication list records Algebra & Number Theory acceptance. | Already disproved; exclude. |
| Vinogradov's least nonresidue and least primitive-root conjectures | Old GRH implications already exist. The October 2026 quasi-RH manuscripts explicitly discuss the least-nonresidue consequence. See [the detailed source audit](dirichlet-applications.md). | No new implication or priority claim. |
| Artin infinitude and positive lower density | October–November 2026 primary claims by OpenAI, Bhargava, and Vojdanovski are documented in [artin-density.md](artin-density.md). | Exact Artin density remains a separate research target; do not relabel infinitude as exact density. |

The searches checked exact names, original papers, later papers, and recent status claims with both search engines. Search results were followed to primary records where possible. No claim of exhaustive coverage is made.

## A source-reading correction

An earlier conversational suggestion that the local covolume lemma's `RecAt` assumption might be redundant was not justified. The source definition states exactly the inequality linking the normalized logarithmic covolume to the negative good-lattice slope:

```math
\frac{\mathop{\mathrm{lcv}}(X_i,M_i)}{D}
\le -\mathop{\mathrm{slope}}^2(\Lambda_{i,\mathrm{good}}).
```

See [CovolXOfCovol.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AbelianVarietyTheory/Definitions/Divisors/CovolXOfCovol.lean). The later [CovolumeFromGramAndBounds.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AbelianVarietyTheory/Proofs/DivisorProofs/CovolumeFromGramAndBounds.lean) clears this assumption inside some subsidiary inequalities, but it remains available for the final arithmetic combination. Clearing a hypothesis in a nested subproof does not show that the outer proof does not use it.

The assumption-elimination suggestion is withdrawn. No theorem or file was changed on its basis. This is a correction of the mathematical source reading, not a Lean-verification task.

## Current disposition

There is no new complete conjecture solution claimed by this note. The useful discoveries so far are the exact inherited consequences, the all-complex asymptotic qualification, the uniform CM transfer lemma, and the complete K-theory translation of the archive's arithmetic bound. The last two are documented in the companion notes and remain separate from the unresolved full Artin-density and Kummer–Vandiver targets.
