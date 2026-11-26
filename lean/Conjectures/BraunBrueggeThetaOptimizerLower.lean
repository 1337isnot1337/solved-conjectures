import Conjectures.BraunBrueggeThetaOptimizerTwoPath

/-! Lower bounds for each balanced parity-minimal triple. -/

open Real

namespace BraunBruegge

private theorem centerProduct_lower_mean (p q : ℕ) (hp : 2 ≤ p) (hq : 2 ≤ q) (hep : Even p) (heq : Even q) :
    1 ≤ ((π / 2) * centralSignMass p * centralSignMass q) * (((p : ℝ) + q) / 2 + 3 / 5) := by
  let v := (π / 2) * centralSignMass p * centralSignMass q
  have h := mul_le_mul (centralSignMass_sq_lower_three_fifths p hp hep)
    (centralSignMass_sq_lower_three_fifths q hq heq) (by positivity)
    (mul_nonneg (sq_nonneg _) (by positivity))
  have hm : ((p : ℝ) + 3 / 5) * ((q : ℝ) + 3 / 5) ≤ (((p : ℝ) + q) / 2 + 3 / 5) ^ 2 := by
    nlinarith [sq_nonneg ((p : ℝ) - q)]
  have hv : 0 ≤ v := mul_nonneg (mul_nonneg (by positivity) (centralSignMass_nonneg _)) (centralSignMass_nonneg _)
  apply le_of_sq_le_sq _ (mul_nonneg hv (by positivity))
  calc
    (1 : ℝ) ^ 2 = (π / 2) ^ 2 * ((2 / π) * (2 / π)) := by field_simp
    _ ≤ (π / 2) ^ 2 * ((centralSignMass p ^ 2 * ((p : ℝ) + 3 / 5)) *
        (centralSignMass q ^ 2 * ((q : ℝ) + 3 / 5))) := mul_le_mul_of_nonneg_left h (sq_nonneg _)
    _ = v ^ 2 * (((p : ℝ) + 3 / 5) * ((q : ℝ) + 3 / 5)) := by dsimp [v]; ring
    _ ≤ v ^ 2 * (((p : ℝ) + q) / 2 + 3 / 5) ^ 2 := mul_le_mul_of_nonneg_left hm (sq_nonneg _)
    _ = _ := (mul_pow _ _ _).symm

private theorem strict_lower_product {v x s a b d : ℝ} (hs : 0 < x + s)
    (hz : 1 ≤ v * (x + s)) (hp : 0 ≤ a * b + d) (h : (x - s) * (x + s) < a * b + d) :
    x - s < v * (a * b + d) := by
  calc
    _ < (a * b + d) / (x + s) := (lt_div_iff₀ hs).mpr h
    _ = (1 / (x + s)) * (a * b + d) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_right ((div_le_iff₀ hs).mpr hz) hp

theorem even_balanced_theta_lower (a b : ℕ) (ha : 2 ≤ a) (hb : 2 ≤ b) (hea : Even a) (heb : Even b)
    (h₁ : a ≤ b + 2) (h₂ : b ≤ a + 2) :
    ((a : ℝ) + b + 1) / 2 - 11 / 10 < normalizedThetaFacets a b 1 := by
  have hab : (a : ℤ) % 2 = (b : ℤ) % 2 := by obtain ⟨_, he⟩ := hea; obtain ⟨_, hf⟩ := heb; omega
  have hac : (a : ℤ) % 2 ≠ (1 : ℤ) % 2 := by obtain ⟨_, he⟩ := hea; omega
  rw [normalizedThetaFacets_mixed a b 1 (by omega) (by omega) (by decide) hab hac,
    normalizedMixed_unit_path a b (by omega) (by omega) hea heb]
  have hd : ((a : ℝ) - b) ^ 2 ≤ (2 : ℝ) ^ 2 := by
    have ha' : (a : ℝ) ≤ (b : ℝ) + 2 := by exact_mod_cast h₁
    have hb' : (b : ℝ) ≤ (a : ℝ) + 2 := by exact_mod_cast h₂
    exact sq_le_sq' (by linarith only [hb']) (by linarith only [ha'])
  have h := strict_lower_product (x := ((a : ℝ) + b) / 2) (s := 3 / 5)
    (a := a) (b := b) (d := 2) (by positivity) (centerProduct_lower_mean a b ha hb hea heb)
    (by positivity) (by nlinarith only [hd])
  linarith only [h]

theorem odd_balanced_theta_lower (a b : ℕ) (ha : Odd a) (hb : Odd b)
    (h₁ : a ≤ b + 2) (h₂ : b ≤ a + 2) :
    ((a : ℝ) + b + 2) / 2 - 13 / 5 < normalizedThetaFacets a b 2 := by
  rw [normalizedMixed_two_path a b ha hb]
  obtain ⟨i, hi⟩ := ha
  obtain ⟨j, hj⟩ := hb
  have hz := centerProduct_lower_mean (a + 1) (b + 1) (by omega) (by omega) ⟨i + 1, by omega⟩ ⟨j + 1, by omega⟩
  push_cast at hz
  rw [show ((a : ℝ) + 1 + (b + 1)) / 2 + 3 / 5 = ((a : ℝ) + b) / 2 + 8 / 5 by ring] at hz
  have hd : ((a : ℝ) - b) ^ 2 ≤ (2 : ℝ) ^ 2 := by
    have ha' : (a : ℝ) ≤ (b : ℝ) + 2 := by exact_mod_cast h₁
    have hb' : (b : ℝ) ≤ (a : ℝ) + 2 := by exact_mod_cast h₂
    exact sq_le_sq' (by linarith only [hb']) (by linarith only [ha'])
  have h := strict_lower_product (x := ((a : ℝ) + b) / 2) (s := 8 / 5)
    (a := a) (b := b) (d := 5) (by positivity) hz (by positivity) (by nlinarith only [hd])
  linarith only [h]

end BraunBruegge
