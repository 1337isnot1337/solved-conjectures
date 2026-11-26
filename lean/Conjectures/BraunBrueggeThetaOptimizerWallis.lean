import Conjectures.BraunBrueggeBicyclicCycleBalance

/-! A sharpened lower Wallis bound for the optimizer comparison. -/

open Filter Real
open scoped Topology

namespace BraunBruegge

/-- From the first positive index onward, the Wallis quantities with shift 3/5 decrease. -/
private theorem shiftedMass_antitone :
    Antitone (fun j : ℕ => centralSignMass (2 * (j + 1)) ^ 2 * (2 * ((j : ℝ) + 1) + 3 / 5)) := by
  apply antitone_nat_of_succ_le
  intro j
  rw [centralSignMass_even_succ (j + 1)]
  push_cast
  have hav : (2 * ((j : ℝ) + 1) + 1) ^ 2 * (2 * ((j : ℝ) + 1 + 1) + 3 / 5) ≤
      (2 * ((j : ℝ) + 1) + 2) ^ 2 * (2 * ((j : ℝ) + 1) + 3 / 5) := by
    nlinarith [Nat.cast_nonneg (α := ℝ) j]
  calc
    _ = ((2 * ((j : ℝ) + 1) + 1) ^ 2 * (2 * ((j : ℝ) + 1 + 1) + 3 / 5) /
        (2 * ((j : ℝ) + 1) + 2) ^ 2) * centralSignMass (2 * (j + 1)) ^ 2 := by
          rw [mul_pow, div_pow]; ring
    _ ≤ (2 * ((j : ℝ) + 1) + 3 / 5) * centralSignMass (2 * (j + 1)) ^ 2 := by
      apply mul_le_mul_of_nonneg_right _ (sq_nonneg _)
      exact (div_le_iff₀ (by positivity)).mpr (by simpa only [mul_comm] using hav)
    _ = _ := mul_comm _ _

theorem centralSignMass_sq_lower_three_fifths (m : ℕ) (hm : 2 ≤ m) (he : Even m) :
    2 / π ≤ centralSignMass m ^ 2 * ((m : ℝ) + 3 / 5) := by
  obtain ⟨i, hi⟩ := he
  obtain ⟨j, rfl⟩ : ∃ j, m = 2 * (j + 1) := ⟨i - 1, by omega⟩
  let v (k : ℕ) := centralSignMass (2 * (k + 1)) ^ 2
  have ht : Tendsto (fun k : ℕ => 2 * ((k : ℝ) + 1) + 1 / 2) atTop atTop :=
    ((tendsto_natCast_atTop_atTop.atTop_add tendsto_const_nhds).const_mul_atTop (by norm_num)).atTop_add
      tendsto_const_nhds
  have hv : Tendsto v atTop (𝓝 0) := by
    apply squeeze_zero (fun _ => sq_nonneg _) _ (tendsto_const_nhds.div_atTop ht (a := 2 / π))
    intro k
    apply (le_div_iff₀ (by positivity)).mpr
    simpa [v] using centralSignMass_sq_upper (2 * (k + 1))
  have limit := (hv.const_mul (2 / 5 : ℝ)).const_add
    (v j * (2 * ((j : ℝ) + 1) + 3 / 5))
  simp only [mul_zero, add_zero] at limit
  have h : 2 / π ≤ v j * (2 * ((j : ℝ) + 1) + 3 / 5) := ge_of_tendsto limit (eventually_atTop.2 ⟨j, fun k hk => by
    have hmono := shiftedMass_antitone hk
    change v k * _ ≤ v j * _ at hmono
    have hcoarse := centralSignMass_sq_lower_of_even (2 * (k + 1)) ⟨k + 1, by omega⟩
    push_cast at hcoarse
    change 2 / π ≤ v k * _ at hcoarse
    linarith only [hmono, hcoarse]⟩)
  simpa [v] using h

end BraunBruegge
