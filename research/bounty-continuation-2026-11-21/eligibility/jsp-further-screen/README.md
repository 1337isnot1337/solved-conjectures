# Further Justin Sun Prize formalization screen

Date: 2026-11-21 UTC. Status: no available complete formalization target identified in this tranche; no bounty completed.

## Scope and result

This checks twenty entries selected from the previously unassessed part of the JSP 651–1072 catalog. They were selected for potentially manageable proofs or counterexamples, rather than to repeat the already screened 351–650 range. The source catalog snapshot contained 292 entries marked mathematically solved and `Lean proof | No`; this note does not claim that all 292 entries have now been exhaustively audited.

All twenty selected entries have pre-existing public Lean submissions. Several have correct, general theorem endpoints alongside misleading numerical or incorrectly mapped submissions. A stale catalog `No` flag is therefore not evidence of an available first formalization. Four initial searches were rate limited; all four were retried successfully, and all four also have prior submissions.

The audit distinguishes an existing claimed full submission from an independently rebuilt and kernel-checked proof. The external proofs below were not rebuilt in this work, and their prize acceptance or payment was not established. Existing complete-statement sources are enough to reject them as clean new targets under the instruction to avoid existing full sources or PRs. No external code is attributed to this project.

## Screening receipts

PR numbers refer to [TheJustinSunPrize/awards](https://github.com/TheJustinSunPrize/awards/pulls). The count is the number returned by the public GitHub search query for the exact JSP identifier; only the first eight search results were retained for each query.

| JSP ID | Matching PR count | Representative prior submissions | Result |
| --- | ---: | --- | --- |
| 000679 | 6 | [1278](https://github.com/TheJustinSunPrize/awards/pull/1278), [4731](https://github.com/TheJustinSunPrize/awards/pull/4731) | Equal-divisor-sum ratio approximation already has a general endpoint. |
| 000733 | 13 | [731](https://github.com/TheJustinSunPrize/awards/pull/731), [5040](https://github.com/TheJustinSunPrize/awards/pull/5040) | Existing leading asymptotic and stronger logarithmic error submission. |
| 000745 | 10 | [2177](https://github.com/TheJustinSunPrize/awards/pull/2177), [1271](https://github.com/TheJustinSunPrize/awards/pull/1271) | Full lacunary-difference coloring submission predates the distance-one component. |
| 000753 | 6 | [1670](https://github.com/TheJustinSunPrize/awards/pull/1670), [5261](https://github.com/TheJustinSunPrize/awards/pull/5261) | Existing Erdős 908 formalization references. |
| 000755 | 7 | [1451](https://github.com/TheJustinSunPrize/awards/pull/1451), [4954](https://github.com/TheJustinSunPrize/awards/pull/4954) | Existing Erdős 910 formalization references. |
| 000760 | 8 | [1214](https://github.com/TheJustinSunPrize/awards/pull/1214), [1452](https://github.com/TheJustinSunPrize/awards/pull/1452) | Existing Dirac–Thomassen cycle submission. |
| 000797 | 7 | [4438](https://github.com/TheJustinSunPrize/awards/pull/4438), [1330](https://github.com/TheJustinSunPrize/awards/pull/1330) | Existing full-statement submissions. |
| 000799 | 7 | [1454](https://github.com/TheJustinSunPrize/awards/pull/1454), [957](https://github.com/TheJustinSunPrize/awards/pull/957) | Existing Erdős 960 ordinary-line bound submission. |
| 000837 | 7 | [1053](https://github.com/TheJustinSunPrize/awards/pull/1053), [1283](https://github.com/TheJustinSunPrize/awards/pull/1283) | Existing Farey-segment asymptotic endpoint. |
| 000838 | 9 | [707](https://github.com/TheJustinSunPrize/awards/pull/707), [1654](https://github.com/TheJustinSunPrize/awards/pull/1654) | Existing full orientation counterexample. |
| 000868 | 9 | [5019](https://github.com/TheJustinSunPrize/awards/pull/5019), [1459](https://github.com/TheJustinSunPrize/awards/pull/1459) | Existing correctly centered radius-two lemniscate theorem. |
| 000925 | 6 | [342](https://github.com/TheJustinSunPrize/awards/pull/342), [1402](https://github.com/TheJustinSunPrize/awards/pull/1402) | Existing derivative-root existence, uniqueness and strict-gap endpoint. |
| 000930 | 7 | [5621](https://github.com/TheJustinSunPrize/awards/pull/5621), [179](https://github.com/TheJustinSunPrize/awards/pull/179) | Full independence submission appeared at 06:01:29 UTC today, before this screen. |
| 000935 | 7 | [1463](https://github.com/TheJustinSunPrize/awards/pull/1463), [4974](https://github.com/TheJustinSunPrize/awards/pull/4974) | Existing Davies partition formalization references. |
| 000937 | 7 | [765](https://github.com/TheJustinSunPrize/awards/pull/765), [1566](https://github.com/TheJustinSunPrize/awards/pull/1566) | Existing full free-node interpolation statement. |
| 000966 | 9 | [4695](https://github.com/TheJustinSunPrize/awards/pull/4695), [1338](https://github.com/TheJustinSunPrize/awards/pull/1338) | General Beker theorem submission exists; small permutation groups are insufficient. |
| 000984 | 6 | [1316](https://github.com/TheJustinSunPrize/awards/pull/1316), [1342](https://github.com/TheJustinSunPrize/awards/pull/1342) | Existing sharp random finite-abelian-group asymptotic submission. |
| 001000 | 7 | [1285](https://github.com/TheJustinSunPrize/awards/pull/1285), [4900](https://github.com/TheJustinSunPrize/awards/pull/4900) | Existing full necessary-and-sufficient integral criterion. |
| 001016 | 6 | [1060](https://github.com/TheJustinSunPrize/awards/pull/1060), [1347](https://github.com/TheJustinSunPrize/awards/pull/1347) | Upper/lower wording mismatch already identified; both interpretations have prior sources. |
| 001022 | 10 | [1286](https://github.com/TheJustinSunPrize/awards/pull/1286), [4588](https://github.com/TheJustinSunPrize/awards/pull/4588) | Correct full divisibility-chain endpoint predates unrelated primitive-set submissions. |

`pr-screen.json` records the first sixteen successful searches and four initial HTTP 403 results. `pr-screen-retry.json` records the four successful retries. `catalog-sections.json` preserves fifteen catalog sections inspected in detail. `pr-bodies.json` and `pr-bodies-secondary.json` preserve twelve selected full or bounded-length PR bodies. These are primary-source receipts, not organizer decisions.

## Actual source endpoint inspection

Seven files were read at the pinned upstream commit `8822f7ddef30fadbd92e1c6ab4ed897af356af5e` in [plby/lean-proofs](https://github.com/plby/lean-proofs/tree/8822f7ddef30fadbd92e1c6ab4ed897af356af5e). `source-endpoints.json` records their URLs, source SHA-256 hashes, line counts, headers and exact endpoint excerpts. These files contain no literal `sorry`, `admit` or `axiom` hits; this lexical observation is not an audit of their transitive imported dependencies.

- `Erdos823.erdos_823` quantifies over every real alpha at least one and produces positive integer sequences with equal divisor sums term by term and ratios tending to alpha. Reciprocal sequences give the remaining positive ratios. This is not a finite list of equal-sigma examples.
- `Erdos1046.erdos_1046` states that every connected strict unit lemniscate of a monic complex polynomial is contained in some open disk of radius two. Its witness is the root centroid. The center is not fixed at zero.
- `Erdos1005.erdos_1005` asserts the Farey-segment limit `f(n)/n -> 1/4`, through a previously supplied source-limit theorem. The catalog's added 5/8 pairwise-sums citation is unrelated to this formal statement and should not be treated as its proof.
- `Erdos1006.erdos1006_orientation_counterexample` supplies a finite graph of girth greater than four such that every orientation is cyclic or becomes cyclic when a single arc is reversed. The simpler endpoint `not_erdos_1006` exports the full negative answer.
- `Erdos1195.erdos_1195` proves an equivalence for every nonnegative nondecreasing real function tending to infinity: existence of a measurable infinite-measure integer-ratio-free set whose counting function eventually dominates the prescribed function, if and only if the prescribed function divided by x squared is integrable on `[1,infinity)`. This covers the growth classification, not only existence of one infinite-measure set.
- `Erdos1211.erdos_1211` gives both the universal bound and an attaining partition for the sharp **upper** logarithmic density constant `(2 + sqrt(3))/4`. It does not address the catalog's literal **lower** wording. The separate prior PR 1060 does: its stated endpoint gives one positive-integer partition for which both colors' finite distinct subset sums have lower logarithmic density zero, including real-cutoff bridges.
- `Erdos1217.erdos_1217` quantifies over every strictly increasing positive integer sequence with positive lower logarithmic density and constructs a strictly increasing index subsequence forming a divisibility chain. The conclusion retains the full weighted-density lower bound for the chain growth rate.

## Scope checks that prevent false new-target claims

### JSP 868: translating the disk changes the conclusion

PR 1056 advertises a counterexample whose lemniscate extends outside the radius-two disk centered at zero. That does not refute the problem, which allows the center to vary. The correct arbitrary-center statement is already present in `Erdos1046.erdos_1046` and is also described by PR 5019. No new target is obtained by repairing the center in the incorrect submission.

### JSP 925: strictness and selector existence already supplied

PR 342 identifies `JSP000925Strict.exists_unique_strict_gaps` and `JSP000925Strict.strict_gap_theorem` in `ketianzhang1-lang/jsp-000301-lean`, commit `7b545f0e021b06d434654b17881c11819f3ff1b7`, path `projects/jsp-000925-strict/JSP000925Strict.lean`. Its statement includes an arbitrary nonzero real polynomial with equally spaced roots, construction and uniqueness of derivative zeros, reflection, and strict outward gap comparisons excluding the forced central mirror equality. Merely adding Rolle existence or excluding the central equality would repeat work already described in the prior complete submission.

### JSP 930: old component gap is no longer a clean entry point

The September PR 179 is explicitly a Wetzel-theorem component, not the full Hayman independence statement. The newer PR 5621, created on 2026-11-21 at 06:01:29 UTC, identifies `JSP000930.Consistency.hayman_1119_relative_independence` in `meowmath-ai/MeowLean`, commit `a25145bf1c579e654d377e8930679de576357584`, path `supplements/JSP-000930/src/JSP000930RelativeIndependence.lean`. It claims models with the same continuum cardinal and opposite answers to the intended Hayman statement. That new source was present before this work. Its substantial forcing development was not rebuilt here.

### JSP 937: the endpoint permits exterior inequalities

PR 765 pins `randyxian08/jsp000937-lean` at `c6819617f4d8de6afcbf63da31544ce2902f7b6a`, with target `JSPFreeNodes.Target937` in `Erdos1153/JSPInterpolation/Definitions.lean` and endpoint `JSPFreeNodes.jsp_000937` in `Erdos1153/JSPInterpolation/Logarithmic.lean`. Its stated scope includes free competitors, all interior and exterior intervals, the one-node case, the correct minimax characterization, and the logarithmic bound. Exterior peaks are allowed to exceed the shared interior threshold. Counterexamples to an incorrectly strengthened assertion that *all* peaks must be equal do not supply a new solution of this target.

### JSP 1016 and 1022: catalog paraphrases are unsafe targets

JSP 1016 says lower logarithmic density, while the cited Conlon–Fox–Pham theorem concerns upper logarithmic density. PR 1060 already records a complete literal lower-density counterexample at `Zyling-ai/jsp-001016-lower-density`, commit `2e81e37e9a2640c3abfda059a74ed50f97e83614`, endpoint `JSP1016.exists_positive_partition_both_conventions_zero` in `Result.lean`. Its status is scope review, not confirmed prize acceptance. The mismatch is not an unclaimed discovery here.

JSP 1022 is Erdős 1217, the divisibility-chain statement. Several submissions instead formalize Erdős 1196's primitive-set sum bound. Those mismapped submissions are insufficient, but correctly mapped prior sources also exist. PR 4588 explicitly acknowledges that plby already proves the full density bridge and chain conclusion; its claimed incremental contribution is a different discrete Abel implementation relative to another interface.

## Decision

Stop this selected tranche. No clean, narrow, unpaid full formalization task emerged. This is twenty additional exclusions, not twenty proofs, and not an exhaustive closure of the entire JSP catalog. The Althöfer obstruction and Sun-coset computations in sibling directories also remain partial research and do not add to the completed-bounty count.
