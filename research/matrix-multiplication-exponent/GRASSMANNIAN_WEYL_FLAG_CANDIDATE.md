# An explicit Grassmannian Weyl flag candidate

Research status: the operators and local maps below are explicit and
legal. The shared-sector coefficient identity in Section 3 is not
proved. No tensor conversion or exponent bound is claimed.

## 1. A rectangular matrix of Weyl operators

Fix 1<=r<s and put t=s-r. Let X=(x_(alpha,i)) be a t by r matrix
of commuting variables and P=(partial_(i,alpha)) the r by t matrix
of their derivatives. Thus

```math
[P_{i\alpha},X_{\beta j}]=\delta_{ij}\delta_{\alpha\beta},
\qquad [P,P]=[X,X]=0.
```

Let ell be a central scalar, and work in the division ring of the
Weyl algebra when inverses are needed. Define the s by s matrix

```math
E=\begin{pmatrix}
\ell I_r-PX&P
\\ X(\ell I_r-PX)&XP
\end{pmatrix}
 =\begin{pmatrix}I_r\\X\end{pmatrix}
   \begin{pmatrix}\ell I_r-PX&P\end{pmatrix}.                \tag{1}
```

Matrix multiplication uses the displayed order of the Weyl words.
The inner product of the two rectangular factors is exactly ell I_r.
Consequently

```math
E^2=\ell E,\qquad
(uI_s+E)^{-1}=u^{-1}I_s-[u(u+\ell)]^{-1}E                 \tag{2}
```

when u and u+ell are nonzero. These identities do not replace
noncommuting factors by commuting symbols.

The entries also obey

```math
[E_{ab},E_{cd}]=\delta_{bc}E_{ad}-\delta_{ad}E_{cb}.          \tag{3}
```

For example, the mixed top-right/bottom-left bracket is

```math
[P_{i\alpha},(X(\ell I-PX))_{\beta j}]
 =\delta_{\alpha\beta}(\ell I-PX)_{ij}
  -\delta_{ij}(XP)_{\beta\alpha}.
```

The other block brackets follow by the same Leibniz rule and the
displayed Weyl relations. In particular, (1) is a genuine gl_s
representation by first-order differential operators. Its upper-left
diagonal entries act on the constant polynomial by ell-t; its
lower-right entries act by zero. A finite rectangular highest-weight
module is a possible realization, but no use of such a module or its
boundary is required for the Weyl-algebra candidate.

This rank-r construction differs from a single rank-one oscillator
matrix. Taking r near s/2 allows classical exterior minors involving
many occupied auxiliary modes.

## 2. Explicit exterior auxiliary maps

Put V=Lambda^k(C^s), p=binom(s,k). On (C^s)^(tensor k) let A_k
be the ordinary scalar antisymmetrizing projector. For a scalar u,
define the operator matrix on V by

```math
\mathcal L_k(u)=
 A_k (uI+E)_1((u-1)I+E)_2\cdots((u-k+1)I+E)_k A_k
 \big|_V.                                                   \tag{4}
```

Every subscript indicates which auxiliary C^s factor carries that
matrix. All factors act on the same Weyl flag algebra and occur in
the printed order. Equation (4), with both projectors included, is a
definition of actual local maps; it does not assume an unproved
fusion identity. Its entries are finite Weyl words and polynomials
of degree at most k in u.

For source auxiliary label h and output a, both k-subsets, set

```math
A_h^a(u)=(\mathcal L_k(u))_{a,h}.
```

The B maps may be defined from an independently chosen parameter v,
with either the same printed order or a separately specified reversed
order. Any proposed identity must state which choice is used; one
cannot reverse noncommuting factors silently.

One explicit scalar C family remains the exterior Gaussian map

```math
C(w)=\pi_{k,k}\Lambda(g(w)\otimes I_s)\big|_{V\otimes V},
\qquad g(w)=\begin{pmatrix}1&1\\1&w\end{pmatrix}.            \tag{5}
```

Dense independent ground changes may be inserted in (5), provided
they are printed as actual scalar matrices. Formula (5) has a fixed
exterior sign convention and entries polynomial in w. The exact
Pieri or fused-R channel formulas can replace (5) only after their
index and scalar normalizations have been checked.

## 3. The missing coefficient identity

The explicit D tag allows a separate unknown Weyl-division element
X_(z,h,c)^(i,j) for each source h,c and output i,j. With finitely many
parameter choices z, a valid target C compression L requires

```math
\sum_{z,h,c}C^{(z)}_{\gamma,hc}
 A_h^a(u_z)X_{z,h,c}^{ij} B_h^b(v_z)
 =\delta_{ai}\delta_{bj} L_{\gamma,ij}\,1.                  \tag{6}
```

Every a,b,gamma,i,j is quantified. In particular all off-target
coefficients must vanish. The same source h occurs in the two
outside maps, while c is available only to C and D. This is the
unresolved condition; an ordinary RLL equation with two independent
outside auxiliary inputs is not (6).

If (6) holds with p=binom(s,floor(s/2)), a subpolynomial number of
families, and rank(L)>=p^(2-o(1)), the existing tagged Weyl-transfer
and single-party compression lemmas give the required asymptotic
trade. Polynomial parameter degrees can bound the family count,
but do not establish (6). All orders and both copied labels remain
part of the construction problem.

The exact rank criterion for a fixed choice of finite maps is
[ARBITRARY_C_COMPRESSION.md](ARBITRARY_C_COMPRESSION.md).
An alternative four-party source, with a different required coefficient
coupling, is [GRASSMANNIAN_FROBENIUS_SOURCE.md](GRASSMANNIAN_FROBENIUS_SOURCE.md).
No result about the printed candidate is inferred from a finite numerical
span. Its complete equation (6) remains an explicit research obligation.
