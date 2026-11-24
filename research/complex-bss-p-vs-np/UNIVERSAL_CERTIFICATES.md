# Universal chart certificates and resultant exclusion complexity

Research status, 23 November 2026. This note gives a cofactor-independent equivalence and an explicit obstruction to a normalization step. It does not prove a lower bound for unrestricted certificates or settle the complex BSS problem. All scalar constants are arbitrary complex numbers. The circuits below charge arithmetic used to construct rational parameter functions.

## 1. Universal system and charged certificate model

Let `N>=2`, let `A=(a_{i,j,k})` be the `M=N binom(N+1,2)` independent coefficients of `N` homogeneous quadrics in `N` variables, and write

```math
F_i(A;W)=\sum_{1\le j\le k\le N}a_{i,j,k}W_jW_k,
\qquad
f_i(A;Z)=F_i(A;1,Z_2,\ldots,Z_N).
```

Let `R_N(A)` be the irreducible resultant. Its scalar normalization does not affect this note. Let `L(P)` mean division-free arithmetic circuit size, with arbitrary complex scalar constants. Define

```math
\mathop{\mathrm{EC}}(R_N)
=\min\{L(P):0\ne P\in\mathbb C[A],\ R_N\mid P\}.
```

A charged chart certificate is a shared circuit for polynomials

```math
U_i(A;Z)\in\mathbb C(A)[Z]
\quad\text{with}\quad
\sum_{i=1}^{N}f_i(A;Z)U_i(A;Z)=1.                 \tag{1}
```

Its gates use addition, subtraction, multiplication, and division. Each divisor must be a nonzero rational function computed by a subcircuit using parameter variables `A` and constants only; it cannot read `Z`. All such parameter computations and divisions are charged. In particular, a rational function in `A` is not a free input. No degree bound is imposed on `U_i` in `Z` or on their denominators. Let `K_N` be the minimum shared size of such a certificate.

The identity is over the rational function field `C(A)`, not a claim that every specialized chart is infeasible. The distinction between affine and projective feasibility is treated in Section 3.

## 2. From any nonzero multiple to a certificate

**Proposition 2.1.** If `P!=0` is computed by a division-free circuit of size `s` and `R_N|P`, then (1) has a charged circuit of size

```math
(3N+2)s+O(M+N^2).                                \tag{2}
```

**Proof.** Put `c_i=a_{i,1,1}` and let `B` consist of the remaining coefficients. Then

```math
f_i=c_i+h_i(B;Z).
```

The substitution `c'_i=-h_i(B;Z)` supplies a common projective zero `(1,Z)`. Hence

```math
P(c',B)=0
```

as a polynomial identity in `B,Z`, because `R_N(c',B)=0`.

For every register `g` of the circuit for `P`, compute two evaluations `A_g=g(c,B)`, `C_g=g(c',B)`, and `N` divided-difference registers `D_{g,i}` satisfying

```math
A_g-C_g=\sum_{i=1}^{N}(c_i-c'_i)D_{g,i}.          \tag{3}
```

For a distinguished input `c_j`, initialize `D_{g,i}` to the Kronecker delta. For every other input and every scalar constant initialize all these registers to zero. Addition and subtraction act componentwise. For `g=uv`, use

```math
A_g=A_uA_v,\qquad C_g=C_uC_v,
\qquad
D_{g,i}=D_{u,i}A_v+C_uD_{v,i}.                    \tag{4}
```

This preserves (3), by the identity

```math
A_uA_v-C_uC_v=(A_u-C_u)A_v+C_u(A_v-C_v).
```

Each multiplication uses `3N+2` operations, and an addition or subtraction uses `N+2`. The `h_i` use `O(M)` operations, and initialization/copying has polynomial overhead. At the output, write `D_i=D_{P,i}`. Since `C_P=0`,

```math
P(A)=\sum_i f_i(A;Z)D_i(A;Z).
```

Set `U_i=D_i/P(A)`. The single shared inverse of `P(A)` is a permitted parameter-only division. This proves (1) and (2). No factorization of `P` or inspection of its unknown cofactor is used. QED.

## 3. From a certificate to a nonzero multiple

**Proposition 3.1.** A charged certificate of size `t` produces a nonzero polynomial `Q(A)` divisible by `R_N`, with

```math
L(Q)\le4t+O(M+N).                                \tag{5}
```

**Proof.** Clear each circuit register as a pair `P_g/Q_g`, with `P_g` polynomial in `A,Z` and `0!=Q_g` polynomial in `A`. For addition and subtraction use

```math
\frac{P_u}{Q_u}\mathbin{\pm}\frac{P_v}{Q_v}
=\frac{P_uQ_v\mathbin{\pm}P_vQ_u}{Q_uQ_v};
```

this costs four division-free operations. Products and permitted divisions cost two. In the latter case the numerator of the divisor is parameter-only and nonzero, so the invariant on denominators is preserved. All circuit gates can be cleared simultaneously with at most `4t` operations, apart from the stated input convention.

Let `P_i/Q_i` be the output pairs and take `Q=prod_i Q_i`, computed with `N-1` further multiplications. It is nonzero. Clearing (1) gives the polynomial identity

```math
Q(A)=\sum_i f_i(A;Z)P_i(A;Z)\prod_{j\ne i}Q_j(A).
                                                               \tag{6}
```

Every coefficient tuple possessing a common zero with `W_1!=0` therefore has `Q(A)=0`. This subset is dense in `V(R_N)`: the universal projective incidence is a vector bundle over projective `(N-1)`-space, hence irreducible, and its nonempty chart `W_1!=0` is dense. The projective projection has image `V(R_N)`, so the chart image is dense there. Since `Q` is a polynomial, it vanishes on all of `V(R_N)`. Irreducibility gives `R_N|Q`.

This argument does not assert that affine chart feasibility is equivalent to projective feasibility at every specialized coefficient tuple. Systems whose only zeros satisfy `W_1=0` are included by density in the polynomial divisibility conclusion. QED.

Together, the two propositions prove polynomial equivalence of `K_N` and resultant exclusion complexity, with only a factor `O(N)` in the forward direction. Thus a superpolynomial lower bound for every charged universal chart certificate would suffice for the desired all-multiple lower bound. The equivalence itself does not supply that lower bound.

## 4. Specialization can turn the leading terms into a syzygy

A small certificate over a parameter field need not have a finite coefficientwise limit at a desired specialization. Multiplying by the smallest denominator power and taking a leading limit need not retain the right side `1`.

For the fixed infeasible linear system

```math
f_1(z)=z,\qquad f_2(z)=1-z,
```

take any positive integer `H` and set

```math
U_1=1+\epsilon^{-H}(1-z),\qquad
U_2=1-\epsilon^{-H}z.
```

Then `f_1U_1+f_2U_2=1` exactly. The normalized leading limit after multiplication by `epsilon^H` is `(1-z,-z)`, and

```math
z(1-z)+(1-z)(-z)=0.
```

It is a syzygy, not a certificate. When `H=2^r`, the pole has a circuit description of length `O(r)`. This does not show that every pole-removal algorithm is expensive; it shows that a proposed bound proportional to pole order can be exponential in the input circuit size.

## 5. Even coordinatewise finite-part extraction is hard in general

The certificate identity by itself does not make extraction of each coefficient of `epsilon^0` inexpensive. This follows from an explicit family on the same fixed linear system.

Let `m>=2`, `b=m+1`, and define

```math
P_m(\epsilon,X)
=\prod_{i=1}^{m}\left(\sum_{j=0}^{m-1}X_{ij}\epsilon^{b^j}\right),
\qquad
E_m=\sum_{j=0}^{m-1}b^j,
\qquad
H_m=\epsilon^{-E_m}P_m(\epsilon,X).
```

The powers of `epsilon` and their shared sums/products have circuits of size `O(m^2+m log m)`. The denominator of `H_m` depends only on the parameter `epsilon` and is computed and charged. In every expanded term of `P_m`, its exponent is `sum_j c_j b^j`, where `0<=c_j<=m<b`. Uniqueness of base-`b` digits shows

```math
[\epsilon^0]H_m=\mathop{\mathrm{per}}_m(X).        \tag{7}
```

Now set

```math
U_1=1+(1-z)H_m,\qquad U_2=1-zH_m.                \tag{8}
```

These are short charged certificates for `z,1-z`, since their syzygy contributions cancel. But

```math
[\epsilon^0]U_1=1+(1-z)\mathop{\mathrm{per}}_m(X),
\qquad
[\epsilon^0]U_2=1-z\mathop{\mathrm{per}}_m(X).
```

A circuit for the first finite part, evaluated at `z=0` and decreased by one, computes the permanent. The same conclusion holds for border circuits. Under the pinned permanent border lower bound, coordinatewise finite-part extraction on arbitrary short parameter-dependent certificates cannot have polynomial circuit overhead.

This obstruction has a narrow conclusion. The system `z,1-z` has the constant certificate `(1,1)`. The example does not exclude choosing a different bounded certificate, and it does not refute a normalization theorem specialized to the universal resultant certificate from Proposition 2.1. It excludes treating the coordinatewise finite part of a supplied certificate as a free operation, even when the source identity is exact and the source equations are linear.

## 6. Relation to the ongoing attacks

The divided-difference construction is the multivariate chart analogue of the charged Boolean-inverse equivalence in [the Boolean inverse note](../shub-smale-tau/BOOLEAN_INVERSE.md), Proposition 2.1, contributed by campaign #260 and PR #268. That note also records the base-`b` coefficient-extraction example used in (7). Here it is inserted into an exact short syzygy certificate to test the proposed specialization operation.

If a short certificate remains defined after a Boolean specialization with a final equation `y-K_X(B)`, it supplies a polynomial representative of `(y-K_X(B))^(-1)` in the Boolean quotient. This is a conditional specialization statement: a generic parameter denominator may vanish identically on the selected family. Expanding a defined specialized inverse in `y^(-1)` supplies representatives of powers of `K_X`, not the sum of its values. Selecting the canonical multilinear representative or applying the quotient trace is an additional operation. The existing permanent-based normal-form and trace obstructions therefore still apply unless a special property of the universal certificate is proved.

The universal resultant, its irreducibility, and its small projective incidence are specified with source versions in `INCIDENCE.md` and `SOURCE_AUDIT.md`. The pinned lower bound and its conventions are recorded in `GRAPH_HARDNESS.md`. The reductions above are elementary circuit identities and density arguments; no novelty, Lean-verification, or full-separation claim is made.
