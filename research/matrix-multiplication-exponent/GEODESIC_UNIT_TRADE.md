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

The limit is taken along the chosen unbounded sequence of integers $`q`$.
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

The geometric implication no longer requires such a common center.
[GEODESIC_UNCROSSING_EQUIVALENCE.md](GEODESIC_UNCROSSING_EQUIVALENCE.md)
proves that (1), imposed on every actual normalized four-party point
with the stated geodesic face, is equivalent to
$`\omega_{\mathbb C}=2`$. Its proof uses guaranteed midpoint extensions
and convexity of unit charges, followed by a CAT(0) first-variation
argument. The missing assertion is (1) itself.

## 3. The finite-family criterion is also necessary

Under the stated spectral imports, condition (2) is equivalent to the
conditional identity (1), and hence to $`\omega_{\mathbb C}=2`$.
The sufficiency is already proved. Here is the converse, including the
order of its limits.

For $`F\in\Delta_4`$ put

```math
s(F)=d_{AD}+d_{BD}-d_{AB}\ge0,
\qquad
\delta(F)=u_{ACD}+u_{BCD}-u_{ABC}-d_{CD}.
```

These are continuous functions on the compact normalized spectrum.
Forward intersecting uncrossing and deletion of a party give
$`\delta(F)\ge0`$ for every point. Also $`\delta(F)\le2`$,
because every subset unit charge is at most one. Define

```math
\gamma_k=\max_{F\in\Delta_4}\{\delta(F)-ks(F)\},
\qquad k=0,1,2,\ldots.
```

The flattening across $`C\mid ABD`$ has $`s=\delta=0`$,
so $`\gamma_k\ge0`$. The sequence is nonincreasing. If
$`m=\max_{s(F)=0}\delta(F)`$, then $`\gamma_k\ge m`$.
Choose a maximizing point for each positive $`k`$. Its coordinates
$`(s,\delta)`$ lie in a fixed compact subset of $`\mathbb R^2`$,
and nonnegativity of the maximum gives $`ks\le\delta\le2`$.
Along a convergent subsequence, $`s\to0`$. Therefore

```math
\lim_{k\to\infty}\gamma_k
\le\limsup\delta(F_k)\le m.
```

Together with the lower bound this proves

```math
\lim_{k\to\infty}\gamma_k
=\max_{s(F)=0}\delta(F).                         \tag{3}
```

On $`s=0`$, Section 2 gives $`u_{ABC}=1`$. Thus (1) for all
geodesic points is equivalent to $`\gamma_k\to0`$.

Fix $`k`$ and abbreviate $`S=S_{2,2^k}`$, $`T=T_{2,2^k}`$.
Their spectral ratio is

```math
\log_2\frac{F(T)}{F(S)}=\delta(F)-ks(F).
```

Let $`r_{n,k}`$ be the least positive integer with
$`U_{ABCD}(r_{n,k})S^{\otimes n}\ge T^{\otimes n}`$.
It exists because a full unit of sufficiently large rank supplies the
target. Products of restrictions make $`r_{n,k}`$ submultiplicative in
$`n`$. Spectral monotonicity gives the lower bound in

```math
\lim_{n\to\infty}\frac{\log_2r_{n,k}}n=\gamma_k. \tag{4}
```

For the upper bound, fix a rational $`a/b>\gamma_k`$ with
$`a,b`$ positive integers. Every point satisfies
$`F(U_{ABCD}(2^a)S^{\otimes b})\ge F(T^{\otimes b})`$.
Strassen's asymptotic preorder theorem, in CVZ
[arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3),
Theorem 1.1, gives restrictions

```math
U_{ABCD}(2^{a(n+e_n)})S^{\otimes b(n+e_n)}
\ge T^{\otimes bn},\qquad e_n=o(n),\quad e_n\ge0.
```

The source has ordinary rank at most $`2^{2+2k}`$. Replacing the
extra $`be_n`$ source copies by a full unit gives

```math
U_{ABCD}\!\left(2^{an+[a+(2+2k)b]e_n}\right)
S^{\otimes bn}\ge T^{\otimes bn}.
```

This proves that the limit in (4) is at most $`a/b`$; let the
rationals decrease to $`\gamma_k`$. The asymptotic duality
has its usual power-universality hypothesis here: $`S`$ restricts
to $`U_{ABCD}(2)`$ by retaining $`U_{ABC}(2)W_{CD}(2)`$
and identifying its two indices at $`C`$. The general overhead
conversion is also recorded in
[TETRAHEDRAL_OVERHEAD.md](TETRAHEDRAL_OVERHEAD.md).

Assume (1). Choose $`k_j`$ with $`\gamma_{k_j}\to0`$.
For each fixed $`k_j`$, equation (4) allows a choice $`n_j\ge j`$
such that

```math
\frac{\log_2r_{n_j,k_j}}{n_j}
\le\gamma_{k_j}+\frac1j.
```

Set $`q_j=2^{n_j}`$, $`N_j=2^{k_jn_j}`$ and
$`r_j=r_{n_j,k_j}`$. Regrouped tensor products give the exact
isomorphisms

```math
S_{2,2^{k_j}}^{\otimes n_j}\cong S_{q_j,N_j},
\qquad
T_{2,2^{k_j}}^{\otimes n_j}\cong T_{q_j,N_j}.
```

They yield finite ordinary restrictions satisfying (2), with
$`\log r_j/\log q_j\to0`$. No uniform estimate in $`k`$
has been assumed: $`k_j`$ is chosen first, then $`n_j`$.
This proves the claimed equivalence. Spectral duality supplies no
explicit local maps without proving (1).

## 4. Allowing a small loss in the neutral flag

One can replace the target flag size by $`M(q)\le N(q)`$.
Suppose there are finite degenerations

```math
U_{ABCD}(r(q))S_{q,N(q)}\unrhd T_{q,M(q)}
```

along an unbounded sequence of $`q`$, with

```math
\frac{\log r(q)}{\log q}\longrightarrow0,
\qquad
\frac{\log(N(q)/M(q))}{\log q}\longrightarrow0.
```

At a normalized point with the geodesic face, evaluation gives

```math
u_{ACD}+u_{BCD}
\le1+d_{CD}+
\frac{\log r(q)+d_{AB}\log(N(q)/M(q))}{\log q}.
```

Since $`0\le d_{AB}\le1`$, both error terms tend to zero.
Thus this relaxed construction also proves (1). In particular, a
bounded source-only unit and a flag loss with $`M(q)/N(q)\to1`$
would suffice. More generally, a fixed ratio such as
$`N(q)/M(q)=2`$ is allowed, since
$`\log 2/\log q\to0`$. Near-full retention is not required.
This is an implication for a family of valid local
maps; no such family is supplied here.

The exact-map obstructions in
[FLAG_EXCHANGE_OBSTRUCTIONS.md](FLAG_EXCHANGE_OBSTRUCTIONS.md),
the failed Fourier repair in
[FOURIER_TRADE_OBSTRUCTIONS.md](FOURIER_TRADE_OBSTRUCTIONS.md),
and the full off-support Weyl residual in
[OPERATOR_TRADE_OBSTRUCTIONS.md](OPERATOR_TRADE_OBSTRUCTIONS.md)
exclude specified construction classes. None excludes this general
finite-family criterion.
