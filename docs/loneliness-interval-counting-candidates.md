# Exact counting and interval insertion candidates

These are unregistered source candidates. No completed source, axiom, and
kernel receipt is claimed for this batch. The separate workflow uses the
unchanged exact dependency-closure gate and the usual three-axiom whitelist.

## One-relation counting

The six quasipolynomial modules reduce a positive weighted partition to
quotient and remainder coordinates. The quotient count is an explicit
binomial polynomial on each residue class. Its proof includes inputs before
the residue offset; no eventual qualification is substituted for an exact
formula.

Inclusion and exclusion impose upper coordinate bounds. Reflection of the
negative coordinates then converts a signed relation in the closed box
`0 <= v_i <= N` into a positive weighted partition with target proportional
to `N`. Zero coefficients contribute independent coordinate factors. The
all-zero normal has its own ambient-degree formula.

Every proposed formula holds for every `N >= 0`. The closed-box endpoint is
`closedRelationBox_quasipolynomial`. Five further source modules use quotient
coordinate bijections and finite inclusion and exclusion to impose positivity
and pairwise distinctness. Their endpoint
`Loneliness.Hyperplane.positiveBoxAdmissible_quasipolynomial` counts the
literal sampling denominator for every `N`, with degree at most one less
than the ambient dimension for a primitive normal. These modules are also
unchecked candidates. Counts for several simultaneous relations, needed for
the retained exceptional subspaces, remain separate.

## Two-speed insertion

The interval argument uses actual nearest-integer distance at real times.
The first generic lemma proves that any interval of width at least
`2*delta/v` contains a point with `v`-phase distance at least `delta`.
An interval row therefore covers every second speed above its recorded,
checked cutoff. Smaller second speeds have explicit rational witnesses.

The producer stores 210 interval rows and 643 pair witnesses for
`3 <= p <= 10` and `1 <= b <= floor(2*p*(p+2)/(p-2))`. These are the exact
finite cases in the written argument. Every row, width inequality, coverage
index, and witness is checked in Lean; the producer is not trusted.

The measure branch proves a periodic integral bound and the resulting
two-speed bad-length estimate. Large first speeds, the elementary divisibility
cases for larger `p`, and the unbounded Goddyn--Wong criterion application
must still be assembled before the full insertion theorem is complete.

The independent obstruction candidate bounds the clearance of `[4,6,10]`
by `1/7` throughout `[1/6,1/3]`. It also verifies the ordinary five-speed
tuple's witness at `3/8`.

## Compositional support certificates

`LonelinessModularCoverCuts` preserves the original bit-mask tape semantics.
Each finite fragment follows actual tape edges or refers to an exactly
matching earlier frame. The checker verifies the reference order and a
fragment-size bound. Strong induction then gives the original tape check.
This is a generic source candidate; it does not certify a numerical prime.

Inspect or execute an exact closure:

```sh
python3 scripts/verify_loneliness_interval_counting.py hyperplane-closed-box-counting --plan
python3 scripts/verify_loneliness_interval_counting.py two-insertion-small
```
