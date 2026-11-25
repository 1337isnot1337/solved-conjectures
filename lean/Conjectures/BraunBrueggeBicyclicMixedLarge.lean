import Conjectures.BraunBrueggeBicyclicUnitPath
import Conjectures.BraunBrueggeBicyclicWedgeBenchmark

/-! For total length at least 144 the mixed-parity theta facet count is
strictly below the balanced odd-cycle wedge benchmark. -/

open Real

namespace BraunBruegge

private theorem half_sum_bound_of_sq {u x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) (h : u ^ 2 ≤ x * y) :
    u ≤ (x + y) / 2 :=
  le_of_sq_le_sq (h.trans (by nlinarith [sq_nonneg (x - y)])) (by linarith)

private theorem normalizedMixedTwoSlack_le_of_ge_three (a b c : ℕ) (ha : 3 ≤ a) (hb : 3 ≤ b) :
    normalizedMixedTwoSlack a b c ≤ ((a : ℝ) + b) / 2 + 3 / 5 := by
  have hbound (m : ℕ) (hm : 3 ≤ m) : (m : ℝ) ^ 2 / ((m : ℝ) - 1 / 2) ≤ (m : ℝ) + 3 / 5 := by
    have hm' : (3 : ℝ) ≤ m := by exact_mod_cast hm
    apply (div_le_iff₀ (by linarith)).mpr
    nlinarith
  have hb' : (3 : ℝ) ≤ b := by exact_mod_cast hb
  have h := (normalizedMixedTwoSlack_sq_le a b c (by omega) (by omega)).trans
    (mul_le_mul (hbound a ha) (hbound b hb)
      (div_nonneg (sq_nonneg _) (by linarith)) (by positivity))
  have e := half_sum_bound_of_sq (by positivity : 0 ≤ (a : ℝ) + 3 / 5) (by positivity) h
  linarith only [e]

private theorem scaledCenter_sq_le (a b : ℕ) (t : ℝ) :
    (t * ((π / 2) * centralSignMass a * centralSignMass b)) ^ 2 ≤
      t ^ 2 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2)) := by
  calc
    _ = t ^ 2 * ((π / 2) * centralSignMass a * centralSignMass b) ^ 2 := by ring
    _ ≤ t ^ 2 * (1 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2))) :=
      mul_le_mul_of_nonneg_left (centerProduct_sq_le a b) (sq_nonneg _)
    _ = _ := by ring

private theorem scaledCenter_ab_sq_le (a b : ℕ) :
    (((a : ℝ) * b) * ((π / 2) * centralSignMass a * centralSignMass b)) ^ 2 ≤
      ((a : ℝ) ^ 2 / ((a : ℝ) + 1 / 2)) * ((b : ℝ) ^ 2 / ((b : ℝ) + 1 / 2)) := by
  rw [div_mul_div_comm, ← mul_pow]
  exact scaledCenter_sq_le a b ((a : ℝ) * b)

private theorem normalizedMixedTwoSlack_le_of_even (a b c : ℕ) (ha : 0 < a) (hb : 0 < b)
    (hea : Even a) (heb : Even b) : normalizedMixedTwoSlack a b c ≤ ((a : ℝ) + b) / 2 := by
  have hm := normalizedCommonSum_le_two_centers (ThetaTotal a) (a - 1) (b - 1) c
  rw [centralSignMass_pred_of_even a ha hea, centralSignMass_pred_of_even b hb heb] at hm
  have h : normalizedMixedTwoSlack a b c ≤ ((a : ℝ) * b) * ((π / 2) * centralSignMass a * centralSignMass b) := by
    unfold normalizedMixedTwoSlack
    calc
      _ ≤ (2 * π * (a : ℝ) * b / 4) * (centralSignMass a * centralSignMass b) :=
        mul_le_mul_of_nonneg_left hm (by positivity)
      _ = _ := by ring
  have hdiv (m : ℕ) : (m : ℝ) ^ 2 / ((m : ℝ) + 1 / 2) ≤ m := by
    apply (div_le_iff₀ (by positivity)).mpr
    nlinarith [Nat.cast_nonneg (α := ℝ) m]
  apply h.trans
  apply half_sum_bound_of_sq (by positivity : 0 ≤ (a : ℝ)) (by positivity : 0 ≤ (b : ℝ))
  exact (scaledCenter_ab_sq_le a b).trans (mul_le_mul (hdiv a) (hdiv b) (by positivity) (by positivity))

private theorem normalizedMixed_unit_path_le (a b : ℕ) (ha : 10 ≤ a) (hb : 10 ≤ b) (hea : Even a) (heb : Even b) :
    normalizedMixedTwoSlack a b 1 + normalizedMixedOneSlack a b 1 ≤ ((a : ℝ) + b) / 2 - 1 / 5 := by
  have hA : (10 : ℝ) ≤ a := by exact_mod_cast ha
  have hB : (10 : ℝ) ≤ b := by exact_mod_cast hb
  let z := (π / 2) * centralSignMass a * centralSignMass b
  have hdiv (m : ℕ) (hm : 2 ≤ m) : (m : ℝ) ^ 2 / ((m : ℝ) + 1 / 2) ≤ (m : ℝ) - 2 / 5 := by
    have hm' : (2 : ℝ) ≤ m := by exact_mod_cast hm
    apply (div_le_iff₀ (by positivity)).mpr
    nlinarith
  have hsq : (((a : ℝ) * b) * z) ^ 2 ≤ ((a : ℝ) - 2 / 5) * ((b : ℝ) - 2 / 5) :=
    (scaledCenter_ab_sq_le a b).trans (mul_le_mul (hdiv a (by omega)) (hdiv b (by omega)) (by positivity) (by linarith))
  have hp : ((a : ℝ) * b) * z ≤ ((a : ℝ) + b) / 2 - 2 / 5 := by
    have h := half_sum_bound_of_sq (by linarith : 0 ≤ (a : ℝ) - 2 / 5) (by linarith) hsq
    linarith only [h]
  have hq : 2 * z ≤ (1 : ℝ) / 5 := by
    apply le_of_sq_le_sq _ (by norm_num)
    calc
      _ ≤ (2 : ℝ) ^ 2 / (((a : ℝ) + 1 / 2) * ((b : ℝ) + 1 / 2)) := scaledCenter_sq_le a b 2
      _ ≤ (2 : ℝ) ^ 2 / ((10 : ℝ) * 10) := by
        apply div_le_div_of_nonneg_left (by norm_num) (by norm_num)
        exact mul_le_mul (by linarith) (by linarith) (by norm_num) (by positivity)
      _ = _ := by norm_num
  rw [normalizedMixed_unit_path a b (by omega) (by omega) hea heb]
  calc
    _ = ((a : ℝ) * b) * z + 2 * z := by dsimp [z]; ring
    _ ≤ _ := by linarith only [hp, hq]

private theorem normalizedMixed_smallPart_le (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hl : 144 ≤ a + b + c) (hsmall : a < 10 ∨ b < 10) :
    normalizedMixedTwoSlack a b c + normalizedMixedOneSlack a b c ≤ (11 : ℝ) / 24 * ((a : ℝ) + b + c + 1) := by
  let l : ℝ := (a : ℝ) + b + c
  have hl' : 144 ≤ l := by dsimp [l]; exact_mod_cast hl
  have ha' : 0 ≤ (a : ℝ) := Nat.cast_nonneg _
  have hb' : 0 ≤ (b : ℝ) := Nat.cast_nonneg _
  have hc' : 0 ≤ (c : ℝ) := Nat.cast_nonneg _
  have haL : (a : ℝ) + 1 ≤ l + 1 := by dsimp [l]; linarith
  have hbL : (b : ℝ) + 1 ≤ l + 1 := by dsimp [l]; linarith
  have sq₀ : normalizedMixedTwoSlack a b c ^ 2 ≤ 10 * (l + 1) := by
    apply (normalizedMixedTwoSlack_sq_general a b c ha hb).trans
    rcases hsmall with hs | hs
    · have hs' : (a : ℝ) + 1 ≤ 10 := by exact_mod_cast (show a + 1 ≤ 10 by omega)
      exact mul_le_mul hs' hbL (by positivity) (by norm_num)
    · have hs' : (b : ℝ) + 1 ≤ 10 := by exact_mod_cast (show b + 1 ≤ 10 by omega)
      rw [mul_comm ((a : ℝ) + 1)]
      exact mul_le_mul hs' haL (by positivity) (by norm_num)
  let s := √(l + 1)
  have hs : 0 ≤ s := Real.sqrt_nonneg _
  have hsq : s ^ 2 = l + 1 := Real.sq_sqrt (by linarith)
  have hs12 : 12 ≤ s := le_of_sq_le_sq (by rw [hsq]; linarith) hs
  have hu₀ : normalizedMixedTwoSlack a b c ≤ (19 / 6 : ℝ) * s := by
    apply le_of_sq_le_sq _ (by positivity)
    rw [mul_pow, hsq]
    nlinarith only [sq₀, hl']
  have hu₁ : normalizedMixedOneSlack a b c ≤ (7 / 3 : ℝ) * s := by
    have hs₁ := normalizedMixedOneSlack_sq_general a b c ha hc
    have hcL : (c : ℝ) ≤ l + 1 := by dsimp [l]; linarith
    apply le_of_sq_le_sq _ (by positivity)
    rw [mul_pow, hsq]
    nlinarith only [hs₁, hcL, hl']
  have hsL : 12 * s ≤ l + 1 := by
    rw [← hsq, pow_two]
    exact mul_le_mul_of_nonneg_right hs12 hs
  change _ ≤ (11 : ℝ) / 24 * (l + 1)
  linarith only [hu₀, hu₁, hsL]

private theorem parity_branches (a b c : ℕ)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    (Even a ∧ Even b ∧ Odd c) ∨ (Odd a ∧ Odd b ∧ Even c) := by
  rcases Nat.even_or_odd a with ha | ha
  · obtain ⟨j, hj⟩ := ha
    exact Or.inl ⟨⟨j, hj⟩, ⟨b / 2, by omega⟩, ⟨c / 2, by omega⟩⟩
  · obtain ⟨j, hj⟩ := ha
    exact Or.inr ⟨⟨j, hj⟩, ⟨b / 2, by omega⟩, ⟨c / 2, by omega⟩⟩

theorem mixed_theta_facets_lt_wedge_large (a b c : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hl : 144 ≤ a + b + c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} < wedgeBenchmark (a + b + c) := by
  let l := a + b + c
  let L : ℝ := (a : ℝ) + b + c
  let T := normalizedWedgeBenchmark l
  have hL : 144 ≤ L := by dsimp [L]; exact_mod_cast hl
  have hW : (wedgeEffectiveLength l : ℝ) / 2 - 2 / (wedgeEffectiveLength l : ℝ) ≤ T :=
    normalizedWedgeBenchmark_lower l (by omega)
  have hEL : L - 1 ≤ (wedgeEffectiveLength l : ℝ) := by
    have h : a + b + c ≤ wedgeEffectiveLength l + 1 := by dsimp [wedgeEffectiveLength, l]; omega
    have h' : L ≤ (wedgeEffectiveLength l : ℝ) + 1 := by dsimp [L]; exact_mod_cast h
    linarith
  have hrecip : 2 / (wedgeEffectiveLength l : ℝ) ≤ (1 : ℝ) / 50 := by
    apply (div_le_iff₀ (by linarith)).mpr
    linarith
  have hT : (L - 1) / 2 - 1 / 50 ≤ T := by linarith only [hEL, hrecip, hW]
  have h : normalizedThetaFacets a b c < T := by
    rw [normalizedThetaFacets_mixed a b c ha hb hc hab hac]
    by_cases hsmall : a < 10 ∨ b < 10
    · have he := normalizedMixed_smallPart_le a b c ha hb hc hl hsmall
      change _ ≤ (11 : ℝ) / 24 * (L + 1) at he
      linarith only [he, hL, hT]
    push Not at hsmall
    obtain ⟨ha10, hb10⟩ := hsmall
    rcases parity_branches a b c hab hac with ⟨hae, hbe, hco⟩ | ⟨hao, hbo, hce⟩
    · by_cases h1 : c = 1
      · subst c
        have hunit := normalizedMixed_unit_path_le a b ha10 hb10 hae hbe
        dsimp [L] at hT
        push_cast at hT
        linarith only [hunit, hT]
      · have hc3 : 3 ≤ c := by obtain ⟨j, hj⟩ := hco; omega
        have hc3' : (3 : ℝ) ≤ c := by exact_mod_cast hc3
        have hA : (10 : ℝ) ≤ a := by exact_mod_cast ha10
        have hB : (10 : ℝ) ≤ b := by exact_mod_cast hb10
        have htwo := normalizedMixedTwoSlack_le_of_even a b c ha hb hae hbe
        have hone := normalizedMixedOneSlack_le_of_min a b c 10 (by norm_num) (by linarith) (by linarith)
        dsimp [L] at hT
        linarith only [htwo, hone, hc3', hT]
    · have ha11 : 11 ≤ a := by obtain ⟨j, hj⟩ := hao; omega
      have hb11 : 11 ≤ b := by obtain ⟨j, hj⟩ := hbo; omega
      have ha11' : (11 : ℝ) ≤ a := by exact_mod_cast ha11
      have hb11' : (11 : ℝ) ≤ b := by exact_mod_cast hb11
      have hc2 : (2 : ℝ) ≤ c := by
        have h : 2 ≤ c := by obtain ⟨j, hj⟩ := hce; omega
        exact_mod_cast h
      have heven : l % 2 = 0 := by
        obtain ⟨i, hi⟩ := hao
        obtain ⟨j, hj⟩ := hbo
        obtain ⟨k, hk⟩ := hce
        dsimp [l]
        omega
      have heff : wedgeEffectiveLength l = l := by simp [wedgeEffectiveLength, heven]
      rw [heff] at hW
      simp only [l, Nat.cast_add] at hW
      change L / 2 - 2 / L ≤ T at hW
      have hsmallFrac : 2 / L ≤ (1 : ℝ) / 70 := (div_le_iff₀ (by linarith)).mpr (by linarith)
      have htwo := normalizedMixedTwoSlack_le_of_ge_three a b c (by omega) (by omega)
      have hone := normalizedMixedOneSlack_le_of_min a b c 11 (by norm_num) (by linarith) (by linarith)
      dsimp [L] at hW
      dsimp [L] at hsmallFrac
      linarith only [htwo, hone, hc2, hW, hsmallFrac]
  unfold normalizedThetaFacets T normalizedWedgeBenchmark at h
  have hp : 0 < 2 * π / (2 : ℝ) ^ l := by positivity
  have hc : (Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} : ℝ) < (wedgeBenchmark l : ℝ) := by
    by_contra! hn
    exact (not_lt_of_ge (mul_le_mul_of_nonneg_left hn hp.le)) h
  exact_mod_cast hc

end BraunBruegge
