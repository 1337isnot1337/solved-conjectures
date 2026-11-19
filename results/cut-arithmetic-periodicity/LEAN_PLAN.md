# Checked CUT arithmetic periodicity

The uniform finite test, exhaustive candidate search, and both concrete game
formulas are fully checked locally. The concrete proof uses a small
quotient/residue argument. It does not import the unfinished higher-pile
automata certificates.

## The actual games and exact parameters

`CutPeriod.Weight.both_games_exact` identifies `CutFamily.gameValue` for both
cut sets `{1,2,8}` and `{1,2,7,8}` with the stated candidate function. These
sets permit splits into 2, 3, 9 piles and into 2, 3, 8, 9 piles, respectively.
The theorem also proves, for each actual game:

- The identity `G(n+12)=G(n)+8` for every `n>=7`.
- Every positive eventual arithmetic period is at least 12.
- Every eventual period-12 identity has saltus 8.
- A period-12, saltus-8 identity holds from `start` exactly when `7<=start`.

Thus the six positive pile sizes before seven form the least preperiod for
this least period. The equality with the actual game includes pile zero.

The seven proof modules, all under `lean/Conjectures`, are:

| Module | Checked statement |
| --- | --- |
| `CutPeriodWeightShapes` | Every positive pile has one of 14 exact quotient/residue descriptions, with all atom and positive-quotient restrictions. |
| `CutPeriodWeightPiles` | Positive split lists decompose into these descriptions; one arbitrary quotient or three quotients `x,y,y` give actual split lists. |
| `CutPeriodWeightTables` | A finite collision-profile table contains the empty profile and every required successor; the target-profile exclusion is exhaustive. |
| `CutPeriodWeightCoverTables` | Explicit finite templates satisfy all positivity, arity, weight, residue, and free-quotient conditions. |
| `CutPeriodWeightCollision` | No allowed split reaches the candidate value, at any positive total. |
| `CutPeriodWeightLower` | Every value below the candidate value is reached by an actual split of arity 2, 3, or 9. |
| `CutPeriodWeightTheorem` | Both actual game values equal the candidate, with all exact period parameters. |

All seven modules passed source builds. An exact-closure audit checked every
one of 1,127 project declarations across 23 imported modules. Only `propext`,
`Classical.choice`, and `Quot.sound` occur. The unchanged pinned `leanchecker`
independently replayed that complete closure. These are local verification
receipts; they do not assert that a hosted workflow has run.

### Why the finite certificate covers all pile sizes

A positive pile is represented by a shape `s` and quotient `q`, with
`n=12*q+w(s)` and `G(n)=8*q+r(s)`, where `r(s)<8`. Eleven shapes permit every
nonnegative quotient. Two exceptional atoms require `q=0`. The last shape,
with weight 6 and residue 0, requires `q>0`.

For a split list, let `Q` be the sum of its quotients, `X` their XOR, `W` the
sum of its weights, and `R` the XOR of its residues. The proof establishes the
exact identities `n=12*Q+W` and `optionValue=8*X+R`, together with `X<=Q` and
`R<8`. These are list-level numerical theorems, including the quotient and
remainder behavior of XOR.

If an option equals the candidate value of a target shape with quotient `q`,
then `X=q` and its low residue equals the target residue. Hence `W` is no
larger than the target weight, which is at most 15, and their weights agree
modulo 12. The checked table therefore needs only arities through nine,
weights through 15, eight low residues, and one bit recording whether any
shape permits a nonzero quotient. Its only surviving target profile is the
positive-quotient shape reached using rigid atoms alone. Those atoms have
quotient XOR zero, contradicting the target's strictly positive quotient.

For a smaller value `g=8*x+r`, write the target quotient as `q` and its deficit
as `D=q-x`. Deficits zero and one use a finite template with one unrestricted
shape, to which quotient `x` is assigned. If `D>=2`, write
`D=2+(D%2)+2*y`. A checked template has three unrestricted shapes; assigning
quotients `x,y,y` adds the required size while leaving high XOR equal to `x`.
The finite weight offsets are only 0, 12, 24, and 36. There are 327 checked
template rows and 11 additional witnesses for positive pile sizes at most
six. All constructed pile lists have an allowed arity and strictly positive
entries.

The untrusted producer is `generate_weight_certificates.py`. Regenerate the
two table modules from the repository root with:

```bash
python3 results/cut-arithmetic-periodicity/generate_weight_certificates.py
```

Deterministic regeneration reproduced the checked sources byte-for-byte.
Python assertions are not proof assumptions: Lean checks the table closure,
target exclusion, and every explicit lower-option witness by kernel reduction.
After source compilation and the project axiom audit, the scoped independent
replay command from `lean/` is:

```bash
lake env python3 ../scripts/replay_lean.py --root Conjectures.CutPeriodWeightTheorem
```

## Uniform test and automata foundations

The following existing proof modules live in `lean/Conjectures`:

- `BinaryAutomata`: executable DFA/NFA definitions, bit-mask subset semantics,
  exact finite refinement and efficient active-list refinement certificates.
- `BinaryArithmetic`: high-bit-first local carry constraints iff ordinary
  addition with explicit end carries; columnwise XOR iff numerical XOR.
- `BinaryComposition`: paths iff accepted component words with actual arithmetic
  constraints, in both directions. Pruning is permitted only for states proved
  to reject every continuation. The computable rejecting-sink criterion is sound.
- `CutPeriodGraph`: arithmetic clipping/counter semantics for the candidate
  sequence, for all words and all numerical prefix values.
- `CutPeriodGraphCertificate`: all local checks for the 179-state representation
  and 27-state quotient; `correct` recognizes exactly the candidate value graph.
- `BinaryEncoding`: exact fixed-width encoding, uniqueness and common-column
  construction, and existence of an encoding for every pair of naturals.
- `CutPeriodPiles`: actual positive pile lists, the candidate bound `value n≤n`,
  and complete composition semantics for groups of any number of piles.
- `CutPeriodPileSums`: exact composition of a group of `p` positive piles and
  a group of `q` positive piles. Splitting a list at `p` proves completeness;
  size and XOR bounds prove every hidden track fits the visible input width.
- `BinaryOrder` and `BinaryProjection`: numerical comparison and hidden-track
  projection, with both soundness and completeness at the visible width.
- `CutPeriodLower` and `CutPeriodLowerCertificate`: exact lower-value semantics
  and the checked 111-state representation / 23-state quotient, for every word.
- `BinaryBoolean`: Boolean product language semantics for arbitrary DFAs.
- `BinaryFastComposition`: eight checked digit-choice rows and a generic proof
  that their pruned successors equal the original 32-guess composition rule.
- `CutPeriodParts2Certificate`: all transition-cache and subset/minimization
  checks, plus exact recognition of actual two-pile lists at every size.
- `CutPeriodParameters`: least period 12, saltus 8, earliest start seven for the
  proposed function; the quotient/residue proof now transfers them to both games.
- `CutPeriodOptionData` and the four `CollisionA/B`, `MissingA/B` certificates:
  the numerical error languages are empty for every word. The option-DFAs'
  actual-split semantics is still unproved.
- `CutPeriodCertifiedMex`: the complete mex conclusions follow once that
  explicit actual-option correspondence is supplied, with no other hypotheses.
- `BinaryDecision`: complete short-word bounds and a terminating finite
  emptiness test for every finite DFA.
- `CutMexDecision`: the two finite tests are necessary and sufficient for the
  actual CUT mex equations when exact graph/lower/option recognizers are given.
- `BinaryDeterminize` and `BinaryZeroPrefix`: computable subset construction
  and removal of arbitrary visible leading zero columns, with all-word proofs.
- `BinaryAffineGraph` and `BinaryTailGraph`: uniform finite graph recognizers
  for every finite prefix, positive period, block of tail values, and
  nonnegative saltus. No bound on those input parameters is assumed.
- `BinaryTailArithmetic`: arithmetic-tail representations are equivalent to
  the existence of a positive period and fixed saltus after a finite start.
- `BinaryFiniteNFA`, `BinaryGenericComposition`, and
  `BinaryGenericProjection`: computable composition and projection for arbitrary
  finite state types. Hidden witnesses can have any binary width; zero-prefix
  removal discharges their padding requirement.
- `BinaryRecognizers`: executable graph, Boolean, sum, and lower-value
  operations, packaged with finite state types and exact numeric semantics.
- `CutArithmeticTest`: `finiteSetTest_iff_gameValue` proves that the total
  Boolean test accepts exactly the proposed tails equal to the actual recursive
  CUT game on every positive pile. The finite cut set and all tail parameters
  are arbitrary. Every needed recognizer is constructed inside the test.
- `CutArithmeticSearch`: `searchBound_sound`, `searchBound_complete`, and
  `search_eventually_iff` prove that exhaustive candidate search returns only
  correct representations and succeeds at some finite bound whenever one exists.
  `search_eventually_iff_arithmetic` states the same conclusion directly using
  the eventual additive-period identity for the actual game value.

The uniform test and search modules passed source builds and independent
`leanchecker` replay. Their only transitive axioms are `propext`,
`Classical.choice`, and `Quot.sound`. The concrete examples use the compact
proof above. The generic construction has large, unminimized powerset and
product state spaces. The unfinished specialized automata route is retained
below as a separate experimental alternative.

The untrusted producer `generate_lean_certificates.py` reproduces the original
Python automata and preserves every representation and quotient label in an
ignored JSON intermediate. `--parts-until N` emits Lean modules through a
chosen pile group; `--lower` also emits the checked lower-value DFA. Default
emits only the checked graph. Do not promote a
stage merely because its Python data were generated.

To reproduce the unfinished alternative automata route, run
`python3 results/cut-arithmetic-periodicity/generate_lean_certificates.py --parts-until 9 --boolean --doubling-eight --kernel-only-from 8`.
This builds eight piles as four plus four, then nine as eight plus one.
That alternative would need groups two, three, four, eight, and nine.
The original groups five through seven remain generated but unregistered.
The original sequential eight-pile data is retained in the ignored JSON
intermediate as `parts8Sequential`. The producer checks that both eight-pile
constructions give exactly the same minimized numerical DFA.

From eight piles onward, the static data definitions omit executable code
emission. The `noncomputable` modifier leaves their transparent kernel bodies
unchanged, so the kernel can still reduce every certificate check. The pending
option unions use the same modifier. Earlier generated sources are preserved.
This controls artifact size; it does not discharge any certificate obligation.

## Certificate sizes and performance

The original high-bit construction has raw/minimized state counts:

| Piles | Raw | Minimized |
| --- | ---: | ---: |
| 1 | 179 | 27 |
| 2 | 402 | 126 |
| 3 | 2013 | 89 |
| 4 | 2324 | 22 |
| 5 | 593 | 16 |
| 6 | 573 | 13 |
| 7 | 600 | 16 |
| 8 | 636 | 15 |
| 9 | 668 | 16 |

Do not repeat these unsuccessful representations unchanged:

- Low-bit-first determinization reached 301,768 states already at three piles
  after rejecting-sink pruning; the unpruned trial exceeded 5 GiB. Both profile
  workers were stopped. The original high-bit direction is practical.
- One giant `by decide` over every two-pile refinement row, with the full
  composition transition function inlined repeatedly, exceeded 10 GiB and was
  stopped. This is a cost problem, not a failed mathematical condition.

- Brute-force product-encoding inverse checks and nested `Fin.cases` proof
  aggregation were costly. Product inverses now use symbolic arithmetic;
  `checked_list_rows` aggregates indexed proof lists with checked coverage.
- Large array lookup chains made later successor rows far more expensive than
  row zero. The flat-array benchmark for row 1000 was stopped after exceeding
  50 seconds; a balanced-lookup version checked the same row in a 17.54-second
  whole-file run, including data elaboration. Use balanced lookup for the large
  successor and refinement tables, rather than assuming the first-row timing
  represents later rows.

The producer emits cached successor data and proves each row equals the
semantic transition once, then checks subset refinement against the cache.
Finite checks use individual row theorems and proof-list aggregation. Run one
heavy builder at a time with `LEAN_NUM_THREADS=1`; project Lean invocations use
`-j1 -M4500`. A virtual-address-space cap prevented thread creation and is not
appropriate here; use Lean's own memory limit.
The two-pile stage passed its source build, whitelist audit and kernel replay.
Its refreshed source build took 330 seconds with maximum RSS 2,823,976 KiB.
Set `exponentiation.threshold` to the finite NFA size to permit direct numerical
reduction of its bounded bit masks. The next experimental emitted module is
`CutPeriodParts3Certificate.lean`; it uses the checked digit-choice table for
transition-cache certification. Do not promote it before its checks pass.
Its first build hit Lean's memory limit in the interpreter after 96 seconds
(maximum RSS 5,509,236 KiB). The revised producer splits large lookup definitions
into 64-row helper declarations to bound per-declaration caches. This stage is
still experimental; do not raise its status from generated data alone.
Splitting the lookup definitions alone did not fix the failure: the second
trial also hit the interpreter memory limit after 90.60 seconds, maximum RSS
6,131,908 KiB. Its data-only prefix passed in 39.24 seconds at 2,542,740 KiB.
Disabling `Elab.async` kept a temporary profile bounded at 2,843,424 KiB; it
was interrupted after 5:33.95 without a complete proof. A synchronous build
with style linters disabled was also interrupted after 12:50.66, maximum RSS
3,854,436 KiB. Neither run is an accepted three-pile proof.

The producer now emits 39 modules for three piles: shared product data,
27 transition blocks of at most 256 states, a checked aggregation, shared
subset data, eight refinement/final blocks, and the final certificate. The
first transition block passed in 13 seconds (whole command 14.31 seconds) at
1,773,052 KiB maximum RSS. `FiniteIntervalCertificate.checked_interval_rows`
provides exact interval coverage. The final aggregation chooses the unique
256-state block containing each index. A module manifest records every module
that must be kernel-rechecked before the group can be registered.
In the earlier build, all 27 transition blocks and the transition aggregation
passed source builds. The task-owned loop then stopped in
`CutPeriodParts3StateData`; the subset refinements and final certificate did
not pass a complete build.

The producer now separates the three-pile subset data into 33 independent
modules, each containing at most 32 KiB of numerical lookup declarations.
All 33 data modules passed source builds after the collection layout migration,
with observed peak process-tree RSS below 0.85 GiB. They preserve the original
lookup declarations and all certificate statements. The dispatcher imports
those modules; the ordered `CutPeriodParts3.modules` manifest now has 72 entries.
The full dependent chain and its kernel replay are still pending. None of
these experimental three-pile modules is registered as an accepted certificate.

The four-plus-four construction has 968 product states, 564 raw subset states,
and 15 minimized states. Its checked generic composition theorem removes
groups five through seven from the necessary proof path. The pending group
four, eight, and nine manifests have 72, 20, and 19 modules, respectively.
Both option-union certificates are also generated. Generation alone establishes
no formal theorem. A sequential queue can build independent data modules while
a prerequisite is rebuilt. Resume dependent certificate compilation only after
that prerequisite is available; avoid duplicate heavy builds.

`BinarySetCertificate` supplies a structural sorted-list set checker and proves
its equality implies equality of the original masks. The library `mergeSort`
stuck at its well-founded recursion proof in a tiny kernel-reduction control,
so it is not used for this checker. Large normalized-row trials hit a 3 GB
limit while elaborating shared subset data; no normalized large-row benchmark
has passed yet. The active three-pile producer still uses the original masks.

## Unfinished alternative automata connection

This section concerns only the unused large-certificate route. The concrete
game theorems are proved by the quotient/residue modules above.

Items 1–4, 6, 10 and the candidate-function part of 9 below are checked.
Item 5 is checked through two piles. The four numerical error checks in item 7
are checked. Item 8 requires the actual-option language correspondence.
Groups three, four, eight, nine and the union refinements remain open.
`CutPeriodTheorem.lean` contains the unregistered final bridge from those
certificates to both actual recursive game values and their exact parameters.
It must not be promoted before all dependencies and the bridge pass source
builds, the axiom whitelist, and independent kernel replay.

1. Fixed-width encoding: encode both numerical tracks into exactly `L` digits;
   prove decoding, length and uniqueness. `decodeHigh` is low decoding of the
   reversed word. Construct common columns for two encoded inputs and a given
   output word with equal length.
2. Candidate bound `value n <= n`: prefix and 12 tail residues suffice, followed
   by the linear quotient relation. For a pile list, XOR of its values is at
   most their sum and therefore at most the sum of pile sizes.
3. Define `Piles p n g` by an actual list of `p` positive pile sizes, sum `n`,
   and XOR of candidate values `g`. Reuse `CutFamily.xorList` and the existing
   actual-rule mex interface; do not introduce a tautological game model.
4. Prove the graph machine recognizes `Piles 1`. Prove composition recognizes
   `Piles (p+1)` from machines for `Piles p` and `Piles 1`. The reverse direction
   must pad all hidden size/value tracks to the visible word length. The bound
   in item 2 proves that no valid witness needs more bits.
5. Finish rowwise checked refinements for the needed groups 2, 3, 4, 8, 9 and
   instantiate the semantic theorem. Eight uses the checked arbitrary-group
   composition theorem with four piles on each side. Every concrete refinement
   must pass the kernel and axiom audit before being registered as accepted.
6. Lower-value machine: project a hidden candidate graph value while tracking
   its comparison to the visible value. Prove the MSB comparison-state update
   preserves numerical comparison. The same `value n <= n` bound supplies
   width completeness for the hidden graph-value track.
7. Union/product/error certificates: the Python producer records the required
   raw states and labels. Check finite transition closure and nonacceptance for
   collision and missing-smaller-value languages. Transfer them to all words.
8. Convert all-word results to all pile sizes using fixed-width encodings.
   The mex equations then identify the actual Grundy function via the existing
   `CutFamily.grundy_unique` theorem. Handle both allowed arity sets.
9. Prove preperiod, saltus and minimal period from the explicit formula,
   including exclusion of periods 3,6,9 and failure to start at pile six.
10. Completed: the general finite arithmetic-periodicity test, including
    arbitrary hidden-witness padding and terminating finite emptiness, and
    exhaustive search that finds a representation whenever one exists.

Maintain exact scope in `docs/lean-status.md`; the graph recognizer and the
composition framework alone do not prove either game's universal mex property.
