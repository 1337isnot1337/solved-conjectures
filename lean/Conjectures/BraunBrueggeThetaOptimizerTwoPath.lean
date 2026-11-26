import Conjectures.BraunBrueggeBicyclicFiniteCorrect
import Conjectures.BraunBrueggeThetaOptimizerMass

/-! Exact evaluation when the exceptional even path has length two. -/

open Finset Real

namespace BraunBruegge

private theorem shortSignProduct (a b c : ℕ) (hab : a % 2 = b % 2) (hac : a % 2 = c % 2)
    (hc : c ≤ 2) :
    (computedSignProduct a b c : ℝ) = (2 : ℝ) ^ (a + b + c) * normalizedCommonSum (ThetaTotal 2) a b c := by
  rw [computedSignProduct_eq 2 a b c ((min_le_right _ _).trans ((min_le_right _ _).trans hc)) hab hac,
    cast_signProductCount]

private theorem normalizedSmallSums (i j : ℕ) :
    normalizedCommonSum (ThetaTotal 2) (2 * i) (2 * j) 2 =
      (centralSignMass (2 * i) * centralSignMass (2 * j) +
        normalizedSignMass (2 * i) 2 * normalizedSignMass (2 * j) 2) / 2 ∧
    normalizedCommonSum (ThetaTotal 2) (2 * i + 1) (2 * j + 1) 1 =
      centralSignMass (2 * i + 1) * centralSignMass (2 * j + 1) := by
  have s : ThetaTotal 2 = {-2, -1, 0, 1, 2} := by decide +kernel
  have hneg (a : ℕ) : normalizedSignMass a (-2) = normalizedSignMass a 2 := normalizedSignMass_neg a 2
  have hneg' (a : ℕ) : normalizedSignMass a (-1) = normalizedSignMass a 1 := normalizedSignMass_neg a 1
  have hzero (a : ℕ) : normalizedSignMass (2 * a) 0 = centralSignMass (2 * a) :=
    normalizedSignMass_at_zero_of_even _ ⟨a, by omega⟩
  have hone (a : ℕ) : normalizedSignMass (2 * a + 1) 1 = centralSignMass (2 * a + 1) :=
    normalizedSignMass_at_one_of_odd _ ⟨a, by omega⟩
  have first : normalizedSignMass 2 0 = 1 / 2 ∧ normalizedSignMass 2 1 = 0 ∧ normalizedSignMass 2 2 = 1 / 4 := by
    norm_num [normalizedSignMass, binomialSignCount, Nat.choose]
  have second : normalizedSignMass 1 0 = 0 ∧ normalizedSignMass 1 1 = 1 / 2 ∧ normalizedSignMass 1 2 = 0 := by
    norm_num [normalizedSignMass, binomialSignCount, Nat.choose]
  rw [normalizedCommonSum, normalizedCommonSum, s]
  constructor <;> norm_num [hneg, hneg', first.1, first.2.1, first.2.2, second.1, second.2.1, second.2.2, hzero, hone] <;> ring

/-- The normalized count for two odd paths and one path of length two. -/
theorem normalizedMixed_two_path (a b : ℕ) (ha : Odd a) (hb : Odd b) :
    normalizedThetaFacets a b 2 =
      (π / 2) * ((a : ℝ) * b + 5) * centralSignMass (a + 1) * centralSignMass (b + 1) := by
  obtain ⟨i, rfl⟩ := ha
  obtain ⟨j, rfl⟩ := hb
  have hcount := computedMixedFacetCount_eq (2 * i + 1) (2 * j + 1) 2 (by omega) (by omega) (by omega) (by omega) (by omega)
  have he := shortSignProduct (2 * i) (2 * j) 2 (by omega) (by omega) (by decide)
  have ho := shortSignProduct (2 * i + 1) (2 * j + 1) 1 (by omega) (by omega) (by decide)
  rw [(normalizedSmallSums i j).1, normalizedSignMass_double_two, normalizedSignMass_double_two] at he
  rw [(normalizedSmallSums i j).2] at ho
  have hc (k : ℕ) : centralSignMass (2 * k + 1) =
      (2 * (k : ℝ) + 1) / (2 * k + 2) * centralSignMass (2 * k) := by
    rw [center_odd_eq_next, show 2 * k + 2 = 2 * (k + 1) by omega, centralSignMass_even_succ]
  have hnext (k : ℕ) : centralSignMass (2 * k + 1 + 1) = centralSignMass (2 * k + 1) := (center_odd_eq_next k).symm
  unfold normalizedThetaFacets
  rw [← hcount, computedMixedFacetCount]
  simp only [Nat.add_sub_cancel, Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_ofNat]
  change 2 * π / 2 ^ (2 * i + 1 + (2 * j + 1) + 2) *
      (((2 * (i : ℝ) + 1) * (2 * (j : ℝ) + 1)) * (computedSignProduct (2 * i) (2 * j) 2 : ℝ) +
        2 * (computedSignProduct (2 * i + 1) (2 * j + 1) 1 : ℝ)) = _
  rw [he, ho, hnext, hnext, hc, hc]
  simp only [pow_add, pow_one]
  field_simp
  ring

end BraunBruegge
