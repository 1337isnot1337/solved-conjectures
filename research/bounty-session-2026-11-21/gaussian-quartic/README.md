# Gaussian quartic witness search

Research checkpoint, 21 November 2026. No new example, complete conjecture solution, accepted award, or payment was obtained.

The target is the posted $10 offer for a new primitive Gaussian Fermat–Catalan example on [Ed Pegg's original page](https://mathpuzzle.com/Gaussians.html). The current wording is a posted offer, not a personal confirmation of payment. The exact eligibility and prior-example audit are in [the sibling investigation](../jsp-gaussian/README.md). This example-finding task is separate from proving a general conjecture; it is not counted toward the user's requested ten complete solutions.

## Structural search

For a primitive identity

```math
x^2+y^4=z^r,\qquad r\in\{5,7,9\},
```

put `u=x+i*y^2` and `v=x-i*y^2`. Then `uv=z^r`. Since `gcd(x,y)=1` in the Gaussian integers, every common divisor of `u` and `v` divides `2`. Consequently every Gaussian prime other than `1+i` dividing `z` must be assigned with its entire exponent in `z^r` to either `u` or `v`.

If `1+i` divides `z`, primitivity forces both `x` and `y` to be indivisible by `1+i`. The minimum of the valuations of `u` and `v` is at most two, because their gcd divides two. Their valuations cannot be equal: their sum is at least five, whereas equal valuations would each be at most two. Therefore the valuation of `u+v=2x` is their minimum, which is exactly two. The only assignments at this prime are thus `2` and `r*valuation(z)-2`, in either order.

The program factors each bounded `z`, enumerates these assignments and all units, and computes

```math
x=(u+v)/2,\qquad y^2=(u-v)/(2i).
```

It requires integral Gaussian coordinates, tests that `y^2` is a Gaussian square, and verifies the original identity and all three pairwise gcds. This removes the arbitrary upper bound on `y` in the first grid search. Restricting `z` to `0<=Im(z)<=Re(z)` and including every unit loses only global conjugates, which preserve the equation.

This is an elementary search reduction. No novelty claim is made for it.

## Completed calculations

| Search | Scope | Tested assignments | Result |
| --- | --- | ---: | --- |
| Initial grid | `1<=Re(y)<=350`, `0<=Im(y)<=Re(y)`, right-hand base coordinates at most 12, exponents `r=5,7,9,11,13` | 191,499,400 | Three raw hits, all known |
| Factor allocation | Right-hand base coordinates at most 1000, `r=5` | 65,651,232 | Eight raw hits, two known power triples |
| Factor allocation | Right-hand base coordinates at most 2000, `r=5` | 285,304,096 | Same eight raw hits |
| Factor allocation | Right-hand base coordinates at most 200, `r=7` | 2,113,984 | No hits |
| Factor allocation | Right-hand base coordinates at most 60, `r=9` | 159,648 | Eight raw hits, one known power triple |

The three distinct old identities, after units and rearrangement, are

```math
2^5+7^2=3^4,\qquad 3^5+11^4=122^2,\qquad
(2+i)^4+(1+i)^9=(5+4i)^2.
```

The sponsor page prints the second identity with `11^3`; exact arithmetic confirms that exponent is a typographical error. Correcting it is not a new example.

## Even powers and unit right-hand sides

`factor_even_search.cpp` extends the same allocation method to both signs in

```math
x^2\mathbin{\pm}y^{2k}=z^r,\qquad 2\le k\le7,
\qquad \frac12+\frac1{2k}+\frac1r<1.
```

The completed 31 runs inspected 88,013,856 factor assignments and emitted 48 raw rows. All 48 reduce to the same three published power triples listed above. [The run summary](even-run-summary.json) records every exponent, coordinate bound, assignment count, and raw-hit count. The largest searches were `r=5` with right-hand coordinate bound 1000 and `r=4` with bound 500. The small-base searches extend through `r=113`; this is a finite witness search, not a theorem about arbitrary exponents.

For `k=2`, the root test uses the exact Gaussian-square formulas. For higher `k`, it uses exact congruence and norm filters, followed by floating-point angular proposals in a small coordinate neighbourhood and exact multiplication before accepting a root. Every positive candidate is independently verified, but no formal coverage certificate is supplied for that angular proposal step. The absence of an emitted candidate must not be treated as certified nonexistence throughout those boxes.

`unit_search.cpp` also checks `x^2+y^q=epsilon`, where `epsilon` is a Gaussian unit, the canonical coordinates of `y` are at most 5000, and

```text
q = 3,4,5,7,9,11,13,17,19,23,29,31,37,41,43,47,53,59.
```

It includes all unit associates and imposes the exact bound `Norm(y)^q <= 10^36` to keep arithmetic within its declared range. It inspected 500,837,168 right-hand-side candidates and emitted ten rows. These consist of the ordinary integer identity and the three Gaussian Catalan examples already printed on the sponsor's page:

```math
(78+78i)^2+(23i)^3=i,
```

```math
1+(1-i)^5=(1+2i)^2,
```

```math
i+(11+11i)^2=(3i)^5.
```

The output represents a unit as its 101st power, since `101` is one modulo four. Changing that exponent does not create a new power triple or a new paid example. The verifier's explicit `--allow-unit` mode permits exactly two nonunit bases and still checks the identity, strict reciprocal inequality, and all gcds. All ten rows are classified as prior examples in [unit-verification.jsonl](unit-verification.jsonl).

## Verification and limits

All emitted candidates were rechecked with Python arbitrary-precision arithmetic in `verify.py`. It checks the full complex identity, the strict reciprocal-exponent inequality, nonunit bases, and Gaussian gcds. It canonicalizes the three signed power values under a common unit, conjugation, and permutation using the source-backed exclusion table in `../jsp-gaussian/verify_candidates.py`. Every candidate matched a prior power triple.

The C++ code uses signed 128-bit integers and caps each coordinate of `z^r` at `10^18`. The recorded factor-allocation runs have bounds small enough that this cap excludes none of their right-hand bases. Square-root estimates are corrected with exact integer comparisons before acceptance. The finite negative searches are not Lean proofs or global nonexistence theorems. Any future unmatched hit still requires a separate literature search and sponsor assessment.

From this directory:

```sh
g++ -O3 -std=c++17 search.cpp -o /tmp/bounty-gaussian-quartic
/tmp/bounty-gaussian-quartic 350 12
g++ -O3 -std=c++17 factor_search.cpp -o /tmp/bounty-gaussian-factor
/tmp/bounty-gaussian-factor 1000 5
/tmp/bounty-gaussian-factor 2000 5
/tmp/bounty-gaussian-factor 200 7
/tmp/bounty-gaussian-factor 60 9
python3 verify.py candidates.jsonl factor-r5.jsonl factor-r5-2000.jsonl factor-r7.jsonl factor-r9.jsonl
g++ -O3 -std=c++17 factor_even_search.cpp -o /tmp/bounty-gaussian-even
/tmp/bounty-gaussian-even 1000 5
g++ -O3 -std=c++17 unit_search.cpp -o /tmp/bounty-gaussian-units
/tmp/bounty-gaussian-units 5000
python3 verify.py even-r5-300.jsonl even-r5-1000.jsonl even-r4-500.jsonl even-r7-200.jsonl even-r9-60.jsonl even-r11-20.jsonl
python3 verify.py --allow-unit unit-candidates.jsonl
```
