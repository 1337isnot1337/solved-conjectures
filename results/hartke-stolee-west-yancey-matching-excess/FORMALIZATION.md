# Hartke–Stolee–West–Yancey matching-excess conjecture

## Status and exact result

The full Conjecture 9.15 is formalized for actual finite simple graphs, with
the quantitative lower bound recorded in the existing proof. The import
root is [`Conjectures.HartkeMatchingExcess`](../../lean/Conjectures/HartkeMatchingExcess.lean).
This is one completed existing result; modules, auxiliary bounds and
quantitative restatements are not separate results.

For a positive integer $`p`$, let $`f(2n,p)`$ be the maximum edge count of a
simple graph on $`2n`$ vertices with exactly $`p`$ perfect matchings, whenever
such graphs exist. The formalization proves the existence and uniqueness
of an integer $`c_p`$ such that $`f(2n,p)=n^2+c_p`$ for every sufficiently
large $`n`$. It then defines and proves attainment of the actual tail
minimum $`m_p=\min_{q\ge p}c_q`$, and proves

```math
\lim_{p\to\infty}m_p=+\infty.
```

For every $`p\ge2`$, writing $`N=1+\lfloor\log_2(p-1)\rfloor`$, Lean also
proves both recorded estimates:

```math
c_p\ge\frac{\sqrt{8N+1}-3}{4},\qquad
m_p\ge\frac{\sqrt{8N+1}-3}{4}.
```

There is no fixed graph size, finite input range, subsequence restriction,
or unproved construction or stabilization premise. The stronger growth
question after Conjecture 9.15 and the separate proposed exact upper bound
are outside this result.

## Source and attribution

Stephen G. Hartke, Derrick Stolee, Douglas B. West and Matthew Yancey posed
Conjecture 9.15 on printed page 21 of the author manuscript dated 5 May 2011,
*Extremal graphs with a given number of perfect matchings*. The final article
appeared in *Journal of Graph Theory* 73(4) (2013), 449–468,
[DOI 10.1002/jgt.21687](https://doi.org/10.1002/jgt.21687).
The [public author manuscript](https://dwest.web.illinois.edu/pubs/perfmat.pdf#page=21)
was read directly for the exact target and definitions.

The argument formalized here is the existing [PROOF.md](PROOF.md),
contributed by Cinna Davis in commit
[`a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7`](https://github.com/1337isnot1337/solved-conjectures/commit/a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7).
Its SHA256 is `f1e48357ca480242f69e8ffdf75ab0fa9611f95d25a3e6e9d3244a7d92bb5f25`.
The written argument is preserved. The binary construction is credited to
the original authors, the two-vertex extension to Hetyei, and the original
stabilization theorem to Dudek and Schmitt. The formalization supplies the
boundedness and stabilization bridges directly, without assuming those
prior theorems. This is not a new-priority claim for the elementary upper
bound used in that bridge. The bounded literature search and unresolved
historical priority qualifications in [AUDIT.md](AUDIT.md) remain in force.

## Statement correspondence

| Source object or assertion | Lean definition or theorem | Scope |
| :--- | :--- | :--- |
| A perfect matching of a simple graph | `PerfectMatching`, `perfectMatchingCount` | Actual Mathlib subgraphs satisfying the spanning perfect-matching predicate; no proxy count |
| Edge excess at even order $`2n`$ | `graphExcess n G` | Integer edge cardinality minus $`n^2`$ |
| Maximum over all feasible even orders | `excessValues`, `matchingExcess_attained` | All simple graphs on `Fin n ⊕ Fin n`, for every `n`; labels impose no split-graph restriction |
| Exact finite-order extremum $`f(2n,p)`$ | `extremalEdges` | Finite maximum over all simple graphs with exactly `p` perfect matchings |
| Eventual constant $`c_p`$ | `extremalEdges_eventually`, `matchingExcess_unique` | Existence, all sufficiently large orders, and uniqueness proved |
| Tail minimum $`m_p`$ | `tailValues`, `tailMinimum_attained` | Minimum of every `c_q` with `q ≥ p`, attained for every positive `p` |
| Full Conjecture 9.15 | `conjecture_9_15` | `Filter.Tendsto tailMinimum Filter.atTop Filter.atTop` |
| Literal eventual-constant formulation | `conjecture_9_15_eventual` | The same conclusion for any constants specified by the exact eventual formula |
| Recorded quantitative bounds | `matchingExcess_sqrt_lower_bound`, `tailMinimum_sqrt_lower_bound` | Every `p ≥ 2`; `matchingExcess_log_lower_bound` supplies the integer-log version |

All names in the table are in namespace `HartkeMatchingExcess`. The empty
family convention in `extremalEdges` is zero, but the eventual theorem
proves existence of suitable graphs at every order where it is used.
The behavior at `p=0` has no role in the positive-count statements or limit.

## Checked proof chain

The arithmetic modules prove binary-weight subadditivity, the sparse
Mersenne residue fact and the all-input long-division estimate. The residue
proof folds high and low binary blocks. The division proof uses the bit
length of the nonzero remainder as a potential. These are proved
implementations of the recorded cyclic-carry and zero-run argument.

The split graph is a literal finite simple graph. Its right class is
independent and has the same size as the left clique, so every perfect
matching uses cross edges. A proved equivalence identifies these matchings
with permitted permutations. Removing or inserting the final path vertex
is another equivalence, yielding the exact path recurrence and
$`1+\sum_{j\in J}w_j`$ matching-count formula.

The base unordered-edge set is bijective with ordered index pairs. Return
edges are proved new, and deletion removes exactly the specified increasing
edge. The undeleted and deleted path formulas follow from the established
recurrence. The early weights represent every residue below $`2^u-1`$,
including $`u=2`$; disjoint later binary positions represent the quotient.
Thus `binary_graph_witness` and `deleted_graph_witness` produce actual
graphs for every input, with exactly the required matching count and excess.

To discharge the extremal boundedness dependency, fix a perfect matching
with mate involution. Let $`A`$ be the ordered graph edges outside that
matching, $`T`$ apply the mate map to both endpoints, and $`U`$ contain all
ordered pairs excluding a vertex and its mate. Then
$`\lvert A\rvert=2\lvert E\rvert-2n`$,
$`\lvert U\rvert=4n(n-1)`$, and
$`2\lvert A\rvert\le\lvert U\rvert+\lvert A\cap T(A)\rvert`$.
Every pair in the intersection switches an alternating four-cycle to a
different perfect matching. Each output has at most four ordered-pair
preimages. Lean proves all these cardinality statements, hence
$`\lvert E(G)\rvert\le n^2+\Phi(G)-1`$.

Consequently the nonempty set of integer excesses is bounded above and
attains its supremum. The actual Hetyei extension has inverse matching
extension/restriction maps and adds exactly $`2n+1`$ edges. Relabeling and
iteration preserve excess at every larger even order. This proves the
source's eventual finite-order formula and identifies its unique constant.

The two graph witnesses now discharge both hypotheses of the arithmetic
bound. The resulting quadratic inequality gives the square-root estimate.
The explicit uniform cutoff

```math
p\ge2^{(2B+1)(B+1)}+1\quad\Longrightarrow\quad c_p>B
```

holds for every natural $`B`$. Since it applies to every later matching
count, it proves the same cutoff for the attained tail minimum and yields
the full limit theorem.

## Verification and review

All 22 frozen modules passed fresh strict Lean 4.35.0 builds. The complete all-owned/private audit checked 505 declarations, including 435 theorems and 32 private declarations, and all 42 required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` were permitted. Stock `leanchecker -v` replayed exactly the 22-module closure successfully. No `sorry`, `admit`, unproved project axiom or native-computation axiom is used. The [receipt](../../docs/verification/lean-hartke-matching-excess-complete-20261124-162051/receipt.json) binds the sources, tools, controls, declaration inventory and exact replay set.

The [frozen manifest](../../docs/verification/lean-hartke-matching-excess-complete-20261124-162051/frozen-sources.json)
binds all 22 sources and 42 required endpoints. The
[independent mathematical review](LEAN_REVIEW.md) covers the full graph,
arithmetic and extremal chain; the [independent statement review](STATEMENT_REVIEW.md)
checks the original conjecture, actual matching predicate, maximum,
eventual formula and tail quantifiers. These are independent automated
reviews, not claims of external peer review. The [final independent evidence validation](../../docs/verification/lean-hartke-matching-excess-complete-20261124-162051/FINAL_INDEPENDENT_VALIDATION.json) rehashes the sources, objects, tools and logs, independently reparses the audit and replay set, and binds both separate reviews to the frozen proof receipt.

The portable scoped check is:

```sh
cd lean
lake env python3 ../scripts/verify_hartke_matching_excess.py
```

It strictly rebuilds the exact local closure, checks every owned declaration
including private declarations for transitive axioms, verifies all required
endpoints, and replays exactly that closure with the pinned stock checker.
The dedicated workflow preserves its logs and receipt. The original
[verify.py](verify.py) remains a supplementary finite diagnostic and is not
used to prove the general result.

The scoped proof gate, aggregate repository gate, hosted workflows and
public deployment are separate statuses. The aggregate dependency-artifact
blocker and hosting follow-up are tracked in
[#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
The preserved startup failures occurred before any Lean source build;
the successful proof gate uses an isolated writable evidence directory and
read-only shared packages. Exact-tree site checks are recorded with the publication package. The [aggregate blocker reuse record](../../docs/verification/lean-hartke-matching-excess-complete-20261124-162051/aggregate-blocker-reuse.json) preserves the prior protected failure in the unchanged dependency-artifact phase; it does not claim a fresh aggregate run or pass for this candidate.
