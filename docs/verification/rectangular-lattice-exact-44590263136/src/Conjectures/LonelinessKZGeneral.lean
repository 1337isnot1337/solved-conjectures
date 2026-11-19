import Conjectures.LonelinessKZProductAssembly

/-! Exact product bounds for arbitrary prescribed prefix sums. This adapter
uses the same kernel-checked finite dual certificates as the larger-speed
tables, without fixing the prefix data to one particular runner count. -/

namespace Loneliness.KZGeneral

open scoped BigOperators
open Loneliness.KZProduct

noncomputable section

def boundValue (bounds : ℕ → ℕ) (D r : ℕ) : ℝ := (bounds r : ℝ) / D

def increment (bounds : ℕ → ℕ) (D i : ℕ) : ℝ :=
  boundValue bounds D (i+1) - boundValue bounds D i

theorem increment_sum (bounds : ℕ → ℕ) (D : ℕ) (hzero : bounds 0 = 0) (r : ℕ) :
    ∑ i ∈ Finset.range r, increment bounds D i = boundValue bounds D r := by
  induction r with
  | zero => simp [boundValue, hzero]
  | succ r ih => rw [Finset.sum_range_succ, ih]; unfold increment; ring

/-- Positive variables with the stated prefix and adjacent-ratio constraints
obey the product bound certified by all finite subsets. -/
theorem product_of_certificate (d : ℕ) (bounds : ℕ → ℕ) (D : ℕ)
    (hD : 0 < D) (hzero : bounds 0 = 0) (rows : Fin (2^d) → DualRow)
    (hrows : ∀ m : Fin (2^d), DualValid d bounds (fun i => m.val.testBit i.val) (rows m))
    (hc : ∀ i < d, 0 < increment bounds D i)
    (t : ℕ → ℝ) (ht : ∀ i < d, 0 < t i)
    (hprefix : ∀ r ≤ d, boundValue bounds D r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < d → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range d, increment bounds D i ≤ ∏ i ∈ Finset.range d, t i := by
  have hconstraints := constraints_of_prefix_ratio bounds D t hprefix hratio
  have h := prod_le_of_subset_sums (fun i : Fin d => t i.val)
    (increment bounds D) (fun i => ht i.val i.isLt) hc (fun s => by
      rw [increment_sum bounds D hzero]
      exact all_masks_sound bounds D hD rows hrows (fun i => t i.val) hconstraints s)
  simpa only [Finset.prod_range] using h

/-- A strict numerical margin converts the weak product inequality into the
strict squared-norm cutoff used by the published finite certificates. The
determinant identity remains an explicit input to this arithmetic lemma. -/
theorem norm_square_cutoff (d : ℕ) (c t : ℕ → ℝ) (S deltaSquared C : ℝ)
    (hS : 0 < S)
    (hprod : ∏ i ∈ Finset.range d, c i ≤ ∏ i ∈ Finset.range d, t i)
    (hdet : ∏ i ∈ Finset.range d, t i = deltaSquared / S)
    (hmargin : 1 < C^2 * ∏ i ∈ Finset.range d, c i) :
    S < C^2 * deltaSquared := by
  rw [hdet] at hprod
  have hmul := (le_div_iff₀ hS).mp hprod
  have hscaled := mul_le_mul_of_nonneg_left hmul (sq_nonneg C)
  have hstrict := mul_lt_mul_of_pos_right hmargin hS
  nlinarith

end

end Loneliness.KZGeneral
