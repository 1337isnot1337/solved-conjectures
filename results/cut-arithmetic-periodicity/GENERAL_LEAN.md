# Lean proof of the general finite CUT test

The general decision test in [PROOF.md](PROOF.md) is formalized for every finite
cut set and every proposed finite-prefix arithmetic sequence. The formalization
constructs the required automata from the sequence data. Their correctness is
proved inside Lean.

The main declaration is `CutGeneral.Candidate.test_correct` in
[`CutGeneralGraph.lean`](../../lean/Conjectures/CutGeneralGraph.lean).
An exhaustive candidate search is defined in
[`CutGeneralSearch.lean`](../../lean/Conjectures/CutGeneralSearch.lean).
The reusable automata and legal-split constructions are in
[`CutGeneralDecision.lean`](../../lean/Conjectures/CutGeneralDecision.lean).

## Input and exact statement

A `Candidate` contains:

- A prefix length `N`, which can be zero.
- A table `prefixValues : Fin N → Nat`.
- A positive period `P`.
- A table `tail : Fin P → Nat`.
- A nonnegative saltus `s`.

These data define a function `f : Nat → Nat` by

\[
f(0)=0,
\qquad
f(n)=\operatorname{prefixValues}(n-1)\quad(1\le n\le N),
\]

and

\[
f(N+1+Pq+r)=sq+\operatorname{tail}(r)
\quad(q\ge0,\ 0\le r<P).
\]

The cut set is supplied as a finite list `cuts : List Nat`. Repetitions have no
effect. A move splits a positive pile into at least two positive piles. A listed
cut size zero therefore contributes no move.

For a positive pile size `n`, define `A(n,g)` to mean that a list of positive
parts has total `n`, has an allowed number of parts, and has candidate-value
XOR `g`. The Lean predicate is
`CutFamily.OptionValue {d | d ∈ cuts} f n g`. It requires all of the following:

\[
\begin{aligned}
&h_i>0,\\
&k\ge2,\qquad k-1\in\mathrm{cuts},\\
&\sum_{i=1}^{k}h_i=n,\\
&f(h_1)\mathbin\oplus\cdots\mathbin\oplus f(h_k)=g.
\end{aligned}
\]

`SatisfiesMex cuts f` states, for every `n > 0`, that `A(n,f(n))` is false and
`A(n,g)` holds for every `g < f(n)`. These are the actual CUT mex equations.

`Candidate.test` is a computable Boolean function. Its correctness theorem is:

```lean
theorem Candidate.test_correct (c : Candidate) (cuts : List Nat) :
    c.test cuts = true ↔
      CutFamily.SatisfiesMex {d | d ∈ cuts} c.value
```

There are no recognizer, witness-width, published-theorem, or periodicity
hypotheses in this statement. The input tables and the positive-period proof
are its entire candidate specification.

The companion theorem `Candidate.test_identifies_grundy` states that a successful
test identifies every positive value of the game's Grundy function. It uses the
existing uniqueness theorem for the exact mex equations. Its premise on the
game function `G` is that `G` satisfies those defining equations.

## How the construction is proved

### Each arithmetic piece has a finite graph automaton

The candidate graph is a finite union of prefix singletons and arithmetic rays:

\[
(n,g)=(a+Pq,b+sq),\qquad q\ge0.
\]

Every piece has `a > 0` and `P > 0`. A singleton uses the same representation
with the additional restriction `q = 0`.

Read binary digits from most significant to least significant. The machine
tracks

\[
u=sn-Pg,\qquad n\bmod P,\qquad \min(a+1,n).
\]

Set

\[
M=s+P+sa+Pb.
\]

The discrepancy counter has the finite range `[-M,M]`. An additional state
rejects every continuation. For size and value bits `x,y`, its update is

\[
u\longmapsto2u+sx-Py.
\]

`Piece.outside_stays_outside` proves that a counter outside the range cannot
return. `Piece.classify_step` proves that every transition tracks the exact
integer values of the binary prefixes.

At the end, the machine requires `n ≥ a`, the correct residue modulo `P`, and
`u = sa-Pb`. These conditions are equivalent to the arithmetic ray relation.
For a singleton, the capped size also requires `n = a`.

The machine has

\[
(2M+1)P(a+2)+1
\]

states before any minimization. `Piece.machine_correct` proves its exact
language for every binary word. `Candidate.graph_correct` combines the pieces
and proves the complete candidate graph.

### Every hidden witness receives enough binary columns

The general construction permits candidate values larger than their pile sizes.
It proves a uniform bound

\[
f(n)\le Cn\qquad(n>0),
\]

where the computable constant is

\[
C=1+\sum_{\text{pieces }R}(R.b+R.saltus).
\]

For positive parts with total `n`, the XOR of their candidate values is at most
their sum, which is at most `Cn`. Each constituent size is also at most `n`.

The construction pads the visible word with `D = C+1` leading zero columns.
Lean proves `C < 2^D`. These columns suffice for all hidden sizes and values in
addition/XOR composition and in the lower-value projection. The proof applies
to every visible word, including words with additional leading zeros.

`sum_recognizes_successor` proves that the constructed automaton recognizes
exactly the actual lists of positive parts. `options_correct` then takes the
finite union over the allowed cut sizes. No numerical option table is supplied
as an assumption.

### Finite emptiness tests are equivalent to the mex equations

`determinize` implements the full subset construction. Boolean products and
finite unions have proved language semantics. They construct the two error
languages:

\[
F(n,g)\land A(n,g)
\]

and

\[
n>0\land g<f(n)\land\neg A(n,g),
\]

where `F` is the exact candidate graph.

The existing `BinaryAutomata.DFA.emptyCheck_correct` supplies a terminating
emptiness test. Every reachable state has a witnessing word shorter than the
number of states. Enumerating those words therefore decides emptiness.

`graphTest_correct` combines these constructions. `Candidate.test_correct`
discharges its graph and linear-bound premises from the input prefix and tail.

## Exhaustive search for a representation

`enumerateCandidates B` is a finite, computable list. It includes all candidates
whose prefix length, positive period, saltus, and table entries are at most `B`.

`verifiedCandidates cuts B` filters that list with the proved Boolean test.
`verifiedCandidates_sound` proves that every returned candidate satisfies the
exact CUT mex equations.

For a candidate `c`, define the explicit search bound

\[
B_c=1+N+P+s+
  \sum_{i<N}\operatorname{prefixValues}(i)+
  \sum_{r<P}\operatorname{tail}(r).
\]

`verifiedCandidates_complete` proves that a valid candidate `c` occurs in
`verifiedCandidates cuts B` for every `B ≥ B_c`. Thus exhaustive enumeration
finds a representation whenever one exists. The theorem does not assume that
every finite CUT game has an arithmetic-periodic representation.

## Scope and reproduction

This proves the general finite test and the completeness of candidate
enumeration. The concrete sequences for `{1,2,8}` and `{1,2,7,8}` use the separate
specialized option certificates. This construction does not evaluate the large
general Boolean test on those two inputs.

The construction proves termination. It makes no practical running-time claim.
Subset construction and the complete short-word search can have large state
spaces.

The files use the repository's pinned Lean 4.35.0 and Mathlib manifest. From the
repository root:

```sh
cd lean
lake build Conjectures.CutGeneralSearch
lake env leanchecker Conjectures.CutGeneralDecision
lake env leanchecker Conjectures.CutGeneralGraph
lake env leanchecker Conjectures.CutGeneralSearch
```

The project axiom audit must cover the `CutGeneral.` namespace. Accepted
transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`. The test
and enumerator are computable definitions; their correctness proofs use no
`sorry`, custom axiom, or native-computation axiom.

## Local validation, 18 November 2026

All three source modules compiled successfully with the pinned toolchain.
Independent `leanchecker` replays of all three modules exited with status zero.
The printed transitive axiom sets for the decision, identification, search
soundness, and search completeness theorems contain only `propext`,
`Classical.choice`, and `Quot.sound`. Hosted CI validation is recorded separately
by the repository workflow.
