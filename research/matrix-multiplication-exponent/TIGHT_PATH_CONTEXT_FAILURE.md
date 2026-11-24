# Tight path contraction need not stay tight after a coherent record is added

Status: exact counterexample to one proposed equality-case implication, followed by a finite obstruction already implied by the repository's centroid argument. Neither statement decides the geodesic unit inequality or the matrix multiplication exponent.

All products are regrouped by the four named parties. Write
$`F(W_{XY}(q))=q^{d_{XY}}`$ and
$`F(U_H(q))=q^{u(H)}`$.

## 1. A genuine normalized point and its values

For singleton weights $`\theta_X\ge0`$, $`\sum_X\theta_X=1`$, define
```math
F_\theta(T)=2^{E_\theta(T)},\qquad
E_\theta(T)=
\sup_{g_X\in\mathop{\mathrm{GL}}(V_X)}
\sum_{X\in\{A,B,C,D\}}\theta_X H(\rho_X(gT)),
\tag{1}
```
where $`g=\bigotimes_Xg_X`$, $`\rho_X(gT)`$ is the normalized one-party reduced density matrix of the nonzero pure tensor $`gT`$, and entropy uses base-two logarithms. Set $`F_\theta(0)=0`$.

The imported result is Christandl, Vrana and Zuiddam, *Universal points in the asymptotic spectrum of tensors*, [arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3), Definition 3.16, Theorem 3.30 and Corollary 3.31. Definition 3.16 is (1); Theorem 3.30 identifies the upper and lower quantum functionals in the singleton regime, and Corollary 3.31 proves that this common functional is a normalized universal spectral point. In particular it has all required restriction monotonicity, full-direct-sum additivity and tensor-product multiplicativity properties.

For $`|H|\ge2`$,
```math
F_\theta(U_H(q))=q^{\sum_{X\in H}\theta_X}.
\tag{2}
```
Indeed, every participating local space has dimension $`q`$, so its entropy is at most $`\log_2q`$, and the normalized displayed unit tensor simultaneously reaches these bounds. All outside factors have entropy zero. Taking $`H=\{X,Y\}`$ gives
$`d_{XY}=\theta_X+\theta_Y`$.

Choose
```math
(\theta_A,\theta_B,\theta_C,\theta_D)=(a,b,c,0),
\qquad a,b,c>0,\quad a+b+c=1.
\tag{3}
```

## 2. The exact tight restriction and its recorded version

Let
```math
P_q=W_{AD}(q)W_{BD}(q)
 =\sum_{i,j=1}^q e_i^A e_j^B e_{ij}^D.
```
The local map at $`D`$
```math
\ell(e_{ij}^D)=\delta_{ij}
\tag{4}
```
takes $`P_q`$ to $`W_{AB}(q)`$. Both have value $`q^{a+b}`$ at (3), since
```math
d_{AD}+d_{BD}=a+b=d_{AB}.
\tag{5}
```
Thus (4) is an actual restriction tight at the chosen normalized point.

Now define a different tensor, with the same input index recorded at $`C`$:
```math
Z_q=\sum_{i,j=1}^q e_i^A e_j^B e_{ij}^C e_{ij}^D
   =U_{ACD}(q)U_{BCD}(q).
\tag{6}
```
Equation (6) defines the recorded tensor. It does not assert that adding this record is a local restriction from $`P_q`$.

Applying precisely the same local map (4) gives
```math
(1_A\otimes1_B\otimes1_C\otimes\ell)Z_q
 =\sum_{i=1}^q e_i^Ae_i^Be_{ii}^C
 \cong U_{ABC}(q).
\tag{7}
```
Nevertheless,
```math
F_\theta(Z_q)=q^{a+b+2c}=q^{1+c},
\qquad
F_\theta(U_{ABC}(q))=q.
\tag{8}
```
The restriction has become strict by the factor $`q^c`$. For instance $`a=b=c=1/3`$ gives $`q^{4/3}`$ versus $`q`$.

Consequently, equality of a spectral value under the path contraction does not imply equality after a coherent record is added at another party. This remains false even when every three-party restriction through $`D`$ is the rigid edge functional and the full four-party point is a genuine normalized spectral point.

The difference in (8) is exactly
$`F_\theta(W_{CD}(q))=q^c`$. Thus this counterexample does not contradict
```math
u(ACD)+u(BCD)\le u(ABC)+d_{CD}.
\tag{9}
```
At the point (3), (9) holds with equality. It only rejects the stronger rule that would omit the record charge. The missing task is to establish the correct charge bound (9) for every normalized point satisfying (5).

The existing [copied-factor counterexample](COPIED_FACTOR_COUNTEREXAMPLE.md) rejects monotonicity of a proposed copied-factor functional under an invertible shear. The computation here addresses the narrower equality-preservation premise directly.

## 3. The proposed star comparison has no one-copy same-size degeneration

Consider
```math
\begin{aligned}
S_q&=U_{ABCD}(q)W_{AD}(q)W_{BD}(q)W_{CD}(q)\\
   &=\sum_{h,a,b,c=1}^q
      e_{ha}^A e_{hb}^B e_{hc}^C e_{habc}^D,\\
Y_q&=U_{ABD}(q)U_{ACD}(q)U_{BCD}(q)
   =\sum_{i,j,k=1}^q e_{ij}^A e_{ik}^B e_{jk}^C e_{ijk}^D.
\end{aligned}
\tag{10}
```
For $`q\ge2`$, there is no Laurent degeneration $`S_q\unrhd Y_q`$.

For a four-party tensor $`T`$, let
```math
\mathcal Z_{ABC}(T)=
\{(L_A,L_B,L_C):
 (L_A\otimes1\otimes1\otimes1)T
 =(1\otimes L_B\otimes1\otimes1)T
 =(1\otimes1\otimes L_C\otimes1)T\}.
\tag{11}
```
This is the kernel of a linear system whose matrix entries are linear in the tensor coefficients. Therefore its dimension cannot decrease at a finite Laurent limit.

The source has $`q`$ independent triples in (11), given by the projections onto the common $`h`$ sector at $`A,B,C`$. An arbitrary map at $`D`$ preserves these equalities. If a degeneration to $`Y_q`$ existed, its square $`A,B,C`$ maps would be invertible over the Laurent field: $`Y_q`$ has full flattening rank $`q^2`$ at each of these parties, and flattening rank cannot increase on specialization. Conjugation by these maps preserves the independence of the $`q`$ projector triples. Hence the generic output and then its limit would have $`\dim\mathcal Z_{ABC}\ge q`$.

On the target, compare the coefficient of each independent vector $`e_{ijk}^D`$. The equality
```math
L_Ae_{ij}\otimes e_{ik}\otimes e_{jk}
=e_{ij}\otimes L_Be_{ik}\otimes e_{jk}
=e_{ij}\otimes e_{ik}\otimes L_Ce_{jk}
```
forces each displayed basis vector to be an eigenvector of its map, with respective eigenvalues
$`\alpha_{ij}=\beta_{ik}=\gamma_{jk}`$.
Varying $`i,j,k`$ makes all these eigenvalues equal. Thus the target's common transfer space consists of scalar triples and has dimension one, a contradiction.

This is a direct reformulation of the finite obstruction in
[FULL_TENSOR_CONSTRAINTS.md, Section 4.1](FULL_TENSOR_CONSTRAINTS.md).
Indeed, contracting all $`D`$ coordinates of $`Y_q`$ to one produces the matrix multiplication tensor on $`A,B,C`$, and the cited section already excludes that contracted target from $`S_q`$. It is not an original asymptotic obstruction.

The finite result does not exclude a source-only full-unit overhead, rectangular local maps, or subexponential overhead after tensor powers. Therefore it does not decide the universal spectral star inequality
```math
u(ABD)+u(ACD)+u(BCD)
 \le u(ABCD)+d_{AD}+d_{BD}+d_{CD}.
\tag{12}
```
On a normalized geodesic configuration, (12) would imply (9). No proof of (12) is supplied here.

