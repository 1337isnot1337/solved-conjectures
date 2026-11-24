# Marcus–de Oliveira conjecture: acyclic local-unitary composition

2026-11-24. Partial theorem for arbitrary order, not a resolution of the unrestricted named conjecture. No novelty or priority claim. This is a distinct continuation of the composition obstacle in issue #57, released by its previous workers.

## Target and source screen

Marcus (1973), *Derivations, Plücker relations and the numerical range*, Indiana Univ. Math. J. 22, 1137–1149; de Oliveira (1982), *Research problem: Normal matrices*, Linear Multilinear Algebra 12, 153–154: for all complex normal matrices A,B of order n with eigenvalues a_i,b_i, respectively,

~~~math
\det(A+B)\in\operatorname{conv}\left\{\prod_{i=1}^n(a_i+b_{\sigma(i)}):\sigma\in S_n\right\}.
~~~

The 2025 survey by Bebiano and da Providência (https://doi.org/10.3390/math13050711) and the July 2026 primary paper by Mulero-Martínez (https://doi.org/10.1016/j.laa.2026.03.019, publisher abstract) explicitly retain the unrestricted problem. Searches on 24 November for Marcus de Oliveira proof/counterexample 2026, Givens rotations, Hessenberg, tree/forest factorization, and squared compound minors found no unrestricted solution or exact match for the forest theorem below. This is a bounded screen, not proof of novelty. Drury, *The determinantal conjecture and Hadamard type inequalities*, https://doi.org/10.1016/0024-3795(94)00361-0, describes the failure of the stronger simultaneous compound-coupling conjecture; Drury's all-order Householder theorem (https://doi.org/10.1016/S0024-3795(99)00173-1) is not being rediscovered or used as a general composition theorem. The September 2026 Holden work (https://clopen.solutions/submissions/openproblemsinnla-holden-mi05-2026-09-13-report/v1/) also treats compound-weight obstructions and positive regions. The previously refuted Kovačec polygon strengthening is distinct.

The significance is a sufficient condition on relative eigenbases, independent of both spectra, and valid at unbounded order. In contrast to direct sums of small-order solutions, the factors below may have overlapping supports and the full unitary can couple all coordinates.

## Definitions

For an n-by-n unitary U, and k-subsets I,J of [n], let Q_k(U)_{I,J}=|det U[I,J]|^2, with the empty minor equal to 1. Call a unitary **couplable** if there is a probability measure mu on S_n such that for every k,I,J simultaneously,

~~~math
Q_k(U)_{I,J}=\sum_{\pi\in S_n}\mu(\pi)\mathbf 1_{\pi(J)=I}.
~~~

This is the classical simultaneous compound-permutation representation, not a new definition of the original conjecture. In general it fails; it implies the determinantal convex-hull statement.

A local unitary on C subset [n] acts as an arbitrary unitary on the coordinate span indexed by C and as identity elsewhere. For an ordered list C_1,...,C_m, form the undirected bipartite incidence graph with one vertex for each coordinate, one vertex for each indexed factor (even if some supports coincide), and edge v--t precisely when v is in C_t.

## Theorem: closure on an incidence forest

Suppose U=U_m ... U_1 where U_t is local on C_t and its restriction to C_t is couplable. If the incidence graph is a forest, then U is couplable. In fact one may choose independent random local permutations pi_t with the prescribed local coupling laws, extended by the identity outside C_t, and take pi=pi_m ... pi_1.

In particular, the determinantal conjecture holds for any pair of normal matrices whose relative eigenbasis U has a factorization into such local factors on supports of size at most three, in any order, with an acyclic incidence graph. This includes all products of arbitrary two-coordinate unitaries along the edges of a forest, each edge used once, in arbitrary temporal order. Left/right diagonal unitary factors and coordinate permutations may also be added.

### Proof

Fix k, initial k-subset J and final k-subset I. By Cauchy–Binet (equivalently multiplication of exterior powers),

~~~math
\det U[I,J]
=\sum_{S_0=J,S_m=I}\prod_{t=1}^m\det U_t[S_t,S_{t-1}],
~~~

where every S_t is a k-subset. Every nonzero term has S_t outside C_t equal to S_{t-1} outside C_t, because U_t is the identity off the block with zero cross-block entries. Also the number of occupied coordinates inside C_t is conserved. Call a subset path *admissible* if it meets these two conditions, whether its amplitude is nonzero or zero.

For each incidence edge (t,v) define the integer transfer

~~~math
x_{tv}=\mathbf 1_{v\in S_t}-\mathbf 1_{v\in S_{t-1}}.
~~~

It lies in {-1,0,1}. At factor vertex t its sum over incident v is zero; at coordinate vertex v its sum over incident t is the fixed endpoint difference 1_{v in I}-1_{v in J}, by telescoping and zero changes at nonincident factors. Hence if two admissible paths exist, the differences of their edge transfers satisfy zero sum at every vertex of the incidence forest. Such an edge array is zero: remove a leaf, whose sole edge is forced to be zero, and induct on the number of edges. Isolated vertices are harmless. Thus all transfers agree. The initial subset and the ordered transfers uniquely reconstruct each intermediate occupancy, so there is at most one admissible path.

Therefore squaring the Cauchy–Binet formula introduces no cross terms, including when every term is zero:

~~~math
Q_k(U)_{I,J}=\sum_{S_0=J,S_m=I}\prod_t Q_k(U_t)_{S_t,S_{t-1}}.
~~~

For a single local factor U_t, an outside-subset mismatch makes both its compound minor and the corresponding permutation probability zero. If outside subsets match, the determinant equals, up to a sign from reordering, the local minor, since the outside identity block splits off. The squared modulus thus equals Pr(pi_t(S_{t-1})=S_t) by local couplability, including empty and full local subsets. Independence of the pi_t then makes the displayed sum precisely Pr(pi_m ... pi_1(J)=I). The law is independent of k,I,J. This proves the theorem.

For a unitary block of order d<=3, the matrix (|U_ij|^2) is doubly stochastic, so the Birkhoff–von Neumann theorem gives a probability law for the singleton transitions. The complementary minor identity for a unitary gives |det U[I,J]|=|det U[I^c,J^c]| (Jacobi's identity, using U^{-1}=U* and |det U|=1). At d<=3 this handles every remaining nontrivial minor via its singleton complement, and the size-0 and size-d conditions hold automatically. The same permutation law therefore works at all sizes. This argument explicitly requires d<=3; ordinary Birkhoff decomposition does not imply the assertion for arbitrary d.

Finally let D_a=diag(a_i), D_b=diag(b_j). Expanding the determinant in principal minors of UD_bU* and applying Cauchy–Binet gives the polynomial identity

~~~math
\det(D_a+UD_bU^*)=\sum_{|I|=|J|}\left(\prod_{i\notin I}a_i\right)\left(\prod_{j\in J}b_j\right)Q_{|I|}(U)_{I,J}.
~~~

Substitute the common probability law for Q. For each fixed permutation pi, the resulting sum is

~~~math
\sum_I\left(\prod_{i\notin I}a_i\right)\left(\prod_{j\in \pi^{-1}(I)}b_j\right)=\prod_i(a_i+b_{\pi^{-1}(i)}).
~~~

Consequently the desired determinant is its expectation, hence belongs to the conjectured convex hull. No invertibility, simplicity of spectra, realness or sign conditions are needed. All normal pairs admit the stated diagonal form after simultaneous conjugation; the partial theorem requires a forest factorization of their relative eigenbasis. Diagonal unitary phases do not change squared minors, and multiplying by permutation matrices only relabels the endpoints and the permutation law.

## Additional bound for interaction cycles

For arbitrary incidence graph with cycle rank r = |E|-|V|+number of components, choose a spanning forest and its r deleted edges. Two transfer arrays agreeing on those edges must agree everywhere by the same leaf argument. Each deleted edge can take three values, so for fixed J,I there are at most 3^r admissible paths. Under the same local couplability hypothesis (but without forest assumption), let pi be the product of independent local random permutations. Cauchy–Schwarz applied to the at most 3^r Cauchy–Binet summands gives the exact universal bound

~~~math
Q_k(U)_{I,J}\leq 3^r\Pr(\pi(J)=I).
~~~

In particular every nonzero compound transition is supported by the classical product law, even when path interference prevents equality. This is not a convex-hull proof for r>0; the factor 3^r and possible signed/complex interference cannot be discarded.

## Proof audit and limits

- Time order is essential in reconstruction and is arbitrary but fixed. The proof uses the incidence graph of factors, not the support graph of the final matrix, and treats repeated factor occurrences separately.
- The zero-sum leaf argument establishes uniqueness of intermediate subsets, not uniqueness of a permutation realization; the latter is unnecessary. Multiple within-block permutations are already summed in the local probability law.
- Cauchy–Binet is applied to minors of a product, not to a product of entrywise absolute squares. Equality after squaring is justified only by uniqueness of admissible paths; the general multiplication rule is false.
- For local 3-by-3 blocks the complementary-index rule is for unitary matrices and works for complex phases. The proof does not assume entrywise nonnegativity or reality.
- The final polynomial identity uses every minor size, including 0 and n, and uses the inverse permutation in the product. It remains valid at singular determinant values and repeated eigenvalues.
- Forestness is a sufficient condition, not necessary. Repeated rotations in the same two-dimensional plane can be combined, for example. A general unitary has no known factorization of the required type; if every unitary admitted such a factorization, the disproved simultaneous-coupling assertion would follow. The general Marcus–de Oliveira conjecture remains open.
- Priority is unestablished. The mathematical proof is self-contained apart from standard Birkhoff, Jacobi and Cauchy–Binet identities; the literature screen is not exhaustive. No claim of Lean verification or independent external review. This note belongs on research, not the solved-results table.

A natural next step is to control interference on a single incidence cycle using the special coefficient structure (a_i+b_j) rather than requiring the stronger common law. The displayed cycle-rank bound alone is insufficient.
