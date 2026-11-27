# Chen–Khare–Sahi's conjecture

Research checkpoints, 21–26 November 2026. Coordination in [issue #201](https://github.com/1337isnot1337/solved-conjectures/issues/201).

## Exact source and separate statements

The primary source is Chen–Khare–Sahi, *Majorization via positivity of Jack
and Macdonald polynomial differences*, [arXiv:2509.19649v2](https://arxiv.org/html/2509.19649v2).

Conjecture 4 asks that a normalized Jack difference at parameter τ belong
to the Jack semiring at σ when 0≤σ<τ≤∞ and the partitions are in dominance
order. A [two-column theorem and its rectangular shifts](TWO-COLUMNS.md) establish the stronger cone inclusion in arbitrary rank for that family. A [width-three counterexample](jack-disproof/PROOF.md) disproves the full semiring conjecture in every rank at least five. The [independent review and exact checks](jack-disproof/REVIEW.md) distinguish the two results.

Conjecture 5 asks for a full equivalence of dominance, several evaluation
positivity conditions, and membership of normalized Macdonald differences
in the Muirhead semiring. A complete exact counterexample to its semiring
clause was found in this work and was [published with its independent review](../../results/chen-khare-sahi-macdonald/README.md). The discovery scripts here
are not the final proof certificate.

[Sra's October 2026 paper](https://suvrit.github.io/papers/jackratio/jackratio-v1.pdf)
proves the Jack evaluation inequality in all ranks and some Macdonald
evaluation cases, including the Macdonald partition pair used below. It
does not assert semiring membership. The distinction is essential.

## Jack diagnostic

`jack_semiring_probe.py` constructs Jack polynomials over the rational
numbers from their triangular differential eigenoperator, using τ=1/α.
For a fixed homogeneous degree it enumerates all products of normalized
Jack polynomials and dominance-cover differences. Products containing no
difference can be omitted when the target vanishes on the all-ones
diagonal. A numerical dual linear program proposes separators. A reported
`EXACT_DUAL` is accepted only after checking every generator inequality
and the strict target inequality with rational arithmetic.

As a negative control, the code reproduces the source's Example 4.7:
n=3, degree 3, σ=1 and τ=0, which is the forbidden parameter ordering.
In the unnormalized monomial coefficient coordinates (300,210,111), the
functional (-1,1,-1) takes values 2,1,7 on the primitive semiring product
generators and value -1/2 on M300−M210.

No separator was found in these bounded permitted-parameter diagnostics:

| n | Degree | σ | τ values |
|---|---:|---:|---|
| 3 | 7 | 1 | 2, 5, 100 |
| 3 | 9 | 1 | 101/100, 2, 11 |
| 4 | 7 | 1 | 101/100, 2, 11 |
| 4 | 8 | 1 | 101/100, 2, 11 |
| 3 | 8 | 2 | 201/100, 3, 12 |
| 4 | 7 | 0 | 1/100, 1, 10 |
| 4 | 10 | 1 | 1001/1000, 2, 100 |
| 5 | 9 | 1 | 1001/1000, 2, 100 |
| 4 | 10 | 10 | 10001/1000, 11, 1000 |

These observations prove no new Jack case; the LP calculations were used
only to seek a full-conjecture obstruction.

## Macdonald diagnostic and exact candidate

`macdonald_semiring_probe.py` constructs monic Macdonald polynomials by
the horizontal-strip branching rule over the rational numbers. Its
q=t specialization agrees exactly with the independent Jack construction
at τ=1 for n=2,3,4 and all degrees 1 through 6. The test cone is the
Muirhead semiring, obtained by setting σ=0 in the generator construction.

Initial probes found rational separators at n=3, degree 9 and n=4,
degree 8, both at q=1/10,t=9/10. Reducing the example gives n=3, degree 6,
λ=(4,2,0), μ=(4,1,1), at the same parameters. On the normalized monomial
basis (M600,M510,M420,M411,M330,M321,M222), take

L=(62,28,9,9,2,2,0).

The exact normalized Macdonald difference has functional value

−4538292661539/106631184392870.

The complete degree-six semiring can be checked using 38 reduced products
and the 7 ordinary normalized monomial generators. The separate proof
package proves exhaustiveness, supplies the exact table, and independently
identifies the two Macdonald polynomials through their q-difference
eigenoperator. It also gives an infinite family of rectangular translates.
The final verifier has no dependency on these discovery scripts, numerical
linear programming, or Lean.

## Reproduction

These discovery scripts require NumPy and SciPy. For example:

```sh
python jack_semiring_probe.py --n 4 --degree 10 --sigma 1 --taus 1001/1000,2,100
python macdonald_semiring_probe.py --n 3 --degree 6 --parameters 1/10:9/10
```

A numerical LP failure or negative objective without an exact dual check
is not a certificate. No positive finite search range is counted as a
resolution.
