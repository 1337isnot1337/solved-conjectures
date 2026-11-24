# Independent review of the generic-quantifier conversion

Research review, 23 November 2026 (America/Chicago). Reviewed
[`GENERIC_QUANTIFIER_SUMCHECK_AUDIT.md`](GENERIC_QUANTIFIER_SUMCHECK_AUDIT.md),
including Sections 1–6 in full and the scoped budget calculation in
Sections 7–8. Checked Koiran's Theorems 4.5, 4.8, 4.11, and 5.5 against the
locally preserved text of LIP Research Report 98-15. No remaining defect
found after the reached-mask check was clarified. This is internal written
review, not formal verification or a proof of the full separation.

## Sampling the original suffixes

For each stage, the original suffix defines a constructible subset of the
challenge space. Its free parameters are exactly the original prefix
coordinates, together with any machine constants deliberately made free.
Koiran's Theorem 4.5 applies with this parameter count and gives one list of
`2s_i+1` samples whose majority test is correct for every original prefix.
The list is not chosen anew after seeing one numerical prefix.

The backward compilation is important. Once the compiled later suffix is
equivalent to the original one for every original prefix, it has precisely
the same truth value at every preselected sample. New mask coordinates do
not enter the original predicate or the original challenges, so they do
not increase the parameter dimension to which this sample list must be
uniform. No elimination-size bound for the original suffix is needed for
this nonuniform existence argument.

## Mask equivalence and the repaired implementation

Boolean equations and a sum of `s_i+1` force exactly that many active
positions in characteristic zero. The existential mask followed by one
finite universal index is therefore equivalent to majority. One need not
existentially supply a full tree before that index; later witnesses retain
their proper dependence on the selected challenge.

The original display (5) was correct. An accompanying operational sentence
initially allowed a misleading implementation in which inactive leaves
accepted before any mask validation. An all-zero invalid mask would evade
all checks in that implementation. The author repaired this: scan stages
in order, validate every reached mask and reject if it is invalid, and
only then accept an inactive or out-of-range branch. This implements the
displayed conjunction and avoids the vacuous-mask error.

## Resource counts and the tree consequence

Each sample list has at most `2N+1` entries. The total sample-coordinate
count is at most `(2N+1) sum_i q_i`; the total mask count is at most
`h(2N+1)`. Scanning a list and checking its mask costs
`O(L_i q_i+L_i)`. These bounds give the stated `O(N^2)` resources along a
single path, including the original witnesses, and `O(N log N)` challenge
bits. They do not charge a full strategy tree as a single circuit.

Applying the previously reviewed tree-KKT theorem with the same `h` finite
stages yields `(N+d+2)^(C(h+2))` for an absolute constant `C`. For
polynomial resources in `m`, the logarithm of this bound is
`O((h+2) log m)`. Therefore `h=o((log m)^(1/3))` contradicts the standing
permanent border lower bound. This is an exclusion of that protocol
resource range, not construction of a protocol.

## The uniform construction does not duplicate a suffix

Koiran's Theorem 4.8 replaces a generic `q`-coordinate block by existential
translations, a universal vector, and a disjunction over `q+1` translates.
A one-hot existential selector after the universal vector makes the
disjunction use one copy of the suffix. The selector chooses the challenge
fed into that suffix. Its position preserves the exact dependencies of
the original translated-disjunction formula.

The translations use `q(q+1)` coordinates per stage; selector and challenge
registers add only polynomially many more. A standard gate or BSS
transcript supplies one final existential block and polynomial-size local
equations, including nonzero divisor witnesses. Pulling the prefix out
therefore gives a polynomial-size ordinary formula with `O(h+1)` blocks.
Treating arbitrary machine constants as extra free coordinates leaves
integer-coefficient formulas to which Theorem 4.11 applies. Its source
bound is `O(log L)+(M log sigma)^(O(k))`; after these substitutions and
constructing all stage lists, the safe cost is `N^(O(h+1))`.

The later finite-tree expansion really copies existential tuples for each
prefix. Its branching is at most `2N+1` at each depth and its depth is `h`,
giving total size `N^(O(h+1))`. Under a fixed polynomial-time HN decider,
the usual existential transcript reduction retains that same form of time
bound. It becomes polynomial for fixed `h`; it gives no polynomial bound
when `h=m`.

## Sumcheck and the budget calculation

Backward induction in the actual Ryser protocol makes the winning suffix
condition `q_i(r_i)=s_i(r_i)`. A nonzero degree-`D` difference has finitely
many roots, so generic and ordinary soundness both work in their proper
message order. The fixed grid of `D+1` points also suffices. Its literal
strategy-tree expansion has the stated number of message positions.

The reversed-order example at `m=1`, `X=0`, `y=1` checks exactly:
`q_r=(t-r)/(1-2r)` passes the false claim for every `r!=1/2`. A witness in
the algebraic closure of `C(r)` may use these coefficients. Field extension
does not impose membership in the earlier coefficient field.

The source's constant-round qualification is explicit after Koiran's
Theorem 5.5. No arbitrary-round collapse is imported. Likewise, the
cutting discussion retains the weighted sum and the contracting-field
hypothesis. The identity `log a+log b=log tau+(H-24)log v` proves the
advertised leaf-count lower bound for the stipulated serial budget-tree
expansion. It is correctly not presented as a lower bound for every
protocol. The balanced exponent and the separate input-size condition
are consistent with the displayed source budgets.
