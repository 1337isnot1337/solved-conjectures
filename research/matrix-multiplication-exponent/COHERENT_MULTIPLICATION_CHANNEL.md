# A finite coherent multiplication channel

Research status: the finite local maps, their complete weighted
coefficient, the channel rank estimate, and its equivariance are
proved. The required high-rank C-plane completion of the stated
linear-Y construction is excluded by
[INDEPENDENT_Y_CAPACITY.md](INDEPENDENT_Y_CAPACITY.md). That obstruction permits different
X-only A images and operator-valued X flavour maps. The coherent
calculation with a common C vector remains a diagnostic, not a
construction with independently copied C/D labels.

## 1. A large orthogonal channel from polynomial multiplication

Fix integers p>=m>=1. Let X=(x_(i,h)) be a p by m array of independent
commuting variables, and let F_n(X) be the polynomials of total degree
at most n. Put d=pm and

```math
f_n=\dim F_n(X)={n+d\choose d}.
```

Use a U(p)-invariant Bargmann inner product on the polynomial spaces,
with distinct homogeneous degrees orthogonal. Define the finite
multiplication matrix

```math
\mathcal M_n:\mathbb C^p\otimes F_n(X)
             \longrightarrow\mathbb C^m\otimes F_{n+1}(X),
\qquad (\mathcal M_n)_{hi}f=x_{ih}f.                    \tag{1}
```

Let the superscript + denote the Moore--Penrose inverse of a finite
complex matrix and set

```math
\mathcal U_n=\mathcal M_n^*(\mathcal M_n\mathcal M_n^*)^+,
\qquad E_n=\mathcal U_n\mathcal M_n.                    \tag{2}
```

Thus E_n is the orthogonal projection onto the image of M_n^* in
C^p tensor F_n(X). No inverse is asserted on the kernel of
M_n M_n^*. All entries of U_n are ordinary finite complex matrices.

Choose any m by m submatrix obtained from m of the p rows, and
let Delta be its nonzero determinant. The adjugate identity shows

```math
\Delta\, F_{n+1-m}(X)^{\oplus m}
                  \subseteq\mathop{\mathrm{im}}\mathcal M_n.\tag{3}
```

Indeed an adjugate entry has degree m-1; multiplying a polynomial of
degree at most n+1-m gives an input of degree at most n. Multiplication
by the nonzero polynomial Delta is injective. Interpreting F_j as zero
when j<0, it follows that

```math
m f_{n+1-m}\le\mathop{\mathrm{rank}}E_n
              =\mathop{\mathrm{rank}}\mathcal M_n
              \le m f_{n+1}.                          \tag{4}
```

For fixed p,m, taking n to infinity therefore gives

```math
\frac{\mathop{\mathrm{rank}}E_n}{p f_n}\longrightarrow\frac mp.
                                                        \tag{5}
```

In particular m near p/2 gives a channel with constant limiting rank
fraction. This is not the rank-one oscillator channel.

### Equivariance

The p rows of X carry the standard U(p) action, and the polynomial
spaces carry its induced action rho. Multiplication is an intertwiner:
M_n(g tensor rho(g))=(I_m tensor rho(g))M_n. The chosen inner products
are invariant. Hence the adjoint, pseudoinverse, and E_n are
intertwiners as well. In particular E_n commutes with simultaneous
signed ground permutations on the outer p-dimensional factor and
the X flag. This is the equivariance required by
[EQUIVARIANT_FLAG_CHANNELS.md](EQUIVARIANT_FLAG_CHANNELS.md); no arbitrary GL(p)
transformation is being claimed as a GHZ stabilizer.

## 2. Finite source and target flags

Take a second, independent m by p variable array Y=(y_(h,j)), and
write d_(h,j) for its ordinary derivatives. The target flag at each
of A and B is

```math
V_n=F_n(X)\otimes F_n(Y),\qquad M=f_n^2.
```

The source flag is

```math
G_n=F_{n+1}(X)\otimes F_{n+1}(Y),\qquad N=f_{n+1}^2.
```

Consequently

```math
\frac NM=\left(\frac{n+pm+1}{n+1}\right)^2
                    \longrightarrow1                 \tag{6}
```

for each fixed p,m. The independent X and Y flags are retained as
separate tensor factors even though both belong to the same party.

The shared source label has two disjoint sectors: H of size m and
Q of size p. The source is

```math
Z_{p+m,p,N}
 =U_{ABCD}(p+m)W_{CD}(p)W_{AD}(N)W_{BD}(N).             \tag{7}
```

The source CD label c ranges over [p]. No additional P sector is
needed: its B map would be zero in the ordered block construction.

## 3. All finite local maps

Let W be a fixed complex C output space. For every source label v in
H union Q choose fixed vectors u_(v,c) in W, c in [p], and put
U_v=span_c u_(v,c). For each target D label (i,j) in [p]^2, choose

```math
v_{v,t}^{ij}\in U_v\quad(t\in H).
```

They are arbitrary independent choices for different (i,j), subject
to membership in the fixed C planes. Expand them in the u_(v,c)
columns to obtain the scalar D-map coefficients. The corresponding
W-valued middle polynomial is

```math
f_v^{ij}=\sum_{t\in H}x_{it}y_{tj}v_{v,t}^{ij}.          \tag{8}
```

Each scalar coefficient polynomial acts on G_n by multiplication
followed by projection back to G_n. This defines a finite middle D
map on every source flag vector, including ones not reached by B.
The C map is exactly (v,c) to u_(v,c); it does not depend on flags.

Write (U_n)_(a,h) for the blocks of (2). For source h in H, use

```math
A_h^a=(\mathcal U_n)_{ah}\otimes\pi_n^Y,\qquad
B_h^b=-\iota_n^X\otimes d_{hb},                        \tag{9}
```

where pi_n is the projection from F_(n+1) to F_n and iota_n its
inclusion in the opposite direction. For source label l in Q use

```math
A_l^a=\sum_{h\in H}(\mathcal U_n)_{ah}\otimes d_{hl},
\qquad B_l^b=\delta_{lb}\,\iota_n^X\otimes\iota_n^Y.   \tag{10}
```

The derivatives in (9) act on F_n(Y) and are included into F_(n+1)(Y);
those in (10) act from F_(n+1)(Y) to F_n(Y). As usual B is written as
the right matrix factor, from the target flag into the source flag;
its physical tensor map is its full transpose.

### Boundary check

In a Q-sector term, B first includes degrees at most n in both arrays.
The middle polynomial raises both degrees by one, staying inside
G_n. The derivative in A then lowers Y degree to at most n, while
U_n maps the entire X input to F_n(X).

In an H-sector term, B first lowers Y degree to at most n-1. After
middle multiplication, X degree is at most n+1 and Y degree at most
n. Therefore the final Y projection is the identity on every reached
vector. All middle projections are likewise inactive on the reached
vectors. No boundary term has been dropped from the calculation.

## 4. The complete coefficient and the excluded completion

At A label a, B label b, and D label (i,j), the W-valued flag matrix
is exactly

```math
\sum_{h\in H}(\mathcal U_n)_{ah}
       \bigl(d_{hb}f_b^{ij}-f_h^{ij}d_{hb}\bigr).        \tag{11}
```

Here b in f_b is the source Q-sector label. Only Y derivatives are
moved past the middle polynomial. Keeping U_n on the left throughout,
the coefficient becomes

```math
\begin{aligned}
&\sum_{h,t}(\mathcal U_n)_{ah}
      x_{it}y_{tj}d_{hb}
                 (v_{b,t}^{ij}-v_{h,t}^{ij})\\
&\qquad+\delta_{bj}\sum_h(\mathcal U_n)_{ah}
                           x_{ih}v_{j,h}^{ij}.         \tag{12}
\end{aligned}
```

Every term is a composition on the finite spaces specified above.
In particular U_n is not commuted through x, and no auxiliary-only
transpose is applied to it.

If a single C vector w_(ij) could be used for every v_(v,t)^(ij),
then the first line would vanish and (12) would be

```math
\delta_{bj}(E_n)_{ai}\,w_{ij}\otimes I_{F_n(Y)}.         \tag{13}
```

This is an exact, large A channel of the desired copied-label target.
But the common-vector substitution is legal only when w_(ij) lies
in every involved U_v. The common intersection has dimension at most
p, so that substitution cannot yield the required p^(2-o(1)) C rank.

For the stated maps, high-rank C columns cannot be obtained by a
different choice of the fixed C planes and vectors in (8). More
generally, [INDEPENDENT_Y_CAPACITY.md](INDEPENDENT_Y_CAPACITY.md) proves that r families
with arbitrary X-only outside matrices and a source CD-wire of size
w have rank L at most r w whenever their output has the form (13).
The proof retains the complete Y coefficient: constant Y inputs fix
the contraction term, and degree-one inputs force its C coefficients
into one fixed intersection of endpoint C spaces. Thus changing the
X-only outer images does not remove this obstruction. A construction
with Y-dependent outside operators or a different middle dependence
would require a new coefficient equation.

## 5. Why a valid completion of this target would suffice

Let L be the map sending the standard C_(ij) to w_(ij). The intended
output (13) is E_n at A and L at C applied to T_(p,M), with identity
on the other parties. By the reviewed equivariant A-channel then
C-compression lemma, every normalized spectral point satisfies

```math
\phi((E_n)_A L_C T_{p,M})
 \ge \frac{\mathop{\mathrm{rank}}E_n}{p f_n}
       \frac{\mathop{\mathrm{rank}}L}{p^2}\,\phi(T_{p,M}).    \tag{14}
```

The X and Y flags are independent, and E_n acts trivially on Y.
Its proved equivariance is what permits the C compression after it;
there is no appeal to a general rule for two arbitrary projections.

For any other complete source identity with the same output channel,
a subpolynomial number of families, m/p bounded below, and
rank L=p^(2-o(1)),
(5), (6), and the constant ratio (p+m)/p would give the required
geodesic inequality. The order of limits is fixed p,m followed by
n to infinity, and then p to infinity. This is a sufficient criterion
for another construction. The linear-Y maps of Sections 3--4 cannot
satisfy it at the stated costs.

The ordered local-operator construction was identified by the operator
worker. The finite pseudoinverse model, exact boundary accounting,
cofactor rank estimate, and equivariant-channel interpretation were
derived by the constructive worker. The operator worker independently
reviewed the complete finite maps, boundary cases, rank estimate, and
equivariance proof.
