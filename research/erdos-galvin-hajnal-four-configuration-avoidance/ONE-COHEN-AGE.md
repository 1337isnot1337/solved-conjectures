# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

## Exact ordered finite age of a one-Cohen witness

For an ordered finite triple system \(F\), let \(B_F\) consist of the bottom pairs \(ab\) of its triples \(a<b<c\), and let \(U_F\) consist of their top pairs \(bc\). Orient both sets increasingly; call the resulting digraph \(D_F\).

A choice of the ground data in the [one-Cohen theorem](ONE-COHEN.md) makes the ordered **induced** finite age of its generic hypergraph exactly the \(F\)'s satisfying both:

1. \(B_F\cap U_F=\varnothing\), and every top pair is the top pair of at most one triple.
2. Whenever \(u<w\) are two predecessors of the same vertex of \(D_F\), every ancestor of \(w\) in \(D_F\) is strictly above \(u\). An ancestor can be \(w\) itself or a vertex joined to \(w\) by a nonempty directed increasing path.

For example, this provides a finite decision rule for occurrence in this specific witness. For unordered patterns, test all orders. This is not a classification of the obligatory patterns of *all* systems on \(\omega_1\).

### Necessity

Condition 1 is immediate from the base and top modes and the unique selector of a top edge. For condition 2, \(w\) was selected as a lower neighbour after \(u\), so \(h(w)>u\). Every directed path read downwards from \(w\) stays above \(h(w)\). Restricting to \(D_F\) can only remove ancestors, proving necessity.

### Ground data for sufficiency

Refine the stationary fibre for each \(\xi\) into stationary sets indexed by two integers \(M,U\). On the set indexed by \((M,U)\) arrange
\[
\ell_\beta(j)=\xi+j\quad(j<M),
\qquad e_\beta(j)=j\quad(j<U),
\]
where \(h(\beta)=\xi\). Remove the bounded part through \(\xi+\omega\) before this arrangement. Complete the first sequence to a cofinal ladder and the second to a bijection. These changes preserve stationary fibres and all the previous one-Cohen arguments.

Fix a ground condition \(p\) and one finite \(F\) satisfying the two tests. Choose \(m\ge1\) above every stage index mentioned by \(p\), \(M>m+|V(F)|\), and \(U\ge1\) above all candidate indices mentioned by \(p\). We will use the \((M,U)\) refinements for every chosen vertex.

Index \(V(F)\) increasingly by \(0,\ldots,n-1\). For each \(i\) let \(c_i\) be the largest vertex index \(u\) such that some vertex \(w\) reachable from \(i\) (including \(w=i\)) and \(u<w\) are predecessors of a common vertex in \(D_F\). Put \(c_i=-1\) if this set is empty. By condition 2, \(c_i<i\). For each edge \(i\to j\) we have \(c_i\ge c_j\), because each vertex reachable from \(j\) is reachable from \(i\).

Choose actual ordinals \(x_0<\cdots<x_{n-1}\) and thresholds \(q_i=h(x_i)\) as follows. For all indices with \(c_i=-1\), reserve distinct positive finite thresholds in decreasing order of \(i\). Whenever \(x_k\) has been picked, reserve for the later indices with \(c_i=k\) distinct thresholds in the gap \((x_k,x_k+\omega)\), decreasing in \(i\). When picking \(x_i\), its threshold \(q_i\) has already been reserved; take \(x_i\) sufficiently high from its stationary \((M,U)\) refinement, in particular above \(x_{i-1}+\omega\) if \(i>0\). For \(i=0\) take \(x_0>\omega\). Each edge \(i\to j\) now satisfies \(q_i>q_j\): the corresponding gaps are ordered this way if \(c_i>c_j\), and our decreasing assignment gives the inequality within one gap. If \(u<w\) are predecessors of a common vertex, we have \(q_w>x_u\) by construction. Finally for every intended edge \(i\to j\) and every \(k<M\), we have \(\ell_{x_j}(k)=q_j+k<x_i\). Indeed \(q_j<q_i<x_i\), and all reservations lie in gaps ending below the next chosen mark by at least the initial spacing rule.

### Set the finite reads

At stages below \(m\), decide all reads on the chosen marks, extending \(p\) and using neutral records for any table reads not already fixed. Every pre-existing record selects a candidate index \(u<U\), so at the chosen vertices it reads the finite ordinal \(u\), never an eligible nonzero limit. Thus no earlier candidates at the marked vertices are accepted, even if \(p\) had already specified all entries of a read length.

At stages starting at \(m\), prescribe the desired predecessors of each mark in increasing order at that mark, one per slot. Choose prefix lengths at those new slots that separate all marked vertex codes. This makes the desired table entries independent across vertices even when two vertices are read at the same stage. Give each edge its mode as specified by \(B_F,U_F\); for a top edge set its selector to the base edge of its unique specified triple. Condition 1 ensures these instructions are consistent. Use neutral entries wherever a marked vertex is not supposed to choose a predecessor. The inequalities above ensure that every prescribed edge is accepted at its slot: it is above the ladder value, its threshold exceeds that of the head, and its threshold exceeds all earlier accepted predecessors of that head.

For every marked vertex the ladder eventually exceeds all smaller marks. Choose one finite final slot at or beyond all those cutoffs and fill all remaining reads up to that slot neutrally. After that slot no other edge between the selected marks can be added regardless of later generic values. The resulting finite strengthening forces that on the chosen marks the directed graph has exactly the specified edges and tags, with exactly the specified selected triples. A triple on the marks cannot depend on any other graph edge, since both edges of its selected two-path are between its own vertices. This forces an ordered induced copy of \(F\). Since \(p\) was arbitrary, every such \(F\) occurs in the generic hypergraph.

The proof fixes only the finite age. Selecting all ground types does not assert that the exact same classes of uncountable subhypergraphs or global colourings occur in different generic extensions.
