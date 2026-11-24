# Finite centroid obstruction to the proposed geodesic trade

Status: research. The finite border obstruction below is proved. It does
not give a positive asymptotic overhead bound and does not exclude a
source-only full unit of rank two. The conditional asymptotic conversion
in Section 2 remains unresolved.

## 1. A finite obstruction that persists under common catalysts

Let $`q\ge2`$ and $`N\ge1`$ be integers. On four parties put

```math
S_{q,N}=U_{ABC}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N),
\qquad
T_{q,N}=U_{ACD}(q)U_{BCD}(q)W_{AB}(N).
```

The dimensions at $A,B,C$ agree: $qN,qN,q^2$. The source $D$
space has dimension $qN^2$; the target $D$ space has dimension $q^2$.
Both tensors are concise at $A,B,C$.

For a tensor $Z\in A\otimes B\otimes C\otimes D$, define its common
$ABC$ centroid to be the vector space of triples

```math
\mathcal Z_{ABC}(Z)=\{(L_A,L_B,L_C):
 (L_A\otimes I\otimes I\otimes I)Z
 =(I\otimes L_B\otimes I\otimes I)Z
 =(I\otimes I\otimes L_C\otimes I)Z\}.
```

This is the kernel of a linear map whose entries depend linearly on
$Z$. Consequently the locus $\dim\mathcal Z_{ABC}(Z)\ge q$ is Zariski
closed. Invertible local maps at $A,B,C$ transport the centroid by
conjugation. Any local map at $D$ preserves each existing centroid
triple, because it commutes with the three displayed actions.

In coordinates,

```math
S_{q,N}=\sum_{h,c=1}^{q}\sum_{a,b=1}^{N}
 A_{h,a}B_{h,b}C_{h,c}D_{c,a,b}.
```

For each $h$, the three projectors onto the subspaces with first index
$h$ act identically. They give $q$ linearly independent centroid triples,
which remain independent after a map at $D$.

On the other hand,

```math
T_{q,N}=\sum_{i,j=1}^{q}\sum_{k=1}^{N}
 A_{i,k}B_{j,k}C_{i,j}D_{i,j}
```

has a one-dimensional common $ABC$ centroid. To see this, compare each
coefficient of $D_{i,j}$ in the equality of the $A$ and $C$ actions.
The $C$ action must preserve the line spanned by $C_{i,j}$, since the
$A$ action leaves that $C$ basis vector unchanged. The $A$ action
must preserve the block $A_i=\mathop{\mathrm{span}}_k A_{i,k}$, since the
$C$ action leaves the $A$ block unchanged. Similarly the $B$ action
preserves each $B_j$, and there is a scalar $\lambda_{ij}$ such that

```math
L_A|_{A_i}=\lambda_{ij} I_N,
\qquad L_B|_{B_j}=\lambda_{ij} I_N,
\qquad L_C(C_{i,j})=\lambda_{ij}C_{i,j}.
```

The first equality makes $\lambda_{ij}$ independent of $j$, and the
second makes it independent of $i$. Therefore all three maps are the
same scalar multiple of the identity.

Suppose a degeneration $S_{q,N}\unrhd T_{q,N}$ existed. Because the
source and target $A,B,C$ dimensions agree and the target is concise,
the three local matrices must be invertible over the Laurent-series
field. After the $D$ map, every generic member thus has common centroid
dimension at least $q$. Closedness would give the same lower bound at
the limit, contradicting the target's centroid dimension one.

Hence

```math
S_{q,N}\not\unrhd T_{q,N}\qquad(q\ge2,N\ge1).
```

Tensor powers are the same construction with $(q,N)$ replaced by
$(q^n,N^n)$, so the same obstruction holds for every equal positive
power. A common four-party unit of rank $r$ gives $rq$ independent
source centroid projectors and exactly $r$ target centroid directions:
the $D$ block label forces all centroid operators to preserve the full
unit blocks, and the preceding target proof applies in each block.
Thus common full-unit catalysts also do not remove the finite border
obstruction. Source-only full units change the $A,B,C$ dimensions;
the invertibility argument then fails and no conclusion is asserted.

## 2. The conditional unit inequality sought

Let $`F`$ be a normalized four-party spectral point. For every subset
$`S`$ write $`F(U_S(q))=q^{u_S}`$, and put $`d_{ij}=u_{ij}`$.
Suppose the three wire prices obey the geodesic identity

```math
d_{AD}+d_{BD}=d_{AB}.
```

The proved geodesic-face normalization in
[FULL_TENSOR_CONSTRAINTS.md](FULL_TENSOR_CONSTRAINTS.md) gives
$`u_{ABD}=d_{AB}`$. Intersecting-unit uncrossing then gives

```math
u_{ABC}+u_{ABD}\ge u_{ABCD}+u_{AB}.
```

Monotonicity under deleting a party gives the opposite comparison
$`u_{ABC}\le u_{ABCD}`$, so $`u_{ABC}=u_{ABCD}=1`$.
The equality one would like to prove is

```math
u_{ACD}+u_{BCD}=1+d_{CD}.                       \tag{1}
```

The forward uncrossing inequality already proves that the left side
is at least the right side. The reverse inequality would follow from
$`S_{q,N}\gtrsim T_{q,N}`$ for any one pair $`q\ge2,N\ge1`$,
because evaluating gives

```math
q^{u_{ACD}+u_{BCD}}N^{d_{AB}}
\le q^{1+d_{CD}}N^{d_{AD}+d_{BD}},
```

and the two powers of $`N`$ cancel. Here $`\gtrsim`$ means
asymptotic restriction allowing source-only full units of
subexponential rank, as in the repository spectral model.

A more flexible sufficient condition is the existence, for arbitrarily
large integers $`q`$, of integers $`N(q)\ge1`$ and $`r(q)\ge1`$
such that

```math
U_{ABCD}(r(q))S_{q,N(q)}\unrhd T_{q,N(q)},
\qquad \frac{\log r(q)}{\log q}\longrightarrow0.       \tag{2}
```

There is no growth restriction on $`N(q)`$. Indeed, spectral monotonicity
and the same cancellation turn (2) into

```math
u_{ACD}+u_{BCD}\le1+d_{CD}
                         +\frac{\log r(q)}{\log q},
```

which gives (1) in the limit. A bounded source-only overhead would
suffice. The centroid argument in Section 1 does not rule out (2),
because the three relevant local matrices are then rectangular.
No family satisfying (2) is constructed here.

Equation (1) is a conditional equality on an actual normalized point.
It is not inferred by assigning distances to an ordinary metric tree.
Existence of an extension that places a common geodesic center inside
an arbitrary original triangle is a separate issue, treated precisely
in [TRIPOD_EXTENSION_CRITERION.md](TRIPOD_EXTENSION_CRITERION.md).
