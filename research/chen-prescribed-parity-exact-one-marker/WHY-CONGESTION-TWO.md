# Why two uses per vertex are necessary

This is a self-contained sharpness example for the congestion in
[Chen's prescribed-parity exact-one-marker problem](COMPLETE-PROOF-DRAFT.md).
It is not a novelty claim: [Marx–Wollan](https://arxiv.org/abs/1411.0871)
already showed that unrestricted matching demands do not admit the
corresponding integral Erdős–Pósa principle. The construction below
also has one common prescribed parity for all demands.

Fix an integer \(n\ge 2\) and take a square grid on \(n\) rows and
\(n+2\) columns. Pair the left endpoint of row \(i\) with the right
endpoint of row \(n+1-i\), for \(i=1,\ldots,n\). These pairs are a
matching, their endpoints are nonadjacent, and any two pairs
alternate on the perimeter. Consequently two simple paths for
different pairs cannot be vertex-disjoint. The planar separation
fact used here is that two disjoint arcs in a disk cannot join
alternating boundary points. For grid paths that run along the
perimeter, first extend their four endpoints outwards to four
positions on a slightly larger enclosing perimeter; the original
paths now lie in the interior of the larger disk. Two paths for
the same pair also meet, at both terminals.

The path transversal number is at least \(\lceil n/2\rceil\). If \(S\) has fewer than
\(n/2\) grid vertices, then there exists \(i\) such that neither
row \(i\) nor row \(n+1-i\) meets \(S\): a contaminated row
rules out at most two choices of \(i\). Some interior column
is also untouched by \(S\), because there are \(n\) interior
columns. Starting at the left terminal of row \(i\), use that
row to reach the untouched column, use the column to reach
row \(n+1-i\), and follow the second row to the right terminal.
This is simple (if the two rows agree, use the whole row)
and avoids \(S\).

Now subdivide every supply edge once and require all demand
paths to be even. Each simple original demand path lifts to
an even supply path, and every simple new demand path
contracts to an original one. A cover of the new paths maps
to a cover no larger in the original graph: send each
subdivision vertex to either original end of its edge. A
lift that touches the subdivision vertex traverses the
whole subdivided edge. A disjoint routing after subdivision
would project to disjoint paths before it. Thus even the
common-parity class has arbitrarily large transversal number
with integral packing number one.

Finally add one marker edge between the terminals of each
demand. Cycles using exactly one marker correspond to the
same even supply paths, and have the same vertex sets.
Nothing in the planar argument requires the augmented graph
with its marker edges to be planar.
