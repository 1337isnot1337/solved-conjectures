# Factor reduction for x² + y³ = z²ᵏ

This is an elementary search reduction, not a new solution or a paid result.
It removes any independent bound on `x` or `z` when a nonzero Gaussian `y`
has been fixed. The implementation is `factor_even_right.cpp`.

Let `x,y,z` be pairwise coprime nonzero Gaussian integers and let `k>=4`.
Set

`U=z^k-x`, `V=z^k+x`.

Then `UV=y^3`, `U+V=2z^k`, and `V-U=2x`. Neither `U` nor `V` is zero,
because `y` is nonzero. Conversely, any factor pair of `y^3` for which the
half-sum is a Gaussian kth power and the half-difference is a Gaussian
integer supplies an identity, which must then be checked for primitivity.

## Odd Gaussian prime factors

If a Gaussian prime `pi` divides both `U` and `V`, it divides `2x` and
`2z^k`. If `pi` is not associated to `lambda=1+i`, it divides both `x` and
`z`, contradicting pairwise coprimality. Therefore each odd Gaussian prime
power in `y^3` belongs entirely to one factor. If its exponent in `y` is
`e`, its two possibilities in `U` have exponents `0` and `3e`.

## Ramified prime

Suppose `e=v_lambda(y)>0`. Coprimality makes `x` and `z` lambda-adic units.
Thus both `U+V` and `V-U` have valuation exactly `v_lambda(2)=2`.
Write `alpha=v_lambda(U)`, `beta=v_lambda(V)`.

Both are positive, since `z^k` and `x` are odd and the residue field is
`F_2`. If `alpha != beta`, the valuation of either sum or difference is
their minimum, so `min(alpha,beta)=2`.

They cannot be equal. If `alpha=beta=t`, factoring out `lambda^t` shows
the sum and difference have valuation at least `t+1`, hence `t<=1`.
Then `alpha+beta=2`, which cannot equal `3e`. (The same conclusion follows
directly from `3e=2t` and the valuation bound.)

Consequently the only possibilities are

`{alpha,beta}={2,3e-2}`, with `e>=2`.

In particular, `v_lambda(y)=1` is impossible for a primitive solution.
The implementation treats odd Gaussian primes by all-or-nothing allocation
and lambda by this two-choice allocation. All four possible units of `U`
are included; `V=y^3/U` fixes the remaining unit exactly.

## Root enumeration and exact checks

For each half-sum `H=(U+V)/2`, a necessary condition for `H=z^k` is that
`N(H)` is an integer kth power `n^k`. The implementation first checks this
with integer arithmetic, using an estimated root only as an initial value
and correcting it by exact comparisons.

If the norm test passes, every possible Gaussian root satisfies
`a^2+b^2=n`. The current implementation enumerates all integer
`0<=a<=floor(sqrt(n))`, tests whether `n-a^2` is a square, and tests every
unit and conjugate of each resulting pair. Thus Gaussian-root recognition
does not depend on floating-point angle estimates or rounding a complex
root. Each candidate is accepted only after exact exponentiation.

The program may stop after the first root. Any two Gaussian kth roots of
the same nonzero number differ by a root of unity in `Q(i)`, hence by one
of `1,-1,i,-i`. They have identical coprimality properties, and their power
values are identical. Returning one root therefore suffices for this
existence search and does not distinguish already equivalent examples.

The sieve factors the rational norm of `y`, splits primes congruent to one
modulo four as sums of two squares, and divides in the Gaussian integers.
The residual factor is required to have norm one. The arithmetic of each
emitted triple is checked again with Python arbitrary-precision integers,
including exact Gaussian gcds and the reciprocal-exponent inequality.

The search uses representative `y=a+bi` with `0<=b<=a`, followed by all four
unit rotations. Any Gaussian `y` is one of those representatives or the
conjugate of one, so this covers solutions up to global conjugation. A
global conjugate of a solution is again a solution. The displayed finite
bounds refer to the larger absolute coordinate of `y`.

## Scope

The reduction is complete for pairwise-coprime triples with the fixed
`y` and tested `k`, provided the integer implementation stays in its
documented arithmetic range. It is not a classification for unbounded `y`
or unbounded exponents. The final run uses `max(|Re y|,|Im y|)<=1500` and
`4<=k<=15`, where all factor products, norms and exact-power checks fit in
signed 128-bit arithmetic. No independent bound on `x` or `z` is imposed.

The exact run completed 102,802,368 unit-adjusted factor pairs. Its two
output rows differ only by the sign of `x` and reproduce Oleg567's 2012
identity. Both were independently checked by the arbitrary-precision
Python verifier. No new identity was found.

The earlier angular-root version was replaced by the exact norm-
representation enumeration before the final recorded run. Its exploratory
output rediscovered the 2012 Oleg567 example and is not used as a final
negative search certificate.
