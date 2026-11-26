import Conjectures.BraunBrueggeThetaOptimizerFinite
import Conjectures.BraunBrueggeThetaOptimizerLarge

/-! Braun and Bruegge's journal Conjecture 33 on geometric theta-graph facets. -/

namespace BraunBruegge

/-- The proposed triple for even vertex order, in ascending order of path length. -/
theorem thetaOptimizer_even_order (k : ℕ) (hk : 5 ≤ k) :
    thetaOptimizerLengths (2 * k + 1) =
      if k % 2 = 0 then ![1, k, k] else ![1, k - 1, k + 1] := by
  by_cases h : k % 2 = 0 <;> simp only [h, ite_true, ite_false] <;> funext i <;> fin_cases i <;>
    simp [thetaOptimizerLengths, thetaLengths, thetaOptimizerLeft, thetaOptimizerRight, thetaOptimizerShort] <;> omega

/-- The proposed triple for odd vertex order, in ascending order of path length. -/
theorem thetaOptimizer_odd_order (k : ℕ) (hk : 6 ≤ k) :
    thetaOptimizerLengths (2 * k) =
      if k % 2 = 0 then ![2, k - 1, k - 1] else ![2, k - 2, k] := by
  by_cases h : k % 2 = 0 <;> simp only [h, ite_true, ite_false] <;> funext i <;> fin_cases i <;>
    simp [thetaOptimizerLengths, thetaLengths, thetaOptimizerLeft, thetaOptimizerRight, thetaOptimizerShort] <;> omega

/-- For every n ≥ 10 the proposed three-path graph maximizes the geometric facet count.
Equality holds exactly for its path lengths in arbitrary order. -/
theorem braun_bruegge_theta_optimizer (n : ℕ) (hn : 10 ≤ n) (length : Fin 3 → ℕ)
    (hp : ∀ i, 0 < length i) (hs : ∑ i, length i = n + 1) :
    Nat.card {F // IsFacet (thetaGraph length) F} ≤
      Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths (n + 1))) F} ∧
    (Nat.card {F // IsFacet (thetaGraph length) F} =
      Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths (n + 1))) F} ↔
        ∃ e : Equiv.Perm (Fin 3), length ∘ e = thetaOptimizerLengths (n + 1)) := by
  by_cases h : n + 1 ≤ 143
  · exact theta_optimizer_finite (n + 1) (by omega) h length hp hs
  · exact thetaOptimizer_of_sorted (n + 1) (by omega) (thetaOptimizer_large_sorted (n + 1) (by omega)) length hp hs

end BraunBruegge
