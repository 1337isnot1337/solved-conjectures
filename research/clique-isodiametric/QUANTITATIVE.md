# A quantitative planar gap from the packing upper bound

This complements [compact attainment and strictness](ATTAINMENT.md). The original clique-isodiametric conjecture is excluded from the new-resolution count: the [2007 best-packing theorem already implies its failure](PROOF.md). Here we bound the size of the gap for the different finite-\(k\) extremal problem.

**Proposition.** There is an absolute constant \(C>0\) such that for every \(k\ge2\),
\[
V_{2,k}\le 2\sqrt3(k-1)-\exp(-C k^3\log(2k)).
\]
The estimate is weak but positive for every finite \(k\). It comes from a small-value version of the dual-radius Fourier obstruction, not a search for optimal arrangements. No priority is asserted.

**Bound the support linearly in \(k\).** Use a compact maximizing set \(A\), as justified in the attainment argument. Let \(\alpha_i\) be the maximum number of pairwise distance-\(>2\) points in its \(i\)-th short-chain component. Distinct components are completely joined in the large-distance graph, hence \(\sum_i\alpha_i\le k-1\). Inside each component a shortest path of \(\ell\) distance-\(\le2\) edges gives \(\lfloor\ell/2\rfloor+1\) pairwise distant even-index vertices. So its diameter is at most \(4\alpha_i-2\). Translate the components along the first coordinate until their first-coordinate projections have successive gaps of 3, and start the first projection at zero. This preserves volume and every adjacency. If there are \(s\) components, the first-coordinate span is at most
\[
\sum_i(4\alpha_i-2)+3(s-1)\le5(k-1).
\]
We may therefore assume \(0\le x_1\le R=5(k-1)\) on \(A\).

**Small Fourier values at all dual lattice radii.** Let \(v=|A|=V_{2,k}\), \(\eta=2\sqrt3(k-1)-v\), and \(F(z)=\int_A e^{-2\pi i z x_1}\,dx\). As in [the attainment note](ATTAINMENT.md), the periodization \(q_1\) of the indicator over each rotation of the triangular packing lattice is at most \(k-1\) almost everywhere (take \(L^1\) limits from strictly dilated packings). Its fundamental cell \(T\) has area \(2\sqrt3\), so
\[
\int_T ((k-1)-q_1)=\eta.
\]
Subtracting the constant periodization in any nonzero dual Fourier coefficient gives \(|\widehat{\mathbf1_A}(\xi)|\le\eta\). All rotations are allowed, so \(|F(t)|\le\eta\) when \(t\) is the length of a nonzero dual vector.

**Interpolation.** For an integer \(N\ge 1\) use the \(m\) distinct positive dual lengths \(\sqrt{(j^2+3c^2)/3}\) for \(1\le j\le N\) and \(0\le c\le\lfloor\sqrt{j/3}\rfloor\). As in the attainment note they lie in \((0,N]\). Distinct squared lengths differ by at least \(1/3\), so the lengths differ by at least \(1/(6N)\). Their number satisfies \(N^{3/2}/3\le m\le 2N^{3/2}\). For the degree-\((m-1)\) interpolant at these nodes \(t_i\), each Lagrange weight at zero has absolute value at most \((6N^2)^{m-1}\). For real \(t\) the bound \(|F^{(m)}(t)|\le v(2\pi R)^m\) follows by differentiation under the integral. The interpolation remainder bound applied to real nodes, including zero, is
\[
|F(0)-\textstyle\sum_i L_i(0)F(t_i)|\le v(2\pi RN)^m/m!.
\]
This remains true for complex-valued \(F\) by the integral formula for divided differences over a simplex, of volume \(1/m!\). Choose \(N=\lceil(12e\pi R)^2\rceil\). Then \(m!\ge(m/e)^m\) and \(m\ge N^{3/2}/3\) give \(v(2\pi RN)^m/m!\le v/2\). Because \(F(0)=v\) and every interpolation value has modulus at most \(\eta\), we get
\[
\eta\ge \frac{v}{2m(6N^2)^{m-1}}.
\]
Now \(v\ge\pi\) by the unit disk, \(N=O(k^2)\), and \(m=O(k^3)\). This proves the proposition.

The strictness argument and its lineage should be distinguished from the original conjecture. Beck's obstruction to bounded Steinhaus sets likewise forces Fourier zeros at all radii of a dual lattice and uses the restricted growth of an entire function; see [Kolountzakis's survey](https://www.esi.ac.at/preprints/esi1300.pdf). The calculation above uses the \(L^1\) deficit of periodization to quantify small values rather than requiring exact zeros.
