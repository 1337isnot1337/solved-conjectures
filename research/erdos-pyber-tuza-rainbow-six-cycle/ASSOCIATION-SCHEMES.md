# Primitive association-scheme colorings contain rainbow six-cycles

This is a structured partial result for the [Erdős–Pyber–Tuza six-cycle conjecture](README.md), not a resolution for arbitrary balanced colorings.

**Theorem.** Fix \(R\). In a completely balanced six-coloring of \(K_n\), suppose at least four color graphs each belong to the adjacency algebra of a primitive association scheme of rank at most \(R\) on the vertex set. These schemes need not be the same. For sufficiently large admissible \(n\), every ordering of the six colors occurs around a simple cycle. In fact for any prescribed ordering the number of labeled cycles in that order is \((1-o_R(1))((n-1)/6)^6\).

Here a color graph belongs to the algebra if its adjacency matrix is a union of the scheme relations. Primitivity means that no nontrivial equivalence relation is a union of basis relations. The proof uses only the adjacency algebra and does not require that the six color matrices commute.

## Low-rank schemes force individual color mixing

Let \(A\) be the symmetric adjacency matrix of a \(t\)-regular color in such a scheme on \(n\) vertices. Write \(J_0=J/n\) for the projection onto the constants. Every spectral projection of \(A\) is a polynomial in \(A\), so it belongs to the scheme algebra. For each eigenvalue under consideration on the mean-zero space, let \(E\) be its orthogonal projection there. If the eigenvalue is \(t\), subtract \(J_0\) from its full spectral projection; the result still belongs to the algebra. Let \(m=\operatorname{rank}E>0\).

The entries of \(E\) are constant on each basis relation. In particular \(E_{xx}=m/n\). For each vertex \(x\) take \(v_x=\sqrt{n/m}\,Ee_x\), viewed as a unit vector in \(\mathbb R^m\). Since \(E^2=E^T=E\), its Gram matrix is \((n/m)E\). The condition \(v_x=v_y\) is therefore a union of basis relations. It is an equivalence relation. It cannot be the universal relation: if all \(v_x\) were identical then \(\sum_x v_x=\sqrt{n/m}\,E\mathbf1=0\) would contradict their being unit vectors. By primitivity all \(n\) vectors are distinct.

Their off-diagonal inner products take at most \(R-1\) values, none equal to one. If \(S\) is the set of these values, the polynomials
\[
p_x(z)=\prod_{\alpha\in S}(\langle v_x,z\rangle-\alpha)
\]
are linearly independent. Evaluating at \(v_y\) gives zero unless \(x=y\), where the value is nonzero. Since they have degree at most \(R-1\) in \(m\) variables, we have \(n\le\binom{m+R-1}{R-1}\). In particular \(m\to\infty\) uniformly as \(n\to\infty\) at fixed \(R\).

For the corresponding eigenvalue \(\lambda\), \(m\lambda^2\le\operatorname{tr}(A^2)=nt\). At balance \(t=(n-1)/6\), this gives
\[
\|A/t-J_0\|_{\rm op}=O_R(n^{-1/(2R-2)}).
\]
Indeed the binomial bound gives \(m\gg_R n^{1/(R-1)}\) for large \(n\). The same argument works for an undirected graph built by fusing relations of a nonsymmetric scheme.

## Count colored closed walks and discard collisions

For colors \(i=1,\ldots,6\) write \(A_i=t(J_0+B_i)\), where \(B_i\) annihilates constants on both sides, and \(\|B_i\|_{\rm HS}^2=n/t-1=O(1)\). For any order of the colors, the number of compatible labeled closed walks is
\[
\operatorname{tr}(A_1A_2A_3A_4A_5A_6)
=t^6\bigl(1+\operatorname{tr}(B_1B_2B_3B_4B_5B_6)\bigr).
\]
Every mixed term of the expansion vanishes because it contains adjacent \(J_0 B_i\) or \(B_iJ_0\).

Use the Hilbert–Schmidt norm at the two positions not designated mixing, and the operator norm at the four mixing positions. This bounds the absolute trace of the product by the product of the six chosen norms: rotate the trace to start at one Hilbert–Schmidt matrix, cut it at the other, and use Hilbert–Schmidt Cauchy–Schwarz and the two-sided ideal inequality. By the preceding spectral estimate the trace error tends to zero. Walks with any repeated vertex number at most \(\binom62n^5=o(t^6)\), even before any color constraints. The rest are genuine cycles with the specified ordering.

## In particular: every six-class symmetric association scheme

Suppose the six color classes are exactly the six off-diagonal relations of one association scheme, all of valency \(t\), so \(n=6t+1\). This scheme is necessarily primitive for \(t\ge5\). An equivalence relation made of the diagonal and \(k\) of the six classes has blocks of size \(1+kt\). For \(1\le k\le5\) this must divide \(1+6t\); it would then divide \(k(1+6t)-6(1+kt)=k-6\). But \(1+kt>|k-6|\) for \(t\ge5\). This rules out every nontrivial equivalence relation, and the main result applies.

This proof is uniform in all scheme parameters and does not depend on classification or testing finitely many schemes. It also yields a quantitative diagnostic with no scheme assumption: if the product of the mean-zero operator norms for any four colors is strictly below \(1/(n/t-1)\) by a fixed margin, then all color orders occur for large \(n\). General balanced colorings need not satisfy this spectral bound or have any bounded-rank scheme representation.

For context see [Erdős–Tuza’s original paper](https://doi.org/10.1016/S0167-5060(08)70377-7), the [numbered problem](https://www.erdosproblems.com/811), and [Muzychuk–Ponomarenko on pseudocyclic schemes](https://arxiv.org/abs/0910.0682). A bounded search on the exact rainbow-six-cycle statement, association schemes, and the cyclotomic and pseudocyclic literature did not identify this exact partial result. The projection and polynomial arguments above are included rather than treating pseudocyclic results as a dependency.
