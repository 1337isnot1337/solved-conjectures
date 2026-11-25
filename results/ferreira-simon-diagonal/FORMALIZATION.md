# Lean scope for Ferreira–Simon's diagonal conjecture

**Status: partial.** The [Lean module](../../lean/Conjectures/FerreiraSimonDiagonal.lean)
checks the strict comparison in the [written proof](PROOF.md) for the full real
interval. It also gives a conditional theorem for the actual Mittag–Leffler series.

- `integral_density_eq_quantile` proves the sine-quantile change of variables
  for the explicit Pollard density.
- `densityIntegral_eq_pairedIntegral` proves the reciprocal pairing.
  `pairedIntegral_strictMono` and `densityIntegral_strictMono` prove strict
  monotonicity on the whole interval.
- `mittagLeffler_at_one_hasDerivAt` derives the diagonal series from the
  derivative of the one-parameter series at one. The proof bounds the reciprocal
  Gamma coefficients and differentiates term by term.
- `diagonal_strictMono_of_pollard` proves Remark 5(b) from
  `PollardRepresentation`. The hypothesis equates the one-parameter series
  and the Laplace integral on a neighborhood of one for each parameter in the
  open unit interval. Differentiation under this integral is checked in Lean.

Proving `PollardRepresentation` would discharge the remaining hypothesis of
the main inequality. The endpoint limits and crossing consequence are outside
this checkpoint.

## Replay

From the repository root with its pinned Lean toolchain on the path:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.FerreiraSimonDiagonal \
  --require FerreiraSimonDiagonal.pairedIntegral_strictMono \
  --require FerreiraSimonDiagonal.integral_density_eq_quantile \
  --require FerreiraSimonDiagonal.densityIntegral_eq_pairedIntegral \
  --require FerreiraSimonDiagonal.densityIntegral_strictMono \
  --require FerreiraSimonDiagonal.mittagLeffler_at_one_hasDerivAt \
  --require FerreiraSimonDiagonal.diagonal_strictMono_of_pollard \
  --out results/ferreira-simon-diagonal/verification
```

The [receipt](verification/receipt.json) records the scoped strict build, audit
of all owned declarations, and stock-kernel replay.
