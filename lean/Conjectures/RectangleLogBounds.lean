import Conjectures.RectangleCounting
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.Positivity

/-! Exact logarithmic lower bounds before any asymptotic estimates. -/

namespace RectanglePartitions

theorem boundedParts_log_deletion_bound (a B T : ℕ) (ha : 0 < a) :
    Real.log ((boundedParts 1 B T).card : ℝ) -
      ((a-1 : ℕ) : ℝ)*Real.log ((T : ℝ)+1) ≤
        Real.log ((boundedParts a B T).card : ℝ) := by
  have hp : (0 : ℝ) < (boundedParts 1 B T).card :=
    by exact_mod_cast boundedParts_card_pos 1 B T (by omega)
  have hq : (0 : ℝ) < (boundedParts a B T).card :=
    by exact_mod_cast boundedParts_card_pos a B T ha
  have hc : ((boundedParts 1 B T).card : ℝ) ≤
      (boundedParts a B T).card*((T : ℝ)+1)^(a-1) := by
    exact_mod_cast boundedParts_deletion_bound a B T ha
  have hh := Real.log_le_log hp hc
  rw [Real.log_mul (ne_of_gt hq) (by positivity),Real.log_pow] at hh
  linarith

theorem log_choice_product_lower (I : Finset ℕ) (C T : ℕ → ℕ) (h w : ℕ)
    (hI : ∀ a ∈ I, 1 < a)
    (hprod : (∏ a : I,(boundedParts a.val (C a.val) (T a.val)).card) ≤ rectangleCount h w) :
    (∑ a : I,Real.log ((boundedParts a.val (C a.val) (T a.val)).card : ℝ)) ≤
      Real.log (rectangleCount h w : ℝ) := by
  classical
  have hpos : ∀ a : I, (0 : ℝ) < (boundedParts a.val (C a.val) (T a.val)).card := by
    intro a
    exact_mod_cast boundedParts_card_pos a.val (C a.val) (T a.val)
      (by have := hI a.val a.property; omega)
  have hreal : (∏ a : I,((boundedParts a.val (C a.val) (T a.val)).card : ℝ)) ≤
      (rectangleCount h w : ℝ) := by exact_mod_cast hprod
  have hh := Real.log_le_log (Finset.prod_pos (fun a _ => hpos a)) hreal
  rw [Real.log_prod (fun a _ => ne_of_gt (hpos a))] at hh
  exact hh

theorem log_partition_lower (I : Finset ℕ) (C T : ℕ → ℕ) (h w : ℕ)
    (hI : ∀ a ∈ I, 1 < a)
    (hprod : (∏ a : I,(boundedParts a.val (C a.val) (T a.val)).card) ≤ rectangleCount h w) :
    (∑ a : I,(Real.log ((boundedParts 1 (C a.val) (T a.val)).card : ℝ) -
      ((a.val-1 : ℕ) : ℝ)*Real.log ((T a.val : ℝ)+1))) ≤
        Real.log (rectangleCount h w : ℝ) := by
  apply le_trans (Finset.sum_le_sum ?_) (log_choice_product_lower I C T h w hI hprod)
  intro a ha
  exact boundedParts_log_deletion_bound a.val (C a.val) (T a.val)
    (by have := hI a.val a.property; omega)

end RectanglePartitions
