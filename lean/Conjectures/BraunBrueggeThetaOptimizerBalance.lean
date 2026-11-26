import Conjectures.BraunBrueggeThetaOptimizerTwoPath

/-! Strict balancing for each of the two parity-minimal exceptional paths. -/

open Real

namespace BraunBruegge

private def pairWeight (oddPaths : Bool) (i j : ℝ) : ℝ :=
  if oddPaths then (2 * i - 1) * (2 * j - 1) + 5 else 4 * i * j + 2

noncomputable def thetaPairScore (oddPaths : Bool) (i j : ℕ) : ℝ :=
  (π / 2) * pairWeight oddPaths i j * centralSignMass (2 * i) * centralSignMass (2 * j)

theorem thetaPairScore_comm (oddPaths : Bool) (i j : ℕ) : thetaPairScore oddPaths i j = thetaPairScore oddPaths j i := by
  cases oddPaths <;> simp only [thetaPairScore, pairWeight, Bool.false_eq_true, ite_true, ite_false] <;> ring

private theorem centralMass_pos (m : ℕ) : 0 < centralSignMass m := by
  unfold centralSignMass
  exact div_pos (by exact_mod_cast Nat.choose_pos (Nat.div_le_self m 2)) (by positivity)

private theorem weight_transfer (oddPaths : Bool) {i j : ℝ} (hj : 1 ≤ j) (h : j < i) :
    pairWeight oddPaths (i + 1) j * ((2 * i + 1) / (2 * i + 2)) < pairWeight oddPaths i (j + 1) * ((2 * j + 1) / (2 * j + 2)) := by
  have hi : 0 < i := by linarith
  have hj' : 0 < j := by linarith
  rw [← mul_div_assoc, ← mul_div_assoc]
  apply (div_lt_div_iff₀ (by positivity) (by positivity)).mpr
  cases oddPaths
  · simp only [pairWeight, Bool.false_eq_true, ite_false]
    have hp : 0 < (i - j) * (4 * i * j + 4 * i + 4 * j + 2) := mul_pos (sub_pos.mpr h) (by positivity)
    nlinarith only [hp]
  · simp only [pairWeight, ite_true]
    have hp : 0 < (i - j) * (4 * i * j + 6 * i + 6 * j) := mul_pos (sub_pos.mpr h) (by positivity)
    nlinarith only [hp]

theorem thetaPairScore_transfer (oddPaths : Bool) (i j : ℕ) (hj : 1 ≤ j) (h : j < i) :
    thetaPairScore oddPaths (i + 1) j < thetaPairScore oddPaths i (j + 1) := by
  have hw := weight_transfer oddPaths (by exact_mod_cast hj : (1 : ℝ) ≤ j) (by exact_mod_cast h : (j : ℝ) < i)
  have hmass : 0 < (π / 2) * centralSignMass (2 * i) * centralSignMass (2 * j) :=
    mul_pos (mul_pos (by positivity) (centralMass_pos _)) (centralMass_pos _)
  have hh := mul_lt_mul_of_pos_right hw hmass
  simp only [thetaPairScore, centralSignMass_even_succ, Nat.cast_add, Nat.cast_one]
  convert hh using 1 <;> ring

/-- Among pairs of a fixed sum the sorted maximizing indices differ by at most one. -/
theorem thetaPairScore_balanced (oddPaths : Bool) (i j u v : ℕ) (hi : 1 ≤ i) (hij : i ≤ j)
    (huv : u ≤ v) (hnear : v ≤ u + 1) (hs : i + j = u + v) :
    (i = u ∧ j = v) ∨ thetaPairScore oddPaths i j < thetaPairScore oddPaths u v := by
  generalize hd : j - i = d
  induction d using Nat.strong_induction_on generalizing i j with
  | h d ih =>
    by_cases hg : j ≤ i + 1
    · exact Or.inl ⟨by omega, by omega⟩
    · have hstep := thetaPairScore_transfer oddPaths (j - 1) i hi (by omega)
      rw [Nat.sub_add_cancel (by omega : 1 ≤ j), thetaPairScore_comm oddPaths j i,
        thetaPairScore_comm oddPaths (j - 1) (i + 1)] at hstep
      have finish := ih (j - 1 - (i + 1)) (by omega) (i + 1) (j - 1) (by omega) (by omega) (by omega) rfl
      rcases finish with ⟨hu, hv⟩ | hl
      · rw [← hu, ← hv]
        exact Or.inr hstep
      · exact Or.inr (hstep.trans hl)

theorem normalized_theta_even_score (i j : ℕ) (hi : 0 < i) (hj : 0 < j) :
    normalizedThetaFacets (2 * i) (2 * j) 1 = thetaPairScore false i j := by
  rw [normalizedThetaFacets_mixed _ _ _ (by omega) (by omega) (by decide) (by omega) (by omega),
    normalizedMixed_unit_path _ _ (by omega) (by omega) ⟨i, by omega⟩ ⟨j, by omega⟩]
  simp only [thetaPairScore, pairWeight, Bool.false_eq_true, ite_false, Nat.cast_mul, Nat.cast_ofNat]
  ring

theorem normalized_theta_odd_score (i j : ℕ) :
    normalizedThetaFacets (2 * i + 1) (2 * j + 1) 2 = thetaPairScore true (i + 1) (j + 1) := by
  rw [normalizedMixed_two_path _ _ ⟨i, rfl⟩ ⟨j, rfl⟩, thetaPairScore, pairWeight]
  simp only [Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat, Nat.cast_one, ite_true]
  rw [show 2 * i + 1 + 1 = 2 * (i + 1) by omega, show 2 * j + 1 + 1 = 2 * (j + 1) by omega]
  ring

end BraunBruegge
