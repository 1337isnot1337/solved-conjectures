# Signed multiplicities from a short rational map

Research checkpoint, 23 November 2026. Two derivatives give a rational function whose regular value at a zero or pole is its signed multiplicity. This exact identity can distinguish the resultant poles in the one-equation pure-pole presentation. Reading the regular values from cleared circuit equations still requires removal of vertical components; no degree-independent certificate for that step is proved.

## 1. A rational multiplicity function

Let `K` be a characteristic-zero field and let `F(t)` be a nonconstant element of `K(t)`. Put

```math
\omega(t)=\frac{F'(t)}{F(t)},
\qquad
\mu(t)=-\frac{\omega(t)^2}{\omega'(t)}
=\frac{F'(t)^2}{F'(t)^2-F(t)F''(t)}.              \tag{1}
```

The denominator in the rational expression for `mu` is not identically zero. Indeed, `omega'=0` would make `omega` constant; a rational logarithmic derivative tends to zero at infinity, so that constant would be zero and `F` would be constant. A shared rational circuit for `F` of size `s` gives one for `omega,mu` of size `O(s)` by differentiating each gate twice with the usual sum, product, and quotient rules. All these rational computations are charged.

Let `alpha` be a finite zero or pole of `F` over an algebraic closure of `K`, and let

```math
m=\mathop{\mathrm{ord}}_\alpha F\in\mathbb Z\setminus\{0\}.
```

In the local parameter `v=t-alpha`, write `F=v^m u(v)` with `u(0)!=0`. Then

```math
\omega=\frac m v+h(v),
\qquad
\omega'=-\frac m{v^2}+h'(v),
\qquad h=u'/u.
```

Consequently

```math
\mu=
\frac{m^2+2mv h(v)+v^2h(v)^2}{m-v^2h'(v)}.
```

The denominator has nonzero constant term `m`. Thus `mu` extends regularly to `alpha` and

```math
\mu(\alpha)=m.                                    \tag{2}
```

This remains true when `|m|` is exponentially large in the supplied circuit size. The rational identity uses two derivatives, rather than a derivative of order `|m|`.

## 2. A rational fixed-point map separates poles from zeros

Suppose

```math
F(t)=\frac{H(t)}{R(t)^e},
\qquad e\ge1,\qquad \gcd(H,R)=1,
```

and `R` is squarefree. This applies to a generic line through the coefficient space in the pure-pole construction of [SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md), Section 2.

Define

```math
\nu(t)=\frac1{\omega(t)},
\qquad
\psi(t)=t+e\nu(t).                                \tag{3}
```

At a zero or pole of signed order `m`, the function `nu` extends regularly and has expansion `v/m+O(v^2)`. Hence that point is a fixed point of the rational map `psi`, with multiplier

```math
\psi'(\alpha)=1+\frac e m.                        \tag{4}
```

Every root of `R` has `m=-e` and multiplier zero. Every root of `H` has `m>0` and multiplier `1+e/m`, which is a real number greater than one. Among finite points, the fixed points of `psi` are precisely the finite zeros and poles of `F`: away from poles of `omega`, the rational function `1/omega` cannot vanish.

In terms of rational functions, the derivative relation is

```math
\psi'=1+\frac e\mu.
```

Thus the common conditions `nu=0` and `psi'=0`, interpreted on their regular graphs, select exactly the finite roots of `R`. This is a support characterization, not an algorithm for computing the sum or product of those roots. It also makes no claim about a possible fixed point at infinity.

## 3. Cleared equations do not certify the regular value

The regular extension in (2) cannot be read from the raw graph equation without a further argument. Take

```math
F(t)=t^M,\qquad M=2^r\ge2.
```

It has an `O(r)`-gate circuit. Equation (1) says `mu=M` as a rational function, but clearing its displayed denominator gives

```math
\mu\bigl(F'^2-FF''\bigr)-F'^2
=M t^{2M-2}(\mu-M)=0.                             \tag{5}
```

At `t=0`, every value of `mu` satisfies (5), including negative integers. The true regular graph is the component `mu=M`; the vertical component `t=0` is spurious for value certification. Adding Boolean witnesses that encode a signed integer value does not remove that component. Its multiplicity is exponential in the circuit length.

The same issue affects the fixed-point characterization after inserting unreduced rational circuit expressions and clearing their denominators. On the actual regular graphs the identities are exact. A proposed small incidence must enforce those graphs, rather than only their unsaturated cleared equations.

For this pointwise regular-graph route, both obtaining the required regular graph and aggregating the selected roots remain open. The radical-jet route is different: if its primitive were proved, the four-radical identity would already supply the needed aggregate. The finite-cluster reciprocal-trace example in [RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md](RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md) shows why a separate low-order degeneration argument is needed when the pointwise route instead sums selected pole clusters. It does not refute a resultant-specific resolution of these operations.
