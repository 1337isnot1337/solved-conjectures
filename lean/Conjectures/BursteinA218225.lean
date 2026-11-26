import Conjectures.BursteinA218225TreeX
import Conjectures.BursteinA218225TreeY
import Conjectures.BursteinA218225Kernel

/-!
# Burstein's A218225 Enumeration Conjecture — Main Theorem

Resolves the two outstanding clauses of Burstein's 2017 conjecture (Chern–Fu–Lin,
Conjecture 1.1 and §6; OEIS A218225):
- `X = Av(2134, 42153, 24153)` and `Y = Av(2143, 42135, 24135)` are equinumerous at every length `n`;
- their common nonempty generating series `P = ∑_{n ≥ 1} |X_n| x^n = ∑_{n ≥ 1} |Y_n| x^n`
  is the unique formal power series with zero constant term satisfying
  `P = (1 + P)(x + (1 - x)P^2)`.
-/

namespace Conjectures.BursteinA218225

theorem seriesX_eq_P_tree : seriesX = P_tree := by
  apply PowerSeries.ext
  intro n
  cases n with
  | zero =>
    simp [seriesX, P_tree, U, treeCount]
  | succ n =>
    simp [seriesX, P_tree, U, countX_eq_treeCount]

theorem seriesY_eq_P_tree : seriesY = P_tree := by
  apply PowerSeries.ext
  intro n
  cases n with
  | zero =>
    simp [seriesY, P_tree, U, treeCount]
  | succ n =>
    simp [seriesY, P_tree, U, countY_eq_treeCount]

/-- The classes `X = Av(2134, 42153, 24153)` and `Y = Av(2143, 42135, 24135)` are
equinumerous at every length `n` (including `n = 0`). -/
theorem countX_eq_countY (n : ℕ) : countX n = countY n := by
  rw [countX_eq_treeCount, countY_eq_treeCount]

/-- The nonempty generating series of `X` satisfies Burstein / Chern–Fu–Lin's cubic equation. -/
theorem seriesX_equation :
    PowerSeries.constantCoeff seriesX = 0 ∧
    seriesX = (1 + seriesX) * (PowerSeries.X + (1 - PowerSeries.X) * seriesX ^ 2) := by
  rw [seriesX_eq_P_tree]
  exact P_tree_equation

/-- The nonempty generating series of `Y` coincides with `seriesX` and satisfies the same cubic. -/
theorem seriesY_equation :
    seriesY = seriesX ∧
    PowerSeries.constantCoeff seriesY = 0 ∧
    seriesY = (1 + seriesY) * (PowerSeries.X + (1 - PowerSeries.X) * seriesY ^ 2) := by
  refine ⟨seriesY_eq_P_tree.trans seriesX_eq_P_tree.symm, ?_⟩
  rw [seriesY_eq_P_tree]
  exact P_tree_equation

/-- Uniqueness: any formal power series with zero constant term satisfying the cubic equation
coincides with both `seriesX` and `seriesY`. -/
theorem series_unique (Q : PowerSeries ℤ)
    (h0 : PowerSeries.constantCoeff Q = 0)
    (heq : Q = (1 + Q) * (PowerSeries.X + (1 - PowerSeries.X) * Q ^ 2)) :
    Q = seriesX ∧ Q = seriesY := by
  have hX := seriesX_equation
  have hY := seriesY_equation
  exact ⟨cubic_solution_unique Q seriesX h0 hX.1 heq hX.2,
    cubic_solution_unique Q seriesY h0 hY.2.1 heq hY.2.2⟩

end Conjectures.BursteinA218225
