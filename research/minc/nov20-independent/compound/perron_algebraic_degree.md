# Exponential algebraic degree of compound Perron roots

Date: 20 November 2026 (America/Chicago).

Status: an exact-output obstruction, with an
[independent review](../root/perron_degree_review.md).
This does not resolve Minc Problem 18, whose statement does not specify
an expanded minimal-polynomial output format. It also does not give a
new algorithm for Minc Problem 17. The companion-matrix spectral method
used below is classical; no priority claim is made for this consequence.

## 1. Statement

For n>=2 let A_n be the zero-one matrix defined by

```math
(A_n)_{i,i+1}=1\quad(1\le i<n),\qquad
(A_n)_{n,1}=(A_n)_{n,2}=1,
```

with all other entries zero. This orientation has characteristic
polynomial f_n(x)=x^n-x-1.

**Proposition.** For every odd k with 1<=k<n, the characteristic
polynomial of P_k(A_n) is irreducible over the rationals and has degree
binom(n,k). In particular,

```math
[\mathbb Q(\rho(P_k(A_n))):\mathbb Q]=\binom nk.
```

For n=4m+2 and k=2m+1, this degree is at least 2^n/(n+1). The input
matrix has n+1 nonzero entries, all equal to one. Even its dense binary
encoding has only n^2 entries.

Consequently no algorithm can, on every input of this kind, output the
Perron root through an expanded list of the coefficients of its minimal
polynomial in time polynomial in n. The output list alone requires
exponentially many positions.

This statement concerns that output format. A succinct polynomial
description, arithmetic circuit, or product of specified algebraic roots
can be much shorter. Indeed the companion family here has exactly such
a classical spectral description. Algebraic degree alone does not rule
out compact exact algorithms or numerical approximation.

## 2. The parity identity

Write C_k(A) for the determinantal compound, with increasing row and
column index sets. We show that

```math
P_k(A_n)=C_k(A_n)\qquad(k\text{ odd}).                       \tag{1}
```

Every selected row i<n has exactly one possible matching column i+1.
Thus every square submatrix of A_n has at most one perfect matching.
If the last row is not selected, every nonzero matching preserves order,
so its determinant sign is positive.

If row n is selected, its matching column is either 1 or 2. If it is 1,
it is smaller than all columns forced by the other selected rows. If it
is 2, row 1 cannot be selected, because its forced column would also be
2; all other forced columns are therefore at least 3. In either case,
the last matching row uses the smallest matching column. The other rows
preserve order. The matching permutation consequently has k-1
inversions and sign (-1)^(k-1), which is positive for odd k.

Zero subpermanents and subdeterminants agree as well, since both then
have no matching. This proves (1) without a genericity assumption or
diagonal sign change.

## 3. The imported Galois theorem

The polynomial f_n=x^n-x-1 is irreducible for every n>=2 by Selmer's
1956 theorem. Its splitting field has Galois group S_n. This was proved
by Nart and Vila in 1979 and independently by Osada in 1987.

For the latter implication, Osada's *The Galois groups of the
polynomials x^n+a x^s+b, II*, Theorem 1 together with the Remark on
printed page 441, applies as follows. Set s=1, a=b=-1, c=1. The required
coprimality condition is gcd(n-1,n)=1. The Remark removes conditions
(3) and (4) when s=1. Hence the irreducibility already supplied by
Selmer gives the full symmetric Galois group.

This Galois theorem is a published input, not a result claimed here.
The primary Osada PDF was inspected, including the Remark. Conrad's
exposition states the exact all-order theorem, credits Nart--Vila, and
gives another complete proof of the Galois step using inertia groups.

## 4. Distinct products of roots

We use a general elementary consequence of a full symmetric Galois
group. Suppose n>=3, nonzero distinct algebraic numbers
alpha_1,...,alpha_n are permuted by every element of S_n through Galois
automorphisms, and 1<=k<n. Then the products

```math
\alpha_I=\prod_{i\in I}\alpha_i\qquad(|I|=k)
```

are pairwise distinct.

Suppose instead alpha_I=alpha_J for distinct k-subsets I,J. Cancel their
intersection to obtain equal products over disjoint nonempty sets U,V
of the same size.

If an index c lies outside U union V, choose a in U and apply the Galois
transposition (a,c). The product over V remains unchanged. Comparing
the transformed equality with the original one and cancelling nonzero
factors gives alpha_a=alpha_c, a contradiction.

Otherwise U union V is the entire index set. For any a in U and b in V,
the Galois transposition (a,b), compared with the original equality,
gives alpha_a^2=alpha_b^2. Fixing one index on either side shows that all
n roots have the same square. There can then be at most two distinct
roots, contrary to n>=3. This exhausts the possibilities.

For n=2 and k=1, distinctness is immediate from separability. The roots
of f_n are nonzero because its constant coefficient is -1, and they are
distinct because it is irreducible in characteristic zero. The lemma
therefore applies to f_n in every required case.

## 5. Characteristic polynomial and Perron root

Since f_n has distinct roots, A_n is diagonalizable over its splitting
field. The eigenvalues of C_k(A_n), the matrix of its kth exterior
power, are precisely the products alpha_I. By (1), these are also the
eigenvalues of P_k(A_n) when k is odd.

The Galois group S_n acts transitively on k-subsets. Section 4 shows
that the resulting binom(n,k) products are distinct. Thus the Galois
orbit of any one product has exactly binom(n,k) members. Its minimal
polynomial over the rationals has that degree and must equal the monic
characteristic polynomial of P_k(A_n).

The latter matrix is nonnegative, so its spectral radius is an
eigenvalue. It is nonzero because A_n, and hence C_k(A_n), is invertible.
Its Perron root is therefore one of the products just considered and
has the claimed degree.

For n=4m+2, the central degree k=n/2 is odd. The central binomial
coefficient is the largest coefficient of (1+x)^n, whose coefficients
sum to 2^n. Therefore binom(n,n/2)>=2^n/(n+1), proving the explicit
exponential output bound.

## 6. Generic irreducibility in every compound degree

There is also a uniform statement that does not use the companion
family or the imported Galois theorem.

**Proposition.** Let X=(x_ij) be an n by n matrix of algebraically
independent indeterminates over the rationals. For every 1<=k<n,
the characteristic polynomial of P_k(X) is irreducible over
Q(x_ij).

**Proof.** Put R=Q[x_ij], an integrally closed unique factorization
domain, and let K be its field of fractions. Suppose the monic
characteristic polynomial factors as F G over K, where F and G are
monic and have positive degree in the characteristic variable lambda.
Every root is integral over R. The coefficients of each monic factor
are elementary symmetric functions of some of those roots, so they
are integral over R. Since they also belong to K and R is integrally
closed, F and G belong to R[lambda]. Thus every specialization below
preserves their monic leading coefficients and their positive degrees.

Specialize X to diag(d_1,...,d_n), retaining independent diagonal
indeterminates. For a subset I write d_I=product_(i in I) d_i. Then

```math
\chi_{P_k(X)}(\lambda)\big|_{X=\operatorname{diag}(d)}
=\prod_{|I|=k}(\lambda-d_I).
```

These linear factors are distinct. The specialized factor F therefore
selects a nonempty proper set of k-subsets I.

Fix two distinct indices i,j. Instead specialize X to its diagonal
plus the two entries x_ij=b and x_ji=c, retaining all d_i,b,c as
indeterminates. This is a two by two block together with singleton
diagonal blocks. A compound basis vector uses zero, one, or two
coordinates from that block. For every (k-1)-subset T outside {i,j},
the one-coordinate block of P_k(X) is

```math
d_T\begin{pmatrix}d_i&b\\c&d_j\end{pmatrix}.
```

Its characteristic factor is

```math
Q_T(\lambda)=\lambda^2-(d_i+d_j)d_T\lambda
 +(d_i d_j-bc)d_T^2.                                      \tag{2}
```

This quadratic is irreducible over Q(d_1,...,d_n,b,c): its discriminant
is d_T^2[(d_i-d_j)^2+4bc], and the bracket is a degree-one polynomial
in b with nonzero leading coefficient over Q(d_1,...,d_n,c). Its
valuation at the irreducible linear polynomial
b+(d_i-d_j)^2/(4c) is one, so it is not a rational-function square.
Different T give distinct monic quadratics, as is already seen from
their coefficients -(d_i+d_j)d_T. The remaining blocks contribute only
linear factors: lambda-d_I when neither coordinate is used, and
lambda-(d_i d_j+bc)d_U when both are used. None is an irreducible
quadratic factor.

Unique factorization now forces the specialized F to include either
all of Q_T or none of it. On setting b=c=0, Q_T splits into the two
distinct factors lambda-d_i d_T and lambda-d_j d_T. No other block
specializes to either of these factors, since all squarefree diagonal
products d_I are distinct. The set selected by F must consequently
contain T union {i} exactly when it contains T union {j}.

This holds for every i,j,T. The graph on k-subsets in which two subsets
are adjacent when one element is exchanged is connected: repeatedly
replace an element outside a desired target set by one in the target
set. The selected subset must therefore be empty or the entire graph,
contrary to its being nonempty and proper. This proves irreducibility.
QED.

This proposition proves generic irreducibility, not irreducibility for
every numerical specialization. It does not justify treating an
arbitrary input as cyclic in a black-box characteristic-polynomial
algorithm.

## 7. Checks, literature, and scope

The companion orientation and parity identity are checked independently
by matching dynamic programming and determinant elimination in
`perron_algebraic_degree_checks.py`. The script also computes small
characteristic polynomials and verifies rational irreducibility. These
are diagnostics of the proof, not the basis of the all-order claim.

Sources inspected or retrieved:

1. E. S. Selmer, *On the irreducibility of certain trinomials*,
   Math. Scand. 4 (1956), 287--302,
   [publisher record](https://journals.msp.org/mscand/article/view/2841)
   and [primary scan](https://journals.msp.org/mscand/article/download/2841/2840/2872).
   The older publisher PDF URLs now return 404. The current scan was
   retrieved but did not expose machine-readable text in the web tool.
2. H. Osada, *The Galois groups of the polynomials x^n+a x^s+b, II*,
   Tohoku Math. J. 39 (1987), 437--445,
   [primary PDF](https://www.jstage.jst.go.jp/article/tmj1949/39/3/39_3_437/_pdf/-char/ja).
   Theorem 1 and the Remark on page 441 were inspected directly.
3. K. Conrad, *The Galois group of x^n-x-1 over Q*,
   [author's exposition](https://kconrad.math.uconn.edu/blurbs/gradnumthy/galoisselmerpoly.pdf).
   Theorem 2.1 gives the exact all-order input and its historical credit.
4. H. Minc, *Permanental compounds and permanents of (0,1)-circulants*,
   Linear Algebra Appl. 86 (1987), 11--42,
   [DOI](https://doi.org/10.1016/0024-3795(87)90285-0).
   The publisher abstract and the live Minc catalogue identify the
   existing companion-matrix spectral methods. The publisher's full
   body was not accessible during this pass. Identity (1) is proved
   above, so the mathematical deduction does not rely on an uninspected
   formulation of that result.

The [live P17](https://yair-lavi.com/mincs-list/problem-17/index.html) and
[P18](https://yair-lavi.com/mincs-list/problem-18/index.html) statements
already credit Minc's exact companion methods. Queries in both search
indexes covered permanental compounds with Galois groups,
irreducibility, minimal polynomials, Selmer polynomials, and algebraic
degree. No retrieved source stated this exact output-format obstruction,
but that search does not establish priority. In particular, this note
does not reclassify the known companion family as an unsolved problem.

Completed full Minc entries from this note: zero.
