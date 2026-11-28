# A reciprocal-degree certificate for fractional odd-cycle deletion

This is a fractional cut-cover result for [Erdős Problem 23](https://www.erdosproblems.com/23) and its higher odd-girth version, not an integral proof. Put nonnegative vertex weights on a finite graph, with total \(N>0\). Edge capacities are the products of their endpoint weights. Ignore zero-weight vertices.

For any odd \(g\ge5\), if the graph has odd girth at least \(g\), there is a fractional **edge** cover of all \(g\)-cycles of cost at most \(N^2/g^2\). The same explicit cover hits **all odd cycles** when \(g=5\) or \(g=7\). Thus in these two cases the fractional edge-deletion problem has the same sharp universal constant as the proposed integral bound. Its only positive-weight extremizers are balanced blow-ups of \(C_g\). For larger odd girths the formula is only guaranteed here for the shortest-cycle constraints.

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

If the fractional optimum equals \(N^2/g^2\) for \(g=5\) or \(7\), there are no isolates, and an optimal LP-dual cycle packing uses only shortest cycles tight at the displayed cover. All edges are saturated by it because the displayed \(x_e\) is strictly positive. Thus every vertex belongs to some tight shortest cycle. Equality in the degree and harmonic-mean estimates forces \(d_v=2N/g\) on every tight shortest cycle, so this degree is common to the graph.

Choose one such cycle \(v_0,\ldots,v_{g-1}\). Every positive-mass vertex sees exactly two of its vertices, by equality in the sum-of-degrees bound. Those two have cyclic separation two: the odd arc between them must have length at least \(g-2\), and triangle-freeness excludes consecutive positions. Assign the vertex to class \(i\) if its root neighbors are \(v_{i-1},v_{i+1}\). An edge inside a class or between classes at distance two makes a triangle. For \(g=7\), classes at distance three also cannot be adjacent: for classes 0 and 3, an edge between their members closes a five-cycle with the root path \(v_6,v_5,v_4\). Only consecutive classes can be adjacent. The degree of root \(v_i\) is exactly the sum of the masses of the two neighboring classes, which equals \(2N/g\). This system has the unique solution of equal masses, because a difference between two solutions satisfies \(z_{i+2}=-z_i\) on an odd cycle. All allowed pairs must be complete to give every vertex the common degree. Conversely the balanced cycle blow-up has fractional optimum equal to the bound, using a uniform packing of shortest cycles.

If the odd-circuit cover polytope is integral, the bound transfers to actual edge deletion. For example, [Guenin’s theorem, in Schrijver’s proof](https://homepages.cwi.nl/~lex/files/guenin2.pdf), gives this for signed graphs with no odd \(K_5\) minor; use the all-negative signature. This makes the \(g=7\) absolute estimate independent of edge density in that class. For the triangle-free case the absolute fractional estimate also follows less directly from a constant cover in the sparse range and [Balogh–Clemen–Lidický’s dense tail](https://arxiv.org/abs/2103.14179). The point here is the simple per-edge certificate, its equality argument, and the shortest-cycle packing bound for arbitrary \(g\). The unconstrained integral conjecture still needs more than this fractional relaxation.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
