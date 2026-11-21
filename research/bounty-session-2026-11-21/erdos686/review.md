# Independent review of the ratio-25 search

Research checkpoint, 21 November 2026. This is a review of a finite search and its mathematical coverage. It is not a proof or disproof of the bounty statement.

The coordinator and a second researcher independently read the centered-product reduction, the rational error bound, the continued-fraction coefficient enumeration, and the common-factor search in `cf_witness_search.py`. The reviewed source SHA-256 is `77d2126a568a43f17b2372c277046880c2b6a076ed0c74ee61a25ba67a3456c8`.

## Coverage checks

- The centered variables are integral for odd length and doubled for even length. For even length, the candidate numerator, denominator, and common factor must all be odd. The code enforces these parity conditions before accepting a witness.
- The rational root enclosure certifies each retained continued-fraction digit using integer arithmetic. A denominator cutoff is part of each result; the search is not over all rational numbers.
- For successive convergent denominators `Q_j <= q < Q_(j+1)`, the representation of `(p,q)` in the adjacent-convergent basis is unique. The exact approximation bound restricts the second coefficient, and the code enumerates the remaining first-coefficient interval. The initial `q=1` interval is covered, including the duplicate denominator when the first partial quotient equals one.
- For each reduced fraction, the underlying product ratio is strictly decreasing as the common factor grows. Exact sign bracketing therefore checks every admissible common factor. This does not require the expanded difference polynomial itself to be monotone.
- Testing an intermediate even factor while bracketing the even-length case does not lose a possible odd-factor root; the final parity check remains necessary.
- The program's lower bound for the centered denominator is weaker than the direct disjointness bound. That weakens the search bound but does not exclude a valid witness.

## Positive and rejection controls

The recorded controls recover the published ratio-9 witness `(k,m,n)=(3,25,11)` and ratio-16 witness `(3,13,4)`. The latter exercises a nontrivial common factor of three.

Additional independent checks recover the following direct binomial identities. These are checks of the implementation, not new mathematical results.

| Ratio | Length | Upper offset | Lower offset | Centered common factor |
| ---: | ---: | ---: | ---: | ---: |
| 35 | 3 | 4 | 0 | 2 |
| 126 | 4 | 5 | 0 | 5 |
| 286 | 3 | 10 | 0 | 2 |
| 1001 | 4 | 10 | 0 | 5 |

An artificial centered equality with ratio 129, length two, reduced numerator 11, reduced denominator one, and factor four is correctly rejected because it does not yield integral original offsets. This checks a parity failure that an identity-only test would miss.

The reviewers found no flaw in the stated finite coverage. That assessment is not a machine-checked proof of the Python implementation. All batch coefficient-bound flags were true, and both batch records identify the reviewed source hash.

## Prior-art limit

The 57 tested lengths include length three, which Nat Sothanaphan had already excluded for ratio 25 in March 2026. Tao's earlier cubic Thue reduction was also already public. These facts are recorded in the [main note](README.md). The length-three computation is a consistency check and rediscovery; neither it nor the reduction is claimed as novel. The missing result is still a valid witness at some length or a proof ruling out every length.
