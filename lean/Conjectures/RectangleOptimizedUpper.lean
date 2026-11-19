import Conjectures.RectangleUpperBounds
import Mathlib.Analysis.Real.Sqrt

/-! Optimization of the finite rectangle counting bounds. -/
namespace RectanglePartitions

open Finset

lemma harmonicSum_pos (h : ℕ) (hh : 0 < h) : 0 < RectangleEuler.harmonicSum h := by
  have hs : (∑ a ∈ range 1, (1 : ℝ) / ((a : ℝ) + 1)) ≤
      ∑ a ∈ range h, (1 : ℝ) / ((a : ℝ) + 1) := by
    apply sum_le_sum_of_subset_of_nonneg
    · exact range_mono (by omega)
    · intro a ha hnot
      positivity
  norm_num at hs
  simpa only [RectangleEuler.harmonicSum, one_div] using
    lt_of_lt_of_le (by norm_num : (0 : ℝ) < 1) hs

lemma linear_inverse_upper {X N A : ℝ} (hN : 0 < N) (hA : 0 < A)
    (hbound : ∀ t : ℝ, 0 < t → X ≤ N*t+A/t) : X ≤ 2*Real.sqrt (N*A) := by
  let s := Real.sqrt (N*A)
  have hs : 0 < s := Real.sqrt_pos.2 (mul_pos hN hA)
  have he : s^2=N*A := Real.sq_sqrt (mul_pos hN hA).le
  have hb := hbound (s/N) (div_pos hs hN)
  have hid : N*(s/N)+A/(s/N)=2*s := by
    field_simp
    nlinarith
  rw [hid] at hb
  exact hb

/-- Exact finite upper estimate obtained by optimizing over the generating
parameter; no asymptotic hypothesis is involved. -/
theorem log_rectangleCount_le_sqrt_harmonic (h w : ℕ) (hh : 0 < h) (hw : 0 < w) :
    Real.log (rectangleCount h w : ℝ) ≤
      2*Real.sqrt ((h*w : ℕ)*RectangleEuler.basel*RectangleEuler.harmonicSum h) := by
  have hN : (0 : ℝ) < (h*w : ℕ) := by exact_mod_cast Nat.mul_pos hh hw
  have hA : 0 < RectangleEuler.basel*RectangleEuler.harmonicSum h :=
    mul_pos RectangleEuler.basel_pos (harmonicSum_pos h hh)
  have hb := linear_inverse_upper hN hA (fun t ht => log_rectangleCount_le_harmonic h w ht)
  simpa only [mul_assoc] using hb

end RectanglePartitions
