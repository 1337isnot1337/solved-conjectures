# Hartke–Stolee–West–Yancey matching-excess conjecture

## Status

The Lean formalization is incomplete. Checkpoint 001 proves the general
binary arithmetic and the actual graph-count foundations in eight modules.
It does not prove divergence of the extremal constants or their tail
minimum, and this entry contributes zero completed results to the campaign.

The checked import root is
[`Conjectures.HartkeMatchingExcess`](../../lean/Conjectures/HartkeMatchingExcess.lean).
The [receipt](../../docs/verification/lean-hartke-matching-excess-partial-20261124-162051/receipt.json)
pins every source and verifier hash, required endpoint, and scoped check.

## Source and exact target

Stephen G. Hartke, Derrick Stolee, Douglas B. West, and Matthew Yancey posed
Conjecture 9.15 on printed page 21 of the author manuscript dated 5 May 2011,
*Extremal Graphs With a Given Number of Perfect Matchings*. The final article
appeared in *Journal of Graph Theory* 73(4) (2013), 449–468,
[DOI 10.1002/jgt.21687](https://doi.org/10.1002/jgt.21687).
The [public author manuscript](https://dwest.web.illinois.edu/pubs/perfmat.pdf#page=21)
was read directly for the statement, definitions, binary construction, and
two-vertex extension.

For even vertex count $`n`$, $`f(n,p)`$ is the largest number of edges in a
finite simple graph with exactly $`p`$ perfect matchings, when such graphs
exist. Dudek and Schmitt's eventual formula defines $`c_p`$ by
$`f(n,p)=n^2/4+c_p`$ for all sufficiently large even $`n`$.
The target is divergence of $`m_p=\min_{q\ge p}c_q`$.
The separate stronger rate question and conjectured exact upper bound are
outside this formalization.

The argument being formalized is this existing entry's [PROOF.md](PROOF.md),
contributed by Cinna Davis in repository commit
`a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7`; its SHA256 is
`f1e48357ca480242f69e8ffdf75ab0fa9611f95d25a3e6e9d3244a7d92bb5f25`.
The source authors receive credit for the conjecture, the prior binary
construction, and the extension. The existing [audit](AUDIT.md) records the
bounded literature search and priority limits. This work makes no new
discovery or exclusive-priority claim.

## Checked scope

`binaryWeight` is the sum of the ordinary base-two digits, and
`binaryLength` is their length; both are zero at zero. For every positive
integer $`n`$ and integer $`u\ge2`$ with $`w(n)<u`$,
`mersenne_division_weight_bound` proves

```math
\operatorname{bitlength}(n)\le
u\left(w(n)+w\!\left(\left\lfloor n/(2^u-1)\right\rfloor\right)\right).
```

The positive-Mersenne-multiple residue fact is proved by folding the high
and low binary blocks. Binary-weight subadditivity shows that folding never
increases the weight. The long-division proof uses the bit length of the
nonzero remainder as a potential: a zero in both input and quotient raises
that potential by one, and every other step costs at most $`u`$. This is an
equivalent organization of the recorded cyclic-carry and zero-run argument.

`input_lt_of_excess_bounds` proves the resulting finite bound
$`n<2^{(2C+1)(C+1)}`$ under two explicit hypotheses on an arbitrary natural
$`C`$: $`w(n)\le C`$ and
$`w(\lfloor n/(2^{w(n)+1}-1)\rfloor)\le C+1`$.
These hypotheses have not yet been connected to the source's $`c_p`$.

The graph development uses Mathlib's
`SimpleGraph.Subgraph.IsPerfectMatching`, including its spanning condition.
`perfectMatchingCount` is the cardinality of those actual matchings.
`cycleCoverMatchingEquiv` proves the bijection for finite split-clique
graphs: the right class is independent and has the same size as the left,
so every perfect matching uses cross edges.

`returnFiberEquiv` proves insertion/removal of the last vertex of an
increasing path as a bijection of actual permutations. Thus
`pathCount_rec` and `perfectMatchingCount_returnGraph` establish the
recorded $`1+\sum_{j\in J}w_j`$ matching-count identity. The path counts are
cardinalities of constrained permutations; no recurrence is postulated as
a substitute for the graph count.

`baseGraph_edge_card` proves that the graph with no return arcs has exactly
$`(R+1)^2`$ unordered edges by a bijection with ordered pairs of indices.
`binaryPositions_sum` and `binaryPositions_card` connect Mathlib's existing
binary-subset representation to the exact weight used above.

## Remaining work

The checkpoint does not include the following obligations:

1. Derive and check the closed path-count formulas after deleting the arc
   $`1\to u`$, uniformly for every $`u\ge2`$ and every graph size. A later
   source draft is not part of this receipt.
2. Assemble the two actual graph witnesses for every positive matching
   count, including residue-subset selection, return-edge cardinality,
   deleted-edge cardinality, and relabeling to an even finite vertex set.
3. Prove the finite upper bound on actual graph excess, the two-vertex
   extension, existence of the maximizing integer $`c_p`$, and its equality
   with the paper's eventual extremal constant. No unproved
   Dudek–Schmitt theorem or witness-only surrogate is used in the checked
   modules.
4. Apply the arithmetic bound to those constants and prove divergence of
   the actual tail minimum $`m_p`$.

## Verification

At 2026-11-24 18:29:37 UTC, all eight frozen modules passed fresh Lean 4.35.0
builds with `-DwarningAsError=true`. The repository's unchanged all-owned
audit checked 179 declarations, including 152 theorems and 19 private
declarations, with all ten required endpoints present. The only permitted
transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`.
The unchanged stock replay helper then replayed exactly the eight-module
local closure successfully. The receipt and complete logs are preserved.

These are scoped proof checks. They are not a repository-wide build, a
hosted-CI result, or a website-deployment receipt. The separate aggregate
dependency-artifact limitation remains tracked in
[issue #563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
