# Independent review of the partial cutting compiler

Research review, 23 November 2026 (America/Chicago). Read the full
[`CUTTING_COMPILER_ATTEMPT.md`](CUTTING_COMPILER_ATTEMPT.md)
and reread the revised Sections 2, 4–6, and 8. The positive components and
their current qualifications pass. The review identified a missing
finite-slot cost in the original scalar-stage accounting; the author
repaired it and proved a different conditional estimate. No complete
recursive protocol or complex BSS separation follows from the note.
The final Sections 6 and 9 additions and the native-clock clarification
were also reviewed; their statements pass.

## The word extension

The weighted generator guesses a genuine Boolean word, appends one of
the two names `r_i,1-r_i` at each position, and then runs the bounded
plain evaluator. Expanding its accepting runs gives exactly the stated
multilinear extension. Invalid words and simulated `use` instructions
reject. Clocking the simulated original computation at its native budget,
with the displayed universal-interpreter overhead charged, preserves all
accepting contributions of valid plain instances.

There are `O(s)` name slots, not `2^s` stored word values. The trie lookup
and bounded universal simulation give the stated near-linear per-run
bound. This is a weighted program with a nonempty tally, not a plain
program and not a deterministic arithmetic evaluation of its value.
The note retains both distinctions.

## Terminal sumcheck and exact transcript multiplicity

With prescribed inactive slots, the factor
`1-a_j+a_j Phi_T(w_j)` is the piece value on an active Boolean slot and
one on an inactive slot. A parsimonious accepting-transcript encoding
therefore makes the Boolean sum of the displayed kernel equal the
source's cutting sum. Fixed padding and deterministic gate, copy, and
sorting values are necessary to avoid spurious multiplicities; they are
specified.

The AND-gate factor is correct on all eight Boolean triples. NOT and
copy factors can likewise be multilinear. Binary copy trees give each
coordinate bounded occurrence. Dedicated piece-word coordinates then
occur in one multilinear word extension and only a bounded number of
local constraints. The current version explicitly limits the ordinary
weight mechanism to a fixed finite transition alphabet and implements
its selection by dedicated Boolean controls. Under that hypothesis the
constant individual-degree bound is valid. Arbitrary dynamically
computed field weights are not included for free.

Sorting the `t` access records together with the `s` initial input records
uses `O((t+s)log^2(t+s+2))` comparators; each comparator has Boolean size
`O(log(t+s+2))`. Local transitions and memory consistency checks are
deterministic. This supports the stated near-linear transcript length,
without a quadratic time-by-space tableau. The revised record count
correctly includes the input initialization.

The correlation example also checks: averaging the two correlated words
`00,11` gives `1/2` for the AND observable at `r=1/2`, while independent
marginal extension gives `1/4`. This does not invalidate a predeclared
unreduced kernel with dedicated word slots and copy constraints. It
prevents changing to a different extension midway through its sumcheck.

## The slot-selection repair and the corrected recurrence

Guessing all `P` terminal piece values and universally selecting one slot
is sound. It costs one quantifier block, but has `P` possible outcomes.
For a constant-grid strategy-tree estimate, it costs a factor `P`, or
`ceil(log_2(P+1))` binary scalar challenges. The original transition from
the terminal interface to a constant scalar toll omitted that cost.

The repaired note keeps the old recurrence with `O(1)` toll only as a
stronger hypothetical compiler assumption. For that recurrence, the
supersolution `L(log L)^c` at scale
`x=K sqrt(L log L)` checks: the outer decrement has coefficient `24`,
the piece term has coefficient `H 2^-c`, and the strict inequality between
them leaves room for a fixed toll.

For the actual slot interface, the new conditional toll is `O(L)`. At
`x=L^(3/4)` and `F_*(L)=C L^(5/4)`,

```math
F_*(L)-F_*(L-24L^{3/4})=30CL(1+o(1)),
\qquad F_*(HL^{3/4})=CH^{5/4}L^{15/16}=o(L).
```

Taking `C` large enough absorbs the toll. Both child budgets are smaller
for large `L`, and finitely many base cases can be covered. The general
`x=L^beta`, `F=L^(2-beta)` variant is also correct for the stated fixed
range. These are valid conditional recurrence bounds, not evidence that
the unresolved recursive interface exists.

For either chosen scale, taking `alpha=ceil(L/(Hx))` verifies J.4's
logarithmic scale restriction with the constants as stated. It does not
verify the separate inherited-input restriction.

## Tree-size consequences and input budgets

A fixed grid of constant cardinality at each scalar stage gives full
strategy size `poly(N) (D_0+1)^h`. The corrected conditional stage count
therefore gives logarithmic border size `O((log m)^(5/4))` when all other
resources are polynomial in `m`. This would contradict the standing
exponent `4/3` if the compiler hypotheses were established. The general
Koiran majority conversion instead gives `N^(O(h))`, hence logarithmic
size `O((log m)^(9/4))`; it does not give that contradiction.

Piece children inherit fractional input slack `32/H`, enough for either
sublinear next logarithmic scale. An outer child can inherit an input
with only `24x` logarithmic slack while the next proposed call asks for
about `48x`. The parent input condition therefore does not imply the
next outer input condition. A long outer chain also cannot reduce a
nonshrinking polynomial-length root input to a constant-cost leaf by
adjusting time alone.

## Sparse postponement

The sorted list of distinct names and positive multiplicities is unique
for each accepting run. The counter interpreter accepts that run for
exactly that list, and it adds no named constants. This proves the sparse
postponement identity as a polynomial identity in the named values.
It remains valid after arbitrary complex specialization.

Canonical-list validation, trie queries, decrementing bounded counters,
and checking that every counter is exhausted have the stated
`O(B+P log(P+2))` data and update bounds, in addition to the original
program and its input and the displayed interpreter overhead. There is
no full exponential name inventory. Choosing one list existentially
still does not verify the sum over lists. The note correctly forbids
interpreting fractional list bits as actual trie names.

At J.4's piece budgets, `B<=P ell<=tau/v^30`. Combining its two scale
inequalities gives
`log tau <= (H/C_cut) (log v)^2/log log v`, up to the source's fixed
integer-log constants. Counter formatting is therefore absorbed by the
stated budget. The ratio to outer time is only `v^6`, leading to the
next-scale constraint `u^48` bounded by that ratio when these advertised
upper budgets are charged. The note correctly does not turn those upper
budgets into lower bounds on every actual list.

Finally, inlining the opaque piece calls costs the advertised `PT` bound
`tau v^2`, which is not a time saving. J.4 remains a plain-program theorem,
and K.5 starts with a value-preserving accelerator. Neither has been
silently applied to an HN answer, to an opaque value call, or to a
terminal extension. Those are the actual remaining interfaces.

## The final protected-tensor and leaf-predicate additions

The protected star is exact for every complex matrix. Expanding its row
product, a monomial that uses a proper set of columns has total
inclusion-exclusion coefficient zero; using all `m` columns in `m` rows
is exactly a permutation. Its network value is therefore the permanent,
although each central-tensor entry costs only `O(m^2)` operations and the
network is already a tree.

The cited H.2(c) explicitly retains the original node tensor multiplied
by the move tensors, summed over the packets used up at that node.
H.2(e) explicitly retains an additional `Lambda N` term for a given
node. These statements support the limited conclusion: protecting an
opaque node does not eliminate or evaluate its local sum. A challenge
vector of length `ell` also has `q^ell` scalar grid assignments, even when
written as one quantifier block. The note does not infer an impossibility
for every more structured decreasing-resource compiler.

The new leaf-predicate distinction is necessary and correct. Finite
strategy expansion supplies independent witnesses for polynomial-size
NP leaves, including leaves that only demand positive existential HN
certificates, without assuming HN is easy. A general `P^HN` leaf may also
depend on negative HN answers. Replacing those adaptive oracle calls by
deterministic computations uses the hypothetical HN decider and its
fixed polynomial exponent. The current constructions supply neither
that use of negative answers nor a complete recursive compiler.
