# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

## One Cohen subset and all finite path uniformities

The [one-Cohen proof](ONE-COHEN.md) extends as follows. Let \(\kappa\) be any infinite regular cardinal with \(\kappa^{<\kappa}=\kappa\). In every extension by \(\operatorname{Add}(\kappa,1)\), a single directed graph on \(\kappa^+\) supports, for each finite \(r\ge3\), an \(r\)-uniform hypergraph of order and chromatic number exactly \(\kappa^+\), with these properties:

1. Two different hyperedges meeting in at least two vertices meet in a common initial segment of their increasing enumerations.
2. If those edges have different first vertices after their common initial segment, the two first differing vertices do not occur together in any hyperedge.
3. There is no loose triangle. In particular in uniformity three this gives all four exclusions of Problem 9/C.

### Parameters and stage records

Use the same argument with \(\omega,\omega_1\) replaced by \(\kappa,\kappa^+\), using \(L=S^{\kappa^+}_\kappa\) (ordinals of cofinality \(\kappa\)) and stationary splitting there. For each \(\beta\in L\), fix a ladder cofinal in \(\beta\) of order type \(\kappa\) and a bijection \(e_\beta:\kappa\to\beta\) with \(e_\beta(0)=0\). The threshold function \(h\) again has stationary fibres and \(h(\beta)<\beta\). The codes \(t_\beta\) are distinct elements of \(2^\kappa\). Use slots \(j<\kappa\) with lengths \(N_j<\kappa\) and tables \(R_{j,s}<\kappa\) for every \(s\in2^{<\kappa}\). A record now specifies a candidate index, a label in \(\omega\), and a selector in \(\kappa\). There are \(\kappa\) coordinates and \(\kappa\) possible records.

For clarity the forcing with partial \(\kappa\)-valued assignments of size \(<\kappa\) is equivalent to \(\operatorname{Add}(\kappa,1)\). Under a coordinate enumeration it densely contains the tree \(\kappa^{<\kappa}\) of initial-segment assignments, by regularity. Encode each symbol \(\alpha<\kappa\) by \(0^\alpha1\) and concatenate, obtaining a dense embedding into \(2^{<\kappa}\). Regularity ensures concatenations have length \(<\kappa\); every binary string of length \(<\kappa\) is extended by an encoded string, by appending a final \(1\) after any unfinished run of zeros. This preserves \(\kappa,\kappa^+\) and the relevant cardinalities (\(<\kappa\)-closed, size \(\kappa\)).

Build the directed graph as before, accepting a candidate \(\alpha\in L\cap\beta\) at slot \(j\) only if \(\alpha>\ell_\beta(j)\) and \(h(\alpha)\) is above \(h(\beta)\) and the **supremum** of all previously accepted lower neighbours. This supremum is \(<\beta\) since \(\operatorname{cf}(\beta)=\kappa\) and \(j<\kappa\). The proof of unique directed paths is unchanged.

For \(r\ge3\), an \(r\)-edge is an ascending directed path of length \(r-1\) with consecutive edge labels \(0,1,\ldots,r-2\), where for each label \(i>0\) the edge's selector points to the slot at its lower endpoint from which the preceding edge of label \(i-1\) was selected. The finite path is determined backwards by its last edge. For \(r=3\) the first two labels are the base and top modes of the preceding proof.

### Simultaneous chromaticity

For any proposed \(<\kappa^+\)-colour name, assign each vertex a ground code consisting of an extending deciding condition and its decided colour. There are at most \(\kappa\) codes. The stationary-predecessor argument needs only a \(\kappa\)-valued ground colouring: each fibre is stationary, some cell after division into \(\kappa\) pieces is stationary, and some code occurs for unboundedly many fibres by regularity of \(\kappa^+\).

For a fixed ground code function \(d\), put \(G_0=L\). Recursively, \(G_{i+1}\) consists of the vertices \(\beta\in L\) with \(h\)-cofinally many predecessors \(\alpha\in G_i\) of the same \(d\)-code as \(\beta\). These sets are decreasing. Every finite \(G_i\) is nonempty: refine \(d\) by the finite vector of memberships in \(G_1,\ldots,G_{i-1}\), and apply stationary predecessor guessing to that refinement. Its witnessed cofinal predecessors share the vector. Inductively, the witnessed vertex belongs to each \(G_j\) for \(j\le i\): once the vertex lies in \(G_{j-1}\), its refined-colour predecessors do too (or are in \(L=G_0\)), giving the next membership.

Given \(r\), start with \(a_{r-1}\in G_{r-1}\), and work downwards choosing \(a_j\in G_j\) of the same code, with \(h(a_j)\) above the bound required by the higher marked vertex's ladder at stage \(m+j\), its \(h\), and all candidates read there from the initial common deciding condition \(q\). Choose \(m<\kappa\) above all stage indices mentioned by \(q\). The last bound exists separately at each vertex since \(q\) has size \(<\kappa\) and their cofinality is \(\kappa\). The defining cofinality in each \(G_{j+1}\) satisfies all three bounds.

Fill unused reads below \(m\) at these finitely many vertices with neutral records, choosing lengths where necessary; this is an extension of size \(<\kappa\). At each of the finitely many stages \(m+j\), choose a length that separates the binary codes of all marked vertices. Give \(a_{j+1}\) the record selecting \(a_j\) with label \(j\), and, for \(j>0\), selector \(m+j-1\). Make the other marked vertices neutral at that stage. Hence every designated candidate is accepted and its predecessor pointer is correct. The strengthened condition forces an \(r\)-edge all of the one decided colour. This works for each finite \(r\) with the same generic data.

### Pattern proof

If two selected paths share at least two vertices, the directed subpaths between them coincide by uniqueness. In particular the shared subpath includes an edge, so its immutable label identifies its position in both full paths. The selectors backwards from that shared edge make the paths agree on the entire prefix through its upper endpoint. Nor can paths that diverge later rejoin, by uniqueness of directed paths. This gives property 1. After divergence the two first different vertices have a common immediate predecessor \(b\); they cannot occur together in any selected path, since the latter gives a directed path between them, contradicting uniqueness from \(b\) to the higher one. This gives property 2. A loose triangle would use three directed segments, each connecting the two intersection points in one edge and each internally disjoint from the others. As before the resulting cycle has exactly two turns, giving two different directed paths with the same endpoints. This proves property 3.

This does not assert that adding one Cohen subset preserves every other combinatorial principle of the ground model. Its only cardinal-arithmetic hypothesis is the usual \(\kappa^{<\kappa}=\kappa\) at the forcing cardinal.
