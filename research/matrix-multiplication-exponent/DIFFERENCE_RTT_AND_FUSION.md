# Exact RTT and arithmetic fusion for the projector difference matrix

Research status: the identities below are proved operator identities.
They do not complete the shared-source six-index trade. In particular,
the ordinary RTT relation has four auxiliary indices and cannot by
itself supply the two additional copied target labels.

## 1. Fundamental RTT, with the required sign

Use g from [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md) and fixed eta!=0.
Let P_a be the diagonal difference matrix with entries T_j on
auxiliary factor a, where T_j shifts q by s eta e_j. Put

```math
L(u)=g(u,q)P g(u+\eta,q)^{-1}.
```

Let R_V^eta and R_D^eta be the vertex and dynamical matrices of
Atalikov--Zotov, arXiv:2303.02391v1, (3.9) and (3.1). Then

```math
R_V^{-\eta}(u-v)L_1(u)L_2(v)
 =L_2(v)L_1(u)R_V^{-\eta}(u-v).                         \tag{1}
```

Here the vertex parameter is -eta, opposite to the positive shift
in L. The same statement with +eta is in general false.

For a complete proof define

```math
\begin{aligned}
G_{12}^+&=g_1(u,q)g_2(v,q+\eta^{(1)}),&
G_{21}^+&=g_2(v,q)g_1(u,q+\eta^{(2)}),\\
H_{12}^-&=g_2(v+\eta,q)g_1(u+\eta,q-\eta^{(2)}),&
H_{21}^-&=g_1(u+\eta,q)g_2(v+\eta,q-\eta^{(1)}).
\end{aligned}
```

The notation eta^(a) means the controlled shift s eta at the site
label in auxiliary factor a, exactly as in primary equation (1.16).
Direct normal ordering gives

```math
L_1(u)L_2(v)=G_{12}^+P_1P_2(H_{12}^-)^{-1},\qquad
L_2(v)L_1(u)=G_{21}^+P_1P_2(H_{21}^-)^{-1}.              \tag{2}
```

The fundamental shifted IRF relation at parameter -eta gives

```math
R_V^{-\eta}G_{12}^+=G_{21}^+R_D^{-\eta}.                 \tag{3}
```

The relation at +eta and shifted spectral parameters gives
R_V^eta=H_12^- R_D^eta (H_21^-)^(-1). Both R matrices have
the same unitarity and skew-symmetry scalar, so inverting this
identity gives

```math
R_D^{-\eta}(H_{12}^-)^{-1}
 =(H_{21}^-)^{-1}R_V^{-\eta}.                           \tag{4}
```

One may first avoid u-v=+/-eta and then use rational continuation.
Finally R_D^(-eta) commutes with P_1P_2: its diagonal and swap
matrix units preserve the total site shift, and their q-dependent
coefficients depend only on q_i-q_j, unchanged by shifting both
i and j. Equations (2)--(4) prove (1) in the printed operator order.

Exact rational checks at s=2,3 verify every shift coefficient of
(1). Replacing -eta by +eta gives nonzero coefficients in those
same checks. This finite observation is not used in the proof.

## 2. The full ordered exterior product

Let iota: exterior-power-k E -> E^(tensor k) be the ordinary
antisymmetric embedding. Put G_k(z,q)=exterior-power-k g(z,q).
For k<=s define the ordered product

```math
\mathcal M_k(z)=L_k(z)L_{k-1}(z+\eta)\cdots
                         L_1(z+(k-1)\eta).             \tag{5}
```

The following identity holds without assuming a fusion theorem:

```math
\mathcal M_k(z)\,\iota
 =\iota\,G_k(z,q)\mathop{\mathrm{diag}}_{|J|=k}(T_J)
                        G_k(z+k\eta,q)^{-1}.           \tag{6}
```

Thus the ordered product preserves the ordinary exterior subspace,
and its restriction is exactly the previously proved compound
difference matrix. There is no additional scalar normalization.

Here is a direct coefficient proof. Normal order the factors in
(5), starting from the left. A word H=(h_1,...,h_k), with h_t
the site shift chosen in factor t, contributes the scalar
z/(z+k eta) times the tensor product of the rank-one projectors

```math
P_{h_t}\!\left(z+(k-t)\eta,
              q+s\eta\sum_{r>t}e_{h_r}\right).          \tag{7}
```

At the height in (7), the numerator matrix differs from the
numerator of g(z,q) only in columns in the suffix
S_t={h_r:r>t}. This follows because the spectral shift cancels the
change in the centered mean at every other column. If h_t is new,
its column in g is therefore

```math
\frac{D_{h_t}(q)}{D_{h_t}(q+s\eta\sum_{r>t}e_{h_r})}
                  g(z,q)_{*,h_t}.                     \tag{8}
```

For inverse rows, a change confined to the columns S_t makes
row h_t a multiple of its original row plus a linear combination
of the original rows in S_t. When h_t is new, that multiple is
the reciprocal of (8). This is the elementary inverse formula
for a matrix I+U E_(S_t)^t, followed by the diagonal D factors.
Consequently the wedge of the inverse rows in (7) vanishes if
H has a repeated label. If H is distinct, its wedge differs from
the corresponding original-row wedge by the product of those
reciprocal factors. They cancel exactly against the product of
(8).

For one fixed unordered set J, summing the distinct words H
that order J now gives exactly the antisymmetric output tensor
of the columns g(z,q)_( *,j ), with its inverse-row minor.
There is no leftover D factor. Hence the shift-J coefficient on
the exterior subspace is

```math
\frac{z}{z+k\eta}G_k(z,q)e_Je_J^tG_k(z,q)^{-1}.         \tag{9}
```

The inverse-row identity in [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md)
identifies (9) with the right side of (6). This proves (6) and
also proves that every repeated-site shift vanishes.

## 3. Pole scope

As a function of z, G_k(z,q) is polynomial. The inverse
G_k(z+k eta,q)^(-1) has at most a simple pole at z=-k eta:
g has only a corank-one simple zero, and the exterior power
of its inverse still has only one negative Smith valuation per
minor. Thus the complete arithmetic exterior product (6) has
at most a simple spectral pole, despite containing k factors.

This calculation closes the proposed all-k independent-pole
mechanism for this particular arithmetic fusion. It does not
exclude a completion using the same matrices with distinct C
families, arbitrary middle kernels, other spectral coefficients,
or a different source coupling. No such completion is supplied
by (1) or (6).
