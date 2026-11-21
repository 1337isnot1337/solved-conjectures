# Sun's prime plus Pell plus twice-Pell bounty: finite-cover audit

Status: **no counterexample, no proof of the conjecture, and no bounty claim**.
The completed result in this directory rules out one finite congruence-cover
construction. It is not counted as a solved open problem.

Target and coordination: [repository issue #226](https://github.com/1337isnot1337/solved-conjectures/issues/226).
The target is Conjecture 1.7 in
[Sun, arXiv:0901.3075v3](https://arxiv.org/abs/0901.3075v3): for every integer
`n > 5`, find an odd prime `q` and positive indices `s,t` such that
`n = q + P_s + 2 P_t`, where `P_0=0`, `P_1=1`, and
`P_(k+2)=2 P_(k+1)+P_k`. The parent campaign owns the current bounty and prior-art
audit. This directory investigates the counterexample route.

## What has been proved here

There is no complete congruence cover using odd primes whose Pell state period
divides 120. This holds for both parities of `n` and every simultaneous choice
of residues `n mod p` at these primes. Four exact certificates prove the claim.

| Certificate | Parity and branch | Positive weighted cells | Total weight | Sum of maximum prime capacities |
|---|---|---:|---:|---:|
| `capacity120-odd.json` | `n` odd | 1,041 | 1,000,000,035 | 969,992,699 |
| `capacity120-even-mod3-0.json` | `n` even, `n mod 3 = 0` | 340 | 999,999,951 | 712,112,377 |
| `capacity120-even-mod3-1.json` | `n` even, `n mod 3 = 1` | 366 | 1,000,000,028 | 698,730,641 |
| `capacity120-even-mod3-2.json` | `n` even, `n mod 3 = 2` | 362 | 1,000,000,031 | 698,730,641 |

The inequality in the last two columns is strict in every row. The three
even branches exhaust the possible residues modulo 3.

These certificates eliminate the chosen method. An uncovered congruence cell
does not produce a prime representation, so this result does not establish
Sun's conjecture. It also does not exclude covers at larger periods.

## Why the certificates work

The recurrence is invertible modulo every prime. Therefore a prime `p` has
Pell state period dividing `L` exactly when

```
p divides gcd(P_L, P_(L+1) - 1).
```

For `L=120`, the complete factorization is

```
gcd(P_120, P_121 - 1)
 = 65467555105469489418600
 = 2^3 3^2 5^2 7 11 19 29 31^2 41 59 269 601 2281.
```

The verifier checks this product and primality of all its factors by trial
division. Thus the prime list is complete; in particular, the prime 2281 is
included even though a prime cutoff at 2000 would miss it.

Since `P_s` has the parity of `s`, an odd remainder
`q=n-P_s-2P_t` requires `s` to have parity opposite to `n`. Only those residue
pairs need to be covered. A zero residue index represents the positive index
`L`, so positive indices are respected.

For a finite collection of residue pairs `(s,t)` with positive integer weights
`w(s,t)`, define the capacity of an available prime `p` to be

```
C_p = max_a sum { w(s,t) : P_s + 2 P_t = a mod p }.
```

Whatever residue `n mod p` is chosen, prime `p` covers weight at most `C_p`.
If the sum of capacities over all available primes is smaller than the total
weight, the union of their chosen residue classes cannot cover every weighted
pair. This is an exact weighted union bound.

For an even branch with `n mod 3` fixed, all listed weighted cells avoid that
residue modulo 3. The prime 3 therefore contributes no coverage, and the
certificate sums capacities over the other eleven primes. For odd `n`, the
single certificate includes all twelve odd primes.

The optimizer only proposed the weights. `verify_capacity.py` recomputes all
Pell integers and all capacities independently, using Python integers only.
It checks the input types, parity, bounds, positive weights, distinct cells,
fixed congruences, complete period-prime factorization, stated totals, and
the strict inequality. It imports no optimizer, NumPy, or SymPy.

## Recheck the completed result

From this directory, run:

```sh
python verify_capacity.py capacity120-odd.json capacity120-even-mod3-0.json capacity120-even-mod3-1.json capacity120-even-mod3-2.json
```

All four certificates passed this independent check. `capacity_certificate.py`
is the discovery program and uses NumPy, SciPy, and SymPy. For example:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python capacity_certificate.py --period 120 --n-parity 0 --fixed 3:0 --time-limit 20 --output regenerated-even-0.json
python verify_capacity.py regenerated-even-0.json
```

An optimizer can return different weights on another run. Its output matters
only if the independent exact verifier accepts it.

## Search results and limits

`search_cover.py` models a cover as one residue choice per prime, with every
necessary pair required to match at least one choice. Its period-120 even
MILP reported infeasibility, and its odd LP relaxation reported infeasibility.
Those solver messages are superseded by the exact certificates above.

The period-240 even LP was feasible. Its integer solve was interrupted after
several minutes without an incumbent or final result. `cover240-even.json`
records the interruption; no infeasibility conclusion follows.

For period 840, `factors840.json` records the factorization via the Pell
cyclotomic components of `P_420`, and `period840-primes.json` records the
complete factorization of `gcd(P_840,P_841-1)=2 P_420`. There are 36 odd primes,
including primes much larger than the initial small-prime list. The largest
is `2836044823096181761`. The product was checked exactly and every factor
passed SymPy's primality check.

`cutting_cover.py` implements a constraint-generation search: a proposed
solution to a smaller necessary system is checked on the whole period grid,
and missing cells would be added. Its first period-840 even model timed out
with no incumbent. `cutting840-even.json` preserves that failed attempt; no
partial cover is treated as a full cover.

Uniformly lifting the four period-120 certificates to period 840 did not
produce a new obstruction. The capacity-to-weight ratios became approximately
1.22405 for odd `n`, and 1.03167, 1.01590, 1.01564 for the three even branches.
The strict inequality required by the certificate was lost. Two bounded LP
checks then tried adjusted weights on 5,000 cells, with `n mod 3 = 0` and each
parity. Both reached the 40-second solver limit without a feasible solution
or a new certificate. Their logs are `capacity840-even-mod3-0.json` and
`capacity840-odd-mod3-0.json`. The period-840 question remains undetermined.

The finite-cover search is now paused. More unrestricted MILP runs have no
identified advantage. A future attempt needs a structural construction or a
smaller mathematically justified system; it should retain the complete prime
set and explicitly handle the prime-remainder exceptions.

The separate `cover-to-counterexample.md` explains how a genuine full cover
would be converted into a counterexample, including the exceptional case
where a divisible prime remainder equals the covering prime itself.

## Files

- `capacity120-*.json`: the four completed exact certificates.
- `verify_capacity.py`: independent integer-only verifier for those certificates.
- `capacity_certificate.py`: LP proposal and exact capacity arithmetic.
- `search_cover.py`: direct finite-cover LP/MILP discovery model.
- `cutting_cover.py`: full-cover search by adding necessary cell constraints.
- `cover120-*.json`, `cover240-even.json`, `cutting840-even.json`: honest solver logs.
- `factors840.json`, `period840-primes.json`: full larger-period factorization data.
- `lift_capacity.py`, `lift840-summary.json`: reproducible failed uniform lifts.
- `capacity840-*.json`: bounded LP attempts that found no new obstruction.

No Lean proof has been submitted, and no external bounty submission has been made.
