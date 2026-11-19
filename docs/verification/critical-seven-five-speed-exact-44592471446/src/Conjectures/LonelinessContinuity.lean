import Conjectures.Loneliness
import Mathlib.Topology.MetricSpace.Lipschitz
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Archimedean
import Mathlib.Topology.Algebra.Ring.Real

/-! Continuity, attainment, and rational approximation for the loneliness
functional. These statements apply to every finite natural speed list. -/

namespace Loneliness

theorem distance_le_add (x y : ℝ) : distance x ≤ |x - y| + distance y := by
  calc
    distance x ≤ |x - (round y : ℝ)| := distance_le_int x (round y)
    _ = |(x - y) + (y - (round y : ℝ))| := by congr 1; ring
    _ ≤ |x - y| + |y - (round y : ℝ)| := abs_add_le _ _

theorem lipschitz_distance : LipschitzWith 1 distance := by
  apply LipschitzWith.of_dist_le_mul
  intro x y
  simp only [Real.dist_eq, NNReal.coe_one, one_mul]
  have hxy := distance_le_add x y
  have hyx := distance_le_add y x
  rw [abs_sub_comm y x] at hyx
  exact abs_le.mpr ⟨by linarith, by linarith⟩

theorem continuous_distance : Continuous distance := lipschitz_distance.continuous

theorem continuous_clearance (ds : List ℕ) : Continuous (clearance ds) := by
  induction ds with
  | nil => exact continuous_const
  | cons d ds ih =>
    exact (continuous_distance.comp (continuous_const.mul continuous_id)).min ih

theorem clearance_le_of_rat {ds : List ℕ} {r : ℝ}
    (h : ∀ q : ℚ, clearance ds (q : ℝ) ≤ r) (t : ℝ) : clearance ds t ≤ r := by
  apply (Rat.denseRange_cast : DenseRange ((↑) : ℚ → ℝ)).induction
    (P := fun x => clearance ds x ≤ r) ?_ ?_ t
  · rintro x ⟨q, rfl⟩
    exact h q
  · exact isClosed_le (continuous_clearance ds) continuous_const

theorem value_le_of_rat {ds : List ℕ} {r : ℝ}
    (h : ∀ q : ℚ, clearance ds (q : ℝ) ≤ r) : value ds ≤ r :=
  value_le (fun t _ => clearance_le_of_rat h t)

theorem value_max (ds : List ℕ) :
    ∃ t ∈ Set.Icc (0 : ℝ) 1, clearance ds t = value ds := by
  obtain ⟨t, ht, hm⟩ := isCompact_Icc.exists_isMaxOn
    (show (Set.Icc (0 : ℝ) 1).Nonempty from ⟨0, by norm_num⟩)
    (continuous_clearance ds).continuousOn
  exact ⟨t, ht, le_antisymm (le_value ht) (value_le hm)⟩

theorem value_nonneg (ds : List ℕ) : 0 ≤ value ds :=
  (clearance_nonneg ds 0).trans (le_value (by norm_num))

theorem value_le_half (ds : List ℕ) : value ds ≤ 1 / 2 :=
  value_le (fun t _ => clearance_le_half ds t)

end Loneliness
