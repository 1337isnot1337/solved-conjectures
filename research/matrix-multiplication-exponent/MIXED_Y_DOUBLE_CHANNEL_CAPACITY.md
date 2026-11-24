# A mixed-register double-channel identity and its fixed-frame obstruction

Research status: the displayed double-channel operator identity is exact,
and the Y channel has an exact finite polynomial realization. The complete
copied-label construction below has C rank at most r times the CD-wire
size, even with arbitrary different X-side A maps. This excludes the
stated common Y frame. It does not exclude A maps which depend
nonseparably on Y, different Y frames in different families, or more
general middle Y operators.

## 1. An exact finite Y projector

Let 1<=m<=p, and let Y=(y_jh) be a p-by-m matrix of independent
polynomial coordinates. Write

```math
D_{hj}=\partial_{y_{jh}},\qquad K=DY,\qquad
V=K^{-1}D,\qquad F=YV,\qquad P=I_p-F.
\tag{1}
```

These expressions have an exact meaning on polynomials. Let F_n(Y)
denote the polynomials of total degree at most n and set
f_n=dim F_n(Y), with f_(-1)=0. The multiplication matrix

```math
Y:\mathbb C^m\otimes F_{n-1}(Y)
  \longrightarrow\mathbb C^p\otimes F_n(Y)
\tag{2}
```

is injective. Indeed, a nonzero m-by-m minor makes its columns
independent over the rational function field, hence also over the
polynomial ring. In the Bargmann inner products its adjoint is D.
Consequently K=DY is positive definite on each finite space
C^m tensor F_(n-1), and is invertible there. These inverses are
compatible across n: K preserves each homogeneous degree.

Thus V lowers polynomial degree by one, F is the orthogonal
projection onto the image of (2), and P is the orthogonal projection
onto ker D. In particular,

```math
VY=I_m,\qquad F^2=F,\qquad P^2=P,\qquad
DP=VP=0,\qquad
\mathop{\mathrm{rank}}P|_{\mathbb C^p\otimes F_n}
   =p f_n-m f_{n-1}.
\tag{3}
```

The convention on constants is V=0 and P=I. All identities may be
checked on finite degree spaces containing the displayed products.
They are also identities over the Y Weyl division ring. For that
separate algebraic assertion, the differential principal symbol of
K is the generic matrix Xi Y, whose determinant is nonzero. Clearing
a right denominator from a putative kernel vector and taking its
highest differential order proves that K has no right kernel; hence
the square matrix K is invertible over that division ring.

The finite polynomial maps are defined directly, rather than through
a representation of the entire division ring. Their ranks must not
be inferred by canceling arbitrary division-ring factors. For
example, when p=m=1, the polynomial P projects onto constants, whereas
the expression P is zero in the division ring. The identities stated
in (3)--(4) hold in both settings; the finite rank formula comes from
the polynomial adjoint argument, not from division-ring rank.

The needed commutator is

```math
[V_{hb},y_{jt}]=(K^{-1})_{ht}P_{jb}.
\tag{4}
```

In fact [D_hb,y_jt]=delta_ht delta_bj and
[K_ab,y_jt]=delta_at y_jb. Applying
[K^(-1),y]=-K^(-1)[K,y]K^(-1) proves (4), with its indicated
operator order.

## 2. The double-channel candidate and its full residual

Use independent X coordinates x_it, with i in [p],t in [m].
Let U be any p-by-m operator matrix acting only on the X flags, and
put E_X=U X^t. The finite pseudoinverse from
[COHERENT_MULTIPLICATION_CHANNEL.md](COHERENT_MULTIPLICATION_CHANNEL.md) is one choice of U.
It makes E_X an orthogonal projection whose limiting rank fraction
is m/p.

There are two sectors of the shared source label: H=[m] and an
endpoint sector Q=[p]. The legal outside maps are

```math
\begin{array}{c|cc}
\text{source label}&A^a&B^b\\\hline
h\in H&(UK)_{ah}&-V_{hb}\\
\ell\in Q&(UD)_{a\ell}&\delta_{\ell b}I.
\end{array}
\tag{5}
```

The displayed right B operator represents the full flag transpose of
the physical B map. No auxiliary-only transpose is taken.

For each source vertex v choose a fixed C plane C_v of dimension at
most w, where w is the source CD-wire size. At D output (i,j), let

```math
f_v^{ij}=\sum_{t=1}^m x_{it}y_{jt}v_{v,t}^{ij},
\qquad v_{v,t}^{ij}\in C_v.
\tag{6}
```

The vectors in (6) are selected by the scalar D coefficients through
the fixed C map; they do not depend on outside output indices a,b.
Every C coefficient is retained. The full A/D/B contraction is

```math
\begin{aligned}
\mathcal O_{ab}^{ij}
={}&(UD)_{ab}f_b^{ij}
     -\sum_h(UK)_{ah}f_h^{ij}V_{hb}\\
={}&\sum_t U_{at}x_{it}v_{b,t}^{ij}P_{jb}\\
&+\sum_{t,h,\ell}U_{at}x_{i\ell}K_{th}y_{j\ell}
       (v_{b,\ell}^{ij}-v_{h,\ell}^{ij})V_{hb}.
\end{aligned}
\tag{7}
```

For the second equality use KV=D, insert and subtract f_b in the
H sector, and then apply (4). The order K_th y_jell is retained;
K does not commute with the Y multiplication. U remains left of
every X multiplication.

If all vectors in (6) were one common vector v, (7) would give

```math
\mathcal O_{ab}^{ij}=(E_X)_{ai}P_{jb}\,v.
\tag{8}
```

The two channels act on independent X and Y flag registers. With
the finite pseudoinverse choice at X, their rank fractions tend to
m/p and 1-m/p. Thus m near p/2 would retain a constant fraction.
Equation (8) is a diagnostic only: giving different columns v_ij
requires the fixed C-plane conditions and cancellation of the full
residual in (7).

The source has p+m shared labels and CD-wire size w; r such
families use r copies. The finite flag spaces have only a fixed
degree margin, and their source/retained dimension ratio tends to
one for fixed p,m as the flag degree tends to infinity. For example,
the same F_(n+1)(X) tensor F_(n+1)(Y) source flags as in the finite
coherent model protect every prefix in (5)--(6): V lowers Y degree,
K preserves it, the middle raises X and Y by one, and the endpoint
D lowers Y after the middle. No large-rank copied target follows
from these resource counts.

## 3. A general common-Y-frame theorem

The obstruction permits r unrelated X-only matrices A_z of size
p-by-m. Their entries may be rational Weyl operators, or arbitrary
linear maps between the finite X flag spaces used in the identity.
There is no assumption that their images or their kernels agree.
Let a_(z,t) be arbitrary compatible X-only middle operators. The
endpoint middle entries have the form

```math
f_{z,\ell}^{ij}
 =\sum_{t=1}^m a_{z,t}^{ij}y_{jt}v_{z,\ell,t}^{ij},
\qquad v_{z,\ell,t}^{ij}\in C_{z,\ell},\qquad
\dim C_{z,\ell}\le w.
\tag{9}
```

In particular, a_(z,t)=x_it recovers (6). The H-sector middles may
be arbitrary for the following argument.

Suppose the complete output has the form

```math
\mathcal O_{ab}^{ij}=A^\star_{ai}P_{jb}L_{ij},
\tag{10}
```

where A^star is X-only and each operator column A^star_(bullet,i)
under consideration is nonzero. This includes the target (8) with
independent C columns L_ij. Assume the retained Y flag space contains
constants and linear polynomials, so n>=1.

Postcompose the physical B output by the transpose of P. In the
displayed A/D/B convention this right-multiplies the operator matrix
by P. It preserves (10), by P^2=P. Every H-sector source term
vanishes, by VP=0. The surviving complete coefficient is exactly

```math
\sum_{z,\ell}(A_zD)_{a\ell}f_{z,\ell}^{ij}P_{\ell b}.
\tag{11}
```

One cannot replace f_(z,ell) by f_(z,b) in this expression; the
endpoint index is summed after the projection. Keeping that index
is essential.

Fix i,j. For each endpoint ell and t define an X-operator-valued,
C-valued p-by-m matrix

```math
(C_{\ell,t})_{ah}
 =\sum_z(A_z)_{ah}a_{z,t}^{ij}v_{z,\ell,t}^{ij}.
\tag{12}
```

Only the Y derivative is moved through (9). On a vector w of
Y-polynomials with Dw=0, so Pw=w, equation (11) becomes

```math
\sum_{\ell,t,h}
 y_{jt}(C_{\ell,t})_{ah}\partial_{y_{\ell h}}w_\ell
 +\sum_t(C_{j,t})_{at}w_j.
\tag{13}
```

All X operator orders in (12) are unchanged.

First use constant vector inputs w=e_b. Every such vector is in
ker D. Equality to (10) gives

```math
\sum_t(C_{j,t})_{\bullet t}
     =A^\star_{\bullet i}L_{ij}.
\tag{14}
```

Subtract the contraction term identified in (14). For two distinct
endpoints b,c and any h, use the degree-one vector

```math
w_b=y_{bh},\qquad w_c=-y_{ch},\qquad w_\ell=0\ (\ell\ne b,c).
\tag{15}
```

It is in ker D, since the two derivative columns cancel in each
row of D. The remaining part of (13) is

```math
\sum_t y_{jt}
  \big((C_{b,t})_{\bullet h}-(C_{c,t})_{\bullet h}\big)=0.
\tag{16}
```

The polynomials y_jt are linearly independent, and the coefficients
are X-only. Hence C_(b,t)=C_(c,t) for every b,c,t. This proves
endpoint independence without an independence assumption on the
columns of any A_z, and without a large-degree or symbol limit.

By (12), every C coefficient of this common matrix belongs to

```math
W_0=\bigcap_{\ell=1}^p\left(\sum_{z=1}^r C_{z,\ell}\right),
\qquad \dim W_0\le rw.
\tag{17}
```

Intersections here can be taken coefficientwise in any finite
operator span. Equation (14) and the nonzero X operator column
A^star_(bullet,i) imply L_ij in W_0: apply a linear functional on
the finite X operator coefficient space which is nonzero on that
column. Consequently

```math
\mathop{\mathrm{rank}}L\le rw.
\tag{18}
```

Thus the mixed-Y construction cannot realize C rank p^(2-o(1))
when w=p^(1+o(1)) and r=p^o(1), even after arbitrary changes of the
X-only A images.

## 4. Exact scope

The proof permits arbitrary dense fixed C maps, independent target
D columns, different X-only A matrices, and arbitrary X-only
coefficients in the middle operators (9). The matrices K and V
make the outside maps depend on Y, but every family uses the same
Y frame, and the remaining A matrix is X-only. These features give
the common local B projection P and the harmonic inputs (15).

Different Y frames, A matrices with additional nonseparable Y
dependence, and middle operators with nonlinear or derivative Y
terms are not covered by this theorem. Their full coefficients
would need a new analysis. No statement about arbitrary operator
trade maps or the matrix multiplication exponent is inferred.

The mixed-register diagnostic, exact finite projector, and initial
residual were derived by the constructive worker. The arbitrary
X-image theorem and the degree-one harmonic-vector proof were
derived by the operator-comparison worker. The constructive worker
independently checked the preceding generic-symbol proof; the
finite harmonic argument avoids that additional machinery.
