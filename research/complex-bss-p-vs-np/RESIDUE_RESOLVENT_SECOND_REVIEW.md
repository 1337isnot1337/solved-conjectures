# Independent review of the marked-residue formulas

Research review, 23 November 2026 (America/Chicago). Read the complete current
[`RESIDUE_RESOLVENT_FRONTIER.md`](RESIDUE_RESOLVENT_FRONTIER.md),
including the new Section 5.1. No mathematical defect found. This review
checks the stated identities and conditional extraction, not a missing
polynomial bound for the aggregate operation. It is not formal verification.

## Resultant ratio and its limits

The generic-direction substitution preserves irreducibility and the
constant leading coefficient makes each line factor primitive over the
coefficient ring. Thus distinct irreducible factors stay distinct over the
rational function field, with the original multiplicities. The denominator
resultant is nonzero for transcendental `delta`, since a zero of the fixed
nonzero `B_0` has algebraic `w`-value. The monic resultant product formula
cancels every factor `B_0(beta)` exactly.

The local identity `mu(alpha)=m_alpha` after removable cancellation proves
the `delta -> 0` limit. Monicity prevents roots escaping to infinity. The
factor formula

```math
s^{\deg p}\widehat p\left(A,u+\frac{z-m_p}{s}\right)
```

also proves that the limit is a polynomial without making choices of roots.
At `z=k`, its first nonzero `s`-coefficient is exactly the stated nonzero
constant times `widehat R^k`. All other factors contribute nonzero constants
at `s=0` because their multiplicities differ from `k`.

For a hypothetical small rational circuit for the ratio, fixed-degree jets
at generic centers allow ordinary scalar-inverse division elimination.
Taking the finite-dimensional limits in the stated order, followed by the
finite binomial root expansion at a center with `R!=0`, is valid. It does
not establish a small circuit for the ratio: the conventional resultant
matrix still has dimension proportional to the potentially exponential
degree.

## The marked Hermite part

At a marked root, `omega=k/v+h(v)` and
`mu'/(mu-k)=q/v+g(v)`, so the double-pole coefficient of `H_k` is `-q`.
At an unmarked root, `mu-k` is a nonzero regular function; at other zeros or
poles of `mu-k`, the logarithmic derivative has at most a simple pole while
`omega` is regular. These cases account for all finite poles. Both factors
in `H_k` are `O(1/t)` at infinity.

The proper Hermite part is consequently `q r'/r`, with the positive sign
shown in the note. Irreducibility in characteristic zero makes `q` the
same at all roots of the marked factor. The exceptional identity `mu=k`
indeed implies `(1/omega)'=1/k` and `w=c(t-a)^k`.

## The new generic-direction assertion

Writing `a=partial_v R`, `b=partial_v^2 R`, and
`lambda=(partial_v h)/h`, direct expansion gives

```math
\omega=\frac{ka}{R}+\lambda,
\qquad
\mu
=\frac{k^2a^2+2ka\lambda R+\lambda^2R^2}
       {ka^2-kbR-(\partial_v\lambda)R^2}.
```

Its first-order term is therefore exactly

```math
\mu-k\equiv
R\,\frac{k h\,\partial_v^2R+
              2(\partial_vR)(\partial_vh)}
             {h(\partial_vR)^2}
\pmod {R^2}.
```

If the numerator vanished modulo `R` for every constant direction, choose
any smooth point of `R=0` with `h!=0` and any tangent vector at that point.
The first derivative of `R` vanishes there, so the tangent quadratic form
of the Hessian vanishes. Polarization yields the bilinear tangent Hessian
identity. The local implicit-function calculation in the note then makes
every second derivative of the graphing function zero. Its graph is an
open subset of an affine hyperplane. The polynomial `R` vanishes on that
whole hyperplane, and irreducibility forces `R` to be linear. This
contradicts the nonlinear hypothesis.

The nonvanishing condition is a nonempty Zariski open condition on the
direction: the relevant numerator is a quadratic polynomial in the
direction with coefficients in the fixed quotient ring. It can be
intersected with the nonempty open condition `partial_v R!=0` modulo `R`.

For the family based at `b`, the change of variables `v=A-b` is invertible
over `C[A]`, so the nonzero residue class remains nonzero as a polynomial in
`b`. A generic constant `b` preserves it and can also satisfy `W(b)!=0`.
After `A=b+tY`, localization at `t` is legitimate on the marked factor
because `R(b)!=0`. The quadratic homogeneity in the direction gives
`T_Y=t^-2 T_(A-b)`. Hence the generic marked order is exactly `q=1` also
in this radial line family. No claim about every direction or every center
is needed.

## Conditional jet recovery and scope

In the radial family, `R(b+tY)/R(b)` has a nonzero constant term. The
coefficient of `t^j` in its logarithmic derivative is homogeneous of
degree `j+1` in `Y`. Therefore the total degree-`(2D-1)` jet contains every
coefficient needed through `t^(D-1)`. Interpolation in `t`, integration,
and the truncated exponential recover the normalized degree-`D` jet with
polynomial overhead. Generic nearby centers resolve displayed circuit
basepoints, since the target function is holomorphic at `(Y,t)=(0,0)`.

The remaining premise is a short circuit for this particular aggregate
Hermite part, or for the indicated resultant ratio. An HN zero test does
not supply either value. The independent general Hermite counterexample
reviewed in [`HERMITE_PART_REVIEW.md`](HERMITE_PART_REVIEW.md) does not refute
this restricted premise: its double-pole coefficients vary with a weighted
observable instead of being one common integer on the marked factor.
