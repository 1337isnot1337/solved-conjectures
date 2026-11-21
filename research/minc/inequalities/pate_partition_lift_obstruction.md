# The complementary factors in a partition-indicator lift

Research checkpoint, 20 November 2026 (America/Chicago). This records the exact loss in a proposed use of Pate's indicator theorem. It does not prove or disprove Chollet's conjecture.

Let `B` be PSD Hermitian of order `n`, put `p=per B`, and fix positive integers `alpha_1,...,alpha_q` summing to `n`. Let `P_alpha` be the set of ordered set partitions with those part sizes, and write


```math
N=|\mathcal P_\alpha|=\binom n{\alpha_1,\ldots,\alpha_q}.
```


For `S,T` in this set, define


```math
W_{S,T}=\prod_{j=1}^q|\mathop{\mathrm{per}}B[S_j,T_j]|^2,
\quad
V_{S,T}=\prod_{j=1}^q|\mathop{\mathrm{per}}B[S_j^c,T_j^c]|^2,
\quad C_\alpha=\sum_{S,T}W_{S,T}.
```


The desired occupation-coefficient comparison is `C_alpha<=N p^2`.

## What the indicator lift actually proves

Use


```math
H=B^{\oplus q}\oplus\overline B^{\oplus q}.
```


For each `S`, select `S_j` from the `j`th copy of each of the two conjugate families. The resulting subset `U_S` has size `2n`. Block diagonality gives


```math
\mathcal C_{2n}(H)_{U_S,U_T}=W_{S,T}V_{S,T}.
```


Pate's established indicator-vector theorem therefore yields exactly


```math
L_\alpha:=\sum_{S,T}W_{S,T}V_{S,T}\leq Np^{2q}. \tag{1}
```


It does not remove the complementary factors `V`.

## The direct weighted-average bridge is false

A sufficient bridge would be


```math
L_\alpha\geq p^{2(q-1)}C_\alpha. \tag{2}
```


This fails even when `B` is the all-ones matrix. In that case `p=n!`, and the factors are constant:


```math
W_{S,T}=\prod_j(\alpha_j!)^2,
\qquad
V_{S,T}=\prod_j((n-\alpha_j)!)^2.
```


Thus averaging cannot repair the pointwise failure. For `n=q=3` and `alpha=(1,1,1)`, one has


```math
N=6,\quad C_\alpha=36,\quad V_{S,T}=64,\quad
L_\alpha=2304,
```


whereas the right side of (2) is `6^4*36=46656`. The target coefficient bound still holds: `C_alpha=p^2<=N p^2`. Its large slack at this input is precisely why failure of the bridge is not a conjecture counterexample.

One cannot compensate by uniformly reducing the constant `N` in (1). At `B=I_n`, nonzero terms require `S=T`, and each such term is one. Hence `p=1` and `L_alpha=N`, so that constant is attained.

## A nonlinear repair and its strength

The nonlinear inequality


```math
L_\alpha\geq\frac{C_\alpha^q}{N^{q-1}} \tag{3}
```


would combine with (1) to give the desired bound. It does not follow from ordinary power-mean or Cauchy--Schwarz inequalities, whose sums here have `N^2` terms. Indeed, (3) is false for `q=2`: take `B` equal to the all-ones matrix of order two and `alpha=(1,1)`. Then `N=2`, `C_alpha=4`, and `L_alpha=4<8=C_alpha^2/N`.

Restricting (3) to three or more occupied parts removes that particular example but does not turn it into an established estimate. Its all-singleton specialization is already at least as strong as Chollet's conjecture.

To see this, take `q=n`, `alpha=(1,...,1)`, and


```math
D(B)_{ij}=b_{ij}\mathop{\mathrm{per}}B(i\mid j),
\qquad Q(B)=\mathop{\mathrm{per}}(B\circ\overline B).
```


Ordered singleton partitions are permutations. Therefore


```math
C_\alpha=n!Q(B),\qquad
L_\alpha=n!\mathop{\mathrm{per}}(D(B)\circ\overline{D(B)}).
```


Consequently (3) becomes


```math
\mathop{\mathrm{per}}(D(B)\circ\overline{D(B)})\geq Q(B)^n. \tag{4}
```


Suppose (4) held for every PSD input of every order at least three. For an arbitrary `B` of order `n`, apply it to `B_M=B direct_sum I_M`. Then


```math
D(B_M)=D(B)\oplus p I_M,
\qquad Q(B_M)=Q(B).
```


It follows that


```math
\mathop{\mathrm{per}}(D(B)\circ\overline{D(B)})p^{2M}
\geq Q(B)^{n+M}.
```


When `p>0`, the prefactor is positive: a PSD matrix with positive permanent has positive diagonal, and every diagonal entry of `D(B)` is positive. Taking `M`th roots and then sending `M` to infinity gives


```math
Q(B)\leq p^2,
```


which is self-Chollet. When `p=0`, a PSD input has a zero row, so self-Chollet is immediate. This argument proves an implication, not the converse or (4). It prevents the nonlinear repair from being treated as a routine intermediate estimate.

Pate's theorem and its primary-source access limits are recorded in [the Pate correction](pate_packet_correction.md). All examples and padding identities above are exact. No new named conjecture resolution is claimed.
