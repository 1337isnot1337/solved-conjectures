# Kovalev's linear Lipschitz clustering questions

**Theorem.** Let \(X\) be a real or complex normed space, not necessarily complete. For every \(1\le k<n\) there is a retraction \(r_k:X(n)\to X(k)\) with
\[
 \operatorname{Lip}(r_k)\le 2+32(n-1),\qquad r_k(A)\subseteq\operatorname{conv} A,
 \tag{1}
\]
where \(X(n)\) consists of the nonempty sets with at most \(n\) points and is given the Hausdorff distance. The bound is uniform in \(k\) and \(X\). The order \(n\) is sharp in the supremum over \(k\) for every nonzero normed space.

This answers both Questions 6.5 and 6.6 of [Leonid V. Kovalev, *Lipschitz clustering in normed spaces and barycentric spaces*, §6, arXiv:2610.31555 (2026)](https://arxiv.org/html/2610.31555v1#S6) with a single all-target-size theorem. The previous bounds in his Theorems 1.1 and 1.2 are \(O(n^2)\) for general \(k\) and \(O(n\log n)\) for \(k=n-1\). The lower bound \(n-3\) for \(k=n-1\) is his Proposition 6.4, using [Akofor and Kovalev, Theorem 5.1](https://arxiv.org/abs/2005.13579). These are published questions, not numbered conjectures.

## 1. A tree average that is invariant under contractions

For purposes of the estimates, consider a finite labeled metric set with distances \(d_{ij}\), and positions \(x_i\in X\) satisfying \(\|x_i-x_j\|\le d_{ij}\). At scale \(s\ge0\), join any pair of labels at distance at most \(s\). The nested connected components give the single-linkage tree. Its leaves are the individual labels, a nonleaf vertex \(v\) is a component \(C_v\) created at its merge height \(h_v>0\), and its children are the components just below that height. Simultaneous mergers at one height form one vertex with all relevant children. Set \(h_v=0\) at leaves. Write \(d_v\ge2\) for the number of children of a nonleaf \(v\).

For each node \(v\), define the nonnegative quantity \(S_v\) by
\[
 S_v=0\quad\text{at leaves},\qquad
 S_v=\sum_{c\text{ child of }v}S_c+(d_v-1)h_v
       \quad\text{otherwise}.
 \tag{2}
\]
It is the sum of merge heights, each weighted by the number of components merged minus one. There is a spanning tree on \(C_v\) of total length \(S_v\): inductively join the child spanning trees by a tree on the connected graph of children at height \(h_v\), with all \(d_v-1\) joining edges of length \(h_v\). Hence
\[
 \operatorname{diam}\{x_i:i\in C_v\}\le S_v
 \le (|C_v|-1)h_v.
 \tag{3}
\]
The upper inequality uses \(\sum_{w\text{ in the subtree}}(d_w-1)=|C_v|-1\) and \(h_w\le h_v\).

At a leaf put \(F_v=x_i\), and recursively at an internal vertex put
\[
 L_v=h_v+S_v,\qquad
 p_{v,c}=\frac{h_v+S_c}{L_v},\qquad
 F_v=\sum_{c\text{ child of }v}p_{v,c}F_c .
 \tag{4}
\]
The \(p_{v,c}\) sum to one by (2), and are positive. This is a convex combination of the descendant leaf positions. The numerator \(h_v+S_c\) is the total branch length in the child subtree plus its edge to \(v\): the subtree length below \(c\) is \(h_c+S_c\) by (2), and the incoming edge has length \(h_v-h_c\).

If an internal child \(c\) and parent \(v\) coalesce at a common positive height \(h\), their edge may be contracted. The sum \(S_v\) does not change, by (2). And \(p_{v,c}=(h+S_c)/L_v=L_c/L_v\), so after expanding \(F_c\) the coefficient for each grandchild \(g\) is exactly \((h+S_g)/L_v\), the coefficient assigned after contraction. Thus the parent value is unchanged by contracting any zero-length internal edge of positive height. If an entire subtree collapses to height zero and its geometric leaf positions coincide, its representatives tend to that point by convex-hull containment and all its \(S\)'s tend to zero. In an ancestor of positive height the resulting block therefore behaves as a single leaf. These facts give the required continuity under all zero-length contractions.

The jump from a child to its parent obeys the useful bound
\[
 \|F_v-F_c\|
 \le (1-p_{v,c})\,S_v
 \le L_v-(h_v+S_c)=S_v-S_c.
 \tag{5}
\]
The first inequality follows from (3) and convex-hull containment of every other child representative.

## 2. Sensitivity of a fixed subtree representative

On a time interval where the merge tree combinatorics are fixed, suppose geometric positions move with speed at most \(\epsilon\) and each merge height moves with speed at most \(2\epsilon\). Assume (3) continues to hold. Then, if there are \(m\) leaves in the full tree,
\[
 \|\dot F_v\|\le [1+4(m-1)]\epsilon
 \tag{6}
\]
for every node \(v\).

Here is the quantitative cancellation in this estimate. At any fixed time, differentiate (4) with respect to just one height \(h_w\) for an internal descendant \(w\) of \(v\), treating all other heights and positions as independent parameters in the formula. At \(w\), the contribution is
\[
 \partial_{h_w}F_w=L_w^{-1}\sum_c(F_c-F_w),\qquad
 \|\partial_{h_w}F_w\|\le d_w,
\]
since each numerator \(h_w+S_c\) increases at rate one, the denominator at rate \(d_w\), and the diameter is at most \(S_w\le L_w\).

At a proper ancestor \(b\) of \(w\), the only direct change in the probabilities of (4) is through the child \(c\) on the path to \(w\): its numerator and \(L_b\) each increase at rate \(d_w-1\) by (2). Its direct contribution to the derivative of \(F_b\) is
\[
 \frac{d_w-1}{L_b}(F_c-F_b),
 \qquad\text{with norm at most }(d_w-1)(1-p_{b,c})
\]
by (3) and (4). The remaining derivative just passes up from children with their weights. Let \(P_b\) denote the product of the child weights along the path from \(v\) to \(b\), with \(P_v=1\). In the derivative at \(v\), the norms of the direct proper-ancestor terms sum to at most
\[
 (d_w-1)\sum_{b\text{ on the path from }v\text{ to }w,\ b\ne w}
             P_b(1-p_{b,c})
   =(d_w-1)(1-P_w).
\]
Adding the term at \(w\), weighted by \(P_w\), gives
\(\|\partial_{h_w}F_v\|\le(d_w-1)(1-P_w)+d_wP_w\le d_w\).
For a node outside the subtree the derivative is zero. The sum of all \(d_w\)'s is the number of tree edges and is at most \(2(m-1)\). The height contribution to (6) is therefore at most \(4(m-1)\epsilon\). With the weights held fixed, the position term is an average of the leaf velocities, of norm at most \(\epsilon\). This proves (6).

## 3. The retraction and its stability when points move

For a finite set \(A\subset X\), put \(s=s_k(A)\), the first threshold with at most \(k\) components of the graph of \(A\). If \(s=0\), set \(r_k(A)=A\). For \(s>0\), define for each \(a\in A\)
\[
 T_A(a)=\int_1^2 F_{C_a(us)}\,du,\qquad
 r_k(A)=\{T_A(a):a\in A\},
 \tag{7}
\]
where \(F_{C_a(us)}\) is the value (4) at the single-linkage node corresponding to the component of \(a\) at threshold \(us\). Beyond the last merge use the root. This integral of a finite step function is just a finite convex combination. If two points are connected at scale \(s\), they have the same output for every \(u\), so \(r_k(A)\) has at most \(k\) points. For \(|A|\le k\) the map is the identity. Also, (3) gives the displacement bound
\[
 \|T_A(a)-a\|\le 2(|A|-1)s.
 \tag{8}
\]

We prove an estimate for an arbitrary map \(f:A\to X\) with \(\|f(a)-a\|\le\epsilon\). Enumerate \(A=\{a_1,\ldots,a_m\}\) and interpolate, for \(0\le \tau\le1\), with
\[
 x_i(\tau)=(1-\tau)a_i+\tau f(a_i),\qquad
 d_{ij}(\tau)=(1-\tau)\|a_i-a_j\|+\tau\|f(a_i)-f(a_j)\|.
 \tag{9}
\]
The latter is a metric for \(\tau<1\) and a pseudometric at \(\tau=1\); its quotient there is \(f(A)\), with equal geometric positions on each zero-distance class. Crucially, the geometric distances need not equal the auxiliary distances at intermediate times, but they satisfy
\[
 \|x_i(\tau)-x_j(\tau)\|\le d_{ij}(\tau),
 \qquad
 |d_{ij}(\tau)-d_{ij}(\tau')|\le2\epsilon|\tau-\tau'|.
\]
The first is the norm triangle inequality applied to (9), and ensures (3) for every intermediate tree. The second follows because moving both endpoints changes their distance by at most \(2\epsilon\). It also implies \(s_k(\tau)\) is \(2\epsilon\)-Lipschitz: changing every distance by at most \(\eta\) puts each threshold graph for one metric inside the other's graph at threshold shifted upwards by \(\eta\).

If \(m\le k\), both endpoint maps are the identity and we have immediate stability. Otherwise \(s=s_k(\tau)>0\) for \(\tau<1\). Define \(\Phi_i(\tau)\) by the same integral as (7), using the auxiliary tree and the leaf positions from (9), and the identity value if \(s=0\). Then \(\{\Phi_i(0)\}_i=r_k(A)\) and \(\{\Phi_i(1)\}_i=r_k(f(A))\) by the quotient interpretation.

The ordering of all pairwise distances in (9) changes only at finitely many times, since they are affine functions; persistent ties are grouped. On each resulting open interval the tree combinatorics are fixed and all heights, as well as \(s\), are affine. Further subdivide at any isolated times when \(h_v=s\) or \(h_v=2s\). A breakpoint in the integral corresponding to a merge vertex \(v\) on the path of \(i\) then has position \(u_v=h_v/s\in(1,2)\), and
\[
 |\dot u_v|=\frac{|\dot h_v-u_v\dot s|}{s}\le\frac{6\epsilon}{s}.
\]
Endpoint equalities holding identically do not contribute moving breakpoints. Between the breakpoints the integrand is one of the representatives \(F_v\), whose speeds satisfy (6). Differentiating the finite sum for \(\Phi_i\) gives the weighted average of these speeds and one term per moving breakpoint equal to its speed times the jump in the integrand. By (5), the jumps along the path telescope in the \(S\)-values:
\[
 \sum_{1<u_v<2}\|F_v-F_{c(v)}\|
 \le \sum_{1<u_v<2}(S_v-S_{c(v)})
 \le 2(m-1)s.
\]
Here \(c(v)\) is the child on the leaf path, and the last bound is (3) at its highest relevant merge. Thus on each open interval,
\[
 \|\dot\Phi_i(\tau)\|\le [1+16(m-1)]\epsilon .
 \tag{10}
\]

For completeness, \(\Phi_i\) is continuous at each subdivision endpoint, including a zero-distance collapse. If the limit \(s\) is zero, the displacement bound (8) applies to the intermediate data by (3) and tends to zero. If the limit \(s\) is positive, fix \(u\in[1,2]\) outside the finite set of ratios of limiting pair distances to \(s\). The component at scale \(us\) then has a stable label set near the endpoint. For either adjacent fixed tree, letting its heights tend to their limits and contracting the resulting zero-length edges gives the limiting threshold tree: an edge is present at exactly the limiting pair-distance threshold; tied consecutive merge heights collapse into simultaneous mergers, and zero-distance classes become single labels. The representative of the stable component therefore tends to the quotient tree representative by the contraction invariance after (4). For zero-height descendant blocks, convex-hull containment gives convergence to the common leaf position. The integrands are bounded in the common finite-dimensional span of the finitely many endpoint positions, so one may pass to the integral, excluding the finitely many exceptional \(u\)'s. This proves continuity and does not require completeness of \(X\).

Integrating (10) over the finite subdivision and matching by each label at the endpoints gives
\[
 d_H(r_k(A),r_k(f(A)))\le [1+16(m-1)]\epsilon.
 \tag{11}
\]

## 4. From moving points to Hausdorff distance

Let \(A,B\in X(n)\) be at Hausdorff distance \(\epsilon\). We use Kovalev's common-image reduction, Lemma 3.4: there are maps \(f:A\to X\), \(g:B\to X\) moving points by at most \(\epsilon\) with \(f(A)=g(B)\). To see this directly, choose an edge-minimal bipartite relation between \(A\) and \(B\) that covers all vertices and uses only distance-\(\epsilon\) or shorter edges. No edge has both endpoints of degree at least two, as otherwise it could be removed. Every component is therefore a star or a single edge. Map every point of each component on both sides to its center (either endpoint for a single edge). Both images agree, and the movements have size at most \(\epsilon\).

Apply (11) from \(A\) and from \(B\) to this common image. The triangle inequality gives
\[
 d_H(r_k(A),r_k(B))\le 2[1+16(n-1)]\,d_H(A,B),
\]
as asserted in (1).

The same bound multiplied by \(K\) holds in any metric space admitting a \(K\)-Lipschitz barycenter for finitely supported probabilities in the \(1\)-Wasserstein metric. Use the isometric embedding \(x\mapsto\delta_x\) into the affine probability subspace of the normed space of finitely supported signed measures, as in Kovalev's Lemma 5.2 and Theorem 5.3. Apply the present retraction to Dirac sets; its convex-hull containment ensures the outputs remain finitely supported probability measures, so their barycenters give the required retraction.

## Provenance and status

The single-linkage tree and the moving-points/common-image proof architecture are from Kovalev's Sections 2–3. His construction uses electrical harmonic interpolation on the tree. Here (4) instead uses child probabilities proportional to total branch length, and the telescoping visitation bound in §2 replaces the quadratic harmonic estimate. Averaging the output across a short interval of cut heights, rather than taking a single cut, controls changes in the active subtree along the leaf path. These two changes lead to the uniform linear bound. Targeted searches for the exact source identifier, both questions, and later linear finite-subset retractions in general normed spaces did not find a prior solution. This does not certify priority.
