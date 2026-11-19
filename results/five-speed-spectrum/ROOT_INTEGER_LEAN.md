# Integer lift from modular root covers

## Statement and current verification status

This note describes the generic integer lift in
`Conjectures/LonelinessFiveSpeedRootIntegerLift.lean`.
All six integer-lift modules have passed source checks with warnings
treated as errors, the transitive axiom audit, and separate stock
`leanchecker` replays. The audit checked 181 theorem declarations in the
combined root semantics and integer namespaces. It found only
`propext`, `Classical.choice`, and `Quot.sound`.

The theorem retains its explicit finite-cover and prime-product inputs.
It does not by itself complete the five-speed classification.

Let `v : Fin 5 → ℕ` be positive and injective. Suppose every coordinate is
at most `C`, and

\[
\operatorname{value}(v)<\frac15.
\]

Let `ps` be a finite set of primes, each greater than seven. Suppose every
prime in `ps` has a complete modular root cover, and

\[
(4C)^{111}<\prod_{p\in ps}p.
\]

The theorem `Loneliness.FiveSpeedRoot.root_integer_relation_lift` concludes
`IntegerRootOutcome v`. This is the following disjunction:

1. Two distinct rows of the literal 50-row integer relation catalogue
   vanish on `v`.
2. A permutation of `v` satisfies the two rows of `special134Relations`.
   Its first three coordinates therefore have ratio `1 : 3 : 4`.

The theorem does not assume primitivity. The coordinate cutoff and the
concrete finite covers are separate inputs. In particular, the number
`279841`, the chosen 230 primes, and their finite root certificates do not
occur as hidden assumptions in this generic theorem.

## Exact factor count

The proof uses a list of 111 signed integer factors.

| Factors | Count | Bound on absolute value |
| --- | ---: | ---: |
| The five speeds | 5 | `C` |
| `vᵢ − vⱼ` and `vᵢ + vⱼ`, for `i < j` | 20 | `2C` |
| The 80 canonical signed short forms | 80 | `3C` |
| Six factors attached to `x + y = z` | 6 | `4C` |

The six factors are

\[
y-3x,\quad 3y-x,\quad y+4x,\quad 4y+x,
\quad 3y+4x,\quad 4y+3x.
\]

The same list applies when the two addends are equal. Since
`x + y = z ≤ C`, each factor has absolute value at most `4C`. Bounding
`x` and `y` separately would give an unnecessarily larger estimate.

The module `RootIntegerFactors` proves that, for positive `x` and `y`,
one of these factors is zero exactly when `y = 3x` or `x = 3y`.
Together with `x + y = z`, this gives an actual positive `1 : 3 : 4`
triple.

## Choosing a prime

`RootIntegerAvoidance` proves a general signed-integer lemma. Replace every
zero factor by one. The resulting product is nonzero and has absolute
value at most `B ^ factors.length` when every original absolute value is
at most `B`, with `B ≥ 1`.

If the product of a finite set of distinct primes is larger than that
bound, one prime divides none of the replaced factors. For this prime,
every original factor which is divisible by the prime must equal zero.

This argument uses divisibility of products of distinct primes. It does
not assume that any original factor is nonzero. It therefore applies
without guessing which short integer relations hold.

## From 80 modular forms to 50 integer relations

The modular cover uses all 80 canonical signed forms: 40 doubled forms
and 40 forms supported on three coordinates. Their coefficient absolute
values sum to three. The first nonzero coefficient is positive, fixing
the overall sign.

The integer catalogue consists of the 50 forms containing a negative
coefficient. `RootIntegerForms` proves an explicit injective map from
these 50 rows to the 80-row table. The table equalities, its completeness
for mixed signs, and the converse additive representation are checked
by Lean's kernel.

The other 30 forms cannot vanish on positive integer speeds. This
exclusion is applied only after modular divisibility has become an
actual integer equality. The modular finite checker retains all 80
forms.

Every actual zero form is an additive relation

\[
v_i+v_j=v_k,
\]

with `i ≠ k` and `j ≠ k`. The proof allows `i = j`.
Two distinct zero forms give two distinct rows of the 50-row catalogue.

## The folded 1:3:4 branch

The global modular cover can also return a folded `1 : 3 : 4` triple.
Avoiding divisibility of the five speeds ensures that its base is
nonzero modulo the chosen prime. Since the prime is greater than seven,
the folded residues of the multiples `1`, `3`, and `4` are distinct.
They therefore correspond to three distinct coordinates.

Choose signs for these three coordinates. The proof forms a signed
short relation `r` and a phase vector `φ` such that

\[
r\mathbin{\cdot}\varphi=0,
\qquad
v_i\equiv \varphi_i A\pmod p
\]

on the support of `r`. Every phase on that support belongs to
`{−4, −3, −1, 1, 3, 4}`. Consequently the associated short form is
divisible by the chosen prime and is an actual integer zero.

If there is a unique actual zero form, compare it with its additive
representation `vᵢ + vⱼ = vₖ`. Their supports agree, including when the
additive relation was initially allowed to repeat a coordinate. The
phase values then satisfy

\[
\varphi_i+\varphi_j=\varphi_k.
\]

The module `RootIntegerPhases` checks all 216 triples of the six possible
phase values. Each valid triple has distinct first and second phase
values, and one of the six extra coefficient forms vanishes. The first
fact excludes a repeated coordinate. The second makes one of the six
extra integer factors divisible by the prime. Prime avoidance turns that
divisibility into zero, giving the actual positive `1 : 3 : 4` triple.

The permutation adapter in `LonelinessFiveSpeedTriplePermutation` puts
this triple into the first three coordinates and proves the requested
`special134Relations` matrix equation.

## Final cases

If two actual short forms already vanish, the 50-row mapping gives the
first outcome directly.

If exactly one actual short form vanishes, use its additive relation to
choose the six extra factors. The selected prime's global cover either
gives two short zero forms or gives the folded triple handled above.

If no actual short form vanishes, choose both extra-factor parameters to
be zero. These zero factors are replaced by one. Either structural
branch of the global cover then produces an actual short zero form,
contradicting this case.

The speed and pair factors remove the cover's zero-coordinate and
folded-collision alternatives. A modular witness contradicts
`value(v) < 1/5` through the already verified root semantics.

## Module boundaries

| Module suffix after `LonelinessFiveSpeed` | Responsibility |
| --- | --- |
| `RootIntegerAvoidance` | General prime avoidance with zero-factor replacement |
| `RootIntegerForms` | Exact 80-to-50 mapping, positivity exclusions, additive converse, `3C` bound |
| `RootIntegerFactors` | Six extra factors and their joint `4C` bound |
| `RootIntegerPhases` | Signed phase bookkeeping and the 216-case calculation |
| `RootInteger134` | Folded triple, uniqueness, and actual special relation |
| `RootIntegerLift` | Literal 111-factor list and the final conditional theorem |

The finite computations use `decide +kernel`. They do not use
`native_decide`. The numerical prime product and every modular root cover
must have their own verified receipts before this theorem can supply an
unconditional finite reduction.

## Frozen source receipt

The local gate controller completed with exit code zero. Its receipt is
`five-speed-root-integer-gates.log`. The machine-readable manifest
`five-speed-root-integer-manifest.json` records all 29 project source
dependencies, dependency pins, source-check logs, and emitted artifact
hashes. A separate hosted task checks this full project closure.

| Integer module suffix | Source SHA-256 |
| --- | --- |
| `Avoidance` | `bfa7a42b43eb52f8e803a7f98aef0747214851212f3e9c7433bfd82cb640567d` |
| `Forms` | `fb6985173907a5e7b13a0cc0ef99aba84c745477c05acd217235717590b5c839` |
| `Factors` | `d67bc675cbb2459f2f8c99222644dce6daeea75076586cac988f65dd60d19778` |
| `Phases` | `9873c644108b0b4b3129c77d3c58d7bcf217b42b40a72ecf7fa8187dc39a0a25` |
| `134` | `f30783bc2e3e9b9cba32b537213250d1474273abcf51972341642d0b2a25a2e0` |
| `Lift` | `558540fcef2eb6f0a89c9a1b3f2b028cf8ae2a563e9c5158f59b41f18b057364` |

The draft v1 manifest is retained as historical evidence. The one-line
list-membership repair in `Lift` defines the v2 source shown above; only
this v2 source has the completed lift receipt.
