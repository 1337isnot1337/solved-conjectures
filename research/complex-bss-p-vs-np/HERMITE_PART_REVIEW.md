# Independent review of the proper Hermite-part obstruction

Research review, 23 November 2026 (America/Chicago). Reviewed the complete current version of
[`HERMITE_PART_OBSTRUCTION.md`](HERMITE_PART_OBSTRUCTION.md).
No mathematical defect found. This is an independent written review, not a
formal verification or a claim about novelty. The conclusion uses the
repository's standing permanent border lower bound.

## 1. The observable and the degree accounting

At `t=zeta^a`, the recurrence removes the already read low binary digits of
`a`. Thus its `B_j` is precisely the `j`-th bit. The sign product is
`(-1)^(m-|S|)`, and inclusion-exclusion over subsets containing the image of a
row-to-column map leaves exactly the bijective maps. This proves the claimed
permanent trace for arbitrary complex matrices; no noncancellation assumption
is used.

The recurrence costs `O(m^2)` repeated squarings and arithmetic operations. If
`r_j=deg_t U_j`, then

```math
r_{j+1}\le r_j\bigl(1+2^{m-j-1}\bigr).
```

For `j<=m-1`, the bounds `1+2^k<=2^(k+1)` give
`max_j deg B_j <= 2^((m-1)(m+2)/2)`. There are `2m` factors in the displayed
observable, proving the safe bound on `h`. Its homogeneity of degree `m` in
the matrix entries is exact. The choice `K=2^(m^2+2m+2)` exceeds `h` and has
`O(m^2)` binary length. None of these degree bounds charge an exponential
power as a single arithmetic operation.

## 2. Properness and finite pole orders

For `q=t^D-z` and `a=1+q t^K`, the denominator degree of
`t^(D-1)H/(q^2 a)` is `3D+K`, while the numerator degree is `D-1+h`. The
resulting rational function is proper and is `O(t^-2)` at infinity.

The coprimality of `q` and `a` is immediate from `a=1` on `q=0`. At `z=1`,
a common zero of `a` and `a'` would have to be nonzero and satisfy

```math
t^D=\frac{K}{D+K},\qquad t^K=\frac{D+K}{D}.
```

The first equality forces `|t|<1`, and the second forces `|t|>1`. Hence `a`
is squarefree at that specialization and therefore squarefree over `C(z)`.
The added properness denominator contributes only simple poles. It cannot
alter the double-pole coefficients at the roots of `q`.

## 3. Hermite extraction, signs, and regular specialization

For a root `alpha` of `q`, the double-pole coefficient is

```math
c_\alpha
 =\frac{\alpha^{D-1}H(X,\alpha)}{D^2\alpha^{2D-2}}
 =\frac{H(X,\alpha)}{D^2\alpha^{D-1}}.
```

Thus the unique proper rational Hermite part is

```math
J=-\sum_{\alpha^D=z}\frac{c_\alpha}{t-\alpha}.
```

The negative sign is required because differentiating `-c/(t-alpha)` gives
`c/(t-alpha)^2`. The Galois-invariant sum belongs to `C(X,z,t)`. Its
uniqueness does not assume an algorithm for partial fractions: the
derivative of a nonzero proper rational function with a finite pole has a
pole of order at least two, and a proper rational function without any
finite pole is zero.

At `t=0`, the sign becomes positive, and `alpha^D=z` gives

```math
J(X,z,0)=\frac{1}{D^2z}\sum_{\alpha^D=z}H(X,\alpha).
```

Consequently `J(X,1,0)=per_m(X)/D^2`. The roots of `q` remain simple and
nonzero in a neighborhood of `z=1`; the displayed sum therefore has
coefficients regular near `(z,t)=(1,0)`. Possible cancellations in the input
rational function cause no difficulty: they merely make some displayed
double-pole coefficients zero. No residue from an added simple pole enters
this formula.

## 4. The rational-circuit implication

The output `J` is a polynomial in the matrix variables, homogeneous of degree
`m`, with rational coefficients in `(z,t)`. Given a rational circuit for
`J`, choose a matrix center at which none of its finitely many intermediate
denominators is identically zero as a rational function of `(z,t)`. Such
centers form a nonempty Zariski open set. Generic nearby parameter values
then make every required scalar inverse well-defined.

Truncating homogeneous Taylor series in the matrix increments through
degree `m` eliminates all divisions. The safe circuit bound
`C(L+m^2+1)(m+1)^3` follows by ordinary truncated multiplication and inverse
recurrences. Since the output degree is at most `m`, the translated Taylor
polynomial is the whole output. Letting generic parameter values approach
`(1,0)` is a coefficientwise limit of these bounded-size polynomial circuits.
The regularity established above proves that the limit is
`per_m/D^2`, giving the claimed border bound. This step does not assume that
the original circuit itself is defined at `(1,0)`.

## 5. Exact scope

The example refutes a general polynomial circuit bound for proper Hermite
parts in terms of input circuit size, variable count, and logarithmic
degree, under the stated border lower bound. The input already has only
simple and double finite poles.

It does not establish hardness of deciding rational exactness in the
uniform complex BSS model. It also does not refute an extraction theorem for
the restricted marked-resultant family in
[`RESIDUE_RESOLVENT_FRONTIER.md`](RESIDUE_RESOLVENT_FRONTIER.md).
In that family the marked double-pole coefficients are a common integer
with a fixed sign; here they vary with `H(X,alpha)`. Converting the existence
of a complex HN decider into a short circuit or a suitable certificate for
that restricted aggregate remains an unresolved implication.
