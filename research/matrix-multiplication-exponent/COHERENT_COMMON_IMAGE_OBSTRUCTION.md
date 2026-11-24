# A C-rank obstruction for a common coherent A image

Research status: this excludes the finite multiplication-channel model
with one outside family, and a larger class of several families whose
A columns use one common multiplication pseudoinverse through constant
flavour matrices. It permits arbitrary dense C planes. Genuinely
different A images or operator-valued flavour changes are not covered.

Use the finite spaces and maps M_n,U_n,E_n from
[COHERENT_MULTIPLICATION_CHANNEL.md](COHERENT_MULTIPLICATION_CHANNEL.md). Assume p>=2 and n>=1. Let
U_h denote the h-th operator column of U_n, from F_(n+1)(X) to
C^p tensor F_n(X). The symbol U_h here is an operator column, not a
C plane.

## 1. Independence of the relevant operator columns

For every fixed i in [p],t in [m], the m operators

```math
U_h x_{it}:F_n(X)\longrightarrow\mathbb C^p\otimes F_n(X)
\qquad(h\in[m])
\tag{1}
```

are linearly independent over C.

Indeed ker U_n=ker M_n^*, by the finite pseudoinverse definition.
If sum_h c_h U_h x_it=0, the vector in C^m tensor F_(n+1)(X) with
h-th component c_h x_it f lies in ker M_n^* for every f in F_n.
With the Bargmann convention, its a-th adjoint component is

```math
\sum_h c_h\partial_{ah}(x_{it}f).
\tag{2}
```

Choose any a different from i, and put f=x_(a,h0). This is permitted
because n>=1. Then (2) equals c_(h0)x_it, so every c_(h0) vanishes.
The proof also works for vector coefficients in any fixed complex
space W, by applying arbitrary linear functionals on W.

## 2. Several constant flavour changes of one A image

For z in [r], let F_z and S_z be fixed complex m-by-m matrices.
Invertibility is not assumed. In the ordered three-layer construction
replace its blocks by

```math
N_{1,z}=U_n F_z,\qquad N_{2,z}=S_z d_Y.
\tag{3}
```

The source H sector has m labels, and the endpoint Q sector has p
labels. Use the same finite boundary conventions as in the coherent
model. For each family z and source vertex v, let C_v^z be any fixed
C plane of dimension at most w, where w is the source CD-wire size.
The middle polynomials have the form

```math
f_v^{z,ij}=\sum_t x_{it}y_{tj}v_{v,t}^{z,ij},
\qquad v_{v,t}^{z,ij}\in C_v^z.
\tag{4}
```

Every output pair (i,j) may choose its vectors independently.

For fixed i,j,b,t define the m-by-m W-valued matrix

```math
R_{b,t}^{ij}
 =\sum_z\left(
       F_z S_z\,v_{b,t}^{z,ij}
       -F_z\mathop{\mathrm{diag}}_h(v_{h,t}^{z,ij})S_z
            \right).
\tag{5}
```

The complete P-to-Q coefficient is

```math
\begin{aligned}
\mathcal O_{ab}^{ij}
={}&\sum_{\ell,r,t}
       (U_n)_{a\ell}x_{it}y_{tj}d_{rb}
                    (R_{b,t}^{ij})_{\ell r}\\
&+\delta_{bj}\sum_{\ell,t}
       (U_n)_{a\ell}x_{it}
          \sum_z(F_zS_z)_{\ell t}v_{j,t}^{z,ij}.
\end{aligned}
\tag{6}
```

To verify (6), the endpoint source term is
U_n F_z S_z d_Y f_b; the intermediate source term is
-U_n F_z diag(f_h) S_z d_Y. Only the Y derivatives are moved
past (4). The x multiplication remains to the right of U_n, so no
commutation through the finite pseudoinverse is used.

Assume the complete output is a tensor with the same copied C,D tags
and no nonconstant Y-flag operator. In particular this holds for the
intended target

```math
\mathcal O_{ab}^{ij}
 =\delta_{bj}(E_n)_{ai}L_{ij}\otimes I_{F_n(Y)}.
\tag{7}
```

Restricting (6) to the constant Y flag first identifies its second
line with the desired target. Subtract that equality. Restricting the
remaining expression to degree-one Y flags isolates each matrix unit
y_tj d_rb, for every fixed b,j,r,t. By the independence in Section 1,

```math
R_{b,t}^{ij}=0
\quad\text{for every }b,t,i,j.
\tag{8}
```

No assumption on the magnitudes or support of the C coefficients is
used here.

## 3. All target C columns lie in one small fixed space

The second term in (5) does not depend on the endpoint b. Therefore
(8) says that the matrix

```math
H_t^{ij}=\sum_z(F_zS_z)v_{b,t}^{z,ij}
\tag{9}
```

is independent of b. Each of its entries lies in the fixed subspace

```math
W_0=\bigcap_{b\in[p]}\left(\sum_{z=1}^r C_b^z\right),
\qquad \dim W_0\le r w.
\tag{10}
```

The second line of (6) can now be written using the entries
(H_t^(ij))_(ell,t). Consequently every one of its C coefficients
belongs to W_0.

For each i, the operator column (E_n)_(bullet,i) is nonzero. In fact
M_n(e_i tensor 1) is nonzero, and ker E_n=ker M_n. Apply a scalar
linear functional on the finite operator coefficient space which is
nonzero on this column. Equation (7) then implies L_ij in W_0.
It follows that

```math
\mathop{\mathrm{rank}}L\le r w.
\tag{11}
```

For the intended wire size w=p, a subpolynomial number of such
families yields C rank at most p^(1+o(1)), not p^(2-o(1)).

The original one-family model is F_1=S_1=I. Identical outside maps
with different C maps are also covered. Compensated flavour rotations
are the special case F_z=T_z^(-1), S_z=T_z. Thus changing only the
constant internal flavour basis cannot repair the copied-C equation.

## 4. Scope

The proof uses the common A operator columns in (1), constant flavour
matrices in (3), and the particular scalar middle polynomials (4).
It does not cover genuinely different A images, operator-valued
F_z or S_z, or mixed X/Y coefficients whose derivatives contribute
additional terms. Such changes require a new complete coefficient
calculation. The finite channel and its rank fraction remain valid;
this theorem excludes its stated common-image completion.

The operator-column argument and common-image obstruction were
derived by the operator worker. The restriction to compensated
flavour rotations was independently identified by the constructive
worker.
