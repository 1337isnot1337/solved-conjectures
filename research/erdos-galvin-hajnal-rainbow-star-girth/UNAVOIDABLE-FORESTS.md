# Exactly which countable forests are unavoidable

A graph is a **witness** here if it is countable and has the
Erdős–Galvin–Hajnal property (P^*(G,aleph_0,aleph_0))
of the [main proof](PROOF.md). An unavoidable graph is
one contained as an ordinary subgraph in every witness.

**Theorem.** A countable forest is unavoidable if and only
if each of its tree components has finite diameter. There
is no uniform bound on the diameters in the statement.

This is an additional consequence of the rooted formulation
and of the finite-depth triangle-free construction used
in the main proof. It is not a separate claimed resolution
of an historical conjecture.

## Necessity

Each of the triangle-free witnesses (G_k) in the main
proof has a finite bound on the length of its simple paths.
This holds for the starting infinite star. To see the
inductive step, a simple path in (G_{k+1}) visits the finite
root set at most once per root. The remaining segments lie
in child copies of (G_k) and each segment has bounded length.
There are at most one more segments than roots visited.
Thus every connected component in the disjoint union
of the (G_k)'s has a finite bound on its path lengths.
This union is a witness. A tree component of infinite
diameter contains arbitrarily long simple paths, so it
cannot occur in any one component of that witness.

## Sufficiency

Fix a witness (G) together with its edge labelling.
Deletion of finitely many vertices preserves the property
with the restricted labelling. To see this, take any finite
colouring of the rest and give each deleted vertex its own
fresh colour. None of the singleton colours could contain
a rainbow star. Thus the centre and all its witnessing
neighbours remain in the undeleted graph.

For any induced subgraph (H) obtained by such a deletion,
define (D_0(H)=V(H)) and recursively
[
D_{j+1}(H)={vin D_j(H): |N_H(v)cap D_j(H)|=aleph_0}.
]
For every finite (d), (D_d(H)) is nonempty. Otherwise
the layers (D_j(H)setminus D_{j+1}(H)) for (j<d)
would give a finite vertex colouring in which every
vertex has finitely many neighbours of its own colour.
No vertex in that colouring could see every label.

Let (T) be a countable forest with finite diameter in each
component. Root every component and let (d) for that
component be any finite upper bound on its root-to-vertex
distances. Its vertices admit an enumeration with each
parent preceding its children and only finitely many
vertices before every enumeration stage. For instance,
first enumerate arbitrarily, then output each entry
together with its finitely many not-yet-output ancestors
in root-to-leaf order. Build the embedding along this
enumeration, keeping all images distinct. When a new root
of a component of depth bound (d) is encountered, delete
from (G) the finitely many images used so far, call the
remaining induced graph (H), and use a vertex of (D_d(H))
for the root. For this component keep that same (H)
as its reference graph. If a vertex at depth (i<d) of the
component has been embedded in (D_{d-i}(H)), it has
infinitely many neighbours in (D_{d-i-1}(H)). When its
next child is encountered, choose one such neighbour
outside the finitely many images used globally at that time.
The child has the planned depth property. Extra edges
between chosen vertices do not matter because containment
is not required to be induced. These choices embed every
component simultaneously, even if it has infinitely many
vertices or there are infinitely many other components.

The construction also explains why finite vertices can be
reserved across all components without assuming the witness
survives deletion of arbitrary countable sets.
