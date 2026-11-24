# A complete difference-Lax inverse attempt and its exact residual

Research status: the outside operators and source maps are explicit.
The literal shared-index inverse completion in Section 3 fails, as
shown by an exact off-target coefficient in Section 4. This does not
exclude a different middle operator, distinct C families, or a
projected target. No tensor trade is claimed.

## 1. Ground gauge and genuine subset shifts

Fix s and 1<=k<s, and put p=binom(s,k). Let q_1,...,q_s be flag
variables, qbar_j=q_j-(sum_l q_l)/s, and

```math
D_j(q)=\prod_{l\ne j}(q_j-q_l),\qquad
g(z,q)_{a,j}=\frac{(z+\bar q_j)^{\rho(a)}}{D_j(q)},
\qquad \rho(a)=0,1,\ldots,s-2,s.
```

The gauge is from Atalikov--Zotov, [arXiv:2303.02391v1](https://arxiv.org/abs/2303.02391v1),
equations (2.2)--(2.4). Write G_k(z,q)=Lambda^k g(z,q), in increasing
subset bases. Set a nonzero scalar hbar, and let

```math
T_J f(q)=f(q+s\hbar\,1_J)T_J
```

for each k-subset J. The factor s agrees with the ground shift
normalization in that paper's equation (1.16). The q-site-oriented
operator matrix used here is

```math
L_k^+(z)=G_k(z,q)\,\mathop{\mathrm{diag}}_J(T_J)\,
                          G_k(z+k\hbar,q)^{-1},           \tag{1}
```

and L_k^-(z) denotes its exact operator inverse. The shift k*hbar
in (1) is necessary for the fused column-update identity. These are
definitions of actual difference-operator matrices; no fused RTT
relation is inferred merely from their notation.

The proved row identity in [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md)
gives the finite expansions

```math
\begin{split}
L_k^+(z)&=\frac{z}{z+k\hbar}
            \sum_J P_J(z,q)T_J,\\
L_k^-(z)&=\frac{z+k\hbar}{z}
            \sum_J P_J(z+k\hbar,q)T_J^{-1},\\
P_J(z,q)&=G_k(z,q)E_{JJ}G_k(z,q)^{-1}.
\end{split}                                                \tag{2}
```

Thus the p subset shifts are internal terms in each local operator.
They are not p separate source families. The inverse uses the
printed order of operators, including all shifts of its coefficient
functions.

## 2. A fixed scalar C matrix

For the exact counterexample below, k=1. The scalar C matrix is the
vertex R matrix from the same paper's equations (3.2) and (3.9).
It can be computed at any fixed generic numerical vector q^0:

```math
\Gamma(u,v)=
 [g(u+\hbar,q^0)\otimes g(v,q^0)]
 R^{\rm semi}(\hbar,u,v\mid q^0)
 [g(u,q^0)^{-1}\otimes g(v+\hbar,q^0)^{-1}].               \tag{3}
```

The exact finite formula for R^semi is implemented in
irf_vertex_exact_candidate.py. The primary Proposition 3.1 states
that (3) is independent of q^0. In using it at C, q^0 is a fixed
numerical vector: no flag-dependent coefficient is placed at C.

At s=2, hbar=1, u=2, v=5, the result is

```math
\Gamma=
\begin{pmatrix}
2/3&0&0&0\\
2&1&-1/3&0\\
2&-1/3&1&0\\
14&-2&-2&2/3
\end{pmatrix}.                                             \tag{4}
```

Rows and columns use the order (0,0),(0,1),(1,0),(1,1).
The code checks (4) at q^0=(-1,1) and q^0=(-2,2), and against the
paper's explicit 11-vertex formula (1.13).

For other p the following completion can be defined with any
specified invertible scalar Gamma. No unproved exterior fusion of
(3) is needed for the counterexample or asserted here.

## 3. The full six-index completion being tested

Use the tagged source U_4(p) W_CD(p), together with the AD/BD flags
of the operator-transfer framework. Its shared unit index is h,
and its C--D wire index is c. Let the output D label be (i,j), and
the output C label be gamma. All four source maps are

```math
\begin{split}
\alpha_h^a&=(L_k^+(u))_{a,h},\\
\beta_h^b&=(L_k^-(v))_{h,b},\\
\gamma_{\gamma,hc}&=\Gamma_{\gamma,(h,c)},\\
X_{hc}^{ij}&=(\Gamma^{-1})_{(h,c),(i,j)}
               (L_k^-(u))_{h,i}(L_k^+(v))_{j,h}.
\end{split}                                                \tag{5}
```

The right-hand side of the final line has the displayed product
order. D has legal tagged access to h and c. The complete output
coefficient is

```math
\sum_{h,c}\Gamma_{\gamma,(h,c)}
           (\Gamma^{-1})_{(h,c),(i,j)}
 (L_k^+(u))_{a,h}(L_k^-(u))_{h,i}
 (L_k^+(v))_{j,h}(L_k^-(v))_{h,b}.                         \tag{6}
```

There is only one h in all four factors. Replacing it by two
independent inverse-sum indices would change the source. Equation
(6) would have to equal

```math
\delta_{ai}\delta_{bj}\delta_{\gamma,(i,j)}I               \tag{7}
```

to be the full target. No such equality is assumed.

The physical B map is the full flag transpose of the right
operator beta_h^b, as in the protected-prefix transfer construction.
Transposing only the auxiliary array, while leaving its flag
operator order untouched, is not the physical B operation.

The middle operator in (5) has finite shift support consisting of
differences of two subset indicators. Its support size is at most
p^2. This is internal operator support, not a full-unit overhead.
The displayed test uses one source family. Several families with
different scalar C matrices would require a new explicit sum of
(5); no cancellation between such families is established here.

## 4. Exact off-target residual

Take the parameters of (4). Evaluate the rational coefficient
functions at the flag point q=(-6,6), retaining the formal shift
symbols. Each shift unit moves the relevant q coordinate by two.
Take output A label a=1, B label b=0, C label gamma=(0,0), and
output D label (i,j)=(0,0). Every coefficient of (7) is zero,
because a differs from i.

The complete value of (6), in left normal form, is instead

```math
\frac{125}{84}T^{(-2,2)}
-\frac{128848}{4725}T^{(-1,1)}
+\frac{34583}{1260}I
-\frac{1744}{945}T^{(1,-1)}
+\frac9{50}T^{(2,-2)}.                                    \tag{8}
```

This exact calculation is reproduced by
check_irf_shared_inverse.py. It enumerates all shifts of the four
operator factors in (6), shifts every later coefficient by the
accumulated preceding shift, and sums with the scalar C weights.
All matrices and evaluations use rational arithmetic. The selected
flag point and its finitely many shifted points avoid all gauge
poles in this calculation.

In particular the identity coefficient 34583/1260 is nonzero.
Thus the corresponding rational coefficient function cannot
vanish identically. This proves failure of (5), independently of
the general one-family square-C obstruction. It does not refute
the row/projector identity (2), a different middle-operator
completion, an actual exchange-relation construction, or the
matrix multiplication exponent conjecture.
