# A reciprocal-degree certificate for fractional odd-cycle deletion

This is a fractional cut-cover result for [Erdős Problem 23](https://www.erdosproblems.com/23) and its higher odd-girth version, not an integral proof. Put nonnegative vertex weights on a finite graph, with total \(N>0\). Edge capacities are the products of their endpoint weights. Ignore zero-weight vertices.

For any odd \(g\ge5\), if the graph has odd girth at least \(g\), there is a fractional **edge** cover of all \(g\)-cycles of cost at most \(N^2/g^2\). The same explicit cover hits **all odd cycles** when \(g\in\{5,7,9,11\}\). Thus in these four cases the fractional edge-deletion problem has the same sharp universal constant as the proposed integral bound. Its only positive-weight extremizers are balanced blow-ups of \(C_g\). For other odd girths the same sharp coefficient is guaranteed here on shortest cycles, and a weakened coefficient below covers all odd cycles.

## Prior attribution

The exact \(g=5\) reciprocal-degree cover, its Guenin transfer and its refinement by the smallest pentagon degree defect were already written in [Ferudun's public research ledger, entries R3-C22, R3-C24 and R3-C39](https://github.com/AlperTheKing/ErdosProblems/blob/main/problems/23/round3/CLAUDE_GATE_R3.md). That is prior work, not a new resolution or a new certificate at \(g=5\). The new contributions here are the strengthened induced-cycle gap count for higher odd girth, the two-shortcut improvement and resulting cover extensions, and the direct bound expressed in terms of the integral optimum (obtained by combining their local degree-defect mechanism with the rooted-pentagon cut bound).

## The certificate

Write \(d_v=\sum_{u\sim v}w_u\). On an edge \(uv\) put
```math
x_{uv}=\frac{N}{g^2}\left(\frac1{d_u}+\frac1{d_v}\right).
```
Its total fractional cost is at most \(N^2/g^2\), since
```math
\sum_{uv\in E}w_uw_vx_{uv}
=\frac{N}{g^2}\sum_{v:d_v>0}\frac{w_v}{d_v}\sum_{u\sim v}w_u
=\frac{N}{g^2}\sum_{v:d_v>0}w_v.
```
The cover constraint on an odd cycle \(C\) asks for \(\sum_{e\in C}x_e\ge1\). Since the edge length is additive in the two endpoint reciprocals, it suffices to check induced odd cycles: an odd cycle with a chord contains a smaller odd cycle on a vertex subset, and dropping vertices cannot increase the sum of positive reciprocals.

For an induced odd cycle of length \(\ell\), every vertex on it has two neighbors on it. An outside point with at least two neighbors on it has gaps between successive neighbors of length at least two, and at least one gap is odd since \(\ell\) is odd. Every odd gap is at least \(g-2\), or it would close a shorter odd cycle through that outside point. Thus a vertex sees at most \((\ell-g+4)/2\) points of the cycle. Double counting then gives
```math
\sum_{v\in C}d_v\le \frac{\ell-g+4}{2}\,N,\qquad
\sum_{v\in C}\frac1{d_v}\ge\frac{2\ell^2}{(\ell-g+4)N}.
```
For \(\ell=g\) the right side is \(g^2/(2N)\) as needed. For \(g=5,7\), the function \(2\ell^2/(\ell-g+4)\) is strictly increasing for \(\ell\ge g\), so every longer odd cycle is covered strictly, as is every chorded odd cycle. This proves the explicit cover.

The equivalent packing statement is that a fractional packing of shortest odd cycles, with the stated product capacities, has total amount at most \(N^2/g^2\). One can prove this independently: let \(b_v\) be the total incident cycle weight at \(v\), and \(B\) the total packed amount. Then \(\sum_v b_v=gB\), \(2b_v\le w_vd_v\), and \(\sum_v b_vd_v\le2NB\) by the two-neighbor bound on each shortest cycle. Cauchy–Schwarz gives
\((gB)^2\le N\sum_v b_v^2/w_v\le N^2B\).

## Equality and transfer to integral covers

If the fractional optimum equals \(N^2/g^2\) for any of those four girths, there are no isolates, and an optimal LP-dual cycle packing uses only shortest cycles tight at the displayed cover. All edges are saturated by it because the displayed \(x_e\) is strictly positive. Thus every vertex belongs to some tight shortest cycle. Equality in the degree and harmonic-mean estimates forces \(d_v=2N/g\) on every tight shortest cycle, so this degree is common to the graph.

Choose one such cycle \(v_0,\ldots,v_{g-1}\). Every positive-mass vertex sees exactly two of its vertices, by equality in the sum-of-degrees bound. Those two have cyclic separation two: the odd arc between them must have length at least \(g-2\), and triangle-freeness excludes consecutive positions. Assign the vertex to class \(i\) if its root neighbors are \(v_{i-1},v_{i+1}\). An edge inside a class or between classes at distance two makes a triangle. For a short cyclic class distance \(j\ge3\), an edge plus its two root spokes would give a forbidden even root arc closed by three edges. For even \(j\), choose inward spokes, giving even arc length \(j-2\); for odd \(j\), choose outward spokes and the other arc, giving even length \(g-j-2\). Only consecutive classes can be adjacent. The degree of root \(v_i\) is exactly the sum of the masses of the two neighboring classes, which equals \(2N/g\). This system has the unique solution of equal masses, because a difference between two solutions satisfies \(z_{i+2}=-z_i\) on an odd cycle. All allowed pairs must be complete to give every vertex the common degree. Conversely the balanced cycle blow-up has fractional optimum equal to the bound, using a uniform packing of shortest cycles.

If the odd-circuit cover polytope is integral, the bound transfers to actual edge deletion. For example, [Guenin’s theorem, in Schrijver’s proof](https://homepages.cwi.nl/~lex/files/guenin2.pdf), gives this for signed graphs with no odd \(K_5\) minor; use the all-negative signature. This makes the absolute estimate at \(g=7,9,11\) independent of edge density in that class. For the triangle-free case Ferudun's earlier certificate already gives the same fractional estimate, as credited above. The extensions here concern higher odd girth and the comparison with the integral optimum. The unconstrained integral conjecture still needs more than this fractional relaxation.

## Longer-cycle improvement by two shortcuts

For odd \(g\ge9\), put \(k=g-6\), \(b=\lceil k/2\rceil\), and \(\gamma_g=k(\sqrt{1+1/b}-1)\). For every longer induced odd cycle, the reciprocal sum in the certificate's proof is at least \(8(g-4+\gamma_g)/N\). In particular this exceeds \(g^2/(2N)\) for \(g=9,11\). For any odd \(g\ge9\) the coefficient
```math
\max\left\{\frac1{g^2},\,\frac1{16(g-4+\gamma_g)}\right\}
```
can therefore replace \(1/g^2\) in the reciprocal edge assignment to give a cover of every odd cycle.

To prove this, let the induced cycle have length \(\ell=g+2r\) with \(r\ge1\), and write \(a=r+2\). A vertex hitting \(a\) root positions must have exactly one gap \(g-2\) and all other gaps two, by equality in the earlier gap count. The neighbor pattern is then \(i,i+2,\ldots,i+2r+2\) in cyclic order, with start \(i\) just after the long gap. Two starts at directed distance \(d\) with \(4\le d\le\ell-4\) are impossible. In fact choose \(u,v\in[2,r+1]\) integral with \(u+v=r+3\) and \(2u\le d\le\ell-2v\); the intervals \([2u,2u+g-6]\) cover \([4,\ell-4]\). The two outside vertices then provide length-two shortcuts for even root arcs of lengths \(2u,2v\) with disjoint interiors. This yields an odd closed walk of length \(g-2\), which is impossible.

Hence all starts lie in four consecutive positions. To see this, put one start at zero; all others lie in the lifted interval \([-3,3]\), and any gap exceeding three within that interval would also have complementary distance at least four, since \(\ell\ge11\). The union of the maximum-size neighbor profiles therefore misses a common consecutive block \(U\) of \(k\) roots. If there are no maximum-size profiles, choose any such block.

Let \(H\) be the total weight of maximum-count vertices. The other vertices contribute at most \(a-1\) hits each on the cycle and at most \(b\) in \(U\), the latter since consecutive neighbors are forbidden. Thus
```math
\sum_{w\in C}d_w+\frac1b\sum_{w\in U}d_w\le aN.
```
Cauchy–Schwarz with weights \(1+1/b\) in \(U\) and one elsewhere gives
```math
\sum_{w\in C} \frac1{d_w}
\ge\frac{(\ell+\gamma_g)^2}{aN}
\ge\frac{8(g-4+\gamma_g)}{N},
```
using \(\ell+\gamma_g=2a+(g-4+\gamma_g)\). For \(g=9\), \(\sqrt{3/2}>6/5\); for \(g=11\), \(\sqrt{4/3}>23/20\). Both give the asserted strict comparison with \(g^2/(2N)\). Thus the same tight-cycle equality argument above applies to those girths as well.

## An explicit fractional–integral relation for #23

Normalize \(N=1\), and let \(e,\beta,\phi\) be respectively total unordered edge mass, minimum integral cut-deletion mass, and minimum fractional odd-cycle edge-cover mass. Then
```math
\phi\le\min\left\{\frac e5,\ \frac{2+e-5\beta}{50}\right\}.
```
The first inequality is the usual constant \(1/5\) cover. For the second, on any pentagon let \(D\) be the set of vertices having two root neighbors. The [rooted pentagon estimate](ROOTED-PENTAGON-RATIO.md) gives \(\beta\le(e+1-\mu(D))/5\). Therefore the sum of its degrees is at most \(1+\mu(D)\le2+e-5\beta\). The reciprocal assignment has total length at least \(2/(2+e-5\beta)\) on every pentagon by Cauchy–Schwarz. Its length on any longer induced odd cycle is already at least \(98/75\), which exceeds \(2/(2+e-5\beta)\): Mantel and the random cut give \(e\le1/4\) and \(\beta\le e/2\), whence \(2+e-5\beta\ge13/8\). Rescale the reciprocal assignment by \((2+e-5\beta)/2\). For the unresolved medium-density band, the constant \(1/5\) cover already gives the stronger direct numerical fractional gap; the new inequality is the explicit dependence on the integral optimum, not a claimed improvement of that band gap.

The two-shortcut estimate and the integral-dependent scaling were obtained in an independent internal AI research pass and checked against the existing rooted-cut proof.

## A routing characterization of equality with the integral optimum

Fix an integral optimal cut of any finite graph, and write \(B\) for crossing edges, \(M\) for missed edges. Put the original capacities on \(B\), and one demand of size \(w_uw_v\) on \(B\) for each \(uv\in M\). The integral and fractional minimum deletions are equal **if and only if** these demands admit a unit-congestion fractional routing through \(B\).

In one direction, a route uses even simple paths in \(B\), so each path plus its demand edge is an odd cycle. The path-decomposition weights give a feasible odd-cycle packing of total weight \(\beta\), the integral optimum. Conversely, if the dual optimal packing has weight \(\beta\), each packed odd cycle contains at least one edge of \(M\), and the sum of the capacities of \(M\) is exactly \(\beta\). Equality therefore forces every edge of \(M\) to be saturated and every packed cycle to contain exactly one edge of \(M\). Deleting that one edge from its cycle yields the asserted routing.

The maximum-cut switch inequalities give the ordinary cut condition for this routing. As in [MULTIFLOW.md](MULTIFLOW.md), the condition is sufficient for a forest supply graph, or by Okamura–Seymour for a planar supply graph with all demand endpoints on a single face in each component. Combined with the explicit cover, this proves the sharp full-density product-weighted deletion bound at odd girths seven, nine and eleven for these classes as well, without requiring a planar embedding of the original graph. The triangle-free consequence of those routings is already in the earlier note via a different density argument.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
