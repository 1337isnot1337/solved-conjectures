# Checked automata route

The game-period theorem remains incomplete. The accepted building blocks live
in `lean/Conjectures`:

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
  proposed function, independently of the unfinished game identification.
- `CutPeriodOptionData` and the four `CollisionA/B`, `MissingA/B` certificates:
  the numerical error languages are empty for every word. The option-DFAs'
  actual-split semantics is still unproved.
- `CutPeriodCertifiedMex`: the complete mex conclusions follow once that
  explicit actual-option correspondence is supplied, with no other hypotheses.
- `BinaryDecision`: complete short-word bounds and a terminating finite
  emptiness test for every finite DFA.
- `CutMexDecision`: the two finite tests are necessary and sufficient for the
  actual CUT mex equations when exact graph/lower/option recognizers are given.

The untrusted producer `generate_lean_certificates.py` reproduces the original
Python automata and preserves every representation and quotient label in an
ignored JSON intermediate. `--parts-until N` emits Lean modules through a
chosen pile group; `--lower` also emits the checked lower-value DFA. Default
emits only the checked graph. Do not promote a
stage merely because its Python data were generated.

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
At the owner's pause request, all 27 transition blocks and the transition
aggregation had passed source builds. The task-owned build loop was stopped
in `CutPeriodParts3StateData`; the remaining subset refinements and final
certificate have not passed. The ordered manifest is `CutPeriodParts3.modules`.
None of these experimental three-pile modules is registered as accepted yet.

`BinarySetCertificate` supplies a structural sorted-list set checker and proves
its equality implies equality of the original masks. The library `mergeSort`
stuck at its well-founded recursion proof in a tiny kernel-reduction control,
so it is not used for this checker. Large normalized-row trials hit a 3 GB
limit while elaborating shared subset data; no normalized large-row benchmark
has passed yet. The active three-pile producer still uses the original masks.

## Remaining semantic connection

Items 1–4, 6 and the candidate-function part of 9 below are now checked.
Item 5 is checked through two piles. The four numerical error checks in item 7
are checked, and item 8 now requires only the actual-option language hypothesis.
Groups three through nine and the union refinements remain open. Item 10 now
has a proved terminating finite emptiness test and the exact mex-test
equivalence, conditional on exact finite recognizers. Their uniform
construction, including arbitrary-witness padding, is still open.

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
5. Finish rowwise checked refinements for groups 2 through 9 and instantiate
   that semantic theorem. Every concrete refinement must pass the kernel and
   axiom audit before being registered as accepted.
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
10. Formalize the general finite arithmetic-periodicity test, including witness
    padding during projection/complement and terminating finite reachability.

Maintain exact scope in `docs/lean-status.md`; the graph recognizer and the
composition framework alone do not prove either game's universal mex property.
