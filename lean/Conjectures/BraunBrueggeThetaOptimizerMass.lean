import Conjectures.BraunBrueggeBicyclicUnitPath
import Conjectures.BraunBrueggeThetaOptimizerWallis

/-! The first off-center binomial mass controls every nonzero total of an even path. -/

open Finset Real

namespace BraunBruegge

private theorem binomialSignCount_double_two (i : ℕ) :
    binomialSignCount (2 * i) 2 = (2 * i).choose (i + 1) := by
  unfold binomialSignCount
  rw [ite_eq_left (by push_cast; omega)]
  congr 1
  push_cast
  omega

theorem normalizedSignMass_double_two (i : ℕ) :
    normalizedSignMass (2 * i) 2 = centralSignMass (2 * i) * (i / ((i : ℝ) + 1)) := by
  have hr := Nat.choose_succ_right_eq (2 * i) i
  rw [show 2 * i - i = i by omega] at hr
  have h : ((2 * i).choose (i + 1) : ℝ) * ((i : ℝ) + 1) = ((2 * i).choose i : ℝ) * i := by exact_mod_cast hr
  unfold normalizedSignMass centralSignMass
  rw [binomialSignCount_double_two, show 2 * i / 2 = i by omega]
  field_simp
  exact h

private theorem choose_mono_below {n k j : ℕ} (h : k ≤ j) (hj : j ≤ n / 2) :
    n.choose k ≤ n.choose j := by
  induction h with
  | refl => exact le_rfl
  | step hk ih => exact (ih (by omega)).trans (Nat.choose_le_succ_of_lt_half_left (by omega))

private theorem normalizedSignMass_le_two_of_pos (i : ℕ) {r : ℤ} (hr : 0 < r) :
    normalizedSignMass (2 * i) r ≤ normalizedSignMass (2 * i) 2 := by
  unfold normalizedSignMass
  apply div_le_div_of_nonneg_right _ (by positivity)
  apply Nat.cast_le.mpr
  rw [binomialSignCount_double_two]
  unfold binomialSignCount
  split_ifs with hp
  · let k := ((r + ((2 * i : ℕ) : ℤ)) / 2).toNat
    change (2 * i).choose k ≤ _
    have hik : i + 1 ≤ k := by dsimp [k]; omega
    by_cases hk : k ≤ 2 * i
    · rw [← Nat.choose_symm hk, ← Nat.choose_symm (show i + 1 ≤ 2 * i by omega)]
      exact choose_mono_below (by omega) (by omega)
    · rw [Nat.choose_eq_zero_of_lt (by omega : 2 * i < k)]
      exact Nat.zero_le _
  · exact Nat.zero_le _

theorem normalizedSignMass_le_two_of_ne_zero (i : ℕ) {r : ℤ} (hr : r ≠ 0) :
    normalizedSignMass (2 * i) r ≤ centralSignMass (2 * i) * (i / ((i : ℝ) + 1)) := by
  rw [← normalizedSignMass_double_two]
  rcases lt_or_gt_of_ne hr with hn | hp
  · rw [← normalizedSignMass_neg (2 * i) r]
    exact normalizedSignMass_le_two_of_pos i (by omega)
  · exact normalizedSignMass_le_two_of_pos i hp

theorem centralSignMass_le_three_eighths {c : ℕ} (hc : 4 ≤ c) (he : Even c) :
    centralSignMass c ≤ 3 / 8 := by
  have hm : Antitone (fun j : ℕ => centralSignMass (2 * j)) := by
    apply antitone_nat_of_succ_le
    intro j
    rw [centralSignMass_even_succ]
    apply mul_le_of_le_one_left (centralSignMass_nonneg _)
    apply (div_le_one (by positivity)).mpr
    linarith
  obtain ⟨j, hj⟩ := he
  have h := hm (by omega : 2 ≤ j)
  rw [show c = 2 * j by omega]
  exact h.trans (by norm_num [centralSignMass, Nat.choose])

/-- Keeping the atom at zero separate gives the improved mixed-parity upper bound. -/
theorem normalizedCommonSum_off_center (s : Finset ℤ) (hs : 0 ∈ s) (i j c : ℕ)
    (hc : 4 ≤ c) (he : Even c) :
    let q := ((i : ℝ) / (i + 1)) * ((j : ℝ) / (j + 1))
    normalizedCommonSum s (2 * i) (2 * j) c ≤
      centralSignMass (2 * i) * centralSignMass (2 * j) * (3 / 8 + 5 / 8 * q) := by
  let q := ((i : ℝ) / (i + 1)) * ((j : ℝ) / (j + 1))
  let p := centralSignMass (2 * i) * centralSignMass (2 * j)
  have hq₀ : 0 ≤ q := by dsimp [q]; positivity
  have hrange (k : ℕ) : (k : ℝ) / (k + 1) ≤ 1 := (div_le_one (by positivity)).mpr (by linarith)
  have hq : q ≤ 1 := by
    simpa only [one_mul] using mul_le_mul (hrange i) (hrange j) (by positivity) (by norm_num : (0 : ℝ) ≤ 1)
  have hp : 0 ≤ p := mul_nonneg (centralSignMass_nonneg _) (centralSignMass_nonneg _)
  have hpoint (r : ℤ) : normalizedSignMass (2 * i) r * normalizedSignMass (2 * j) r * normalizedSignMass c r ≤
      p * (q * normalizedSignMass c r + if r = 0 then (1 - q) * normalizedSignMass c 0 else 0) := by
    by_cases hr : r = 0
    · subst r
      rw [normalizedSignMass_at_zero_of_even _ ⟨i, by omega⟩, normalizedSignMass_at_zero_of_even _ ⟨j, by omega⟩]
      simp only [ite_true, p]
      exact le_of_eq (by ring)
    · simp only [hr, ite_false, add_zero]
      have h := mul_le_mul (normalizedSignMass_le_two_of_ne_zero i hr) (normalizedSignMass_le_two_of_ne_zero j hr)
        (normalizedSignMass_nonneg _ _) (mul_nonneg (centralSignMass_nonneg _) (by positivity))
      have h' := mul_le_mul_of_nonneg_right h (normalizedSignMass_nonneg c r)
      dsimp [p, q]
      convert h' using 1; ring
  have hsum := Finset.sum_le_sum (s := s) (fun r _ => hpoint r)
  unfold normalizedCommonSum
  refine hsum.trans ?_
  rw [← Finset.mul_sum, Finset.sum_add_distrib, ← Finset.mul_sum]
  simp only [Finset.sum_ite_eq', hs, ite_true]
  apply mul_le_mul_of_nonneg_left _ hp
  have hmass := normalizedSignMass_at_zero_of_even c he
  have h₀ := mul_le_mul_of_nonneg_left (hmass.trans_le (centralSignMass_le_three_eighths hc he)) (sub_nonneg.mpr hq)
  have h₁ := mul_le_mul_of_nonneg_left (sum_normalizedSignMass_le_one c s) hq₀
  linarith

end BraunBruegge
