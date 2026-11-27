# Erdős–Hajnal local triangle conjecture

**Robustness under sparse dependencies between pencils.** It is not necessary for the pencil partitions to be fully independent. Give them any dependency graph with o(q⁶) edges on the Θ(q³) unital points. By a dependency graph we mean that two collections of pencil variables are independent whenever their index sets are disjoint and have no edge between them. Within a pencil the distribution may be arbitrary, subject only to a positive uniform lower bound δ on the separation probability of each pair of lines.

With independent vertex and edge retention probabilities p and s as before, the spindle threshold remains T=q¹⁷p⁷s¹¹, and q²ps²→∞ still forces deletion of a positive fraction of the retained edges. In the critical window the count has a Poisson approximation with its actual mean, and the original constant λ/16384 is recovered when all pair separation probabilities approach one half uniformly and T→λ. In particular one may correlate cuts arbitrarily within blocks of pencils whose maximum block size is o(q³), with different blocks independent. A small number of high-degree dependency vertices is also allowed.

## Remove configurations with internal dependencies

The [generic chordless patterns](SPINDLE-THRESHOLD.md) number (1+O(1/q))q¹⁷/8 as unordered spindle copies and use eleven distinct pencils. The projective unitary group is transitive on ordered pairs of distinct unital points. Indeed their isotropic projective lines span a hyperbolic plane: independent isotropic vectors cannot be orthogonal in a nondegenerate three-dimensional Hermitian space. Normalize their cross inner product to one, send this hyperbolic basis to that of another pair, and extend by an isometry of the orthogonal one-dimensional spaces using surjectivity of the norm. This gives a unitary map taking the ordered pair to the prescribed ordered pair. The same argument yields transitivity on points.

Work with ordered pattern labels while counting. For each ordered pair among the eleven pencil roles, equivariance implies a uniform multiplicity over all ordered distinct unital point pairs. Hence if the dependency graph has e edges, at most O(e/q⁶) of the ordered patterns use an internal dependency. Removing them costs O(e q¹¹)=o(q¹⁷) patterns. Individual surviving patterns now have independent pencil variables, so the eleven split constraints succeed with probability at least δ¹¹. The favorable mean is Θ_δ(T).

## New correlations between distinct copies

For pairs of patterns with a common vertex, keep the earlier overlap bounds, ignoring every split condition. For disjoint vertex sets, there can be dependence only if the patterns share a pencil or some two pencil roles are joined by a dependency edge. A fixed pencil appears in O(q¹⁴) possible patterns by transitivity and incidence counting. Summing over pencils and dependency edges gives at most
```math
O\bigl((q^3+e)q^{28}\bigr)
```
ordered pairs with this extra potential dependence. Their joint retention probability is p¹⁴s²² since no vertex or required edge is shared, and their relative second-moment contribution is O_δ(q⁻³+e/q⁶)=o(1).

The [independent-pencil proof](INDEPENDENT-PENCIL-BIAS.md) now goes through with this additional term. When T→∞, the geometric overlap terms tend to zero and Chebyshev yields presence. When T→0, the first moment for all feasible copies yields absence. When T is bounded, the same extra count contributes o(1) to both dependency-graph Poisson sums. Omitted internally dependent patterns have expected survival O(T e/q⁶)=o(1) in this window, even after discarding split constraints, and other omitted patterns cost O(T/q). This gives the stated approximation and, under asymptotically fair marginals, the constant λ/16384.

For edge packing, only the lower bound on Z needs the split probabilities; the [mean-square upper bound](SPINDLE-EDGE-PACKING.md) is retention-only. Thus it still gives Ω_δ(q⁷p²s) edge-disjoint spindles with high probability when q²ps²→∞. This is the order of the total retained edge count.

This rules out sparse dependency graphs as a way to fix the standard construction under uniform pair separation. It does not rule out global dependencies or deterministic constraints, and it does not settle Erdős #813.
