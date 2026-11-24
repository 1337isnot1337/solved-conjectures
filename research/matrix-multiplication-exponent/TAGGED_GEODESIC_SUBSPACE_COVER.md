# Tagged geodesic trade as an overlapping subspace cover

Research status. The equivalence in Section 1 is exact. The existence of
covers with the asymptotic parameters in Section 2 is unresolved.

## 1. Exact cover equivalence

Let Q,p,N,M,r be positive integers. Define

```math
Z_{Q,N}=U_{ABCD}(Q)W_{CD}(Q)W_{AD}(N)W_{BD}(N)
 =\sum_{h,c,k,\ell}
 A_{hk}B_{h\ell}C_{hc}D_{hck\ell},
```

where h,c range over [Q] and k,ell over [N]. The explicit h coordinate
at D is part of this source. Let

```math
T_{p,M}=\sum_{i,j=1}^p\sum_{w=1}^M
 A_{iw}B_{jw}C_{ij}D_{ij}.
```

Write A'=C^p tensor C^M, B'=C^p tensor C^M, C'=C^(p^2), and

```math
t_{ij}=\left(\sum_{w=1}^M A_{iw}B_{jw}\right)C_{ij}
 \in A'\otimes B'\otimes C'.
```

The following are equivalent:

1. There is an exact local restriction U_ABCD(r) Z_(Q,N) >= T_(p,M).
2. There are subspaces U_zh of A', V_zh of B', W_zh of C', for
   z in [r], h in [Q], satisfying

```math
\dim U_{zh}\le N,\quad \dim V_{zh}\le N,\quad \dim W_{zh}\le Q,
```

and

```math
\mathop{\mathrm{span}}\{t_{ij}:i,j\in[p]\}
 \subseteq
 \sum_{z=1}^r\sum_{h=1}^Q U_{zh}\otimes V_{zh}\otimes W_{zh}.       \tag{1}
```

No direct-sum or coordinate-support condition is imposed on these
subspaces. Their overlaps are part of the problem.

For 1=>2, restrict each A map to its (z,h) source flag space and take
its image U_zh; define V_zh and W_zh in the same way. Before applying
the D map, every ABC slice is in the right side of (1). The D map
only forms linear combinations of these slices, so every t_ij is in
that space.

For 2=>1, choose maps A_zh:C^N->U_zh, B_zh:C^N->V_zh and
C_zh:C^Q->W_zh spanning the respective spaces, padding with zero
columns when necessary. For each i,j, membership in (1) supplies
coefficients d_(zhckell)^(ij) such that

```math
t_{ij}=\sum_{z,h,c,k,\ell}
 d_{zhck\ell}^{ij}A_{zh}(e_k)\otimes B_{zh}(e_\ell)
                         \otimes C_{zh}(e_c).
```

Define the D map by

```math
D_{zhck\ell}\longmapsto\sum_{i,j}d_{zhck\ell}^{ij}D_{ij}.
```

Together with the three chosen maps this is exactly the required
restriction. This also proves that no extra consistency equation on
the different t_ij is hidden in (1): D has an independent coefficient
for every displayed source coordinate and every output i,j.

## 2. Parameters that would suffice

Let F be a normalized four-party spectral point and suppose
d_AD+d_BD=d_AB=s. Put c=d_CD and u=u_ACD+u_BCD. Multiplicativity
and normalized full-unit values give

```math
F(Z_{Q,N})=Q^{1+c}N^s,
\qquad F(T_{p,M})=p^u M^s.
```

Thus any cover in (1) gives

```math
p^u\le r Q^{1+c}(N/M)^s.                             \tag{2}
```

An unbounded sequence of covers with

```math
Q/p=p^{o(1)},\qquad r=p^{o(1)},\qquad N/M=p^{o(1)}
```

would therefore give u<=1+c for every such F. The already established
opposite unit-uncrossing inequality and geodesic normalization would
give (G), and the repository's conditional geometry theorem would then
give $`\omega_{\mathbb C}=2`$. See
[GEODESIC_UNCROSSING_EQUIVALENCE.md](GEODESIC_UNCROSSING_EQUIVALENCE.md).
The cover sequence is not established.

This price calculation uses the tagged source directly. A separate
polynomial-separator construction in the project obtains the h tag
from the original untagged S source with fresh AD/BD flags and returns
almost all of those flags as an AB wire. That construction is proved in
[TAGGED_OPERATOR_TRADE_TRANSFER.md](TAGGED_OPERATOR_TRADE_TRANSFER.md).
It explains the operational relation to S, but is not needed to verify (2).

## 3. Exact supported density for a fixed cover

Fix the local output spaces and the overlapping subspaces from that
note, and put

```math
V=\sum_{z=1}^r\sum_{h=1}^Q
       U_{zh}\otimes V_{zh}\otimes W_{zh}
  \subseteq A'\otimes B'\otimes C'.
```

For each pair `i,j` define the injective linear map

```math
J_{ij}:\mathbb C^M\longrightarrow A'\otimes B'\otimes C',
\qquad J_{ij}(w)=\sum_{t=1}^M w_t A_{it}B_{jt}C_{ij},
```

and the coefficient subspace

```math
K_{ij}=J_{ij}^{-1}(V).
```

Its coordinate support is

```math
\Sigma_{ij}=\{t\in[M]:\text{some }w\in K_{ij}
                                    \text{ has }w_t\ne0\}.
```

The empty support is allowed, for instance when `K_ij=0`.

### Proposition: the exact maximum supported density

For the fixed product-space sum `V`, the largest possible number of
nonzero coefficients in a support-correct target obtained by varying
the map at `D` is

```math
\sum_{i,j=1}^p|\Sigma_{ij}|.
```

Equivalently, the maximum density of such a target relative to the
full hypergraph tensor is exactly

```math
\rho(V)={1\over p^2M}\sum_{i,j=1}^p|\Sigma_{ij}|.             \tag{3}
```

The statement concerns the support of the complete resulting tensor,
after all coefficient cancellations. It is not a count of source
terms or of possibly contributing records.

**Proof.** A support-correct target has the form

```math
P=\sum_{i,j=1}^p J_{ij}(w^{ij})\otimes D_{ij}.
```

The exact cover equivalence shows that it can be obtained from the
fixed three local maps precisely when every `J_ij(w^ij)` lies in `V`,
or equivalently every `w^ij` lies in `K_ij`. There is no consistency
condition between the choices for different `i,j`, because the
explicitly tagged source gives the map at `D` an independent scalar
coefficient for every source coordinate and every output `D_ij`.

For any one pair `i,j`, a vector in `K_ij` can have nonzero
coordinates only in `Sigma_ij`, by definition. Conversely, for each
`t` in `Sigma_ij`, the coordinate equation `w_t=0` cuts out a proper
linear subspace of `K_ij`. A finite union of proper linear subspaces
cannot cover a vector space over the infinite field `C`. Thus there
is a vector of `K_ij` whose coordinates are nonzero simultaneously
at every `t` in `Sigma_ij`. If `Sigma_ij` is empty, take zero.

Choose these vectors independently for all pairs. The cover
equivalence realizes the corresponding complete tensor with one map
at `D`; its support is exactly the disjoint union of the sets
`{(i,j,t):t in Sigma_ij}`. This attains the stated upper bound. QED.

### Exact linear-algebra computation

Let `H` be a matrix whose columns span `V`, in the fixed output basis.
Let `R` be any matrix whose row space is the full annihilator of
`col(H)`. In other words,

```math
\ker R=\mathop{\mathrm{col}}(H).
```

Then

```math
K_{ij}=\ker(RJ_{ij}).                                      \tag{4}
```

A basis matrix for this kernel directly identifies its coordinate
support: coordinate `t` belongs to `Sigma_ij` precisely when row `t`
of that basis matrix is nonzero. Equivalently, with `e_t` the standard
coordinate column,

```math
t\notin\Sigma_{ij}
\quad\Longleftrightarrow\quad
 e_t^{\mathsf T}\in\mathop{\mathrm{row}}(RJ_{ij}).                \tag{5}
```

The transpose in (5) only expresses a coordinate functional in
matrix notation; no tensor partial transpose is being applied.

Equations (4)--(5) use exact linear algebra. Numerical nullspaces can
suggest candidates but do not certify a zero coordinate, an exact
kernel dimension, or the absence of off-support coefficients. A
claimed certificate must reconstruct the local maps and the chosen
`D` coefficients over an exact coefficient field and check the full
tensor identity.

### Consequence for a geodesic trade search

If `rho(V)>0`, the proposition gives a support-correct tensor `P`
of that density. The [partial-hypergraph density theorem](PARTIAL_HYPERGRAPH_DENSITY.md)
gives, for every normalized four-party spectral point `F`,

```math
F(P)\ge\rho(V)F(T_{p,M}).
```

Under the geodesic hypothesis and the notation of the subspace-cover
note, the legal source restriction therefore implies

```math
p^u\le {r\over\rho(V)}Q^{1+c}(N/M)^s.                     \tag{6}
```

Consequently a sequence of exact subspace covers with

```math
Q/p=p^{o(1)},\qquad r=p^{o(1)},\qquad N/M=p^{o(1)},
\qquad \rho(V)=p^{-o(1)}
```

would suffice for the same limiting geodesic inequality as a full
target. This replaces the requirement that each all-ones vector
belongs to `K_ij` by an exact and strictly weaker coordinate-support
condition. No such asymptotic sequence is established here.
