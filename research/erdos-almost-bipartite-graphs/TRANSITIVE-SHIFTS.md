# Vertex- and edge-transitive witnesses for Erdős's conjecture

A strengthening of the written proof in
[Erdős's arbitrary-cardinal bipartization conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/1015).
For every \(\epsilon>0\) and every infinite cardinal \(\kappa\),
the witness with \(\chi>\kappa\) and strict edge-deletion budget
\(n^{1+\epsilon}\) at every finite order \(n\ge1\) can be taken
vertex-transitive and edge-transitive. Its adjacency is definable
on finite tuples in a pure set, using only equality and inequality.
This is not a separate conjecture or an independent review of the
pinned proof.

## Overlap digraphs without an order

For a set \(I\) and \(k\ge1\), let \(U_k(I)\) have the injective
ordered \(k\)-tuples from \(I\) as its vertices. Give it the arc
\[
(x_0,\ldots,x_{k-1})\longrightarrow(x_1,\ldots,x_k)
\]
precisely when the \(k+1\) displayed alphabet elements are distinct.
Use \(\underline U_k(I)\) for its simple underlying graph.
For \(k=1\), \(U_1(I)\) is the complete graph with both orientations
of each edge. For \(k\ge2\) a vertex of \(U_k\) is exactly an arc of
\(U_{k-1}\); present arcs of \(U_k\) correspond to consecutive
arcs of \(U_{k-1}\). Some consecutive arcs are omitted: if the
appended symbol equals the dropped symbol they are not adjacent
in \(U_k\). The finite argument uses only the inclusion in the
directed line graph.

Every permutation of \(I\) acts on all tuples simultaneously.
These permutations are transitive on vertices and on directed
arcs: map the ordered list of the \(k\) or \(k+1\) distinct
symbols to the other such list, and extend to a permutation.
In particular the underlying graph is vertex- and edge-transitive.
This distinct-window variant is closely related to the symmetric
shift of [Halevi–Kaplan–Shelah, Example 2.5](https://doi.org/10.1090/tran/8570),
whose definition does not forbid a symbol returning immediately
after it drops out.

## A hereditary two-color bound

We claim that every finite induced subgraph of \(\underline U_k(I)\)
on \(n\) vertices has a two-coloring in which the monochromatic
edges can be oriented with maximum outdegree at most
\(4^{k-1}n^{1/k}\). Empty vertex sets are immediate.
For \(k=1\) the bound is \(n\). For \(k\ge2\), take the \(n\)
arcs of \(U_{k-1}\) corresponding to the selected vertices.
The in- and outdegrees below refer only to these \(n\) arcs.
Set \(T=n^{1/k}\); a center is heavy when both degrees exceed \(T\).
There are at most \(n/T\) heavy centers.

Use the induction hypothesis on the underlying graph induced
by the heavy centers. At a center colored \(b\), desire color
\(b\) on incoming arcs and \(1-b\) on outgoing arcs.
These requirements can be satisfied simultaneously unless
a selected arc has equally colored heavy ends. In that case
satisfy the end to which the auxiliary orientation of the
underlying monochromatic edge points. Each auxiliary outgoing
edge represents at most two selected directed arcs, so at a
heavy center at most
\[
2\cdot 4^{k-2}(n/T)^{1/(k-1)}=2\cdot 4^{k-2}T
\]
incidences fail. This factor of two includes the bidirected
starting graph \(U_1\).

Every monochromatic edge of the current graph joins an
incoming/outgoing arc pair at a center. If two centers can
represent it, fix either one and count the edge only there.
At a light center orient these edges toward the side with
at most \(T\) arcs. At a heavy center, two satisfied opposite
incidences have different colors, so each monochromatic
edge can be oriented toward a failed incident arc.
Each selected arc is involved at its two end centers only.
Its resulting outdegree is at most \(4^{k-1}T\), proving
the claim. Deleting monochromatic edges costs at most
\(4^{k-1}n^{1+1/k}\). Restriction gives the same bound for
arbitrary subgraphs on the chosen vertices.

## Large odd girth without an alphabet order

There is no odd closed walk of length \(\ell<K\) in
\(\underline U_K(I)\) for \(K\ge2\). Mark each walk step as
forward if it drops the first coordinate, backward if it
drops the last. Track the \(K\) initial coordinate tokens.
Any one step deletes at most one initial token, so after
fewer than \(K\) steps some token has survived at every step.
Its coordinate index decreases by one on a forward step
and increases by one on a backward step. The final tuple
equals the initial tuple and its symbols are distinct, so
this surviving token has returned to the same index.
The walk therefore has the same number of forward and
backward steps, contrary to odd length.

For \(K\ge k\), map a \(K\)-tuple to the list of its \(k\)
successive length-\((K-k+1)\) windows. These windows are
distinct and recover the tuple. Two adjacent \(K\)-tuples
come from \(K+1\) distinct elements, so their \(k+1\)
successive windows are also distinct. The resulting map is
an injective homomorphism into \(\underline U_k(J)\), where
\(J\) is the set of length-\((K-k+1)\) injective tuples of \(I\).
The coefficient \(4^{k-1}\) therefore works independently
of how large \(K\) is.

Choose \(k\) with \(1/k<\epsilon\), then \(N\ge2\) so that
\(4^{k-1}n^{1+1/k}<n^{1+\epsilon}\) for \(n\ge N\), then
\(K\ge\max(k,N)\). All finite subgraphs below order \(N\)
are already bipartite. For larger orders use the window
bound. This gives the strict budget at every order.

Finally well-order \(I\) for this argument only, not for
the edge definition. The increasing \(K\)-tuples contain
the ordinary \(K\)-shift as a subgraph. As in the pinned
proof, taking \(|I|\) above the \((K-1)\)-fold cardinal
power set of \(\kappa\) guarantees this subgraph has
chromatic number above \(\kappa\). The same holds for
the symmetric witness. The well-order introduces no
asymmetry in its definition.
