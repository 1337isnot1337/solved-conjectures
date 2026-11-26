# All balanced Cayley colorings contain rainbow six-cycles

**Theorem.** For every sufficiently large \(n=6t+1\), any completely balanced six-coloring of \(K_n\) invariant under a regular action of a finite group has \(\Omega(n^6)\) labeled rainbow six-cycles. The bound is uniform over all groups and colorings. Neither commutativity nor conjugation invariance is needed.

More generally the same holds for a transitive color-preserving group action on the vertices if every nonlinear irreducible representation occurring in its permutation representation has dimension at least five. The arbitrary-coloring statement of [Erdős #811](https://www.erdosproblems.com/811) remains open: transitivity is a substantive hypothesis.

## The key six-matrix estimate

Let \(M_1,\ldots,M_6\) be self-adjoint matrices with \(\sum_i M_i=0\), and suppose for each subset \(S\subseteq[6]\) that
\[
\left\|\sum_{i\in S} M_i\right\|_{\mathrm{HS}}^2
\le \frac{|S|(6-|S|)}{d}.
\tag{1}
\]
Write \(M_S=\sum_{i\in S}M_i\), \(E=\sum_i\|M_i\|_{\mathrm{HS}}^2\), and let \(T\) be the average of \(\operatorname{tr}(M_{\sigma(1)}\cdots M_{\sigma(6)})\) over all orders \(\sigma\). Then
\[
T\ge -\frac{536}{720d^2}E.
\tag{2}
\]

Indeed, inclusion-exclusion in the degree-six polynomial \(\operatorname{tr}(\sum_i x_iM_i)^6\) extracts the coefficient of \(x_1\cdots x_6\), which is \(720T\). Thus
\[
720T=\sum_{S\subseteq[6]}(-1)^{6-|S|}\operatorname{tr}(M_S^6).
\]
The trace of a sixth power of a self-adjoint matrix is nonnegative. Drop the terms with positive sign; because \(M_{S^c}=-M_S\), the remaining negative terms consist of twice the singleton terms and once every triple term. Also
\[
\operatorname{tr}(M_S^6)\le \|M_S\|_{\mathrm{HS}}^6
\le \left(\frac{|S|(6-|S|)}d\right)^2\|M_S\|_{\mathrm{HS}}^2.
\]
The sum of \(\|M_S\|_{\mathrm{HS}}^2\) over triples is \(6E\): each single-matrix square appears ten times, and each pair cross term appears four times; the sum over all pair cross terms is \(-E\) by \(\sum_iM_i=0\). Consequently the negative contribution is at most \((2\cdot25+6\cdot81)E/d^2\). This proves (2). It uses a one-sided bound on the average over orders, not an absolute bound on each individual order.

## Apply to the invariant color operators

Put a fractional amount \(1/6\) of each color on every diagonal pair. This gives symmetric kernels \(W_i\) on the \(n\) vertices with values in \([0,1]\), row mean \(1/6\), and sum one on every pair. It leaves the count on distinct vertices unchanged. Let \(P_i\) have entries \(6W_i(x,y)/n\), and let \(J_0\) be the projection onto constants. Set \(B_i=P_i-J_0\). Then \(\sum_i B_i=0\). Also
\[
\|B_S\|_{\mathrm{HS}}^2
=\frac1{n^2}\sum_{x,y}\bigl(6W_S(x,y)-|S|\bigr)^2
\le |S|(6-|S|).
\tag{3}
\]
This follows from \(0\le W_S\le1\) and average \(W_S=|S|/6\). In particular \(\sum_i\|B_i\|_{\mathrm{HS}}^2\le30\).

Each \(B_i\) commutes with the permutation representation of the color-preserving group \(\Gamma\). Use its unitary isotypic decomposition over \(\mathbb C\): on the summand for an irreducible representation \(\pi\) of dimension \(d_\pi\), the operator is \(I_{d_\pi}\otimes M_i(\pi)\). The contribution to (3) from this summand is \(d_\pi\|M_S(\pi)\|_{\rm HS}^2\). Thus these multiplicity-space matrices satisfy (1) with \(d=d_\pi\). Transitivity gives exactly one trivial copy, already removed from the \(B_i\).

On a nonlinear summand with \(d_\pi\ge5\), (2) controls the averaged trace contribution by at worst a negative constant times its energy. Specifically
\[
\frac{536}{720d_\pi^2}\le \frac{536}{720\cdot25}<
\frac16(2/3)^4.
\tag{4}
\]

For a one-dimensional nontrivial character \(\chi\) occurring in the permutation representation, let \(H\) be the stabilizer of one vertex. Its multiplicity is one, and it is trivial on \(H\): the eigenvector is determined by a nonzero value at the base vertex and equivariance. Thus \(\chi\) has odd order dividing \([\Gamma:H]=n\). In the base row the eigenvalues \(a_i\) are real and given, up to conjugating the character, by the average of \(6W_i\chi\) on the orbit. Since the row kernels sum to one, 
\[
\frac16\sum_i |a_i|\le \mathbb E_{g\in\Gamma}|\Re\chi(g)|\le2/3
\]
by [the odd-order cosine estimate](FOURIER-CAYLEY.md). Consequently \(\prod_i|a_i|\le(2/3)^4\sum_i a_i^2/6\), so the same negative coefficient as in (4) works for one-dimensional summands too.

In the permutation operator trace, each multiplicity-space trace is weighted by \(d_\pi\). Summing all lower bounds and all their Hilbert–Schmidt energies now gives
\[
\frac1{720}\sum_{\sigma}\operatorname{tr}\!\left(
 B_{\sigma(1)} B_{\sigma(2)}\cdots B_{\sigma(6)}\right)
\ge-\tfrac16(2/3)^4\sum_i\|B_i\|_{\mathrm{HS}}^2
\ge-\frac{80}{81}.
\]
Replacing \(B_i\) by \(P_i=J_0+B_i\) adds exactly one to each ordered trace; all mixed terms with \(J_0\) vanish. Therefore the average of the ordered rainbow walk densities is at least \(6^{-6}/81\). Labeled vertex tuples with a repetition are at most \(\binom62 n^5\), before imposing colors. Discarding them shows that the asserted order \(n^6\) of genuine rainbow cycles holds for large \(n\).

## Why every regular group action meets the dimension condition

For a regular group action \(|\Gamma|=n=6t+1\). The degrees of its complex irreducible representations divide the group order; since the order is coprime to six, there are no irreducible degrees \(2,3,4\). This verifies exactly the hypothesis used above. The argument also applies if the full graph automorphism group is larger; only the chosen color-preserving action matters.

This improves the [normal-only result](FOURIER-CAYLEY.md) and removes the degree-five obstruction there. That earlier result gave positivity for every prescribed order; the present theorem only needs and proves a bound on the average over orders. The [connected compact abelian theorem](CONNECTED-CAYLEY.md) independently treats all numbers of colors at least three. Searches using regular actions, nonabelian Cayley colorings, the original [Erdős–Tuza chapter](https://doi.org/10.1016/S0167-5060(08)70377-7), and related association-scheme literature did not identify an earlier result with the full regular-action scope. Coordination: [issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
