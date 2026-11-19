# Verified seven-speed norm and reduced prime sets

The component `Conjectures.LonelinessSevenSpectrumNormGeometry` passed the full
verification gate at source commit
`f782472e2ccd4d276ed6090b30727dbd2b92346e`. The containing-plane gap remains an
explicit hypothesis. The complete seven-speed spectrum remains unfinished.

## Mathematical scope

Let `v : Fin 7 → ℕ` have positive coordinates, gcd one, and actual loneliness
`value (List.ofFn v) ≤ 1/7`. The remaining geometric hypothesis is:

```lean
∀ E : Submodule ℚ (Fin 7 → ℚ),
  (fun i => (v i : ℚ)) ∈ E → Module.finrank ℚ E = 2 →
    (5 / 33 : ℝ) ≤ spaceValue (realSpan E)
```

The proof constructs a reduced integral basis extending the actual primitive
vector. It derives all six Gram-length prefix bounds, the adjacent ratio
inequalities, and the determinant product identity from that basis. The accepted
Renault five-speed bound, four-speed bound, and smaller-runner bounds discharge
the smaller-runner inputs.

The exact KZ increment product is `8993 / 1186638179795145`. It yields:

| Endpoint | Verified conclusion |
| --- | --- |
| `squaredNorm_mul_le` | `8993 * squaredNorm v ≤ 1186638179795145` |
| `natural_squaredNorm_le` | `∑ i, (v i)^2 ≤ 131951315444` |
| `norm_lt` | The Euclidean norm of `v` is strictly below `363252`. |
| `exists_prime_avoiding` | One of the original nineteen primes divides no coordinate. |
| `exists_prime_avoiding16` | One of the first sixteen original primes divides no coordinate. |

The sixteen-prime set is
`[151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233]`.
Its product is `2979016728400558169766012863439613547`, and the exact inequality
`131951315444^7 < 7^7 * (∏ p ∈ primeSet16, p)^2` is verified.

For the strict sublevel `value (List.ofFn v) < 1/7`, the independent theorem
`forced_divisor_of_strict` proves that `420` divides the product of the speeds.
Together with the norm bound and coprimality, this gives
`exists_prime_avoiding15` for
`[151,157,163,167,173,179,181,191,193,197,199,211,223,227,229]`.
The strict inequality is part of this theorem's statement. The sixteen-prime
result retains the closed `≤ 1/7` threshold.

The containing-plane gap, its exceptional cases, and the remaining finite
residue classification are separate obligations. This registration does not
change a result-directory completion status.

## Original verification

- [Run 44576585527](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44576585527)
- [Job 135745583518](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44576585527/job/135745583518)
- [Artifact 14556969731](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44576585527/artifacts/14556969731)

All 129 project modules were freshly compiled with
`-j1 -M4500 -DwarningAsError=true`. The complete ownership audit covered 3,620
declarations, including 2,881 theorems and 280 private declarations. All 27
required endpoints and all seven literal quantified contracts passed. The only
permitted transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`.

The unchanged stock `leanchecker` replayed each of the 129 project modules in
a separate process. Every log identified exactly its intended single target.
Sources, object facets, helper files, configuration, process logs, and progress
records remained unchanged throughout the gate.

| Evidence | Exact value |
| --- | --- |
| Module source SHA-256 | `aafb1d20ad57592aa52f3b2d025bb4a8cddfc606415cce349883c8135472e681` |
| Original ZIP SHA-256 | `e94a210f21bbd4f19e37bd1466c82948f25deb0bfb2e02b22562b5e5852bd948` |
| Original ZIP bytes | `23210448` |
| Original receipt SHA-256 | `583fcd94f60c5606bb1ebdf9bf1030f59ac573e4b13e92cb1324d6a04216c0b1` |
| Authenticated archive members | `782` |
| Fresh source time, all modules | `586.424` seconds |
| Stock replay time, all modules | `681.701` seconds |

## Preserved evidence and offline authentication

The original receipt, declaration inventory, audit and statement sources, all
source/kernel/audit/statement logs, and all process records are preserved
unchanged here. The GitHub run, job, and artifact metadata and the original job
log are under `github/`. `archive-members.json` records the size and SHA-256 of
every original archive member, including each source and proof-object facet.
`preservation.json` records the separate authentication operation.

`scripts/validate_seven_spectrum_norm_archive.py` authenticates the ZIP and raw
receipt digests against the hosted job log, binds the run, job, artifact, and
source commit, checks every archived source and object, reconstructs the
complete ownership audit, checks the literal theorem contracts, and validates
every command, exit status, log, and process record. It performs no new Lean
execution. The receipt's original bytes are not rewritten.

For reproduction, check out the exact source commit separately, obtain the
original ZIP, and run the validator with a new output directory:

```sh
python scripts/validate_seven_spectrum_norm_archive.py \
  --snapshot /path/to/f782472 \
  --archive /path/to/seven-spectrum-norm-exact.zip \
  --metadata-dir docs/verification/seven-spectrum-norm-exact-44576585527/github \
  --head f782472e2ccd4d276ed6090b30727dbd2b92346e \
  --run 44576585527 --job 135745583518 --artifact 14556969731 \
  --zip-sha256 e94a210f21bbd4f19e37bd1466c82948f25deb0bfb2e02b22562b5e5852bd948 \
  --receipt-sha256 583fcd94f60c5606bb1ebdf9bf1030f59ac573e4b13e92cb1324d6a04216c0b1 \
  --out /path/to/fresh-authentication-output
```
