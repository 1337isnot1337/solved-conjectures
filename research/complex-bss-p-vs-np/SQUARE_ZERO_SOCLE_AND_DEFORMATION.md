# The square-zero algebra, its socle, and a failed reduced deformation

Status: exact algebraic reformulation and failed incidence constructions. The permanent is a single socle coefficient in a small presented algebra. Complex point tests discard it. Matrix and jet replacements have explicit dimensional costs. A reduced quadratic deformation gives a sound Sigma_2 verifier, but the reviewed moving-finite-challenge theorem excludes generic completeness for all sufficiently large m under the imported permanent border lower bound. No HN_C separation is proved here.

## 1. The exact coefficient in a finite algebra

Let

```math
A_m=\mathbb C[z_1,\ldots,z_m]/(z_1^2,\ldots,z_m^2),
\qquad \omega=z_1\cdots z_m.
```

The squarefree monomials z_S, indexed by subsets of {1,...,m}, form a basis. Thus A_m has dimension 2^m. For an m by m matrix X define the small polynomial

```math
F_X(z)=\prod_{i=1}^{m}\left(\sum_{j=1}^{m}X_{ij}z_j\right),
\qquad
Q_{X,y}(z)=F_X(z)-y\omega.                             \tag{1}
```

Its circuit uses O(m^2) arithmetic operations. Every degree-m monomial except omega contains a square. Expanding the product therefore proves

```math
F_X=\mathop{\mathrm{per}}_m(X)\,\omega\quad\text{in }A_m,
```

and hence

```math
y=\mathop{\mathrm{per}}_m(X)
\quad\Longleftrightarrow\quad
Q_{X,y}\in(z_1^2,\ldots,z_m^2).                       \tag{2}
```

This is ideal membership, with the nilpotent structure retained. The equations z_i^2=0 have only the complex point z=0. At that point Q_X,y=0 for every X,y. Consequently the universal point test

```math
\forall z\quad
\bigl[\bigwedge_i z_i^2=0\Longrightarrow Q_{X,y}(z)=0\bigr]
```

accepts every proposed y. The system obtained by adjoining Q_X,y=0 to z_i^2=0 is likewise always feasible. Neither construction expresses (2).

## 2. The socle and a matrix-dimension obstruction

Every nonzero ideal of A_m contains omega. Here is an elementary proof. Choose a nonzero element a in the ideal and write a=sum_S a_S z_S. Choose an inclusion-minimal S for which a_S is nonzero. Multiplication by z_(S complement) kills every monomial whose index is not contained in S. All proper subsets of S have zero coefficients by the choice of S. Therefore

```math
a\,z_{S^c}=a_S\omega\ne0.                             \tag{3}
```

This also shows that the annihilator of the maximal ideal (z_1,...,z_m), usually called the socle, is the one-dimensional span of omega: a basis monomial is killed by every z_i exactly when it is omega.

Suppose N_1,...,N_m are commuting square-zero linear maps on a finite-dimensional vector space V and their product is nonzero. They define an A_m-module structure. Choose v with N_1...N_m v nonzero. Its annihilator in A_m is an ideal. If that ideal were nonzero, (3) would place omega in it, contradicting the choice of v. Hence

```math
A_m\longrightarrow V,\qquad a\longmapsto av
```

is injective. It follows that

```math
\dim V\ge 2^m.                                       \tag{4}
```

This is stronger than the dimension estimate obtained merely from an injection into End(V). It uses the vector on which the socle acts nontrivially.

Thus a test using explicit commuting square-zero matrices cannot retain omega in polynomial dimension. Matrix variables of dimension r require m*r^2 scalar coordinates before auxiliary vectors or commutator equations are counted, and (4) forces r exponential. The usual regular representation attains r=2^m: index its basis by subsets, and let N_i add i to a subset when absent and send the vector to zero when i is already present. It has O(m2^m) nonzero matrix entries. It provides an exact representation, not a polynomial BSS verifier.

Describing these matrices as tensor products does not make an arbitrary matrix product or one of its entries a unit-cost scalar operation. Evaluating F_X in that implicit algebra and extracting the omega coordinate is exactly the weighted sum in (2).

## 3. One-parameter jets cannot retain the socle at any order

Let B_N=C[epsilon]/(epsilon^N). If u in B_N satisfies u^2=0 and is nonzero, its least nonzero epsilon exponent is at least ceil(N/2). Therefore the product of any two square-zero elements of B_N is zero.

For m>=2, every algebra homomorphism A_m to B_N kills omega, for every N. This is not repaired by choosing a larger univariate jet order. The obstruction comes from the shape of the principal nilpotent ideal, not just a missing precision parameter.

More generally, if a finite-dimensional commutative algebra B admits a homomorphism A_m to B that does not kill omega, its kernel is zero by (3), so dim B>=2^m. Multivariate jets can retain the socle, for example by using A_m itself, but their full scalar coordinate representation is exponential. A compact circuit for an element of that algebra does not supply a free zero test or coefficient extractor.

## 4. A first Jacobian test does not extract the coefficient

For the original equations E_i=z_i^2 the Jacobian determinant is

```math
J_E(z)=2^m\omega.
```

It is a small polynomial circuit and generates the socle in A_m, but it vanishes at the only complex solution. Requiring J_E different from zero makes the system infeasible for every X,y. Adjoining a variable v and the equation vJ_E=1 has the same defect.

The quotient A_m/(Q_X,y) has a simple length jump. If y=per_m(X), Q is zero in A_m and the quotient has dimension 2^m. Otherwise Q is a nonzero scalar multiple of omega and the quotient has dimension 2^m-1. For m>=2, the point set and its first tangent information do not distinguish these cases: the difference occurs in the top degree-m socle. Testing this length jump is an additional multiplicity computation.

The same blindness holds for every differential test of order strictly less than m at the original point. If alpha is a multi-index with total order below m, then

```math
\partial^\alpha\omega(0)=0,\qquad
\partial^\alpha Q_{X,y}(0)=\partial^\alpha F_X(0).
```

Consequently any matrix assembled only from these derivative values, and any determinant or nonvanishing test on such a matrix, is independent of y. A Jacobian of residuals obtained by at most r differentiations has this defect when r+1<m. The particular mixed derivative that detects the target is

```math
\partial_{z_1}\cdots\partial_{z_m}Q_{X,y}(0)
=\mathop{\mathrm{per}}_m(X)-y.
```

Writing that differential operator has length m, but its evaluation on the product-of-linear-forms circuit is the permanent computation itself. No polynomial-time rule for evaluating this selected mixed derivative follows from the short notation. A claimed polynomial-size arithmetic circuit for that scalar polynomial would directly contradict the imported border lower bound.

## 5. Diagonal reduced deformations recover a sum, not one value

Take nonzero a_1,...,a_m and deform the equations to E_i=z_i^2-a_i. They have 2^m distinct points, with J_E=2^m omega nonzero at every point. Direct expansion gives the residue identity

```math
\sum_{z_i^2=a_i\ (1\le i\le m)}
 \frac{Q_{X,y}(z)}{J_E(z)}
=\mathop{\mathrm{per}}_m(X)-y.                         \tag{5}
```

To verify (5), expand a homogeneous degree-m monomial z^alpha. Its contribution factors into the m sums of z_i^(alpha_i-1) over the two roots of z_i^2=a_i, divided by 2^m. Each such sum is zero unless alpha_i is odd. Since the total degree is m, all alpha_i must then be one, and the surviving contribution is one. Thus precisely the omega coefficient remains.

This identity is valid on arbitrary complex matrices. It still sums 2^m terms. A Jacobian nonvanishing test does not replace that sum.

For a concrete failure of a pointwise substitute, let m=2, X have all entries one, and a_1=a_2=1. The permanent is two. At y=2, Q=z_1^2+z_2^2=2 at every deformed root, so even a correct value does not make Q vanish pointwise. At the false value y=4, Q vanishes at z=(1,1), where J_E=4 is nonzero. Thus existence of one regular zero of Q is unsound, while requiring Q to vanish on the entire fixed diagonal deformation is incomplete.

## 6. A coupled quadratic deformation and an actual Sigma_2 predicate

Allow coupled affine lower terms:

```math
E_i(z)=z_i^2-\sum_{j=1}^{m}L_{ij}z_j-a_i,
\qquad
J_E(z)=\det(2\mathop{\mathrm{diag}}(z)-L).              \tag{6}
```

For every numerical L,a, the quotient by the E_i has basis {z_S} and dimension 2^m. One way to prove this is the monic Groebner-basis criterion: in any graded monomial order the leading monomials are the pairwise coprime z_i^2. The pairwise S-polynomials reduce to zero by replacing z_i^2 and z_j^2 with their affine lower terms, whose two products commute. Thus the standard monomials are precisely the squarefree monomials. The same argument works over the parameter ring C[L,a], giving a finite free family of rank 2^m.

Consider the exact predicate

```math
\exists(L,a)\ \forall z:\quad
E(z)=0\Longrightarrow
\bigl(Q_{X,y}(z)=0\ \text{and}\ J_E(z)\ne0\bigr).      \tag{7}
```

There are m^2+m existential scalar parameters and m universal scalar coordinates. Evaluating E and Q costs O(m^2) arithmetic operations. Gaussian elimination evaluates J_E in O(m^3) operations, with equality branches selecting a nonzero pivot and division charged only after that check. Thus (7) is a uniform polynomial-time Sigma_2 BSS predicate with explicit witness equations.

### Soundness

If (7) holds, each local Artin algebra at a common zero p is reduced. Indeed, the equations modulo the square of its maximal ideal have invertible linear coefficient matrix J_E(p), so that maximal ideal equals its square. It is nilpotent in a local finite algebra, hence repeated squaring forces it to be zero. The local algebra is therefore C. The whole quotient is a product of these fields, so a polynomial vanishing at every point is zero in the quotient.

In particular Q_X,y has zero normal form modulo the E_i. Replacing any z_i^2 by the affine expression in (6) strictly lowers total degree. Therefore the coefficient of the degree-m squarefree monomial omega in the normal form of Q is its original coefficient, per_m(X)-y. It must be zero. This proves soundness of (7) without any nonsingularity assumption on X and without any restriction on the signs or cancellations of its entries.

### An explicit failure of all-input completeness

For m>=2, take every row of X to be the first coordinate vector. Then y=0 is the true permanent value and Q=z_1^m. If (7) held, radicality would imply that z_1 itself vanishes at every point and hence is zero in the quotient. This is impossible because z_1 is one of its nonzero standard basis elements. Consequently no L,a can certify this true input in (7).

### Generic completeness is excluded for all sufficiently large m

The reduced-fiber locus of the finite free family (6) is a nonempty Zariski open set: the diagonal choice L=0 and all a_i nonzero is already reduced. Over this locus the map is finite etale, of degree 2^m. Every certificate accepted by (7) belongs to that open set, by its universal Jacobian condition.

Suppose accepted inputs of (7) were Zariski dense in the permanent graph. Enumerate the 2^m distinct roots only for the existence proof and apply [MOVING_ALGEBRAIC_CHALLENGES.md](MOVING_ALGEBRAIC_CHALLENGES.md), Sections 1–2. The per-root body is Q=0 together with J_E nonzero, and has polynomial BSS cost. It is sound on the whole parameter space by the preceding argument. The expanded incidence would have an actual component projecting densely onto the permanent graph; the block-KKT transfer then gives polynomial border circuits for the permanent.

All dimensions and circuit bounds in this transfer are fixed polynomials in m. The standing imported lower bound eventually exceeds that polynomial border bound. Thus there is an m_0 such that (7) is not generically complete for any m>=m_0. This is an asymptotic conclusion, not a prohibition at every individual dimension. The moving-challenge proof only needs a dense accepted subset contained in the graph; its component argument does not require a certificate on every degenerate true input.

For example, m=2 is generically complete, as the weighted-protocol review observed. On the true graph, write Q=A z_1^2+B z_2^2 with A=X_11 X_21 and B=X_12 X_22. When AB is nonzero, choose L=0, a_1=B, and a_2=-A. All four roots are reduced and Q vanishes on each. This does not conflict with the asymptotic lower bound.

This is a concrete generic-noncompleteness consequence of the project's reviewed lemmas. It is not being left as an open completeness hypothesis and is not a new external theorem import.

## 7. The remaining multiplicity issue

Dropping the Jacobian condition from (7) loses soundness: L=a=0 then makes the only point zero, where Q vanishes for every y. Retaining nonreduced fibers while detecting the coefficient in (2) requires an actual scheme-theoretic test, not just the common complex zero set.

The socle relation, the length jump, and the residue identity above identify that missing test exactly. Polynomial-size ordinary matrices cannot retain the socle, one-parameter jets kill it, and a full multivariate jet algebra has exponentially many scalar coordinates. No polynomial-size differential or universal jet predicate that distinguishes the two length cases is proved here. Any proposed implicit representation must charge its equality, membership, or coefficient operations rather than relying only on the small presentation of the algebra.
