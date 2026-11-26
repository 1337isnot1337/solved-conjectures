# Lean verification: Burstein’s A218225 enumeration conjecture

[Lean entry module](../../lean/Conjectures/BursteinA218225.lean) · [Written proof](PROOF.md) · [Independent audit](AUDIT.md)

The six-module closure proves the two outstanding clauses of Burstein’s 2017 conjecture (Chern–Fu–Lin, Conjecture 1.1 and §6; OEIS A218225) over `Equiv.Perm (Fin n)` for all lengths `n : ℕ` (including `n = 0`):

- `Conjectures.BursteinA218225.countX_eq_countY`: literal equinumerosity `countX n = countY n` of `X = Av(2134, 42153, 24153)` and `Y = Av(2143, 42135, 24135)` for every `n : ℕ`.
- `Conjectures.BursteinA218225.seriesX_equation` and `Conjectures.BursteinA218225.seriesY_equation`: the common nonempty ordinary generating series `P = ∑_{n ≥ 1} |X_n| x^n = ∑_{n ≥ 1} |Y_n| x^n` in `PowerSeries ℤ` has zero constant term and satisfies `P = (1 + P) * (X + (1 - X) * P ^ 2)`.
- `Conjectures.BursteinA218225.series_unique`: uniqueness of the zero-constant-term formal power series solution to that cubic equation.

## Module structure

1. [BursteinA218225Defs.lean](../../lean/Conjectures/BursteinA218225Defs.lean) — literal pattern containment, `InX`/`InY`, `countX`/`countY`/`seriesX`/`seriesY`, maximum insertion/deletion (`insertMax`/`deleteMax`/`insertMaxEquiv`), 1-based occurrence statistics, and the generic tree-isomorphism counting theorem `card_eq_treeCount_of_treeIso`.
2. [BursteinA218225TreeX.lean](../../lean/Conjectures/BursteinA218225TreeX.lean) — generating tree for `X` (`countX_eq_treeCount`).
3. [BursteinA218225TreeY.lean](../../lean/Conjectures/BursteinA218225TreeY.lean) — identical generating tree for `Y` (`countY_eq_treeCount`).
4. [BursteinA218225Series.lean](../../lean/Conjectures/BursteinA218225Series.lean) — algebraic compression of consecutive `B`-steps in `PowerSeries ℤ`, formal ansatz `U(a, m) = α_a * v^(m - a) + β_a`, and uniqueness.
5. [BursteinA218225Kernel.lean](../../lean/Conjectures/BursteinA218225Kernel.lean) — formal kernel method entirely in `PowerSeries ℤ` and `PowerSeries (PowerSeries ℤ)` (no Laurent series), finite-sum `RingHom` evaluation `evalAt`, existence of the formal root `r`, elimination to `P_tree = (1 + P_tree) * (X + (1 - X) * P_tree ^ 2)`, and uniqueness.
6. [BursteinA218225.lean](../../lean/Conjectures/BursteinA218225.lean) — literal main theorems assembling `TreeX`, `TreeY`, and `Kernel`.

## Reproduce the scoped gate

After installing the pinned Mathlib cache, run from the repository root:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.BursteinA218225 \
  --require Conjectures.BursteinA218225.countX_eq_countY \
  --require Conjectures.BursteinA218225.seriesX_equation \
  --require Conjectures.BursteinA218225.seriesY_equation \
  --require Conjectures.BursteinA218225.series_unique \
  --out /tmp/burstein-a218225-check
```

The [receipt](verification/receipt.json) binds the strict build (`-j1 -DwarningAsError=true`), the all-owned axiom audit (815 declarations, 719 theorems, only `propext`, `Classical.choice`, `Quot.sound`), and independent stock kernel replay (`leanchecker`) to the exact proof source and tools. It does not certify the repository-wide gate.
