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

## The ordinary saddle and Fourier inversion

For each $x>0$ and $n>0$, the [ordinary saddle theorem](../../lean/Conjectures/OrdinaryDarcaisSaddle.lean) proves that exactly one $0<r<1$ solves $x\sum_{k\ge1}\sigma_1(k)r^k=n$. The [characteristic-function theorem](../../lean/Conjectures/OrdinaryDarcaisCharacteristic.lean) identifies the generating series with the exponential on the open unit disk. The [inversion theorem](../../lean/Conjectures/OrdinaryDarcaisInversion.lean) recovers the centered second difference of the actual tilted ordinary coefficients from its Fourier integral. The [phase estimates](../../lean/Conjectures/OrdinaryDarcaisPhase.lean) also hold for every such tilt.

For every $x\ge1$ and integer $n\ge501$, the [reduction theorem](../../lean/Conjectures/OrdinaryDarcaisFourierReduction.lean) derives strict Turán log-concavity from two estimates at that unique saddle. The first is $256 K_3^2\le49 V^3$, where $V=x\sum_{k\ge1} k\sigma_1(k)r^k$ and $K_3=x\sum_{k\ge1} k^2\sigma_1(k)r^k$. The second bounds the normalized tail integral from $11/4$ to $\pi\sqrt V$ below by $-19/50$.

The finite Turán cases 51–500, the two uniform estimates at indices 501 and above, and the fractional Chern–Fu–Tang corollary remain outside this receipt. The earlier finite and central-integral proofs follow the contribution by [AlexisFimeyer in PR #665](https://github.com/1337isnot1337/solved-conjectures/pull/665).

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

The [ordinary Fourier receipt](verification/fourier-receipt.json) records strict compilation of 22 modules, an audit of 440 owned declarations including 371 theorems, and stock-kernel replay. Two independent runs verified all 29 registered endpoints and the same proof-source hashes.
