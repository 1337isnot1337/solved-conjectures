import Conjectures.LonelinessConsecutiveFamilyCertificates
import Conjectures.LonelinessHigherExamplesSeven

/-! The complete realization direction of the stated seven-speed spectrum.
The converse for arbitrary seven-speed lists requires the separate geometric
and modular classification. -/

namespace Loneliness.SevenSpectrumRealization

def Proposed (r : ℝ) : Prop :=
  (∃ s : ℕ, 1 ≤ s ∧ r = (s : ℝ) / (7 * (s : ℝ) + 1)) ∨
    r = 3 / 23 ∨ r = 5 / 37 ∨ r = 9 / 65

theorem realizes (r : ℝ) (hr : Proposed r) :
    ∃ ds : List ℕ, ds.length = 7 ∧ ds.Nodup ∧
      (∀ d ∈ ds, 0 < d) ∧ ds.foldr Nat.gcd 0 = 1 ∧
      value ds = r ∧ value ds < 1 / 7 := by
  rcases hr with ⟨s, hs, rfl⟩ | rfl | rfl | rfl
  · simpa using ConsecutiveFamily.family_realizes 7 s (by decide) (by decide) hs
  · refine ⟨[1, 2, 3, 4, 5, 7, 18], rfl, by decide, by decide, by decide,
      HigherExamples.seven_02_value, ?_⟩
    rw [HigherExamples.seven_02_value]
    norm_num
  · refine ⟨[1, 3, 4, 5, 7, 11, 30], rfl, by decide, by decide, by decide,
      HigherExamples.seven_10_value, ?_⟩
    rw [HigherExamples.seven_10_value]
    norm_num
  · refine ⟨[2, 7, 9, 11, 13, 20, 54], rfl, by decide, by decide, by decide,
      HigherExamples.seven_27_value, ?_⟩
    rw [HigherExamples.seven_27_value]
    norm_num

theorem proposed_positive_below (r : ℝ) (hr : Proposed r) :
    0 < r ∧ r < 1 / 7 := by
  rcases hr with ⟨s, hs, rfl⟩ | rfl | rfl | rfl
  · have hs' : (0 : ℝ) < s := by exact_mod_cast (show 0 < s by omega)
    constructor
    · positivity
    · apply (div_lt_div_iff₀ (by positivity) (by norm_num : (0 : ℝ) < 7)).mpr
      nlinarith
  all_goals norm_num

end Loneliness.SevenSpectrumRealization
