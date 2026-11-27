# A four-vertex path with two isolates does not force path-perfectness

The two-block case of the
[transversal counterexamples](https://github.com/1337isnot1337/solved-conjectures/pull/1009)
is free of an induced four-vertex path plus two isolated vertices.
It therefore excludes this forbidden graph from the classification
and, with the co-gem result, gives an exact threshold along
the family of a four-vertex path plus isolated vertices.

Use the previously proved construction with clique B partitioned
into blocks B1 and B2, clique A = {a1,a2}, and independent set X.
The vertex a_i misses exactly B_i in B. Each x in X sees all of A,
and its nonneighbors in B are exactly one vertex from each block,
with a unique x for each choice of this pair. For block sizes
p,q >= 2 with pq > p+q+3, the earlier proof gives a
(p+q+1)-vertex-critical graph with path chromatic span p+q.

Let Q be any induced four-vertex path. If Q meets A, no vertex
of A or X outside Q can be isolated from it. At most one vertex
of the clique B can be in an independent antineighborhood.
If Q avoids A, it lies in the split graph on B and X. It must
use exactly two vertices of B, at its middle positions: three
would give a triangle, one could supply only two of the three
path edges, and the two must be consecutive because they are
adjacent. No vertex of B is anticomplete to Q, and no vertex
of A is anticomplete to an endpoint in X. At most one vertex
of X misses both middle vertices: none if they belong to
the same block, and exactly one if their blocks are different.
Thus Q never has two independent anticomplete vertices.

This observation applies to all eligible p and q and needs no
new construction. In particular p=3 and any q>=4 suffice.
It is a classification corollary, not a separate catalogue result
or a solution to the unrestricted Erdős–Hajnal problem.
