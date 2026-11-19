import Conjectures.LonelinessProductFamily
import Conjectures.LonelinessConsecutiveFamilyCertificates
import Conjectures.LonelinessPairBridge

/-! The two literal six-speed product families, with arbitrary positive
primitive parameters.  The second family has one exceptional parameter;
all larger parameters are handled by eight intervals on a half-period.
Geometric membership in these product families is a separate statement. -/

namespace Loneliness.ProductFamily

open Normalization

def consecutiveSixBase : List ℕ := [1, 2, 3, 4, 5]

def exceptionalSixBase : List ℕ := [1, 3, 4, 5, 9]

noncomputable def standardSixValue (s : ℕ) : ℝ := (s : ℝ) / (6 * (s : ℝ) + 1)

noncomputable def exceptionalSixValue (s : ℕ) : ℝ :=
  if s = 1 then 2 / 13 else standardSixValue s

theorem standardSixValue_lt (s : ℕ) : standardSixValue s < (1 / 6 : ℝ) := by
  have hs : (0 : ℝ) ≤ s := Nat.cast_nonneg s
  unfold standardSixValue
  apply (div_lt_iff₀ (by positivity : 0 < 6 * (s : ℝ) + 1)).mpr
  nlinarith

theorem exceptionalSixValue_lt (s : ℕ) : exceptionalSixValue s < (1 / 6 : ℝ) := by
  by_cases hs : s = 1
  · simp only [exceptionalSixValue, ite_eq_left hs]
    norm_num
  · simpa only [exceptionalSixValue, ite_eq_right hs] using standardSixValue_lt s

theorem consecutive_six_values (s : ℕ) (hs : 1 ≤ s) :
    value (consecutiveSixBase ++ [6 * s]) = standardSixValue s := by
  simpa [consecutiveSixBase, standardSixValue] using six_consecutive_family_value s hs

private theorem exceptional_six_upper_half (s : ℕ) (r : ℝ)
    (hr : (6 * (s : ℝ) + 1) * r = s)
    (hlo : 2 / 13 ≤ r)
    {t : ℝ} (htlo : 0 ≤ t) (hthi : t ≤ 1 / 2) :
    clearance (exceptionalSixBase ++ [6 * s]) t ≤ r := by
  have hsn : 0 ≤ 6 * (s : ℝ) := by positivity
  by_cases h1 : t ≤ r
  · apply clearance_le_if_near (d := 1) (by simp [exceptionalSixBase]) (k := 0) <;>
      norm_num <;> linarith
  by_cases h2 : t ≤ 1 / 3 - r
  · have hl := mul_le_mul_of_nonneg_left (le_of_not_ge h1) hsn
    have hu := mul_le_mul_of_nonneg_left h2 hsn
    apply clearance_le_if_near (d := 6 * s) (by simp) (k := (s : ℤ)) <;>
      push_cast <;> nlinarith
  by_cases h3 : t ≤ (1 + r) / 5
  · apply clearance_le_if_near (d := 5) (by simp [exceptionalSixBase]) (k := 1) <;>
      norm_num <;> linarith
  by_cases h4 : t ≤ (1 + r) / 4
  · apply clearance_le_if_near (d := 4) (by simp [exceptionalSixBase]) (k := 1) <;>
      norm_num <;> linarith
  by_cases h5 : t ≤ (1 + r) / 3
  · apply clearance_le_if_near (d := 3) (by simp [exceptionalSixBase]) (k := 1) <;>
      norm_num <;> linarith
  by_cases h6 : t ≤ (2 + r) / 5
  · apply clearance_le_if_near (d := 5) (by simp [exceptionalSixBase]) (k := 2) <;>
      norm_num <;> linarith
  by_cases h7 : t ≤ (4 + r) / 9
  · apply clearance_le_if_near (d := 9) (by simp [exceptionalSixBase]) (k := 4) <;>
      norm_num <;> linarith
  · apply clearance_le_if_near (d := 4) (by simp [exceptionalSixBase]) (k := 2) <;>
      norm_num <;> linarith

private theorem exceptional_six_lower (s : ℕ) (r : ℝ)
    (hr : (6 * (s : ℝ) + 1) * r = s)
    (hlo : 2 / 13 ≤ r) (hhi : r ≤ 1 / 6) :
    r ≤ clearance (exceptionalSixBase ++ [6 * s]) r := by
  apply le_clearance (by linarith)
  intro d hd
  simp only [exceptionalSixBase, List.mem_append, List.mem_cons,
    List.not_mem_nil, or_false] at hd
  rcases hd with (rfl | rfl | rfl | rfl | rfl) | rfl
  · apply distance_lower_of_cell (k := 0) <;> norm_num; linarith
  · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
  · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
  · apply distance_lower_of_cell (k := 0) <;> norm_num <;> linarith
  · apply distance_lower_of_cell (k := 1) <;> norm_num <;> linarith
  · apply distance_lower_of_cell (k := (s : ℤ) - 1) <;> push_cast <;> nlinarith

theorem exceptional_six_values (s : ℕ) (hs : 2 ≤ s) :
    value (exceptionalSixBase ++ [6 * s]) = standardSixValue s := by
  let r := standardSixValue s
  have hs' : (2 : ℝ) ≤ s := by exact_mod_cast hs
  have hd : 0 < 6 * (s : ℝ) + 1 := by positivity
  have hr : (6 * (s : ℝ) + 1) * r = s := by
    dsimp [r, standardSixValue]
    field_simp
  have hlo : 2 / 13 ≤ r := by
    dsimp [r, standardSixValue]
    apply (le_div_iff₀ hd).mpr
    linarith
  have hhi : r ≤ 1 / 6 := (standardSixValue_lt s).le
  apply le_antisymm
  · apply value_le
    intro t ht
    by_cases hhalf : t ≤ 1 / 2
    · exact exceptional_six_upper_half s r hr hlo ht.1 hhalf
    · rw [← clearance_reflection _ t]
      apply exceptional_six_upper_half s r hr hlo <;> linarith [ht.2]
  · exact (exceptional_six_lower s r hr hlo hhi).trans
      (CriticalFamilies.le_value_any _ _)

theorem exceptional_six_maximum (s : ℕ) (hs : 2 ≤ s) :
    clearance (exceptionalSixBase ++ [6 * s]) (standardSixValue s) = standardSixValue s ∧
      ∀ t : ℝ, clearance (exceptionalSixBase ++ [6 * s]) t ≤ standardSixValue s := by
  have hupper (t : ℝ) : clearance (exceptionalSixBase ++ [6 * s]) t ≤ standardSixValue s := by
    rw [← exceptional_six_values s hs]
    exact CriticalFamilies.le_value_any _ _
  have hs' : (2 : ℝ) ≤ s := by exact_mod_cast hs
  have hd : 0 < 6 * (s : ℝ) + 1 := by positivity
  have he : (6 * (s : ℝ) + 1) * standardSixValue s = s := by
    unfold standardSixValue
    field_simp
  have hl : 2 / 13 ≤ standardSixValue s := by
    apply (le_div_iff₀ hd).mpr
    linarith
  exact ⟨le_antisymm (hupper _) (exceptional_six_lower s _ he hl (standardSixValue_lt s).le),
    hupper⟩

theorem exceptional_six_at_one : value (exceptionalSixBase ++ [6]) = (2 / 13 : ℝ) := by
  change value [1, 3, 4, 5, 9, 6] = (2 / 13 : ℝ)
  exact certified_pair_value [1, 3, 4, 5, 9, 6]
    (by decide +kernel) (by decide +kernel) (by decide +kernel)
    2 13 6 13 (by decide) (by decide) (by decide +kernel) (by decide +kernel)

theorem exceptional_six_values_all (s : ℕ) (hs : 1 ≤ s) :
    value (exceptionalSixBase ++ [6 * s]) = exceptionalSixValue s := by
  by_cases he : s = 1
  · subst s
    simpa [exceptionalSixValue] using exceptional_six_at_one
  · simpa only [exceptionalSixValue, ite_eq_right he] using
      exceptional_six_values s (by omega)

theorem consecutive_six_product_below_iff (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveSixBase A b) = 1) :
    value (speeds consecutiveSixBase A b) < (1 / 6 : ℝ) ↔ A = 1 ∧ 6 ∣ b := by
  constructor
  · exact below_threshold_reduction 6 (by decide) consecutiveSixBase
      (by decide +kernel) (by decide +kernel) A b hA hb hprimitive
  · rintro ⟨rfl, s, hs⟩
    have hspos : 1 ≤ s := by omega
    rw [hs]
    have h := (consecutive_six_values s hspos).trans_lt (standardSixValue_lt s)
    simpa [speeds] using h

theorem exceptional_six_product_below_iff (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds exceptionalSixBase A b) = 1) :
    value (speeds exceptionalSixBase A b) < (1 / 6 : ℝ) ↔ A = 1 ∧ 6 ∣ b := by
  constructor
  · exact below_threshold_reduction 6 (by decide) exceptionalSixBase
      (by decide +kernel) (by decide +kernel) A b hA hb hprimitive
  · rintro ⟨rfl, s, hs⟩
    have hspos : 1 ≤ s := by omega
    rw [hs]
    have h := (exceptional_six_values_all s hspos).trans_lt (exceptionalSixValue_lt s)
    simpa [speeds] using h

theorem consecutive_six_product_classification (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveSixBase A b) = 1)
    (hbelow : value (speeds consecutiveSixBase A b) < (1 / 6 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 6 * s ∧
      value (speeds consecutiveSixBase A b) = standardSixValue s := by
  obtain ⟨hAone, s, hs, hbvalue⟩ := below_threshold_parameters 6 (by decide) consecutiveSixBase
    (by decide +kernel) (by decide +kernel) A b hA hb hprimitive hbelow
  refine ⟨s, hs, hAone, hbvalue, ?_⟩
  rw [hAone, hbvalue]
  simpa [speeds] using consecutive_six_values s hs

theorem exceptional_six_product_classification (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds exceptionalSixBase A b) = 1)
    (hbelow : value (speeds exceptionalSixBase A b) < (1 / 6 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ A = 1 ∧ b = 6 * s ∧
      value (speeds exceptionalSixBase A b) = exceptionalSixValue s := by
  obtain ⟨hAone, s, hs, hbvalue⟩ := below_threshold_parameters 6 (by decide) exceptionalSixBase
    (by decide +kernel) (by decide +kernel) A b hA hb hprimitive hbelow
  refine ⟨s, hs, hAone, hbvalue, ?_⟩
  rw [hAone, hbvalue]
  simpa [speeds] using exceptional_six_values_all s hs

theorem consecutive_six_product_spectrum (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds consecutiveSixBase A b) = 1)
    (hbelow : value (speeds consecutiveSixBase A b) < (1 / 6 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ value (speeds consecutiveSixBase A b) =
      (s : ℝ) / (6 * (s : ℝ) + 1) := by
  obtain ⟨s, hs, _, _, hvalue⟩ := consecutive_six_product_classification A b hA hb hprimitive hbelow
  exact ⟨s, hs, hvalue⟩

theorem exceptional_six_product_spectrum (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds exceptionalSixBase A b) = 1)
    (hbelow : value (speeds exceptionalSixBase A b) < (1 / 6 : ℝ)) :
    ∃ s : ℕ, 1 ≤ s ∧ value (speeds exceptionalSixBase A b) =
      (s : ℝ) / (6 * (s : ℝ) + 1) := by
  obtain ⟨s, hs, _, _, hvalue⟩ := exceptional_six_product_classification A b hA hb hprimitive hbelow
  by_cases he : s = 1
  · refine ⟨2, by decide, ?_⟩
    norm_num [exceptionalSixValue, he] at hvalue ⊢
    exact hvalue
  · exact ⟨s, hs, by
      simpa only [exceptionalSixValue, ite_eq_right he, standardSixValue] using hvalue⟩

end Loneliness.ProductFamily
