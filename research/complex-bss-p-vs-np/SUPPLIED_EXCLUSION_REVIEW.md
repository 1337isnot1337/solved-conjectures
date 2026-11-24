# Independent review of the supplied-exclusion extraction

Research review, 23 November 2026 (America/Chicago). Read the full current
[`SUPPLIED_EXCLUSION_SIMPLE_POLES.md`](SUPPLIED_EXCLUSION_SIMPLE_POLES.md).
The mathematical statements and their stated scope pass. This is an
internal written review, not formal verification or a novelty claim.

## Simple poles and the localized remainder

Under `P=R^e Q`, `gcd(R,G)=1`, and `rad(Q)|G`, writing
`Q=c product q_j^{m_j}` gives

```math
G\frac{\partial_vQ}{Q}
=\sum_j m_j(G/q_j)\partial_vq_j.
```

Every summand is polynomial, and every nonzero summand has total degree
at most `deg G-1`. The use of the abstract factorization proves the
identity without claiming that the factors were computed.

If `partial_v R` is nonzero, its degree is below `deg R`; irreducibility
therefore prevents `R` from dividing it. Since `R` also does not divide
`G`, the surviving summand `eG partial_vR/R` has exactly one divisorial
pole along `R` and no cancellation by the polynomial remainder. Circuit
differentiation has the claimed linear shared overhead. The hypothesis
is correctly restricted to the special one-equality presentation and
is not inferred for an arbitrary combination of several path tests.

Choose a direction avoiding the leading forms of the finitely many
factors of `RG`. For each factor, the translated polynomial in `C[a,t]`
has nonzero constant leading coefficient in `t`, and is primitive over
`C[a]`. Translation preserves irreducibility. Gauss's lemma then gives
irreducibility over `C(a)[t]`, and distinct factors stay distinct: an
association over the function field would already have constant
proportionality by their leading coefficients. Thus the line transfer
preserves the required coprimality and squarefreeness of `r`.

In the localized ring consisting of fractions whose reduced denominator
is coprime to `g`, the rational function `B` has representation
`e g r'/r+T`. Its first summand is a multiple of `g` in that ring.
Consequently its residue modulo `g` is `T`. The degree bound
`deg_t T<deg_t g` gives the asserted unique representative. This does
not justify evaluating the original quotient gates at roots of `g`;
the note explicitly distinguishes the rational function from that
possibly undefined presentation.

When `g` is squarefree, expanding at an exclusion root `beta` gives
`T(beta)=m_beta g'(beta)`. This includes unused exclusion roots, where
`m_beta=0`. The values are fixed nonnegative integer multiplicities and
are constant on the conjugate roots of each irreducible exclusion
factor. The note makes no unsupported inference from their short binary
representations to a short circuit for their interpolating polynomial.

## The supplied factor list and finite jets

A complete supplied list of distinct irreducible factors of `G` yields
`Q=c product g_i^{m_i}`. All multiplicities and the target exponent are
bounded by `deg P`; treating them as nonuniform scalar constants is
permitted in the asserted arithmetic-circuit model. Their computation
from the input is not assumed.

At an allowed center, normalize every polynomial by its nonzero value.
All resulting units have constant term one. In the finite truncated
power-series ring, the logarithm is additive on their products, so the
displayed subtraction leaves exactly `log(R/R(b))`. The finite
exponential recovers its normalized jet. Large multiplicities enter only
as scalar multipliers, with no expansion of those powers.

There are `D+1` homogeneous coefficient circuits at each input gate.
Their convolution costs `O((D+1)^2)` per arithmetic gate. Computing the
`D` powers in each finite logarithm and in the final exponential costs
`O((D+1)^3)` per series. Summing the factor logarithms therefore gives the
stated safe bound

```math
C(s+\sigma+n+r+1)(D+1)^3.
```

For a target center `a` with `R(a)!=0`, the allowed centers are dense and
can tend to `a`. The fixed-degree normalized jets converge coefficientwise
because the target normalization remains nonzero. Border closure then
handles vanishing exclusion factors at `a`. Taking this limit in the
full coefficient space before the BCJS pullback avoids the previously
identified zero-cofactor-specialization gap.

The irreducible-exclusion case is exactly `Q=cG^m`; a constant exclusion
gives constant `Q`. These are complete positive extraction cases. The
general case still asks for the specific localized remainder with the
integer multiplicity profile. Neither the identities nor the supplied
factor-list case constructs it at polynomial cost. The comparison with
the separate canonical modular-inverse counterexample is correctly
limited: that example does not have this integer profile.

The application to a hypothetical HN decider is conditional on the
decider supplying this special presentation and, when needed, the
complete small factor list. No general HN decider is asserted to satisfy
either property. The full BSS separation remains unresolved.
