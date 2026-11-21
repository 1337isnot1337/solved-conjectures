# Gaussian Fermat–Catalan witnesses from elliptic curves over Q(i)

Research checkpoint, 21 November 2026. No new qualifying identity, full conjecture solution, submission, award, or payment was obtained. All 48 candidates in the expanded run match ten previously published power-triple classes.

The target is [Ed Pegg's posted offer](https://mathpuzzle.com/Gaussians.html) for new primitive Gaussian Fermat–Catalan examples. The offer and prior identities are audited in [the source note](../jsp-gaussian/README.md). A new identity would be a witness for this specific offer; a finite search does not settle the general Fermat–Catalan conjecture.

## Exact reduction

Fix a nonunit Gaussian integer `z`, and write an exponent at least seven as `r=6k+t`, with `k>=1` and `1<=t<=6`. The equation

```math
a^2+b^3=z^{6k+t}
```

corresponds to a point on the Mordell curve over the Gaussian rational field:

```math
E_{z,t}:Y^2=X^3+z^t,
\qquad X=-b/z^{2k},\quad Y=a/z^{3k}.
```

Conversely, if `X*z^(2k)` and `Y*z^(3k)` are Gaussian integers, those equations recover a candidate. The program checks the full original identity and pairwise Gaussian gcds before retaining it.

This differs from the [earlier rational Mordell search](../jsp-gaussian/normalized-mordell-search.md): both coordinates and the curve coefficient can now be genuinely nonreal. Group arithmetic can reach bases much larger than the seed box. This is a standard elliptic-curve transformation; no novelty is claimed for it.

## Candidate generation and safe rejections

`field_search.py` implements `Q(i)` exactly as `(a+b*i)/d`, with integer `a,b,d`, positive denominator, and their common gcd removed. It enumerates integral seeds in a coordinate box, using exact integer square roots. It then adds bounded multiples of one or two seeds; the expanded run also includes combinations of three seeds. Equal curve coefficients are searched once and decoded for every recorded representation `z^t`.

The group law uses the usual chord and tangent formulas on `Y^2=X^3+C`, including the point at infinity and a vertical tangent. Every recovered candidate is checked directly against the integer identity. No floating-point arithmetic is used.

Two rejections reduce the work:

1. A rational coordinate whose reduced integer denominator has a prime factor not dividing `Norm(z)` cannot become integral on multiplication by powers of `z`. The denominator-smoothness check is necessary only; it is not used as a sufficient integrality test.
2. Once both scaled coordinates first become integral, a failed primitivity check cannot be repaired by a larger `k`. The next scaling multiplies the recovered square base by `z^3` and the cube base by `z^2`, creating a common nonunit divisor with `z`. Integral seeds themselves therefore yield no primitive candidate at `k>=1`.

The actual integrality and gcd checks remain exact. The exponent search is bounded by `k<=20`; no assertion is made about larger exponents.

## Completed runs

The base range is `1<=Re(z)<=B`, `0<=Im(z)<=Re(z)`, with all four unit associates. These are tested bases, not an exhaustive list of all Gaussian integers. The seed box is `|Re(X)|,|Im(X)|<=M`.

| Run | Base bound B | Seed bound M | Curves | Integral seeds | Group combinations | Raw unique candidates |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Initial | 4 | 80 | 193 | 402 | 27,372 | 36 |
| Expanded, including triples | 8 | 100 | 687 | 1,209 | 237,385 | 48 |

Both runs permitted up to twelve seeds per curve; every enumerated seed was used. In the initial run, single and pair coefficients have absolute value at most five. In the expanded run they have absolute value at most eight, while coefficients in three-seed combinations have absolute value at most two. The counts include repeated group points and symmetry-equivalent identities. They are not counts of independent points or new solutions.

The expanded candidates match these old classes:

| Prior class | Raw candidates |
| --- | ---: |
| Helenius-4 | 8 |
| Pegg-original-2 | 8 |
| Oleg567-2012 | 8 |
| ordinary-4 | 4 |
| ordinary-3 | 4 |
| Pegg-original-1 | 4 |
| Helenius-2 | 4 |
| Helenius-3 | 4 |
| Howe-et-al-2026-1 | 2 |
| Helenius-1 | 2 |

The source-backed meanings of these labels are in `../jsp-gaussian/verify_candidates.py`. Classification uses the three signed complex power values under permutation, common units, and conjugation. It does not rely on matching norms alone.

## Checks and limits

Positive controls normalize and recover three published identities, with exponents seven, thirteen, and eight. They also check doubling against the curve equation and addition of a point to its inverse. The controls are stored with each run.

The separate `../gaussian-quartic/verify.py` pass rechecks every emitted identity using arbitrary-precision Gaussian-integer arithmetic, all three gcds, the strict reciprocal-exponent inequality, and nonunit conditions. The generator and this wrapper import the same integer checker; these are separate runs, not independently implemented integer validators. Both output files contain zero unmatched power triples. The [independent review](review.md) addresses the mathematical reduction and code scope, and checks field operations against a separate `Fraction` implementation.

No rank calculation, group-basis certification, saturation, complete integral-point calculation, or complete S-integral-point calculation was performed. A subgroup generated by bounded integral seeds may miss relevant points. Bounded group combinations may miss points even inside that subgroup. These searches establish no global nonexistence result and are not Lean proofs.

## Reproduction

From the repository root:

```sh
python research/bounty-session-2026-11-21/gaussian-mordell/field_search.py --base-bound 4 --seed-bound 80 --max-seeds 12 --multiple 5 --max-k 20 --output research/bounty-session-2026-11-21/gaussian-mordell/run
python research/bounty-session-2026-11-21/gaussian-mordell/field_search.py --base-bound 8 --seed-bound 100 --max-seeds 12 --multiple 8 --triple-bound 2 --max-k 20 --output research/bounty-session-2026-11-21/gaussian-mordell/triples
python research/bounty-session-2026-11-21/gaussian-quartic/verify.py research/bounty-session-2026-11-21/gaussian-mordell/run/candidates.jsonl
python research/bounty-session-2026-11-21/gaussian-quartic/verify.py research/bounty-session-2026-11-21/gaussian-mordell/triples/candidates.jsonl
```

The first run predates the optional triple-combination argument; its omitted value is zero. The current script with that default reproduces the same search. The seed lists, per-curve counts, group witnesses, raw candidates, and verification records are retained.
