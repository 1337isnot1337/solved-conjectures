# Exact flag realization of identities over filtered division algebras

Research status. The transfer theorem below is proved here. It reduces one
possible construction of the geodesic trade to a joint noncommutative
rational identity. No identity with the required subpolynomial number of
families is established. The theorem does not use approximation in norm,
or invert a truncated differential operator.

The explicitly tagged extension in
[TAGGED_OPERATOR_TRADE_TRANSFER.md](TAGGED_OPERATOR_TRADE_TRANSFER.md)
first supplies the shared source label at D by a proved separator.
After that extra construction the D operator may also depend on h.
The theorem below concerns the original untagged source.

## Tensor conventions and the unresolved target

All tensors are over the complex numbers. A restriction applies one
linear map at each party, and tensor products are regrouped by party.
The tensor $`U_S(q)`$ is the diagonal tensor with a common label of
size $`q`$ at every party in $`S`$, padded by one-dimensional factors
elsewhere; $`W_{XY}(q)=U_{\{X,Y\}}(q)`$ is a wire. A degeneration
means that Laurent-polynomial local maps have regular total output
whose constant coefficient is the target.

The source and target used below are

```math
S_{q,N}=U_{ABC}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N),
\qquad
T_{q,M}=U_{ACD}(q)U_{BCD}(q)W_{AB}(M).
```

A normalized spectral point is restriction-monotone, multiplicative
for regrouped products, additive for full direct sums, and has value
$`r`$ on the full four-party diagonal tensor of rank $`r`$.
The relevant definitions and asymptotic imports are in
[SPECTRAL_MODEL.md](SPECTRAL_MODEL.md). The proof in
[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md), Sections 2--4,
shows why a family with $`r=q^{o(1)}`$ and
$`N/M=q^{o(1)}`$ would settle the exponent question. Such a family
is not supplied in this note.

## 1. The coefficient identity

Fix integers $`q\ge2`$ and $`r\ge1`$. Let K be a division algebra whose center
contains C. All scalar coefficients below belong to C. Choose scalars
c^(z)_(kl,hc), for z in [r] and h,c,k,l in [q], and elements

```math
a_{zh}^{a},\quad b_{zh}^{b},\quad x_{zc}^{ij}\in K
\qquad(a,b,i,j\in[q]).
```

The letter c is an index in x_(zc), not a coefficient. The D operator
x_(zc)^(ij) is independent of h. Suppose the following identity holds in
K for every a,b,i,j,k,l:

```math
\sum_{z=1}^r\sum_{h,c=1}^q
 c^{(z)}_{kl,hc}\,a_{zh}^{a}x_{zc}^{ij}b_{zh}^{b}
 =\delta_{ki}\delta_{lj}\delta_{ai}\delta_{bj}\,1_K. \tag{1}
```

The C maps may differ with z. Equation (1) is a genuinely joint
condition. Two separate selector identities with a new shared index do
not imply (1) unless that index is supplied by an authorized tensor
factor.

## 2. Filtered-algebra hypothesis

Suppose R is a C-algebra embedded in K, with an increasing filtration
of finite-dimensional C-vector spaces F_n, n>=0, such that

* 1 belongs to F_0, the union of the F_n is R, and F_n F_m is contained
  in F_(n+m);
* R has no zero divisors;
* for every fixed nonnegative integer L,

```math
\frac{\dim F_{n+L}}{\dim F_n}\longrightarrow1;
```

* every finite subset W of K admits a nonzero t in R such that wt
  belongs to R for every w in W.

The last condition is the common-right-denominator property. It holds
when K is the classical right division ring of fractions of R.

The growth hypothesis itself implies the right Ore condition on R.
Indeed, for nonzero a,b in R, choose L with a,b in F_L. Both aF_n and
bF_n have dimension dim F_n, and are contained in F_(n+L). For large n,
2 dim F_n > dim F_(n+L), so their intersection is nonzero. Thus there
are nonzero u,v with au=bv. Repetition gives common right denominators
for any finite family of right fractions. This dimension argument also
works on the other side, though only right denominators are needed.

## 3. Exact realization theorem

Under these hypotheses, (1) implies that there are positive integers
N_n,M_n with N_n/M_n tending to 1 and exact four-party restrictions

```math
U_{ABCD}(r)\,U_{ABC}(q)\,W_{CD}(q)\,
 W_{AD}(N_n)\,W_{BD}(N_n)
\ \geq
\ U_{ACD}(q)\,U_{BCD}(q)\,W_{AB}(M_n).                 \tag{2}
```

### Proof

Let W be the finite set consisting of 1 and all operator prefixes
which act on a retained input flag when (1) is evaluated from right to
left:

```math
b_{zh}^{b},\qquad x_{zc}^{ij}b_{zh}^{b},\qquad
 a_{zh}^{a}x_{zc}^{ij}b_{zh}^{b}.
```

Choose a common nonzero right denominator t in R with wt in R for
every w in W. Fix L such that all these elements wt belong to F_L.
Define the retained flag space and ambient flag space by

```math
E_n=tF_n\subseteq V_n=F_{n+L},\qquad
M_n=\dim E_n=\dim F_n,\quad N_n=\dim V_n.
```

Injectivity of left multiplication by t gives the displayed dimension
of E_n. For every w in W, wE_n=(wt)F_n is contained in V_n. Choose
C-linear projections pi_n:K->V_n and rho_n:K->E_n which are the
identity on their indicated ranges. Such projections exist by extending
bases; only their values on finite-dimensional subspaces are used.

Use the following finite linear maps, for the indicated block of the
A and B output spaces:

```math
A_{zh}^{a}:V_n\longrightarrow E_n,
       \quad v\longmapsto\rho_n(a_{zh}^{a}v),
```

```math
D_{zc}^{ij}:V_n\longrightarrow V_n,
       \quad v\longmapsto\pi_n(x_{zc}^{ij}v),
```

```math
(B_{zh}^{b})^{\mathsf T}:E_n\longrightarrow V_n,
       \quad v\longmapsto b_{zh}^{b}v.
```

The last map lands in V_n by construction. On E_n the intermediate
D projection has no effect, since x_(zc)^(ij)b_(zh)^b E_n lies in V_n.
Consequently

```math
A_{zh}^{a}D_{zc}^{ij}(B_{zh}^{b})^{\mathsf T}(v)
 =\rho_n(a_{zh}^{a}x_{zc}^{ij}b_{zh}^{b}v)
 \quad(v\in E_n).
```

Equation (1), followed by the linear map rho_n, therefore gives the
identity matrix on E_n for exactly the target coefficients and zero
for all other C/D/A/B coefficients. The C map in family z is
C_(hc) -> sum_(kl) c^(z)_(kl,hc) C_(kl). The D map is the map from
its c-labelled N_n by N_n coefficient matrix to the displayed matrices
D_(zc)^(ij). These are legitimate local maps, and none has access to a
forbidden source index. This proves (2). Finally the filtration growth
hypothesis gives N_n/M_n -> 1. QED.

### Why this includes rational operators

The denominator t changes the retained subspace to tF_n. It does not
replace a differential operator by the inverse of its finite truncation.
For every required operator word, its action on tF_n is computed in K
first and is already in V_n. The finite maps agree with those exact
actions. Thus poles or singular boundary eigenvalues of a chosen
truncation do not enter this proof.

## 4. The Weyl algebra satisfies the hypotheses

For s>=1 take the Weyl algebra A_s(C) generated by x_1,...,x_s and
partial_1,...,partial_s with

```math
[x_i,x_j]=[\partial_i,\partial_j]=0,\qquad
[\partial_i,x_j]=\delta_{ij}.
```

Let F_n be the span of the normally ordered monomials x^alpha
partial^beta with |alpha|+|beta|<=n. These monomials form a basis.
Spanning follows by repeatedly using the displayed commutation
relations. For independence, suppose a finite sum D=sum_beta p_beta(x)
partial^beta acts as zero on every polynomial. Apply it coefficient by
coefficient in the y variables to the formal series exp(sum_i x_i y_i).
Every coefficient is a polynomial in x, so the result is zero. But the
result is exp(sum_i x_i y_i) sum_beta p_beta(x)y^beta. The exponential
is invertible, hence every p_beta is zero. Thus the normally ordered
monomials are independent. The leading terms multiply as commuting
polynomials, since every commutator lowers total degree. The associated
graded algebra is therefore the polynomial algebra in 2s variables,
which is a domain; the nonzero leading terms of two nonzero elements
have nonzero product, proving that A_s(C) is a domain. Moreover

```math
\dim F_n=\binom{n+2s}{2s},\qquad
\frac{\dim F_{n+L}}{\dim F_n}\longrightarrow1
\quad\hbox{for fixed }s,L.
```

The Ore intersection argument above verifies the hypotheses of the
standard Ore localization theorem. We import that theorem in the form
stated in Peter Teichner, *Flatness and the Ore condition for rings*,
Proceedings of the American Mathematical Society 131 (2003),
1977--1980, final published version, Section 2, the unnumbered theorem
labelled "Theorem (Ore [4])" on page 1979:
<https://math.berkeley.edu/~teichner/Papers/ore.pdf>,
<https://doi.org/10.1090/S0002-9939-03-06975-2>. Its conclusion constructs
the ring of right fractions. In a domain every nonzero fraction ab^(-1)
has inverse ba^(-1), so this ring is a division algebra. The finite
common-right-denominator property follows by iterating the common
right-multiple condition. Thus the transfer theorem applies to any
finite rational identity in a Weyl division algebra. The number of generators and the degrees and
denominators may depend on q; after q is fixed, n may be chosen as
large as necessary.

## 5. Consequence for normalized spectral points

Let F be a normalized four-party spectral point for which D lies on
an AB geodesic. Write p=d_AB=d_AD+d_BD and

```math
\delta=u_{ACD}+u_{BCD}-u_{ABC}-d_{CD}.
```

Applying F to (2) gives

```math
q^\delta\leq r\left(\frac{N_n}{M_n}\right)^p.
```

Let n tend to infinity with q,r and the identity fixed. Then

```math
q^\delta\leq r.                                     \tag{3}
```

Consequently, legal identities (1) for an unbounded sequence of q
with log r/log q tending to zero would establish delta<=0 for every
such F. With the already established geodesic unit normalization
u_ABC=1 and the reverse inequality, this is the conditional geodesic
uncrossing equality. The repository's proved reduction then yields
omega_C=2. Equation (1) with these parameters is the unresolved step.

## 6. A failed CCR construction, recorded precisely

The relation [partial_h,x_i]=delta_hi does implement one copied label
using two legal families. It is tempting to append a second relation
[partial_j,x_b]=delta_jb. A construction which leaves the operators in
party order instead produces a coefficient partial_j x_b, equal to

```math
\partial_jx_b=\delta_{jb}+x_b\partial_j.
```

The second summand cannot be discarded just because it looks like a
radial correction. With j as block-row index and b as block-column
index, the matrix G_(j,b)=partial_j x_b factors as the gradient column
(partial_j)_j times the row (x_b)_b. Killing that row kills G itself,
including the proposed target identity. The residual blocks
x_b partial_j do not have the common row support required by that
quotient argument. No joint identity follows from the two scalar CCR
relations alone.

## Verification scope

The coefficient transfer, finite-flag maps, Ore intersection argument,
PBW independence argument, growth calculation, and spectral limit in
(3) are proved above. Ore localization existence is imported in the
precise form cited in Section 4. The geodesic-to-exponent reduction is
imported from [GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md). No new
subpolynomial-family rational identity, universal spectral inequality,
or bound on omega is claimed.

## 7. Rational central-parameter extension

The exact transfer also has the following degeneration version. Let R
be as in Section 2 and let R_epsilon=R tensor_C C(epsilon). Assume it is
a domain and has the same filtration growth over C(epsilon). Let
K_epsilon be its Ore division algebra, embedded in K((epsilon)) by
expanding central rational functions. This embedding is available for
the Weyl algebra: a nonzero polynomial or rational expression in the
central parameter has a nonzero leading coefficient in K, so its
inverse has a well-defined Laurent expansion.

Allow all operator entries in (1) to belong to K_epsilon and all C-map
coefficients to belong to C(epsilon). Replace (1) by the requirement
that, in K((epsilon)), its left-hand side equals

```math
\delta_{ki}\delta_{lj}\delta_{ai}\delta_{bj}\,1
       +O(\varepsilon)                               \tag{4}
```

for each coefficient. Then (2) holds with a degeneration in place of
an exact restriction, and N_n/M_n tends to 1 as before.

### Proof of the extension

Over C(epsilon), choose a common right denominator w_epsilon in
R_epsilon for the finite set of prefixes and full words used in the
proof of Section 3. The element w_epsilon is a finite linear
combination of elements of R with coefficients in C(epsilon).
Multiplying it by a central power of epsilon, normalize its least
coefficient valuation to zero. Its leading term w_0 in R is nonzero.
Choose a fixed L such that w_epsilon and every word times w_epsilon
belong to F_L tensor C(epsilon). This is possible because only
finitely many rational expressions are being considered.

Set E_(n,epsilon)=w_epsilon F_n and V_n=F_(n+L), now considered over
C(epsilon). Choose a basis e_1,...,e_M of F_n. The leading vectors
w_0 e_1,...,w_0 e_M are C-linearly independent because R is a domain.
In a fixed basis of V_n, the column matrix J_epsilon with columns
w_epsilon e_j is therefore regular at epsilon=0 and has an M by M
minor nonzero at zero. Selecting that minor and inverting it gives a
C(epsilon)-linear coordinate retraction

```math
\rho_\varepsilon:V_n\otimes\mathbb C(\varepsilon)
 \longrightarrow\mathbb C(\varepsilon)^M,
\qquad \rho_\varepsilon J_\varepsilon=I_M,
```

whose matrix entries are regular at zero. Extend this map linearly to
all of K_epsilon. No regularity is required of this extension outside
V_n. Choose a projection onto V_n over C(epsilon), and form the A,D,B
maps as in Section 3, with the retained abstract flag basis given by
the e_j and embedding J_epsilon. All their matrix entries belong to
C(epsilon), although individual entries may have poles.

The prefix protection again removes the intermediate projections.
For a complete coefficient g_epsilon in (4), the resulting finite
matrix is rho_epsilon g_epsilon J_epsilon. Since all full words times
w_epsilon lie in F_L tensor C(epsilon), this complete image lies in
V_n tensor C(epsilon). Its difference from the target embedding is

```math
(g_\varepsilon-\delta\,1)\,w_\varepsilon e_j
 \in \varepsilon K[[\varepsilon]]
       \cap(V_n\otimes\mathbb C(\varepsilon)).
```

For a fixed C-basis of V_n, belonging to epsilon K[[epsilon]] means
that every basis coefficient has valuation at least one. Indeed, a
lowest coefficient with negative or zero valuation would give a
nontrivial C-linear relation among those basis vectors in K. The
regular retraction rho_epsilon therefore sends the residual to
O(epsilon). The complete output is the target plus O(epsilon), as
required for a degeneration. The dimension ratio is unchanged.

### Honest Laurent-series entries

There is also a finite-jet extension to a finite collection of local
entries in K((epsilon)), with central C-map entries in C((epsilon)).
Assume these entries satisfy (4). Choose m>=0 so that every nonzero
local entry has valuation at least -m. Truncate every entry after
exponent H, where H>=3m. Each discarded tail has order at least H+1.
Every coefficient is a sum of products of four entries, namely c,a,x,b.
Expanding the difference between an original product and its truncated
product telescopically, each term contains one discarded tail and
three factors of valuation at least -m. Its valuation is at least
H+1-3m>=1. Thus all coefficients through order zero are preserved.

Only finitely many coefficients of K are retained. The resulting
operator maps lie in K[epsilon,epsilon^(-1)], which is contained in
K_epsilon, and the C maps lie in C[epsilon,epsilon^(-1)]. The rational
proof applies to these finite jets. Therefore a fixed finite PBW
ambient space is only needed after truncation. Unbounded PBW degrees
among later positive-order coefficients do not prevent this argument.
This establishes a finite-jet realization of the desired degeneration;
it does not assert an exact rational solution of all the formal
identities.

An expression with infinitely many negative powers, such as
exp(X/epsilon), is not an element of K((epsilon)) and is not covered.
Nor does this theorem permit the multiplication law of the coefficient
algebra to vary with epsilon without a separate identification and
verification of the hypotheses.

## 8. A finite replay of the rational transfer

The identity

```math
-x^2\partial x^{-1}+x\partial=1
```

in the first Weyl division algebra gives a small test of the denominator
order and the projections. It follows directly from
partial x=x partial+1. Here a common right denominator for all needed
prefixes is w=x. Use E_n=xF_n and V_n=F_(n+3). The two B maps from the
abstract retained basis x^a partial^b are respectively the monomials
x^a partial^b and x^(a+1) partial^b. The intermediate map is left
multiplication by partial. The A maps are the coordinate retraction to
E_n after multiplication by -x^2 and by x. Thus the two output columns
sum exactly to the original retained flag column, including at its
boundary.

The companion program [check_weyl_transfer_example.py](check_weyl_transfer_example.py) checks all
columns for n=0,1,2,4,8,16,32 using integer PBW coefficients. It passed
for all 784 columns across those cases. This is a replay of one rational
operator identity, not a geodesic-trade construction. The general
transfer is established by the proof in Section 3, not by this finite
check.


## Internal review and remaining obligation

The operator-comparison worker derived this transfer. The constructive
worker and root independently checked the right-denominator order,
the common ambient flag, the independence of the D map from the
source label, and the regular coordinate retraction in the Laurent
case. Root also checked the finite-jet error bound and reran the exact
784-column example. These are internal written-proof reviews and
finite cross-checks, not Lean verification or external peer review.

[JOINT_FOURIER_CCR_RESIDUAL.md](JOINT_FOURIER_CCR_RESIDUAL.md)
records one proposed input to the transfer. Its scalar contraction
has the desired indices, but a nonzero higher-degree coefficient
prevents it from satisfying (1) or (4). Producing a legal joint
identity or degeneration with subpolynomial family count remains
unresolved. No priority claim is made for the general finite-subspace
method used in this transfer.
