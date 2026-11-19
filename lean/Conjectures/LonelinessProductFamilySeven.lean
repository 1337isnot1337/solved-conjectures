import Conjectures.LonelinessProductFamily
import Conjectures.LonelinessConsecutiveFamilyCertificates

/-! The literal seven-speed product family below one seventh. The full
positive list is primitive, and both integer parameters are unbounded.
Membership in this product family is a separate geometric obligation. -/

namespace Loneliness.ProductFamily

open Normalization

def consecutiveSevenBase : List ℕ := [1,2,3,4,5,6]

noncomputable def standardSevenValue (s : ℕ) : ℝ := (s : ℝ)/(7*(s : ℝ)+1)

theorem standardSevenValue_lt (s : ℕ) : standardSevenValue s < (1/7 : ℝ) := by
  have hs : (0 : ℝ) ≤ s := Nat.cast_nonneg s
  unfold standardSevenValue
  apply (div_lt_iff₀ (by positivity : (0 : ℝ) < 7*(s : ℝ)+1)).mpr
  nlinarith

theorem consecutive_seven_values (s : ℕ) (hs : 1 ≤ s) :
    value (consecutiveSevenBase ++ [7*s]) = standardSevenValue s := by
  simpa [consecutiveSevenBase, standardSevenValue] using
    seven_consecutive_family_value s hs

theorem consecutive_seven_product_below_iff (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveSevenBase A b) = 1) :
    value (speeds consecutiveSevenBase A b) < (1/7 : ℝ) ↔ A = 1 ∧ 7 ∣ b := by
  constructor
  · exact below_threshold_reduction 7 (by decide) consecutiveSevenBase
      (by decide +kernel) (by decide +kernel) A b hA hb hprimitive
  · rintro ⟨rfl, s, hs⟩
    have hspos : 1 ≤ s := by omega
    rw [hs]
    have h := (consecutive_seven_values s hspos).trans_lt (standardSevenValue_lt s)
    simpa [speeds] using h

theorem consecutive_seven_product_classification (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveSevenBase A b) = 1)
    (hbelow : value (speeds consecutiveSevenBase A b) < (1/7 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 7*s ∧
      value (speeds consecutiveSevenBase A b) = standardSevenValue s := by
  obtain ⟨hAone, s, hs, hbvalue⟩ :=
    below_threshold_parameters 7 (by decide) consecutiveSevenBase
      (by decide +kernel) (by decide +kernel) A b hA hb hprimitive hbelow
  refine ⟨s, hs, hAone, hbvalue, ?_⟩
  rw [hAone, hbvalue]
  simpa [speeds] using consecutive_seven_values s hs

theorem consecutive_seven_product_spectrum (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveSevenBase A b) = 1)
    (hbelow : value (speeds consecutiveSevenBase A b) < (1/7 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ value (speeds consecutiveSevenBase A b) =
      (s : ℝ)/(7*(s : ℝ)+1) := by
  obtain ⟨s, hs, _hA, _hb, hvalue⟩ :=
    consecutive_seven_product_classification A b hA hb hprimitive hbelow
  exact ⟨s, hs, hvalue⟩

end Loneliness.ProductFamily
