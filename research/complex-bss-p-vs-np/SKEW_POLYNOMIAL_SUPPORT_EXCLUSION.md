# Polynomial distinct-root support is excluded in the skew certificate

Status: continuation of the reviewed invariant-fiber attempt. The direct root-factorization witnesses were proposed by the alternate-PH worker after the weighted-protocol worker identified the bounded-support consequence. This proof uses no radical-computation or factoring algorithm. It supplies exact witness and identity-family counts for independent review.

## 1. Hypothesis and notation

Use the skew certificate of SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md. Put D=2^m, let zeta be an existential primitive D-th root of unity, and define

```math
h(t)=H_X(t)-y/D.
```

At every root t of t^D=1, a valid certificate P_c(t,g) has a finite nonempty root set S_t and satisfies S_t+h(t) subset S_(zeta t).

Let the shared division-free universal template for P have p scalar parameters c and actual arithmetic gate count U. The g-degree of every specialization is at most 2^U. This counts the actual expanded template gates, not a claimed degree of the certificate supplied to it.

Assume that every true numerical instance has such a certificate of polynomial circuit size and, in addition, every one of its root-of-unity fibers has at most d distinct roots, where d is polynomially bounded. No bound is imposed on root multiplicities apart from the automatic formal-degree bound. Then the finite-block KKT theorem excludes this complete family under the imported permanent border lower bound.

## 2. Local factorization witnesses

Cyclic inclusions imply equal support cardinalities, hence support bijections. At a fixed root t put

```math
A(g)=P_c(t,g),\qquad
B(g)=P_c(\zeta t,g+h(t)).
```

They have the same nonempty root support, with possibly different and nonproportional multiplicities.

Supply d local root values r_i, two nonzero leading scalars alpha,beta, and binary expansions

```math
a_i=\sum_{j=0}^{U}2^j e_{ij},\qquad
b_i=\sum_{j=0}^{U}2^j f_{ij}.
```

Require every e_ij and f_ij to be zero or one. For each i require a_i=0 if and only if b_i=0, which can equivalently be tested using the zero/nonzero status of the sums of the corresponding bits. Require at least one active index. All exponents are then nonnegative integers, and active exponents are positive.

The two identities to verify are

```math
A(g)=\alpha\prod_{i=1}^{d}(g-r_i)^{a_i},
\qquad
B(g)=\beta\prod_{i=1}^{d}(g-r_i)^{b_i}.             \tag{1}
```

For a true certificate, enumerate its at most d distinct common roots, use their actual multiplicities, and pad with inactive slots. Each actual multiplicity is at most 2^U, so U+1 bits suffice. The leading coefficients supply nonzero alpha,beta.

Conversely, exact identities (1), nonzero leading scalars, and matching active indices imply that A and B are nonzero polynomials with equal finite nonempty root supports. Repeated active root values do not invalidate soundness: each support is the union of r_i over active indices. Thus these tests imply the original skew inclusion. There is no need to verify that the supplied active roots are distinct.

No separate root and nonzero witnesses u,v are needed. The products, nonzero leading scalars, and existence of an active factor establish both properties directly.

The local complex witness dimension is exactly

```math
q_{\mathrm{loc}}=d+2d(U+1)+2=d(2U+3)+2.                \tag{2}
```

The three summands count root coordinates, exponent bits, and leading scalars.

## 3. Exponentiation and arithmetic costs

For a bit tuple e_0,...,e_U use the polynomial circuit

```math
\mathop{\mathrm{Pow}}(Z;e)=
\prod_{j=0}^{U}(1-e_j+e_j Z^{2^j}).                \tag{3}
```

When the bits are valid, it equals Z to their encoded exponent. The powers Z^(2^j) use U squarings. The selectors and product use O(U+1) more gates. Exponential degree introduces no exponential list of coefficients.

A safe explicit shared gate count for the two residuals in (1), as polynomials in a formal g, is

```math
S_{\mathrm{id}}\le
2U+V_m+d(9U+9)+4,                                \tag{4}
```

where V_m is the circuit cost of h(X,y,rho,t) using rho=zeta^(-1).

Here is one accounting. For each i, compute g-r_i once, its U squares shared by the a and b powers, all 2(U+1) selectors with three gates each, and the two U-product chains. This uses 1+U+6(U+1)+2U=9U+7 gates per root. Multiplying the d factors and their leading scalar on each side uses 2d further gates. The two evaluations of P use 2U gates; computing zeta*t and g+h takes two gates; subtracting the two factored expressions takes two more.

The root-of-unity digit recurrence gives, for example,

```math
V_m\le (5m^2+19m)/2
```

when 1/2 and 1/D are fixed scalar constants in this circuit count. This includes the powers rho^(2^j), the successive digit-extraction powers, all row sums and sign products in the Ryser kernel, and subtraction of y/D. Computing D and 1/D uniformly adds only O(m) BSS operations. A coarser O(m^2) bound suffices throughout.

## 4. One fixed hitting tuple for both identities

Introduce the shared scalar rho and verify zeta*rho=1. Using rho makes h polynomial in all its parameter coordinates.

For the two residual polynomial families, take the full parameter tuple

```math
\theta=
(X,y,\zeta,\rho,c,t,\alpha,\beta,
(r_i)_{i=1}^{d},
(e_{ij})_{i,j},(f_{ij})_{i,j}).
```

The parameter dimension is exactly

```math
M_*=m^2+p+6+d+2d(U+1)
   =m^2+p+6+d(2U+3).                             \tag{5}
```

The six scalar coordinates outside X,c and the local roots/bits are y,zeta,rho,t,alpha,beta. The t coordinate is included independently here even though the verifier will compute it from Boolean orbit bits. The identity-family proof is uniform over all these complex parameter values, including invalid exponent bits and false proposed inputs.

For either residual family F_theta(g), restrict to parameters for which it is not the zero polynomial. Its g-root set is finite. The constructible incidence of such a parameter together with ell simultaneous roots has dimension at most M_*. If ell=M_*+1, its projected closure in C^ell is proper. The union of the two proper bad-tuple closures is still proper. Choose one fixed tuple outside that union.

Consequently the two polynomial identities hold if and only if both residuals vanish at all

```math
\ell=M_*+1                                      \tag{6}
```

chosen scalars. No degree bound enters this hitting count. The tuple need not be effectively computable; it consists of ell allowed nonuniform complex constants. It is chosen once for the entire size-m verifier family, not separately for a numerical matrix or candidate certificate.

## 5. The finite-block verifier and its soundness

Shared existential witnesses are zeta,rho,c, of dimension p+2. The verifier checks the primitive-root tests and zeta*rho=1. A universal m-bit string selects t=zeta^a by repeated squaring and a product of bit-controlled powers. The local existential witnesses are exactly those in (2).

For that t the verifier checks the bit equations, matching active indices, at least one active index, nonzero alpha,beta, and the two identities at the ell fixed points. Its arithmetic cost is bounded by

```math
O\bigl(m+\ell S_{\mathrm{id}}+d(U+1)\bigr).            \tag{7}
```

The term for h may be shared across the ell evaluations; (7) is a safe bound even without that optimization. Every quantity is polynomial in m,p,U,d. The root-of-unity tests and rho relation ensure every used division is defined; the factorization circuit itself is division-free.

If this verifier accepts, the common hitting tuple makes both identities exact for every t in the root-of-unity orbit. Hence its fibers are finite and nonempty and satisfy the skew inclusion. Iteration around the orbit forces y=per_m(X). This proves soundness for all candidate parameters, without assuming the original certificate's support bound.

The polynomial support bound is used only for completeness: it supplies the d local roots and their binary multiplicities for each true fiber. Thus the hypothetical complete certificate family yields a nonuniform verifier of the excluded form

```math
\exists(\zeta,\rho,c)\quad
\forall b\in\{0,1\}^m\quad
\exists\text{ polynomially many local complex witnesses}.
```

The block-KKT theorem supplies polynomial border circuits for the permanent, contradicting the adopted lower bound.

## 6. Scope

This excludes a complete polynomial-size skew-certificate family whose number of distinct fiber roots is polynomially bounded, even when total degrees and multiplicities are exponential and the multiplicity vectors change nonproportionally.

It does not compute the roots, radicals, quotients, or their multiplicities. They are local existential data with explicit polynomial-size representations. It also does not treat exponentially many distinct roots as one bounded tuple. The remaining candidate needs superpolynomial support size as well as a multiplicity pattern outside the other reviewed identity reductions.

The low-radical-degree factor theorem of Dutta, Saxena, and Sinhababu would give another route through local quotient circuits, but it is unnecessary for this direct factorization argument and is not an imported assumption here. The only complexity transfer used is the separately reviewed finite-block KKT theorem and its stated analytic dependencies.
