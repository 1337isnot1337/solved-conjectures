import Conjectures.LonelinessProductFamily
import Conjectures.LonelinessConsecutiveFamilyCertificates
import Conjectures.LonelinessExceptionalEightFamilyCertificates

/-! All positive parameter values on the three specified eight-speed product
families. The statements assume primitivity of the actual full speed list.
They do not assert that these three planes exhaust any geometric class. -/

namespace Loneliness.ProductFamily

open Normalization ExceptionalEightFamily

def consecutiveEightBase : List ℕ := [1,2,3,4,5,6,7]

noncomputable def standardEightValue (s : ℕ) : ℝ := (s : ℝ)/(8*(s : ℝ)+1)

noncomputable def exceptionalEightValue (s : ℕ) : ℝ :=
  if s = 1 then 2/17 else standardEightValue s

theorem standardEightValue_lt (s : ℕ) : standardEightValue s < (1/8 : ℝ) := by
  have hs : (0 : ℝ) ≤ s := Nat.cast_nonneg s
  unfold standardEightValue
  apply (div_lt_iff₀ (by positivity : (0 : ℝ) < 8*(s : ℝ)+1)).mpr
  nlinarith

theorem exceptionalEightValue_lt (s : ℕ) : exceptionalEightValue s < (1/8 : ℝ) := by
  unfold exceptionalEightValue
  split_ifs
  · norm_num
  · exact standardEightValue_lt s

theorem consecutive_eight_values (s : ℕ) (hs : 1 ≤ s) :
    value (consecutiveEightBase ++ [8*s]) = standardEightValue s := by
  simpa [consecutiveEightBase,standardEightValue] using eight_consecutive_family_value s hs

theorem first_eight_values (s : ℕ) (hs : 1 ≤ s) :
    value (firstBase ++ [8*s]) = exceptionalEightValue s := by
  simpa [firstBase,exceptionalEightValue,standardEightValue] using
    first_all_positive_parameters s hs

theorem second_eight_values (s : ℕ) (hs : 1 ≤ s) :
    value (secondBase ++ [8*s]) = exceptionalEightValue s := by
  simpa [secondBase,exceptionalEightValue,standardEightValue] using
    second_all_positive_parameters s hs

theorem eight_product_below_iff (W : List ℕ) (hW : gcd W = 1)
    (hres : ∀ w ∈ W, w%8 ≠ 0)
    (hfamily : ∀ s : ℕ, 1 ≤ s → value (W ++ [8*s]) < (1/8 : ℝ))
    (A b : ℕ) (hA : 0 < A) (hb : 0 < b) (hprimitive : gcd (speeds W A b) = 1) :
    value (speeds W A b) < (1/8 : ℝ) ↔ A = 1 ∧ 8 ∣ b := by
  constructor
  · exact below_threshold_reduction 8 (by decide) W hW hres A b hA hb hprimitive
  · rintro ⟨rfl,s,hs⟩
    have hspos : 1 ≤ s := by omega
    rw [hs]
    simpa [speeds] using hfamily s hspos

theorem eight_product_value_of_below (W : List ℕ) (hW : gcd W = 1)
    (hres : ∀ w ∈ W, w%8 ≠ 0) (F : ℕ → ℝ)
    (hvalues : ∀ s : ℕ, 1 ≤ s → value (W ++ [8*s]) = F s)
    (A b : ℕ) (hA : 0 < A) (hb : 0 < b) (hprimitive : gcd (speeds W A b) = 1)
    (hbelow : value (speeds W A b) < (1/8 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 8*s ∧ value (speeds W A b) = F s := by
  obtain ⟨hAone,s,hs,hbvalue⟩ :=
    below_threshold_parameters 8 (by decide) W hW hres A b hA hb hprimitive hbelow
  refine ⟨s,hs,hAone,hbvalue,?_⟩
  rw [hAone,hbvalue]
  simpa [speeds] using hvalues s hs

theorem consecutive_eight_product_below_iff (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveEightBase A b) = 1) :
    value (speeds consecutiveEightBase A b) < (1/8 : ℝ) ↔ A = 1 ∧ 8 ∣ b := by
  apply eight_product_below_iff consecutiveEightBase (by decide +kernel)
    (by decide +kernel) ?_ A b hA hb hprimitive
  intro s hs
  rw [consecutive_eight_values s hs]
  exact standardEightValue_lt s

theorem first_eight_product_below_iff (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds firstBase A b) = 1) :
    value (speeds firstBase A b) < (1/8 : ℝ) ↔ A = 1 ∧ 8 ∣ b := by
  apply eight_product_below_iff firstBase (by decide +kernel)
    (by decide +kernel) ?_ A b hA hb hprimitive
  intro s hs
  rw [first_eight_values s hs]
  exact exceptionalEightValue_lt s

theorem second_eight_product_below_iff (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds secondBase A b) = 1) :
    value (speeds secondBase A b) < (1/8 : ℝ) ↔ A = 1 ∧ 8 ∣ b := by
  apply eight_product_below_iff secondBase (by decide +kernel)
    (by decide +kernel) ?_ A b hA hb hprimitive
  intro s hs
  rw [second_eight_values s hs]
  exact exceptionalEightValue_lt s

theorem consecutive_eight_product_classification (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveEightBase A b) = 1)
    (hbelow : value (speeds consecutiveEightBase A b) < (1/8 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 8*s ∧
      value (speeds consecutiveEightBase A b) = standardEightValue s :=
  eight_product_value_of_below consecutiveEightBase (by decide +kernel)
    (by decide +kernel) standardEightValue consecutive_eight_values
    A b hA hb hprimitive hbelow

theorem first_eight_product_classification (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds firstBase A b) = 1)
    (hbelow : value (speeds firstBase A b) < (1/8 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 8*s ∧
      value (speeds firstBase A b) = exceptionalEightValue s :=
  eight_product_value_of_below firstBase (by decide +kernel)
    (by decide +kernel) exceptionalEightValue first_eight_values
    A b hA hb hprimitive hbelow

theorem second_eight_product_classification (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds secondBase A b) = 1)
    (hbelow : value (speeds secondBase A b) < (1/8 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 8*s ∧
      value (speeds secondBase A b) = exceptionalEightValue s :=
  eight_product_value_of_below secondBase (by decide +kernel)
    (by decide +kernel) exceptionalEightValue second_eight_values
    A b hA hb hprimitive hbelow

theorem exceptionalEightValue_spectrum (s : ℕ) (hs : 1 ≤ s) :
    ∃ r : ℕ, 1 ≤ r ∧ exceptionalEightValue s = (r : ℝ)/(8*(r : ℝ)+1) := by
  by_cases h : s = 1
  · refine ⟨2,by decide,?_⟩
    norm_num [exceptionalEightValue,h]
  · exact ⟨s,hs,by simp [exceptionalEightValue,h,standardEightValue]⟩

theorem consecutive_eight_product_spectrum (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveEightBase A b) = 1)
    (hbelow : value (speeds consecutiveEightBase A b) < (1/8 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ value (speeds consecutiveEightBase A b) =
      (s : ℝ)/(8*(s : ℝ)+1) := by
  obtain ⟨s,hs,_hA,_hb,hvalue⟩ :=
    consecutive_eight_product_classification A b hA hb hprimitive hbelow
  exact ⟨s,hs,hvalue⟩

theorem first_eight_product_spectrum (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds firstBase A b) = 1)
    (hbelow : value (speeds firstBase A b) < (1/8 : ℝ)) :
    ∃ r : ℕ, 1 ≤ r ∧ value (speeds firstBase A b) = (r : ℝ)/(8*(r : ℝ)+1) := by
  obtain ⟨s,hs,_hA,_hb,hvalue⟩ := first_eight_product_classification A b hA hb hprimitive hbelow
  obtain ⟨r,hr,heq⟩ := exceptionalEightValue_spectrum s hs
  exact ⟨r,hr,hvalue.trans heq⟩

theorem second_eight_product_spectrum (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds secondBase A b) = 1)
    (hbelow : value (speeds secondBase A b) < (1/8 : ℝ)) :
    ∃ r : ℕ, 1 ≤ r ∧ value (speeds secondBase A b) = (r : ℝ)/(8*(r : ℝ)+1) := by
  obtain ⟨s,hs,_hA,_hb,hvalue⟩ := second_eight_product_classification A b hA hb hprimitive hbelow
  obtain ⟨r,hr,heq⟩ := exceptionalEightValue_spectrum s hs
  exact ⟨r,hr,hvalue.trans heq⟩

end Loneliness.ProductFamily
