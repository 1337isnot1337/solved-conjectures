# Least-centred and middle-centred wedge witnesses

**Theorem.** CH implies that there is a \(T_1,T_9\)-free triple system on \(\omega_1\) whose two-infinite-pair core has chromatic number \(\aleph_1\), with the centre of every core wedge its **least** vertex. Another witness has the centre of every core wedge its **middle** vertex. Both alternatives also exist after adding one Cohen real over any ZFC ground, regardless of CH.

This rules out removing either ordered half of the [wedge core](WEDGE-CORE-ORIENTATION.md) by a general ZFC countable-colouring argument. It is not a decision of 9/B in the rainbow model.

## A padding lemma

Let \(H_0\) be a triple system whose shadow graph \(S\) has precisely the triples of \(H_0\) as its graph triangles. Suppose \(H_0\) omits \(T_1,T_9\) and that no triple has two distinct repeated pairs. Choose a set \(P\) of shadow pairs meeting each original triple in exactly two of its three pairs, such that its third pair is private. For each \(e\in P\) add countably many triples \(e+z\), with all the new \(z\)'s fresh and distinct, each in just that one triple. Call the result \(H\).

If a loose triangle exists in \(H\), its distinct intersection vertices \(a,b,c\) are all old, since new vertices occur only once. They span a triangle in \(S\), so \(abc\in H_0\). The three loose-triangle edges supplying the pairs \(ab,ac,bc\) are different from \(abc\), because \(abc\) would intersect either of the other two supplier edges in two vertices. In particular the private unpadded pair of \(abc\) would need another original occurrence, which is impossible. This proves \(T_1\)-freeness.

For a putative \(T_9\), the repeated pair and both its pages must be old: if a page is new, the third triple containing it must be its only incident triple and would contain the repeated pair, whereas the configuration requires disjointness from that pair. Thus both triples on the repeated pair are original. If the third triple is original this is forbidden by assumption. If it is padded, its two old vertices are just the two pages. Their pair was in \(S\), so those pages and the two base vertices span a \(K_4\) in \(S\). All four triangles of the \(K_4\) would be in \(H_0\), giving an edge with two distinct repeated pairs, also impossible.

The pairs of infinite codegree in \(H\) are exactly \(P\): every other old pair is private, and pairs at new points occur at most once. Thus the two-heavy core is exactly \(H_0\).

## Applying it to the selected-path witness

Take \(H_0\) from the [direct CH or one-Cohen proof of 9/C](https://github.com/1337isnot1337/solved-conjectures/pull/1082). Its shadow is triangle-complete: if the shadow contains a triangle on increasing vertices \(a,b,c\), each of its three pairs comes from a directed segment of length at most two. The segments \(a\to b\) and \(b\to c\) concatenate into a path from \(a\) to \(c\); in the tree version \(a,b,c\) are comparable because each pair is. By directed-path uniqueness the concatenation is the segment for \(a,c\), so it has length two with middle vertex \(b\), and its selected triple is \(abc\). Also every repeated pair is the bottom pair in each of its occurrences.

For the least-centre version take \(P\) to be the union of pairs \(ab,ac\) over all increasing triples \(abc\). Their other pair \(bc\) is private, so cannot be selected as another triple's padded pair. For the middle-centre version instead take the union of \(ab,bc\); the unchosen diagonal \(ac\) is private. The lemma applies in both cases. The centre of the two padded pairs is respectively \(a\) or \(b\).

On an ordinal host the old order may be kept. In the CH tree version first well-order the old vertices in type \(\omega_1\) respecting strict initial segments. Recursively take the next as-yet-unlisted vertex in an enumeration of all vertices and append any missing ancestors in their tree order before it; at most countably many points are appended per step. For each old vertex, put all padding vertices whose base has it as its larger point into the block just after that old vertex. There are only countably many such padding vertices at each step. The resulting order is still of type \(\omega_1\), and the old wedge centres retain their relative positions. The core has unchanged chromatic number \(\aleph_1\).
