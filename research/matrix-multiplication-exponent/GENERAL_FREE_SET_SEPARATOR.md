# Separation with any set of at least two free parties

Research note, 23 November 2026 (America/Chicago). The construction below
is a finite Laurent degeneration over the complex numbers. Its spectral
consequences extend the two-free-party construction in
`MULTIPLE_PARTY_SEPARATOR.md`. The final consequences are asymptotic;
no finite zero-overhead uncrossing map is claimed.

The prior two-free-party result is Huanyi Zhou, *Asymptotic Rank of
Weighted Graph Tensors via Completely Positive Bounds*,
[arXiv:2610.34273v3](https://arxiv.org/html/2610.34273v3), Theorem 3.4
and Corollary 3.5. The proof below independently extends the free set
and gives its complete finite catalyst and local weights. No claim of
priority or originality is made. The exact model and spectral duality
convention are fixed in [SPECTRAL_MODEL.md](SPECTRAL_MODEL.md).

## 1. Model and catalyst

Partition a fixed party set into $`s`$ shared parties
$`A_1,\ldots,A_s`$ and $`k\ge2`$ free parties
$`B_1,\ldots,B_k`$. Let $`m,t\ge1`$. For $`0\le h<m`$, let

```math
T_h\in\left(\bigotimes_{j=1}^s V_{A_j}\right)
       \otimes\left(\bigotimes_{\ell=1}^k V_{B_\ell,h}\right),
```

where the spaces indexed by distinct $`h`$ are independent direct-sum
blocks at each free party. Write $`T=\sum_h T_h`$, and let
$`\bigoplus_hT_h`$ denote their full direct sum, including fresh copies
of the shared-party spaces. Put $`B=\{B_1,\ldots,B_k\}`$ and let
$`U_B(t)`$ be the diagonal tensor of size $`t`$ on the free parties,
padded by scalar factors elsewhere.

Use catalyst indices

```math
0\le a_j<m,\quad 0\le u<t,\quad 0\le w_\ell<t\ (3\le\ell\le k),
\quad 0\le v\le s(m-1)+t-1.
```

The index $`a_j`$ belongs to $`A_j`$, $`u`$ belongs to $`B_1`$,
$`v`$ to $`B_2`$, and $`w_\ell`$ to $`B_\ell`$. Let $`Q`$ be the
coefficient-one tensor on the solutions of

```math
v+\sum_{\ell=3}^k w_\ell
  =\sum_{j=1}^s a_j+(k-1)u.                         \tag{1}
```

Define

```math
R=s(m-1)+(k-1)(t-1),\qquad M=R+1.
```

Both sides of (1) lie between zero and $`R`$. Thus equality modulo
$`M`$ is exactly equality as integers. If $`\zeta`$ is a primitive
$`M`$th complex root of unity, the identity

```math
\mathbf1_{x=y}=\frac1M\sum_{b=0}^{M-1}\zeta^{b(x-y)}
\qquad(0\le x,y\le R)
```

expresses $`Q`$ as a sum of $`M`$ rank-one tensors: each character
factors separately over all the displayed indices. Hence

```math
R(Q)\le 1+s(m-1)+(k-1)(t-1).                       \tag{2}
```

The case $`M=1`$ uses the single scalar character. This rank bound is
for the tensor with independent indices $`u,v,w_3,\ldots,w_k`$; no
input is copied into several catalyst parties.

## 2. The finite separation map

There is a Laurent degeneration

```math
T\otimes Q\ \unrhd\
\left(\bigoplus_{h=0}^{m-1}T_h\right)\otimes U_B(t). \tag{3}
```

Here is one explicit diagonal weighting. The free parties already know
$`h`$ from their original direct-sum block label. The shared parties do
not know $`h`$.

For the first stage, use local weights $`a_j^2`$ at $`A_j`$,
$`2(k-1)hu+sh^2`$ at $`B_1`$, $`-2hv`$ at $`B_2`$, and
$`-2hw_\ell`$ at each remaining free party. On the support of $`Q`$
the total is

```math
E_1=\sum_j a_j^2+2(k-1)hu-2hv-2h\sum_{\ell=3}^k w_\ell+sh^2
   =\sum_j(a_j-h)^2.                              \tag{4}
```

It is nonnegative and vanishes exactly when every shared-party index
$`a_j`$ equals the block label $`h`$.

For the second stage, give $`B_1`$ weight $`-(k-1)u^2`$, give
$`B_2`$ weight $`(v-sh)^2`$, and give $`B_\ell`$ weight
$`w_\ell^2`$ for $`\ell\ge3`$. All these weights are local because
$`h`$ is known at every free party. On $`E_1=0`$, put
$`x_2=v-sh`$ and $`x_\ell=w_\ell`$ for $`\ell\ge3`$.
Equation (1) says $`\sum_{\ell=2}^k x_\ell=(k-1)u`$, so the
second total weight is

```math
E_2=\sum_{\ell=2}^k x_\ell^2-(k-1)u^2
   =\sum_{\ell=2}^k(x_\ell-u)^2.                   \tag{5}
```

It is nonnegative on that first zero set, with equality exactly when
$`v=sh+u`$ and $`w_\ell=u`$ for every $`\ell\ge3`$.
Every $`u\in[0,t-1]`$ is permitted by the stated range for $`v`$.

To combine the stages, take

```math
L=(k-1)(t-1)^2+1.
```

Everywhere on the support, $`E_2\ge-(k-1)(t-1)^2`$. If $`E_1>0`$,
its integral value is at least one, so $`LE_1+E_2>0`$. On $`E_1=0`$,
(5) applies. The combined total weight is therefore nonnegative
everywhere and vanishes exactly at the simultaneous zero set. This is a sum of local
integer weights, so diagonal Laurent substitutions realize the
required degeneration. Negative local weights are permitted; a common
shift and compensating overall power give the usual polynomial form.

At the surviving coefficients, every shared party now carries the tag
$`a_j=h`$. Thus the $`T_h`$ occupy independent blocks at every party.
The free catalyst indices all carry the same independent value $`u`$,
with $`B_2`$ relabeling $`(h,v)`$ as $`(h,v-sh)`$. These indices form
$`U_B(t)`$, proving (3).

## 3. Powered partial-sum superadditivity

Let $`F`$ be any normalized spectral point on the full party set and
write

```math
F(U_B(r))=r^p,\qquad 0\le p\le1.
```

If $`p>0`$, then every partial direct sum above satisfies

```math
F\left(\sum_hT_h\right)^{1/p}
\ge\sum_hF(T_h)^{1/p}.                            \tag{6}
```

For $`p=0`$, the statement used is only
$`F(\sum_hT_h)\ge\max_hF(T_h)`$.

First consider $`r`$ summands of a common value $`a`$ and take
$`m=t=r`$ in (3). Put $`d=s+k`$. By (2), its catalyst has rank at
most $`1+(d-1)(r-1)\le(d-1)r`$. Full additivity and normalization
therefore give

```math
r^{1+p}a\le F(T)F(Q)\le(d-1)rF(T),
\qquad F(T)\ge\frac{r^p a}{d-1}.                  \tag{7}
```

For arbitrary summands, expand $`T^{\otimes n}`$ into words in the
block labels. At the free parties retain one type with multiplicities
$`k_h`$. Its $`N_k=n!/\prod_hk_h!`$ blocks are isomorphic to
$`\bigotimes_hT_h^{\otimes k_h}`$ and have common spectral value
$`\prod_hF(T_h)^{k_h}`$. The shared-party factors may be permuted
separately in the individual blocks when evaluating their values;
there is no assertion of simultaneous basis changes before separation.
Apply (7), raise to $`1/p`$, and sum over the at most
$`(n+1)^m`$ types. The multinomial identity yields

```math
(d-1)^{1/p}(n+1)^m F(T)^{n/p}
\ge\left(\sum_hF(T_h)^{1/p}\right)^n.
```

Taking $`n`$th roots and passing to the limit proves (6).

In particular, when the free-party unit has charge one, the partial sum
is exactly additive under $`F`$: (6) supplies the lower bound and the
cover inequality supplies the upper bound. For a normalized extension
preserving an old full party set $`B`$, this applies when only the
new auxiliary parties are shared.

## 4. Intersecting subset-unit uncrossing

Let $`S,T`$ be subsets of a party set with nonempty intersection.
Then

```math
U_S(q)U_T(q)\gtrsim U_{S\cup T}(q)U_{S\cap T}(q).  \tag{8}
```

This includes every integer $`q\ge1`$. When the intersection has one
party, its unit is a nonzero one-party vector and hence equivalent to a
scalar. Identifying the two indices at that common party gives the
union unit by an exact restriction. Nested or equal subsets also give
the claimed comparison directly.

For intersection size at least two, work first on the union of the
party sets. Expand the left-hand tensor over labels $`i,j\in\mathbb
Z/q\mathbb Z`$, and partition its coefficients by $`h=i+j`$.
Every intersection party carries the pair $`(i,j)`$, so its block
spaces for different $`h`$ are disjoint. The remaining parties carry
one of $`i,j`$ and are shared. Within a fixed block, $`j=h-i`$,
and every local list of $`q`$ basis vectors is independent. Thus each
block is isomorphic to the union unit of size $`q`$.

Equation (6), or its zero-exponent case, now gives for every normalized
point on the union

```math
F(U_S(q)U_T(q))\ge q^{1+u(S\cap T)}
 =F(U_{S\cup T}(q)U_{S\cap T}(q)).
```

Asymptotic spectral duality, in the convention fixed in
`SPECTRAL_MODEL.md`, gives (8). Padding by scalar factors preserves the
resulting local maps. Equivalently, every normalized point on any
larger party set satisfies

```math
u(S)+u(T)\ge u(S\cup T)+u(S\cap T).               \tag{9}
```

The nonempty-intersection hypothesis cannot be dropped. For disjoint
$`S,T`$, a flattening point separating the two sets assigns charge zero
to both source units and charge one to the union unit.

For the earlier four-party test, (8) proves
$`U_{ABC}(q)U_{ABD}(q)\gtrsim U_{ABCD}(q)W_{AB}(q)`$.
Consequently its source-only full-unit overhead exponent is zero.
The finite and common-unit determinant obstructions do not contradict
this conclusion: the asymptotic comparison permits a subexponential
unit only on the source.

### 4.1 Explicit source-only overhead for every intersecting pair

The finite map also supplies a quantitative proof of (8) without
spectral duality. Fix the party sets and put
$`s=|S\mathbin{\triangle}T|`$, $`k=|S\cap T|\ge2`$, and
$`d=s+k`$. Write $`X_m=U_S(m)U_T(m)`$ and
$`Y_m=U_{S\cup T}(m)U_{S\cap T}(m)`$. In the Latin partition above,
the shared parties are the symmetric difference and the free parties
are the intersection. Take $`t=m`$, put $`\ell_0=m-1`$, and use
$`L=(k-1)\ell_0^2+1`$ in the finite separator.

Make every local parameter exponent nonnegative by adding
$`(k-1)\ell_0^2`$ at $`B_1`$,
$`2L(s+1)\ell_0^2`$ at $`B_2`$, and
$`2L\ell_0^2`$ at each remaining free party. The total common shift is

```math
\delta=[2L(d-1)+(k-1)]\ell_0^2.
```

These shifts suffice since $`v\le(s+1)\ell_0`$ and all of
$`h,u,w_j`$ lie in $`[0,\ell_0]`$. On the catalyst support,
$`E_1\le s\ell_0^2`$ and
$`E_2\le[(s+1)^2+k-2]\ell_0^2`$. The resulting polynomial output
has degree at most

```math
D_m=[L(s+2d-2)+(s+1)^2+2k-3]\ell_0^2=O_d(m^4).
```

Its coefficient of degree $`\delta`$ is
$`U_{S\cup T}(m)Y_m`$: the full sum of the $`m`$ Latin blocks is
$`U_{S\cup T}(m^2)`$. The catalyst rank is at most $`(d-1)m`$.
Consequently

```math
U_{S\cup T}((d-1)m)X_m\ \unrhd\ U_{S\cup T}(m)Y_m
```

with the stated finite degree bound.

Here are the exact amplification parameters. Put $`m=q^b`$, tensor
$`a`$ copies of this polynomial construction, and interpolate its
coefficient at $`aD_m+1`$ distinct values. With
$`J=aD_m+1`$ and $`C=U_{S\cup T}(m^a)`$, this gives an exact map

```math
C\,U_{S\cup T}(J(d-1)^a)X_m^{\otimes a}
\ \ge\ C Y_m^{\otimes a}.
```

Reuse this exact catalyst for $`c`$ blocks, then contract the final
$`C`$. The source unit size is
$`m^a[J(d-1)^a]^c`$ for $`bac`$ copies of $`X_q`$. Choosing
$`b=a=c=z`$ gives logarithmic overhead $`O_{q,d}(z^2)`$ for
$`N=z^3`$ copies, since $`\log_q J=O_{q,d}(z+\log z)`$.
For arbitrary $`N`$, use $`z=\lfloor N^{1/3}\rfloor`$ and supply
the remaining $`O(N^{2/3})`$ factors with the elementary restriction
$`U_{S\cup T}(q)X_q\ge Y_q`$. This last restriction follows by
identifying the two source indices at a common party to extract
$`U_{S\cup T}(q)`$, then using the rank-$`q^2`$ expansion of
$`Y_q`$. Thus, for every fixed intersecting pair and fixed $`q`$,

```math
U_{S\cup T}(r_N)X_q^{\otimes N}\ge Y_q^{\otimes N},
\qquad \log_q r_N=O_{q,d}(N^{2/3}).
```

Interpolation precedes catalyst reuse, so no error terms are iterated.
For intersection size one the earlier exact restriction already has
zero overhead. Padding these maps by scalar factors handles any larger
ambient party set.

## 5. Nonzero coefficient weights on arbitrary hypergraph support

Let $`\mathcal H`$ be a finite hypergraph with nonempty edges, one
tensor party per vertex, and an index range $`[q_e]`$ on each edge.
Let $`T_{\mathcal H}(c)`$ have coefficient $`c_a\ne0`$ on every
assignment $`a=(a_e)`$ to the edges, with each vertex carrying the
tuple of all incident indices. Then

```math
T_{\mathcal H}(c)\gtrsim T_{\mathcal H}(1).        \tag{10}
```

Fix a normalized point $`F`$ and induct on the number of edges. For
an edge $`e`$ with at least two endpoints, fixing $`a_e`$ expresses
the tensor as a partial direct sum whose free parties are precisely
those endpoints. Each block remains fully supported and nonzero-
weighted on $`\mathcal H-e`$. By induction its value is at least
$`C=\prod_{f\ne e}q_f^{u(f)}`$. If $`u(e)>0`$, (6) gives

```math
F(T_{\mathcal H}(c))^{1/u(e)}
\ge q_e C^{1/u(e)},
```

hence $`F(T_{\mathcal H}(c))\ge q_e^{u(e)}C`$.
If $`u(e)=0`$, retaining one block gives the same inequality. A
one-endpoint edge also has unit charge zero; projecting its index to
one fixed basis coordinate removes it without losing nonvanishing of
the remaining coefficients. The edge-free tensor is nonzero rank one.
Thus the claimed value inequality holds for every normalized spectral
point, and spectral duality proves (10).

Empty hyperedges are excluded: their indices have no local record, so
arbitrary nonzero coefficients could cancel when those invisible indices
are summed. The result gives one direction, not an equality of spectral
values for all coefficient choices and not a finite untwisting map.

## 6. Exact relation to the operational barriers

Amanov, van den Berg, and Zuiddam,
[arXiv:2610.30054v1](https://arxiv.org/html/2610.30054v1),
Definition 5.2 fixes three tensor legs. Its partial-sum constructors
share one leg and have two free legs. Definition 5.3(D2) permits their
separation, and the leg permutations in that definition only permute
those existing three legs. Theorem 5.4 proves the barrier for this
specified preorder.

Zhou's earlier version,
[arXiv:2610.34273v1](https://arxiv.org/html/2610.34273v1),
Definition 5.2 allows a fixed larger party set, but its partial sums
still have a free pair. Definition 5.5(v) already includes the
two-free-party separator. Theorem 5.11 applies to that formal system.
Thus merely using the two-free-party separator in the four-party
uncrossing proof is not a new separator ingredient beyond that system.

When the free set has at least three parties and there is a shared
party, the finite map in Section 2 supplies a constructor and a
separation operation beyond those explicitly listed free-pair rules.
This is a precise difference between the displayed operation sets. It
does not prove semantic non-derivability after translating the new
tensors into another set of expressions, nor does it prove that the
enlarged system defeats the numerical $`9/4`$ certificate. The
[tripod scalar model](TRIPOD_COUNTERMODEL.md) already satisfies every
intersecting-unit consequence in Section 4. The further deduction
needed to force the triangle perimeter to two remains unproved.
