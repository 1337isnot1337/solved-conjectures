# An ordered coherent projector with the full C residual

Research status: the ordered operator formula, its rational projector
normalization, and the polynomial-flag rank estimate are proved. The
fixed-C completion in the stated linear-Y class is excluded at the
required rank by [INDEPENDENT_Y_CAPACITY.md](INDEPENDENT_Y_CAPACITY.md), including arbitrary
different X-only A images. The channel and finite-rank lemmas remain
valid. A common arbitrary C vector in all source sectors is not an
allowed substitute.

## 1. Ordered three-layer operators

Take disjoint source vertex sets P,H,Q, with sizes a,m,b and m<=a.
Retain A outputs in P and B outputs in Q. For h in H use independent
Weyl variables x_ih,p_ih (i in P), and y_hj,d_hj (j in Q). The x and
y Weyl algebras commute. Put

```math
\mathsf P=(p_{ih})_{i\in P,h\in H},\qquad
\mathsf X=(x_{ih})_{i\in P,h\in H},\qquad
K=\mathsf X^{\mathsf T}\mathsf P.
\tag{1}
```

The transpose in (1) only describes the displayed rectangular array
of multiplication operators. It is not a physical B transpose.
Work temporarily over the Weyl division ring and define

```math
U=\mathsf P K^{-1},\qquad E=U\mathsf X^{\mathsf T}.
\tag{2}
```

Invertibility of K is proved in Section 3. Let N_1 have P-to-H block
U and all other blocks zero. Let N_2 have H-to-Q block
(d_hj) and all other blocks zero. Use

```math
A=(I+N_1)(I+N_2),\qquad
B=(I-N_2)(I-N_1).
\tag{3}
```

These matrices are inverses. In particular, A_PH=U, A_PQ=U d,
B_HQ=-d, and B_PQ=0. This ordering differs from exp(N_1+N_2);
the coefficient of N_1N_2 in A is one, and it is zero in B.
The physical B map is the full flag transpose of the right operator
B, as in the earlier source constructions.

## 2. Every coefficient with fixed C planes

Let W be the C-output space. For each source vertex v fix a C plane
U_v^C of dimension at most the CD-wire size. At each target D label
(i,j) in P times Q choose vectors

```math
w_{v,t}^{ij}\in U_v^C\qquad(t\in H),
```

and let the diagonal middle entry at source vertex v be

```math
f_v^{ij}=\sum_{t\in H}x_{it}y_{tj}w_{v,t}^{ij}.
\tag{4}
```

This notation means that scalar D coefficients select vectors through
the fixed C map, exactly as in the preceding multi-shear note. The
tagged D map may use v and i,j; it does not know the outside a,b.

For outer a in P,b in Q, the complete coefficient in A diag(f_v) B is

```math
\begin{aligned}
\mathcal O_{ab}^{ij}
&=\sum_h U_{ah}\bigl(d_{hb}f_b^{ij}-f_h^{ij}d_{hb}\bigr)
\\ &=\sum_{h,t}U_{ah}x_{it}y_{tj}d_{hb}
               (w_{b,t}^{ij}-w_{h,t}^{ij})
       +\delta_{bj}\sum_h U_{ah}x_{ih}w_{j,h}^{ij}.
\end{aligned}
\tag{5}
```

There is no contribution from source vertices in P, because B_PQ=0.
The first line follows from the intermediate H and endpoint Q
source sectors. In passing to the second line, only d_hb is moved
past (4). It commutes with every x variable and produces
delta_ht delta_bj on y_tj. The rational X-Weyl entry U_ah stays on
the far left throughout. In particular, it is not commuted through
x_it, and its possible commutators have not been omitted.

If every vector in (4) were one common vector w, the first sum would
vanish and the result would be

```math
\mathcal O_{ab}^{ij}=\delta_{bj}E_{ai}\,w.
\tag{6}
```

This is an exact diagnostic, not a copied-C construction: independent
columns w_ij could be substituted in (6) only if all the required
source-plane memberships and the entire first sum of (5) were also
satisfied. The endpoint-intersection theorem in
[INDEPENDENT_Y_CAPACITY.md](INDEPENDENT_Y_CAPACITY.md) proves that r families of this
linear-Y form have C rank at most r times the CD-wire size. Its
constant and degree-one flag proof permits arbitrary X-only A images
and X-operator flavour matrices, so it covers the rational U here as
well as its finite realization.

## 3. The normalized channel is an idempotent of rank m

Use the total PBW filtration on the X-Weyl algebra. Its associated
graded ring is the polynomial ring in the commuting x and p symbols.
The principal symbol of K is the generic m-by-m matrix
X^t Xi. Its determinant is nonzero: setting the first m rows of X
and Xi to identity matrices and the other rows to zero gives I_m.

Suppose K had a nonzero right kernel vector over the Weyl division
ring. Clear a common right denominator to obtain a nonzero vector of
Weyl-polynomial entries. Take the largest PBW degree among its entries,
and let v be the nonzero vector of their symbols in that degree.
The highest-degree part of the kernel equation would be
(X^t Xi)v=0. This contradicts the nonzero determinant over the
commutative fraction field. Thus K has trivial right kernel, and a
square matrix over a division ring with trivial right kernel is
invertible.

It follows directly from (1)--(2) that

```math
\mathsf X^{\mathsf T}U=I_m,\qquad E^2=E,
\mathop{\mathrm{rank}}_{\rm div}(E)=m.
\tag{7}
```

Indeed U is injective as a map of right division modules, X^t is
surjective, and the image of E equals the image of U. The projector
need not be Hermitian. Its division rank is an algebraic statement,
and is not being substituted for the rank of an unproved finite
operator realization.

## 4. Polynomial flags recover the division-rank fraction

Here is the finite-rank estimate needed for that realization. Let R be
a Weyl algebra in d variables over C, acting on ordinary polynomials,
and let F_n denote the polynomials of total degree at most n.

**Scalar estimate.** For every nonzero Q in R,

```math
\mathop{\mathrm{rank}}(Q|_{F_n})
 \ge\dim F_n-O(n^{d-1}).
\tag{8}
```

Write Q in normal order. Group its monomials by their exponent shift
alpha-beta. On a monomial x^nu the coefficient for any one shift is
a polynomial in nu, a linear combination of falling factorials. At
least one such coefficient polynomial is nonzero, by independence of
the PBW monomials and of the falling-factorial basis. Choose a positive
generic weight vector on monomial exponents so that the largest shift
with nonzero coefficient is unique. Apart from O(n^(d-1)) boundary
monomials, all derivative exponents occurring in Q are permitted.
Apart from another O(n^(d-1)) monomials, that leading coefficient is
nonzero: a fixed nonzero polynomial has at most O(n^(d-1)) zeros on
the integer box [0,n]^d, by the elementary grid polynomial bound.

For the remaining monomials, the leading output is x^(nu+shift) with
nonzero coefficient. These leading monomials are distinct. In any
nonzero linear combination, the greatest of them cannot be canceled
by a smaller leading term. Their images are independent, proving (8).

**Matrix estimate.** If a polynomial Weyl matrix Q has division rank
r, then for a fixed degree margin D large enough for all its entries,

```math
\mathop{\mathrm{rank}}
 \bigl(Q:F_n^{\,b}\longrightarrow F_{n+D}^{\,a}\bigr)
 \ge r\dim F_n-O(n^{d-1}).
\tag{9}
```

Choose r division-independent columns Q_J and a rational left inverse
H. Clear a common left denominator v, so P=vH is polynomial and
P Q_J=v I_r. Polynomial action and multiplication are exact on their
full output degree ranges. Therefore the rank of Q_J on F_n^r is at
least the rank of v I_r there. Applying (8) proves (9).

The only localization fact used here is the same common-denominator
property established in the existing Weyl-division transfer note.
It is not a claim that rational Weyl operators act on every polynomial.

To apply this to (2)--(5), choose a common nonzero left denominator v
for the finitely many entries of U. Multiply the whole A map on the
left by v. Then vU, vUd, and vI are polynomial Weyl matrices, while
the target channel becomes

```math
Q=vE=(vU)\mathsf X^{\mathsf T},
\qquad \mathop{\mathrm{rank}}_{\rm div}(Q)=m.
\tag{10}
```

All local operators are now finite-degree polynomial operators. Use
retained polynomial flags F_n and source flags with a fixed degree
margin large enough to protect every B-middle-A prefix. Their
dimension ratio tends to one for each fixed set of source labels.
Keep the full polynomial output degree range at A. Formula (9) shows
that the resulting A map has rank at least
m dim F_n-O(n^(d-1)) on an input of dimension a dim F_n.

Consequently, whenever the full fixed-C source equation actually gives
Q_A T, the already-proved single-party projection estimate recovers an
asymptotic spectral fraction at least m/a. The rank estimate does not
itself give the required fixed-C equation. It validates the channel
size for any complete source equation in a broader class; the
particular linear-Y completion in Section 2 is excluded by the
endpoint-intersection theorem cited there.

## 5. Scope relative to the symmetric Euler calculation

The ordered product (3) produces one A projector and leaves the B
outside index copied in the diagnostic (6). It does not require an
inverse of a right multiplication-column/derivative-row matrix at B.
In the symmetric exp(N_1+N_2) calculation, that right matrix has
entries sum_h y_hj d_hb and division rank at most m. For m=1 it is
not the invertible matrix d y-I; that expression has the opposite
auxiliary orientation. The full physical B transpose preserves the
small-rank obstruction.

The complete coefficient formula, common-vector diagnostic,
idempotent relation, and finite-rank estimate remain valid. The
endpoint-intersection theorem excludes the requested high-rank C
completion under the independent-Y hypotheses of (4)--(5). A positive
construction using these channel ingredients must change those
hypotheses, such as the allowed Y dependence of the outside maps or
the middle coefficients, and must prove its new complete source
equation.
