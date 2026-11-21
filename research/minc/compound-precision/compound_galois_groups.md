# Characteristic polynomial of permanental compounds

Let \(P_k(A)_{I,J}=\operatorname{per} A[I,J]\) for \(k\)-subsets \(I,J\) of \([n]\). Over the rational function field of the entries of a generic symmetric arrowhead matrix, the splitting fields of the characteristic polynomials of \(P_1(A),\ldots,P_{n-1}(A)\) are linearly disjoint. Each has the full symmetric Galois group on its roots. The hub of the arrowhead is fixed in advance. There are only \(2n-1\) independent parameters.

Consequently, even after adjoining **all eigenvalues of all the other compounds**, a generic \(k\)th compound eigenvalue has degree \(\binom nk\) and cannot be written by radicals if \(\binom nk\ge5\). The same statements hold for the generic symmetric matrix and the generic unrestricted matrix. This narrows possible exact spectral formulas for Minc's Problems 17 and 18. It gives no lower bound against characteristic-polynomial algorithms or approximation algorithms. [Problem 17](https://yair-lavi.com/mincs-list/problem-17/) · [Problem 18](https://yair-lavi.com/mincs-list/problem-18/)

## Labels at a diagonal matrix

Work over \(\mathbb C\) first. Choose a positive diagonal base matrix with multiplicatively independent entries \(d_\ell\), for instance distinct primes. Write \(d_S=\prod_{\ell\in S}d_\ell\). The eigenvalues of each compound at the base matrix are simple and labelled by its subsets \(S\). Eigenvalues of different degrees are also distinct. A loop in the complex arrowhead parameter space avoiding the discriminants permutes the labels within each degree. We will construct a loop with just one transposition in just one degree.

Fix the hub \(i\), a leaf \(j\), and any subset \(T\subseteq[n]\setminus\{i,j\}\). The desired swap exchanges \(Ti=T\cup\{i\}\) and \(Tj=T\cup\{j\}\). Keep leaf \(j\) disconnected initially, put \(a=A_{jj}\), and write \(D\) for the complementary principal matrix. In degree \(k\), the compound splits into the two diagonal blocks
\[
P_k(D),\qquad aP_{k-1}(D).
\]
An absent block is omitted, and \(P_0(D)=[1]\). Near the diagonal let \(\lambda_S(D)\) denote the simple eigenvalue of the appropriate compound of \(D\) continuing \(d_S\), including \(\lambda_\varnothing=1\). At diagonal \(D\), the crossings at \(a=d_i\) are exactly the pairs \(Ui,Uj\) over subsets \(U\subseteq[n]\setminus\{i,j\}\). This follows by comparing the exponents of the independent \(d_\ell\). In particular no cross-degree equality occurs there.

## Separating all crossings

Turn on small real symmetric spokes \(D_{ih}=D_{hi}=x_h\) for \(h\ne i,j\). The crossing of the two labels indexed by \(U\) now occurs at
\[
r_U(x)=\frac{\lambda_{Ui}(D)}{\lambda_U(D)}.
\]
These are analytic near \(x=0\). They are pairwise distinct as analytic functions, even when \(U\) ranges over all cardinalities.

To see this, turn on only the spoke to a specified leaf \(h\) and put \(s=x_h^2\). In the \(i,h\) block the two single-occupancy eigenvalues expanding from \(d_i,d_h\) are respectively
\[
d_i+\frac{s}{d_i-d_h}+O(s^2),\qquad
d_h-\frac{s}{d_i-d_h}+O(s^2).
\]
Double occupancy contributes the permanent \(d_i d_h+s\). All other factors in the ratio cancel. If \(h\notin U\), the coefficient of \(s\) in \(r_U\) is \(1/(d_i-d_h)\). If \(h\in U\), divide \(d_i d_h+s\) by the branch expanding from \(d_h\). The coefficient is
\[
\frac{1}{d_i-d_h}+\frac{2}{d_h}.
\]
A leaf in the symmetric difference of two subsets distinguishes their ratios. Since there are finitely many subsets, choose an arbitrarily small real \(x\) off the zero sets of all their pairwise differences. Each group of a priori simple eigenvalues of \(D\) stays simple. All other possible crossings remain away from a sufficiently small neighborhood of \(d_i\), by continuity and finiteness.

We can travel from the base point to the chosen \(D\) with \(a=d_j\), keeping the original labels by taking \(x\) sufficiently small. We can then move \(a\) in the complex plane at fixed \(D\) to near \(a_*=r_T(x)\), avoiding the finite set of singular values. Throughout this latter move, the branches are either constant or \(a\lambda_S(D)\), so their labels are explicit.

## One isolated transposition

At \(a_*\) just the two specified eigenvalues coincide. Their common value is semisimple, with one real unit eigenvector in each block. Reconnect leaf \(j\) by setting \(A_{ij}=A_{ji}=t\). Put \(u=a-a_*\), \(\mu=\lambda_T(D)\), and let \(c\) be the matrix element of \(\partial_t P_{|T|+1}(A)\) between those unit eigenvectors at \(t=u=0\). The two diagonal blocks have zero first derivative in \(t\). Indeed, a submatrix using \(j\) on both sides either uses its diagonal entry or uses both spokes, and one using \(j\) on neither side does not see the spoke. At diagonal \(D\), with the eigenvectors chosen consistently, the off-block first derivative is \(d_T\), from matching \(i\) to \(j\) and fixing \(T\). Thus \(c\ne0\) for the chosen sufficiently small \(x\), and \(\mu\ne0\) as well.

For completeness, isolate the two-dimensional spectral space by integrating the resolvent on a small circle around the double eigenvalue. Projecting the two base eigenvectors gives an analytic basis near \((u,t)=(0,0)\). The first derivative of the resulting two-dimensional operator is the compression of the original derivative, since its constant term acts as a scalar there. In this basis the linear term is
\[
\begin{pmatrix}0&ct\\ct&\mu u\end{pmatrix}.
\]
The discriminant of its analytic quadratic characteristic factor therefore equals
\[
\Delta(u,t)=\mu^2u^2+4c^2t^2+O\big((|u|+|t|)^3\big).
\]
After setting \(u=tv\), the function \(\Delta(tv,t)/t^2\) extends holomorphically to \(t=0\) and has two simple zeros in \(v\) there. The implicit function theorem gives two distinct simple zeros in \(u\) for each sufficiently small nonzero \(t\). A small circle about one zero changes the sign of the square root of \(\Delta\). Precisely these two eigenvalues are exchanged. Every other eigenvalue is simple throughout a neighborhood of the original double point. The local circle can be joined to the incoming path in the complement of the analytic discriminant, which is locally path connected around these two sheets (one can first fix a nearby regular \(u\), turn on \(t\), and then vary \(u\) at fixed \(t\)). Returning along the reverse path gives the required transposition at the original base point. The resolvent argument is standard finite-dimensional analytic perturbation theory. [Kato, Chapter II](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kato1.pdf)

## Group and arithmetic consequences

For fixed \(k\), make a graph on the \(k\)-subsets by connecting any two differing by an exchange of the hub and a leaf. This graph is connected because the star transpositions \((i,j)\) generate \(S_n\), whose action on \(k\)-subsets is transitive. The individual edge transpositions of a connected graph generate the symmetric group on its vertices. Each loop fixes every root outside its one pair, so we obtain the full **direct product**
\[
\prod_{k=1}^{n-1}S_{\binom nk}.
\]
No larger group is possible since the polynomials are individually defined over the base field. Analytic continuation preserves all algebraic relations over the rational function field, so these monodromy permutations act on the splitting field. Equivalently one can view its elements as germs near the regular diagonal point, permitting meromorphic germs for rational functions. This gives the result over both \(\mathbb C\) and \(\mathbb Q\). The same loops lie in the larger spaces of symmetric and unrestricted matrices and preserve precisely the same root labels there. [Leykin and Sottile on monodromy and Galois groups](https://franksottile.github.io/research/pdf/Galois.pdf)

Projecting away any one factor amounts to adjoining the roots of the other degrees. The remaining group is still the full symmetric group. The normal closure of any one remaining root is its entire splitting field, since the action on the labels is faithful. For degree at least five its Galois group is nonsolvable. At positive real spoke and diagonal parameters, the compound is nonnegative, so its Perron root is one of these eigenvalue branches. This rules out a uniform radical formula for that branch as well.

## A rational example

Take the order-four symmetric matrix with diagonal \((23,7,11,17)\), hub at the first coordinate, and spokes \((2,3,5)\). It is positive definite by strict diagonal dominance. Its three nontrivial compounds have joint Galois group \(S_4\times S_6\times S_4\) over \(\mathbb Q\). In particular its second-compound Perron root cannot be obtained by radicals even when the first- and third-compound eigenvalues are available.

The [exact checker](verify_compound_galois.py) computes the compounds directly from their subpermanents, then factors the three integer characteristic polynomials modulo the primes in the certificate. All recorded reductions are separately squarefree, so the cycle lengths in the three coordinates are realized simultaneously by a Frobenius element of the compositum. Each projection contains a full cycle and a cycle fixing one point and permuting all the others. Hence each projection is doubly transitive. At primes 367, 613 and 487, respectively, raising the corresponding element to the least common multiple of all its odd cycle lengths gives an individual transposition in just the first, second and third coordinate. Conjugating within the group gives every transposition in each individual coordinate by double transitivity. These generate the stated product.

The earlier [degree result](../nov20-independent/compound/perron_algebraic_degree.md) established generic irreducibility for unrestricted matrices. Irreducibility alone yields transitivity, and leaves open the group and dependence among degrees. The literature search covered the primary compound-spectra articles, Minc's companion method, the Cheon–Wanless survey, and searches under permanental compounds, zeon operators, Galois groups, arrowhead matrices and monodromy. The sources checked did not contain this direct-product theorem. Historical priority is unverified. [Al'pina and Al'pin](https://www.mathnet.ru/eng/znsl814) · [Minc](https://doi.org/10.1016/0024-3795(87)90285-0) · [Cheon and Wanless](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf)
