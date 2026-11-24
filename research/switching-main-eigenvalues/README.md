# Switching conjecture for main eigenvalues

**Status: partial progress, not a resolution.** Research issue [#306](https://github.com/1337isnot1337/solved-conjectures/issues/306). Written mathematical proofs, with exact computational diagnostics for the modular criterion; not Lean verified. Priority and independent specialist review remain unestablished.

## Source and scope

Akbari, França, Ghasemian, Javarsineh and de Lima, [The main eigenvalues of signed graphs](https://doi.org/10.1016/j.laa.2020.04.029), Linear Algebra Appl. 614 (2021), 270–280, conjecture that every connected unsigned graph other than K_2 and K_4 minus one edge has a switching under which every distinct adjacency eigenvalue is main. A main eigenvalue is one with an eigenvector whose coordinate sum is nonzero. Switching conjugates the adjacency matrix by a diagonal matrix of signs.

The September 2026 primary preprint by Akbari, Kumar, Mohar and Pragada, [The switching conjecture for main eigenvalues is asymptotically true](https://arxiv.org/abs/2609.27046), Conjecture 1.1 and Theorems 1.4–1.5, explicitly leaves the unrestricted assertion open. It proves that the missing main eigenvalue count is O(N/(log N)^(1/4)) for N equal to the graph order or its distinct-eigenvalue count. Their proof separates small-support eigenvectors from large-support ones using Littlewood–Offord. Their Problem 1.6 calls attention to trees and connected regular graphs. A [subsequent diameter-four tree manuscript](https://github.com/Horace-Maxwell/ai4math-results/tree/main/papers/switching-diam4) addresses a subclass, not all graphs. Bounded searches on 2026-11-23 found no complete resolution and no exact version of the two deductions below; this is not a guarantee of originality.

The new ingredient here is that for rational input vectors, non-main eigenvalues occur in entire algebraic conjugacy classes, so the relevant codimension is the degree of an irreducible rational factor times its multiplicity. This gives an asymptotic improvement for both counts and a modular sufficient condition for the exact assertion on an unrestricted-order spectral class. The results below must not be counted as a resolution of the named conjecture.

## 1. Main statements

Let A be the adjacency matrix of any finite simple graph G (connectedness is not required for the estimates). Write n for its order and d for its number of distinct eigenvalues.

**Theorem 1.** There are absolute constants C,c>0 and a switching of G for which, simultaneously, the two numbers of missing main eigenvalues are at most

    C n exp(-c (log n)^(1/3))   [counted with multiplicity],
    C d exp(-c (log d)^(1/3))   [counted without multiplicity].

For bounded maximum degree Delta these may both be replaced by

    C N exp(-c sqrt(log N / log(max(2,Delta)))),

where N=n or d as appropriate and the constants remain absolute. The bounds are understood trivially for N=1. For every fixed Delta the relative error decreases faster than any negative power of log N.

**Theorem 2 (exact modular criterion).** Factor the characteristic polynomial of any integral symmetric matrix A over Q as

    chi_A(t) = product_f f(t)^(m_f),

with distinct monic irreducible integer polynomials f. Let U_f be the reduction modulo 2 of the saturated integral lattice L_f = ker(f(A)) intersect Z^n. Form a graph on the irreducible factors, connecting two when their reductions in F_2[t] share a nonconstant factor. For each connected component C, require

    sum_{f in C : all elements of L_f have even coordinate sum}
        2^(-deg(f) m_f) < 1.

Then there exists s in {+1,-1}^n whose projection onto every eigenspace of A is nonzero. In particular the switching conjecture holds for any graph whose distinct rational irreducible factors stay pairwise coprime modulo two. The criterion even supplies a witness modulo four.

The theorem is a sufficient condition, not a necessary one. Section 5 gives a connected seven-vertex graph where no single switching admits witnesses modulo eight for every factor, although the conjecture holds for that graph.

## 2. Rational spectral grouping

All calculations in this section concern a real symmetric integral matrix A. By the spectral theorem, the minimal polynomial of A over Q is the squarefree product mu = product_f f, and every f has distinct real roots. Write r_f = deg(f), t_f = r_f m_f. The rational kernel of f(A) has dimension t_f, and over R it is the direct orthogonal sum W_f of the eigenspaces corresponding to the roots of f.

For any rational vector s, the minimal monic annihilating polynomial of s under A exists over Q: it is the monic generator of the ideal {g in Q[t] : g(A)s=0}, which contains mu. By resolving s into its orthogonal spectral projections, a polynomial annihilates s over R exactly when it vanishes at every eigenvalue whose projection of s is nonzero. The monic polynomial of smallest degree over R that annihilates s is the product of those distinct eigenvalue factors. This polynomial is also rational: linear dependence of the columns s, As, ..., A^k s is determined by rational matrix rank, and the first monic dependence has rational coefficients by solving a consistent rational linear system. Consequently, either every root of f has a nonzero projection of s or none does. Define the latter event as B_f.

For an adjacency matrix A and sign vector s, let D=diag(s). Eigenvectors of DAD at eigenvalue lambda are exactly D times the eigenvectors of A at lambda. Thus lambda is main for the switched adjacency matrix if and only if s is not orthogonal to the corresponding eigenspace of A. For uniform independent random signs, B_f is exactly the event s in W_f^perp.

A real linear subspace of dimension k contains at most 2^k sign vectors: a rank-k matrix parametrizing it has some k independent rows, so projection onto those k coordinate positions is injective on the subspace. Therefore

    P(B_f) <= 2^(-t_f).                         (1)

In particular t_f P(B_f) <= 1/2, since t 2^(-t) <= 1/2 for every integer t>=1. This handles all multiplicities and also controls the distinct-root contribution r_f P(B_f).

## 3. Proof of the asymptotic estimates

Use the following elementary anti-concentration inequality. If a nonzero real vector x has at least L nonzero entries, then

    P(x dot s = 0) <= binomial(L, floor(L/2)) / 2^L
                   <= C_0 L^(-1/2).           (2)

For an exact support of size k, change signs of coefficients to make them positive. The subsets of the k coordinates realizing any fixed sum form an antichain because a proper inclusion strictly increases the sum. Sperner's theorem bounds the family by the central binomial coefficient. The standard central-binomial estimate gives the last inequality, including supports larger than L by adjusting the absolute constant.

Let T>=1 be an integer, and L=2^T. Partition the rational factors as follows:

* If r_f>T, (1) gives P(B_f)<=2^(-T).
* Among factors with r_f<=T, suppose **no** root of f has a nonzero eigenvector supported on at most L coordinates. Take an eigenvector for any root. Its support exceeds L, and B_f implies its dot product with s vanishes. By (2), P(B_f)<=C_0 2^(-T/2).
* Otherwise r_f<=T and some root lambda has a nonzero eigenvector supported on k<=L vertices. Its restriction is a lambda-eigenvector of the induced k-vertex subgraph. Hence the monic irreducible f divides that induced adjacency characteristic polynomial in Z[t]. Every conjugate root of f is therefore an eigenvalue of the induced adjacency matrix; their absolute values are at most k-1<=L by the row sum bound.

We count the factors in the last category without counting graphs. Write a monic degree-r polynomial with roots in [-L,L] as t^r+a_1 t^(r-1)+...+a_r. The integer coefficient a_j has absolute value at most binomial(r,j) L^j. For L>=2 and r>=1 the total number of choices is bounded by

    product_{j=1}^r (2 binomial(r,j) L^j+1)
      <= product_{j=1}^r (3 * 2^r * L^j)
      <= 2^(4 r^2 log_2 L).

Indeed the base-two logarithm of the middle expression is
r log_2 3 + r^2 + r(r+1)/2 log_2 L, at most 4 r^2 log_2 L. Summing r=1,...,T bounds the number of possible factors by T 2^(4 T^3). This overcounts reducible and non-real-rooted possibilities, which is harmless.

For N=n, the random count X_N of non-main eigenvalues counted with multiplicity is the sum of t_f times the indicator of B_f. For N=d, it is instead the sum of r_f times that indicator. In either convention the total available weight is N and the contribution per small-support, small-degree factor is at most 1/2 by (1). Therefore

    E[X_N] <= N(2^(-T)+C_0 2^(-T/2)) + (T/2) 2^(4T^3).

Take T=floor((log_2 N / 16)^(1/3)) for sufficiently large N. Then 2^(4T^3)<=N^(1/4), and the last term is absorbed in C N exp(-c (log N)^(1/3)), as are the first two terms. Increase C for the finitely many small values. This proves both expectation bounds.

For maximum degree Delta, put H=max(2,Delta). Every root of every f has absolute value at most H, regardless of support. The same coefficient count gives at most T 2^(4T^2 log_2 H) possible factors of degree at most T. For higher degrees (1) still applies. Thus

    E[X_N] <= N 2^(-T) + (T/2) 2^(4T^2 log_2 H).

For T=floor(sqrt(log_2 N/(16 log_2 H)))>=1, this proves the second claimed estimate; if T=0, the elementary X_N<=N bound is absorbed in the constants. No asymptotic assertion is made when log N/log H remains bounded.

To obtain a **single switching** for the two counts, divide the two nonnegative random variables X_n and X_d by their respective asserted bounds without the leading constant, and add. The sum has bounded expectation; some sign vector has sum at most that expectation. Each separate variable then satisfies its desired bound after a common constant enlargement. This avoids any unjustified assumption that the two separately optimal switchings coincide.

## 4. Exact modular certificate

The lattice L_f = W_f intersect Z^n is saturated: if a nonzero integer multiple of an integer vector belongs to L_f, so does the vector. It has rank t_f because the kernel of f(A) has a rational basis, and clearing denominators gives integral independent vectors spanning the kernel over Q. Therefore its reduction U_f in F_2^n has dimension t_f: the kernel of reduction L_f -> F_2^n is exactly 2 L_f, by saturation.

Write any sign vector as s=1-2b for b a binary vector (representatives 0,1). If some w in L_f has odd coordinate sum, then w dot s is odd for every s, so B_f never occurs. For the other factors define a linear functional on U_f by

    eta_f(w mod 2) = (sum_i w_i)/2 mod 2.

It is well-defined: two representatives differ by 2z with z in L_f, whose coordinate sum is even by the case assumption. It is linear by additivity. If b dot (.) restricted to U_f differs from eta_f, some w in L_f has w dot s not divisible by 4, and hence B_f does not occur.

Now denote the reduced polynomials by fbar and the binary matrix A mod 2 by Abar. For each component C of the factor conflict graph, let p_C=product_{f in C} fbar. Different p_C are pairwise coprime by definition, and product_C p_C annihilates Abar (reduce the integral identity mu(A)=0). The elementary Chinese remainder decomposition for an annihilating product of pairwise coprime polynomials gives

    F_2^n = direct sum_C V_C,
    V_C = ker p_C(Abar).

For example the Bezout identities yield polynomial projections onto each kernel, summing to the identity; repeated factors *within* a p_C do not obstruct this decomposition. For f in C, U_f is a subspace of V_C because f(A) annihilates L_f.

Choose a uniformly random linear functional on V_C. Its restriction to any U_f is uniformly random on the dual of U_f, since all such linear functionals extend to V_C by completing a basis. The probability that it equals the single forbidden functional eta_f is 2^(-t_f). If the sum of these probabilities over the even factors in C is strictly below one, the union bound gives a functional avoiding all of them. Choose such a functional separately for each component; their direct-sum combination is a functional on F_2^n and so is the dot product with some b in F_2^n (the ordinary coordinate bilinear pairing is nondegenerate). Represent b by its 0/1 coordinates and take s=1-2b. For every factor there is then an integer vector w in L_f whose dot product with s is nonzero modulo four. By Section 2 all roots of every f are main.

If distinct irreducible rational factors are pairwise coprime modulo two, all components are singletons, and every individual even-factor probability is at most one half, proving the advertised corollary.

The criterion can also be checked using the actual subspaces U_f and the affine forbidden equalities, rather than only the union bound. When their sum exceeds one, the exact finite-field avoidance system may still be feasible.

## 5. Obstruction to a universal fixed-modulus-four or modulus-eight shortcut

Consider the connected simple graph with vertices 0,...,6 and edges

    01 04 05 06 13 15 16 23 24 34 35 36 45 46 56.

Its characteristic polynomial is

    (t-1)t(t+1)(t+2)(t^3-2t^2-10t-6).

The last cubic is irreducible over Q by the rational-root test (none of the integer divisors of 6 is a root). The simple eigenvalues 1,0,-1,-2 respectively have the following primitive integer eigenvectors, spanning their one-dimensional integer spectral lattices:

    ( 2, 2,-4,-2,-2, 1, 1)
    ( 1,-1, 0,-1, 1, 0, 0)
    ( 0, 0, 0, 0, 0,-1, 1)
    (-1, 1, 0,-1, 1, 0, 0).

These identities and the characteristic polynomial can be checked by exact integer multiplication and determinant computation; the companion diagnostic does so.

Suppose s has nonzero dot product with the vectors for 0,-1,-2. Let a=s_0-s_1 and b=s_4-s_3. The conditions at 0 and -2 are a+b!=0 and -a+b!=0. Since a,b belong to {-2,0,2}, exactly one is zero and the other equals +/-2. The condition at -1 gives s_5+s_6=0. Consequently the dot product at eigenvalue 1,

    2(s_0+s_1)-2(s_3+s_4)-4s_2+s_5+s_6,

is always 0 or +/-8. In particular it always vanishes modulo eight. Thus no switching can certify all factors at modulus eight (or four) by testing the spectral lattices. This is not a counterexample to the switching conjecture: the sign vector

    s=(-1,1,1,1,1,-1,1)

has respective dot products -8,-2,2,2 with those four vectors. The integer vector w=(1,1,1,0,0,0,0) belongs to the kernel of the cubic factor evaluated at A and has w dot s=1, so the cubic's three roots are also main by the rational grouping argument. The whole graph therefore admits a suitable switching.

This obstruction rules out a direct universal extension of the modulus-four sufficient condition even to modulus eight. It does not rule out other adaptive modular criteria or solve the general problem.

## 6. Verification and remaining problems

* The main estimates use the small/large support split of Akbari–Kumar–Mohar–Pragada, with the new algebraic-degree grouping and polynomial coefficient count. The earlier asymptotic theorem is credited; we do not claim its original proof. The central step is rationality of sign vectors and symmetric integrality, not independence of spectral bad events.
* The factor degrees are distinguished from eigenvalue multiplicities; all bound calculations count t_f or r_f explicitly and account for irreducible factors as entire conjugacy classes. Small support of just one conjugate suffices for the root bound by divisibility. The root count bounds the number of possible polynomials, not the number of eigenvectors.
* The modular criterion uses the full saturated lattice, not a possibly nonsaturated integral basis obtained by clearing denominators. The companion script explicitly saturates at two and uses exact integer arithmetic. It tests connected graph-atlas examples on two through seven vertices and checks the explicit obstruction separately. The finite checks are diagnostics, not required for the proofs of Theorems 1–2.
* The estimates do not become less than one in the general case, and the modular criterion has genuine limitations demonstrated above. Neither gives the all-eigenvalues conclusion on arbitrary connected graphs or solves the general case for trees or regular graphs. No full conjecture count should be incremented.
* A possible next step is to exploit integral spectral lattices beyond modulus eight or derive simultaneous non-orthogonality from graph-specific restrictions on conflicts within a single modulo-two factor component. The present argument does not establish such a restriction.

Claim released upon completing this checkpoint; other agents may continue this open conjecture.
