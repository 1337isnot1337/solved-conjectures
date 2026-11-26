# Rainbow triangles using a fixed pair of colors

**Theorem.** In every completely balanced six-coloring of \(K_{6t+1}\), every two distinct colors occur together in a rainbow triangle (for all admissible \(t>0\)). More precisely, for every even \(t\ge500\), the minimum, over all such colorings, of the number of vertices needed to meet all rainbow triangles using two specified colors is
\[
k_*=\min\{k:\binom{k}{2}\ge2t-1\}.
\]
Thus the minimum guaranteed maximum packing of vertex-disjoint triangles using the two colors is \(\Theta(\sqrt t)\). The theorem does not guarantee complementary triangle palettes or settle the rainbow six-cycle conjecture.

## Three blocks from a Gallai coloring

Call the two specified colors \(A,B\), and merge the other four into \(K\). A triangle uses \(A,B\) in the original rainbow coloring precisely when it is tricolored after the merge. Let \(D\) be a set of \(k\) deleted vertices, \(0\le k\le t/10\), and put \(N=6t+1-k\). Suppose the remaining coloring has no tricolored triangle. Use [Gallai's partition theorem](https://users.renyi.hu/~pach/publications/gallaicoloring031113.pdf), which provides a nontrivial partition with every pair of parts monochromatic and at most two colors on all interpart edges.

At the top level \(K\) must be an interpart color: otherwise its residual minimum degree \(4t-k\) would force every part to have at least \(4t-k+1\) vertices, too many for two parts. Therefore one of \(A,B\) is absent between parts, say \(A\). Every part has at least \(t-k+1\) vertices from the residual minimum \(A\)-degree. An interpart \(B\) edge entails that both endpoint parts have at most \(t\) vertices, because \(B\)-degrees are at most \(t\). Moreover each part can have at most one \(B\)-neighbor part, since \(2(t-k+1)>t\). Thus the interpart \(B\) pairs form a matching. Merge the two parts of each matched pair. This yields a partition with only \(K\) between the new blocks and at least two blocks, since a single merged block could have at most \(2t\) vertices.

In any partition with only \(K\) between blocks, all residual \(A,B\) neighbors of a vertex are in its own block. The combined residual degree is at least \(2t-k\), since a vertex lost at most \(k\) edges altogether. Every block has size at least \(2t+1-k\). There can be at most three blocks, as \(4(2t+1-k)>N\).

If there are exactly two, let \(M\) be the larger, with \(s=|M|\ge N/2>8t/3\). Inside \(M\), the \(K\)-degree is at least \(s-1-2t\); the bounds \(t-k\le d_A,d_B\le t\) still hold. Apply Gallai's theorem inside \(M\). If \(K\) is not an interpart color, each part has size at least \(s-2t\) by its \(K\)-degree, and at most \(t\) because some other part meets it in one of \(A,B\). Since \(s>2t\) and \(4(s-2t)>s\), there would be exactly three parts. In the reduced triangle with colors \(A,B\), two edges of the same color meet at a part, giving that color degree at least \(2(s-2t)>t\) there. This is impossible. Hence \(K\) is interpart, and the same matching merger as before splits \(M\) into at least two \(A,B\)-internal blocks. Altogether there are now exactly three blocks, still with only \(K\) between them.

## Sharp lower bound on the deletion size

Write \(s_i\) for the three block orders and \(b_i=2t+1-s_i\), so \(\sum_i b_i=k+2\) and each \(b_i\le k\). The cases \(k=0,1\) are immediately impossible: the positive deficits must sum to at least \(k+2\); for \(k=0\) this cannot hold, and for \(k=1\) all three deficits would be one, requiring \(6t\) incidences into the one deleted vertex, which has combined \(A,B\)-degree \(2t\).

For \(k\ge2\), a positive deficit \(b_i\) requires at least \(b_is_i=b_i(2t+1-b_i)\) combined \(A,B\) incidences into \(D\) from block \(i\). Their sum is at most \(2tk\), the total combined degrees of the deleted vertices. The function \(f(b)=b(2t+1-b)\) is increasing on \(0\le b\le k\). The positive deficits sum to at least \(k+2\), so their total \(f\)-cost is minimized by reducing their sum to \(k+2\) and concentrating into \((k,2,0)\). To see the latter, move a unit from a smaller positive coordinate to a larger coordinate below \(k\); this never increases the concave sum. We obtain
\[
2tk\ge k(2t+1-k)+2(2t-1),
\qquad \text{or equivalently}\qquad \binom{k}{2}\ge2t-1.
\]
For even \(t\ge500\), every \(k<k_*\) satisfies \(k\le t/10\), by \(k_*\le2\sqrt t+2\). Thus no smaller deletion set suffices. For \(k=0\), the three-block contradiction applies at every positive admissible \(t\) (all displayed block inequalities still hold).

## A sharp construction

Set \(k=k_*\). Use disjoint \(D,S_1,S_2,S_3\) of sizes \(k,2t+1-k,2t-1,2t+1\). Start a graph \(H\) with complete graphs in each \(S_i\) and every edge between \(D\) and \(S_1\). Choose any simple graph \(J\) on \(D\) with \(2t-1\) edges. Put \(H[D]=K_k-J\); biject the vertices of \(S_2\) with the edges of \(J\), and connect each such vertex in \(H\) to the two endpoints of its corresponding edge. Add no other edges.

Every vertex of \(H\) has degree \(2t\): this is immediate on the three \(S_i\), and at a vertex \(v\in D\) the two contributions \(d_J(v)\) and \(k-1-d_J(v)\) sum to \(k-1\), in addition to \(2t+1-k\) neighbors in \(S_1\). The complement is \(4t\)-regular. Any even-regular graph splits into spanning 2-factors: orient Euler circuits, take a perfect matching in the regular bipartite graph of out-copies and in-copies, and repeat after removing its arcs. Since \(t\) is even, group the 2-factors of \(H\) into the colors \(A,B\) and those of its complement into the other four colors, with degree \(t\) each. After deleting \(D\) the \(A,B\) edges occupy exactly the cliques \(S_1,S_2,S_3\). A triangle with two incident \(A,B\) edges then has all three vertices in the same clique and cannot have a \(K\) edge. This is the required example.

Finally, a maximum vertex-disjoint packing covers all relevant triangles after deleting its vertices. Consequently its size is at least \(k_*/3\) in every coloring, and the construction bounds it by \(k_*\). This proves the order claim.

## Scope and sources

The [Erdős–Tuza color-degree paper](https://doi.org/10.1016/S0167-5060(08)70377-7), [Axenovich–Clemen](https://arxiv.org/abs/2209.13867), [the public #811 working report](https://www.erdosproblemaday.com/report/811), and [Falgas-Ravry–Markström–Räty on minimum-degree conditions](https://arxiv.org/abs/2305.12772) concern related triangle existence or rainbow subgraph questions. Searches with prescribed color pairs, balanced regular color degrees, Gallai partitions, and triangle vertex transversals did not locate the sharp deletion theorem. The structural partition and even factorization are classical inputs; the result here is the exact threshold for balanced six-colorings. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
