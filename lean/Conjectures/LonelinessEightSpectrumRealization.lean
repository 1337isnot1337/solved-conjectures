import Conjectures.LonelinessConsecutiveFamilyCertificates

/-! The complete realization direction of the stated eight-speed spectrum.
This does not classify arbitrary eight-speed lists. -/

namespace Loneliness.EightSpectrumRealization

def Proposed (r : ℝ) : Prop :=
  ∃ s : ℕ, 1 ≤ s ∧ r = (s : ℝ) / (8 * (s : ℝ) + 1)

theorem realizes (r : ℝ) (hr : Proposed r) :
    ∃ ds : List ℕ, ds.length = 8 ∧ ds.Nodup ∧
      (∀ d ∈ ds, 0 < d) ∧ ds.foldr Nat.gcd 0 = 1 ∧
      value ds = r ∧ value ds < 1 / 8 := by
  obtain ⟨s, hs, rfl⟩ := hr
  simpa using ConsecutiveFamily.family_realizes 8 s (by decide) (by decide) hs

theorem proposed_positive_below (r : ℝ) (hr : Proposed r) :
    0 < r ∧ r < 1 / 8 := by
  obtain ⟨s, hs, rfl⟩ := hr
  have hs' : (0 : ℝ) < s := by exact_mod_cast (show 0 < s by omega)
  constructor
  · positivity
  · apply (div_lt_div_iff₀ (by positivity) (by norm_num : (0 : ℝ) < 8)).mpr
    nlinarith

end Loneliness.EightSpectrumRealization
