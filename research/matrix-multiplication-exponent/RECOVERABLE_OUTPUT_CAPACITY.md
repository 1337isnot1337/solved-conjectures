# Source capacity after recoverable target projections

Research status: this is an obstruction for the specified classical
sources, including the successive equivariant channel projections.
It does not constrain the original unit source or the quantum middle
components by the same fixed exponent loss.

## 1. A general recovery statement

Let S be a fixed four-party tensor. Suppose that for every positive
integer n, its n-th tensor power has a three-space cover, with D
unrestricted, whose A, B and C covering subspaces all have dimension
at most D_n. Assume

```math
\limsup_{n\longrightarrow\infty}D_n^{1/n}\le\Gamma.
```

Append the three wires W_AD(N), W_BD(N) and W_CD(Q), and use r full
direct-sum copies. Suppose their image or degeneration is a tensor
T'. Define the uncompressed target by

```math
T_{p,M}=\sum_{i,j=1}^p\sum_{w=1}^M A_{iw}B_{jw}C_{ij}D_{ij}.
```

Assume, in addition, that there are positive integers c_n and
restrictions or degenerations

```math
U_{ABCD}(c_n)\,(T')^{\otimes n}\ \unrhd
T_{p,M}^{\otimes n},\qquad
\limsup_{n\longrightarrow\infty}c_n^{1/n}\le f^{-1},
\quad 0\lt f\le1.                                           \tag{1}
```

Then necessarily

```math
f\le {r\Gamma\over p^2}\max\left\{Q,p{N\over M}\right\}.
                                                               \tag{2}
```

This is an operational recovery hypothesis. A spectral inequality
F(T') >= f F(T) alone is not being substituted for (1).

**Proof.** After n tensor powers, adjoining the wires enlarges the
three cover dimensions to at most D_n N^n, D_n N^n and D_n Q^n.
The c_n r^n independently mapped copies in (1) enlarge them to at
most c_n r^n times those numbers. The three-space cover condition
is closed under the allowed border limits, including formal Laurent
limits by the saturated-lattice proof.

Regrouping by party identifies the recovered tensor with
T_(p^n,M^n). Apply the full-target case of the exact capacity bound
rank(L) <= w+p(u+v)/M. It gives

```math
p^{2n}\le c_n r^n D_n
 \left(Q^n+2p^n(N/M)^n\right).                            \tag{3}
```

Taking n-th roots, then the upper limit on the right side, gives
p^2 <= r Gamma max{Q,pN/M}/f. This is (2). No limit in p or in the
neutral flag size is taken before this fixed-parameter tensor-power
argument. QED.

## 2. The equivariant channel construction is recoverable

Consider

```math
T=T_X\otimes T_Y,\qquad
T_X=U_{ACD}(p)W_{AB}(M_X),\quad
T_Y=U_{BCD}(p)W_{AB}(M_Y),\quad M=M_XM_Y.
```

Let P act at A on the outer-X factor and Q_B act at B on the
outer-Y factor. Let their ranks be d_X and d_Y. Assume the hypotheses
of the equivariant-channel lemma, so that the tensor P_A Q_B T has
the explicitly exhibited one-design stabilizer at C. Let L_C be a
map of rank nu on C, and set

```math
T'=L_C P_A Q_B T,
\qquad
f={\nu\over p^2}{d_X\over pM_X}{d_Y\over pM_Y}.            \tag{4}
```

The proof of the single-party rank-fraction lemma gives actual local
reconstruction maps on tensor powers. For a rank-k map on a
d-dimensional party, the number of copies can be chosen with
n-th root tending to at most d/k; the extra factor is polynomial
in n with the original finite tensor fixed.

Apply that construction first at C to recover (P_A Q_B T)^n from
copies of (T')^n. Independently reconstruct T_X^n from copies of
(P T_X)^n and T_Y^n from copies of (Q_B T_Y)^n. Tensoring the last
two restrictions recovers T^n. Composing all three steps multiplies
their copy counts. Their n-th roots are bounded by the three
reciprocal fractions in (4). Thus (1) holds with precisely this f.

Consequently such channel projections do not evade (2). This
deduction uses the explicit orbit-cover construction, not an
unproved converse to a spectral comparison. It applies only when
the stated channel and stabilizer hypotheses hold.

## 3. Quadratic Frobenius powers

Let F_m be the quadratic Frobenius four-party tensor with local
degrees 0, 1 and 2, multiplicities 1, m and 1, and total degree two.
Take S=F_m^(tensor k). In S^n=F_m^(tensor kn), one of A, B, C has
degree at most 2kn/3 in each nonzero term. For any 0<t<1, its
low-degree covering space has dimension at most

```math
\left(t^{-2/3}(1+mt+t^2)\right)^{kn}.
```

Put

```math
\gamma_m=\inf_{0\lt t<1}t^{-2/3}(1+mt+t^2).
```

For each fixed m, gamma_m < m+2, because the logarithmic derivative
of the displayed expression at t=1 is 1/3. For m>=1, taking
t=1/(m+1) also gives gamma_m <= 2(m+1)^(2/3), and
log(gamma_m)/log(m+2) tends to 2/3 as m tends to infinity. For the
last equality, the upper bound follows by taking t=2/m when m>2;
the lower bound follows from minimizing t^(-2/3)(1+mt) over t>0.
In both cases the scale is a positive constant times m^(2/3).

The general theorem therefore applies with Gamma=gamma_m^k. If

```math
(m+2)^k=p^{1+o(1)},\quad Q=p^{1+o(1)},\quad
r=p^{o(1)},\quad N/M=p^{o(1)},\quad m\longrightarrow\infty,
```

then every recoverable output of the specified source satisfies

```math
f\le p^{-1/3+o(1)}.                                      \tag{5}
```

In particular, the product of the three channel fractions in (4)
cannot be p^(-o(1)). The original quadratic-source deficit survives
these successive projections. For fixed m and growing k, the strict
inequality gamma_m < m+2 gives the analogous positive exponent loss.

## 4. Balanced classical Grassmannian source

Let S be the special Grassmannian trace-four tensor for s=2k,
p=binom(2k,k), and socle degree k^2. In S^n, one of A, B, C has
total partition area at most nk^2/3. Its label words are n separate
k-subsets of [0,2k-1]. Ignoring each block's cardinality constraint
can only increase the count in the centered Bernoulli estimate.

The total deviation is nk^2/6, and the sum of squared centered
weights is n k(4k^2-1)/6. The same exponential Markov calculation
therefore gives a cover dimension at most

```math
4^{kn}\exp\left(-{n k^3\over3(4k^2-1)}\right)
\le\left(4^k e^{-k/12}\right)^n.                         \tag{6}
```

Thus Gamma=4^k exp(-k/12) is admissible in (2). Under the same
wire, family and neutral-flag budgets, and as k tends to infinity,

```math
f\le p^{-\delta+o(1)},\qquad
\delta={1\over12\log4}>0.                               \tag{7}
```

Again this rules out only the classical source with a fixed deficit.
The sparse exterior-degree regime has no such fixed deficit from
this count. Quantum components have different support and are not
assigned the classical cover in (6).

## 5. Dependencies and scope

The source cover and capacity arguments are the written proofs in
SLICE_COVER_TARGET_CAPACITY.md and GRASSMANNIAN_SLICE_CAPACITY.md.
The recovery construction is the explicit one-design orbit cover in
SINGLE_PARTY_PROJECTION_TRADE.md, applied with the stabilizers in
[EQUIVARIANT_FLAG_CHANNELS.md](EQUIVARIANT_FLAG_CHANNELS.md). The tensor-power argument
above is a consequence of those results; it is not a proof of a new
matrix multiplication bound.
