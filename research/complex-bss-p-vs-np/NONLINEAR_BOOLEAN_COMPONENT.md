# A nonlinear Boolean template whose singular component needs every original equation

Status: an elementary exact counterexample to equation-subset compression. It does not refute the existence of small Boolean potentials, and it does not show that arbitrary linear combinations of the equations are hard. No novelty claim is made.

The linear-template argument selects only polynomially many Boolean equations because a linear system has a small row basis. Low parameter dimension alone does not justify the same step for nonlinear certificate circuits.

## 1. Two parameters and exponentially many essential equations

Let `N=2^m`, choose a primitive `N`th root of unity `omega`, and let `b=(b_0,...,b_(m-1))` be Boolean. Define

```math
\zeta_b=\prod_{j=0}^{m-1}\bigl(1-b_j+b_j\omega^{2^j}\bigr).
```

As `b` ranges over the cube, `zeta_b` ranges over every `N`th root of unity exactly once. With two scalar parameters `u,v`, define the polynomial family

```math
f_b(u,v)=\prod_{k=0}^{m-1}
\left(u^{2^k}+(\zeta_bv)^{2^k}\right).                 \tag{1}
```

The joint circuit in `(b,u,v)` has size `O(m)`: compute `zeta_b`, repeatedly square `u` and `zeta_b v`, and multiply the displayed factors. It uses only `O(m)` scalar constants. Its degree in `(u,v)` is `N-1`, which is exponential in its circuit size.

The difference-of-squares identity gives, for Boolean `b`,

```math
(u-\zeta_bv)f_b(u,v)
=u^N-(\zeta_bv)^N=u^N-v^N.
```

Consequently

```math
f_b(u,v)=\prod_{c\in\{0,1\}^m,\ c\ne b}(u-\zeta_cv).
                                                               \tag{2}
```

The common zero set of all `N` polynomials is exactly the origin. If `v=0`, any equation forces `u=0`. If `v!=0`, a common zero must have `u/v` equal to an `N`th root of unity, but the equation indexed by that root does not vanish there.

On the other hand, every proper subset of the equations has a positive-dimensional common zero set. If the equation with index `c` is omitted, the entire line

```math
u=\zeta_cv
```

satisfies every remaining equation. Thus no proper subset retains the origin as an irreducible component. This remains true after localizing at the origin: all the omitted root lines pass through it.

## 2. Embedding in the actual Boolean-potential residual

Add one Boolean coordinate `s`, take the zero matrix of size `m+1`, and take its true claimed permanent `y=0`. Its Ryser residual is identically zero. Use just one nonzero potential:

```math
Q_s(b,s)=s f_b(u,v),\qquad Q_i=0\quad(i\ne s).
```

The residual of the Boolean divergence equation is

```math
-\bigl(Q_s(b,s)-Q_s(b,1-s)\bigr)
=-(2s-1)f_b(u,v).
```

Therefore this `O(m)`-size nonlinear potential template is valid exactly at the parameter point `u=v=0`. Its Boolean verification equations are the `N` polynomials in (1), each repeated with two signs. To retain the isolated valid parameter component by selecting original Boolean equations, one must select at least one equation for every `b`, hence at least `2^m` equations.

The matrix instance itself has trivial zero potentials. The point of the example is the local component geometry of this nonlinear template, not hardness of that matrix instance.

## 3. Exact scope of the obstruction

This example defeats the inference “there are only two unknown scalar parameters, so a constant or polynomial number of the original Boolean constraints isolate every relevant component.” It also defeats an argument that selects independent Jacobian rows at the origin: for `m>=2`, every equation has degree at least three and every first derivative vanishes there.

It does not defeat generic linear combinations of all equations. Such combinations may remove all unwanted lines, and in this particular root-of-unity family some sums have simple expressions. The issue is that their small circuit complexity does not follow from parameter dimension or prime avoidance alone. Computing an arbitrary combination of exponentially many circuit evaluations is a separate operation which must be justified.

The example is consistent with the bounded-parameter-monomial obstruction: each `f_b` has `N` monomials in `u,v` and exponential parameter degree. Its short circuit exploits that high degree. Any attempted extension from linear or bounded-degree parameter templates to unrestricted arithmetic circuits must address this phenomenon.

The later `CRITICAL_INCIDENCE_BARRIER.md` does address it for the permanent residual conservation scheme by adding new derivative equations with a normalized output covector. It does not select a small original defining subsystem. Thus this counterexample remains valid and is consistent with that stronger obstruction to small potentials.
