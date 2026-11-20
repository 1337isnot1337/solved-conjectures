# NSS research materials

`../nemeth-seberry-shu-candidate-proof.md` gives the candidate asymptotic disproof of the Nemeth–Seberry–Shu conjecture. `../nemeth-seberry-shu-status-search.md` records literature checks. No Lean files are used.

## Reproducible numerical sanity check

Run with Python 3.10 or later, standard library only:

```sh
python sanity_check.py --output sanity-results.json
```

The default run is deliberately bounded: primes 7, 11, 13, 17, 19; two dense degrees per prime; three amplitudes per degree; 30 matrices total. `--primes` accepts only primes from 7 through 19, to avoid unexpectedly expensive exponential computation. The recorded run took a few seconds.

The script constructs each support by independent Bernoulli sampling, then adds/deletes randomly chosen positions to force the specified degree. Every seed is SHA256-derived from the prime, degree and amplitude index; all supports and seeds are saved in the JSON output. No favorable samples are selected or discarded. Python's random-number implementation is the reproducibility dependency; the saved supports permit checking the permanent counts without regenerating randomness.

### What is independently checked

The permanent is counted with an **exact integer subset dynamic program**, independent of the determinant estimate and Fourier argument. For column subset T, `dp[T]` counts assignments of the first |T| rows to exactly those columns. Transitions append one allowed unused column. The terminal value is the exact permanent. For p=7 this is additionally compared with direct enumeration of every permutation.

Assertions check cardinality, Parseval's identity, conjugate exceptional eigenvalues, the stated coarse Fourier bound, and permanent congruence modulo p. The JSON also records a floating-point evaluation of the finite determinant expression, the proposed limiting expression, their deviations from the exact normalized logarithmic permanent, and the spectral norm.

### Recorded outcome and important limitations

- All 30 cases passed all assertions.
- Maximum floating-point Parseval error: 2.67×10⁻¹⁵.
- Exact permanent minus finite-determinant normalized log prediction ranged from about −0.174 to −0.0119. This is finite-size evidence, not an error bound or a convergence proof.
- **15 of the 30 matrices have spectral norm greater than 1/2.** These small instances are not asserted to meet the eventual fixed bound used in the proof.
- Different target amplitudes sometimes produce the **same permanent**; for p=7 each tested degree gives only one distinct value. This is expected at small sizes and is reported rather than concealed.
- The explicit Fourier bound 12√(log p/p) is extremely coarse and vacuous for these small primes. Passing it is not meaningful evidence of the asymptotic construction's quality.
- The theorem is asymptotic and uses an existence argument, not a claim that every finite random sample has separated permanent values.

These calculations do **not** prove the conjecture false, certify a threshold, establish monotone convergence, give a polynomial rate, or settle the fixed-sparse-degree rival conjecture. Only the written proof addresses the unrestricted asymptotic question.

## Explicit-constant audit

1. Sampling probabilities: ρ∈[1/3,2/3], 0≤a≤1/12 give ρ+2a cos θ∈[1/6,5/6].
2. For one complex Fourier error, splitting real/imaginary deviations at t/√2 and applying Hoeffding gives probability at most 4 exp(−t²/p). At t=2√(p log p), a union over p frequencies gives at most 4/p³, below one for p≥3.
3. Cardinality repair makes at most t edits, each changing any Fourier coefficient by at most one. Total error at most 2t=4√(p log p). Dividing by k≥p/3 gives 12√(log p/p).
4. Entries of B=C/k−J have absolute value at most 2/p. Its spectral norm is at most 1/4+12√(log p/p), eventually at most 1/2.
5. For x∈[0,1), h(x)=Σ_(r≥2)x^r/r≤x²/[2(1−x)]. Together with total nonconstant Fourier squared mass at most 2, this makes the small-mode correction O(log p/p).
6. For a_j=j/(12M), the adjacent limiting-factor difference is at least half the difference of the fourth powers of a_j/ρ. Since ρ≤2/3 and j≥1, this is at least ((j+1)^4−j^4)/(2·8⁴M⁴)≥15/(8192M⁴). The remaining positive power-series terms only increase the difference.
7. The external permanent theorem supplies a uniform **qualitative** o(1); this note does not invent an explicit threshold from that term.
