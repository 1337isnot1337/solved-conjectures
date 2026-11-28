# A fixed column span for relative output gauges

Research status: the matrix identities and the conditional locality rule
below are proved. They simplify one obstruction in a possible six-index
construction. They do not establish the required copied-label identity,
a tensor conversion, or an exponent bound.

## 1. The centered interpolation matrix

Fix an integer $`s\ge2`$ and distinct complex numbers
$`q_0,\ldots,q_{s-1}`$. Put
$`b_j=q_j-s^{-1}\sum_iq_i`$ and
$`D_j=\prod_{i\ne j}(q_j-q_i)`$. The matrix used here is exactly
the rational gauge of Atalikov--Zotov, arXiv:2303.02391v1,
equations (2.2)--(2.6):

```math
g(z,q)_{aj}=\frac{(z+b_j)^{\rho(a)}}{D_j},\qquad
\rho(a)=\begin{cases}a&0\le a\le s-2,\\s&a=s-1.\end{cases}
\tag{1}
```

All identities below are identities of rational functions. Thus they
may first be proved with the displayed denominators nonzero and then
continued wherever both sides are defined.

Use the full Vandermonde matrix with the ordinary consecutive degrees:

```math
B(q)_{aj}=\frac{b_j^a}{D_j}\quad(0\le a\le s-1).
\tag{2}
```

This matrix is invertible because the $`b_j`$ are distinct. Write

```math
\prod_j(x-b_j)=x^s+\sum_{a=0}^{s-2}c_a(q)x^a.
\tag{3}
```

The coefficient of $`x^{s-1}`$ vanishes by centering. Let $`e`$
denote the last standard column of $`\mathbb C^s`$, and let
$`\tau(z)`$ be the lower triangular Pascal translation matrix

```math
\tau(z)_{ab}=
\begin{cases}{a\choose b}z^{a-b}&b\le a,\\0&b>a.
\end{cases}
\tag{4}
```

The binomial theorem gives
$`\tau(z)\tau(w)=\tau(z+w)`$, and $`\tau(z)e=e`$.

Define a row $`w(z,q)^t`$ by

```math
\begin{aligned}
w_a(z,q)&={s\choose a}z^{s-a}-c_a(q)
                  -{s-1\choose a}z^{s-1-a}
                       &&(0\le a\le s-2),
\\ w_{s-1}(z,q)&=s z-1.
\end{aligned}
\tag{5}
```

Then the exact factorization is

```math
g(z,q)=A(z,q)B(q),\qquad
A(z,q)=\tau(z)+e w(z,q)^t.
\tag{6}
```

For the first $`s-1`$ rows, this is the binomial theorem. For the last
row, substitute (3), evaluated at $`b_j`$, into
$`(z+b_j)^s`$. This gives precisely the coefficients in (5).

## 2. Relative output gauges have a fixed rank-one image

For $`u\ne0`$, the inverse in (6) is

```math
A(u,q)^{-1}
=\tau(-u)-\frac1{s u}e w(u,q)^t\tau(-u).
\tag{7}
```

Indeed $`\tau(u)e=e`$ and $`1+w(u,q)^te=s u`$, so multiplication
checks (7) directly. In particular $`\det A(u,q)=s u`$.

Multiplying (6)--(7) gives

```math
g(v,q)g(u,q)^{-1}
=\tau(v-u)+e r(u,v,q)^t,
\tag{8}
```

where the complete row is

```math
r(u,v,q)^t
=\left(w(v,q)^t-\frac vu w(u,q)^t\right)\tau(-u).
\tag{9}
```

Thus every dependence on $`q`$ in (8) has the same fixed
one-dimensional image $`\mathbb C e`$. In the calculation, the
coefficient multiplying $`e w(u,q)^t\tau(-u)/(s u)`$ is
$`1+w(v,q)^te=s v`$, which gives the factor $`v/u`$ in (9).

The order of the two gauges matters. In contrast,
$`g(u,q)^{-1}g(v,q)=B(q)^{-1}A(u,q)^{-1}A(v,q)B(q)`$
has an additional conjugation by the varying Vandermonde matrix.
Equation (8) makes no fixed-image assertion for that opposite ratio.

## 3. Exterior powers have small fixed spans column by column

Fix $`1\le k\le s`$ and put $`V=\Lambda^k\mathbb C^s`$.
Let $`c_e`$ be exterior multiplication by $`e`$ and $`a_r`$
contraction by the covector $`r^t`$. If $`T=\tau(v-u)`$, then

```math
\Lambda^k(T+e r^t)
=\Lambda^kT+c_e\,\Lambda^{k-1}T\,a_r.
\tag{10}
```

To prove (10), expand the wedge of $`(T+e r^t)v_1,\ldots,
(T+e r^t)v_k`$. Terms using $`e r^t`$ at least twice vanish.
The remaining $`k`$ terms are the contraction term, with the usual
alternating signs. The expansion does not require $`Te=e`$.

For an increasing input subset $`H=\{h_1,\ldots,h_k\}`$, the
column in (10) is therefore

```math
\Lambda^kT e_H+
\sum_{j=1}^k(-1)^{j-1}r_{h_j}(u,v,q)
       c_e\Lambda^{k-1}T e_{H\setminus\{h_j\}}.
\tag{11}
```

The $`k+1`$ displayed output vectors are independent of $`q`$.
No independence among them is needed for the bound. In particular,
for every fixed input column, all its values as $`q`$ varies lie
in a fixed vector space of dimension at most $`k+1`$.

For a tensor product of two such relative exterior gauges, each
input pair $`(H,C)`$ similarly has a fixed span of at most
$`(k+1)^2`$ output vectors. These spanning vectors define fixed
complex matrix columns; their coefficients are explicit rational
functions of $`q`$ given by (9)--(11).

If $`p={s\choose k}`$, $`k\to\infty`$, and
$`\log k=o(\log s)`$, then $`(k+1)^2=p^{o(1)}`$.
This is a count of column families only. It is not yet a tensor
resource count for a complete trade.

## 4. A global fixed matrix span and order-safe local lifting

There is a stronger global span statement that avoids a restriction
on the shifts of the outside operators. Write
$`r^t=\sum_{l=0}^{s-1}r_l e_l^*`$ and define the fixed matrices

```math
K_0=\Lambda^kT,\qquad
K_{l+1}=c_e\Lambda^{k-1}T a_{e_l^*}\quad(0\le l\le s-1).
\tag{12}
```

Equation (10) gives

```math
\Lambda^k(T+e r^t)=K_0+\sum_{l=0}^{s-1}r_l(q)K_{l+1}.
\tag{13}
```

Thus the entire matrix lies in a fixed complex matrix space of
dimension at most $`s+1`$, independently of $`k`$. The same scalar
function $`r_l(q)`$ multiplies the entire constant matrix, rather
than being chosen separately for each input column.

Composing or tensoring $`a`$ such exterior relative gauges, with
arbitrary fixed complex linear maps between them, therefore gives

```math
\mathcal C(q)=\sum_{\nu=1}^{(s+1)^a}f_\nu(q)\Gamma^\nu,
\tag{14}
```

where the $`\Gamma^\nu`$ are fixed complex matrices and each
$`f_\nu`$ is a product of at most $`a`$ coordinates of the rows
in (9). The count is an upper bound; dependence or vanishing among
these matrices is harmless. In particular, two relative gauges on
the two C legs have a global span of at most $`(s+1)^2`$.

This expansion gives an order-safe local lifting. Suppose the
complete candidate coefficient has the displayed order

```math
\sum_{h,c}\mathcal C(q)_{\gamma,hc}
       A_h^a X_{hc}^{ij}B_h^b.
\tag{15}
```

The functions in (14) multiply at the far left. Substitution gives
the exactly equal sum of fixed-C families

```math
\sum_{\nu,h,c}\Gamma^\nu_{\gamma,hc}
       \bigl(f_\nu(q)A_h^a\bigr)X_{hc}^{ij}B_h^b.
\tag{16}
```

Here the new A map is the operator $`f_\nu(q)A_h^a`$. The common
function $`f_\nu`$ does not depend on $`h,c,a,b,i,j,\gamma`$;
it is not moved through A or any other operator. The A map therefore
uses no unavailable source or output label. This remains valid for
multi-shift A, rational inverses, and resolvents whenever the original
maps belong to the algebra under consideration. Multiplication by
$`f_\nu`$ preserves finite propagation if A has finite propagation,
and preserves rational difference/Weyl membership if A has that
membership. All other hypotheses of the corresponding finite-flag
transfer theorem must still be checked.

If the common coefficient occurs at the far right, the analogous
formula multiplies B on the right. A common coefficient already in
the middle can be inserted into the middle operator. Each statement
uses the actual displayed order; it does not commute functions of
the flag through shifts or resolvents.

The same argument permits dependence on the common source label h.
More precisely, suppose for every h there are at most m scalar
functions $`f_{\nu,h}(q)`$, independent of c and all output labels,
and fixed complex columns such that

```math
\mathcal C(q)_{\gamma,hc}
 =\sum_{\nu=1}^m f_{\nu,h}(q)\Gamma^\nu_{\gamma,hc}.
\tag{16a}
```

The columns may depend on h and c; assembling them defines m fixed
complex C matrices. Replacing A by
$`f_{\nu,h}(q)A_h^a`$ again proves the exact fixed-C lifting,
with m families. The A party already knows h. Thus a relative gauge
evaluated at $`q+\alpha(h)`$ has the same $`s+1`$ family bound
when its input column belongs to the h sector. Spectral parameters
and fixed translation matrices may also depend on h, provided the
span bound is uniform and they are independent of the flag and c.
For a bounded product of such factors, the same expansion applies
with the product of the uniform span bounds.

For the sparse exterior regime stated after (11),
$`\log p=(1+o(1))k\log s`$. Consequently the family count
$`(s+1)^a`$ is $`p^{o(1)}`$ for fixed $`a`$, or more generally
for $`a=o(k)`$. Applying this conclusion at fixed $`k=1`$ would
be invalid.

The hypothesis is a bounded composition of relative gauges with
fixed spectral parameters and a common flag argument, or the
h-dependent extension in (16a). A controlled shift of $`q`$
depending on the inaccessible wire c can make the scalar functions
in (16a) depend on c, and is not covered without a separate expansion
or the distinct operator-order rule in Section 5.
Neither an individual $`g(z,q)`$ nor the opposite ratio
$`g(u,q)^{-1}g(v,q)`$ is covered merely by being called a gauge.

## 5. A sufficient operator-order condition for columnwise coefficients

Here is the locality statement that permits a fixed column span to
be used. Let shifts satisfy
$`T_\alpha f(q)=f(q+\eta\alpha)T_\alpha`$. Suppose every outside
A column has one shift, independent of its output index:

```math
A_h^a=a_h^a(q)T_{\alpha(h)}.
\tag{17}
```

Suppose a candidate's complete coefficient has the form

```math
\sum_{h,c}\mathcal C_{\gamma,hc}(q)
                   A_h^a X_{hc}^{ij} B_h^b,
\qquad
\mathcal C_{\gamma,hc}(q)
=\sum_{\ell=1}^m\Gamma^\ell_{\gamma,hc}f_{\ell,hc}(q),
\tag{18}
```

where every $`\Gamma^\ell`$ is a fixed complex matrix and every
$`f_{\ell,hc}`$ is a scalar rational function. No output label
$`a,b,i,j,\gamma`$ occurs in that function except through the
source labels already printed.

Because the rational coefficient functions commute with
$`a_h^a(q)`$, the exact order identity is

```math
f_{\ell,hc}(q)A_h^a
=A_h^a f_{\ell,hc}(q-\eta\alpha(h)).
\tag{19}
```

Consequently (18) is exactly the sum of the $`m`$ legal fixed-C
families

```math
\sum_{\ell,h,c}\Gamma^\ell_{\gamma,hc}A_h^a
 \left[f_{\ell,hc}(q-\eta\alpha(h))X_{hc}^{ij}\right]B_h^b.
\tag{20}
```

The new middle operator knows $`h,c,i,j`$, as permitted by the
tagged source, and does not need an outside output index. There
is no restriction here on the number of shifts in $`B`$ or $`X`$.
In particular the case of a full inverse or resolvent at B has
not been replaced by a one-shift column.

Alternatively, if the functions in (18) already occur between A
and B, their absorption into the middle operator is immediate and
(17) is unnecessary. For an arbitrary multi-shift or resolvent A,
a column-dependent coefficient initially to the left of A cannot be
moved into the middle by (19) without further work. The column-span statement by
itself does not license that move.

The remaining task is to obtain a complete copied-label identity
whose C coefficients are the relative gauges in this note and whose
operator order satisfies one of the rules above. Neither (8), (16),
nor (20) provides
that identity.
