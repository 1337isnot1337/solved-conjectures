import Conjectures.RectangleProductIdentities
import Conjectures.RectangleEulerUpper

/-! Explicit finite upper bounds for the number of tileable rectangle
multisets, with the convergent Basel series as the analytic constant. -/

namespace RectanglePartitions

open Finset

theorem orderedLogProduct_le_harmonic (h N : ℕ) {t : ℝ} (ht : 0 < t) :
    orderedLogProduct h N t ≤ RectangleEuler.basel*RectangleEuler.harmonicSum h/t := by
  rw [orderedLogProduct_eq_sum_logEuler]
  exact RectangleEuler.sum_logEuler_le_harmonic h N ht

theorem orderedLogProduct_le (h N : ℕ) {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1) :
    orderedLogProduct h N t ≤ (RectangleEuler.basel*(Real.log (1/t)+2)+4)/t := by
  rw [orderedLogProduct_eq_sum_logEuler]
  exact RectangleEuler.sum_logEuler_le h N ht ht1

theorem unorderedLogProduct_le (N : ℕ) {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1) :
    unorderedLogProduct N t ≤
      (RectangleEuler.basel*Real.log (1/t)+3*RectangleEuler.basel+4)/(2*t) := by
  have ho := orderedLogProduct_le N N ht ht1
  have hd : (∑ a ∈ range N,-Real.log (1-Real.exp (-(((a : ℝ)+1)^2)*t))) ≤
      RectangleEuler.basel/t := by
    simpa only [RectangleEuler.logFactor,neg_mul] using RectangleEuler.sum_logFactor_sq_le N ht
  have hs := unorderedLogProduct_symmetry N t
  calc
    unorderedLogProduct N t = (orderedLogProduct N N t+
        ∑ a ∈ range N,-Real.log (1-Real.exp (-(((a : ℝ)+1)^2)*t)))/2 := by linarith
    _ ≤ ((RectangleEuler.basel*(Real.log (1/t)+2)+4)/t+RectangleEuler.basel/t)/2 := by linarith
    _ = _ := by field_simp; ring

theorem rectangleCount_pos (h w : ℕ) : 0 < rectangleCount h w := by
  apply Finset.card_pos.mpr
  refine ⟨unitBlocks (h*w),(mem_rectangleMultisets h w _).mpr ?_⟩
  exact (guillotine_unit_grid h w).gridTiles

theorem log_rectangleCount_le_ordered (h w : ℕ) {t : ℝ} (ht : 0 < t) :
    Real.log (rectangleCount h w : ℝ) ≤ (h*w : ℕ)*t+orderedLogProduct h (h*w) t := by
  have hp : (0 : ℝ) < rectangleCount h w := by exact_mod_cast rectangleCount_pos h w
  have hc : (rectangleCount h w : ℝ) ≤ (areaMultisets h (h*w)).card :=
    by exact_mod_cast rectangleCount_le_areaMultisets h w
  have he := hc.trans (areaMultisets_card_le_exp_ordered h (h*w) ht)
  have hl := Real.log_le_log hp he
  simpa only [Real.log_exp] using hl

theorem log_rectangleCount_le_unordered (h w : ℕ) {t : ℝ} (ht : 0 < t) :
    Real.log (rectangleCount h w : ℝ) ≤ (h*w : ℕ)*t+unorderedLogProduct (h*w) t := by
  have hp : (0 : ℝ) < rectangleCount h w := by exact_mod_cast rectangleCount_pos h w
  have hc : (rectangleCount h w : ℝ) ≤ (areaMultisets h (h*w)).card :=
    by exact_mod_cast rectangleCount_le_areaMultisets h w
  have he := hc.trans (areaMultisets_card_le_exp_unordered h (h*w) ht)
  have hl := Real.log_le_log hp he
  simpa only [Real.log_exp] using hl

theorem log_rectangleCount_le_harmonic (h w : ℕ) {t : ℝ} (ht : 0 < t) :
    Real.log (rectangleCount h w : ℝ) ≤
      (h*w : ℕ)*t+RectangleEuler.basel*RectangleEuler.harmonicSum h/t := by
  exact (log_rectangleCount_le_ordered h w ht).trans
    (add_le_add le_rfl (orderedLogProduct_le_harmonic h (h*w) ht))

theorem log_rectangleCount_le_unrestricted (h w : ℕ) {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1) :
    Real.log (rectangleCount h w : ℝ) ≤ (h*w : ℕ)*t+
      (RectangleEuler.basel*Real.log (1/t)+3*RectangleEuler.basel+4)/(2*t) := by
  exact (log_rectangleCount_le_unordered h w ht).trans
    (add_le_add le_rfl (unorderedLogProduct_le (h*w) ht ht1))

end RectanglePartitions
