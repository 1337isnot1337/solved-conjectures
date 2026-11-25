# Lean formalization of the ordinary D’Arcais root conjecture

This is a partial formalization of Heim–Neuhauser’s Conjecture 2. Lean checks
the ordinary sigma-one definition from the literal formal exponential
generating function, its recurrence, and positivity for every real
$`x>0`$.

For every real $`x\ge1`$, Lean proves $`P_{n+1}(x)^n<P_n(x)^{n+1}`$
for $`6\le n\le50`$. The [finite module](../../lean/Conjectures/OrdinaryDarcaisFinite.lean)
checks the root comparisons for indices 6–25 and the strict Turán inequalities
for 26–50. The kernel checks each factorial-cleared row against the recurrence.
It verifies the coefficient comparisons by packing nonnegative polynomial
coefficients in integer digits. The proof of the checker bounds each digit
by its radix and certifies strictness from the constant term after shifting
the parameter by 1. The same module proves that log-concavity at every index
from 51 onward suffices for the full root conjecture.

The [central integral module](../../lean/Conjectures/OrdinaryDarcaisCentral.lean)
proves the exact Taylor integral bound $`19/50`$, applies it on the normalized
interval $`[0,2]`$ given the pointwise saddle bounds, and checks the nonnegative
contribution through $`11/4`$. The
[root module](../../lean/Conjectures/OrdinaryDarcaisRoot.lean) checks the change
of variable back to the Fourier integral and derives strict log-concavity
from the Fourier identity, phase and damping hypotheses, and a tail bound.

The remaining Lean obligations are the finite Turán cases 51–500 and the
saddle construction, Fourier inversion for the tilted coefficients, and
uniform phase, damping and tail bounds for indices 501 and above. The
corrected fractional Chern–Fu–Tang corollary is also outside the Lean scope.
The complete written proof and all three exact arithmetic checkers are
linked on the [result page](README.md).

## Replay

Run from the repository root with the pinned Lean toolchain on the path.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.OrdinaryDarcaisRoot \
  --require OrdinaryDarcais.divisorSum_eq_sigma_one \
  --require OrdinaryDarcais.darcais_recurrence \
  --require OrdinaryDarcais.darcais_pos \
  --require OrdinaryDarcais.strictTuran_of_tilted_center \
  --require OrdinaryDarcais.scaledValue_succ \
  --require OrdinaryDarcais.compareDigits_sound \
  --require OrdinaryDarcais.checkedRow_eval \
  --require OrdinaryDarcais.rootDecrease_small \
  --require OrdinaryDarcais.strictTuran_finite \
  --require OrdinaryDarcais.rootDecrease_through_fifty \
  --require OrdinaryDarcais.rootDecrease_of_remaining_turan \
  --require OrdinaryDarcais.central_lower_integral \
  --require OrdinaryDarcais.central_fourier_bound \
  --require OrdinaryDarcais.normalized_fourier_pos_of_tail \
  --require OrdinaryDarcais.strictTuran_of_fourier_bounds \
  --out results/heim-neuhauser-ordinary-darcais-root/verification
```

The [receipt](verification/receipt.json) records strict compilation, an axiom
audit of every owned declaration, and stock-kernel replay of the seven-module
closure. The permitted transitive axioms are `propext`, `Classical.choice`,
and `Quot.sound`.
