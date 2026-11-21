# A normalized Mordell-curve search

No new identity has been found at this checkpoint. This approach searches
rational points, so it can reach integers larger than the direct `a<=10^8`
screen. It is not a proof that the relevant rational points are exhausted.

Suppose

`a^3 + sign*b^r = 2*c^2`, with `sign` equal to `1` or `-1`.

Write the odd exponent as `r=6k+t`, where `t` is one of `1,3,5`. The point

`X=2a/b^(2k)`, `Y=4c/b^(3k)`

lies on the normalized Mordell curve

`Y^2 = X^3 + 8*sign*b^t`.

Thus the coefficient depends only on `b`, `t`, and the sign; the exponent
`k` is encoded in the denominators of a rational point. Conversely, a point
whose reduced denominators are exactly `b^(2k)` and `b^(3k)`, with even
X numerator and Y numerator divisible by four, yields the desired integer
identity by rescaling. The search checks that identity directly. Negative
`a` corresponds to the previously allowed negative right-hand side after
changing signs; it is converted into the verifier's existing format.

## Candidate generation

`mordell_integral_seeds.cpp` enumerates bounded integral points on each
normalized curve. `search_mordell_group.py` adds their integer multiples
and pairs of multiples using `Fraction` arithmetic. The elliptic addition
formula is checked indirectly by direct substitution for every recovered
candidate, followed by the separate Gaussian identity/gcd verifier.

The seeds need not generate the full Mordell–Weil group. The seed search is
bounded, and only bounded linear combinations of pairs are inspected.
Neither the label “seed” nor a successful addition calculation certifies a
group basis, saturation, rank, an integral-point theorem, or a complete
S-integral-point list.

The first run used all 294 curves with odd `3<=b<=99`, `t=1,3,5`, and both
signs. It found 279 bounded integral points with `X<=100000` (negative X
is included whenever the curve allows it). Up to six small seeds per curve
and coefficients of absolute value at most six gave 19,022 inspected
single/pair combinations. The only recovered Gaussian examples were the
same three already known from the direct twisted search.

Their exact group witnesses provide useful checks of the transformation:

| Curve | Points | Combination | Recovered identity |
| --- | --- | --- | --- |
| `Y²=X³+24` | `P=(1,5)`, `Q=(-2,4)` | `P+Q=(10/9,-136/27)` | `5³+3⁷=2*34²` |
| `Y²=X³+24` | same P,Q | `2P-Q` | `239³+3¹³=2*2761²` |
| `Y²=X³-17576` | `P=(65,507)`, `Q=(218,3216)` | `2P-Q` | `2797³-13⁹=2*75090²` |

An expanded run uses odd `b<=499`, integral seeds with `X<=1000000`, up
to eight seeds per curve, and group coefficients of absolute value at most
20. It has 1,494 normalized curves and 1,170 bounded integral seed points.
The group search completed all 1,494 curves, used 1,167 of the 1,170 seeds,
and inspected 672,647 single/pair combinations. It recovered only the same
three known identities. Its raw outputs and per-curve records are preserved
alongside the script. The number of tested combinations is not a number of
new mathematical results or distinct group points.

Reproduction:

```sh
g++ -O3 -std=c++20 mordell_integral_seeds.cpp -o /tmp/mordell_integral_seeds
/tmp/mordell_integral_seeds 499 1000000 > mordell_integral_seeds_extended.jsonl
python3 search_mordell_group.py mordell_integral_seeds_extended.jsonl --multiple 20 --max-seeds 8 --progress mordell_group_extended_progress.jsonl > mordell_group_extended_candidates.jsonl
python3 verify_candidates.py mordell_group_extended_candidates.jsonl
```

## Reuse inquiry

Local inspection found no SageMath, PARI/GP, cypari2, or python-flint; SymPy
is available. The repository's reciprocal-sum team published a separate
SageMath 10.6 integral-point replay. [Coordination comment in issue 234](https://github.com/1337isnot1337/solved-conjectures/issues/234#issuecomment-7068271199)
asks for its reproducible environment. No claim is made that this Fraction
search replaces a proof-enabled integral-point algorithm.
