# A quadratic Frobenius four-party source with an explicit unit degeneration

Research status: the source degeneration and coefficient formula below
are proved. They provide an alternative basis for a legal source of
unit budget m+2. No geodesic target identity is asserted. The
degeneration was proposed by the claim-audit agent and is recorded
here with its exact four-party and operator indices.

## 1. Algebra and four-linear form

Let A_m have basis 1,x_1,...,x_m,z. Its multiplication is

```math
x_\mu x_\nu=\delta_{\mu\nu}z,\qquad
x_\mu z=z^2=0,
```

with 1 the unit. Let tau(z)=1 and tau(1)=tau(x_mu)=0.
This is a commutative associative algebra: a product of three
radical elements is zero, and every multiplication involving a
unit respects associativity. The bilinear form tau(ab) is
nondegenerate, because its matrix pairs 1 with z and restricts to
the identity on the x_mu span.

Write e_0,e_1,...,e_m,e_z for the corresponding coordinate basis.
Let F_m be the four-party tensor with coefficient tau(abcd) in this
basis. Its nonzero terms are exactly:

1. One e_z in any one of the four positions, and e_0 in the other
   three positions, with coefficient one.
2. Two e_mu in any two positions and e_0 in the other two positions,
   for each mu, with coefficient one.

There are four terms of the first kind and six sums of the second
kind. In particular this is a four-party statement, not a conclusion
inferred from a border-rank statement about a three-party tensor.

## 2. Explicit degeneration from U_4(m+2)

Choose vectors v_1,...,v_(m+1) in C^m satisfying

```math
\sum_i v_i=0,\qquad \sum_i v_i v_i^T=I_m.                  \tag{1}
```

Such vectors exist: take an orthonormal basis of the m-dimensional
subspace of R^(m+1) perpendicular to the all-ones vector, make those
basis vectors the columns of a matrix V, and take the rows as v_i.

Set

```math
w_i(t)=e_0+t\sum_{\mu=1}^m(v_i)_\mu e_\mu
                       +\frac{t^2}{m+1}e_z.
```

Then

```math
F_m=\lim_{t\longrightarrow0}t^{-2}
 \left(\sum_{i=1}^{m+1}w_i(t)^{\otimes4}
                         -(m+1)e_0^{\otimes4}\right).     \tag{2}
```

To check (2), the constant terms cancel. The coefficient of t is
zero by the first equality in (1). At order t^2, choosing one e_z
gives the four first-kind terms, since its coefficient summed over
i is one. Choosing two radical entries gives the six second-kind
sums by the second equality in (1). Every remaining term has
degree at least three and vanishes after division by t^2 and
specialization at zero.

For every nonzero t, the expression on the right before the limit
is a sum of m+2 four-party rank-one tensors. Each scalar factor,
including the negative coefficient and t^(-2), can be placed on
the first local map. Thus (2) is an explicit Laurent degeneration

```math
U_4(m+2)\ \unrhd\ F_m.                                   \tag{3}
```

The complete tensor expression in (2) is regular at t=0. No
analytic approximation or limiting norm estimate is being used.

## 3. Exact source-index coupling with a CD wire

Append a CD wire with label e. Let A_a and B_b be arbitrary outside
operators, let D_(d,e) be the middle operator, and let C_(c,e) be a
scalar coefficient for one output C coordinate. All output indices
and the two output D labels may be fixed throughout this formula;
only the source labels are being displayed. The coefficient is

```math
\sum_{a,b,c,d,e}\tau(abcd)C_{c,e}A_aD_{d,e}B_b.            \tag{4}
```

Using 0,mu,z for the basis indices, this is exactly

```math
\begin{split}
\sum_e C_{0,e}\Big[&A_zD_{0,e}B_0+A_0D_{0,e}B_z
                         +A_0D_{z,e}B_0\\
 &+\sum_\mu\big(A_\mu D_{0,e}B_\mu
                 +A_\mu D_{\mu,e}B_0
                 +A_0D_{\mu,e}B_\mu\big)\Big]\\
{}+\sum_e C_{z,e}&A_0D_{0,e}B_0\\
{}+\sum_{\mu,e}C_{\mu,e}\Big[&A_\mu D_{0,e}B_0
                 +A_0D_{0,e}B_\mu
                 +A_0D_{\mu,e}B_0\Big].                 \tag{5}
\end{split}
```

The operator order A D B in every summand is part of the identity.
The sum over mu in (5) is supplied by the source tensor, and is not
an additional family label. Conversely, (5) does not provide two
independent flavour labels in any term: the printed Frobenius
coupling must still be retained.

For example, when the C map kills e_0 and e_z, only the final
three-term expression remains. It is a concrete system in which to
test a proposed coherent-flavour cancellation, including all its
extra terms. Replacing it by an unrestricted double sum would not
be a consequence of (3).

## 4. Tensor powers and the sparse-subset budget

Taking k tensor powers gives a legal source of budget (m+2)^k.
If m is proportional to s, k tends to infinity, and
log(k)=o(log(s)), then for p=binom(s,k),

```math
(m+2)^k=p^{1+o(1)}.
```

This counting observation permits a determinant or exterior
construction to use k such Frobenius factors without a power-sized
source-budget penalty. It does not establish the required output
identity. Every proposed fusion must still use (4), or equivalently
(5), at each source factor, and must verify all output coefficients.

The one-family square-C limitation in
[SQUARE_C_LAURENT_OBSTRUCTION.md](SQUARE_C_LAURENT_OBSTRUCTION.md)
also applies to this local Frobenius algebra. The independent-factor
projection statement is [INDEPENDENT_FLAG_PROJECTIONS.md](INDEPENDENT_FLAG_PROJECTIONS.md).
Neither result supplies a coherent-flavour target identity.

A stronger source-level obstruction is now proved in
[SLICE_COVER_TARGET_CAPACITY.md](SLICE_COVER_TARGET_CAPACITY.md):
all tensor powers of this classical quadratic source miss the required
compressed-target rank at the stated budgets, even with arbitrary local
maps and distinct C maps across families. Its higher-order semisimple
deformation is outside that theorem.
