# Tensor constraints beyond the tripod scalar model

Status: research. The lemmas below are proved deductions and exact finite
obstructions. The gluing implication identified at the end remains
unproved. The companion [tripod extension criterion](TRIPOD_EXTENSION_CRITERION.md)
states exactly when a normalized geodesic center can be added; existence
of such a center is not assumed here. No conclusion that the complex matrix multiplication exponent
equals two is asserted.

All tensor products are regrouped by their named parties. A normalized
spectral point is additive on full direct sums, multiplicative on tensor
products, restriction-monotone, and takes value $`r`$ on the full unit
tensor $`U_I(r)`$. Its wire exponents and subset-unit charges are

```math
F(W_{ij}(r))=r^{d_{ij}},\qquad
F(U_H(r))=r^{u(H)}.
```

Here subset tensors are padded by one-dimensional factors at parties
outside the subset. The companion `NORMALIZED_EXTENSION.md` proves the
power law and normalization of restrictions after rescaling by $`u(H)`$.

## 1. Normalization does not make the price metric Hilbertian

Christandl, Vrana and Zuiddam,
[*Universal points in the asymptotic spectrum of tensors*,
arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3), Theorem 3.30 and
Corollary 3.31, supply a normalized spectral point for every probability
vector of singleton entropy weights. On four parties choose

```math
(\theta_A,\theta_B,\theta_C,\theta_D)=(1/3,1/3,1/3,0).
```

On a wire, only its two endpoints have nonzero marginal entropy, so this
point has

```math
d_{AB}=d_{BC}=d_{CA}=2/3,\qquad
d_{AD}=d_{BD}=d_{CD}=1/3.
```

This is a genuine normalized spectral point whose four-party metric is a
tripod with three positive arms. It cannot be isometrically embedded in a
Hilbert space. Indeed, translate the image of $`D`$ to zero. Equality in
each of the three triangle inequalities through $`D`$ would make each
pair of the three nonzero endpoint vectors point in opposite directions.
The first two such equalities make two of them point in the same
direction, contradicting the third.

Its full-unit charge is one. The energy charge of the same three endpoints
in `TRIPOD_COUNTERMODEL.md` is only $`8/9`$. Therefore the unresolved
normalization information concerns the relation between unit charges and
distances. A blanket Hilbert-realizability assertion about the distance
itself is false.

## 2. Zero wire distance identifies parties on every tensor

Let $`D,E`$ be parties, let $`T`$ be a tensor, and let $`n`$ be its local
dimension at $`D`$. Write $`T^{D\to E}`$ for merging its $`D`$ factor into
$`E`$, then padding the old $`D`$ party by a one-dimensional factor. Then

```math
T\le T^{D\to E}\otimes W_{DE}(n),\qquad
T^{D\to E}\le T\otimes W_{DE}(n).                 \tag{1}
```

These are explicit restrictions. Write the old $`D`$ basis as $`e_i`$.
For the first restriction, the merged $`E`$ factor contains the old
$`e_i`$ and one endpoint $`e_j`$ of the auxiliary wire. Contract these
two coordinates by $`\delta_{ij}`$, leaving the other endpoint at $`D`$.
For the second restriction, contract the old $`D`$ coordinate against its
wire endpoint, and reinterpret the other endpoint as the transferred
coordinate at $`E`$. All other parties apply identity maps.

Consequently, for every nonzero $`T`$,

```math
n^{-d_{DE}}F(T^{D\to E})\le F(T)
\le n^{d_{DE}}F(T^{D\to E}).                     \tag{2}
```

In particular, if $`d_{DE}=0`$, merging these parties preserves the value
of every tensor. The resulting functional on the quotient party set is
normalized: the full unit on the quotient is the merged full unit, and
(2) preserves its value. Thus coincident points are not merely
indistinguishable on wires; they are indistinguishable for the entire
tensor functional.

Padding by a scalar factor alone does not preserve direct sums. The
quotient functional is initially a normalized cover functional;
`NORMALIZED_EXTENSION.md`, Lemma 1, supplies its full additivity. This
avoids assuming that padding is a semiring homomorphism.

This lemma does not require choosing another extension law. It holds
within any one already chosen spectral point.

## 3. A geodesic triple has a completely determined restricted spectrum

Suppose a normalized point on any party set has distinct labels $`A,B,D`$
with

```math
d_{AB}=d_{AD}+d_{DB}=a>0.
```

Then its unit charge on these three parties is exactly $`a`$.
Indeed, $`U_{ABD}(r)`$ restricts to $`W_{AB}(r)`$, so $`u(ABD)\ge a`$.
The restriction to the three-party tensor semiring is a cover functional
with full-unit exponent $`h=u(ABD)`$. Dividing its logarithms by $`h`$
gives a normalized three-party spectral point. Every such point has
matrix-multiplication perimeter at least two, by the tight-tensor
asymptotic-subrank theorem used in `SPECTRAL_MODEL.md`. Hence

```math
2a=d_{AB}+d_{AD}+d_{BD}\ge2u(ABD),
```

and equality follows.

The normalized restriction therefore has wire exponent one on $`AB`$.
Alman, Li and Pratt,
[*The edge of the asymptotic spectrum of tensors*,
arXiv:2604.01386v2](https://arxiv.org/html/2604.01386v2), Corollary 8.10,
then determines the entire restricted point. For every tensor $`T`$
supported on $`A,B,D`$,

```math
F(T)=\left(\zeta^{(d_{AD}/a,\ d_{BD}/a,\ 0)}(T)\right)^a.          \tag{3}
```

The ordering of the three weights is $`A,B,D`$. Their values follow by
evaluating the two wires incident to $`D`$; Corollary 8.10 gives uniqueness
on all tensors, not merely on those wires.

Applied to a genuine midpoint extension, (3) says that the entire
$`ABD`$ subsemiring is fixed as
$`(\zeta^{(1/2,1/2,0)})^{d_{AB}}`$. The all-tensor extension theorem
simultaneously preserves the original point on every old tensor. These
two statements belong to one extension with one fixed law.

For a genuine tripod with center $`D`$ and arm lengths $`a,b,c>0`$, the
three overlapping subsemirings would therefore satisfy

```math
\begin{aligned}
F|_{ABD}&=(\zeta^{(a/(a+b),\ b/(a+b),\ 0)})^{a+b},
\\ F|_{ACD}&=(\zeta^{(a/(a+c),\ c/(a+c),\ 0)})^{a+c},
\\ F|_{BCD}&=(\zeta^{(b/(b+c),\ c/(b+c),\ 0)})^{b+c}.
\end{aligned}                                                     \tag{4}
```

This is information about arbitrary tensors omitted by the scalar
countermodel. It does not yet prove that these three restrictions force
$`u(ABC)\ge a+b+c`$ or $`u(ABCD)\ge a+b+c`$.

## 4. A concrete signed quadratic target

Zhou's normalized copositivity condition is
$`J-2D\in\mathop{\mathrm{COP}}`$. A stronger candidate is

```math
J-2D\succeq0.                                      \tag{5}
```

No proof of (5) for arbitrary spectral points is supplied here. It is
strictly stronger than the scalar conditions already verified.

For a star metric on $`A,B,C,D`$ with center $`D`$ and arm lengths
$`a,b,c`$, substituting the signed vector
$`z=(1/2,1/2,1/2,-1/2)`$ gives

```math
z^{\mathsf T}(J-2D)z=1-(a+b+c).                  \tag{6}
```

Thus this one signed test would exclude the normalized energy tripod,
whose three arms sum to $`9/8`$.

Known singleton quantum points do satisfy (5). With singleton weights
$`\theta_i\ge0`$ summing to one, their wire distances are
$`d_{ij}=\theta_i+\theta_j`$ for different labels. For a real vector
$`z`$, put $`s=\sum_i z_i`$ and $`m=\sum_i\theta_i z_i`$. Then

```math
z^{\mathsf T}(J-2D)z
=(s-2m)^2+4\left(\sum_i\theta_i z_i^2-m^2\right)\ge0.
```

The same holds for flattening points, where the matrix is the Gram
matrix of the two signs assigned by the cut. These examples do not
prove a universal condition.

This must also be distinguished from an upper bound on a graph exponent
by an SDP optimum. Zhou v3, Section 5.5 and its Open Problems section,
prove that the relevant CP and SDP optima agree for at most four
vertices, for nonnegative edge objectives. That does not put every
individual spectral matrix in the PSD feasible set. The proof can
replace a metric by a coordinatewise larger SDP-feasible metric; such a
replacement is inadequate for a signed inequality whose spoke terms
occur on the right side.

The particular signed test is equivalent to the numerical inequality

```math
d_{AB}+d_{BC}+d_{CA}
\le1+d_{AD}+d_{BD}+d_{CD}.                        \tag{7}
```

A sufficient tensor statement is the asymptotic comparison

```math
U_{ABCD}(q)W_{AD}(q)W_{BD}(q)W_{CD}(q)
\gtrsim M_q(ABC)\otimes1_D.                       \tag{8}
```

All cut flattenings pass (8). Its source allows the $`D`$ contraction to
choose a direct sum of $`q`$ arbitrary $`q\times q\times q`$ tensors on
$`A,B,C`$. Establishing the asserted asymptotic conversion remains a
separate tensor problem. The scalar inequalities alone do not establish
it.

### 4.1. A finite obstruction from the tensor centroid

Write the source of (8) as $`S_q`$ and its target as $`T_q`$. For every
$`q\ge2`$ there is no finite Laurent degeneration $`S_q\unrhd T_q`$.
This remains true after equal tensor powers and after multiplying both
sides by any common full unit. It is not an obstruction to source-only
subexponential overhead.

For a three-party tensor $`T\in V_A\otimes V_B\otimes V_C`$, define its
centroid to be the vector space

```math
Z(T)=\{(X_A,X_B,X_C):
(X_A\otimes1\otimes1)T
=(1\otimes X_B\otimes1)T
=(1\otimes1\otimes X_C)T\}.
```

It is the kernel of a matrix whose entries depend linearly on the tensor
coefficients. Consequently, its dimension cannot decrease under a
Laurent specialization: every minor vanishing over $`\mathbb C((t))`$
also vanishes at $`t=0`$ after the tensor coefficients have a finite
limit. Invertible local maps preserve its dimension.

The centroid of a nonzero direct sum of $`b`$ tensors has dimension at
least $`b`$: the triples of coordinate projections onto its individual
summands belong to the centroid and are linearly independent.

The centroid of $`M_q`$ has dimension one. Here is a direct proof using
the equivalent trilinear form $`\mathop{\mathrm{tr}}(ABC)`$. A centroid
triple of linear maps $`x,y,z`$ satisfies

```math
\mathop{\mathrm{tr}}(x(A)BC)
=\mathop{\mathrm{tr}}(Ay(B)C)
=\mathop{\mathrm{tr}}(ABz(C))
```

for all matrices. Nondegeneracy of the trace pairing first gives
$`x(A)B=Ay(B)`$. Putting either argument equal to the identity yields
$`x(A)=AP`$ and $`y(B)=PB`$ for one matrix $`P`$. The last equality
then gives $`PBC=Bz(C)`$. Setting $`B=1`$ gives $`z(C)=PC`$, whence
$`PB=BP`$ for every matrix $`B`$. Therefore $`P`$ is scalar. Passing
between tensors and trilinear forms only dualizes the three maps, so
the same centroid dimension holds for the tensor convention above.

Now suppose a Laurent degeneration $`S_q\unrhd T_q`$ existed. Contract
its output $`D`$ factor. Before applying its $`A,B,C`$ maps, this gives
a direct sum of $`q`$ arbitrary tensors of local dimensions $`q,q,q`$.
The three outer maps are square of size $`q^2`$. Since the limit
$`M_q`$ is concise, each outer map must be invertible over
$`\mathbb C((t))`$; otherwise the corresponding flattening would have
rank less than $`q^2`$, and this rank cannot increase in the limit.
The same argument makes the generic direct sum concise, so all its
$`q`$ blocks are nonzero. Its centroid therefore has dimension at
least $`q`$, contradicting the target's dimension one.

For a common unit $`U_{ABCD}(s)`$, contract the output $`D`$ factor by
the all-ones covector on its $`s`$ unit labels. The source becomes a
direct sum of $`sq`$ arbitrary $`q\times q\times q`$ tensors. The
target becomes a direct sum of $`s`$ copies of $`M_q`$. The latter has
centroid dimension exactly $`s`$: conciseness forces all off-diagonal
blocks of a centroid map to vanish, by comparing tensor support with
only one factor moved to another summand, and each diagonal block is
scalar by the preceding calculation. Thus the same contradiction is
$`sq>s`$. Equal powers replace $`q`$ by $`q^n`$.

### 4.2. A sharp overhead bound when the three outer maps are monomial

Allow source-only overhead $`U_{ABCD}(r)`$ in (8), but require each of
the maps at $`A,B,C`$ to be monomial over $`\mathbb C((t))`$: every
input basis vector is mapped either to zero or to a scalar Laurent
series times one fixed output basis vector. The map at $`D`$ is
arbitrary. Then any restriction or Laurent degeneration satisfies

```math
r\ge\sqrt q.                                      \tag{9}
```

After the $`D`$ contraction, the source consists of $`rq`$ blocks of
local dimensions $`q,q,q`$. Under the three monomial maps, one block
is supported in a coordinate box $`X\times Y\times Z`$, where
$`|X|,|Y|,|Z|\le q`$. Matrix multiplication's nonzero coefficients
have the form

```math
((i,j),(j,k),(k,i)),\qquad 1\le i,j,k\le q.
```

Such a box contains at most $`q^{3/2}`$ of these coefficients. To see
this, let $`P,Q,R`$ be the zero-one incidence matrices of $`X,Y,Z`$.
The number of contained triples is $`\mathop{\mathrm{tr}}(PQR)`$,
which is at most

```math
\|P\|_{\mathrm F}\|Q\|_{\mathrm F}\|R\|_{\mathrm F}
=\sqrt{|X||Y||Z|}\le q^{3/2}.
```

Every target coefficient must occur in at least one source block's
coordinate box. This remains true under Laurent cancellation and
specialization because the fixed union of those boxes is a coordinate
subspace. Thus $`q^3\le rq\,q^{3/2}`$, proving (9).

The bound is attained when $`q=m^2`$. Partition each matrix index into
$`m`$ groups of size $`m`$. The usual block formula expresses
$`M_{m^2}`$ as a sum of $`m^3`$ copies of $`M_m`$, each on local
spaces of dimension $`m^2=q`$. Assign the $`rq=m^3`$ source blocks
to these triples of index groups. At $`D`$, choose the coefficients
of $`M_m`$ in each block. The monomial outer maps insert that block's
coordinates into the corresponding output matrix entries. Every
matrix multiplication coefficient belongs to exactly one triple of
index groups, so the resulting tensor is exactly the target.

Consequently, for even tensor powers the least monomial-map overhead
is exactly $`q^{n/2}`$. Any conversion with subexponential overhead
must use nonmonomial mixing at at least one of the three outer
parties. No unrestricted overhead lower bound follows from this
counting argument.

### 4.3. An unrestricted construction from a smaller matrix product

Let $`r_n`$ be the least positive integer for which

```math
U_{ABCD}(r_n)S_q^{\otimes n}\ge T_q^{\otimes n}.
```

These integers exist and satisfy $`r_{m+n}\le r_mr_n`$. Therefore the
limit

```math
\delta=\lim_{n\to\infty}\frac{\log_qr_n}{n}
```

exists. There is an unrestricted upper bound

```math
0\le\delta\le\frac{\omega_{\mathbb C}-2}{2}\le\frac18.          \tag{10}
```

The last inequality uses the imported bound $`\omega_{\mathbb C}\le9/4`$.
The construction proving the middle inequality is explicit once a
smaller matrix multiplication rank decomposition is supplied.

Take an even tensor power, put $`Q=q^{2m}`$ and $`N=q^m`$, and use
$`M_Q\cong M_N\otimes M_N`$. Decompose the first factor into
$`R(M_N)`$ rank-one terms. Each term tensored with the second factor
is supported on local subspaces of dimension at most $`N^2=Q`$ at
each of $`A,B,C`$. It is therefore one of the arbitrary
$`Q\times Q\times Q`$ blocks that a $`D`$ contraction of $`S_Q`$
can supply. The three outer local maps insert that block into its
specified output subspaces; there is no monomial requirement. Since
$`U_{ABCD}(r)S_Q`$ supplies $`rQ`$ such blocks, this gives the exact
restriction bound

```math
r_{2m}\le
\left\lceil\frac{R(M_{q^m})}{q^{2m}}\right\rceil.              \tag{11}
```

The definition of $`\omega_{\mathbb C}`$ gives
$`R(M_{q^m})=q^{(\omega_{\mathbb C}+o(1))m}`$. Dividing the logarithm
of (11) by $`2m`$, and using the submultiplicative limit, proves (10).
In particular the monomial lower bound in Section 4.2 does not apply
to arbitrary local maps.

The same construction implies the universal numerical constraint

```math
d_{AB}+d_{BC}+d_{CA}
\le1+d_{AD}+d_{BD}+d_{CD}
   +\frac{\omega_{\mathbb C}-2}{2}.                         \tag{12}
```

Indeed, evaluate (11) under any one normalized four-party spectral
point, use multiplicativity, and pass to the limit. The desired signed
inequality (7) would remove the final error term. For the normalized
energy tripod with arms $`3/8`$, its left side minus
$`1+d_{AD}+d_{BD}+d_{CD}`$ equals $`1/8`$, so (12) with the
$`9/4`$ bound still admits that scalar model.

The numerical inequality (12) also follows directly from already known
scalar constraints: the three triangle inequalities give
$`d_{AD}+d_{BD}+d_{CD}\ge L/2`$, where
$`L=d_{AB}+d_{BC}+d_{CA}`$, and the normalized three-party restriction
gives $`L\le\omega_{\mathbb C}`$. Thus
$`L-(d_{AD}+d_{BD}+d_{CD})\le\omega_{\mathbb C}/2`$, which is (12).
The contribution of (11) is its explicit unrestricted tensor
construction, not an additional scalar constraint.

### 4.4. A stronger lift retaining the three edge labels

Define

```math
Z_q=U_{ABD}(q)U_{ACD}(q)U_{BCD}(q).
```

The conjectural comparison $`S_q\gtrsim Z_q`$ would imply (8) by
contracting $`D`$. It would give

```math
u(ABD)+u(ACD)+u(BCD)
\le1+d_{AD}+d_{BD}+d_{CD}.                         \tag{13}
```

On a genuine tripod, (4) turns (13) into $`a+b+c\le1`$. Every cut
flattening passes this stronger comparison as well.

Its full tensor requirement can be stated as a subspace problem. The
$`D`$ flattening of $`Z_q`$ has image

```math
L_q=\mathop{\mathrm{span}}
\{e_{ij}\otimes e_{jk}\otimes e_{ki}:1\le i,j,k\le q\}.
```

An exact restriction from $`U_{ABCD}(r)S_q`$ exists if and only if
there are $`rq`$ triples of local subspaces, each of dimension at
most $`q`$, such that

```math
L_q\subseteq\sum_{b=1}^{rq} A_b\otimes B_b\otimes C_b.          \tag{14}
```

For one direction, these are the images of the source's local block
spaces. For the other, decompose every basis vector of $`L_q`$ as
a sum of vectors in the product spaces and put their coefficients
into the unrestricted local map at $`D`$. This is an exact
equivalence, not a support-only condition.

If the three families of subspaces are coordinate subspaces, the
counting bound (9) applies. Arbitrary subspaces can interact through
linear cancellation, so counting their individual intersections with
$`L_q`$ does not prove a lower bound for (14). The construction in
Section 4.3 only produces the single sum of all basis vectors of
$`L_q`$; it does not provide all of $`L_q`$ and therefore does not
prove this stronger lift.

There is, however, a different construction giving the stronger lift
with the same upper bound on the overhead exponent:

```math
U_{ABCD}\!\left(q^{((\omega_{\mathbb C}-2)/2+o(1))n}\right)
 S_q^{\otimes n}\ge Z_q^{\otimes n}.                       \tag{15}
```

For even $`n`$, the definition of the exponent gives
$`R(M_{q^{n/2}})=q^{\omega_{\mathbb C}n/2+o(n)}`$. The full-unit
factor originally in $`S_q^{\otimes n}`$, together with the displayed
overhead, has that size. Contract its $`D`$ factor and apply such a
matrix multiplication rank decomposition to obtain the outer $`ABC`$
triangle with all three edge sizes $`q^{n/2}`$. Integer dimensions are
rounded upward; these factors are absorbed in the $`o(n)`$ term.

Split each of the three original spokes, of size $`q^n`$, into two
independent wires of size $`q^{n/2}`$. Assign the two pieces to the
two incident faces among $`ABD,ACD,BCD`$. Each of those faces now
contains a complete triangle with edge size $`q^{n/2}`$. The
three-party tight-subrank theorem distills from it a face unit of size
$`q^{n-o(n)}`$. Apply the three distillations independently on the
separate local factors. An additional full unit of subexponential size
supplies the three missing face-unit factors, by contracting its unused
party for each factor. This produces all three face units of size
$`q^n`$, hence $`Z_q^{\otimes n}`$.

All matrix multiplication and distillation losses are included in the
$`o(n)`$ overhead. For odd $`n`$, use the even construction on
$`n-1`$ powers and any fixed finite-rank conversion on the remaining
power. Its constant overhead is again absorbed in $`o(n)`$. This proves
(15). The construction uses the imported matrix multiplication and
triangle-distillation families; it does not assert a new coefficient
formula for either.

Its numerical inequality also follows from existing scalar bounds.
Write $`z=u(ABD)+u(ACD)+u(BCD)`$ and
$`s=d_{AD}+d_{BD}+d_{CD}`$. On each face the tight-subrank theorem
gives twice its unit charge at most its perimeter. Summing gives
$`z\le s+L/2`$, where $`L`$ is the outer triangle perimeter.
Therefore

```math
z-1-s\le\frac{L-2}{2}
\le\frac{\omega_{\mathbb C}-2}{2}.
```

In particular (15) has overhead exponent at most $`1/8`$ under the
$`9/4`$ bound. Whether this stronger lift admits subexponential
overhead remains unresolved here. The derivation of (15) is not the
invalid step of copying the rank-one coefficients in Section 4.3 to
the retained $`D`$ label.

## 5. The tetrahedral comparison and its finite obstruction

Let

```math
H_q=U_{ABC}(q)U_{ABD}(q)U_{ACD}(q)U_{BCD}(q),\qquad
K_q=\prod_{\{i,j\}\subseteq\{A,B,C,D\}}W_{ij}(q).
```

The asymptotic comparison $`H_q\gtrsim K_q`$ is equivalent to
$`\omega_{\mathbb C}=2`$. One direction follows by grouping $`D`$ into
$`C`$: the source becomes
$`U_{ABC}(q^2)W_{AC}(q)W_{BC}(q)`$, while the target becomes
$`W_{AB}(q)W_{AC}(q^2)W_{BC}(q^2)`$. Evaluating every normalized
three-party point and canceling the common wire factors gives perimeter
at most two.

Conversely, if $`\omega_{\mathbb C}=2`$, a face unit of size $`q`$
asymptotically produces the triangle tensor with edge size $`\sqrt q`$.
Use even tensor powers to make all sizes integral, and absorb the
subexponential overhead into $`o(n)`$ additional source powers. Apply
this independently on all four faces. Each edge belongs to two faces,
so the two wires of size $`\sqrt q`$ combine to size $`q`$, giving
$`H_q\gtrsim K_q`$.

The reverse comparison $`K_q\gtrsim H_q`$ already follows from the
three-party tight-subrank result. Split each edge into two equal
logarithmic pieces, one for each incident face. The triangle on one face
with edge size $`\sqrt q`$ asymptotically yields its unit of size $`q`$.

Despite this asymptotic formulation, no finite degeneration
$`H_q\unrhd K_q`$ exists for $`q\ge2`$. The obstruction persists under
equal tensor powers and a common full-unit catalyst.

To prove it, contract $`C,D`$ jointly with a matrix of independent
variables $`Z`$, obtaining an $`AB`$ matrix of size $`q^3\times q^3`$,
and take its determinant. Label the source face indices
$`p=ABC,t=ABD,r=ACD,s=BCD`$. Its local coordinates are

```math
A=(p,t,r),\quad B=(p,t,s),\quad C=(p,r,s),\quad D=(t,r,s).
```

The $`AB`$ pencil is block diagonal over $`(p,t)`$. Each block is the
generic $`q\times q`$ matrix with entry
$`Z_{(p,r,s),(t,r,s)}`$. Thus its determinant is a product of $`q^2`$
homogeneous polynomials of degree $`q`$. Arbitrary local maps preserve
this form, up to a scalar, since the $`A,B`$ maps are square and the
$`C,D`$ maps make a linear substitution in $`Z`$.

For $`K_q`$, the shared $`AB`$ edge label gives $`q`$ identical blocks.
One block has rows $`(i_{AC},i_{AD})`$, columns
$`(i_{BC},i_{BD})`$, and entry

```math
M_Z[(i_{AC},i_{AD}),(i_{BC},i_{BD})]
=\sum_{j=1}^q Z_{(i_{AC},i_{BC},j),(i_{AD},i_{BD},j)}.
```

The $`q^4`$ displayed linear forms involve disjoint sets of variables,
so they are independent. Consequently $`\det M_Z`$ is an irreducible
generic determinant of degree $`q^2`$, after an invertible linear change
of variables. The target determinant is $`(\det M_Z)^q`$.

For a hypothetical Laurent degeneration, normalize the valuation of
each whole degree-$`q`$ factor. Its leading coefficient remains a
nonzero homogeneous polynomial of degree $`q`$. Their product has a
nonzero leading coefficient because the polynomial ring is an integral
domain. The nonzero target determinant must therefore factor into such
degree-$`q`$ polynomials. Unique factorization makes this impossible:
every nonconstant factor of $`(\det M_Z)^q`$ has degree a positive
multiple of $`q^2`$.

With a common unit of size $`s`$, the source determinant has $`sq^2`$
degree-$`q`$ factors, and the target is a product of $`s`$ independent
degree-$`q^2`$ irreducible determinants, each raised to the $`q`$th
power. The same contradiction applies. Equal powers replace $`q`$ by
$`q^n`$.

This argument does not cover source-only subexponential full-unit
overhead: the $`A,B`$ maps are then rectangular, and their determinants
become Cauchy--Binet sums of minors rather than the fixed product above.
The no-overhead obstruction must not be used as a spectral separation.

## 6. The outstanding gluing step

The strongest new all-tensor information in this pass is (4). A possible
route is to prove that three such overlapping edge restrictions force
the full-unit charge to be at least $`a+b+c`$. That implication would
exclude the scalar tripod even though it survives every previously
listed scalar test. It is not supplied by edge uniqueness alone: that
theorem determines each three-party restriction separately and does not
classify their compatible four-party extensions.

One tempting gluing argument fails at a definite locality step. Start
with the three-star tensor

```math
W_{AD}(q)W_{BD}(q)W_{CD}(q),
```

whose value is $`q^{a+b+c}`$. At $`D`$, project the first two indices
equal. The result is $`U_{ABD}(q)W_{CD}(q)`$, with the same spectral
value by (3). Projecting its remaining two $`D`$ indices equal gives
$`U_{ABCD}(q)`$. To declare this second projection lossless by (3),
one would have to treat the duplicated $`AB`$ label as one joint party.
The point $`F`$ is not known to be monotone under arbitrary joint
$`AB`$ maps. A linear map on that common label need not be realizable
by separate maps at $`A`$ and $`B`$. Moreover $`d_{AB}=a+b>0`$, so
the free-merging lemma of Section 2 does not apply. Pairwise losslessness
of the first projections does not establish losslessness of the final
three-index equality projection.

More generally, normalized midpoint extensions produce one rigid
three-party subsemiring on each constructed geodesic edge. Relating
several of these restrictions requires using one compatible extension;
differently optimized extension laws cannot be combined as if they
produced the same point.

The matrix multiplication conclusion remains unproved in this note.

## 7. Related exact limitations

[COPIED_FACTOR_COUNTEREXAMPLE.md](COPIED_FACTOR_COUNTEREXAMPLE.md)
gives a genuine normalized quantum point for which copying a local
input factor fails restriction monotonicity, even under an invertible
change of basis. It rules out repairing a joint-party map merely by
copying its input label.

[TRIANGLE_SUBSPACE_FRAME.md](TRIANGLE_SUBSPACE_FRAME.md) proves
$`r\ge c\sqrt q`$ for the product-subspace cover in (14), where
$`c`$ is the least positive eigenvalue of the sum of its orthogonal
product-space projectors. Commuting projectors give $`c\ge1`$.
There is no uniform lower bound on $`c`$ for arbitrary maps; near
linear dependence and Laurent cancellation remain unexcluded.
