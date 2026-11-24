# A bounded-polynomial criterion for the linear Ehrhart coefficient of symmetric edge polytopes

This is partial progress on the symmetric-edge half of [Ferroni–Higashitani, *Examples and counterexamples in Ehrhart theory*, Conjecture 4.9](https://arxiv.org/html/2307.10852). They ask for positivity of **all** Ehrhart coefficients of both ordinary and symmetric edge polytopes. The criterion here concerns only the linear Ehrhart coefficient in the symmetric case. It is distinct from the disproof of \(h^*\)-\(\gamma\)-positivity by [Ferroni, arXiv:2607.02424](https://arxiv.org/abs/2607.02424).

For a connected graph \(G\) with at least one edge, let \(P_G\) be its symmetric edge polytope, \(d=\dim P_G\), and \(H_G(z)=h_{P_G}^*(z)\). Define a polynomial
\[
 F_G(x)=(1-x)^d H_G\!\left(-\frac{x}{1-x}\right)
\]
on \([0,1]\) by polynomial continuation at \(1\). The following are equivalent:

1. Every connected positive-dimensional symmetric edge polytope has strictly positive linear Ehrhart coefficient.
2. For every such graph \(G\), \(|F_G(x)|\le1\) for every \(x\in[0,1]\).

More concretely, a single strict amplitude violation \(|F_G(x)|>1\) would give an infinite family of symmetric edge polytopes with **negative** linear Ehrhart coefficient, by taking sufficiently many even copies in a graph vertex wedge. Conversely, an upper bound of 1 for even just the positive branch near a single vertex is insufficient; the amplitude test must be on the full interval.

## An integral identity

If \(P\) is any \(d\)-dimensional lattice polytope with \(H(z)=\sum_{i=0}^d h_i z^i\) and \(h_0=1\), write \(E_P(t)=\sum_i h_i\binom{t+d-i}{d}\). For \(1\le i\le d\),
\[
 [t]\binom{t+d-i}{d}
 =(-1)^{i-1}\frac{(i-1)!(d-i)!}{d!}
 =(-1)^{i-1}\int_0^1 x^{i-1}(1-x)^{d-i}\,dx.
\]
The \(i=0\) contribution is the harmonic number \(\sum_{k=1}^d 1/k\), equivalently \(\int_0^1(1-(1-x)^d)\,dx/x\). Summing gives
\[
 [t]E_P(t)=\int_0^1\frac{1-(1-x)^d H(-x/(1-x))}{x}\,dx.
 \tag{1}
\]

## Vertex wedges multiply the test polynomial

A vertex wedge of connected graphs is obtained by identifying one chosen vertex of each copy. In the lattice \(\sum x_i=0\) omit the coordinate of the common vertex. The root vectors coming from separate graphs then lie in the corresponding disjoint coordinate blocks, so the symmetric edge polytope of the wedge is the free sum in the direct-sum lattice. Standard reflexivity of \(P_G\) makes its gauge integer-valued on that lattice. One may see reflexivity from the polar's vertex description: the unit-bounded edge-difference equations of a polar vertex must have a connected spanning set of tight equalities, hence propagate integer values from the fixed common coordinate zero along a spanning tree.

The gauge of the free sum is the sum of the component gauges. For an integral gauge, the series enumerating lattice points by their exact gauge is \((1-z)\) times the Ehrhart series. Thus the exact-gauge series multiply under these free sums, giving products of \(h^*\)-polynomials and additivity of the dimensions. Consequently, for the wedge \(G^{\vee N}\) of \(N\) copies, \(F_{G^{\vee N}}(x)=F_G(x)^N\). Equation (1) implies
\[
 [t]E_{P_{G^{\vee N}}}(t)=\int_0^1 (1-F_G(x)^N)\,\frac{dx}{x}.
 \tag{2}
\]

If \(|F_G|\le1\), the integrand for \(N=1\) is nonnegative and is strictly positive near zero: \(F_G(0)=1\) and \(F'_G(0)=-d-h_1<0\). Thus the linear term is strictly positive. If instead \(|F_G|>1\) on some closed interval of positive length bounded away from zero, continuity gives \(|F_G|\ge1+\eta\) there for some \(\eta>0\). For even \(N\) its contribution to (2) is negative of exponential magnitude. On a small interval \([0,\delta]\), \(F_G\in[0,1]\) and \(1-F_G(x)=O(x)\), so the positive contribution there is \(O(N)\) by \(1-u^N\le N(1-u)\). The remaining positive contribution away from zero is bounded independently of \(N\), since \(F_G^N\ge0\). Hence (2) is negative for all sufficiently large even \(N\). This proves the equivalence.

## Some established and remaining regions

For a single edge, \(F_G(x)=1-2x\). For a complete graph on \(d+1\) vertices, the classical type-\(A\) root polytope numerator \(\sum_i\binom di^2 z^i\) gives \(F_G(x)=P_d(1-2x)\), with \(P_d\) the Legendre polynomial. The standard integral representation on \([-1,1]\) gives \(|P_d|\le1\) there. Equation (2) and its multi-factor version thus prove the amplitude bound for arbitrary vertex wedges of these blocks, for example trees and block graphs. This is a concrete reduction and a source of exact tests, not a solution for arbitrary blocks. Preliminary exact searches using Ferroni's equal-length theta-graph formula did not find a violating graph.
