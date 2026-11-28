# Overlapping unit tensors: obstruction to finite uncrossing

Status: a proved family of finite conversion obstructions and a sharp restricted overhead bound. The
corresponding universal asymptotic inequality is not established or
refuted here. No matrix multiplication exponent conclusion follows.

## The proposed additional inequality

Fix a finite party set `I`. For `H` a subset of `I`, let `U_H(q)` be the
rank-`q` unit tensor on the parties in `H` when `|H|>=2`, padded by a fixed nonzero
vector at every other party. For `|H|<=1`, define `U_H(q)` to be a
nonzero simple tensor. For a normalized spectral point
`F` on the `I`-party tensor semiring, write

```math
F(U_H(q))=q^{u(H)}\qquad(q\ge2).
```

The exponent is independent of `q` by the usual monotone multiplicative
integer-sequence argument. In particular, `u(I)=1`, singleton charges
are zero, and inclusion of sets gives monotonicity of the charges.

One possible additional axiom would be intersecting submodularity:

```math
u(S)+u(T)\ \ge\ u(S\cup T)+u(S\cap T),
\qquad S\cap T\ne\varnothing.                         \tag{U}
```

It passes every flattening point. For such a point, `u(H)` is the
indicator that `H` meets both sides of a fixed bipartition. If the
intersection meets both sides, all four charges in (U) are one. If the
intersection is confined to one side and the union crosses the
bipartition, at least one of `S,T` crosses it. These cases prove (U).

The elementary fusion restriction proves only

```math
U_{S\cup T}(q)\preceq U_S(q)\otimes U_T(q),
```

and hence `u(S union T) <= u(S)+u(T)`. To realize this restriction,
choose a party in the intersection and let its local map retain only
equal values of the two unit indices. Every party then has the common
index; unused copies can be discarded. This operation does not retain
another rank-`q` unit on the intersection.

The following theorem rules out that stronger finite conversion.

## Theorem: the uncrossed target is not a degeneration of the source

Over any field `K`, put

```math
X_q=U_{ABC}(q)\otimes U_{ABD}(q),\qquad
Y_q=U_{ABCD}(q)\otimes U_{AB}(q).
```

For every integer `q` at least two, `Y_q` is not a restriction or a
Laurent-series degeneration of `X_q` as a four-party tensor. A
Laurent-series degeneration consists of four separate linear maps
over `K((t))` whose tensor image, after removing one common power
of `t`, has leading coefficient `Y_q`. The same proof works after
any field extension. Over the complex numbers this also excludes
the usual orbit-closure degeneration. In particular, no positive
equal tensor powers of `X_2` and `Y_2` admit that degeneration.

### Determinant pencils

For a tensor in local dimensions `(q^2,q^2,q,q)`, contract its last two
factors with a matrix of indeterminates `Z=(z_ij)` and take the
determinant of the resulting matrix on the first two factors:

```math
M_T(Z)_{a,b}=\sum_{i,j}T_{a,b,i,j}z_{ij},\qquad
f_T(Z)=\mathop{\mathrm{det}} M_T(Z).
```

Index the first two factors by pairs `(i,j)`. Then the source and target
have diagonal matrix pencils, and

```math
f_{X_q}(Z)=\prod_{i,j=1}^q z_{ij},\qquad
f_{Y_q}(Z)=\prod_{i=1}^q z_{ii}^{q}.                 \tag{G}
```

For square local maps, direct contraction gives

```math
M_{(L_A\otimes L_B\otimes L_C\otimes L_D)T}(Z)
=L_A M_T(L_C^{\mathsf T} ZL_D)L_B^{\mathsf T}.
```

Thus the determinant pencil of any local image of `X_q` is either
zero or a scalar multiple of

```math
\prod_{i,j=1}^q a_i^{\mathsf T}Zb_j,                 \tag{C}
```

where `a_i` and `b_j` are nonzero vectors. These vectors are the
columns of the two last local maps whenever the determinant is
nonzero.

Suppose a Laurent-series degeneration from `X_q` to `Y_q` existed.
Rescale it so that the transformed tensor is `Y_q+O(t)`. Its
determinant pencil is then `f_(Y_q)+O(t)`, with nonzero constant
polynomial. In particular, the determinant of each of its first two
local maps is nonzero in `K((t))`, and every vector in (C) is nonzero.

For each vector `a_i(t)`, factor out the minimum valuation among its
nonzero entries, writing `a_i=t^(v_i) a_i^0(t)` with `a_i^0` a power
series vector whose constant term is nonzero. Do the same for
`b_j`. The product

```math
G(t,Z)=\prod_{i,j}(a_i^0(t))^{\mathsf T}Zb_j^0(t)
```

has nonzero constant polynomial: every leading linear form is
nonzero, and their product is nonzero in a polynomial ring over a
field. After absorbing the extracted powers and the first two
determinants into a scalar `alpha(t)`, the pencil is
`alpha(t) G(t,Z)`. Its nonzero constant leading polynomial forces
`alpha(t)` to have valuation zero and a nonzero leading scalar.
Taking that leading coefficient expresses `f_(Y_q)` as a scalar
multiple of a grid product (C) of the normalized leading vectors.

Unique factorization of polynomials now forces every linear factor
`a_i^T Z b_j` to be proportional to some diagonal coordinate `z_kk`.
Fixing one pair `(i_0,j_0)` forces `a_(i_0)` and `b_(j_0)` both to
be proportional to the same coordinate vector `e_k`. Considering
all pairs `(i_0,j)` then forces every `b_j` to be proportional to
`e_k`; considering `(i,j_0)` forces every `a_i` to be proportional
to `e_k`. The product would therefore have just the single linear
factor `z_kk`, with multiplicity `q^2`. This contradicts the `q`
distinct factors of the target in (G).

This proves the theorem. Since `X_2` to the `n`th tensor power is
equivalent to `X_(2^n)`, and likewise for `Y`, it also proves the
equal-power assertion.

### Corollary: a common full-unit catalyst does not help

For every `q>=2` and positive integer `r`, there is no degeneration

```math
X_q\otimes U_{ABCD}(r)
\longrightarrow Y_q\otimes U_{ABCD}(r).
```

The local dimensions are now `(rq^2,rq^2,rq,rq)`. With `k` the
index of the common full-party unit, the source determinant pencil is

```math
\prod_{k=1}^{r}\prod_{i,j=1}^{q}z_{(k,i),(k,j)}.
```

After local maps it is a scalar multiple of a product of `r`
Cartesian grids

```math
\prod_{k=1}^{r}\prod_{i,j=1}^{q}a_{k,i}^{\mathsf T}Zb_{k,j}.
```

Normalizing vector valuations as above shows that its nonzero
leading polynomial still has this product-of-grids form. The target determinant is

```math
\prod_{k=1}^{r}\prod_{i=1}^{q}z_{(k,i),(k,i)}^{q}.
```

If a limiting grid product equaled this target, unique factorization
would force every factor to be a diagonal coordinate. The preceding
argument applies separately within each grid: all `q^2` factors in
that grid must be proportional to the same diagonal coordinate.
Every resulting multiplicity would therefore be a multiple of
`q^2`, whereas every target multiplicity is `q`. This is impossible.
The statement includes arbitrary equal tensor powers, by replacing
`q` with its corresponding power.

### Corollary: the general overlap case

Let `S,T` have nonempty intersection. If they are nested, the
uncrossing conversion is just an identity. If the intersection has
one party, its unit tensor is simple and the fusion restriction
above supplies the conversion.

If instead both `S minus T` and `T minus S` are nonempty and the
intersection contains at least two parties, the finite uncrossing
degeneration is impossible, even with a common full-party unit
catalyst. Partition the intersection into two nonempty groups and
regroup these as parties `A,B`, with the two differences regrouped
as `C,D`. Include any parties outside the union in the `A` group.
The two tensors become `X_q` and `Y_q`; a common unit remains a common unit under
regrouping. A proposed degeneration before regrouping would give
one of the degenerations just ruled out. This proves the claim.

## Source-only unit overhead: a sharp restricted calculation

The preceding theorem puts the same unit on both sides. A unit attached
only to the source is a different resource. In this section consider

```math
U_{ABCD}(r)\otimes X_q\longrightarrow Y_q.
```

The source local dimensions are `(rq^2,rq^2,rq,rq)` and the target
dimensions are `(q^2,q^2,q,q)`. The first two maps are now rectangular,
so their determinant cannot be factored out of the matrix pencil.
Cauchy--Binet gives a sum of products of selected source factors,
rather than the full grid product used above.

### A restriction with `r=sqrt(q)` when `q` is a square

Put `q=m^2` and `r=m`. Label a source unit index by `k` in `[m]`,
and the two `X_q` indices by `i=(s,u)` and `j=(t,v)` in `[m]^2`.
Thus the source term is

```math
e_{k,s,u,t,v}^A e_{k,s,u,t,v}^B e_{k,s,u}^C e_{k,t,v}^D.
```

On both `A` and `B`, send the displayed basis vector to zero unless
`s=t`; when they are equal, send it to the basis vector labeled
`((k,s),(u,v))`. On `C`, send `(k,s,u)` to `(k,s)`. On `D`, send
`(k,t,v)` to `(k,t)`. All maps are monomial restrictions. The surviving
tensor is exactly

```math
\sum_{k,s,u,v\in[m]}
 e_{(k,s),(u,v)}^A e_{(k,s),(u,v)}^B
 e_{(k,s)}^C e_{(k,s)}^D=Y_q.
```

The common full-party label `(k,s)` and the independent `AB` label
`(u,v)` both have `q` values. Each target term occurs once.

This construction yields no additional spectral inequality. It is
also obtained by dividing the two tensor copies into two roles:
fuse one copy `X_m` to `U_(ABCD)(m)`, restrict the other copy to
`U_(AB)(m^2)`, and use the supplied `U_(ABCD)(m)` to complete the
full unit of rank `m^2`. In general set notation the resulting bound
is

```math
u(S)+u(T)\ge\tfrac12u(S\cup T)+u(S\cap T).
```

It already follows by averaging the fusion bound
`u(S)+u(T)>=u(S union T)` and the inclusion bound
`u(S)+u(T)>=2u(S intersection T)`.

### Matching lower bound when only the last two maps are monomial

Suppose the `C` and `D` maps are monomial over `K((t))`: each standard
basis vector is sent either to zero or to a scalar Laurent series
times one standard target basis vector. No restriction is placed on
the linear or Laurent-series maps on `A,B`. The transformation may
be a restriction or a degeneration. Then necessarily

```math
r\ge\sqrt q.
```

For source block `k` and target label `ell`, let `n_(k,ell)` be the
number of its `q` source `C` basis vectors assigned nontrivially to
`ell`; define `m_(k,ell)` on `D` in the same way. Monomiality gives

```math
\sum_{\ell=1}^q n_{k,\ell}\le q,\qquad
\sum_{\ell=1}^q m_{k,\ell}\le q.
```

The `AB` matrix slice at target coordinates `(C,D)=(ell,ell)` is
a sum of at most

```math
N_\ell=\sum_{k=1}^r n_{k,\ell}m_{k,\ell}
```

rank-one `AB` matrices. This remains true with arbitrary maps on
`A,B` and with arbitrary scalar Laurent coefficients on the monomial
maps. Its matrix rank over `K((t))` is at most `N_ell`. In `Y_q`,
that slice is an identity matrix of size `q` on the block indexed by
`ell`, so its rank is `q`.

The same rank bound applies to the leading slice in a degeneration.
Indeed, after the common leading power is removed, if `N_ell` were
smaller than `q`, every `q`-by-`q` minor would vanish identically as
a Laurent series. The target identity-block minor has constant
coefficient one, which is impossible. Consequently

```math
q\le\sum_k n_{k,\ell}m_{k,\ell}
\qquad\text{for every }\ell.
```

Taking square roots, summing, and applying the Cauchy--Schwarz
inequality gives

```math
\begin{aligned}
q\sqrt q
&\le\sum_\ell\sqrt{\sum_k n_{k,\ell}m_{k,\ell}}
\\ &\le\sum_k\sum_\ell\sqrt{n_{k,\ell}m_{k,\ell}}
\\ &\le\sum_k\sqrt{
 \left(\sum_\ell n_{k,\ell}\right)
 \left(\sum_\ell m_{k,\ell}\right)}
\le rq.
\end{aligned}
```

This proves the bound. For even tensor powers, the construction
attains it. Thus source-only subexponential unit overhead cannot
supply the uncrossing conversion in this restricted class, even
allowing arbitrary interference and Laurent cancellation on `A,B`.
Arbitrary mixing on `C,D` invalidates the counting premise. The
argument proves no lower bound for that unrestricted case.

### Every three-party regrouping admits the conversion

There is a further structural reason that three-party checks do not
decide this comparison. Regroup any pair of the four parties into
one party. The resulting source always restricts to the resulting
target:

- Merging `A,B` turns the source into two wires from the merged
  party to `C,D`. The target is a three-party unit, apart from a
  simple factor at the merged party. Equal-index projection at that
  party supplies the unit.
- Merging `C,D` turns the source into a three-party unit of rank
  `q^2`. The target is a unit of rank `q` times an `AB` wire of rank
  `q`, which has an explicit rank-`q^2` expansion and is a restriction
  of that source unit.
- Merging any of `A,C`, `A,D`, `B,C`, or `B,D` makes the source and
  target isomorphic, after permuting the local product factors.

Therefore every spectral point obtained by pulling back a
three-party spectral point through one of these regroupings satisfies
the proposed uncrossing comparison. A spectral obstruction to the
unrestricted asymptotic comparison, if one exists, cannot be one of
these pullback points.

## An independent polynomial certificate at `q=2`

Here put `X=X_2` and `Y=Y_2`. Both tensors have local dimensions
`(4,4,2,2)`. With the two-bit label `a=2i+j` at each of the first
two parties, they can be written as

```math
X=\sum_{i,j\in\{0,1\}} e_{2i+j}^A e_{2i+j}^B e_i^C e_j^D,
\qquad
Y=\sum_{i,j\in\{0,1\}} e_{2i+j}^A e_{2i+j}^B e_i^C e_i^D.
```

### Exact restrictions already fail

Their four one-party flattening ranks are the same full ranks
`(4,4,2,2)`. Any local maps sending `X` to `Y` would therefore all be
invertible. But their `AB | CD` flattening ranks are respectively four
and two. Invertible local maps preserve this rank, a contradiction.

To exclude degeneration as well, we give an explicit polynomial that
vanishes on every local image of `X` but not on `Y`.

### An eight-copy determinant contraction

Let `epsilon_4(a,b,c,d)` be the alternating four-index symbol on
`{0,1,2,3}`, equal to one at `(0,1,2,3)`, and let
`epsilon_2(0,1)=1`, `epsilon_2(1,0)=-1`, with repeated-index values zero.
For a tensor with coordinates `T_(a,b,c,d)`, define the degree-eight
polynomial

```math
\begin{aligned}
P(T)=\sum
&\epsilon_4(a_0,a_1,a_2,a_3)
 \epsilon_4(a_4,a_5,a_6,a_7)
\\ &\cdot\epsilon_4(b_0,b_1,b_4,b_7)
 \epsilon_4(b_2,b_3,b_5,b_6)
\\ &\cdot\epsilon_2(c_1,c_5)\epsilon_2(c_0,c_3)
 \epsilon_2(c_4,c_6)\epsilon_2(c_2,c_7)
\\ &\cdot\epsilon_2(d_0,d_3)\epsilon_2(d_1,d_5)
 \epsilon_2(d_4,d_7)\epsilon_2(d_2,d_6)
 \prod_{r=0}^{7}T_{a_r b_r c_r d_r}.
\end{aligned}                                                   \tag{P}
```

The sum runs over every indicated tensor index. Each local index
occurs in exactly one alternating symbol. The determinant identity
therefore gives, for square local linear maps `L_A,L_B,L_C,L_D`,

```math
P((L_A\otimes L_B\otimes L_C\otimes L_D)T)
=(\mathop{\mathrm{det}} L_A)^2(\mathop{\mathrm{det}} L_B)^2(\mathop{\mathrm{det}} L_C)^4(\mathop{\mathrm{det}} L_D)^4 P(T). \tag{D}
```

This identity holds for singular maps too, since it is a polynomial
identity. Thus the zero set of `P` is preserved by restrictions and
by taking limits of local images.

### Evaluation on the source

A nonzero tensor coefficient of `X` forces

```math
b_r=a_r,\qquad
c_r=\left\lfloor a_r/2\right\rfloor,\qquad d_r=a_r\bmod2.
```

For a nonzero summand of (P), the first `A` alternating symbol requires
`a_0,a_1,a_2,a_3` to be all four two-bit values. The `C` and `D`
symbols both pair positions `(0,3)` and `(1,5)`. Consequently

```math
a_3=a_0\mathbin{\oplus}3,\qquad a_5=a_1\mathbin{\oplus}3.
```

The two values remaining after `a_0,a_3` are removed are a complementary
pair. Therefore the first `A` symbol also forces
`a_2=a_1 xor 3=a_5`. The second `B` symbol contains both `b_2=a_2`
and `b_5=a_5`, so it is zero. Every summand vanishes, proving

```math
P(X)=0.
```

### Evaluation on the target

For a nonzero coefficient of `Y`, one instead has

```math
b_r=a_r,\qquad c_r=d_r=\left\lfloor a_r/2\right\rfloor.
```

The pair constraints and the requirement that every four-index
alternating symbol contain all four labels force precisely the
following eight assignments. Choose `i,t,v` independently in
`{0,1}` and put

```math
\begin{aligned}
a_0&=2i+t,& a_1&=2(1-i)+v,
\\ a_2&=2i+(1-t),&a_3&=2(1-i)+(1-v),
\\ a_4&=a_2,&a_5&=a_0,&a_6&=a_1,&a_7&=a_3.
\end{aligned}                                                   \tag{E}
```

For completeness, the bit constraints first imply

```math
(c_0,c_1,c_2,c_3,c_4,c_5,c_6,c_7)
=(i,1-i,i,1-i,i,i,1-i,1-i).
```

Indeed the four pairings give `c_2=c_4`, `c_6=c_7=1-c_2`,
`c_3=1-c_0`, and `c_5=1-c_1`. Having two zeros and two ones in the
first `A` symbol gives `c_2=1-c_1`; the first `B` symbol then gives
`c_0=1-c_1`. Repeated group-bit values in each four-index symbol
must carry opposite low bits, yielding exactly (E).

For each assignment (E), the product of the two `A` signs is one,
and the product of the two `B` signs is one. The four `C` signs
have product minus one, and so do the four `D` signs. Each of the
eight assignments contributes one. Hence

```math
P(Y)=8\ne0.
```

By (D), this independently excludes `Y` from the orbit closure of
`X` at `q=2`. This polynomial proof also works over every field whose
characteristic is different from two.

## The scalar model would fail the proposed inequality

For a finite metric set `H`, write

```math
g(H)=2\max_{\mu\in\mathcal P(H)}
\sum_{x,y\in H}\mu(x)\mu(y)d(x,y).
```

Let `A,B,C,D` be successive vertices of a Euclidean square of side
length one. Use `S={A,B,C}` and `T={A,C,D}`, so the intersection is
the diagonal pair `{A,C}`. Direct maximization gives

```math
g(AC)=\sqrt2,\qquad
g(ABCD)=1+\frac{\sqrt2}{2},\qquad
g(ABC)=g(ACD)=\frac4{4-\sqrt2}.
```

For the triangle, set the two diagonal-endpoint masses to
`(s+z)/2,(s-z)/2`, and the remaining mass to `1-s`. Twice the
distance energy is

```math
4s+(\sqrt2-4)s^2-\sqrt2 z^2.
```

It is maximized at `z=0` and `s=2/(4-sqrt2)`, giving the displayed
value. For the square, its distance matrix has the constant vector
as an eigenvector and has eigenvalues `-sqrt2,-sqrt2,sqrt2-2` on
the zero-sum subspace. Its energy is therefore uniquely maximized
by the uniform distribution, giving the stated square charge.

Consequently

```math
g(S\cup T)+g(S\cap T)-g(S)-g(T)
=\frac{13\sqrt2-18}{14}>0.
```

An arbitrarily small translated square fits inside the equilateral
triangle used by the normalized `3/4` scalar countermodel. All charges
scale linearly, so the strict failure persists on that auxiliary
subset. Thus (U) would impose a constraint absent from that scalar
model. This observation does not prove (U). It also does not make (U) a
decisive scalar condition: [TRIPOD_COUNTERMODEL.md](TRIPOD_COUNTERMODEL.md)
constructs a different normalized perimeter-`9/4` model satisfying
(U), full crossing, coherent retraction extensions, and all the stated
hypergraph mincut tests.

## The unresolved asymptotic implication

For every normalized spectral point to satisfy (U), it would suffice
to establish the corresponding asymptotic restriction

```math
U_S(q)\otimes U_T(q)
\ \gtrsim\ U_{S\cup T}(q)\otimes U_{S\cap T}(q).
```

By Strassen spectral duality, the universal spectral comparison is
also equivalent to this asymptotic comparison; see Christandl,
Vrana and Zuiddam, [arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3),
Theorem 1.1. The determinant-pencil
obstruction excludes the finite degeneration at every `q`, including
every equal tensor power of the `q=2` pair, with any common full-party
unit catalyst. The degree-eight polynomial is an independent finite
certificate at `q=2`. A second binary proof, using homogeneous degree-four
covariant equations, is given in [UNIT_UNCROSSING_COVARIANT.md](UNIT_UNCROSSING_COVARIANT.md). These exclude the most direct suggested proof of
the comparison. They do not exclude
conversions of tensor powers with subexponential unit overhead, whose
source and target local spaces have different dimensions. In
particular, a unit attached only to the source is not a common
catalyst, and the square determinant transformation used above no
longer applies to the first two local maps. The later
[explicit separator proof](UNCROSSING_ASYMPTOTIC.md) establishes this
asymptotic conversion with source overhead $`q^{O_q(N^{2/3})}`$ for
$`N`$ copies. The determinant obstruction proved here remains a finite
and common-catalyst result.

Moreover, the normalized extension theorem provides one extension
for each fixed coherent law on retractions. It does not permit
independently chosen laws on overlapping subsets to be imposed on
the same point, and it does not assert that arbitrary Euclidean
placements of the auxiliary parties occur in the spectrum.

The exact failed conversion and the invariant above are the proved
result of this attack. The perimeter bound remains unresolved.
