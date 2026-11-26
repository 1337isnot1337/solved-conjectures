import Conjectures.BraunBrueggeBicyclicSigns
import Mathlib.Analysis.Real.Pi.Wallis
import Mathlib.Data.Nat.Choose.Central

/-! Uniform central-mass bounds from the Wallis product and the exact
successive central-binomial ratio. -/

open Filter Real
open scoped Topology

namespace BraunBruegge

noncomputable def normalizedSignMass (m : ℕ) (r : ℤ) : ℝ :=
  (binomialSignCount m r : ℝ) / 2 ^ m

noncomputable def centralSignMass (m : ℕ) : ℝ := (m.choose (m / 2) : ℝ) / 2 ^ m

theorem normalizedSignMass_nonneg (m : ℕ) (r : ℤ) : 0 ≤ normalizedSignMass m r := by
  unfold normalizedSignMass
  positivity

theorem centralSignMass_nonneg (m : ℕ) : 0 ≤ centralSignMass m := by
  unfold centralSignMass
  positivity

theorem normalizedSignMass_le_center (m : ℕ) (r : ℤ) : normalizedSignMass m r ≤ centralSignMass m := by
  have h : binomialSignCount m r ≤ m.choose (m / 2) := by
    unfold binomialSignCount
    split_ifs
    · exact Nat.choose_le_middle _ _
    · exact Nat.zero_le _
  exact div_le_div_of_nonneg_right (by exact_mod_cast h) (by positivity)

private noncomputable def evenCenter (j : ℕ) : ℝ := (j.centralBinom : ℝ) / 4 ^ j

private theorem center_even (j : ℕ) : centralSignMass (2 * j) = evenCenter j := by
  unfold centralSignMass evenCenter
  rw [show 2 * j / 2 = j by omega, ← Nat.centralBinom_eq_two_mul_choose, pow_mul]
  norm_num

theorem center_odd_eq_next (j : ℕ) : centralSignMass (2 * j + 1) = centralSignMass (2 * j + 2) := by
  have hs : (2 * j + 1).choose (j + 1) = (2 * j + 1).choose j := by
    calc
      _ = (2 * j + 1).choose (2 * j + 1 - j) := by congr 1; omega
      _ = _ := Nat.choose_symm (by omega)
  have h : (2 * j + 2).choose (j + 1) = 2 * (2 * j + 1).choose j := by
    rw [show 2 * j + 2 = (2 * j + 1) + 1 by omega, Nat.choose_succ_succ, hs]
    omega
  unfold centralSignMass
  rw [show (2 * j + 1) / 2 = j by omega, show (2 * j + 2) / 2 = j + 1 by omega, h]
  push_cast
  rw [show 2 * j + 2 = (2 * j + 1) + 1 by omega, pow_succ]
  field_simp
  ring

private theorem evenCenter_succ (j : ℕ) :
    evenCenter (j + 1) = ((2 : ℝ) * j + 1) / (2 * j + 2) * evenCenter j := by
  have h : ((j : ℝ) + 1) * (Nat.centralBinom (j + 1) : ℝ) =
      2 * (2 * (j : ℝ) + 1) * (j.centralBinom : ℝ) := by
    exact_mod_cast Nat.succ_mul_centralBinom_succ j
  have he : (Nat.centralBinom (j + 1) : ℝ) =
      (2 * (2 * (j : ℝ) + 1) * (j.centralBinom : ℝ)) / ((j : ℝ) + 1) :=
    (eq_div_iff (by positivity)).mpr (by linear_combination h)
  rw [evenCenter, evenCenter, he, pow_succ]
  field_simp
  ring

private theorem wallis_evenCenter_identity (j : ℕ) : Wallis.W j * (2 * (j : ℝ) + 1) * evenCenter j ^ 2 = 1 := by
  induction j with
  | zero => norm_num [Wallis.W, evenCenter]
  | succ j ih =>
    rw [Wallis.W_succ, evenCenter_succ]
    push_cast
    convert ih using 1
    field_simp
    ring

private theorem half_shift_evenCenter (j : ℕ) : evenCenter j ^ 2 * ((j : ℝ) + 1 / 2) = 1 / (2 * Wallis.W j) := by
  have hw := Wallis.W_pos j
  apply (eq_div_iff (by positivity)).mpr
  linear_combination wallis_evenCenter_identity j

private theorem evenCenter_half_lower (j : ℕ) : 1 / π ≤ evenCenter j ^ 2 * ((j : ℝ) + 1 / 2) := by
  rw [half_shift_evenCenter]
  exact one_div_le_one_div_of_le (by have := Wallis.W_pos j; positivity) (by linarith [Wallis.W_le j])

private theorem quarter_shift_tendsto :
    Tendsto (fun j : ℕ => evenCenter j ^ 2 * ((j : ℝ) + 1 / 4)) atTop (𝓝 (1 / π)) := by
  have hdiv : Tendsto (fun j : ℕ => (1 : ℝ) / (2 * Wallis.W j)) atTop (𝓝 (1 / π)) := by
    have hden : Tendsto (fun j : ℕ => (2 : ℝ) * Wallis.W j) atTop (𝓝 (2 * (π / 2))) :=
      tendsto_const_nhds.mul Wallis.tendsto_W_nhds_pi_div_two
    rw [show (2 : ℝ) * (π / 2) = π by ring] at hden
    exact tendsto_const_nhds.div hden Real.pi_ne_zero
  have htop : Tendsto (fun j : ℕ => (j : ℝ) + 1 / 2) atTop atTop :=
    tendsto_natCast_atTop_atTop.atTop_add tendsto_const_nhds
  have hrat : Tendsto (fun j : ℕ => 1 - (1 / 4 : ℝ) / ((j : ℝ) + 1 / 2)) atTop (𝓝 1) := by
    simpa only [sub_zero] using (tendsto_const_nhds.div_atTop htop (a := (1 / 4 : ℝ))).const_sub 1
  have h := hdiv.mul hrat
  simp only [mul_one] at h
  apply h.congr'
  filter_upwards with j
  rw [← half_shift_evenCenter]
  field_simp
  ring

private theorem quarter_shift_mono : Monotone (fun j : ℕ => evenCenter j ^ 2 * ((j : ℝ) + 1 / 4)) := by
  apply monotone_nat_of_le_succ
  intro j
  have he : evenCenter (j + 1) ^ 2 * (((j + 1 : ℕ) : ℝ) + 1 / 4) =
      evenCenter j ^ 2 * ((j : ℝ) + 1 / 4) + evenCenter j ^ 2 / (4 * (2 * (j : ℝ) + 2) ^ 2) := by
    rw [evenCenter_succ, Nat.cast_add, Nat.cast_one]
    field_simp
    ring
  rw [he]
  exact le_add_of_nonneg_right (by positivity)

private theorem center_even_sq_upper (j : ℕ) :
    centralSignMass (2 * j) ^ 2 * (((2 * j : ℕ) : ℝ) + 1 / 2) ≤ 2 / π := by
  have h := quarter_shift_mono.ge_of_tendsto quarter_shift_tendsto j
  rw [center_even]
  push_cast
  calc
    _ = 2 * (evenCenter j ^ 2 * ((j : ℝ) + 1 / 4)) := by ring
    _ ≤ 2 * (1 / π) := mul_le_mul_of_nonneg_left h (by norm_num)
    _ = _ := by simp [div_eq_mul_inv]

theorem centralSignMass_sq_upper (m : ℕ) :
    centralSignMass m ^ 2 * ((m : ℝ) + 1 / 2) ≤ 2 / π := by
  rcases Nat.even_or_odd m with ⟨j, hj⟩ | ⟨j, hj⟩
  · rw [show m = 2 * j by omega]
    exact center_even_sq_upper j
  · rw [show m = 2 * j + 1 by omega, center_odd_eq_next]
    have h := center_even_sq_upper (j + 1)
    rw [show 2 * (j + 1) = 2 * j + 2 by omega] at h
    apply le_trans _ h
    apply mul_le_mul_of_nonneg_left _ (sq_nonneg _)
    push_cast
    linarith

theorem centralSignMass_sq_lower_of_even (m : ℕ) (h : Even m) :
    2 / π ≤ centralSignMass m ^ 2 * ((m : ℝ) + 1) := by
  obtain ⟨j, hj⟩ := h
  rw [show m = 2 * j by omega, center_even]
  push_cast
  calc
    2 / π = 2 * (1 / π) := by simp [div_eq_mul_inv]
    _ ≤ 2 * (evenCenter j ^ 2 * ((j : ℝ) + 1 / 2)) :=
      mul_le_mul_of_nonneg_left (evenCenter_half_lower j) (by norm_num)
    _ = _ := by ring

end BraunBruegge
