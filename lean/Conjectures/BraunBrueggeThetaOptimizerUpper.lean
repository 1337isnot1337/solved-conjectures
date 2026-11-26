import Conjectures.BraunBrueggeBicyclicMixedLarge
import Conjectures.BraunBrueggeThetaOptimizerMass

/-! Strict upper bounds for nonminimal exceptional paths at large total length. -/

open Real

namespace BraunBruegge

private noncomputable def scaledCenters (a b p q : ℕ) : ℝ :=
  ((a : ℝ) * b) * ((π / 2) * centralSignMass p * centralSignMass q)

private theorem scaledCenters_nonneg (a b p q : ℕ) : 0 ≤ scaledCenters a b p q :=
  mul_nonneg (by positivity) (mul_nonneg (mul_nonneg (by positivity) (centralSignMass_nonneg _)) (centralSignMass_nonneg _))

private theorem scaledCenters_sq_upper (a b p q : ℕ) :
    scaledCenters a b p q ^ 2 ≤ ((a : ℝ)^2 / ((p : ℝ) + 1 / 2)) * ((b : ℝ)^2 / ((q : ℝ) + 1 / 2)) := by
  unfold scaledCenters
  rw [mul_pow]
  calc
    _ ≤ ((a : ℝ) * b)^2 * (1 / (((p : ℝ) + 1 / 2) * ((q : ℝ) + 1 / 2))) :=
      mul_le_mul_of_nonneg_left (centerProduct_sq_le p q) (sq_nonneg _)
    _ = _ := by rw [div_mul_div_comm, ← mul_pow]; ring

theorem nonminimal_even_theta_upper (a b c : ℕ) (ha : 10 ≤ a) (hb : 10 ≤ b)
    (hea : Even a) (heb : Even b) (hc : 3 ≤ c) :
    normalizedMixedTwoSlack a b c + normalizedMixedOneSlack a b c <
      ((a : ℝ) + b + c) / 2 - 11 / 10 := by
  have hA : (10 : ℝ) ≤ a := by exact_mod_cast ha
  have hB : (10 : ℝ) ≤ b := by exact_mod_cast hb
  have hC : (3 : ℝ) ≤ c := by exact_mod_cast hc
  have hm := normalizedCommonSum_le_two_centers (ThetaTotal a) (a - 1) (b - 1) c
  rw [centralSignMass_pred_of_even a (by omega) hea, centralSignMass_pred_of_even b (by omega) heb] at hm
  have htwo : normalizedMixedTwoSlack a b c ≤ scaledCenters a b a b := by
    unfold normalizedMixedTwoSlack scaledCenters
    convert mul_le_mul_of_nonneg_left hm (by positivity : 0 ≤ 2 * π * a * b / 4) using 1; ring
  have hdiv (m : ℕ) (hm : (10 : ℝ) ≤ m) : (m : ℝ)^2 / (m + 1 / 2) ≤ m - 2 / 5 := by
    apply (div_le_iff₀ (by positivity)).mpr
    nlinarith
  have hs := (scaledCenters_sq_upper a b a b).trans (mul_le_mul (hdiv a hA) (hdiv b hB) (by positivity) (by linarith))
  have h₂ := htwo.trans (half_sum_bound_of_sq (by linarith : 0 ≤ (a : ℝ) - 2 / 5) (by linarith) hs)
  have h₁ := normalizedMixedOneSlack_le_of_min a b c 10 (by norm_num) (by linarith) (by linarith)
  linarith only [h₁, h₂, hC]

private theorem scaled_odd_centers_bounds (a b : ℕ) (ha : 11 ≤ a) (hb : 11 ≤ b) (hea : Odd a) (heb : Odd b) :
    scaledCenters a b (a - 1) (b - 1) ≤ ((a : ℝ) + b) / 2 + 3 / 5 ∧
      2 * ((a : ℝ) * b) ≤ scaledCenters a b (a - 1) (b - 1) * (a + b) := by
  have hA : (11 : ℝ) ≤ a := by exact_mod_cast ha
  have hB : (11 : ℝ) ≤ b := by exact_mod_cast hb
  have hp (m : ℕ) (hm : 0 < m) : ((m - 1 : ℕ) : ℝ) = (m : ℝ) - 1 := by rw [Nat.cast_sub (by omega), Nat.cast_one]
  constructor
  · have hdiv (m : ℕ) (hm : (11 : ℝ) ≤ m) : (m : ℝ)^2 / (m - 1 + 1 / 2) ≤ m + 3 / 5 := by
      apply (div_le_iff₀ (by linarith)).mpr
      nlinarith
    have hs := scaledCenters_sq_upper a b (a - 1) (b - 1)
    rw [hp a (by omega), hp b (by omega)] at hs
    have ht := hs.trans (mul_le_mul (hdiv a hA) (hdiv b hB) (div_nonneg (sq_nonneg _) (by linarith)) (by positivity))
    have h := half_sum_bound_of_sq (by positivity : 0 ≤ (a : ℝ) + 3 / 5) (by positivity) ht
    linarith only [h]
  · have hl (m : ℕ) (hm : Odd m) : 2 / π ≤ centralSignMass (m - 1)^2 * m := by
      obtain ⟨i, hi⟩ := hm
      have h := centralSignMass_sq_lower_of_even (m - 1) ⟨i, by omega⟩
      rwa [hp m (by omega), sub_add_cancel] at h
    have h := mul_le_mul (hl a hea) (hl b heb) (by positivity) (by positivity)
    have hs : 1 ≤ ((π / 2) * centralSignMass (a - 1) * centralSignMass (b - 1))^2 * ((a : ℝ) * b) := by
      calc
        _ = (π / 2)^2 * ((2 / π) * (2 / π)) := by field_simp
        _ ≤ _ := mul_le_mul_of_nonneg_left h (sq_nonneg (π / 2))
        _ = _ := by ring
    have hab : (a : ℝ) * b ≤ scaledCenters a b (a - 1) (b - 1)^2 := by
      calc
        _ = 1 * ((a : ℝ) * b) := (one_mul _).symm
        _ ≤ _ := mul_le_mul_of_nonneg_right hs (by positivity : 0 ≤ (a : ℝ) * b)
        _ = _ := by unfold scaledCenters; ring
    have ham : 4 * ((a : ℝ) * b) ≤ ((a : ℝ) + b)^2 := by nlinarith [sq_nonneg ((a : ℝ) - b)]
    have hh := mul_le_mul hab ham (by positivity) (sq_nonneg _)
    apply le_of_sq_le_sq _ (mul_nonneg (scaledCenters_nonneg ..) (by positivity))
    nlinarith only [hh]

theorem nonminimal_odd_theta_upper (a b c : ℕ) (ha : 11 ≤ a) (hb : 11 ≤ b)
    (hea : Odd a) (heb : Odd b) (hc : 4 ≤ c) (hec : Even c) :
    normalizedMixedTwoSlack a b c + normalizedMixedOneSlack a b c <
      ((a : ℝ) + b + c) / 2 - 13 / 5 := by
  obtain ⟨i, hi⟩ := hea
  obtain ⟨j, hj⟩ := heb
  have hA : (11 : ℝ) ≤ a := by exact_mod_cast ha
  have hB : (11 : ℝ) ≤ b := by exact_mod_cast hb
  have hC : (4 : ℝ) ≤ c := by exact_mod_cast hc
  have hai : (a : ℝ) = 2 * i + 1 := by exact_mod_cast hi
  have hbj : (b : ℝ) = 2 * j + 1 := by exact_mod_cast hj
  let z := scaledCenters a b (a - 1) (b - 1)
  let q := ((i : ℝ) / (i + 1)) * ((j : ℝ) / (j + 1))
  have hmass := normalizedCommonSum_off_center (ThetaTotal a) (Finset.mem_Icc.mpr (by omega)) i j c hc hec
  have htwo : normalizedMixedTwoSlack a b c ≤ z * (3 / 8 + 5 / 8 * q) := by
    dsimp only [z, q, scaledCenters, normalizedMixedTwoSlack]
    rw [show a - 1 = 2 * i by omega, show b - 1 = 2 * j by omega]
    convert mul_le_mul_of_nonneg_left hmass (by positivity : 0 ≤ 2 * π * a * b / 4) using 1; ring
  obtain ⟨hu, hl⟩ := scaled_odd_centers_bounds a b ha hb ⟨i, hi⟩ ⟨j, hj⟩
  change z ≤ _ at hu
  change _ ≤ z * _ at hl
  have hq : 1 - q = 2 * ((a : ℝ) + b) / ((a + 1) * (b + 1)) := by
    dsimp [q]
    rw [hai, hbj]
    field_simp
    ring
  have hfrac (x : ℝ) (hx : 11 ≤ x) : 11 / 12 ≤ x / (x + 1) := (le_div_iff₀ (by linarith)).mpr (by linarith)
  have hfrac₂ := mul_le_mul (hfrac a hA) (hfrac b hB) (by norm_num) (by positivity)
  have hloss : 4 * (11 / 12 : ℝ)^2 ≤ z * (1 - q) := by
    rw [hq]
    calc
      _ ≤ 4 * ((a : ℝ) / (a + 1) * (b / (b + 1))) := by nlinarith only [hfrac₂]
      _ = (4 * (a * b)) / ((a + 1) * (b + 1)) := by rw [div_mul_div_comm]; ring
      _ ≤ (z * (2 * (a + b))) / ((a + 1) * (b + 1)) := by apply div_le_div_of_nonneg_right _ (by positivity); linarith only [hl]
      _ = _ := by ring
  have h₁ := normalizedMixedOneSlack_le_of_min a b c 11 (by norm_num) (by linarith) (by linarith)
  linarith only [htwo, hloss, hu, h₁, hC]

end BraunBruegge
