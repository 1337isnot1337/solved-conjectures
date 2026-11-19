# Ten lonely runners, unique equality case

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

The consecutive speeds 1 through 9 are the only primitive set attaining a loneliness of 1/10. The [proof](PROOF.md) gives the geometric argument, prior results, and finite checks.

Run the [exhaustive verifier](verify.py) from the repository root.

```sh
python3 results/tight-nine-speeds/verify.py
```

The proof is unrefereed. Lean verifies that the consecutive direction has global value `1/10`, and proves the norm cutoff and prime selection under explicit smaller-dimensional runner bounds. The [exact conditional reduction](../../docs/loneliness-large-norm-lean.md) records the hypotheses and checked evidence. Those runner bounds, the exhaustive modular classification and the uniqueness proof remain open.
