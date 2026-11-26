import Conjectures.HeimNeuhauserPlanePartitionChecks

/-! The initial root comparisons on both real parameter ranges. -/

namespace PlanePartition

set_option maxRecDepth 10000

private theorem rootPair2 : rootCheck 5 2 = true := by decide +kernel

private theorem rootPair3 : rootCheck 5 3 = true := by decide +kernel

private theorem rootPair4 : rootCheck 5 4 = true := by decide +kernel

private theorem rootPair5 : rootCheck 5 5 = true := by decide +kernel

private theorem rootPair6 : rootCheck 1 6 = true := by decide +kernel

private theorem rootPair7 : rootCheck 1 7 = true := by decide +kernel

private theorem rootPair8 : rootCheck 1 8 = true := by decide +kernel

private theorem rootPair9 : rootCheck 1 9 = true := by decide +kernel

private theorem rootPair10 : rootCheck 1 10 = true := by decide +kernel

private theorem rootPair11 : rootCheck 1 11 = true := by decide +kernel

theorem rootDecrease_first_five {x : ℝ} (hx : 5 < x) {n : ℕ} (hn : 1 ≤ n) (hn' : n ≤ 5) :
    RootDecrease x n := by
  have h : (5 : ℕ) ≤ x := by exact_mod_cast hx.le
  interval_cases n
  · exact (rootDecrease_one_iff x (by linarith)).mpr hx
  · exact rootDecrease_of_check rootPair2 h
  · exact rootDecrease_of_check rootPair3 h
  · exact rootDecrease_of_check rootPair4 h
  · exact rootDecrease_of_check rootPair5 h

theorem rootDecrease_six_to_eleven {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 6 ≤ n) (hn' : n ≤ 11) :
    RootDecrease x n := by
  have h : ((1 : ℕ) : ℝ) ≤ x := by simpa using hx
  interval_cases n
  · exact rootDecrease_of_check rootPair6 h
  · exact rootDecrease_of_check rootPair7 h
  · exact rootDecrease_of_check rootPair8 h
  · exact rootDecrease_of_check rootPair9 h
  · exact rootDecrease_of_check rootPair10 h
  · exact rootDecrease_of_check rootPair11 h

/-- Full original root conjecture follows from the polynomial Turán conjecture. -/
theorem original_root_of_turan
    (ht : ∀ (x : ℝ), 1 ≤ x → ∀ n ≥ 12, TuranAt x n) :
    (∀ (x : ℝ), 5 < x → ∀ n ≥ 1, RootDecrease x n) ∧
      (∀ (x : ℝ), 1 ≤ x → ∀ n ≥ 6, RootDecrease x n) := by
  have all {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 6 ≤ n) : RootDecrease x n := by
    by_cases h : n ≤ 11
    · exact rootDecrease_six_to_eleven hx hn h
    · exact rootDecrease_of_logConcave (by linarith)
        (rootDecrease_six_to_eleven hx (by decide) le_rfl)
        (fun m hm => ht x hx m (by omega)) n (by omega)
  refine ⟨?_, fun _ hx _ hn => all hx hn⟩
  intro x hx n hn
  by_cases h : n ≤ 5
  · exact rootDecrease_first_five hx hn h
  · exact all (by linarith) (by omega)

end PlanePartition
