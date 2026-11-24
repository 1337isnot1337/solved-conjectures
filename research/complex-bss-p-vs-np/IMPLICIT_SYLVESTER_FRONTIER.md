# Implicit Sylvester maps, short nullvectors, and the aggregate that remains

Research checkpoint, 23 November 2026 (America/Chicago). The small-circuit representation of a Sylvester operator permits a short certificate for a common root and even a short polynomial nullvector. That certificate does not recover the common factor or its logarithmic derivative. Separately, an explicit compressed matrix family has a fixed one-dimensional kernel exactly on the permanent graph. This rules out a general principle that a small implicit operator description and a short kernel description automatically give a small HN singularity incidence. It does not rule out a further construction specific to Sylvester maps.

## 1. The exact Sylvester kernel

Let `K` be a characteristic-zero field, and let `f,g in K[t]` be nonzero polynomials of degrees `a,b`. Write

```math
f=R f_0,
\qquad g=R g_0,
\qquad \gcd(f_0,g_0)=1,
\qquad r=\deg R.
```

The Sylvester map is the linear operator

```math
\mathcal S:
 K[t]_{<b}\oplus K[t]_{<a}\longrightarrow K[t]_{<a+b},
\qquad (u,v)\longmapsto fu+gv.                  \tag{1}
```

Its coefficient matrix has dimension `a+b`. Its kernel is exactly

```math
\ker\mathcal S
=\{(g_0 h,-f_0 h):h\in K[t]_{<r}\}.              \tag{2}
```

Indeed, `fu+gv=0` implies `f_0u=-g_0v`. Coprimality gives `u=g_0h,v=-f_0h`. The two degree restrictions are then equivalent to `deg h<r`. The converse is immediate. In particular the corank is `r`.

If `f,g` are squarefree, their common roots are distinct. Over an algebraic closure of `K`, evaluation at each common root `alpha` is a left nullvector of (1):

```math
\ell_\alpha(p)=p(\alpha),
\qquad
\ell_\alpha(fu+gv)=0.                            \tag{3}
```

These `r` functionals are linearly independent by the Vandermonde determinant, so they form the full left kernel. A single common root is witnessed by the two short equations `f(alpha)=g(alpha)=0`. That is an HN certificate for singularity of this particular structured map, without materializing its matrix.

## 2. Even a right nullvector can be short without exposing `R`

Given one common root `alpha`, the pair

```math
u_\alpha(t)=\frac{g(t)}{t-\alpha},
\qquad
v_\alpha(t)=-\frac{f(t)}{t-\alpha}               \tag{4}
```

consists of polynomials of the required degrees and belongs to the kernel. It has a division-free circuit with size linear in the supplied circuit sizes of `f,g`, when `alpha` is an allowed scalar constant.

For the circuit construction, compute each gate both at `t` and at `alpha`, and compute its divided difference

```math
\Delta p(t)=\frac{p(t)-p(\alpha)}{t-\alpha}.
```

The product rule

```math
\Delta(pq)=p(t)\Delta q+q(\alpha)\Delta p
```

and the sum rule give a constant number of extra arithmetic gates per original gate. Since `f(alpha)=g(alpha)=0`, these divided differences are exactly the polynomials in (4).

In the parameterization (2), this nullvector uses

```math
h(t)=\frac{R(t)}{t-\alpha},
```

which can have degree `r-1`. Dividing `f` by the component `v_alpha` recovers only the already selected linear factor `t-alpha`, not the entire gcd. A nonzero kernel witness therefore gives no bound for the complexity of the primitive kernel generator `(g_0,-f_0)`.

A basis of (2) can be written as the generator times `1,t,...,t^{r-1}`, but this is useful only after the generator has been obtained. Listing the `r` root witnesses and certifying their pairwise distinctness uses at least `r` field coordinates; `r` can be exponential in the supplied circuit length. Describing all roots by the two equations in (3) avoids that list but does not perform a trace over them.

## 3. The needed logarithmic derivative is still an aggregate

For squarefree `R`, the desired rational function is

```math
\frac{R'(z)}{R(z)}
 =\sum_{\alpha:R(\alpha)=0}\frac1{z-\alpha}
 =\mathop{\mathrm{Tr}}_{K[t]/(R)/K}
                           \bigl((z-t)^{-1}\bigr).       \tag{5}
```

The trace notation is the matrix trace of multiplication by the displayed element in the `r`-dimensional quotient algebra. Formula (3) identifies the support of that algebra, and (4) gives a short witness for any one point. Neither supplies (5). Generic local jets of one root are also insufficient: they concern one term in the sum.

In the resultant application, computing bounded Taylor jets of (5) uniformly cheaply would suffice by the integration argument in [RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md), Section 6. Knowing the integer `r`, even in binary or as a free scalar constant, does not determine these reciprocal traces.

The formal map `(u,v)->fu+gv` has a short circuit when its inputs are themselves represented by circuits. That is different from a coefficient-vector linear operator with cheap arbitrary entries and an efficiently accessible full basis. For example, the short polynomial `K_m(X,t)` in [RATIONAL_EXACTNESS_BARRIER.md](RATIONAL_EXACTNESS_BARRIER.md), Section 2, has the permanent as one of its middle coefficients. Thus a small polynomial circuit does not automatically give polynomial-size arithmetic circuits for its arbitrary Sylvester-matrix entries.

### 3.1. The uniform double-pole case is an exact two-gcd quotient

Let `H=N/D in K(t)` be proper, with `D!=0`. The numerator and denominator are supplied without any coprimality promise. Assume that every finite pole has order at most two and that the coefficient of `(t-alpha)^{-2}` at every double pole is `-1`. Define the monic gcds over `K[t]`

```math
E=\gcd(D,D'),
\qquad F=\gcd(N,D,D'),
\qquad R=E/F.                                   \tag{5a}
```

The convention includes constant denominators and zero numerators. For any irreducible factor `p` of `D`, write `d=ord_p D` and `n=ord_p N`. Characteristic zero gives `ord_p D'=d-1`, and therefore

```math
\mathop{\mathrm{ord}}_p R
 =(d-1)-\min(n,d-1)
 =\max(d-n-1,0).                                \tag{5b}
```

For factors not dividing `D`, the order in both gcds is zero. The pole-order hypothesis makes (5b) equal to one exactly at the double-pole factors and zero everywhere else. Thus `R` is precisely the squarefree product of the double-pole support, even when the supplied `N,D` have arbitrarily large common multiplicities.

Partial fractions now give the proper Hermite part exactly as

```math
J=\frac{R'}R=\frac{E'}E-\frac{F'}F.              \tag{5c}
```

Its derivative has double-pole coefficient `-1` at precisely those points; subtracting it from `H` leaves only simple finite poles. Uniqueness of the proper Hermite part proves (5c).

The formula performs no reduced-denominator extraction before the gcds. Forming `D'` has linear arithmetic-circuit overhead, but computing the two high-degree gcds is still the unproved operation. If circuits for `E,F` of polynomial size in the original parameter variables were supplied, (5c) would have a polynomial-size rational circuit. Treating their coefficients as arbitrary elements of `K` is not a charged construction over `C` when `K=C(A)`. Alternatively, multivariate gcds in `C[A,t]` can be used: any extra factors depending only on `A` disappear after the logarithmic derivative in `t`.

For bounded jets, normalized degree-`(D_0+1)` jets of those two gcds at a common generic center would suffice for the degree-`D_0` jet of (5c). Differentiate once and use finite truncated inverses. This has polynomial overhead in `D_0` and the two jet circuit sizes. Moving generic centers to a point where the combined target is holomorphic is justified by the same finite-dimensional border-closure argument used in the earlier jet notes. This is a sufficient gcd-jet primitive, not a proof of it.

The marked function `H_k` in [RESIDUE_RESOLVENT_FRONTIER.md](RESIDUE_RESOLVENT_FRONTIER.md), Sections 5--5.1, satisfies these hypotheses for a nonlinear irreducible target and a generic direction: its normalized double-pole coefficient is `-1`, and every other finite pole is simple. Clearing its rational circuit gives the supplied `N,D` at polynomial cost. Equations (5a)--(5c) identify the remaining gcd operation without assuming that this clearing has already reduced the fraction.

The broader constant-double-coefficient class contains an even simpler gcd construction. For any squarefree `f,g in K[t]`, put

```math
H=-\frac{f'}f\frac{g'}g.
```

At a common root, each logarithmic derivative has principal part `1/(t-alpha)`, so `H` has double-pole coefficient `-1`. At a root belonging only to `f`, the second logarithmic derivative is regular, giving at most a simple pole; the case of a root only of `g` is the same. There are no other finite poles, and `H=O(t^{-2})` at infinity. Its proper Hermite part is therefore `(gcd(f,g))'/gcd(f,g)`. Constant polynomials cause no exception: their logarithmic derivatives vanish. This construction has linear shared circuit overhead in the circuits for `f,g`. It concerns the broader uniform-double-pole class; it is not asserted to equal the particular rational expression `H_k` used for a marked resultant.

There is also a converse scope test with the constant marker `k=2`. Suppose `f,g in C[A]` are squarefree circuit polynomials and their gcd is a nonlinear irreducible polynomial `R`. Then `W=fg` has multiplicity two exactly at `R`, and multiplicity one at every other irreducible factor. Choose a constant line direction generic for the leading forms and for the order-one conclusion of the cited Section 5.1. Substituting `A+tv` preserves the distinct factors over `C(A)[t]`. The rational function `H_2` constructed from this `W` has size polynomial in the circuits for `f,g` and the number of variables, and its proper Hermite part is

```math
\frac{\partial_t R(A+tv)}{R(A+tv)}.              \tag{5d}
```

Thus even the constant-marker, uniform-double-coefficient family includes generic logarithmic-derivative extraction for the common divisor of two squarefree circuit polynomials. This is an exact reduction, not a lower bound for that gcd problem. It does not assert that every such pair has the full saturated accepting-path presentation of the HN application.

## 4. A fixed-kernel counterexample for general compressed matrix circuits

We now make the distinction about representations exact. Let `m>=2`, `D=2^m`, and let `C_D` be the cyclic shift on the basis `e_0,...,e_{D-1}`:

```math
C_D e_j=e_{j+1\bmod D}.
```

Let `E=e_0e_0^T`. The dimension, cyclic shift, identity matrix, and this one-coordinate projector have descriptions of size polynomial in `m`; their entries are specified by elementary tests on binary indices. Matrix-circuit gates in the construction below are counted as gates in a *compressed description*. An operation on an actual `D` by `D` matrix is not being assigned unit BSS arithmetic cost.

Use the polynomial `H_m(X,t)` defined and proved in [HERMITE_PART_OBSTRUCTION.md](HERMITE_PART_OBSTRUCTION.md), Section 1. It has an `O(m^2)`-gate circuit and satisfies

```math
\sum_{\alpha^D=1}H_m(X,\alpha)
                =\mathop{\mathrm{per}}_m(X).     \tag{6}
```

Substitute `C_D` for `t` and each scalar for its scalar multiple of the identity. This gives an `O(m^2)`-gate compressed matrix circuit for `H_m(X,C_D)`. Since `(C_D^j)_{00}` equals one when `D` divides `j` and zero otherwise, the elementary roots-of-unity filter gives

```math
\bigl(H_m(X,C_D)\bigr)_{00}
 =\frac1D\sum_{\alpha^D=1}H_m(X,\alpha)
 =\frac1D\mathop{\mathrm{per}}_m(X).             \tag{7}
```

For an additional input `y`, define

```math
\mathcal B_m(X,y)
 =I_D+E\bigl(DH_m(X,C_D)-(y+1)I_D\bigr).          \tag{8}
```

This matrix is the identity except in row zero. Its `(0,0)` entry is `per_m(X)-y`. Expansion along the remaining identity rows proves

```math
\det\mathcal B_m(X,y)=\mathop{\mathrm{per}}_m(X)-y.
                                                        \tag{9}
```

The same row structure gives the exact kernel statement

```math
\ker\mathcal B_m(X,y)=
\begin{cases}
\{0\},&y\ne\mathop{\mathrm{per}}_m(X),\\
\mathbb C e_0,&y=\mathop{\mathrm{per}}_m(X).
\end{cases}                                     \tag{10}
```

Thus every singular instance has the same known, one-dimensional kernel with a trivial compressed vector description. Nevertheless, verifying the equation `B_m e_0=0` requires exactly the aggregate entry (7).

If arbitrary matrices with such compressed descriptions admitted polynomial-size existential HN incidences for singularity, composing that construction with (8) would give a polynomial-size existential presentation of the permanent graph. The reviewed singular-witness theorem and the pinned permanent border lower bound exclude this. The statement remains true with arbitrary complex constants and nonuniform incidences.

In particular, a small implicit operator description plus a short rank-deficiency witness is not a sufficient complexity bound for an HN verification construction. One must also prove that its action, coefficient constraints, and independence conditions have the claimed small scalar representation. The example puts the hardness in the verification of the operator action, even though the nullvector is known in advance.

### 4.1. A canonical Sylvester inverse has a hard first deformation jet

There is also a cost obstruction specific to polynomial modular inversion. Keep `D=2^m` and the same homogeneous degree-`m` observable `H_m(X,t)`, and introduce an independent parameter `epsilon`. Define

```math
q(t)=t^D-z,
\qquad g(t)=1-\epsilon H_m(X,t).                 \tag{11}
```

The shared scalar circuit size is `O(m^2)`, and both logarithmic degrees are `O(m^2)`. Work first over `K=C(X,z,epsilon)`.

The polynomials are generically squarefree and coprime. The polynomial `q` is squarefree because `z!=0` in this field. Its roots are algebraic over `C(X,z)`, so no root can satisfy `epsilon H_m(alpha)=1` when `epsilon` is transcendental over that field. This proves coprimality. A repeated root of `g` would also be a root of the nonzero polynomial `partial_t H_m`. Such a root is algebraic over `C(X,z)`, and again the equation `epsilon H_m(alpha)=1` is impossible. Thus `g` is squarefree as well.

Let `v(X,z,epsilon,t)` be the unique polynomial of degree less than `D` satisfying

```math
g(t)v(t)\equiv1\pmod{q(t)}.                     \tag{12}
```

This is the canonical modular inverse. Together with the uniquely determined coefficient of `q`, it is a canonical bounded-degree Bezout solution and a column of the inverse Sylvester operator for the coprime pair (11).

The monic quotient algebra

```math
\mathcal A=\mathbb C[X,z][t]/(t^D-z)
```

is free of rank `D` with basis `1,t,...,t^{D-1}`. Multiplication by `g` in that basis is the matrix `I-epsilon M_H`. Its determinant has constant term one in `epsilon`. Hence its inverse, and therefore the canonical polynomial `v`, is regular at `epsilon=0` and has the formal expansion

```math
v=1+\epsilon r(X,z,t)+O(\epsilon^2),
\qquad r=\mathop{\mathrm{rem}}_{t^D-z}H_m,
\qquad \deg_t r<D.                              \tag{13}
```

This identity is a computation in a finite free algebra, not an assertion that its `D` coefficients have been computed cheaply. At `z=1`, the remainder and the original observable agree at every `D`-th root of unity. Summing those values and using `deg_t r<D` gives

```math
[\epsilon]v(X,1,\epsilon,0)
=r(X,1,0)
=\frac1D\mathop{\mathrm{per}}_m(X).             \tag{14}
```

The regularity is stronger than a merely formal assertion over a function field. The multiplication matrix has entries polynomial in `X,z,epsilon`, and its determinant equals one at `epsilon=0`. Thus its rational inverse is holomorphic near every finite point of that locus. In particular this applies at

```math
(X,z,\epsilon,t)=(0,1,0,0).
```

Every coefficient of `epsilon^j` in the canonical inverse is homogeneous of degree `jm` in `X`, because the formal inverse is the sum of the classes of `epsilon^j H_m^j` and reduction modulo the monic `q` does not alter the matrix-variable degree. Consequently the total degree-`(m+1)` Taylor polynomial at that center is exactly

```math
J^{m+1}v
 =1+\frac{\epsilon}{D}\mathop{\mathrm{per}}_m(X).
                                                        \tag{15}
```

Terms with `j>=2` have total degree at least `2m+2`. Within the first-order term, any positive power of `z-1` or `t` also exceeds the cutoff. This proves (15) without extracting an exponentially indexed coefficient.

If a rational circuit of size `L` computed this canonical inverse, its finite Taylor jets at generic nearby centers would have polynomial circuit size in `L,m`. Each circuit denominator has nonzero constant term at a common generic center, so the usual finite truncated inverses apply. Move those centers to `(0,1,0,0)`; the output is holomorphic there, and the fixed-degree border class is closed. This handles possible intermediate-denominator basepoints in the supplied circuit. Equation (15), followed by the substitution `epsilon=1`, subtraction of one, and multiplication by the allowed scalar `D`, would then give

```math
\overline L(\mathop{\mathrm{per}}_m)
          \le\mathop{\mathrm{poly}}(L,m).         \tag{16}
```

The pinned permanent lower bound therefore rules out a general degree-independent polynomial scalar-circuit bound for these canonical modular inverses, and even for their indicated low-order jets. The input pair is squarefree and coprime and the inverse is regular at the deformation center. A formal small description of the Sylvester pencil or multiplication operator does not make this inverse cheap.

The reviewed jet lemma in [SINGULAR_WITNESS.md](SINGULAR_WITNESS.md) also excludes a polynomial-size closed existential presentation of the graph of this canonical inverse value. Such a presentation would give polynomial border circuits for its degree-`(m+1)` jets at generic centers. Moving them to the holomorphic center in (15) would give the same contradiction. This conclusion concerns an actual graph incidence; it does not replace an unproved closure or regularity predicate by existential equations.

Here the gcd itself is exactly one. The example does not refute a degree-independent method for extracting gcds or the particular marked factor needed in the HN attack. It rules out using unrestricted implicit modular inversion as a polynomial-cost intermediate operation in that method.

## 5. Exact limit of this test

The matrices (8) are not asserted to be Sylvester matrices. Their purpose is to refute a general shortcut from compressed linear algebra to polynomial-size HN equations. The special Sylvester singularity test is in HN by (3), but that test supplies a common root, whereas (5) requires the whole common-factor aggregate.

An explicit finite-dimensional Sylvester computation uses a space of dimension `a+b`, and its full common-root quotient has dimension `r`. Both may be exponential. A proposal avoiding those spaces must replace them with actual bounded-size equations that still select (5); giving only the operator formula, one generic nullvector, or an unproved compact kernel basis does not do so.

No degree-independent gcd-jet theorem or short regularity predicate for (5) is proved here. A construction specialized to the marked resultant remains possible. If it uses a closure or regularity operation stronger than an existential HN incidence, that operation and its complexity must be specified separately; the counterexample does not silently identify such operations with HN.
