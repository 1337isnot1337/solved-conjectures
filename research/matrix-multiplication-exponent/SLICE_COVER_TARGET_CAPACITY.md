# Capacity of a three-party slice cover

Research status: all bounds below are exact linear-algebra statements.
They exclude the stated compressed-target and dense partial-target
constructions from powers of the quadratic Frobenius source. They
do not prove a lower bound on the matrix multiplication exponent.

## 1. A slice cover with D unrestricted

Let S be a four-party tensor. Suppose subspaces U_0,V_0,W_0 of its
A,B,C spaces, of dimensions u_0,v_0,w_0, satisfy

```math
S\in U_0\otimes B\otimes C\otimes D
   +A\otimes V_0\otimes C\otimes D
   +A\otimes B\otimes W_0\otimes D.                       \tag{1}
```

There is no restriction on D in this condition. Under a local
restriction, take the images of the three indicated subspaces.
Their dimensions do not increase, and (1) remains true. For a sum
of r independently mapped copies, use the sum of their images,
whose dimensions are at most r u_0,r v_0,r w_0.

The existence of a cover with bounded dimensions is also closed
under coefficientwise limits. To see this directly, pad the three
subspaces to fixed dimensions, bounded by their ambient dimensions.
Along a convergent sequence of tensors, compactness of the three
complex Grassmannians gives a subsequence on which these subspaces
converge. Orthogonal projections onto them converge as well. The
condition

```math
(\pi_{A/U}\otimes\pi_{B/V}\otimes\pi_{C/W}\otimes I_D)S=0
```

therefore passes to the limit. In particular the following bounds
apply to Laurent degenerations with a finite complete output limit.

For formal Laurent families the same statement has an algebraic
proof. Put R=C[[t]] and K=C((t)). Intersect each K-subspace U_K with
the standard free lattice R^A. The resulting saturated lattice is a
direct summand of R^A: its quotient is finitely generated and
torsion-free over the discrete valuation ring R, hence free. Its
reduction has dimension dim_K U_K. Do the same at B and C. The
three quotient modules and their tensor product with R^D are free.
For an integral complete output tensor, quotient vanishing over K
therefore implies quotient vanishing over R, and then at t=0.
This proves the same bounded cover for the formal limiting tensor.
Replacing t by a root parameter also covers finite Puiseux families.

## 2. Capacity for an arbitrary linear C compression

Let A=direct-sum_(i=1)^p A_i and B=direct-sum_(j=1)^p B_j, with
each A_i and B_j identified with C^M. Let C be any output space,
and choose vectors ell_(ij) in C. Consider

```math
T_L=\sum_{i,j=1}^p\sum_{a=1}^M
       A_{ia}\otimes B_{ja}\otimes\ell_{ij}\otimes D_{ij}.
                                                                  \tag{2}
```

The D_(ij) are independent basis vectors. The rank of the linear
C map L is dim span{ell_(ij)}. If T_L has a cover (1) with image
subspace dimensions at most u,v,w, then

```math
\mathop{\mathrm{rank}}L\le w+{p(u+v)\over M}.                  \tag{3}
```

**Proof.** Set u_i=dim(U intersect A_i), v_j=dim(V intersect B_j).
The direct-sum decompositions imply

```math
\sum_i u_i\le u,\qquad \sum_j v_j\le v.                   \tag{4}
```

Apply the three quotient maps to (2). Independence of D_(ij)
shows that, for every i,j,

```math
(\pi_A\otimes\pi_B)\left(\sum_a A_{ia}B_{ja}\right)
             \otimes\pi_C(\ell_{ij})=0.                   \tag{5}
```

The two restricted quotient maps on A_i,B_j have kernel dimensions
u_i,v_j. Sylvester's rank inequality gives

```math
\mathop{\mathrm{rank}}
 (\pi_A\otimes\pi_B)\left(\sum_a A_{ia}B_{ja}\right)
 \ge M-u_i-v_j.                                          \tag{6}
```

Thus ell_(ij) outside W is possible only if u_i+v_j>=M. There
are at most

```math
\sum_{i,j}{u_i+v_j\over M}
 ={p\over M}\left(\sum_i u_i+\sum_jv_j\right)
 \le {p(u+v)\over M}                                    \tag{7}
```

such pairs. Every other column of L lies in W. Adjoining one
vector for each exceptional column to W proves (3). QED.

This argument does not assume that L is invertible, that its columns
have coordinate support, or that the C maps of different source
families agree.

## 3. Dense partial targets are bounded as well

More generally, suppose the output has independent C and D labels
(i,j), and an M by M matrix K_(ij) in A_i tensor B_j:

```math
T_K=\sum_{i,j} K_{ij}\otimes C_{ij}\otimes D_{ij}.
```

Then the same cover implies

```math
\sum_{i,j}\mathop{\mathrm{rank}}K_{ij}
 \le wM+p(u+v).                                          \tag{8}
```

Indeed at most w of the independent coordinate vectors C_(ij)
can belong to W. For those pairs use rank K_(ij)<=M. For every
other pair the doubly projected K_(ij) is zero, and rank loss under
the two quotient maps is at most u_i+v_j. Summing and using (4)
proves (8).

For a support-correct weighted partial target, K_(ij) is diagonal
and its rank is exactly the number of retained nonzero flag entries.
Writing rho for the retained fraction of the p^2 M entries gives

```math
\rho\le {w\over p^2}+{u+v\over pM}.                       \tag{9}
```

Equation (8) also covers non-diagonal operator slices, including
exchange operators, when their outer row and column blocks are A_i
and B_j and their C,D labels are independent.

## 4. Tensor powers of the quadratic Frobenius source

The exact unit degeneration and complete source-index coupling are
[QUADRATIC_FROBENIUS_SOURCE.md](QUADRATIC_FROBENIUS_SOURCE.md).

Let A_m have basis 1,x_1,...,x_m,z, with products

```math
x_a x_b=\delta_{ab}z,\qquad x_a z=z^2=0,
```

and unit 1. Give these basis elements degrees 0,1,2 respectively.
Let tau(z)=1 and let tau vanish on the other basis elements. Define
the four-party tensor by the coefficients

```math
F_m=\sum_{a,b,c,d}\tau(e_a e_b e_c e_d)
                  A_aB_bC_cD_d.                           \tag{10}
```

Every nonzero term has total degree two. In particular at least one
of its A,B,C labels is the unit. In a k-fold tensor power, at least
one of the A,B,C words has at least ceil(k/3) unit coordinates.
Let U_0,V_0,W_0 span all words with that many unit coordinates.
This gives a cover (1) with each dimension at most

```math
D_{m,k}^{\rm unit}
=\sum_{j=\lceil k/3\rceil}^k {k\choose j}(m+1)^{k-j}
\le 2^k(m+1)^{2k/3}.                                     \tag{11}
```

The last inequality holds because k-j<=2k/3 and the sum of all
binomial coefficients is 2^k.

There is a sharper degree cover, useful also when m is fixed. Total
degree on A,B,C is at most 2k, so one of the three words has degree
at most floor(2k/3). Let

```math
D_{m,k}^{\rm deg}
 =\sum_{a+2b\le\lfloor2k/3\rfloor}
       {k!\over a!b!(k-a-b)!}\,m^a.                       \tag{12}
```

Spanning these low-degree words gives another cover with all three
dimensions at most D_(m,k)^deg. For every 0<t<1,

```math
D_{m,k}^{\rm deg}
 \le t^{-2k/3}(1+mt+t^2)^k.                               \tag{13}
```

This follows by weighting each degree-d word by t^d, which is at
least t^(2k/3) on the indicated range. For any fixed m, the logarithm
of the right side relative to (m+2)^k has derivative 1-2/3>0 at
t=1. Taking t<1 sufficiently close to one therefore gives a strict
exponential saving over (m+2)^k. No asymptotic in m is needed for
this fixed-m statement.

## 5. Appended flags and the exact conversion bound

Append W_AD(N), W_BD(N), and W_CD(Q) to F_m^(tensor k). A cover
of its algebra factors with dimensions at most D then becomes a
cover of the augmented source with dimensions

```math
DN,\qquad DN,\qquad DQ.                                  \tag{14}
```

For r independently mapped copies, (3) and (9) consequently give

```math
\mathop{\mathrm{rank}}L\le rDQ+2prD\,{N\over M},               \tag{15}
```

and, for a weighted partial target,

```math
\rho\le {rDQ\over p^2}+{2rDN\over pM}.                   \tag{16}
```

These bounds permit arbitrary local maps, all tagged information
actually present at D, different C maps in every family, and
coefficientwise border limits. They do not assume that a construction
preserves the original graded basis.

## 6. Consequence for the proposed sparse fusion

Put P=(m+2)^k. Suppose m tends to infinity and the proposed target
parameters obey

```math
P=p^{1+o(1)},\quad Q=p^{1+o(1)},\quad
r=p^{o(1)},\quad N/M=p^{o(1)}.
```

Equation (11) gives D<=p^(2/3+o(1)); its factor 2^k has logarithmic
cost log(2)/log(m+2), which tends to zero. Therefore

```math
\mathop{\mathrm{rank}}L\le p^{5/3+o(1)},\qquad
\rho\le p^{-1/3+o(1)}.                                   \tag{17}
```

Both bounds miss the required rank p^(2-o(1)) or density p^(-o(1)).
Thus the full k-fold quadratic Frobenius source, not merely its
radical-C sector, is insufficient for these proposed targets at
these budgets. With fixed m and k tending to infinity, (13) gives
a corresponding strict exponent deficit, possibly different from
one third.

This obstruction concerns this source and these targets. It does
not exclude the original unit source, Grassmannian sources whose
degree-cover dimension has no fixed exponent deficit, unrelated
asymptotic degenerations, or the equality omega_C=2.

In particular, a construction that retains higher-order terms of a
semisimple deformation F_m(t) and amplifies them by singular local
maps need not factor through the classical tensor F_m(0). The cover
of F_m(0) alone does not bound such a simultaneous construction.

The corresponding classical Grassmannian source count is
[GRASSMANNIAN_SLICE_CAPACITY.md](GRASSMANNIAN_SLICE_CAPACITY.md).
Its balanced and sparse parameter regimes have different conclusions.
