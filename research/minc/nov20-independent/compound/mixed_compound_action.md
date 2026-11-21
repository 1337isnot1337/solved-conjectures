# Permanental compound action through a mixed polynomial space

Research checkpoint, 20 November 2026 (America/Chicago). This note gives an
exact matrix-free compound action with a smaller intermediate space than
the full symmetric-power representation. The recursive arithmetic bound
has the same leading exponential term as that representation. It does
not give a uniformly faster characteristic-polynomial algorithm, and it
does not resolve Minc Problem 17. Historical priority for the memory
refinement has not been established.

## Statement and notation

Let A be a rational n by n matrix and 0 <= k <= n. Put

```math
N_{n,k}=\binom nk,\qquad M_{n,k}=\binom{n+k-1}{k}.
```

For a split n=m+r with m,r positive, define

```math
D_{m,r,k}=[z^k]\frac{(1+z)^r}{(1-z)^m}
=\sum_{j=0}^{\min(r,k)}
 \binom rj\binom{m+k-j-1}{k-j}.                  \tag{1}
```

This is the dimension of the degree-k polynomials that are unrestricted
in m left variables and have individual degree at most one in r right
variables. Call this mixed space H. It sits inside the full homogeneous
degree-k space of dimension M_n,k.

**Proposition.** A product P_k(A)v can be computed over the rationals
without constructing P_k(A), in poly(n,k) M_n,k field operations. With
balanced recursive splits it uses

```math
O\bigl(D_{\lfloor n/2\rfloor,\lceil n/2\rceil,k}\log n
       +\mathop{\mathrm{poly}}(n,k)\bigr)
```

field elements of working storage, apart from the bit lengths of those
elements. Scalar interpolation handles singular matrices and singular
block pivots with only a polynomial factor in time. The output vector
can be accumulated during interpolation without retaining all samples.

For even n and k=n/2,

```math
D_{n/2,n/2,n/2}\le(1+\sqrt2)^n,
```

whereas

```math
M_{n,n/2}=(3\sqrt3/2)^{n+o(n)}.
```

The comparison is about this compound-action implementation. It is not a
claim of an optimal space bound or a new asymptotic running-time bound
for characteristic polynomials.

## 1. Polynomial action and the safe projection

Represent the input vector by

```math
f(y)=\sum_{|J|=k}v_J\prod_{j\in J}y_j.
```

Let T_A f(x)=f(A^T x). The squarefree degree-k coefficients of T_A f are
P_k(A)v. This standard symmetric-power description is also used in the
[earlier representation audit](../../inequalities/compound_charpoly_obstruction.md).

Write the matrix in blocks, assuming B invertible:

```math
A=\begin{pmatrix}B&C\\D&E\end{pmatrix}
=\underbrace{\begin{pmatrix}I&0\\DB^{-1}&I\end{pmatrix}}_L
 \underbrace{\begin{pmatrix}B&0\\0&S\end{pmatrix}}_F
 \underbrace{\begin{pmatrix}I&B^{-1}C\\0&I\end{pmatrix}}_U,
\qquad S=E-DB^{-1}C.                             \tag{2}
```

Let Q discard monomials in which a right variable has exponent greater
than one. The operators act in the order U, F, L on an input polynomial.

First, U replaces each right variable by itself plus a left linear form
and leaves the left variables fixed. Starting from a squarefree
polynomial, no right variable can acquire exponent greater than one.
Thus T_U f lies in H.

Second, L replaces left variables by themselves plus right linear forms
and leaves every right variable fixed. A monomial that already has a
repeated right variable can never contribute to a final squarefree
coefficient under T_L. Consequently, with E_sf denoting final squarefree
coefficient extraction,

```math
E_{\rm sf}T_A f=E_{\rm sf}T_L Q T_F Q T_U f.     \tag{3}
```

This projection is justified by the two block directions. It is not the
false multiplicativity P_k(LFU)=P_k(L)P_k(F)P_k(U), which would discard
left collisions too early.

On H, the middle map Q T_F Q is block diagonal in the left and right
total degrees. Its restriction to left degree s and right degree j,
where s+j=k, is

```math
\operatorname{Sym}^{s}(B)\otimes P_j(S).         \tag{4}
```

Here Sym^s(B) means the ordinary coefficient action on homogeneous
polynomials. Repeated-variable factorials are already included by the
usual binomial coefficients of polynomial substitution. No additional
factorial normalization is needed in (3)--(4).

## 2. Applying the factors

The U substitutions can be decomposed into elementary maps

```math
y_j\longmapsto y_j+c x_i.
```

The right variable y_j has degree at most one, so each map takes a
polynomial number of field operations per mixed monomial. All
intermediate polynomials remain in H.

The L substitutions are elementary maps

```math
x_i\longmapsto x_i+c y_j.
```

Right collisions can be discarded after each such substitution because
subsequent L substitutions also leave right variables fixed. For a term
with x_i exponent a and y_j exponent zero, only the terms with zero or
one new y_j survive; their coefficients are 1 and ac. If y_j is already
present, only the term with no new y_j survives. Thus these maps also
act within H in polynomial work per state.

An invertible B factors into polynomially many elementary row
operations, whose inverse variable substitutions apply Sym^s(B) for
every s simultaneously. Binomial expansion of an elementary left shear
costs only poly(k) per state and never changes right exponents. The
middle right action is then computed separately for each fixed left
monomial, using a recursive compound action on S.

This gives the arithmetic recurrence

```math
T(n,k)\le\mathop{\mathrm{poly}}(n,k)D_{m,r,k}
 +\sum_{j=0}^{\min(r,k)}
   \binom{m+k-j-1}{k-j}T(r,j).                   \tag{5}
```

The convolution identity

```math
\sum_{j=0}^{k}
\binom{m+k-j-1}{k-j}\binom{r+j-1}{j}
=\binom{n+k-1}{k}
```

shows by induction that (5) is at most poly(n,k) M_n,k. There are only
logarithmically many recursive levels with balanced splits. The
polynomial work factors can be bounded by their top-level value times
this depth; they are not multiplied afresh along every branch.

The same calculation explains the limitation: recursively eliminating
right collisions restores the full symmetric dimension in the time
bound. The smaller middle space alone does not improve the time
exponent.

## 3. Storage

At a given call, keep its mixed coefficient array and process one left
monomial's right-vector transform at a time. The total storage is the
sum of one mixed array per active recursion level, together with
polynomially many scalar matrix data.

To compare dimensions, let the parent split be n=m+r, and the child
split be r=p+q. For balanced splits n>=2, m>=p. The parent and child
generating functions satisfy

```math
\frac{(1+z)^r/(1-z)^m}{(1+z)^q/(1-z)^p}
=\frac{(1+z)^p}{(1-z)^{m-p}}.
```

If m>p, the ratio has coefficient at least one in every nonnegative
degree. Therefore each child dimension in a degree j<=k is at most the
parent dimension in degree k. The lone case m=p occurs at n=3 with
the chosen floor/ceiling splits; there r=2, p=q=1, and direct comparison
for 0<=j<=min(k,2) gives the same inequality. Terminal one-variable
calls are smaller as well. Hence the active arrays require at most
O(D_m,r,k log n) field elements.

For n=2m and k=m, positivity of the generating coefficients gives,
for any real x in (0,1),

```math
D_{m,m,m}\le x^{-m}\left(\frac{1+x}{1-x}\right)^m.
```

Taking x=sqrt(2)-1 proves D_m,m,m <= (1+sqrt(2))^(2m).
The full symmetric dimension comparison follows from Stirling's formula.

## 4. Removing pivot hypotheses

The recursive algorithm works directly whenever all leading principal
minors of A are nonzero. The corresponding leading principal minors of
each Schur complement are ratios of such minors, so the property
persists under recursion.

For arbitrary rational A, replace A by A+tI. The product of its n
leading principal determinants is a nonzero polynomial in t of degree
n(n+1)/2, since each factor is monic. Thus among
n(n+1)/2+k+1 distinct integer samples there are at least k+1 with no
bad leading minor. These samples can be found by ordinary exact
elimination, in polynomial time.

Every coordinate of P_k(A+tI)v is a polynomial in t of degree at most
k. Lagrange interpolation at zero therefore recovers P_k(A)v from
k+1 good samples. Only the current sample and an accumulating output
vector need be retained. This covers singular matrices, zero matrices,
and matrices with vanishing leading pivots without a genericity
assumption on the final result.

## Checks, sources, and scope

Run

```sh
python research/minc/nov20-independent/compound/mixed_compound_checks.py
```

The implementation uses rational arithmetic and the elementary
substitutions above. It recursively applies the Schur-complement
compound without building the large compound matrix. An independent
comparison enumerates permutations. It checks 75 actions across all
degrees in orders two through six, including signed dense examples,
rank-one singular matrices, and permutation matrices that require the
interpolation repair. The checks pass. These are checks of the
identities, not a finite-order solution of P17.

The source pass included the exact current statements of
[P14](https://yair-lavi.com/mincs-list/problem-14/index.html),
[P15](https://yair-lavi.com/mincs-list/problem-15/index.html),
[P17](https://yair-lavi.com/mincs-list/problem-17/index.html), and
[P18](https://yair-lavi.com/mincs-list/problem-18/index.html), together
with the repository's earlier route audits. Queries in both web indexes
covered permanental compounds, Schur complements, zeon operators,
squarefree substitutions, algorithmic space, and characteristic
polynomials. The standard ingredients here are block Gaussian
elimination, symmetric powers, coefficient projection, and interpolation.
No claim of priority for those ingredients is made.

The recent primary paper
[An Algorithmic Upper Bound for Permanents via a Permanental Schur
Inequality](https://arxiv.org/pdf/2509.08121) by Laddha and Pittu concerns
a nonnegative permanent upper bound through a permanental inverse. The
full PDF was retrieved; its main statements and Sections 2--3 were
inspected, and full-text searches for compound, squarefree and memory
found no matches. Its stated Schur inequality uses permanental cofactors
and an upper comparison, whereas (2)--(3) use the ordinary inverse in an
exact polynomial substitution. This identifies the distinction from
that paper but does not establish general historical priority. A deeper
audit would be required before presenting this refinement as new.

In particular, no full characterization of cohesive or barycentric
supports has been found. The pre-existing general approximation theorem
for P18 is not a new result of this session. For P17, applying a
characteristic-polynomial algorithm still requires a separate total
cost bound and complete multiplicity handling; (5) does not supply a
uniform speed improvement over the existing general methods.

