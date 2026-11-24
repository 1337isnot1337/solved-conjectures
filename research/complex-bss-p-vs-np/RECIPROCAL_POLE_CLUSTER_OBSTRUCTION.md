# A hard reciprocal trace can move between finite and escaping pole clusters

Research checkpoint, 23 November 2026. The construction below supplies a short irreducible polynomial denominator and a specified simple finite-root degeneration. The first reciprocal-power trace of the roots that stay finite has a permanent coefficient in its first deformation jet. The reciprocal trace of all roots is identically zero. This is an exact obstruction to a general cheap finite-cluster extraction operation. It does not rule out extracting the entire reduced denominator, and it does not prove or disprove a trace theorem specialized to the tagged factor of a universal resultant multiple.

## 1. A short observable on roots of unity

Let `m>=2`, let `D=2^m`, and fix a primitive `D`-th root of unity `zeta`. All scalar constants below are permitted complex constants. Write `X=(X_ij)` for an arbitrary complex `m` by `m` matrix of indeterminates.

Define polynomials in `t` recursively by

```math
U_0(t)=t,
\qquad
B_j(t)=\frac{1-U_j(t)^{2^{m-j-1}}}{2},
\qquad
U_{j+1}(t)=U_j(t)
\left(1+(\zeta^{-2^j}-1)B_j(t)\right)
\quad(0\le j<m).
```

If `a=sum_j 2^j a_j` with `a_j` Boolean, induction gives

```math
U_j(\zeta^a)
=\zeta^{a-\sum_{i<j}2^i a_i},
\qquad B_j(\zeta^a)=a_j.
```

Indeed, the exponent in the first formula is divisible by `2^j`; raising to `2^(m-j-1)` gives `(-1)^(a_j)`. The update then removes the `j`-th bit of the exponent.

Set

```math
H_m(X,t)=
\left(\prod_{j=0}^{m-1}(2B_j(t)-1)\right)
\left(\prod_{i=1}^{m}\sum_{j=0}^{m-1}X_{i,j+1}B_j(t)\right).
                                                               \tag{1}
```

At `t=zeta^a`, this is the Ryser summand indexed by the subset of nonzero bits. Consequently

```math
\sum_{a=0}^{D-1}H_m(X,\zeta^a)
=\mathop{\mathrm{per}}_m(X).                       \tag{2}
```

For completeness, expanding the row sums makes the coefficient associated with a map from rows to columns equal to the sum of `(-1)^(m-|S|)` over subsets containing its image. This coefficient is zero unless the image is every column, and then it is one. The surviving maps are exactly the permutations. Thus (2) is a polynomial identity for arbitrary complex matrices.

The shared circuit for the powers and updates uses `O(m^2)` operations; (1) adds `O(m^2)` operations. The degree in `t` can be much larger. If `h=deg_t H_m`, then

```math
1\le h\le
2m\prod_{r=1}^{m-1}(1+2^r)
\le 2m\,2^{(m-1)(m+2)/2}.                         \tag{3}
```

To check the bound, `deg U_j=prod_{i<j}(1+2^(m-i-1))`; the largest degree among the `B_j` is attained at `j=m-1` and equals `prod_{r=1}^{m-1}(1+2^r)`. The two products in (1) contribute at most `2m` times that maximum. The polynomial is not constant in `t`, since its values at the empty and full subsets differ as polynomials in `X`.

## 2. A short irreducible denominator

Put `J_m=1+H_m` and define

```math
q_m(X,\epsilon,t)
=t^D-1-\epsilon t^{D+1}J_m(X,t).                   \tag{4}
```

The added one makes `J_m(X,zeta^a)` a nonzero polynomial for every `a`: at `X=0`, every such value equals one. The shared arithmetic circuit for (4) has size `O(m^2)`.

Let `M=deg_t q_m` over `C(X,epsilon)`. Then

```math
M=D+1+h>D,
\qquad
2^m+2\le M\le
2^m+1+2m\,2^{(m-1)(m+2)/2}=2^{O(m^2)}.            \tag{5}
```

**Irreducibility.** The two coefficients of (4), viewed as a polynomial linear in `epsilon`, are coprime in `C[X,t]`. The first is `t^D-1`, whose irreducible factors are the distinct `t-zeta^a`; none divides `t^(D+1)J_m`, by the nonzero evaluations just proved. Thus (4) is primitive as a polynomial in `epsilon` and irreducible over the fraction field of `C[X,t]`, where it has degree one. Gauss's lemma makes it irreducible in `C[X,epsilon,t]`. Its constant term in `t` is `-1`, so it is primitive as a polynomial in `t` as well. A second use of Gauss's lemma proves irreducibility in `C(X,epsilon)[t]`.

In particular, the rational function `1/q_m` has a single irreducible pole divisor. There is no numerator cofactor to remove in this example.

## 3. The finite roots carry a hard first jet

At `epsilon=0`, the denominator becomes `t^D-1`. Each of these `D` roots is simple. Near every fixed matrix center in `X`-space, the implicit function theorem therefore gives exactly one holomorphic root branch

```math
\alpha_a(X,\epsilon),\qquad
\alpha_a(X,0)=\zeta^a,
\quad 0\le a<D.
```

Define the reciprocal trace of this finite cluster by

```math
S_m(X,\epsilon)=\sum_{a=0}^{D-1}\frac1{\alpha_a(X,\epsilon)}.
```

Differentiating (4) at `epsilon=0` gives

```math
D(\zeta^a)^{D-1}\partial_\epsilon\alpha_a(X,0)
=(\zeta^a)^{D+1}J_m(X,\zeta^a),
```

and hence

```math
\partial_\epsilon\alpha_a(X,0)
=\frac{(\zeta^a)^2}{D}J_m(X,\zeta^a).
```

It follows that

```math
S_m(X,0)=0,
\qquad
\partial_\epsilon S_m(X,0)
=-\frac1D\sum_a J_m(X,\zeta^a)
=-1-\frac1D\mathop{\mathrm{per}}_m(X).             \tag{6}
```

The coefficient in (6) is a degree-`m` polynomial in the matrix entries. Under the pinned permanent border lower bound, it has superpolynomial border circuit size. An operation producing this first finite-cluster trace jet with cost polynomial in the denominator circuit size, the number of input variables, `m`, and even `log M` would contradict that lower bound. Bounds polynomial in `M` or in the number `D` of selected roots are not excluded.

## 4. The escaping roots carry the opposite coefficient

For a generic fixed value of `X`, the degree of `q_m` is `M` when `epsilon!=0`. As `epsilon` tends to zero, precisely `D` roots stay bounded and converge to the roots of unity. Every other root escapes to infinity. To verify this without choosing global labels for the escaping roots, fix any radius greater than one. On its boundary, (4) converges uniformly to `t^D-1`; the elementary root-counting continuity argument, or Rouché's theorem, gives exactly `D` roots inside for sufficiently small nonzero `epsilon`. The radius can be arbitrarily large.

Nevertheless, the reciprocal trace over **all** `M` roots is exactly zero. Indeed,

```math
q_m(X,\epsilon,0)=-1,
\qquad
\partial_tq_m(X,\epsilon,0)=0,
```

so the elementary reciprocal-root identity gives

```math
\sum_{\beta:q_m(X,\epsilon,\beta)=0}\frac1\beta
=-\frac{\partial_tq_m(X,\epsilon,0)}{q_m(X,\epsilon,0)}
=0.                                               \tag{7}
```

The sum counts multiplicities; generically the roots are simple. Subtracting the finite cluster from (7), the aggregate reciprocal trace of the escaping cluster is `-S_m`. It tends to zero, but its first deformation coefficient is

```math
1+\frac1D\mathop{\mathrm{per}}_m(X).               \tag{8}
```

Thus the vanishing of each reciprocal at infinity justifies discarding that cluster only at zeroth order. Its first-order aggregate can contain the whole hard coefficient. Individual escaping roots need not be single-valued holomorphic functions of `epsilon`; their aggregate is holomorphic here because it equals `-S_m`.

## 5. Exact scope for the resultant attack

This construction strengthens the earlier general observable-trace warning in [TAGGED_TRACE_OBSTRUCTION.md](TAGGED_TRACE_OBSTRUCTION.md): the observable is now just the first reciprocal power, the numerator is one, and the denominator is an explicitly short irreducible polynomial. The nontrivial selection is the cluster specified by the degeneration, rather than an arbitrary observable on all roots.

The example does not make the denominator itself hard; (4) is already its short circuit. It therefore does not refute a procedure that extracts an entire reduced denominator. Nor does it refute a theorem for the full, algebraically tagged resultant factor in a generic-line multiple. The `D` selected branches here form an analytic cluster of an irreducible polynomial, not a factor over `C(X,epsilon)`. What it excludes is silently identifying the finite-cluster reciprocal trace, or its low-order deformation jet, with a cheap operation on a short pole presentation. A proposed resultant-specific degeneration must prove why its escaping cluster contributes no hard term, rather than assuming that because the reciprocal values tend to zero.
