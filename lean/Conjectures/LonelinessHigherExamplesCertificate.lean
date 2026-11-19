import Conjectures.LonelinessCriticalBase

namespace Loneliness.HigherExamples

/-- An exact value and a rational lower certificate identify an explicit
maximum over every real time, using the already proved integer periodicity. -/
theorem maximum_of_value_certificate {ds : List ℕ} {r t : ℚ} {ks : List ℤ}
    (hv : value ds = (r : ℝ)) (hlower : LowerCertificate ds r t ks)
    (hr : r ≤ 1 / 2) :
    clearance ds (t : ℝ) = (r : ℝ) ∧
      ∀ u : ℝ, clearance ds u ≤ (r : ℝ) := by
  have hu (u : ℝ) : clearance ds u ≤ (r : ℝ) := by
    rw [← hv]
    exact CriticalFamilies.le_value_any ds u
  have hr' : (r : ℝ) ≤ 1 / 2 := by
    have h := (Rat.cast_le (K := ℝ)).mpr hr
    norm_num at h ⊢
    exact h
  exact ⟨le_antisymm (hu _) (le_clearance hr' (lowerCertificate_sound hlower)),hu⟩

end Loneliness.HigherExamples
