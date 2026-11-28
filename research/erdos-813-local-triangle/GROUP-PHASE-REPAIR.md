# Erdős–Hajnal local triangle conjecture

**Group-valued phase repair on an O'Nan-free unital.** The [quantitative binary theorem](QUANTITATIVE-PHASE-REPAIR.md) in fact has a uniform noncommutative version. Let a unital be a Steiner $2$-$`(q^3+1,q+1,1)`$ design, and assume that no four blocks have six distinct pairwise intersection points. Retain blocks independently with probability $p$ and set $d=pq\ge C\log q$. With high probability, the following holds simultaneously for every subsequent deletion of at most $d/5$ retained blocks through each point, for every group $\Gamma$, and for every assignment of labels $s(P,L)\in\Gamma$ to the surviving incidences. Orient each incidence from its point to its block, using the inverse label on reverse traversal. Let $B$ count the surviving six-cycles whose oriented product is not the identity. Then there are point and block potentials $b(P)$ and $a(L)$ such that at most $O(B/(q^2d^2))$ labels differ from $b(P)a(L)$. The implied constant is absolute, including independence of $\Gamma$. This is a stability statement for six-cycle tests, not a solution of Erdős #813.

## Host properties use only the unital axioms

A point lies on $q^2$ blocks, since the other $q^3$ points occur in $q$-element classes according to the unique joining block. For two roots, exclude their shared block and put an edge between two blocks in their respective pencils if the blocks meet. Each row has degree $q$; as the row's $q$ non-root points each determine a distinct joining block to the opposite root. A four-cycle in the grid would give four blocks with six distinct intersections, including the two roots. The two pencil classes are disjoint after excluding the shared block. These statements suffice for the grid spectral, Chernoff, and expansion estimates from the [binary proof](QUANTITATIVE-PHASE-REPAIR.md). The triple-neighbor Janson estimate and its [deletion bound](RESILIENT-PHASE-RIGIDITY.md) use only unique joining blocks, each of size $q+1$, and independence of block retention. Thus the same host events, witness counts, and line-graph expansion apply to any O'Nan-free unital.

## Potentials without commutativity

For an ordered point-graph edge put $f(P,Q)=s(P,PQ)s(Q,PQ)^{-1}$. Then $f(Q,P)=f(P,Q)^{-1}$. A point triangle is good if $f(P,Q)f(Q,R)=f(P,R)$; whether it is good is independent of ordering, since a cyclic rotation conjugates the product and reversal inverts it up to conjugacy. Collinear triangles are good by cancellation. Bad noncollinear point triangles are in bijection with the failed six-cycles.

On the witness set $C_0(P,Q)$ use the value $g_{PQ}(R)=f(P,R)f(R,Q)$, and define $F(P,Q)$ by a most frequent value. Choose ties consistently so that $F(Q,P)=F(P,Q)^{-1}$. Even for an infinite group only finitely many values can occur. If adjacent witnesses $R,S$ share a line through $P$, then
```math
g_{PQ}(S)=f(P,R)f(R,S)f(S,Q).
```
Thus the two witness values differ exactly when $R,S,Q$ is a bad triangle. The analogous statement holds if the line goes through $Q$. The same multiplicity bound as in the binary proof gives at most $3qB$ disagreeing witness edges summed over unordered root pairs.

For a given witness graph with $n_0$ vertices, partition its vertices by witness value, and let $n_\star$ be the largest class size. If $n_\star>n_0/2$, the boundary of the complement of that class gives $\Omega(d(n_0-n_\star))$ disagreeing edges. If all classes have size at most $n_0/2$, sum their expansion bounds and divide by two to get $\Omega(d n_0)$ disagreeing edges. In either case the number of non-plurality witness events, summed over the root pairs, is $O(qB/d)$.

At an anchor $U$ use $b_U(P)=F(P,U)$ and $b_U(U)=1$. Test the equation $f(P,Q)=b_U(P)b_U(Q)^{-1}$ on surviving point edges. At any common witness $R$ off the root-pair lines, absence of the two non-plurality events and of the bad triangle $PQR$ implies
```math
 F(P,U)F(Q,U)^{-1}
 =f(P,R) f(R,U) (f(Q,R) f(R,U))^{-1}
 =f(P,R) f(R,Q)=f(P,Q).
```
The witness and multiplicity bounds from the binary proof are unchanged: $\Omega(d^3)$ witnesses per failed test with three distinct roots, $O(q^2d)$ tests per bad triangle, $O(qd^2)$ per non-plurality event. An endpoint anchor failing the test still gives at least $\lvert C_0(P,Q)\rvert/2$ bad triangles, since any value other than the plurality occurs at most half the time. Averaging the same bounds gives an anchor with $O(B/(qd^2))$ failed point edges.

On a surviving block $L$ use $a(L)$ as a most frequent value of $b(P)^{-1}s(P,L)$. Writing $k=q+1$ and $m$ for the number outside this class, the number of failed pairs is $(k^2-\sum_i k_i^2)/2$, where $k_i$ are the class sizes. Since $k_i\le k-m$, this is at least $km/2$. Summing over blocks gives the claimed repair bound. The proof made no union bound over labelings or over groups.
