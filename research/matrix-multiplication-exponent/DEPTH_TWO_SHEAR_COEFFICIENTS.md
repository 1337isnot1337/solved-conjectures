# Complete coefficients for a three-layer differential shear

Research status: the expansion is exact. With the displayed quadratic
middle polynomials, this orientation cannot produce a nonzero central
copied-label target before additional output channel projections. Its
coherent Euler terms suggest an operator-valued channel target, but
the C-plane constraints for such a target remain unresolved.

## 1. Spaces, operators, and permitted middle coefficients

Take disjoint source vertex sets P,H,Q. Retain outer A outputs in P
and outer B outputs in Q. Use independent Weyl variables x_(a,h)
and y_(h,b), for a in P,h in H,b in Q, with the corresponding
derivatives p_(a,h) and d_(h,b). All x modes commute with all y modes.

For each family z fix complex scalars alpha_(a,h)^z,beta_(h,b)^z and
put

```math
(N_z)_{ah}=\alpha_{ah}^z p_{ah},\qquad
(N_z)_{hb}=\beta_{hb}^z d_{hb},
```

with every other entry zero. Thus N_z^3=0. Use the outside matrices

```math
A_z=I+N_z+\tfrac12N_z^2,\qquad
B_z=I-N_z+\tfrac12N_z^2.                               \tag{1}
```

These are inverses. As throughout the operator construction, B_z is
the displayed right operator; the physical B local map is its full
flag transpose. Both matrices and every middle polynomial below are
ordinary finite-degree Weyl operators, so finite polynomial flags
with an adequate degree margin realize any exact operator identity.

Let W be the output C space. For each source vertex v and family z
fix a C plane U_v^z of dimension at most the source CD-wire dimension.
For each target D label (i,j) in P times Q, choose independent vectors

```math
v_{v,t}^{z,ij}\in U_v^z\quad(t\in H),
```

and define the W-valued diagonal middle entries

```math
f_v^{z,ij}=\sum_{t\in H}x_{it}y_{tj}v_{v,t}^{z,ij}.      \tag{2}
```

These are legal middle maps: the source vertex v and output i,j are
known at tagged D. The output C vector must stay in the fixed plane
U_v^z. In particular it is not legitimate to set every f_v equal to
an arbitrary copied C_(ij) polynomial unless those vectors belong to
all of the required planes.

## 2. The complete P-to-Q coefficient

Put kappa_(a,h,b)^z=alpha_(a,h)^z beta_(h,b)^z. The coefficient at
outer a in P,b in Q and target D_(ij) is

```math
\sum_{z,h}\kappa_{ahb}^z
 \left(\tfrac12 f_a^{z,ij}p_{ah}d_{hb}
       -p_{ah}f_h^{z,ij}d_{hb}
       +\tfrac12 p_{ah}d_{hb}f_b^{z,ij}\right).          \tag{3}
```

Indeed the three terms arise respectively from the source vertex
a, an intermediate vertex h, and the source vertex b in
A_z diag(f_v) B_z. No other source vertex contributes to this block.

Normal ordering (3), with coordinates before derivatives, gives
the sum of the following four expressions:

```math
\begin{aligned}
\mathcal O^{(2)}_{ab,ij}
={}&\sum_{z,h,t}\kappa_{ahb}^z x_{it}y_{tj}p_{ah}d_{hb}
 \left(\tfrac12v_{a,t}^{z,ij}-v_{h,t}^{z,ij}
                              +\tfrac12v_{b,t}^{z,ij}\right),
\end{aligned} \tag{4}
```

```math
\begin{aligned}
\mathcal O^{(x)}_{ab,ij}
={}&\tfrac12\delta_{bj}\sum_{z,h}\kappa_{ahj}^z
                         x_{ih}p_{ah}v_{j,h}^{z,ij},
\end{aligned} \tag{5}
```

```math
\begin{aligned}
\mathcal O^{(y)}_{ab,ij}
={}&\delta_{ai}\sum_{z,h}\kappa_{ihb}^z y_{hj}d_{hb}
                  \left(\tfrac12v_{b,h}^{z,ij}
                                      -v_{h,h}^{z,ij}\right),
\end{aligned} \tag{6}
```

```math
\begin{aligned}
\mathcal O^{(0)}_{ab,ij}
={}&\tfrac12\delta_{ai}\delta_{bj}
                    \sum_{z,h}\kappa_{ihj}^zv_{j,h}^{z,ij}.
\end{aligned} \tag{7}
```

For example p_(ah)d_(hb)(x_(it)y_(tj)) produces the two first-order
terms only when h=t, and produces the constant term only when also
a=i,b=j. The middle term of (3) contributes the negative part of
(6), but no x-first-order term because d_(hb) is already to the
right of the middle polynomial. This accounts for every derivative
and every target C coefficient.

All pairs (i,j) can choose their vectors separately. Formulae (4)--(7)
do not assume a common motion across different output D labels.

## 3. Why this orientation has no nonzero central target

Suppose (4)--(7) is required to equal
delta_ai delta_bj L_(ij) times the identity in the Weyl algebra.
At the matched outer pair a=i,b=j, the coefficient of the distinct
normal monomial x_(ih)p_(ih) is

```math
\tfrac12\sum_z\kappa_{ihj}^zv_{j,h}^{z,ij}.             \tag{8}
```

It must vanish for every h. Neither (4) nor (6) has this normal
monomial: (4) has two coordinate factors and two derivatives, and
(6) uses independent y modes. Summing (8) over h therefore kills
exactly the constant coefficient (7). Thus every L_(ij) is zero.

This conclusion allows arbitrary fixed C planes, arbitrarily many
families, and all coefficients in (2). It concerns only a central
operator target with these particular middle polynomials and this
outside orientation. It is not an obstruction to output channel
projections or a different ordering of the local operators.

## 4. The coherent operator that survives

For a diagnostic only, take one family, all alpha and beta equal to
one, and formally use a common C vector w in every v_(v,t). The
quadratic residual (4) vanishes. Writing m=|H|, the remaining
coefficient is

```math
\tfrac12\left[
 \delta_{bj}\sum_hx_{ih}p_{ah}
 -\delta_{ai}\sum_hy_{hj}d_{hb}
 +m\delta_{ai}\delta_{bj}I\right]w.                    \tag{9}
```

This is a difference of two coherent rectangular oscillator actions
plus a scalar. If a legal C-labelled construction produced (9)
columnwise with high-rank columns w_(ij), one could investigate a
large eigenspace at A and an invertible remaining factor at B.
That is a different target from the central identity excluded in
Section 3. The formal common-vector choice does not give such a
construction: arbitrary w_(ij) would have to lie simultaneously in
every involved C plane, which has inadequate dimension.

The right Y matrix in (9) has entries

```math
(K_Y)_{jb}=\sum_h y_{hj}d_{hb}.                        \tag{10}
```

It is the product of a |Q| by |H| multiplication matrix and a
|H| by |Q| derivative matrix. Its rank over the Weyl division ring
is therefore at most |H|. In particular it is not invertible when
|H|<|Q|. The auxiliary-transposed expression with derivatives on
the left is a different matrix; the full physical B transpose does
not replace (10) by that expression or increase its rank.

There is also an exact failure of the tempting complementary A
channel. The X matrix in (9) obeys

```math
(K_X)_{ai}=\sum_hx_{ih}p_{ah}
         =\sum_hp_{ah}x_{ih}-|H|\delta_{ai}I.
```

If an A quotient kills every derivative column (p_(ah))_(a in P),
then it sends K_X to -|H| times the induced identity. This cancels
the +|H| term in (9), leaving only the small-rank right factor (10).
It does not give an invertible B correction. A nonzero A channel
would require a separate calculation and does not solve the fixed
C-plane compatibility by itself.

The new internal label t in (2) makes the putative scalar dual motion
space at each endpoint have up to r|H| coordinates, not r. Therefore
the earlier q^(3/2) sampling argument cannot simply be quoted with
the old value of r. The direct coefficient obstruction in Section 3
is the reason this particular central-target ansatz fails.

The weighted expansion was derived by the constructive worker. The
coherent formula (9) was independently derived by the operator worker.
