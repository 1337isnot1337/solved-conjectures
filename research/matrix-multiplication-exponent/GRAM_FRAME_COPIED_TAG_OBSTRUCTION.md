# A complete Gram-frame attempt and its copied-label obstruction

Research status: the unlabelled Gram commutator is an exact positive operator identity. The complete two-family source map below cannot supply the copied C/D labels at the required size, even with different scalar C maps and arbitrary rational Weyl middle operators. This is a failure of the displayed common frame. It does not exclude several genuinely different outside frames, a different source coupling, or a different Lax completion.

## 1. The exact unlabelled identity

Let X=(x_ah) be an H by H matrix of algebraically independent coordinates, put U=X^(-1), and write P=(partial_ah), where partial_ah differentiates x_ah. Matrix products are ordered products of differential operators. For fixed i,j define
```math
f_{ij}=\sum_{t=1}^H x_{it}x_{jt}.
```
Then
```math
[P,f_{ij}]U=E_{ij}+E_{ji}.                                      \tag{1}
```
Indeed, the (a,h) entry of the commutator is delta_ai x_jh+delta_aj x_ih, and XU=I. Equation (1) includes the factor two when i=j.

There is a legal two-family realization of its A/B operator word. The shared source label is h in [H]. The outside maps are
```math
\begin{array}{c|cc}
z&A_{zh}^{a}&B_{zh}^{b}\\\hline
1&P_{ah}&U_{hb}
\\ 2&\delta_{ah}I&-(PU)_{hb}.
\end{array}                                                     \tag{2}
```
With the same middle multiplication operator f_ij in both families, summing h gives P f_ij U-f_ij PU, which is (1). The physical B map is the flag transpose of the displayed right operator. In particular, (2) does not put an output-only derivative index on the other party.

Equation (1) has no copied C label. Supplying it is a separate coefficient requirement.

## 2. The complete source coefficients

Give each family the tagged source U_ABCD(H) W_CD(Q), together with the AD and BD operator flags. Let V_C be an arbitrary output C space. For each h, allow any fixed scalar C map
```math
\Gamma_{zh}:\mathbb C^Q\longrightarrow V_C,
\qquad W_{zh}=\mathop{\mathrm{im}}\Gamma_{zh}.
```
The two families may use unrelated maps Gamma. Let x_(zhc)^ij be arbitrary middle operators in the Weyl division ring over C(X); D has precisely the allowed local labels (z,h,c) and output (i,j). Set
```math
F_h^{ij}=\sum_c\Gamma_{1h}(e_c)\,x_{1hc}^{ij},\qquad
G_h^{ij}=\sum_c\Gamma_{2h}(e_c)\,x_{2hc}^{ij}.
```
These are V_C-valued operators, with F_h in W_1h and G_h in W_2h. The full output, with D coefficient D_ij, has A/B coefficient
```math
K_{ab}^{ij}
 =\sum_h P_{ah}F_h^{ij}U_{hb}
       -G_a^{ij}\sum_hP_{ah}U_{hb}.                           \tag{3}
```
Every output C coefficient is retained in (3). There is no restriction to a matched C/D diagonal before this equation is checked.

For commutative middle multiplication operators, (3) becomes
```math
K_{ab}^{ij}
 =\sum_h(F_h^{ij}-G_a^{ij})P_{ah}U_{hb}
       +\sum_h(\partial_{ah}F_h^{ij})U_{hb}.                  \tag{4}
```
Thus simply inserting Gram polynomials and comparing their commutators omits the first term unless the C-valued functions match. Since the derivative symbols xi_ah are independent, a central output in (4) forces F_h=G_a for every a,h. The following argument treats arbitrary rational Weyl middle operators as well.

## 3. Differential order, including rational middle operators

Use the order filtration in which every rational function of X has degree zero and each partial_ah has degree one. For nonzero differential operators, orders add and leading symbols multiply in the commutative polynomial ring C(X)[xi_ah]. These facts extend the order to the Ore division ring: ord(AB^(-1))=ord A-ord B, and its leading symbol is sigma(A)/sigma(B) in the field
```math
\mathcal K=\mathbb C(X,\xi_{ah}).
```
Independence of the fraction representation follows by multiplying an Ore common denominator and using additivity of order. No formal removal of a noncentral lower-order term is used.

Put
```math
W_* = \bigcap_h W_{1h}\ \cap\ \bigcap_a W_{2a},
\qquad w=\dim W_*\le Q,
```
and project C to V_C/W_*. The intersection of the images of all these subspaces is zero: W_* is contained in each subspace, and intersection commutes with quotient by a common subspace. The same assertion remains true after extending scalars to K.

Suppose the projected target has order at most t. Let d be the maximum order of its nonzero projected middle entries F_h,G_a. If d+1>t, the order-(d+1) coefficient of (3) vanishes. Multiplying this coefficient on the right by U^(-1)=X gives, entry by entry,
```math
\xi_{ah}\big(\sigma_d(F_h^{ij})-
                   \sigma_d(G_a^{ij})\big)=0.                \tag{5}
```
Here sigma_d denotes the degree-d part, with value zero for an entry of lower order. The nonzero xi_ah are invertible in K, so all these leading C-valued symbols agree. They lie in the zero common intersection. This contradicts the choice of d. Therefore
```math
d\le t-1.                                                     \tag{6}
```
At order t, equation (3) is consequently an ordinary scalar source map over K, obtained from its leading symbols. Each of its two families has AB|CD flattening rank at most H: before the local maps that cut separates the shared label h, while the CD wire stays on the CD side. Thus the projected order-t output has flattening rank at most 2H.

This argument requires one fixed P/U frame as in (2). In particular, it does not compare derivative symbols arising from several different nonlinear coordinate frames.

## 4. Scalar copied targets

Suppose (3) is a scalar copied target
```math
K_{ab}^{ij}=\delta_{ai}\delta_{bj}L(e_{ij})I,                 \tag{7}
```
where L:C^(H^2)->V_C is any scalar linear map. By (6), after quotienting C by W_*, the middle orders are at most -1. The order-zero output has flattening rank at most 2H.

For (7), that flattening rank is exactly the number of nonzero columns of the projected L: their A/B coordinate vectors are distinct, and their D labels are distinct. It is therefore at least the rank of the projected L. Adding back W_* proves
```math
\mathop{\mathrm{rank}} L\le Q+2H.                            \tag{8}
```
In particular, H=Q=p does not admit a C compression of rank p^(2-o(1)). This conclusion allows different C maps in the two families and arbitrary rational Weyl middle entries. The obstruction is stronger than checking the Gram polynomial alone, but it remains specific to the complete word (3).

For the uncompressed symmetric target E_ij+E_ji in (1), its AB|CD flattening rank is H(H+1)/2. Quotienting a C subspace of dimension w can kill at most w of the distinct coordinate columns C_ij, and removing w vectors lowers their span by at most w. The same argument therefore forbids the fully copied symmetric target whenever H(H+1)/2>Q+2H. The unlabelled identity (1) does not contradict this statement.

## 5. The additive exterior Casimir target also fails in this frame

Let p=binom(s,k), with 1<=k\lt s, and set H=p in the outside frame. Include s polynomial flag coordinates y_a among the coordinate field, or work in an enlarged Weyl field if needed. On V=Lambda^k C^s define
```math
G=\sum_{a,b}\rho_V(E_{ab})\otimes y_b\partial_{y_a}.
```
The full copied target under consideration is
```math
K^{IJ}_{AB}=\big(GE_{IJ}-E_{IJ}G\big)C_{IJ}.                  \tag{9}
```
Its order-one symbol is the commutator with rho_V(Z), where Z_ab=xi_a y_b is a rank-one s by s matrix. Over the symbol field, z=sum_a xi_a y_a is nonzero, and Z is diagonalizable with eigenvalues z once and zero s-1 times. The induced additive action on Lambda^k has eigenvalue z with multiplicity
```math
m_1=\binom{s-1}{k-1}
```
and eigenvalue zero with multiplicity
```math
m_0=\binom{s-1}{k}.
```
It follows that the linear map E->rho_V(Z)E-E rho_V(Z) on End(V) has rank 2m_0m_1. These are exactly the A/B column vectors of the principal AB|CD flattening of (9), so that flattening has rank 2m_0m_1.

Projecting its C factor modulo W_* can annihilate at most w coordinate vectors C_IJ. Every remaining principal A/B vector is still recovered by first selecting its distinct D_IJ label and then a C functional nonzero on the remaining C column. Hence the projected principal flattening has rank at least 2m_0m_1-w.

Equation (6), with t=1, bounds the same rank by 2H. Therefore the direct copied Casimir target is impossible in this common frame whenever
```math
2\binom{s-1}{k}\binom{s-1}{k-1}>Q+2H.                       \tag{10}
```
At H=Q=p the left side equals 2p^2 k(s-k)/s^2, which exceeds 3p in the balanced regime k/s bounded away from zero and one, and in the sparse regime k->infinity with log k=o(log s), once the parameters are large. This assertion does not include fixed k=1; equation (10) is the exact sufficient condition. For example, s=4,k=2 gives rank 18 and threshold18, so this test alone does not exclude that smallest case; s=6,k=3 gives rank200>60.

The result rules out the exact frame (2), not the additive Casimir target itself. A construction with genuinely different dense outside frames, a coupled source not resolved into (3), or a full Lax expression with additional terms still needs its own complete coefficient audit.

The rational-middle extension in Section 3 was identified jointly with the operator-comparison worker. The symbol-rank computation in Section 5 is self-contained. No claim about the matrix multiplication exponent follows from this failed source map.

The portable checker `check_gram_frame_copied_tags.py` verifies (1) through exact polynomial identities at H=2,3, and retains a specific off-copied-tag derivative of coefficient -1/2 for coordinate versus Hadamard C maps. It also constructs the additive exterior matrices at (s,k)=(3,1),(4,2),(5,2), checks G^2=zG and its exact trace over the integers, and certifies the stated commutator ranks with nonzero rank minors modulo 1009. The algebraic two-eigenvalue calculation supplies the matching characteristic-zero upper bound, so the modular calculation is used only as a lower certificate. The checker finishes in under a second in the current environment and tests no source conversion.
