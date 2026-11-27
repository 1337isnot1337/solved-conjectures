# Erdős–Hajnal–Tuza’s local transversal problem

[Erdős #616](https://www.erdosproblems.com/616) ·
[Research issue #1019](https://github.com/1337isnot1337/solved-conjectures/issues/1019) ·
[Original paper](https://doi.org/10.1016/0097-3165%2891%2990074-Q)

**Unrestricted status: open.** The target is the optimal all-r
transversal bound under the span window 3r−3. We do not count
individual values already pinned by the 1991 bounds or treat a
conditional construction obstruction as an answer.

| Note | What it rules out |
|---|---|
| [Near-threshold petals](NEAR-THRESHOLD-PETALS.md) | A minimum pair without the required large, almost-disjoint exterior witnesses. |
| [Two-wing balance](TWO-WING-BALANCE.md) | Concentrating essentially all overlap of two disjoint-cut witnesses in only one wing, when r−5t is sublinear. |
| [Linear trace cliques](LINEAR-TRACE-CLIQUES.md) | Many minimum-neighbour traces with pair overlap s and no triple overlap when the petal inequality is saturated. |
| [Shared-petal abundance](SHARED-PETAL-ABUNDANCE.md) | A small shared support: at the first moving jump, one nearby minimum pair has linearly many disjoint exterior petals with shared points. |
| [Witness expansion](WITNESS-EXPANSION-DICHOTOMY.md) | A subquadratic minimum-pair component whose witness wings stay dispersed: a growing cluster must share almost all of both wings. |
| [Witness expansion with slack](WITNESS-EXPANSION-WITH-SLACK.md) | Extends the sparse-neighborhood versus wing-clustering dichotomy to all offsets 1 ≤ z ≤ t/4. |
| [Shared support versus order](SHARED-SUPPORT-VERSUS-ORDER.md) | Under wing separation, a subcubic example must share at least about 3t vertices outside any such minimum pair. |
| [Superlinear opposite-pivot expansion](SUPERLINEAR-OPPOSITE-PIVOT-EXPANSION.md) | For fixed offset, fewer than order t^(3/2) near-minimum neighbors on both sides, with no wing-separation assumption. |
| [Two-sided witness reuse](TWO-SIDED-REUSE.md) | Opposite-side high reuse without a common residual vertex; projective-plane incidence data show why counting absences alone is weaker. |
| [Quadratic shared-support dichotomy](QUADRATIC-SHARED-SUPPORT-DICHOTOMY.md) | A fixed-offset example of order o(t^(5/2)) with subquadratic shared support outside some minimum pair. |
| [Exponential neighbor tradeoff](EXPONENTIAL-NEIGHBOR-TRADEOFF.md) | A small common neighborhood at a controlled additive gap above the exact minimum intersection. |
| [Trace triangles with slack](TRACE-TRIANGLES-WITH-SLACK.md) | Three low-overlap traces with empty triple intersection, without assuming minimum neighbors. |
| [Minimum-triangle core bound](MINIMUM-TRIANGLE-CORE-BOUND.md) | Three pairwise near-minimum edges with a near-total common core; also gives a linear exterior-overlap lower bound for repeated minimum traces. |
| [Distinct-trace exterior bound](DISTINCT-TRACE-EXTERIOR-OVERLAP.md) | Exterior overlap above t at saturation, for pairs whose trace difference admits a separating cut. |
| [Binary-product links](BINARY-PRODUCT-MINIMUM-LINKS.md) and [Exterior-core packing](NEAR-COMMON-EXTERIOR-CORE.md) | Sparse binary-coordinate links, and polynomial-order realizations of their exponential trace family with an almost-common exterior t-set. |
| [Small-order minimum degree](SMALL-ORDER-MINIMUM-DEGREE.md) and [Saturated incidence degree](SATURATED-ORDER-INCIDENCE-DEGREE.md) | Low-degree vertices at or near the order bound; larger saturated cuts also have stable, representative-independent exterior pools. |
| [Sharper slack petal order](SHARPER-SLACK-PETAL-ORDER.md) and [Positive-slack equality](POSITIVE-SLACK-ORDER-EQUALITY.md) | Improves the nonzero-slack order bound and describes the exact abstract equality pattern for singleton cuts. |
| [Affine sharpness criterion](AFFINE-ORDER-SHARPNESS-CRITERION.md) | Classifies exactly when the abstract single-pair order bound can be asymptotically attained: iff the slack is divisible by s². This is not a construction for the original problem. |
| [Minimum-rank rigidity](MINIMUM-RANK-RIGIDITY.md) | Replacing the standard core by a different 3-wise intersecting core of rank at most 2t+1. Below the classical threshold even the whole light-edge subfamily must be t-transversal. |
| [Larger cores and four-fold padding](LARGER-CORE-PADDING.md) | Extending minimum-rank rigidity by even one; below the classical threshold, selected triples must share many padding vertices. |
| [Near-minimum dense-core barrier](NEAR-MINIMUM-DENSE-CORE.md) | For a wider fixed-core class, beating the classical construction near its start even with unrestricted shared padding and no core three-wise assumption. |
| [Shared-padding dense-core barrier](../erdos-hajnal-tuza-local-transversal/DENSE-CORE-SHARED-PADDING-BARRIER.md) | Beating the classical threshold near its start by arbitrary shared padding around a fixed dense core. |

The main unresolved step is to derive a fixed dense core (possibly
above the rigid minimum rank) from the unconditional minimum-pair
structure, or to build a candidate that provably escapes such
cores. No such reduction or construction is established.
