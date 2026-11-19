# Equality cases for eleven through fourteen lonely runners

For eleven, twelve and thirteen runners the consecutive speeds are the unique primitive equality case. For fourteen runners there is one additional set, $`\{1,\ldots,11,13,24\}`$. These classifications use the binary sieve results of Sungkawichai–Trakulthongchai and Allikvere.

[Proof](PROOF.md) · [Verifier](verify.py) · [Catalogue](../../CONTENTS.md)

To replay the new calculations with Python 3.10 or later and a C++20 compiler, run the following from the repository root.

```sh
python3 results/tight-eleven-to-fourteen/verify.py
```

To verify the 44 original first-lift counts as well, download the authors’ immutable log and pass it to the verifier. It checks the file’s SHA-256 before extracting the counts.

```sh
curl -fsSL https://raw.githubusercontent.com/vzsky/13-lonely-runners/29311663c21835d67529b29a4acf6631fcad5c63/result_12 -o /tmp/lonely-runner-first-lifts.log
python3 results/tight-eleven-to-fourteen/verify.py --legacy-log /tmp/lonely-runner-first-lifts.log
```

## Lean scope

The displayed equality directions have their exact global values checked in Lean. The norm cutoffs and prime-selection steps are also checked under explicit smaller-dimensional runner bounds. The [exact conditional reduction](../../docs/loneliness-large-norm-lean.md) records the hypotheses and evidence. Those runner bounds, the exhaustive modular classifications and the uniqueness proofs remain open.
