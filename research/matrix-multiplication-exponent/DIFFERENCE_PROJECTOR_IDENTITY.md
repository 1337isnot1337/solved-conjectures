# A fused row identity for the rational difference candidate

Research status: the row identity, the printed shift coefficients, and
the one-sided shifted-projector product below are proved. They do not
give the required shared-sector four-party conversion. The final
coefficient equation retains that unresolved requirement.

The rational matrix g used here is the displayed intertwiner in
Atalikov--Zotov, [arXiv:2303.02391v1](https://arxiv.org/abs/2303.02391v1), equations (2.2)--(2.4). All
identities below are proved directly from its formula; no fused RLL
identity is assumed.

## 1. Matrix, labels, and shifts

Fix s>=2 and 1<=k<=s. Work over the rational function field in
q_0,...,q_(s-1), z and hbar. Put

```math
\bar q_j=q_j-\frac1s\sum_lq_l,\qquad
D_j(q)=\prod_{l\ne j}(q_j-q_l),\qquad
\rho=(0,1,\ldots,s-2,s),
```

and define the s-by-s matrix

```math
g(z,q)_{a j}=\frac{(z+\bar q_j)^{\rho_a}}{D_j(q)}.
                                                               \tag{1}
```

Rows of g are polynomial-degree labels; columns are q-site labels.
Let G_k(z,q)=exterior-power-k g(z,q), with the increasing-subset
bases. Its dimension is p=binom(s,k). A row J of G_k^(-1) is thus a
q-site subset label. This orientation matters.

For a k-subset J define a difference shift

```math
T_J f(q)=f(q+s\hbar\,1_J)T_J.                            \tag{2}
```

The paired spectral shift used in this note is k*hbar, not hbar.
Then, writing q'=q+s*hbar*1_J and z'=z+k*hbar,

```math
z'+\bar q'_l=z+\bar q_l+s\hbar\,1_{l\in J}.             \tag{3}
```

Thus only columns J of the numerator matrix in (1) change.

## 2. Exact fused inverse-row identity

For every k-subset J,

```math
\big(G_k(z+k\hbar,q+s\hbar1_J)^{-1}\big)_{J,*}
 =\frac{z}{z+k\hbar}\big(G_k(z,q)^{-1}\big)_{J,*}.       \tag{4}
```

**Proof.** Write X(z,q)_(aj)=(z+qbar_j)^(rho_a), so that
g=X diag(D_j^(-1)). The generalized Vandermonde determinant is

```math
\det X(z,q)=s z\,\Delta(q),\qquad
\Delta(q)=\prod_{a<b}(q_b-q_a).                          \tag{5}
```

Indeed the alternant with powers 0,...,s-2,s is the ordinary
Vandermonde multiplied by the sum of its variables. Here that sum
is s*z.

By (3), X'=X M where M differs from the identity only in columns J.
In a simultaneous row/column order with J first, M has the form

```math
M=\begin{pmatrix}M_{JJ}&0\\ *&I\end{pmatrix}.
```

Its inverse has the same upper-right zero block. Consequently row J
of exterior-power-k M^(-1) has only its J entry nonzero, and that
entry is det(M)^(-1). Therefore

```math
\big(G_k(z',q')^{-1}\big)_{J,*}
 =\frac{\prod_{j\in J}D_j(q')}
        {\prod_{j\in J}D_j(q)\det M}
   \big(G_k(z,q)^{-1}\big)_{J,*}.                       \tag{6}
```

Only differences across J and its complement change. Counting each
such pair once gives

```math
\frac{\prod_{j\in J}D_j(q')}{\prod_{j\in J}D_j(q)}
 =\prod_{j\in J,l\notin J}
       \frac{q_j-q_l+s\hbar}{q_j-q_l}
 =\frac{\Delta(q')}{\Delta(q)}.                         \tag{7}
```

Equation (5) gives
det(M)=[(z+k*hbar)/z] Delta(q')/Delta(q). Substitution in (6)
proves (4). The computation is over the rational function field;
specializations are valid away from the displayed poles. QED.

## 3. Difference coefficients and shifted projectors

Define ordinary matrix idempotents over the rational function field by

```math
P_J(z,q)=G_k(z,q)e_Je_J^{t}G_k(z,q)^{-1}.
```

They have rank one, sum to the identity, and satisfy P_J P_K=0 for
J!=K at the same parameters. Define the q-site-oriented difference
matrix

```math
\mathcal L_k(z)=G_k(z,q)\mathop{\mathrm{diag}}_J(T_J)
                         G_k(z+k\hbar,q)^{-1}.
```

Normal ordering using (4) gives the exact finite-shift formula

```math
\mathcal L_k(z)
 =\frac{z}{z+k\hbar}\sum_J P_J(z,q)T_J,                 \tag{8}
```

and its operator inverse is

```math
\mathcal L_k(z)^{-1}
 =\frac{z+k\hbar}{z}\sum_JP_J(z+k\hbar,q)T_J^{-1}.      \tag{9}
```

There is an individual product identity, stronger than cancellation
only after summing all shifts:

```math
P_J(z,q)P_K(z+k\hbar,q+s\hbar1_J)
 =\delta_{JK}P_J(z,q).                                 \tag{10}
```

To prove it, let H=G_k(z+k*hbar,q+s*hbar*1_J) and
c=z/(z+k*hbar). Equation (4) says e_J^t H^(-1)=c e_J^t G^(-1),
and hence e_J^t G^(-1)H=c^(-1)e_J^t. Inserting this into
G e_J e_J^t G^(-1)H e_K e_K^t H^(-1) proves (10).
It is a one-sided relation between non-Hermitian idempotents at
different heights, not orthogonality in a fixed positive inner product.
It also verifies (9), shift by shift.

## 4. The source equation still required

For each family r, let Gamma^r be a fixed complex p^2-by-p^2 C map.
Let alpha_(r,h)^a and beta_(r,h)^b be entries of the selected
difference matrices; beta is the operator on the right in the printed
product. The physical B map uses its full flag transpose. A legal
tagged source completion still requires

```math
\sum_{r,h,c}\Gamma^r_{\gamma,hc}\,
   \alpha_{r,h}^{a}\,X_{r,hc}^{ij}\,\beta_{r,h}^{b}
 =\delta_{a i}\delta_{b j}L_{\gamma,ij}I                 \tag{11}
```

for every a,b,gamma,i,j, or the complete separately justified projected
target equation. X may depend on h,c and the target D label i,j.
All products are difference-operator products, so their rational
coefficients are translated in their actual printed order.

Equation (10) proves only

```math
\sum_h P_J(z,q)_{ah}
 P_K(z+k\hbar,q+s\hbar1_J)_{hb}
 =\delta_{JK}P_J(z,q)_{ab}.
```

An h-dependent C coefficient or middle operator cannot be silently
inserted into this sum. In particular, (10) alone does not prove
(11) or produce the independent copied C,D labels of the target.

## 5. Independent finite checks

The row identity and every pair J,K in (10) were checked with exact
rational matrices at (s,k)=(3,1),(4,2), z=5/3, hbar=2/7 and
q=(-7,1,12), respectively (-11,-3,5,17). Operator review checked
the same identities independently at z=2,hbar=1. These checks
supplement the proof above; they are not its substitute.

The implementation is in irf_vertex_exact_candidate.py, function
site_subset_shift_matrices. The older inverse-oriented candidate
in subset_shift_matrices is a different legal ansatz and is not
identified with (8).

The independent finite checks above are reproducible by running
python3 check_difference_projector_and_collision.py. That script
also checks the collision-channel ranks and coordinate target
restrictions in [DIFFERENCE_COLLISION_CHANNEL.md](DIFFERENCE_COLLISION_CHANNEL.md).

The finite exact replay is
[check_difference_projector_and_collision.py](check_difference_projector_and_collision.py).
The literal inverse-completion failure is separately preserved in
[IRF_SHARED_INVERSE_FAILURE.md](IRF_SHARED_INVERSE_FAILURE.md).
