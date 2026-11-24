# A rank-fraction bound for one local projection of the trade target

Research status: the bound and finite covers below are proved. They
permit a larger class of construction targets. No source map to a
sufficient projected target is established here.

## 1. Statement

Let

```math
T=T_{p,M}=\sum_{i,j=1}^p\sum_{w=1}^M
 A_{iw}B_{jw}C_{ij}D_{ij}
 =U_{ACD}(p)U_{BCD}(p)W_{AB}(M).
```

Choose one party X, of local dimension d. Thus d=pM for A or B,
and d=p^2 for C or D. Let L be any rank-k linear map on that party,
where 1<=k<=d, and put T_L=(L_X tensor id)T. For every normalized
spectral point phi,

```math
\phi(T_L)\ge \frac{k}{d}\,\phi(T).                 \tag{1}
```

More explicitly, there are exact restrictions

```math
U_{ABCD}(r_n)\,T_L^{\otimes n}\ge T^{\otimes n},
\qquad
r_n\le\left\lceil(d/k)^n(n\log d+1)\right\rceil.
                                                        \tag{2}
```

Logarithms in the finite covering bounds are natural logarithms.
No positivity of tensor coefficients is assumed. Orthogonal projections
will be used as an auxiliary finite-dimensional linear-algebra device.

## 2. A finite stabilizer with a scalar projector average

For X=A, independently permute the index i and the flag w, and
multiply A_(i,w) by independent signs alpha_i beta_w. Extend this
action to a local stabilizer of T as follows: apply the same i
permutation at C,D, the same w permutation at B, compensate alpha_i
at D, and compensate beta_w at B. These operations fix T exactly.
All signs are plus or minus one, so the action on A is unitary.

For X=C, use independent signed permutations on i and j. Extend the
permutations to A,D and B,D respectively, and compensate the signs
at D. This again fixes T. The constructions for B and D are obtained
by relabelling the parties or compensating at C.

Let G be the resulting finite group on X. For any rank-k orthogonal
projector P on its d-dimensional space,

```math
\frac1{|G|}\sum_{g\in G}gPg^*=\frac{k}{d}I_d.      \tag{3}
```

This does not require an imported representation theorem. Averaging
over the independent signs removes every off-diagonal matrix entry:
two different coordinate pairs differ in at least one sign character.
Averaging the remaining diagonal over the two independent permutation
groups makes it constant. Its trace is k, proving (3).

## 3. Greedy row-space covering

Let U=im P, and suppose W is the span of some chosen translates gU.
Write c=d-dim W. Equation (3) gives

```math
\mathop{\mathrm{average}}_{g\in G}
 \mathop{\mathrm{tr}}(P_{W^\perp}gPg^*)=\frac{kc}{d}.
```

For at least one g the trace is at least kc/d. This trace is at most
the rank of P_(W^perp) restricted to gU, since the relevant positive
contraction has all eigenvalues at most one. That rank is exactly
dim(W+gU)-dim W. Hence one more translate can reduce c to at most
(1-k/d)c. Starting with W=0, after r choices the remaining codimension
is at most d exp(-rk/d). Therefore

```math
r\le\left\lceil\frac d k(\log d+1)\right\rceil
```

translates suffice to span the entire space. If k=d, one translate
already suffices; the displayed bound is merely a uniform bound.

For the chosen translates put P_z=g_z P g_z^*. Their sum S is
positive definite because their images span the full space. In
particular

```math
\sum_z S^{-1}P_z=I_d.                              \tag{4}
```

By the local stabilizer property, a copy of P_X T restricts by local
isomorphisms to (P_z)_X T. Add these full direct-sum copies and apply
S^(-1) at X. Equation (4) gives exactly T. Thus the row-space cover
is a legal tensor restriction; the reconstruction map acts only at
X, not jointly at several parties.

An arbitrary rank-k L is mutually restriction-equivalent to its
row-space orthogonal projector P. Indeed ker L=ker P and L is an
isomorphism from im P onto im L, so suitable maps on its output
give L=R P and P=R' L. This reduces the statement to P.

## 4. Tensor powers remove the logarithmic factor

At the n-th tensor power, the projector is the tensor product of n copies of P, with rank k^n on dimension
d^n. The n-fold product group has average (k/d)^n I by (3).
Applying the same greedy construction proves (2). Normalization,
full direct-sum additivity, multiplicativity and restriction
monotonicity give

```math
\phi(T)^n\le r_n\phi(T_L)^n.
```

Taking n-th roots and using lim r_n^(1/n)=d/k proves (1). This
argument has no size assumption on M relative to p.

Consequently a legal source map to one local compression T_L with
k/d=p^(-o(1)) supplies the full target's leading spectral lower
bound. The tensor-power cover makes the conclusion operational as
well: choose n after the finite p,M and L have been fixed.

## 5. Application to a proposed fused channel, and its limit

If a family of orthogonal projections at one party has at most m
channels summing to identity, at least one has rank at least d/m.
A source map to T compressed by that one channel would lose at
most the factor m in (1). Thus a polynomial number of fused exterior
channels may be handled by constructing a sufficiently large single
channel, provided the actual output is exactly that one-party
compression of T. A claim about a representation's number of channels
does not supply the required source map.

The theorem is explicitly for one party. There is no corresponding
claim here for arbitrary simultaneous A and B projections: projecting
the A flag onto one half of its basis and the B flag onto the disjoint
half makes the AB wire zero, even though both projections retain half
their local dimensions. Any use of two projected parties needs an
additional compatibility argument.

## Internal verification

The audit worker derived the orbit-cover proof. Root and the
operator-comparison worker independently checked the signed-permutation
average, greedy dimension estimate, local reconstruction, and the
tensor-power limit. The lemma imports only the spectral-point axioms
and the tensor convention already fixed in the project. It establishes
no geodesic trade by itself.
