import Conjectures.BraunBrueggeBicyclicNormalizedCounts

/-! Uniform squared bounds for the two normalized terms in the
mixed-parity theta facet count. -/

open Real

namespace BraunBruegge

theorem centerProduct_sq_le (a b : ℕ) :
    ((π / 2) * centralSignMass a * centralSignMass b) ^ 2 ≤
      1 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2)) := by
  have hx := centralSignMass_sq_upper a
  have hy := centralSignMass_sq_upper b
  have hm := mul_le_mul hx hy (by positivity) (by positivity : 0 ≤ 2 / π)
  apply (le_div_iff₀ (by positivity)).mpr
  calc
    _ = (π / 2) ^ 2 * ((centralSignMass a ^ 2 * ((a : ℝ) + 1 / 2)) *
        (centralSignMass b ^ 2 * ((b : ℝ) + 1 / 2))) := by ring
    _ ≤ (π / 2) ^ 2 * ((2 / π) * (2 / π)) := mul_le_mul_of_nonneg_left hm (sq_nonneg _)
    _ = _ := by field_simp

theorem scaledCommonSum_sq_le (s : Finset ℤ) (a b c : ℕ) (t : ℝ) :
    ((π / 2) * t * normalizedCommonSum s a b c) ^ 2 ≤
      t ^ 2 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2)) := by
  have hf := normalizedCommonSum_le_two_centers s a b c
  have h : (π / 2) * normalizedCommonSum s a b c ≤
      (π / 2) * centralSignMass a * centralSignMass b := by
    rw [mul_assoc]
    exact mul_le_mul_of_nonneg_left hf (by positivity)
  have h₁ : 0 ≤ (π / 2) * normalizedCommonSum s a b c :=
    mul_nonneg (by positivity) (normalizedCommonSum_nonneg s a b c)
  have h₂ : 0 ≤ (π / 2) * centralSignMass a * centralSignMass b := h₁.trans h
  have hsq := ((sq_le_sq₀ h₁ h₂).mpr h).trans (centerProduct_sq_le a b)
  calc
    _ = t ^ 2 * ((π / 2) * normalizedCommonSum s a b c) ^ 2 := by ring
    _ ≤ t ^ 2 * (1 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2))) :=
      mul_le_mul_of_nonneg_left hsq (sq_nonneg _)
    _ = _ := by ring

theorem normalizedMixedTwoSlack_sq_le (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) :
    normalizedMixedTwoSlack a b c ^ 2 ≤
      ((a : ℝ) ^ 2 / ((a : ℝ) - 1 / 2)) * ((b : ℝ) ^ 2 / ((b : ℝ) - 1 / 2)) := by
  have h := scaledCommonSum_sq_le (ThetaTotal a) (a - 1) (b - 1) c ((a : ℝ) * b)
  rw [Nat.cast_sub (by omega : 1 ≤ a), Nat.cast_sub (by omega : 1 ≤ b), Nat.cast_one] at h
  unfold normalizedMixedTwoSlack
  convert h using 1
  · ring
  · rw [div_mul_div_comm]
    congr 1 <;> ring

theorem normalizedMixedOneSlack_sq_le_ab (a b c : ℕ) :
    normalizedMixedOneSlack a b c ^ 2 ≤ (2 * (c : ℝ)) ^ 2 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2)) := by
  have h := scaledCommonSum_sq_le (ThetaTotal a) a b (c - 1) (2 * (c : ℝ))
  unfold normalizedMixedOneSlack
  convert h using 1
  ring

theorem normalizedMixedOneSlack_sq_le_ac (a b c : ℕ) (hc : 0 < c) :
    normalizedMixedOneSlack a b c ^ 2 ≤ (2 * (c : ℝ)) ^ 2 / (((c : ℝ) - 1 / 2) * ((a : ℝ) + 1 / 2)) := by
  have h := scaledCommonSum_sq_le (ThetaTotal a) (c - 1) a b (2 * (c : ℝ))
  rw [normalizedCommonSum_rotate, Nat.cast_sub (by omega : 1 ≤ c), Nat.cast_one] at h
  unfold normalizedMixedOneSlack
  convert h using 1
  · ring
  · congr 1; ring

private theorem one_le_cast_of_pos {a : ℕ} (ha : 0 < a) : (1 : ℝ) ≤ a := by exact_mod_cast ha

private theorem div_square_general {a : ℕ} (ha : 0 < a) :
    (a : ℝ) ^ 2 / ((a : ℝ) - 1 / 2) ≤ (a : ℝ) + 1 := by
  have h := one_le_cast_of_pos ha
  apply (div_le_iff₀ (by linarith)).mpr
  nlinarith

theorem normalizedMixedTwoSlack_sq_general (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) :
    normalizedMixedTwoSlack a b c ^ 2 ≤ ((a : ℝ) + 1) * ((b : ℝ) + 1) := by
  have hb' := one_le_cast_of_pos hb
  exact (normalizedMixedTwoSlack_sq_le a b c ha hb).trans
    (mul_le_mul (div_square_general ha) (div_square_general hb)
      (div_nonneg (sq_nonneg _) (by linarith)) (by positivity))

theorem normalizedMixedOneSlack_sq_general (a b c : ℕ) (ha : 0 < a) (hc : 0 < c) :
    normalizedMixedOneSlack a b c ^ 2 ≤ (16 / 3 : ℝ) * c := by
  have ha' := one_le_cast_of_pos ha
  have hc' := one_le_cast_of_pos hc
  have hden : (c : ℝ) / 2 * (3 / 2) ≤ ((c : ℝ) - 1 / 2) * ((a : ℝ) + 1 / 2) :=
    mul_le_mul (by linarith) (by linarith) (by norm_num) (by linarith)
  calc
    _ ≤ (2 * (c : ℝ)) ^ 2 / (((c : ℝ) - 1 / 2) * ((a : ℝ) + 1 / 2)) :=
      normalizedMixedOneSlack_sq_le_ac a b c hc
    _ ≤ (2 * (c : ℝ)) ^ 2 / ((c : ℝ) / 2 * (3 / 2)) :=
      div_le_div_of_nonneg_left (sq_nonneg _) (by linarith) hden
    _ = _ := by field_simp; ring

theorem normalizedMixedOneSlack_le_of_min (a b c : ℕ) (d : ℝ) (hd : 0 < d)
    (ha : d ≤ (a : ℝ) + 1 / 2) (hb : d ≤ (b : ℝ) + 1 / 2) :
    normalizedMixedOneSlack a b c ≤ 2 * (c : ℝ) / d := by
  apply le_of_sq_le_sq _ (by positivity)
  calc
    _ ≤ (2 * (c : ℝ)) ^ 2 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2)) := normalizedMixedOneSlack_sq_le_ab a b c
    _ ≤ (2 * (c : ℝ)) ^ 2 / d ^ 2 := by
      apply div_le_div_of_nonneg_left (sq_nonneg _) (by positivity)
      exact (sq d).trans_le (mul_le_mul ha hb hd.le (by positivity))
    _ = _ := by rw [div_pow]

end BraunBruegge
