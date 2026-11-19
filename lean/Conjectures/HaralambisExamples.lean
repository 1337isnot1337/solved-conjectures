import Conjectures.HaralambisTheorem
import Mathlib.Tactic.IntervalCases

namespace Haralambis

private def exampleCover : List Loneliness.Segment := [
  ⟨-3/14,3/14,2,0⟩,
  ⟨4/35,2/7,5,1⟩,
  ⟨2/7,5/7,2,1⟩,
  ⟨5/7,31/35,5,4⟩,
  ⟨11/14,17/14,2,2⟩]

theorem example_two_five_nine_value : Loneliness.value [2,5,9] = (3/7 : ℝ) := by
  have h := Loneliness.certified_value (ds := [2,5,9]) (r := 3/7)
    (cs := exampleCover) (t := 2/7) (ks := [0,1,2])
    (by norm_num [exampleCover, Loneliness.Segment.Valid])
    (by norm_num [exampleCover, Loneliness.coversFrom])
    (by norm_num [Loneliness.LowerCertificate]) (by norm_num) (by norm_num)
  norm_num at h
  exact h

theorem example_two_five_nine_density :
    Loneliness.Packing.density [2,5,9] = (3/7 : ℝ) := by
  have hd : ∀ i : Fin 3, 0 < (![2,5,9] : Fin 3 → ℕ) i := by
    intro i
    fin_cases i <;> norm_num
  have h := density_eq_value (![2,5,9] : Fin 3 → ℕ) hd
  simpa [speeds, example_two_five_nine_value] using h

def exampleCenters : Set ℤ := {n | n % 7 = 0 ∨ n % 7 = 1 ∨ n % 7 = 4}

theorem exampleCenters_eq_window :
    exampleCenters = NonmixedGap.modularWindow 7 2 3 := by
  ext n
  change n % 7 = 0 ∨ n % 7 = 1 ∨ n % 7 = 4 ↔ (2*n) % 7 < 3
  have hm : (2*n) % 7 = (2*(n%7)) % 7 := by
    simpa using (Int.mul_emod (2 : ℤ) n 7)
  rw [hm]
  have hn0 := Int.emod_nonneg n (by decide : (7 : ℤ) ≠ 0)
  have hn7 := Int.emod_lt_of_pos n (by decide : (0 : ℤ) < 7)
  interval_cases hn : n % 7 <;> norm_num

theorem example_two_five_nine_centers :
    Loneliness.Packing.Avoids [2,5,9] exampleCenters ∧
    NonmixedGap.IsPeriodic exampleCenters 7 ∧
    NonmixedGap.upperDensity exampleCenters = (3/7 : ℝ) := by
  rw [exampleCenters_eq_window]
  refine ⟨?_, NonmixedGap.window_periodic 7 2 3, ?_⟩
  · intro d hd t ht
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hd
    rcases hd with rfl | rfl | rfl
    all_goals exact NonmixedGap.window_avoids_step (by norm_num) (by norm_num) (by norm_num) ht
  · exact NonmixedGap.window_upperDensity_of_gcd_dvd
      (by norm_num) (by norm_num) (by norm_num) (by decide)

end Haralambis
