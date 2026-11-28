# A finite-shift Cartan defect for the rational vertex matrix

Research status: Sections 1--3 are exact operator identities. Section 4
separates them from the six-index source equation. In particular, a
shared-input sector of a four-index matrix is not automatically a
legal source family with copied D tags and a fixed scalar C map.

Fix s>=2, eta!=0, and generic u,v,q. Use the rational matrices of
Atalikov--Zotov, arXiv:2303.02391v1, equations (3.2) and (3.9).
Write R_S=R_semi^eta(u,v|q), R=R_vertex^eta(u-v), and

```math
F=g(u+\eta,q)\otimes g(v,q),\qquad
G=g(u,q)\otimes g(v+\eta,q),\qquad R=F R_S G^{-1}.
```

The R matrix in this note has parameter +eta. This is a linear
intertwining defect, distinct from the homogeneous RTT relation for
Lplus, whose R parameter is -eta.

## 1. The exact shared-input commutator

For a ground site c put K_c=E_cc tensor I + I tensor E_cc.
The diagonal and swap sectors of R_S commute with K_c. Put

```math
f_{th}=\frac1{u+\eta}+\frac{s}{q_h-q_t},\qquad
b_{th}=\frac1v+\frac{s}{q_h-q_t}\quad(t\ne h).
```

The complete commutator is

```math
[R_S,K_c]=\sum_h\sum_{t\ne h}
 (\delta_{ch}-\delta_{ct})
 \left[-f_{th}E_{th}\otimes E_{hh}
              +b_{th}E_{hh}\otimes E_{th}\right].       \tag{1}
```

Indeed the two shared matrix units have input pair (h,h) and output
pairs (t,h) and (h,t), respectively. Right multiplication by K_c
counts 2 delta_ch, whereas left multiplication counts delta_ch+
delta_ct. Every diagonal correction with t=h commutes and vanishes.
This proves (1) directly, including the signs.

Let P_c(z,q)=g(z,q)E_cc g(z,q)^(-1). Conjugating the two copies
of K_c separately gives

```math
\begin{aligned}
R\big(P_c(u)\otimes I+I\otimes P_c(v+\eta)\big)
&-\big(P_c(u+\eta)\otimes I+I\otimes P_c(v)\big)R
\\ &=F[R_S,K_c]G^{-1}.
\end{aligned} \tag{2}
```

No dynamical variable is evaluated or discarded in (2).

## 2. A complete difference-operator identity

Let T_c f(q)=f(q+s eta e_c)T_c and let
Lplus(z)=g(z,q)diag(T_c)g(z+eta,q)^(-1). The inverse-row identity
already proved in [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md) gives

```math
\sum_c P_c(z,q)T_c=\frac{z+\eta}{z}Lplus(z).             \tag{3}
```

Multiply (2) on the right by T_c and sum. Since R is independent
of q, it commutes with every T_c. Define

```math
\begin{aligned}
H_{\rm in}&=\frac{u+\eta}{u}Lplus_1(u)
       +\frac{v+2\eta}{v+\eta}Lplus_2(v+\eta),
\\ H_{\rm out}&=\frac{u+2\eta}{u+\eta}Lplus_1(u+\eta)
       +\frac{v+\eta}{v}Lplus_2(v).
\end{aligned}
```

The exact identity is

```math
R H_{\rm in}-H_{\rm out}R
 =\sum_c F[R_S,K_c]G^{-1}T_c.                           \tag{4}
```

This is an identity of full finite-shift operators. It is not an
identity of only their zero-shift parts. The displayed order on the
right is multiplication by the rational coefficient followed by T_c.
Moving T_c to another position requires translating every intervening
coefficient. All rational identities may first be taken away from
u=0,v=0,u+eta=0,v+eta=0, and the displayed q-collision loci.

## 3. All matrix indices of the defect

Let gamma=(gamma_1,gamma_2) be the output matrix index, and (i,j)
the input matrix index. The gamma,ij coefficient on the right of
(4) is precisely

```math
\sum_h\sum_{t\ne h}
 \left[-f_{th}g(u+\eta)_{\gamma_1,t}g(v)_{\gamma_2,h}
       +b_{th}g(u+\eta)_{\gamma_1,h}g(v)_{\gamma_2,t}\right]
 g(u)^{-1}_{h,i}g(v+\eta)^{-1}_{h,j}\,(T_h-T_t).          \tag{5}
```

There is one shared input h in both inverse rows. The free output
site t is a second index. The shift selector c in (1) has been
summed exactly, giving T_h-T_t. Formula (5) follows from (1), not
from a presumed copied-index rule.

## 4. The two missing locality steps

The desired tensor equation has six independent outer indices:

```math
\sum_{r,h,t}\Gamma^r_{\gamma,ht}
 A_{r,h}^{a}X_{r,ht}^{ij}B_{r,h}^{b}
 =\delta_{ai}\delta_{bj}\,L_{\gamma,ij}I.                \tag{6}
```

The indices i,j in (5) are merely input matrix indices. They have
not been copied to independent outside A,B labels a,b as required
in (6). Calling (5) a Choi or copied-input identity would omit those
two independent equalities.

There is a second issue. The gamma-dependent bracket in (5) is a
function of the flag q. It is not an allowed fixed complex C map
Gamma. It cannot simply be absorbed into X, since X does not know
the output C label gamma. Likewise the shift T_t cannot be moved
past the final inverse row while keeping B independent of t unless
the resulting translated coefficient is accounted for.

Thus (4)--(5) supply a structured shared-input defect for a possible
resolvent or Green-kernel completion, but not that completion. Two
charge constraints, or an actual associative source coupling, still
have to enforce the copied A-i and B-j tags while resolving the
fixed-C and operator-order requirements. No exponent inequality is
deduced here.
