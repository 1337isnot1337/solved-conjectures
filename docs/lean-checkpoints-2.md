# Lean verification checkpoints, part 2

[Lean verification status and checkpoint index](lean-status.md)

## Complete Frankl high-girth frequency theorem

`FranklHighGirth.high_girth_generator_frequency` proves the full
`518208/1000000` bound for every point of a finite `k`-uniform generating
family, for every `k ≥ 3`, with exactly three indexed generators through each
point and no incidence cycle shorter than sixteen. The counted family
contains each distinct union once, including the empty union. Finite ground
is derived from the stated regularity assumptions. The small-degree cases
use all twelve checked K03–K14 cone certificates and actual graph-ball
configuration counts; the large-degree case derives linearity from the
girth assumption and applies the accepted `657/1000` bound.

The graph proof identifies the radius-seven incidence ball with its recursive
tree, transports actual boundary-conditioned independent-set configurations,
and averages the finite fiber bounds. There is no unproved recurrence,
counting identity, finite-certificate assertion, or numerical bound in the
final theorem's hypotheses. The `girth` and extended-`egirth` formulations
and the frequency bound after removing the empty union are also checked.

At source commit `f421f4434ffc8117a57a14b99c19818e76dcfd8e`, all 64 project
modules passed fresh strict compilation. The explicit import-all audit
covered 1,363 owned declarations, including 909 theorems, and all 35 required
endpoints. Exact replay with the pinned, unchanged stock checker passed in
72.750 seconds, with peak RSS 12,834,268 KiB. Every recorded source, object
facet, compiler, checker, and gate hash was unchanged after checking.

[Original receipt](verification/frankl-components-44516856625/high-girth-theorem.json) ·
[Hosted run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44516856625).
The original receipt SHA-256 is
`e872e48c8199c0c713d6a9cbc50e3d9ef42d8e32ed62e418ddcd282e104f65cf`.
The 47 newly registered modules and 34 new required endpoints join the shared
package. Its full merged-package build and replay are a separate gate.
The cyclic span-four theorem remains incomplete, so the Frankl result entry
remains partial. Li remains last.


## Complete Erdős 607 line-size asymptotic

The final endpoints concern `lineSizeCount n`, the actual number of records
of determined-line sizes for finite sets of `n` distinct real-plane points.
The previously registered geometric theorem identifies this count with the
canonical tuple count for every natural `n`, including the small cases.
The final analytic proof retains that definition throughout.

Writing

```math
A=\frac{\pi^2}{12}+\frac{(\log 2)^2}{2},
```

`LineSize.CoefficientAsymptotic.lineSizeCount_sharp_ratio` proves that the
ratio of this actual count to

```math
\frac{3}{16\sqrt{6\pi}\,A^{1/4}}\,
n^{-1/4}\exp(2\sqrt{An})
```

tends to one. The companion `lineSizeCount_sharp_asymptotic` states the
asymptotic equivalence directly. All local-limit, domination, tail, and
coefficient-extraction inputs are discharged in the import closure.

The proof uses the literal finite geometric characteristic product, its
summed cubic logarithmic error, the corrected Euler factor, and the actual
first and second moment limits. A floor-defined lattice step turns the
core-length sum into an integral. Its measurable integrand, pointwise limit,
integrable majorant, and coupled Gaussian constant are all proved. The exact
saddle choice and negligible constant contribution complete the normalization.

The analytic generating-function closure also proves absolute convergence,
the actual count's series value, the explicit generating function, and the
Fourier coefficient identity. It complements the earlier coefficientwise
formal power-series proof.

| Final component | Snapshot | Modules | Audited project theorems | Passing job | Exact receipt |
| --- | --- | ---: | ---: | --- | --- |
| generating-evaluation | `daa7d2c5eb297ee0ebe5519cc256e418208db658` | 39 | 867 | [Job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44512719031/job/135523776951) | [JSON](verification/line-size-generating-evaluation-daa7d2c5.json) |
| sharp-asymptotic | `36b137220a62a4c9170fcd6a96978dc5ac175bf9` | 78 | 1582 | [Job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44517650047/job/135537784932) | [JSON](verification/line-size-sharp-asymptotic-36b13722.json) |

Both closures passed strict source checks, the transitive standard-axiom
whitelist, and independent replay with the unchanged pinned kernel checker.
The module and theorem counts overlap and are not additive. Both artifact
ZIPs were verified before their unchanged JSON receipts were recovered:

- Artifact `14525466121`: ZIP SHA-256 `c138d6e941eefd2568856ca02e56307779d32d0ed3aba7c328a84be33ad2b0d8`; receipt SHA-256 `93d7bf4cb5ef276f1f25e06fddfa831338dd245ff6168f986e9e53d18af6732a`.
- Artifact `14527596723`: ZIP SHA-256 `26f545e4418122d186c7bfdc32b0a8133f70f1161fb1d46880a7df6f2265b152`; receipt SHA-256 `16e86762b72ede1922f907ad76af0164ebb0ba18ee646620dbc09c9853ef1c34`.

All 93 distinct recorded source, gate, and pinned-input paths match their
passing hashes. The registration adds 44 proof modules and 20 required
declarations, for 878 accepted proof modules plus the two roots.
This completes the stated Erdős 607 note. The full merged-package gate
remains separate, and the repository-wide campaign is incomplete.


## Actual Legendre-pair matrix and quotient transport

The actual two-row construction is checked for every finite abelian group: a Legendre pair yields a sign matrix of order twice the group cardinality plus two, with the required Hadamard Gram identity. In particular, a length-1197 pair yields an actual order-2396 Hadamard matrix. The proof derives the row-sum normalization internally.

The quotient transport is also checked. From the actual centered rows and an order-27 subgroup of common multipliers, Lean derives the order-133 quotient rows, their bounds, weighted sums and correlations, and the order-21 layer constraints used by the finite no-lift argument. No abstract quotient-data certificate is assumed. The final exclusion of order 27 and the sharper multiplier bound of nine remain pending the complete finite certificate and final assembly.

| Task | Modules | Audited project theorems | Passing job | Exact receipt |
| --- | ---: | ---: | --- | --- |
| construction | 5 | 87 | [Job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44519345569/job/135546487503) | [JSON](verification/hadamard-legendre-construction-20e04e58.json) |
| quotient-data | 18 | 353 | [Job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44519345569/job/135546487631) | [JSON](verification/hadamard-legendre-quotient-data-20e04e58.json) |

Both exact closures at `20e04e589d227086cc926579fc70806594d8f817` passed strict source checks with warnings treated as errors, the standard-axiom whitelist audit, and independent pinned-kernel replay. The 29 distinct source, verification-script, workflow and toolchain-pin paths in the two receipts were checked against current main before registration. 8 previously unregistered proof modules and 13 named endpoints are added; the accepted prebuild list grows from 878 to 886 proof modules, plus the two roots. Verification of the merged accepted package remains a separate gate.

## Complete unrestricted two-speed insertion theorem

The literal two-speed interval statement is checked for every natural
$`p\ge3`$ and every two positive integer speeds $`b,c`$, with no upper bound:
there is a real $`t\in[1/(p+2),1/p]`$ such that both distances to the nearest
integer are at least $`1/(p+2)`$.

The closure proves the measure estimate, endpoint divisibility, explicit
perturbed reciprocal times, all eight small-parameter certificates, and the
bound that reduces the remaining second-speed search to finitely many cases.
No numerical table or large-speed cutoff is assumed.

The insertion theorem applies to every base that stays separated on the
whole prescribed interval. The proof verifies that interval property directly
from the stated Goddyn–Wong gcd criterion for simultaneous accelerations,
and proves the lower bound after common dilation. The arithmetic criterion
is the stated hypothesis of the result, not an unproved external theorem.

The same closure checks the three-insertion obstruction: throughout
$`[1/6,1/3]`$, the clearance of `[4,6,10]` is at most $`1/7`$. It also checks
the actual five-speed witness for `[1,2,4,6,10]` at $`3/8`$.

At source commit `9f51470529423e8135c08de881cd56f5b1fd9a95`,
[run 44524198858/job 135562276051](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44524198858/job/135562276051)
freshly checked all 27 modules with warnings treated as errors and no linter
override. The audit covered all 563 owned declarations, including 424
theorems and 11 private declarations, and required all 49 named endpoints
to be theorems. Every module was then replayed as an exact singleton target
in a fresh process by the unchanged pinned stock checker, with one worker.
Only `propext`, `Classical.choice` and `Quot.sound` were allowed.

The [unchanged raw receipt](verification/two-insertions-exact-44524198858/receipt.json)
has SHA-256
`215df211e3e47abf148fd306cf43eef6cd1827a4b1b4cb61140743b2de36f55a`.
[Preserved audit, inventory, logs and controls](verification/two-insertions-exact-44524198858/)
and the [archive verification record](verification/two-insertions-exact-44524198858/preservation.json)
authenticate the original artifact `14529194546`, whose ZIP SHA-256 is
`bed76da06d98fda0721def565d9d451a3a79ce2071fe7ebe708bc723e8d7c248`.
All 27 checked source hashes were guarded at registration. The accepted
registry gains 18 proof modules and 49 named endpoints, bringing its
prebuild list to 904 proof modules plus the two roots.

This completes the original insertion note. The general lonely-runner
conjecture and the separate spectrum/classification notes remain outside
this result. Verification of the merged accepted package is separate.

## Six-speed spectrum: complete realization

For every natural `P ≥ 7` with `P % 6 = 1` or `P % 6 = 5`,
`Loneliness.SixSpectrumRealization.realizes` constructs a list of exactly
six distinct positive integer speeds with gcd one and actual loneliness
value $`(P-1)/(6P)`$, strictly below $`1/6`$. It assumes no runner bound,
critical-plane classification or finite-exhaustion statement.

The residue-one branch uses the proved consecutive family. The residue-five
branch proves the exact value of
`[6, 6n+5, 6n+11, 6n+17, 6n+23, 12n+28]` for every natural `n`,
including zero, with an actual attaining time and an upper bound at every
real time. A separate checked tuple supplies `P = 11`.
Both branches retain the positive, distinct and primitive conclusions.

[Run 44527134869/job 135570566146](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44527134869/job/135570566146)
checked the exact 11-module closure at
`a3d77bc65f3cd979f92590037eb8895c5c2eb25d`. All project sources were
freshly compiled with warnings treated as errors and no linter override.
The audit checked all 392 owned declarations, including 306 theorems and
30 private declarations; all 15 required endpoints have theorem kind.
All 11 modules passed exact singleton stock-kernel replay in fresh
one-worker processes. Only `propext`, `Classical.choice` and
`Quot.sound` were permitted.

The [unchanged raw receipt](verification/six-spectrum-realization-44527134869/receipt.json)
has SHA-256
`6d0d9bb9f7215e2f5138e277d72debf13f99edf9e3519c26eca0bdf6595d8bb9`.
The [preservation record](verification/six-spectrum-realization-44527134869/preservation.json)
authenticates all 71 original archive files, including sources, proof
objects, audit inventory and process evidence. Original artifact
`14532651083` has ZIP SHA-256
`b58416de9802b4a54b1d9dd2590144c8933de7368b32e7257ef20de18306b2ce`.
The raw receipt's `explicit_import_all` label records validated full
serialized visibility for this legacy-module closure; it does not assert
that the source used modern `import all` syntax.

Registration adds the two new modules and 13 previously unregistered
endpoints, with all 11 checked source blobs guarded. The accepted prebuild
list now has 906 proof modules plus two roots. This completes the existence
direction of the spectrum statement. The universal family and off-family
classification remains incomplete; the result entry remains partial.
Verification of the merged accepted package is a separate gate.

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

## Six-speed spectrum reduced fraction arithmetic

`Conjectures.LonelinessSixSpectrumArithmetic` is registered. It proves the exact
reduced forms of the proposed values: `a/(6a+1)` for `a≥1`, or
`(3s+5)/(18s+33)` for `s≥0`. Every member has six distinct positive primitive
integer speeds realizing that value. The odd-denominator condition and gaps
one or three are proved necessary. They are not sufficient by themselves:
`4/27` satisfies both conditions but is outside the proposed parameter set.
No statement that all six-speed tuples have these values is assumed or proved
by this component; the universal classification remains open.

[Run 44537865221/job 135607998981](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44537865221/job/135607998981)
passed at `26ad213ec179acb14affbe5274f8ed4af45ef7d5`: all 12 fresh strict sources,
all 421 owned declarations (335 theorems, 31 private declarations), all eight
required theorem endpoints, and all 12 exact singleton stock-kernel replays.
Only `propext`, `Classical.choice` and `Quot.sound` were allowed. The sibling
seven/eight-speed job in this run failed; its candidate scope is not accepted
by this receipt.

The [unchanged raw receipt](verification/six-spectrum-arithmetic-exact-44537865221/receipt.json)
has SHA-256 `7eeecaabb0f4c334857f415fd9b2e84025600e503c80098e340aa3ba6dd20c45`.
Artifact `14535809302` has ZIP SHA-256
`78561160c02bf670763318a1fe7ce8d02451995ae08ddef6d0f4b22912b820fa`.
The [preservation record](verification/six-spectrum-arithmetic-exact-44537865221/preservation.json)
records authentication of the original archived source and object bytes,
reconstructed all-owned audit, and process records. Registration adds one
proof module and eight required endpoints. The merged-package gate remains
separate, and the six-speed result remains partial.


### Six-speed sporadic values and denominator bounds

The module `Conjectures.LonelinessSixSporadicBounds` is registered after its exact gate passed at commit `85550e14596e630cd09c470ae29222331f1aa3fb`, [run 44539038584, job 135612147649](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44539038584/job/135612147649). This is the passing six-arithmetic matrix job; the sibling seven/eight job failed and is not accepted by this record.

The six public theorem endpoints prove the exact values of all nine listed sporadic sextuples, their arithmetic, their spectrum parameter form, the speed bound `d < 3*q` for every positive-denominator representation of their actual value, and the reduced denominator identity `q = 6*a + 1`. List permutations are included. This does not classify sextuples outside the nine-row list.

The gate rebuilt all 13 project source modules with warnings treated as errors, audited all 465 owned/raw declarations (359 theorems, 33 private declarations, 14 required endpoints), and independently replayed all 13 exact module targets with the pinned stock kernel. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. Compiler and checker hashes, exact source bytes, all object facets, original audit source and inventory, process records, and log hashes were checked against artifact `14538960017` (ZIP SHA256 `87afb597432653a835959a50358b2f5145a8605b606d2831c1389f2046c1cf92`). The raw receipt SHA256 is `93d5a70e16e3b2d7b1586dc06f88dd9f80ac60689cc0451ec058520d37152a26`.

Original receipt, audit, logs, progress records, archive member inventory, and preservation record are under [verification/six-sporadic-exact-44539038584](verification/six-sporadic-exact-44539038584/). Registration adds this one module and six endpoints; the full combined accepted-root gate remains a separate obligation. The six-speed spectrum directory remains partial because universal exhaustiveness has not been proved.


### Seven- and eight-speed spectrum realizations and exact candidate bounds

Three modules are registered: `LonelinessSevenSpectrumRealization`, `LonelinessEightSpectrumRealization`, and `LonelinessHigherSpectrumBounds`. Their exact passing snapshot is `4ccedd53fd68e40ef36e6d133f5e793f4c611a9f`, [run 44541874811, job 135622052992](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44541874811/job/135622052992). Only the passing seven-eight job supports this registration; failed triangle and six-plane siblings are excluded.

Every proposed seven-speed value `s/(7*s+1)` for `s >= 1`, or `3/23`, `5/37`, `9/65`, is realized by seven distinct positive primitive speeds. Every proposed eight-speed value `s/(8*s+1)` for `s >= 1` is likewise realized by eight distinct positive primitive speeds. Positivity and the strict thresholds `1/7` and `1/8` are proved.

The 27 original seven-speed sporadic rows and 17 eight-speed rows have their stated exact values and arithmetic. `KnownSeven` contains the consecutive seven-speed family and its finite table, with permutations; `KnownEight` contains all three stated eight-speed families and its table, with permutations. For every member and every positive-denominator representation of its actual value, the sharp bounds are `5*d <= 13*q` and `17*d <= 21*q`. Explicit equality witnesses prove that the constants `13/5` and `21/17` cannot be lowered on these candidate classes. The exceptional eight-speed families retain their special parameter-one value.

The modules also prove that every listed candidate has a proposed spectrum value and identify every reduced numerator/denominator pair. Seven-speed reduced pairs have `q = 7*p+1` or are exactly `(3,23)`, `(5,37)`, `(9,65)`; eight-speed reduced pairs have `q = 8*p+1`. The corresponding denominator-defect conclusions follow for `KnownSeven` and `KnownEight`. These statements do not assert that every arbitrary low-value tuple belongs to the candidate classes. Universal seven/eight classification remains open in this campaign, so neither directory is marked complete.

The gate freshly checked all 16 project sources with warnings treated as errors, audited all 647 owned/raw declarations (481 theorems, 16 private declarations, 26 required endpoints), and independently replayed all 16 exact module targets with the pinned stock kernel. The only allowed transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`. Artifact `14538953168` has ZIP SHA256 `408e523f52846a868217f97aae153d74369ef3f89fa3868d92d45a2a6722e346`; its raw receipt SHA256 is `5ccd2ff37f0928feb38e10e153abcd1f36eb759b0cdd5c264e11ca910ddc9981`. Source and control hashes, every object facet, the original audit and inventory, process records and logs were authenticated before preserving the unchanged evidence in [verification/seven-eight-spectrum-exact-44541874811](verification/seven-eight-spectrum-exact-44541874811/). Registration adds three modules and 26 required endpoints; the combined accepted-root build/audit/replay remains separate.


## Five-runner lower-bound candidate

The new `LonelinessFiveRunner*` sources target the unconditional lower bound
`1/6` for at most five positive speeds and the two primitive equality
directions `[1,2,3,4,5]` and `[1,3,4,5,9]`. The direct route combines a
16-row KZ product certificate, a squared-norm cutoff of `347142`, and five
complete modular packets with 7070 support frames. The finite soundness,
consequences, and product-certificate modules passed local strict source
checking. The full final theorem gate is pending; no result is registered or
marked complete by this candidate. The structural population counter also
passed an eight-case source and stock-kernel diagnostic with the original
checker propositions. [Statements, census, and verification scope](five-runner-exact-candidate.md).

### Higher-speed triangle consequences under primitive classification

`Conjectures.LonelinessHigherTriangleConsequences` is registered after its exact gate passed at commit `788e2572b877750158bd471191ef9701c50b93bd`, [run 44545339492, job 135634276616](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44545339492/job/135634276616). Only the passing triangle job supports this checkpoint; the failed six-plane semantic and data-pilot jobs are excluded.

The module constructs triangles in the actual integer distance graph for both six-speed product families, the signed six-speed third family, all nine six-speed sporadics, the stated seven/eight families, and all 27/17 higher sporadics. The vertices are `0, x, x+y`; the signed third-family identity supplies these vertices without a positivity assumption on its real parameters. The speed list itself remains positive. Permutations and gcd rescaling are handled explicitly.

The final Zhu implications retain the precise primitive classification hypothesis: every positive, distinct, primitive list of length `k` with actual loneliness below `1/k` belongs to the stated candidate class. Under that hypothesis, for `k = 6, 7, 8`, a triangle-free integer distance graph is `k`-colorable, and a graph of chromatic number `k+1` contains a triangle. The classification hypothesis is not discharged here, so this checkpoint does not prove unconditional Zhu or exhaustive speed classification.

The gate rebuilt all 34 project source modules with warnings treated as errors, audited all 1,024 owned/raw declarations (805 theorems, 36 private declarations, all 23 required endpoints), and independently replayed all 34 exact targets with the pinned stock kernel. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed. Artifact `14541661556` has ZIP SHA256 `7dfc4798aed3e9a21b50010b5d9d00108d134253494fab8b41051d5bd0b60291`; the raw receipt SHA256 is `42b1e5aa90a5eef82cd785d70445d6d3273ed1fe13b62b26a62e119abf41dcba`. All 47 original source/control/configuration/helper files match the exact Git tree at the passing commit. Every archived source and object hash, original audit and declaration inventory, process record, and log hash was authenticated.

Unchanged receipt, audit, logs, progress records, archive-member inventory, and preservation record are under [verification/higher-triangle-exact-44545339492](verification/higher-triangle-exact-44545339492/). Registration adds one module and 23 required endpoints. The combined accepted-root gate remains separate, and no result directory is marked complete.



## Renault foundations and six-speed prime pilot, 19 November 2026

Two separate hosted gates passed. Neither checkpoint completes a spectrum classification.

| Checkpoint | Source commit | Project modules | Owned declarations | Private declarations | Required endpoints |
| --- | --- | ---: | ---: | ---: | ---: |
| Renault foundations | `f6b37c31b67d4905a03ebafca4e427aaf36d8ad8` | 18 | 605 | 131 | 64 |
| Prime-307 pilot | `7bfbeef3715b82f33bae00493f05c72d7a6978e4` | 85 | 3,910 | 91 | 8 |

Each gate rebuilt its complete project dependency closure with warnings treated as errors. It audited every owned declaration, including serialized private declarations, and replayed every module with the unchanged stock Lean checker. The transitive axiom whitelist was exactly `propext`, `Classical.choice`, and `Quot.sound`. Source, object, control, runtime, log, and audit hashes remained fixed.

The Renault checkpoint proves all eight universal real phase lemmas from Renault's six-runner argument, together with constrained maximization, affine time changes, exact gcd orbits, third-shift obstructions, two-multiple fiber arithmetic, and reindexing. The phase-certificate producers also reproduced their frozen source payloads. These are proved components; the full five-speed lower bound was not part of this passing gate.

[Renault run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44549206241/job/135648012899) ·
[Unchanged receipt](verification/renault-foundations-44549206241/receipt.json) ·
[Source, audit, and log evidence](verification/renault-foundations-44549206241/evidence.tar.gz) ·
[Preservation record](verification/renault-foundations-44549206241/preservation.json).

The prime-307 pilot proves the original support-checker propositions for minimum pairs 2 and 153. The larger root uses blocks of 32 frames and transports computation through the proved counted-bit checker. The pilot checks two selected roots; the remaining minimum pairs and the complete prime classification are still open.

[Prime-307 run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44540677853/job/135617953079) ·
[Unchanged receipt](verification/p307-pilot-44540677853/receipt.json) ·
[Source, audit, and log evidence](verification/p307-pilot-44540677853/evidence.tar.gz) ·
[Preservation record](verification/p307-pilot-44540677853/preservation.json).

The original artifact ZIPs and raw receipt hashes were authenticated against GitHub's artifact metadata and completed job logs. Every preserved source, object digest, audit inventory, and process log was revalidated after download. The evidence archives contain the original proof sources, controls, certificate data where present, audit inventories, logs, and process profiles. This preservation step did not perform a new local Lean replay.

The complete Renault proof is a separate candidate at `af144a83407065bc9b4ffae707c9b360a5f9c399`, tracked in [issue 38](https://github.com/1337isnot1337/solved-conjectures/issues/38). Its final endpoint has type `CoordinateSubspace.LonelyRunnerBound 5` and discharges the four-speed input. Its [106-module gate](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44550409224) is separate from the passing foundation gate. No complete five-speed bound or new accepted-module registration is claimed by this checkpoint.

## Critical seven-coordinate planes and large-norm family

The roots `LonelinessSevenCoordinateClassification` and
`LonelinessSevenCoordinateLargeNormFamily` are registered. Their classification
directions retain exactly these two mathematical inputs:

- `h5 : LonelyRunnerBound 5`: every nonempty list of at most five distinct
  positive speeds has loneliness at least `1/6`.
- `h6 : PrimitiveSixClassification`: every positive, distinct, primitive
  six-speed list with loneliness at most `1/7` is a permutation of
  `[1,2,3,4,5,6]`.

Under `h5` and `h6`, a rational two-plane in seven coordinates has actual
space loneliness `1/7` if and only if it is a signed coordinate permutation
of the standard product plane. The converse value calculation for every
standard product plane is unconditional. The finite enumeration, repeat-line
tests, signed-coordinate normalization, and geometric assembly are proved
internally.

Under the same two inputs, every positive primitive tuple `v : Fin 7 → ℕ`
with `value (List.ofFn v) < 1/7` and Euclidean norm at least `7*42^10` is an
actual permutation of `[1,2,3,4,5,6,7*s]` for some `s >= 1`. Its exact
real-time loneliness is `s/(7*s+1)`. Integer product parameters, gcd transfer,
and the family value are included in the checked proof.

Exact [run 44547965580, job 135643591005](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44547965580/job/135643591005)
at `d082b9a7adbed4144ccc9a961023bcae46f00e3d` passed all 105 fresh strict
source checks, all 23 required theorem endpoints, the complete audit of
2,105 owned/raw declarations (1,864 theorems and 630 private declarations),
and 105 independent exact stock-kernel targets. Only `propext`,
`Classical.choice`, and `Quot.sound` are allowed.

Artifact `14542847200` has ZIP SHA256
`194c41f3c61b853102ee11251881edf82b0bdbda0fbf0fb3c4776966050bf7f8`.
The unchanged receipt has SHA256
`7ed624c23f151717a7d2df018d77c994bbe26dbc9f6a20122eb353234a95adf7`.
All 635 archive files were authenticated. The 425 original receipt, audit,
log, and progress files are preserved in
[verification/critical-seven-exact-44547965580](verification/critical-seven-exact-44547965580/),
with archive-member hashes and an independent validation record.

Registration adds 47 modules to the accepted module list and 23 required
endpoints. This checkpoint completes the stated finite and geometric bridge
with its explicit inputs. It does not discharge `h5` or `h6`, and it does not
establish unconditional seven-speed spectrum exhaustiveness. No result
directory is marked complete by this registration. The merged-package gate
remains separate from this exact component evidence.


### Accepted seven-speed low-gap input for the eight-coordinate argument

`LonelinessSevenLowGapInput` is now an accepted component. Within the stated seven-speed families and sporadic rows, loneliness strictly below `3/23` leaves exactly the bases `[1,2,3,4,5,6,7]`, `[1,2,3,4,5,7,12]`, and `[1,4,5,6,7,11,13]`, each with value `1/8`. The proof filters every table row, forces the consecutive-family parameter to be one, and retains permutation and positive gcd scaling. Its extension to arbitrary positive distinct seven-speed lists explicitly assumes `PrimitiveClassification`; this registration does not establish that classification or the eight-speed spectrum theorem.

The original passing [run 44551449045](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44551449045), job `135655971010`, checked commit `aac4fff06ba8f6678d60a1665ab4790562cbbc5a`. It compiled all 17 project modules from fresh sources with warnings as errors, audited all 663 owned/raw declarations (494 theorems and 16 private declarations), required all eight endpoints, and replayed all 17 exact project-module targets separately with the unchanged stock checker. Only `propext`, `Classical.choice`, and `Quot.sound` were permitted. No linter override or cached project-proof acceptance was used.

Artifact `14542014520` has ZIP SHA256 `256cfdb7f4e00cee8253f0f8c2e59037d9e3bcb4db428d3484054a7c7ed33077`; its unchanged raw receipt has SHA256 `4d5996deff454e567510b3445317d11bea3ba1b65e8e6047d3637c8e41c30211`. All 30 source/control/helper/configuration files matched the exact passing tree. The archive validator authenticated all 107 members and preserved 75 unchanged evidence files under [`docs/verification/seven-low-gap-exact-44551449045/`](verification/seven-low-gap-exact-44551449045/), including the original receipt, complete owned-declaration inventory, generated audit source, process logs and progress records. Failed or still-running sibling tasks are outside this acceptance checkpoint.


### Accepted six-plane direction coverage and certificate chunk joins

The exact 20-module data-and-coverage component is accepted. It checks all `10 × 720 × 6 = 43,200` cells of the coordinate-permutation lookup through 120 bounded checks and a proved quotient/remainder join. The permutation-rank proof covers all 720 permutations; the lookup supplies the exact 360-row quotient used by the numerical certificate. The three certificate pilots are nested checks of 32, 256, and 1,280 cases for the first pattern pair, so their sizes must not be added as disjoint coverage. The generic chunk-join theorems recover every row when the chunk size is positive and `blocks * size = 360`, and transport checked row certificates to `CandidatePairsChecked` with numerical direction coverage explicit. They still require all numerical chunk checks as hypotheses.

This checkpoint does not establish all 1,152,000 candidate-pair cases or the six-plane classification. The complete pair table and its separate distributed gate remain separate work. The lookup tables are pure noncomputable definitions; the ordinary kernel evaluates the checked expressions, with no `native_decide`, custom axiom, linter override, or increased verification budget.

Original [run 44551449045](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44551449045), job `135655971048`, passed at `aac4fff06ba8f6678d60a1665ab4790562cbbc5a`: 20 fresh strict source modules, all 414 owned/raw declarations (317 theorems, zero private declarations), all nine required endpoints, and 20 exact independent stock-kernel targets. The axiom whitelist was exactly `propext`, `Classical.choice`, and `Quot.sound`.

Artifact `14543834207` has ZIP SHA256 `1a8fa5d2400e25a00ca381c16a98be42f765cf7b199a07e171dfbb648dce5067`; the unchanged receipt hash is `e648e84040f83963f18d44152638d02c3c800e1e3ee1624a2de96d50285c67ee`. All 33 source/control/helper/configuration files matched the original passing tree, and the proof sources still match the registered versions. All 125 archive members were authenticated. The 87 unchanged raw evidence files are preserved under [`docs/verification/six-plane-coverage-exact-44551449045/`](verification/six-plane-coverage-exact-44551449045/). Failed semantic sibling jobs and later whole-table jobs are outside this acceptance checkpoint.


### Six-speed norm geometry from an explicit plane gap

The 52-module norm component is accepted. For a positive primitive six-speed vector with loneliness value at most `1/6`, it proves Euclidean norm strictly below `21829`, assuming `LonelyRunnerBound 4` and that every rational two-dimensional plane containing the vector has space value at least `2/11`. It constructs a reduced integral basis, proves all five Gram-prefix bounds, and proves the determinant identity internally. The five required endpoints are `exists_gram_data`, `numerical_margin`, `squaredNorm_lt`, `norm_lt`, and `natural_squaredNorm_lt` in `Loneliness.SixSpectrumNormGeometry`.

The norm bound is stronger than the original ambient bound `163350`. This component retains its plane-gap and four-speed hypotheses. It does not prove arbitrary rational-subspace covolume bounds, the finite off-critical classification, or the complete six-speed spectrum. The result-level completion status is unchanged.

Original [run 44555513834](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44555513834), job `135670390120`, passed at `f66de17709f2dd9f46c96cd1fc9b0ed3b60fda2a`: 52 fresh strict source modules, all 1,269 owned/raw declarations (1,051 theorems, 60 private declarations), five required endpoints, and 52 exact independent stock-kernel targets. The axiom whitelist was exactly `propext`, `Classical.choice`, and `Quot.sound`. Verification budgets and warning settings were unchanged.

Artifact `14544624570` has ZIP SHA256 `541410f007a756a1a10fee1c5abebb53d6cd6c40ecf163c576d0df9a18f15a11`; the unchanged receipt hash is `1ac075b71fe894ee81f37c8bab28dc9679b4528371c9afaef61ee14f4fc81a5c`. All 65 original source/control/helper/configuration files matched the passing tree. All 317 archive members were authenticated. The 213 unchanged raw evidence files are preserved under [`verification/six-spectrum-norm-exact-44555513834/`](verification/six-spectrum-norm-exact-44555513834/), with a separate preservation record and archive inventory. `scripts/validate_six_spectrum_norm_archive.py` reproduces the offline provenance checks; it does not claim a new Lean execution. `LonelinessKZSmallData` and `LonelinessSixSpectrumNormGeometry` are now registered with the accepted root and verifier.


## Product-plane integer speed bridge (2026-11-19)

`Conjectures.LonelinessProductPlaneSpeeds` is registered from the original passing [run 44553736720](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44553736720), job `135664057075`, source commit `eeef183d9fbb54a0dc46148a56b26928216101b3`. The exact 40-module project closure passed fresh strict source compilation, the complete owned and private declaration audit, and 40 separate stock-kernel target replays. The audit checked 860 owned/raw declarations, 730 theorems, 10 private declarations, and all four required theorem endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` occur in the allowed axiom set.

The theorem uses the actual rational plane spanned by `(W,0)` and the last coordinate axis, transported by signed coordinate permutations. A base coordinate equal to one recovers an integer scale. A positive integer direction then gives the complete speed list `(A W,b)`, including all multiplicities and its actual permutation. For a primitive list below `1/q`, with `q ≥ 4`, a primitive base and nonzero base residues modulo `q`, the proved product-family arithmetic yields exactly `W ++ [q*s]` for a positive integer `s`. The required endpoints are `Loneliness.ProductPlaneSpeeds.integer_coordinates`, `absolute_list`, `product_parameters_of_positive_direction`, and `primitive_family_of_below`.

This is a membership-to-family bridge. It does not prove that every low-value direction lies in one of these planes, discharge any finite classification premise, or complete the six-, seven-, or eight-speed spectrum result.

The original artifact is `14545500562` (6,623,688 bytes), ZIP SHA-256 `03bfed1335de52058aacd5d81887684eb38368baad81102fc6d0121b539fc002`; the raw receipt SHA-256 is `6b416de0a4c875bfbacf0164c65cc3d8648b1c23f4ef388c367b6504ac11f0c5`. All 53 historical source/control/configuration files match the original Git blobs, and all 245 archived members were authenticated. The unchanged receipt, generated audit source, declaration inventory, process logs, progress records, archive manifest, and preservation record are under [`docs/verification/product-plane-speeds-exact-44553736720`](verification/product-plane-speeds-exact-44553736720/). The recorded validation command is `python3 scripts/verify_higher_spectrum_realization_exact.py product-plane-speeds` at that original source commit; preservation does not claim a new execution of that gate.


## Five-speed norm and prime avoidance, 19 November 2026

`LonelinessFiveRunnerNormData` and `LonelinessFiveRunnerNorm` are now registered.
For every positive primitive vector `v : Fin 5 → ℕ` of actual loneliness at most
`1/6`, the squared norm is at most `347142`. One of the primes
`149, 151, 163, 167, 173` divides none of its coordinates. Neither endpoint
assumes distinct coordinates. The norm certificate and the complete prime
product argument are proved internally.

[Run 44555436644](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44555436644)
freshly compiled the exact 108-module project closure, audited 2,824 owned
declarations including 34 private declarations and all 15 required endpoints,
and stock-replayed exactly those 108 modules. Only `propext`, `Classical.choice`,
and `Quot.sound` are allowed. The downloaded artifact was authenticated against
the published commit, every recorded source/object/log hash, the complete
private declaration inventory, and the actual replay transcript.

The original receipt and detailed scope are preserved in the
[component checkpoint](verification/loneliness-five-runner-norm-44555436644/README.md).
The other 106 dependencies were already registered with identical source bytes.
This component does not close the five-speed lower bound, either tight-five
classification, or the full five-speed spectrum theorem. The merged-package
gate remains separate from this component receipt.

## Six-coordinate plane semantics (19 November 2026)

The six-coordinate plane semantic component is accepted from [run 44557816556](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44557816556), job `135681972978`, at source commit `fdd22c92c4e8c88a486881b5561e95be5c44cd62`. Its exact 63-module closure passed fresh strict source compilation, the complete owned and private declaration audit, and 63 independent stock-kernel target replays. The audit checked 1,313 owned/raw declarations, 1,055 theorems, 15 private declarations, and all 31 required theorem endpoints. The allowed axioms were exactly `propext`, `Classical.choice`, and `Quot.sound`.

For a coordinate-free rational two-dimensional plane in six coordinates with actual space value below `2/11`, the semantic theorem recognizes one of the three original planes, up to coordinate signs and permutations: `(s,2s,3s,4s,5s,t)`, `(s,3s,4s,5s,9s,t)`, or `(s,t,s+t,2s+t,3s+t,3s+2t)`. The proof retains explicit inputs for the four-speed runner bound, the exact five-speed low-gap classification, and complete candidate-pair certificate coverage. The five-speed input is separately derived from `Loneliness.FiveSpeedCertificate.SporadicExhaustion`. The enumeration interface checks all 720 permutation ranks and proves that complete direction lookups and row/block certificate checks imply `CandidatePairsChecked`.

This acceptance supplies the semantic bridge and exact coverage interface. It does not discharge `SporadicExhaustion`, supply the complete numerical pair certificate, or establish unconditional six-plane or six-speed spectrum classification. The later wrapper that discharges the four-speed hypothesis and the separate complete finite-data gate are outside this receipt. Result-level completion boxes are unchanged.

Artifact `14550615276` contains 10,650,461 bytes and has ZIP SHA-256 `236667c95848500328181d1b15b1414ec6544a68daa31b27884e6974f19a4eeb`. The unchanged original receipt has SHA-256 `431d8358951a12ba901f94a124724a07a26802dcc7f43a65110ab5ba530f625a`. All 76 historical proof-source, helper, configuration, and controller Git blobs were authenticated; all 383 archive members, object hashes, process records, and audit data were checked. The 257 unchanged raw evidence files, archive inventory, and separate preservation record are under [`verification/six-plane-semantics-exact-44557816556/`](verification/six-plane-semantics-exact-44557816556/).

The original command was `python3 scripts/verify_higher_spectrum_realization_exact.py six-plane-semantics` at the stated source commit. `scripts/validate_spectrum_archive.py` reproduces the offline archive checks; preservation is not a new Lean execution. The eight new semantic modules, their seven previously unlisted five-speed dependencies, and the 31 required endpoints are appended to the accepted root, prebuild, and audit registries. `LonelinessSixPlaneDefs` and `LonelinessSixPlaneEnumeration` were already registered from the earlier coverage component.

## Unconditional five-speed bound and primitive transport, 19 November 2026

`Loneliness.Renault.five_speed_lonelyRunnerBound` now proves the unconditional five-speed runner bound. Its common-time endpoint proves that every positive `v : Fin 5 → ℕ` has a time in `[0,1]` at which all five distances are at least `1/6`; repeated speeds are allowed. The primitive intermediate theorem is extended by gcd normalization and padding. The final wrapper supplies the proved four-speed bound, so no unformalized runner theorem remains as an assumption of the five-speed endpoint. The proof follows [Renault's six-runner argument](https://compmath.wordpress.com/wp-content/uploads/2008/08/view-obstruction_a_shorter_proof_for_6_lonely-runners.pdf), including all eight real phase lemmas.

Three fixed component gates passed fresh strict source compilation, complete ownership and raw-private axiom auditing, and unchanged stock-kernel replay of every project module:

| Component | Source snapshot | Project modules | Audited declarations | Private declarations | Required endpoints |
| --- | --- | ---: | ---: | ---: | ---: |
| Unconditional five-speed bound | `93022640cfd5f8c4fa2ce837dd8743d101374f2d` | 106 | 3,003 | 230 | 100 |
| Primitive classification transport | `58c9bcc77d97b970af006b00bb40f549fcf737b1` | 15 | 317 | 10 | 5 |
| Distinct positive padding | `d59ba2141fb6015f5eb8b7460d75056d16439a71` | 16 | 327 | 15 | 4 |

The axiom whitelist is exactly `propext`, `Classical.choice`, and `Quot.sound`. The original receipts, declaration inventories, proof sources, gate controls, logs, and process profiles are preserved under [renault-five-speed-44556621749](verification/renault-five-speed-44556621749/), [runner-bound-transport-44557243499](verification/runner-bound-transport-44557243499/), and [runner-bound-padding-44559299513](verification/runner-bound-padding-44559299513/). Each downloaded ZIP was checked against its GitHub artifact digest; every source, compiled object, control, log, profile, and declaration inventory was then revalidated. This preservation step did not rerun Lean locally.

The padding result removes a smaller-runner premise from the transport itself: a primitive bound at exact length `k` extends to every positive distinct list of length at most `k`. Its classification version requires a classification of the closed sublevel `value ds ≤ 1/(k+1)` and a matching lower bound for every classified case. It does not prove those classifications or discharge lower-dimensional assumptions used inside their proofs.

Registration adds 23 module roots and 109 required theorem endpoints to the accepted imports, axiom audit, and kernel-replay list. These unchanged component receipts remain distinct from the merged accepted-package gate. The five-speed spectrum, the higher-speed exhaustive classifications, and the overall campaign remain incomplete. Li remains last.

## Six-speed finite-field prime-product reduction (2026-11-19)

`Conjectures.LonelinessSixSpectrumFieldsDefs` and `Conjectures.LonelinessSixSpectrumFieldsProduct` are registered from the original passing [run 44559208975](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44559208975), job `135691218139`, source commit `1ccbc51789fed2aded3597c7dc1491aefabe716a`. The exact nine-module project closure passed fresh strict source compilation, complete owned/private axiom auditing, and nine separate stock-kernel target replays. The audit checked 266 owned/raw declarations, 202 theorems, 13 private declarations, and all 16 required theorem endpoints, with only `propext`, `Classical.choice`, and `Quot.sound` allowed.

The factor type contains exactly 20 increasing index triples and four sign choices, giving the stated 80 forms `v_i ± v_j ± v_k`. The finite `PrimeTriangleCover p` premise ranges over every nonzero raw residue sextuple, including repetitions. Its point checker accepts a genuine threshold-six modular witness or two distinct divisible factor indices. This sufficient condition is weaker than the original C++ condition involving distinct folded values. The definitions do not assert that any particular prime passes that cover.

For positive actual integer speeds, let `G = (∏ v_i)^2 * ∏ |v_i ± v_j ± v_k|`. Every counted prime contributes `p^2 ∣ G`: the squared speed product covers primes dividing any coordinate; otherwise the explicit cover and actual value below `1/6` give two distinct divisible factors. Distinct primes in a finite set yield `P^2 ∣ G`. From the actual squared norm `∑ v_i^2 ≤ N`, the proved Cauchy bounds give `G^2 ≤ N^12*(3*N)^80`. The strict inequality `P^4 > N^12*(3*N)^80` therefore forces a zero factor and an actual additive triangle on three pairwise distinct coordinate indices. Distinct speed values require the application's separate distinctness premise.

The required endpoints in `Loneliness.SixSpectrumFields` are `triple_card`, `form_card`, `twoRelationsCheck_sound`, `pointCheck_sound`, `primeCheck_sound`, `eval_mod_decomposition`, `relations_of_mod`, `relations_of_cover`, `eval_square_le`, `additive_of_zero`, `prime_square_product_dvd`, `twoRelations_square_dvd`, `prime_square_dvd_obstruction`, `obstruction_square_le`, `zero_form_of_prime_covers`, and `additive_triangle_of_prime_covers`.

Every prime cover, the prime-product comparison, the actual norm bound, positivity, and the strict real-value hypothesis remain explicit. This component does not discharge finite support/orbit coverage, prove sporadic exhaustion, or complete the six-speed spectrum classification. The larger support transport and coverage modules are separate candidates.

Original artifact `14549736325` has 1,265,230 bytes and ZIP SHA-256 `6ce08dfa9c1cc41e58ebf718befd70143eaf23e35861df05e936c85095272f5f`. The unchanged raw receipt SHA-256 is `15e8e925d8cd36fc5df28d1f03e4e37dae5910f47e1bc80e13aa07960791f7cc`. All 22 historical source/control/configuration files match the original Git blobs. The unchanged receipt, declaration inventory, generated audit source, process logs, progress records, and complete archive manifest are preserved under [`docs/verification/six-fields-product-exact-44559208975`](verification/six-fields-product-exact-44559208975/). The original command was `python3 scripts/verify_higher_spectrum_realization_exact.py six-fields-product`; preservation does not claim a new execution of that gate.

## Conditional gcd shift test (19 November 2026)

`LonelinessGcdShiftCounting` and `LonelinessGcdShift` are registered with
20 required theorem endpoints. For nine distinct positive integer speeds,
the final theorem assumes `LonelyRunnerBound 8`, a modulus `d ≥ 2`, a
nonempty set of coordinates not divisible by `d`, and a gcd-weighted ceiling
cost strictly below `d`. It concludes that actual loneliness is strictly
above `1/10`. The floor-cost and residue versions retain their explicit
positive-cost conditions.

[Run 44562942517](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44562942517)
at `4f97f1e9936e089a7f33b8d6093ea820661c1f31` passed all 17 fresh strict sources,
399 owned/raw declarations (319 theorems and 10 private declarations), all
20 named obligations, five literal statement checks, and exact stock replay
of the 17-module closure. The downloaded artifact and original receipt were
authenticated against the published Git blobs and complete source/object/log
inventories. The other 15 project dependencies were already registered with
identical source bytes. See the [conditional component checkpoint](verification/loneliness-gcd-shift-44562942517/README.md).

The eight-speed bound remains a hypothesis. This receipt does not establish
an unconditional nine-speed result, signed-unit transport, or a complete
finite lift census. Result-level classification status is unchanged; the
merged-package gate remains separate from this component verification.


### Six-speed first-cover support reduction: accepted component

The exact candidate at `3273ac1a24ea061b0cbd73244e2ac57c08d491ec` passed [run 44563135178, job 135701825289](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44563135178/job/135701825289). The original [receipt](verification/six-fields-support-exact-44563135178/receipt.json), [declaration inventory](verification/six-fields-support-exact-44563135178/declaration-inventory.json), process logs, and [preservation record](verification/six-fields-support-exact-44563135178/preservation.json) are preserved unchanged. The ZIP is artifact `14550958428`, SHA256 `2bc3b08c68ae7ae155015b1c1e8d212871781df5653350de749b1bb9f0ac8a20`; the receipt SHA256 is `eca423609c80888ebc5eb19a024b81b58e82343c3e758100e50ff408bd3676bf`.

All **22 project modules** passed fresh strict source checks and separate exact stock-kernel replay. The audit checked **837 owned and raw declarations**, including **545 theorems**, **72 private declarations**, and **22 required theorem endpoints**, using only `propext`, `Classical.choice`, and `Quot.sound`. The registration adds `LonelinessModularMultiplicity`, `LonelinessModularSupportLists`, and the three `LonelinessSixSpectrumFieldsSupportDefs`, `LonelinessSixSpectrumFieldsTransform`, and `LonelinessSixSpectrumFieldsSupport` modules. The generic support modules were existing public sources and were checked again in this exact closure.

`SixSpectrumFields.primeTriangleCover_of_checked_supports` proves the first-cover proposition for every nonzero raw residue sextuple, including repeated folded residues. Its proof retains distinct factor indices under independent signs, coordinate permutations, congruences, and multiplication by a modular unit. Pure modular normalization uses the absence of a modular witness, so it does not assume a real loneliness bound in the finite cover. A complete checked search covers all possible folded supports. The retained-row checks handle six distinct values and every possible repeated member of a five-value support.

The endpoint still requires a valid inverse table, every initial support-tree check, and `supportRelationsCheck` for every decoded retained row. It does not require the reverse claim that every retained row is a survivor. No numerical `PrimeTriangleCover p`, completed prime table, or universal six-speed spectrum classification is supplied by this component. The separate finite certificate and later dimension reductions remain pending.

### Accepted six-plane membership-to-family bridge

`LonelinessSixPlaneFamilies` is registered from the exact passing candidate `3273ac1a24ea061b0cbd73244e2ac57c08d491ec`, [run 44563135178, job 135701825634](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44563135178/job/135701825634). Its 66-module closure passed fresh strict source compilation, the complete owned/private axiom audit (1,795 owned and raw declarations, 1,449 theorems, 49 private declarations, all five required endpoints), and 66 separate exact stock-kernel target replays. Only `propext`, `Classical.choice`, and `Quot.sound` were allowed.

For any positive integer sextuple actually lying in a critical rational plane, the theorem gives a permutation of `(A,2A,3A,4A,5A,b)` or `(A,3A,4A,5A,9A,b)` with both integers positive, or the full signed third family. Primitivity and actual loneliness below `1/6` further force the product alternatives to `(1,2,3,4,5,6s)` or `(1,3,4,5,9,6s)` with `s ≥ 1`. The third alternative retains all real parameters and every coordinate sign. Exclusion of these literal families implies that the tuple lies in no critical plane, supplying the exact off-critical premise used by the norm route.

This component assumes actual critical-plane membership for its forward implications. It does not prove that every low-value plane is critical, discharge the remaining five-speed exhaustion, certify the complete six-plane finite table, or evaluate the full third family. Those obligations and result-level completion remain separate.

Artifact `14549664948` has ZIP SHA256 `b9ad7ea510611134327c246572be59b5b1ce67a9f75d3ba26ef63249cd385989`; the unchanged raw receipt has SHA256 `d06c6f0e813120dfe3bf118f5d9c96b516e1abfd02620114c372944caeb155fe`. All 79 historical source/control/configuration Git blobs, every archived object, process log and progress record, and the reconstructed ownership audit were authenticated. The original evidence and separate preservation record are under [`verification/six-plane-families-exact-44563135178/`](verification/six-plane-families-exact-44563135178/). Registration adds one module and five endpoints; it preserves the concurrent FieldsSupport registration.

## Complete tight-five classification and independent finite lower bound (19 November 2026)

The complete threshold classification at `1/6` is registered. A positive
primitive five-element natural-number tuple with actual loneliness at most
`1/6` is a permutation of `[1,2,3,4,5]` or `[1,3,4,5,9]`, and has value exactly
`1/6`. The normalized theorem applies to every positive list of length five;
its gcd-normalized list has one of those two forms. Distinctness is not an
extra premise of either classification statement.

`Loneliness.Modular.FiveRunner.five_runner_bound` and
`Loneliness.CoordinateSubspace.five_speed_lonelyRunnerBound` also prove the
lower bound `1/6` for every nonempty list of at most five distinct positive
speeds. This finite proof is independent of the already registered Renault
proof. The original Renault modules and endpoints remain registered.

[Run 44549751944](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44549751944)
at `1ffeb0932ac9a5674f2d416757d786a85e43ffde` passed all 250 fresh strict sources,
7,586 required theorems, four literal quantified contracts, and the complete
audit of 28,383 owned/raw declarations, including 118 private declarations.
The unchanged stock kernel replayed exactly the 250-module closure. The
118 generated modules reproduce all 394 minimum-pair roots and 7,070 frames
for primes `149,151,163,167,173`; all smaller-runner and prime-classification
hypotheses are discharged. Only `propext`, `Classical.choice`, and `Quot.sound`
are permitted transitive axioms.

The [authenticated original checkpoint](verification/loneliness-five-runner-exact-44549751944/README.md)
preserves every receipt, audit, generation, log, and process-record file.
Registration adds exactly 129 previously unaccepted modules and
7,577 previously unregistered required endpoints, including every
frame theorem. The other 121 dependencies were already accepted and
prebuilt with source bytes matching this run. GcdShift and Renault
registrations are preserved. The full five-speed spectrum below `1/5` remains
incomplete; no result-directory spectrum status is promoted. The merged
accepted-package gate remains separate from this complete component receipt.

## Modular support, unit orbits and literal binary lifts, 19 November 2026

Four authenticated component closures are now registered: support multiplicities
and the finite-tree consumer (98 modules, 63 required endpoints), unit-orbit
transport (26/8), literal seven-speed binary roots (34/58), and byte-count/check
equality (8/15). Their exact source, all-owned/private audit and stock-kernel
receipts are linked in the [component scope record](verification/modular-support-components-20261119.md).
The registration includes all 55 generated multiplicity source files from the
passing artifact and preserves every earlier accepted registry entry.

The seven-speed literal check retains the six-speed runner bound and does not
prove initial-support exhaustiveness. The multiplicity and orbit interfaces
retain their terminal and covering hypotheses. The byte evaluator has a
universal equality proof; its interrupted benchmark supplies no speedup result.
The separate prime-251 closed-lift gate and bounded initial-cut pilot have
passed their exact component gates; their limited scopes are recorded below. The merged accepted package
still requires its separate complete source, audit and stock-replay run.

## Seven-speed norm and reduced prime sets, 19 November 2026

`LonelinessSevenSpectrumNormGeometry` is verified and registered from source
`f782472e2ccd4d276ed6090b30727dbd2b92346e`,
[run 44576585527](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44576585527),
job `135745583518`. Its full 129-module project closure passed fresh strict
source compilation, all 27 required endpoints, seven literal quantified
contracts, the complete owned/private axiom audit, and 129 separate exact
stock-kernel replays. The audit covered 3,620 declarations, including 2,881
theorems and 280 private declarations. Only `propext`, `Classical.choice`, and
`Quot.sound` were permitted.

For an actual positive primitive seven-speed vector with loneliness at most
`1/7`, the component constructs the integral basis, derives all six Gram-prefix
bounds and the determinant identity, and proves
`8993 * squaredNorm v ≤ 1186638179795145`,
`∑ i, (v i)^2 ≤ 131951315444`, and Euclidean norm strictly below `363252`.
The remaining premise states that every rational plane containing the vector
has space value at least `5/33`. The accepted five-speed, four-speed, and
smaller-runner results discharge the smaller-runner hypotheses.

The original nineteen-prime avoiding theorem is preserved. The sharper norm
bound also gives an avoiding prime among the first sixteen original primes,
from `151` through `233`, under the closed threshold `≤ 1/7`. Under the strict
threshold `< 1/7`, the verified forced factor `420` reduces the set to the
first fifteen primes, through `229`. The strict assumption is retained in the
fifteen-prime theorem and its literal contract.

The [original evidence and full scope record](verification/seven-spectrum-norm-exact-44576585527/README.md)
bind the exact run, job, artifact `14556969731`, and source commit. All 782
archive members were authenticated. The original ZIP SHA-256 is
`e94a210f21bbd4f19e37bd1466c82948f25deb0bfb2e02b22562b5e5852bd948`; the unchanged
receipt SHA-256 is
`583fcd94f60c5606bb1ebdf9bf1030f59ac573e4b13e92cb1324d6a04216c0b1`.
Registration adds one module and 27 audit endpoints while preserving every
previous accepted entry. Li remains outside the accepted roots. The plane gap
and the final seven-speed finite residue classification remain open;
no result-directory completion status is promoted.

## Order-nine automorphism subgroups and orbits

For every abelian group of order nine, every odd subgroup of its actual
additive automorphism group has order dividing three. A nontrivial such
subgroup has order three and three fixed points. Its other two orbits are
the two nonzero cosets of the fixed subgroup, so there are exactly five
orbits in total.

`HadamardLegendreOrderNineGroup` and `HadamardLegendreOrderNineOrbits` are now
registered. Their four-module closure passed the original hosted strict
source, axiom, and stock-kernel gate at
`91b7afd6c31b5654e0d7aa0517a270c0b802eedc`, run 44523474204,
job 135557905916. All theorem-source and pinned-configuration hashes still
match. The original replay log contains exactly the four required modules.

Fresh local strict sources and the complete owned/private audit also passed:
68 declarations, 64 theorems, nine private declarations, and 13 required
endpoints, using only the three standard allowed axioms. The optional local
repeat of stock replay timed out and remains recorded as such. The
[preserved evidence](verification/hadamard-order-nine-orbits-44523474204/README.md)
separates the original hosted pass from the local outcomes.

The theorem sources are unchanged. Two prebuild targets and 13 required
endpoints are added. This verifies the order-nine action claims in the
Legendre-pair argument; exclusion of order 27 and the finite quotient/no-lift
packet remain outstanding. Hadamard existence at order 2396 stays open.

## Initial cut pilot and prime-251 binary lifts, 19 November 2026

Two further component gates passed from source
`8abe17f1b329ca1df0ae81f4e0b2c4425d1b03a6` and are registered with their exact
checked sources. The [scope and preserved evidence](verification/modular-cut-and-closed-lift-components-20261119.md)
record the source, all-owned/private declaration audit, and stock-kernel checks.

The cut pilot passed its complete 53-module closure and 54 required endpoints
in [run 44577155795](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44577155795).
It proves the complete small initial list for five speeds, denominator six and
prime eleven, plus the validity of all 19 prime-251 rows and only cuts 0 through
3 of the minimum-pair-four root. Exactly 30 generated sources were compiled,
audited, replayed and added. The other 105 generated sources remain outside
this accepted scope. Prime-251 initial-support coverage is still incomplete.

The closed binary-lift component passed 33 modules and 23 required endpoints
in [run 44577160577](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44577160577).
It checks all 19 ordered prime-251 roots, 2,451 states and 19 complete
128-child binary branches, to maximum depth two. Its classification theorem
retains the six-speed runner bound and the premise that the tuple is
represented by one of those roots. It does not establish initial-support
coverage or the full seven-speed classification.

Registration preserves all earlier entries and adds four imports, 68 audit
names and 33 explicit prebuild/replay modules. No result-directory completion
status changes. A complete merged-package source, audit and kernel replay
remains a separate verification obligation.

## Rational integer-point lattices and six-speed norm components

The registered components construct the full integer-point lattice of
every rational coordinate subspace, prove its span and rank, and identify its
squared covolume with the Gram determinant of an actual integer lattice basis.
They prove squared covolume at least one. In rank four in six coordinates,
the lower bound is six when the subspace contains an integer vector whose
coordinates are nonzero and pairwise unequal up to sign.

Suppose an integer matrix has r columns lying in a rational subspace of
dimension r, and its Gram determinant is positive. The proof gives an
exact factorization of the column Gram determinant as a nonzero integer
square times the full lattice's squared covolume. It therefore bounds the
full lattice's squared covolume by the column Gram determinant. The endpoints do not
identify that integer with the cardinality of a finite quotient.

The rectangular components also prove integer-parameter recovery under an
integer left inverse, primitive basis transfer, Cauchy--Binet and integer Gram
identities, and the literal map Gram determinants 3, 9 and 8. The six-by-four
Gram lower bound assumes positive Gram determinant, nonzero rows and rows
that are pairwise unequal up to sign; it derives the bound six internally.

The original norm constants 9075, 54450 and 163350 now use the covolume of the
actual full integer-point lattice. The 9075 theorem assumes rank four,
containment of the speed vector, and distinct positive primitive speeds.
The 54450 and 163350 theorems hold for every rational coordinate subspace,
without a rank or containment premise. All three norm theorems retain
`hfour : CoordinateSubspace.LonelyRunnerBound 4` and `hplane`, the containing-plane gap
hypothesis, as well as positivity, primitivity and loneliness at most `1/6`.
These are component theorems. The unconditional plane-gap deduction and the
remaining exhaustive classification are not supplied here; the six-speed
spectrum result remains partially formalized.

The complete 60-module hosted gate passed at `e815f14555472b873683f491bc878eb16d4eb0a4` ([run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44590263136/job/135794055426)). It checked all fresh strict sources, all owned and private declarations, all 50 required theorem endpoints, and one exact stock-kernel target per module. The permitted axioms were only `propext`, `Classical.choice`, and `Quot.sound`. The unchanged receipt has SHA-256 `4a3f6a5df8723dc21f2b5eb2899a10ea55b47b9eb0538cd48927016c0195e4ee`. The merged accepted-package check remains a separate obligation.

[Preserved receipt](verification/rectangular-lattice-exact-44590263136/receipt.json).

## Prime filtering and proved runner classes, 19 November 2026

Twelve prime-filtering modules are registered. They formalize Lemma 2 and
Corollary 3 of Barajas and Serra, *The lonely runner with seven runners*
(Electronic Journal of Combinatorics 15 (2008), R48, DOI 10.37236/772).
The proofs produce an actual prime-power unit, preserve higher residues
when starting from a coprime seed, and derive modular witnesses and bounds
for the real-valued loneliness function.

For positive speeds, the verified `1/7` consequence assumes that every
7-adic valuation level below the maximum contains at most three distinct
speeds. The highest level has no cardinality restriction. Repeated speeds
are allowed. A separate uniform-valuation theorem gives the `1/p` bound
for any base `p ≥ 2`, with no restriction on the number of speeds.
The four- and five-input exceptional lower levels, and the unrestricted
six-speed runner theorem, remain pending.

[Run 44591941338](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44591941338)
at `e6d53ced9fd3b6ad4a311c3eecbe1fcbd0cdd491` passed the complete
18-module closure: fresh strict sources, 68 required theorem endpoints,
33 literal quantified contracts, the full audit of 299 owned declarations
(243 theorems and 10 private declarations), and 18 exact singleton stock-kernel
replays. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted.
All 116 original artifact members and every source, object, process record,
audit inventory and pinned control hash were authenticated. The receipt
SHA-256 is `009a768a638e275c6705f1bc08c316ca3686553bd591c2c25765fc29531ed394`.

[Original evidence and exact scope](verification/prime-filtering-exact-44591941338/README.md).
Every previous accepted entry is preserved. Li remains outside the accepted
roots. The complete merged-package gate remains a separate obligation;
no result-directory completion status changes.

## Conditional two-parameter radius estimate

For an integer matrix with two columns and a finite nonempty row set, the theorem uses the actual real column span and the actual line generated by a primitive signed integer parameter pair. The primitive premise is `Int.gcd x y = 1` on the parameters. For any real upper bound `C` on every squared row norm, `plane_value_le` bounds the plane value by the line value plus `1/2 * sqrt(C / (x^2+y^2))`.

If the actual plane value is at least `2/11` and the actual line value is strictly below `1/6`, the proof gives `x^2+y^2 < 1089*C`. Taking the exact finite maximum of the squared row norms gives the natural-number bound `x.natAbs^2 + y.natAbs^2 < 1089 * maxRowSq A`. An explicit coordinate-equality theorem carries this bound to a natural six-speed vector. It does not separately require the natural speed vector to be positive, distinct or primitive, and adds no rank, integer-left-inverse, four-speed or six-speed-classification premise.

The plane gap remains an assumption. This theorem does not classify the 78 maps or complete the six-speed spectrum.

The complete 13-module hosted gate passed at `6932e0ba9c532f86fbf9e5fb23aff9e55b8e99f9` ([run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44593469748/job/135805428239)). It checked all fresh strict sources, all 295 owned declarations including 13 private declarations, all 6 required theorem endpoints, and one exact stock-kernel target per module. The permitted axioms were only `propext`, `Classical.choice`, and `Quot.sound`. The unchanged raw receipt has SHA-256 `b4722be2222c18d959a57252b8bc797e71a489c41d6c3c0b92647fadaf663de7`. A merged accepted-package source, audit and kernel pass remains a separate obligation.

[Preserved receipt](verification/two-parameter-radius-exact-44593469748/receipt.json).

## Six-speed norm bounds with the four-speed input discharged

The three new six-speed lattice norm bounds supply the proved four-speed runner theorem internally. They retain the containing-plane gap, positivity and primitivity of the natural speed vector, and loneliness at most `1/6`. The bound with constant 9075 additionally assumes a rational subspace of rank four containing the speed vector and pairwise distinct speeds. The bounds with constants 54450 and 163350 apply to every rational coordinate subspace, without a rank, containment or distinctness premise. The lattice is the actual full integer-point lattice.

The new endpoints end in `_of_plane_gap`. They remove the explicit `hfour` input and retain `hplane : SixSpectrumNormGeometry.ContainingPlaneGap v`. The old endpoints keep their original signatures. These results do not prove the containing-plane gap or complete the six-speed classification.

The complete 113-module hosted gate passed at `14f3403c7afe204c85b376df0f02c68c86c7fea0` ([run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44591091795/job/135796982020)). It checked all fresh strict sources, all 3108 owned declarations including 90 private declarations, all 3 required theorem endpoints, and one exact stock-kernel target per module. The permitted axioms were only `propext`, `Classical.choice`, and `Quot.sound`. The unchanged raw receipt has SHA-256 `af61227a92a04443c42d8c928139f13a9bb201b3bfd5b359f464138f2d3ae5ac`. A merged accepted-package source, audit and kernel pass remains a separate obligation.

[Preserved receipt](verification/lattice-norm-four-speed-exact-44591091795/receipt.json).

## Seven-coordinate implications with the five-speed input discharged

The new seven-coordinate critical-plane and large-norm statements supply Renault's proved five-speed runner theorem internally. Every new endpoint retains `hsix : PrimitiveSixClassification`. The plane results concern rational subspaces of dimension two. One classifies coordinate-free planes with value at most `1/7`; another assumes equality to `1/7` without a separate coordinate-free premise; the third states that equality is equivalent to `StandardProductPlane`.

The quantitative results concern positive primitive natural speed vectors with Euclidean norm at least `7 * 42^10`. Below loneliness `1/7`, such a vector is a permutation of `[1,2,3,4,5,6,7*s]` for an integer `s >= 1`, and its loneliness is `s/(7*s+1)`. The family equivalence puts the strict loneliness inequality on the left side of its equivalence. No separate distinctness premise is added. The six-speed classification remains an assumption; these implications do not establish the full seven-speed classification.

The complete 171-module hosted gate passed at `9c5b1203a4405508254332b1d13dd19f9bdefe38` ([run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44592471446/job/135801829445)). It checked all fresh strict sources, all 4246 owned declarations including 850 private declarations, all 6 required theorem endpoints, and one exact stock-kernel target per module. The permitted axioms were only `propext`, `Classical.choice`, and `Quot.sound`. The unchanged raw receipt has SHA-256 `25d85fa1a9a5fa514e1a1505d370790f273656bafa3a9c4b991316ba9f043b5e`. A merged accepted-package source, audit and kernel pass remains a separate obligation.

[Preserved receipt](verification/critical-seven-five-speed-exact-44592471446/receipt.json).

## Four-input prime filtering, 19 November 2026

Twenty modules are registered for the four-input filtering step in the
seven-runner argument. For four natural inputs nonzero modulo seven and
any exponent `m`, the theorem gives `1 <= j <= 5` and `0 <= k <= 6` such
that `j + k*7^m` is coprime to `7^(m+1)` and each actual folded residue
is at least `7^m`. Every input divisible by seven keeps its full residue
relative to multiplication by `j`. Repeated inputs are allowed.

The finite quotient sampling, symmetry reduction, ten canonical decision
checks and natural arithmetic transport are all proved. No finite-check
hypothesis remains. The higher-family seed must still be safe under the
selected multiplier `j`; this component does not supply that seed or prove
the unrestricted six-speed runner theorem. The five-input lower-level
case also remains outside this component.

[Run 44601096014](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44601096014)
at `8d1933b7b568515fe5bf7e8b474fe22e284521e8` passed 20 fresh strict
source checks, four literal contracts, all seven required endpoints,
the complete owned and raw-occurrence audit, and 20 exact singleton
stock-kernel replays. The audit covers 133 declarations and 97 theorems.
Its closed raw dependency graph has 5,101 nodes and 70,060 edges, with
only `propext`, `Classical.choice`, and `Quot.sound`. All 128 original
artifact members and exact source, object, import, control, log and profile
bindings were independently authenticated.

[Original evidence and exact scope](verification/prime-filtering-four-exact-44601096014/README.md).
All prior accepted entries, verification code and the axiom whitelist are
preserved. No result-directory completion status changes. The full merged
accepted-package gate remains a separate obligation.


## Li coefficient-sign counterexample

The 44-module development is registered with 71 required theorem
endpoints. The original hosted gate passed at source snapshot
`20e0e95eb421cf8ea728d34aa29a6d0eb1137789`: all 44 fresh strict sources,
25 literal contracts, 1,247 owned declaration names (932 theorems and
95 private names), all 71 required endpoints, and 44 exact stock-kernel
targets. The separate hosted supplement passed against the same object
bytes and covers every reachable serialized proof occurrence. Both
original artifacts and the complete baseline backup were authenticated
and independently reviewed before this registration.
The original 38-module contribution is by [aadrianvv](https://github.com/aadrianvv)
in [PR #35](https://github.com/1337isnot1337/solved-conjectures/pull/35),
original head `fb700255fed86b6ac29b4980ff4704fa46adab63`.

The explicit tree has 31 vertices, maximum degree 4, one degree-4 vertex with
exactly one leaf neighbour, and is neither a spider nor a caterpillar. Every
one of the 6,842 integer partition types is realized by genuine nonempty,
disjoint, covering connected vertex blocks. Exactly eight connected
partitions have type `(3,2^14)`. An equivalence with deleted-edge subsets gives
exactly `2^30 = 1,073,741,824` connected vertex partitions in total.

For every finite colour type of cardinality at least 31, the actual
proper-colouring polynomial has full elementary coefficients
`[e₂¹⁴e₃]=29` and `[e₂⁸e₃⁵]=−6304`. The five degree-31 coefficients using only
`e₂,e₃` are `29, 83, −6304, −6800, −8384`. Full-coordinate restriction and
colour-renaming theorems prove stability. No separate infinite-variable
symmetric-function ring is constructed, and 31 is a sufficient degree-bound
threshold without a minimality claim for these coefficients.

The positive coefficient contradicts Li's strict-negative prediction in
Problem 4.9. The leaf count contradicts the first question of Problem 4.6.
The count eight contradicts the separate informal prediction
`b_(3,2^14)=1`; uniqueness of the degree-4 vertex remains true. The negative
coefficient proves that this tree is not elementary-positive.

The original Python dynamic program and the vertex-deletion contribution
argument remain alternative explanations. The formal development proves the
main conclusions independently; it does not certify those Python programs
or every numerical step of the alternative argument. The separate graph-
distance and branching source `LiStructure` is outside this 44-module
acceptance. Its dedicated verification closure also includes `LiBasic`.

[Theorem inventory, scope and attribution](../results/li-coefficient-sign/LEAN.md).
The complete merged accepted-package gate remains separate. Earlier dated
checkpoints retain their historical scope, including their former Li queue
status. The repository-wide campaign remains incomplete.

The original [run 44599210697, job 135825706963](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44599210697/job/135825706963)
produced artifact `14568527194`, ZIP SHA-256
`281b57fd87cf7d6123cdcabff4a5803f3d426116dbb4a9aa01370318b2a138ed`.
The unchanged receipt SHA-256 is
`da585dbd99530825af7bac8c4730c1a6666bfa151ce98ad4c6f52b9d537aa09d`.
All 272 original members, source/object/direct-import bindings, process
logs and profiles, original git controls, and compiler/checker pins have
been authenticated. The artifact authentication SHA-256 is
`cc956d198ed081f35fb7ea35ff22aaf9bbec7b3ce2138519c43db53d778fef29`;
the independent root review SHA-256 is
`9de0d30a11a09d0c54bfdd76358f6ef2e3abdcc07254c314af520bbfbd04361b`.

The [raw-occurrence supplement, run 44606051622 / job 135849912826](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44606051622/job/135849912826)
passed at `26ef845d1ec4adb15e0c87c9264905baeb69491f` against the exact original
44 compiled objects. It rechecked all 25 literal contracts and traversed
17,647 dependency nodes and 316,338 edges from all 1,247 owned declarations.
The scan indexed 22 differing theorem bodies across the imported environment;
none was reachable from those roots, so no extra variant alias checks were
needed. The trust-zero checked-kernel negative control was rejected. The
only transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`.

The raw artifact is `14569498196`, ZIP SHA-256
`7ea288555021d503775aa3886fc59edc65ae9a096ca26bb9add7e9950b1e1489`,
with receipt SHA-256
`8cb7e81896bc67b3c68ed976f256e6894b6c52318063ab0894360fed1d0a8b46`.
The preserved baseline backup is artifact `14569584489`, ZIP SHA-256
`dfbb03a7571256df786f9c28f45b306cb924f89403ba403d81063072e6f1eb2f`;
its inner archive equals the original baseline ZIP byte for byte.
The raw-artifact authentication SHA-256 is
`6abda54c54c591fef864220fd7624374ad25af865a94989204969305eecb0610`;
the independent review SHA-256 is
`8f14f2f5844973ea3d432b741185e01a8385841fc0d8f8b90e7181e88f5d6aee`.
The supplement retains the original source-build and stock-replay evidence;
it does not claim to have repeated those stages.

## Actual rational-lattice quotient index

For a rational coordinate subspace E of dimension r, let L be its actual full integer-point lattice. An integer matrix A with r columns in E and positive Gram determinant generates the sublattice M = columnSubmodule E A. Relative to an actual integer basis of L, the columns have an integer square coordinate matrix C. Lean proves that the quotient cardinality Nat.card (L ⧸ M) equals the absolute determinant of C and is positive. It then proves the exact identity det(AᵀA) = [L:M]² * covolume(L)². The containment, dimension and positive-Gram hypotheses are explicit; no saturation or quotient-index identity is assumed.

This identifies the integer determinant factor in the earlier Gram/covolume comparison with the actual finite lattice quotient. It does not discharge the containing-plane gap or complete the six-speed classification. The six-speed result remains partial.

The complete 20-module hosted gate passed at `a8577e5da31b851ce64333aa921b39c6623e0389` ([run and job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44606981694/job/135853171450)). It checked all fresh strict sources, selected declaration values and types for 446 owned names including 12 private names, all 5 required theorem endpoints, and one exact stock-kernel target per module. The audit includes raw/private-name visibility; it is not a separate audit of every duplicate theorem body occurrence. The permitted axioms were only `propext`, `Classical.choice`, and `Quot.sound`. The unchanged raw receipt has SHA-256 `62b4ab2b3b0dcdaa55b210e5de3e8322e7e6b57201b05e085983d8ff0882afa2`. A merged accepted-package source, audit and kernel pass remains a separate obligation.

[Preserved receipt](verification/rational-lattice-quotient-exact-44606981694/receipt.json).

## Complete Wright log-concavity disproof

`FerreiraSimonWright.wright` is the literal infinite reciprocal-Gamma series,
and `density` uses the source factor `Gamma(alpha + beta)`.
`scaled_wright_limit` proves the limit `x/(1-x)^2` for every `0 ≤ x < 1` as
`alpha = 1-t` tends to one from below with `beta = 0`. Gamma reflection and
convexity bound the absolute value of the nth scaled coefficient by n;
Tannery's dominated-convergence theorem handles the entire series.

`boundary_counterexamples` gives a strict midpoint violation for every
sufficiently small positive t, and `boundary_conjecture_false` refutes the
universal beta-zero clause. The paper sets `alpha_star(0)=1`, so these are
admissible counterexamples to its original conjecture. The three positive
sample values used in the limiting inequality are `4/9`, `2`, and `12`.
The proof checks their eventual positivity and transfers the strict
inequality through the positive density-normalization factor.

Strict source compilation, an audit of all 25 declarations (22 theorems,
eight private declarations), and the unchanged pinned stock-kernel replay
of the exact one-module project closure passed. The audit admits only
`propext`, `Classical.choice`, and `Quot.sound`. The
[receipt](verification/lean-wright-20261121/wright-receipt.json) records the
exact source and object hashes, audit source and records, and replay log.
The additional positive-beta families and derivative refinements in the
written proof are not formalized. The combined repository gate is pending.

## Fan–Tringali’s power-monoid length-set conjecture

Complete Lean verification of the original 2018 conjecture: every finite nonempty set of integers at least two is realized as the entire atom-length set in both the ordinary and restricted finitary power monoids of every Dedekind-finite monoid with infinitely many distinct positive powers. No ambient commutativity or cancellation is assumed. [`finite_spectrum_power_monoids`](../lean/Conjectures/FanTringaliMonoid.lean) proves the full transfer, and [`natural_length_system`](../lean/Conjectures/FanTringaliNaturalSystem.lean) proves the exact reduced-natural-number system.

All 18 frozen modules passed strict source builds, the all-owned/private axiom audit (432 declarations, 350 theorems, three private declarations, 28 required endpoints), and stock kernel replay. [Scope and reproduction](../results/fan-tringali-power-monoid-lengths/LEAN.md), [statement review](../results/fan-tringali-power-monoid-lengths/LEAN_REVIEW.md), and [complete receipt](verification/lean-fan-tringali-complete-20261124-162051/receipt.json). The separate survey irreducible formulation, prescribed multiplicities and relative cancellativity remain unformalized. The scoped pass does not claim an aggregate repository pass or a current public deployment; those gates are reported separately, including the dependency-cache blocker in [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563). This is one completed existing entry.

## Hartke–Stolee–West–Yancey matching-excess conjecture

Complete Lean verification of the original tail-minimum divergence conjecture and the recorded quantitative bounds for every matching count at least two. The 22-module closure proves actual graph matching/edge counts, both general constructions, a bounded and attained maximum over all finite even graph orders, exact eventual stabilization, and the uniform all-tail limit. All fresh strict builds, the complete audit of 505 declarations (435 theorems, 32 private declarations, 42 required endpoints), and exact stock replay passed. [Scope](../results/hartke-stolee-west-yancey-matching-excess/FORMALIZATION.md), [independent review](../results/hartke-stolee-west-yancey-matching-excess/LEAN_REVIEW.md), and [receipt](verification/lean-hartke-matching-excess-complete-20261124-162051/receipt.json). One existing result; stronger growth and exact upper-bound questions remain outside scope. Aggregate/hosted/deployment status remains separate under [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
