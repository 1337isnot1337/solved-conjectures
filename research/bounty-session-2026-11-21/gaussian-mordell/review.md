# Independent review of the Gaussian Mordell search

Reviewed 21 November 2026 by the `conjectures_bounties` agent. The reviewed `field_search.py` has SHA-256

`5c76c8cd1ef68ae9fc933cbdf8287df0fb91be495dfca9a8f9c36cb48de99ed7`.

**Finding:** no mathematical flaw was found in the field arithmetic, group law, normalization, or the two rejection rules below. The completed outputs support a finite search finding only. No new qualifying example or completeness theorem is established.

## Arithmetic and normalization

`G(a,b,d)` represents `(a+bi)/d` with positive reduced common denominator. Addition, multiplication, division and integer powers implement exact arithmetic in `Q(i)`. The integral square-root routine is complete up to sign: if `(u+vi)^2=a+bi`, then `sqrt(a^2+b^2)=u^2+v^2` and `u^2=(sqrt(a^2+b^2)+a)/2`. Its separate purely imaginary branch handles `u=0`.

The chord/tangent formula in `add` is correct for `Y^2=X^3+A`. It treats infinity, opposite points and points with `Y=0` correctly. In the equal-`X` branch, valid points on the same curve have equal or opposite `Y`; thus the remaining case is doubling. Search coefficients are nonzero, so these are nonsingular curves.

Write `r=6k+t`, with `1<=t<=6`. On

\[
Y^2=X^3+z^t,
\]

the recovered bases are

\[
x=Yz^{3k},\qquad y=-Xz^{2k},
\]

and therefore `x^2+y^3=z^(6k+t)`. The minus sign on `X` is essential and is correctly implemented. For `k>=1`, the exponent is at least seven, giving the required strict reciprocal-exponent inequality. The control code correctly uses `t=6`, rather than `t=0`, for an exponent divisible by six.

## Rejection rules

**Denominator support.** Suppose a rational prime `p` divides the reduced denominator of a field coordinate but does not divide `N(z)`. Multiplication by `z` is an invertible linear transformation of its two numerator coordinates modulo `p`: its determinant is `N(z)`. It therefore cannot make both numerator coordinates divisible by `p`. No power of `z` clears that denominator. Rejecting such a coordinate is valid.

The converse is not asserted. A denominator supported on rational primes dividing `N(z)` need not clear in the required Gaussian prime directions. The code appropriately retains such a point for exact multiplication and reduction instead of assuming integrality.

**First integral scaling.** If both coordinates are already Gaussian integers at `k=0`, every permitted `k>=1` gives recovered bases divisible by the nonunit `z`. Otherwise let `k0>=1` be the first integral scaling found. At `k0+h`, for every `h>=1`, the recovered bases are multiplied by `z^(3h)` and `z^(2h)`. Both then share `z` with the unchanged right-hand base. Thus only the first integral scaling can be pairwise coprime; rejecting it for a unit/zero base or failed coprimality cannot discard a valid later scaling. Failure to clear denominators by `max_k` remains only a finite cutoff.

## Checks performed

No large search was rerun. Sixteen fixed operand pairs were checked against a separate implementation using pairs of Python `Fraction` values. Additional exact checks covered negative denominators, zero division, inverse powers, zero/purely imaginary/non-real square roots, infinity, vertical addition, order-two torsion and order-three torsion.

Two useful explicit points were checked:

- Doubling `(-1,1)` on `E_2` gives `(17/4,-71/8)`. Decoding at `k=1` recovers `(-71)^2+(-17)^3=2^7`.
- Doubling `(1,2)` on `E_3` gives `(-23/16,-11/64)`. Its denominator prime two cannot be cleared by the base three, and the filter rejects it.

Scaling the first point by `(3^2,3^3)` gives a rational point on `E_1458`. Its first integral decoding is imprimitive; the code rejects it, and direct checks at the first two integral scalings confirm the shared factor. All three stored positive controls replayed exactly, including the exponent-thirteen example requiring `k=2`. These controls test normalization and decoding directly; they are not proofs that arbitrary points occur in the seed-generated subgroup.

## Output and coverage audit

| Output | Curves | Integral seeds | Inspection calls | Distinct raw candidate tuples |
|---|---:|---:|---:|---:|
| `run/` | 193 | 402 | 27,372 | 36 |
| `triples/` | 687 | 1,209 | 237,385 | 48 |

All per-curve progress totals match the summaries. With `s` chosen seeds, multiple bound `M` and triple bound `T`, the exact number of inspection calls is

\[
(2M+1)s+2M^2\binom{s}{2}+4T^3\binom{s}{3}.
\]

This formula matches every recorded curve. The maximum seed counts are seven and ten, so the cap of twelve did not truncate either completed run. The initial summary predates the `triple_bound` option and omits that key; its recorded counts agree exactly with `T=0`.

Inspection calls include infinity, repeated points and torsion repetitions. They are not distinct group elements. Pair/triple combinations require the first nonzero coefficient to be positive; omitted simultaneous negations change only the sign of the recovered square base and do not change existence or prior-example classification.

The extended 48 outputs consist of 24 single-seed and 24 two-seed witnesses; no additional tuple first arose from a triple combination. The recorded separate verification file checks all 48 identities, nonunit bases, the exponent inequality and Gaussian coprimality, and labels all 48 as known power triples. The generator and `gaussian-quartic/verify.py` both import the same integer checker module; they should not be described as two independently implemented validators. That checker is separate from the rational field/group-law representation reviewed here. This review did not repeat the underlying historical-source audit.

The source header correctly disclaims a full Mordell–Weil basis, all S-integral points and global nonexistence. The finite base region, bounded integral `X` coordinates, bounded group coefficients, restriction to at most three selected seeds and `k<=20` remain material limits. No stronger negative conclusion is warranted.
