# Boyer Enigma 6a: target audit and a failed construction route

Checked 21 November 2026. Coordination: [issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068461073).
No new magic square, full impossibility theorem, accepted submission, or bounty completion is claimed.

## Exact target and money

Find a matrix `A` of size 6 by 6 whose 36 entries are pairwise distinct positive
integers, with constants `S` and `P` such that every row, every column, and each
of the two long diagonals has sum `S` and product `P`; alternatively, prove that
no such matrix exists. There is no upper bound on the entries. A positive
rational witness would suffice after multiplication by a common denominator.

The original [4 May 2010 announcement in Plus](https://plus.maths.org/comment/8496)
offers the first solver of Enigma 6a 500 euros and a bottle of champagne.
The [2023 paper by Desmond Weisenberg](https://arxiv.org/html/2311.06326v1)
again describes this exact target and direct cash offer as open. The current
[sponsor page](https://www.multimagie.com/English/Enigmas.htm) timed out for
HTTP and HTTPS, with and without `www`, in this session. Current payout
availability has therefore not been independently confirmed. Age and a failed
fetch do not prove that the offer has ended, but a historical offer is not a
guaranteed current payment. No account or submission action was taken.

## Prior work checked

Weisenberg's 2023 paper studies prime-exponent patterns and rules out several
restricted forms. Its conclusions do not exclude arbitrary products.

Boonsiriseth, Quines and Raphael's [16 May 2023 report](https://github.com/talkon/magic-squares/blob/3d899975a69f1b41cc62aa8327931319ccbdf0b9/project-report.pdf)
reports an extensive fixed-product search, many semi-magic examples, and no
full witness. We read the report and its [research notes](https://github.com/talkon/magic-squares/blob/3d899975a69f1b41cc62aa8327931319ccbdf0b9/research/ideas.md).
The four near-squares in Tables 5--8 are the inputs below. Their original
discovery is entirely prior work.

The repository's `pushed_at` value is in October 2026, but its latest `main`
commit is the May 2023 commit above. A push timestamp was not interpreted as a
new mathematical result. A [November 2025 question, updated in October 2026](https://math.stackexchange.com/questions/5108781/smallest-possible-generalized-additive-multiplicative-magic-square-whose-entri/5152654)
also supplies only incomplete constructions, even for the weaker problem over
complex numbers. A separate [September 2026 bounty-intake repository](https://github.com/vibemathing/problem-boyer-enigma-6a)
does not contain an admitted solution in the material inspected.

Searches used both `6x6` and `6×6`, the exact phrase
`additive-multiplicative`, Boyer's enigma identifier, and proof/solution terms.
No full prior resolution was found in this bounded search. That is not a proof
that none exists.

Source identities:

| Source | Identifier |
| --- | --- |
| `talkon/magic-squares` main commit | `3d899975a69f1b41cc62aa8327931319ccbdf0b9` |
| Report Git blob | `f1c4aa4bd01c46b3aad73493b3463e396d8b21cd` |
| Report PDF SHA-256 | `e07756ede1b324f8a0aad3de82ee0899e25ae3307b1ad96a2fc15bfd71b4ea4a` |

The source PDF was inspected locally and is not redistributed here.

## Construction route: a common fractional linear map

The published near-squares suggest trying a common rational transformation of
all entries. A successful map could change the defective diagonal while
preserving the row and column constraints. This includes inversions,
translations, and their compositions. The calculation below rules out the
entire family, not a finite interval of transformation parameters, for these
four starting matrices.

**Restricted conclusion.** No nonsingular fractional linear transformation,
followed by arbitrary permutations of rows and columns, converts any of the
four source matrices into a full additive--multiplicative magic square. This
holds even for complex transformation parameters when every transformed entry
is finite. It says nothing about other starting matrices or transformations
that vary between entries.

Here is the proof and its exact certificate.

For each row or column `L`, define

```math
F_L(t)=\prod_{x\in L}(t-x).
```

Choose the first row as `L_0`. For a nonaffine nonsingular map

```math
T(x)=\frac{ax+b}{cx+d},\qquad c\ne0,\quad ad-bc\ne0,
```

put `u=-d/c`. Then

```math
T(x)=\frac ac+\frac{bc-ad}{c^2(x-u)}.
```

Equal transformed row and column sums require equal values of

```math
\sum_{x\in L}\frac1{x-u}=-\frac{F_L'(u)}{F_L(u)}.
```

The denominators are nonzero because the map must be finite at every entry.
Consequently `u` must be a common zero of all eleven polynomials

```math
D_L=F_L'F_{L_0}-F_LF_{L_0}'\quad(L\ne L_0).
```

For each of the four matrices, their gcd over the rationals is 1. The output
file provides rational polynomials `B_L` satisfying the exact identity

```math
\sum_{L\ne L_0}B_LD_L=1.
```

Thus no nonaffine map can even preserve the necessary equal row and column
sums.

For an affine nonsingular map `T(x)=alpha*x+beta`, let
`u=-beta/alpha`. Since each line has six entries, its transformed product is
`alpha^6 F_L(u)`. Equal products require `u` to be a common zero of
`F_L-F_{L_0}`. In all four cases the exact monic gcd is `t`. The output records
both a Bezout identity for `t` and zero remainders. Hence `u=0`, so `beta=0`:
only a common nonzero scaling remains.

A scaling cannot change which transversals have the required sum and product.
An exhaustive exact check of the 720 transversals gives respectively 1, 1, 1,
and 0 good transversals for source Tables 5, 6, 7, and 8. A full square of even
order needs two distinct good transversals as its two disjoint long diagonals.
There are too few in every case.

The script additionally implements the exact compatibility criterion for two
transversals: their relative permutation must be a fixed-point-free involution.
Disjoint transversals alone need not be realizable as the two long diagonals
under simultaneous row and column reorderings.

## Reproduction and limit

Run locally:

```sh
python research/bounty-session-2026-11-21/boyer-six/mobius_orbit.py
```

The calculation uses exact rational polynomial arithmetic in SymPy. It checks
all matrix entries for positivity and distinctness, verifies the twelve row
and column sums and products, checks the Bezout identities and divisibilities,
and enumerates all 720 transversals. The source hash is recorded in
`mobius_orbit_results.json`. This is not a Lean proof, and no numerical
approximation is used.

The coordinator independently compared all four input matrices with Tables
5--8 of the source report, confirmed the recorded PDF hash, read the
fractional-linear argument, and reran the exact certificate calculation. The
four gcd and transversal conclusions reproduced without a change.

The rational-transformation route is blocked for these four inputs. The full
problem requires a new construction or an argument that addresses arbitrary
matrices. Increasing a range in the prior fixed-product search is not part of
this checkpoint. This restricted obstruction is not counted as a paid result.

## Separate platform exclusion: FormalMarket

The [current problems-with-bids page](https://formalmarket.ai/problems/?bids=with)
displayed six problems. Five were demos. The [official documentation](https://formalmarket.ai/docs/)
explicitly says every bid, ask, and trade on a demo problem is fake money.

The only nondemo bid found was [500 euros for a nontrivial factor of
`2^1277-1`](https://formalmarket.ai/problems/90d2354f-b64f-421e-9c32-5236f5907b9c/).
Its displayed expiry was 17 November 2026, earlier than this check; a renewal
icon did not establish a fresh expiry. Its page also says there are no
on-platform payments in version 1, and a match initiates email notifications
followed by manual settlement. No match was initiated. These observations
do not establish a current funded mathematical target for this campaign.
The homepage's estimated values are not buyer offers.
