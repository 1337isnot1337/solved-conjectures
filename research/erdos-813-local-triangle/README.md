# Erdős–Hajnal local triangle conjecture

[Tracking issue #925](https://github.com/1337isnot1337/solved-conjectures/issues/925) · [Erdős #813](https://www.erdosproblems.com/813)

**Open.** In the complementary formulation, an (n)-vertex graph must have an independent triple among any seven vertices. [Bučić–Sudakov](https://doi.org/10.1007/s00493-023-00023-w) proved the first requested power improvement, an independent set of size at least (n^{5/12-o(1)}), and show that the other direction is equivalent at its power scale to constructing (K_4)- and Moser-spindle-free graphs with independence (n^{1/2-\varepsilon}) for some fixed positive epsilon. No result in this directory settles that direction.

## What is proved here

- [Exact threshold and Poisson law](SPINDLE-THRESHOLD.md): the independent fair-cut Hermitian construction has spindle scale (q^{17}p^7s^{11}), with limiting mean (1/16384) times that scale in the critical window. The proof works over arbitrary prime powers.
- [Vertex](SPINDLE-LINEAR-PACKING.md) and [edge](SPINDLE-EDGE-PACKING.md) deletion barriers: at the published [Mattheus–Verstraëte rate](https://doi.org/10.4007/annals.2024.199.2.8), even a sublinear number of vertex or edge deletions cannot remove all spindles with high probability. The edge statement covers every independent-thinning exponent that could beat square-root independence.
- [Arbitrary pencil marginals](INDEPENDENT-PENCIL-BIAS.md), [sparse dependence](SPARSE-PENCIL-DEPENDENCE.md), [finite-order independence](LIMITED-INDEPENDENCE-CUTS.md), and [nine-pencil patterns](NINE-PENCIL-SPINDLES.md): the obstruction survives several explicit correlated models. Pairwise independence alone does not suffice, as shown by a globally bipartite construction with exactly fair pairwise independent pencil labels.
- [Arbitrary cut assignments on a sampled host](DETERMINISTIC-DIAMOND-BARRIER.md): any spindle-free assignment with independence at most the square root of its order must suppress the concurrent-core diamond family by a polynomial factor compared with fair cuts. The result is uniform even if the assignment is made after seeing the retained set.
- [An alternative deterministic host](QUADRANGLE-BLOCK-BARRIER.md): generalized-quadrangle line gadgets localize the forbidden graphs but cannot beat square-root independence when the line gadgets have bounded chromatic number or their average triangle transversal remains bounded.

Earlier notes establish [subfield frames](HERMITIAN-SPINDLE-OBSTRUCTION.md), [prime-field rational frames](PRIME-FIELD-SPINDLE-FRAMES.md), [orbit packing](SPINDLE-ORBIT-PACKING.md), [a uniform geometric bound](SPINDLE-COUNTING-SCALE.md), and [its sharp random count](SPINDLE-SHARP-COUNT.md). The associated Python files independently check incidence arithmetic and the overlap tables; no asymptotic conclusion depends on enumerating specific field orders.

## Remaining direction

A viable use of the Hermitian host must have genuinely global structure: it must preserve low independence while removing most admissible concurrent-core diamonds, or otherwise route around that deterministic test. The sharp random thresholds explain why fair or moderately correlated cuts do not accomplish this. A proof for all deterministic cuts would still be an obstruction to this host, not a resolution of the original problem; a spindle-free construction beating the square-root power would answer the remaining Erdős question.
