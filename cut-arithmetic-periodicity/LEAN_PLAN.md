# Checked automata route

The game-period theorem remains incomplete. The accepted building blocks live
in `l-solitaire-limit-shapes/lean/Conjectures`:

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
- `CutPeriodParameters`: least period 12, saltus 8, earliest start seven for the
  proposed function, independently of the unfinished game identification.

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
`CutPeriodParts2Certificate.lean` is the current experimental emitted module;
it is not yet an accepted stage.

## Remaining semantic connection

Items 1–4, 6 and the candidate-function part of 9 below are now checked.
Items 5, 7, 8 and 10 remain open.

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

Maintain exact scope in `LEAN_VERIFICATION.md`; the graph recognizer and the
composition framework alone do not prove either game's universal mex property.
