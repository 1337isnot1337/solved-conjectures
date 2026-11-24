# Exact search for an arbitrary large-rank C compression

Research status: this is an exact finite linear-algebra criterion. It
does not supply a family meeting the asymptotic rank threshold.

Use the tensor conventions of
[TAGGED_GEODESIC_SUBSPACE_COVER.md](TAGGED_GEODESIC_SUBSPACE_COVER.md).
For positive integers p, Q, N, M, r, the tagged source and target are

```math
Z_{Q,N}=U_{ABCD}(Q)W_{CD}(Q)W_{AD}(N)W_{BD}(N),
\qquad
T_{p,M}=U_{ACD}(p)U_{BCD}(p)W_{AB}(M).
```

The notation U denotes a unit tensor on the displayed parties; W
denotes a matrix wire. There are r source families, supplied by
U_ABCD(r). The fixed local maps give image spaces with
dim U_zh, dim V_zh at most N and dim W_zh at most Q. These bounds
are part of the hypothesis, not a conclusion from an approximate span.

Fix the local `A` and `B` output spaces of the geodesic target, each
of dimension `pM`. Allow a chosen `C` output space `C''` of any finite
dimension. Fix an actual overlapping product-space sum

```math
V=\sum_{z=1}^r\sum_{h=1}^Q
  U_{zh}\otimes V_{zh}\otimes W_{zh}
  \subseteq A'\otimes B'\otimes C'',
```

with the dimension bounds of the tagged-source cover criterion. Put

```math
b_{ij}=\sum_{w=1}^M A_{iw}\otimes B_{jw},
\qquad
H_{ij}=\{v\in C'':b_{ij}\otimes v\in V\}.                  \tag{1}
```

Each `H_ij` is a linear subspace.

## 1. Compression and column membership are equivalent

Let `C_0=C^{p^2}` have its target basis `e_ij`, and let
`L:C_0->C''` be any linear map. Write `T_L` for the tensor obtained
from `T_(p,M)` by applying `L` at `C`. Explicitly,

```math
T_L=\sum_{i,j} b_{ij}\otimes (L e_{ij})\otimes D_{ij}.
```

The fixed `A,B,C` maps whose image spaces define `V` can produce
`T_L` by a choice of the map at the tagged party `D` if and only if

```math
L e_{ij}\in H_{ij}\qquad\hbox{for every }i,j.               \tag{2}
```

**Proof.** The `D_ij` slice of the output must lie in `V`. Its desired
value is exactly `b_ij tensor L e_ij`, so this is necessary. Conversely,
membership in `V` provides a linear combination of source `ABC`
slices for every `i,j`. The tagged `D` source coordinates are
independent, and a linear map at `D` can use any of these combinations
independently for its different output coordinates. Choosing those
coefficients produces the displayed `T_L` exactly. QED.

Thus the columns of `L` may be selected independently from the
subspaces `H_ij`. One need not fix a Cartan channel or any other
particular projection in advance. Idempotence of `L` is not required
by the single-party rank-fraction lemma.

If `R` is an exact annihilator of `V`, the subspaces in (1) are
computed by

```math
H_{ij}=\ker\big(R(b_{ij}\otimes -)\big).                   \tag{3}
```

This uses the complete output tensor space and therefore checks
absence of every unwanted coefficient, not just the desired terms.

## 2. The maximum achievable rank has a subspace Hall formula

Index the `m=p^2` column subspaces by `a` in a set `E` of size `m`.
For `J` a subset of `E`, let

```math
H_J=\sum_{a\in J}H_a,\qquad H_\varnothing=0.
```

Then the maximum possible rank of a matrix with column `a` in `H_a`
is

```math
\nu(V)=\min_{J\subseteq E}
              \big(m-|J|+\dim H_J\big).                    \tag{4}
```

Here is a self-contained proof of the linear-transversal fact used
in (4).

**Lemma.** Subspaces `K_1,...,K_t` admit linearly independent
representatives `v_i in K_i` if and only if

```math
\dim\sum_{i\in I}K_i\ge|I|
       \qquad\hbox{for every }I\subseteq[t].               \tag{5}
```

The forward implication follows by considering the chosen independent
vectors indexed by `I`. For the converse, use induction on `t`; the
case `t=1` is immediate. If a nonempty proper set `I` is tight in
(5), let `W=sum_(i in I) K_i`, so `dim W=|I|`. By induction, choose
independent representatives for the subspaces indexed by `I`.
For any subset `J` of the remaining indices,

```math
\dim\big((W+\sum_{j\in J}K_j)/W\big)
 \ge |I|+|J|-|I|=|J|.
```

Induction in the quotient supplies independent representatives for
the remaining indices modulo `W`; lift them and combine the two
collections.

If there is no nonempty proper tight set, all such inequalities have
integer slack at least one. Choose a nonzero vector `v_t in K_t`.
For any subset of the first `t-1` indices, passing to the quotient
by the one-dimensional span of `v_t` loses at most one dimension, so (5) still holds there.
Induction in that quotient and then adjoining `v_t` finishes the
proof. QED.

To prove (4), any allowed column choice has rank at most
`m-|J|+dim H_J`, because the columns indexed by `J` span at most
`dim H_J` and the others add at most one dimension each. Let the
right side of (4) be `nu`, and introduce an auxiliary vector space
`Z` of dimension `m-nu`. Replace each `H_a` by `H_a directsum Z`.
For every nonempty `J`, the definition of `nu` gives

```math
\dim(H_J\oplus Z)=\dim H_J+m-\nu\ge|J|.
```

The lemma therefore supplies `m` independent vectors `h_a+z_a`,
with `h_a in H_a` and `z_a in Z`. Their images under projection
onto `C''` span dimension at least `m-dim Z=nu`. The columns `h_a`
attain this rank, proving (4).

## 3. A necessary aggregate-dimension bound

The simultaneous freedom at `D` also imposes a useful restriction on
the subspaces in (1). They must satisfy

```math
M\sum_i\dim\Big(\sum_jH_{ij}\Big)\le rQ^2N,
\qquad
M\sum_j\dim\Big(\sum_iH_{ij}\Big)\le rQ^2N.               \tag{6}
```

To prove this, choose a basis `v_(ij,nu)` of every `H_ij` and assign
a separate output coordinate `D_(ij,nu)` to every basis vector. The
same tagged source and the same three fixed local maps produce the
tensor

```math
\mathcal U=\sum_{i,j,\nu}b_{ij}\otimes v_{ij,\nu}
                                  \otimes D_{ij,\nu},
```

because all these `D` slices are independently selectable. Flatten
this tensor across `AC | BD`. For fixed `i,w`, its column space in
the `AC` factor is `A_(i,w) tensor sum_j H_ij`. Different `i,w`
have disjoint A coordinates, so the flattening rank is exactly the
first left side of (6). The same flattening of
`U_ABCD(r) Z_(Q,N)` has rank `rQ^2N`: the full units of sizes `r`
and `Q`, the `CD` wire of size `Q`, and the `AD` wire of size `N`
cross the cut, whereas the `BD` wire lies within one side.
Restriction monotonicity of matrix rank proves the first inequality.
The cut `BC | AD` proves the second.

At admissible asymptotic costs, these aggregate dimensions are at
most `p^{2+o(1)}`. Thus a successful high-rank compression must use
appropriately arranged column subspaces; it cannot require
`p^{2-o(1)}`-dimensional spaces on `p^{2-o(1)}` separate pairs. That
would force at least `p^{1-o(1)}` active rows, each with a row sum
of dimension at least `p^{2-o(1)}`, contradicting (6). The Hall rank
criterion (4) remains valid. Many distinct one-dimensional column
spaces, for example, can have large collective rank without violating
these aggregate bounds.

## 4. Exact certificates and the limiting threshold

Choose an exact basis for each `H_a`, introduce independent scalar
coefficients for each column's basis expansion, and form `L`.
Its maximum rank is `nu(V)`: at least one `nu` by `nu` minor is a
nonzero polynomial in these coefficients. All parameter choices
outside that polynomial's zero set attain at least that rank.
A concrete nonzero minor together with the exact membership checks
(2) certifies any proposed lower bound on the attainable rank.

This is an exact statement over `C` or over an exact subfield carrying
the displayed bases. A floating-point singular value is not a
substitute for the minor or the full membership identities.

By the [single-party rank-fraction theorem](SINGLE_PARTY_PROJECTION_TRADE.md), a rank-`nu` choice gives

```math
F(T_L)\ge {\nu\over p^2}F(T_{p,M})
```

for every normalized spectral point `F`. For a normalized four-party spectral point, write d_XY for the wire
exponent and u_XYZ for the three-party-unit exponent. On the geodesic
face d_AD+d_BD=d_AB, the source value is r Q^(1+d_CD) N^d_AB.
The [geodesic-source calculation](GEODESIC_UNIT_TRADE.md) consequently becomes

```math
p^{u_{ACD}+u_{BCD}}
 \le {r p^2\over\nu(V)}
      Q^{1+d_{CD}}(N/M)^{d_{AB}}.                          \tag{7}
```

Therefore a sequence with

```math
Q/p=p^{o(1)},\quad r=p^{o(1)},\quad N/M=p^{o(1)},\quad
\nu(V)/p^2=p^{-o(1)}
```

would suffice for the geodesic inequality. Such a sequence has not
been constructed. The point of the criterion is that a successful
large-rank compression may be discovered by linear algebra, instead
of being specified as an extra nonlinear ansatz.
