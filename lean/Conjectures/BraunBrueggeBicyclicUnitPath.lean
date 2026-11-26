import Conjectures.BraunBrueggeBicyclicMixedBounds

/-! For a unit exceptional path and two even paths the normalized formula
collapses to a product of central binomial masses. -/

open Finset Real

namespace BraunBruegge

private theorem stepSign_complement (b : Bool) : stepSign (!b) = -stepSign b := by
  cases b <;> decide

theorem normalizedSignMass_neg (m : ℕ) (r : ℤ) : normalizedSignMass m (-r) = normalizedSignMass m r := by
  let e : SignsWithTotal (Fin m) r ≃ SignsWithTotal (Fin m) (-r) := {
    toFun := fun b => ⟨fun i => !b.val i, by
      simp only [stepSign_complement, Finset.sum_neg_distrib, b.property]⟩
    invFun := fun b => ⟨fun i => !b.val i, by
      simp only [stepSign_complement, Finset.sum_neg_distrib, b.property, neg_neg]⟩
    left_inv := fun b => Subtype.ext (funext fun i => Bool.not_not (b.val i))
    right_inv := fun b => Subtype.ext (funext fun i => Bool.not_not (b.val i)) }
  have h := Nat.card_congr e
  rw [card_signsWithTotal, card_signsWithTotal, Fintype.card_fin] at h
  simp [normalizedSignMass, h]

theorem normalizedSignMass_at_zero_of_even (m : ℕ) (hm : Even m) :
    normalizedSignMass m 0 = centralSignMass m := by
  have h := card_signsWithTotal_zero_of_even (I := Fin m) (by simpa using hm)
  rw [card_signsWithTotal, Fintype.card_fin] at h
  simp [normalizedSignMass, centralSignMass, h]

theorem normalizedSignMass_at_one_of_odd (m : ℕ) (hm : Odd m) :
    normalizedSignMass m 1 = centralSignMass m := by
  have he : (-1 : ℤ) = 2 * ((m / 2 : ℕ) : ℤ) - Fintype.card (Fin m) := by
    rw [Fintype.card_fin]
    obtain ⟨j, hj⟩ := hm
    omega
  have h := card_signsWithTotal_of_eq (I := Fin m) (m / 2) (-1) he
  rw [card_signsWithTotal, Fintype.card_fin] at h
  have e : normalizedSignMass m (-1) = centralSignMass m := by simp [normalizedSignMass, centralSignMass, h]
  simpa [normalizedSignMass_neg] using e

theorem centralSignMass_pred_of_even (m : ℕ) (hm : 0 < m) (he : Even m) :
    centralSignMass (m - 1) = centralSignMass m := by
  obtain ⟨j, hj⟩ := he
  have h : m - 1 = 2 * (j - 1) + 1 := by omega
  have h' : m = 2 * (j - 1) + 2 := by omega
  rw [h, h']
  exact center_odd_eq_next (j - 1)

private theorem normalizedSignMass_length_zero (r : ℤ) : normalizedSignMass 0 r = if r = 0 then 1 else 0 := by
  by_cases h : r = 0
  · subst r
    norm_num [normalizedSignMass, binomialSignCount]
  · unfold normalizedSignMass binomialSignCount
    simp only [h, ite_false]
    split_ifs with e
    · have hk : 0 < ((r + (0 : ℕ)) / 2).toNat := by omega
      rw [Nat.choose_eq_zero_of_lt hk]
      norm_num
    · norm_num

private theorem normalizedSignMass_length_one (r : ℤ) :
    normalizedSignMass 1 r = if r = -1 ∨ r = 1 then (1 : ℝ) / 2 else 0 := by
  by_cases h : r = -1 ∨ r = 1
  · obtain rfl | rfl := h <;> norm_num [normalizedSignMass, binomialSignCount]
  · unfold normalizedSignMass binomialSignCount
    simp only [h, ite_false]
    split_ifs with e
    · have hk : 1 < ((r + (1 : ℕ)) / 2).toNat := by omega
      rw [Nat.choose_eq_zero_of_lt hk]
      norm_num
    · norm_num

private theorem normalizedCommonSum_last_zero (s : Finset ℤ) (hs : (0 : ℤ) ∈ s) (a b : ℕ) :
    normalizedCommonSum s a b 0 = normalizedSignMass a 0 * normalizedSignMass b 0 := by
  unfold normalizedCommonSum
  have h (r : ℤ) : normalizedSignMass a r * normalizedSignMass b r * normalizedSignMass 0 r =
      if r = 0 then normalizedSignMass a 0 * normalizedSignMass b 0 else 0 := by
    by_cases hr : r = 0 <;> simp [hr, normalizedSignMass_length_zero]
  simp_rw [h]
  simp [hs]

private theorem normalizedCommonSum_last_one (s : Finset ℤ) (h₀ : (-1 : ℤ) ∈ s) (h₁ : (1 : ℤ) ∈ s) (a b : ℕ) :
    normalizedCommonSum s a b 1 = normalizedSignMass a 1 * normalizedSignMass b 1 := by
  unfold normalizedCommonSum
  let hmass := normalizedSignMass a 1 * normalizedSignMass b 1 / 2
  have h (r : ℤ) : normalizedSignMass a r * normalizedSignMass b r * normalizedSignMass 1 r =
      (if r = -1 then hmass else 0) + (if r = 1 then hmass else 0) := by
    by_cases hr : r = -1
    · subst r
      norm_num [normalizedSignMass_length_one, normalizedSignMass_neg, hmass]
      ring
    · by_cases hr' : r = 1
      · subst r
        norm_num [normalizedSignMass_length_one, hmass]
        ring
      · simp [normalizedSignMass_length_one, hr, hr']
  simp_rw [h, Finset.sum_add_distrib]
  simp [h₀, h₁, hmass]

theorem normalizedMixed_unit_path (a b : ℕ) (ha : 0 < a) (hb : 0 < b) (hea : Even a) (heb : Even b) :
    normalizedMixedTwoSlack a b 1 + normalizedMixedOneSlack a b 1 =
      (π / 2) * ((a : ℝ) * b + 2) * centralSignMass a * centralSignMass b := by
  have ha' : Odd (a - 1) := by
    obtain ⟨j, hj⟩ := hea
    exact ⟨j - 1, by omega⟩
  have hb' : Odd (b - 1) := by
    obtain ⟨j, hj⟩ := heb
    exact ⟨j - 1, by omega⟩
  have hminus : (-1 : ℤ) ∈ ThetaTotal a := Finset.mem_Icc.mpr (by omega)
  have hplus : (1 : ℤ) ∈ ThetaTotal a := Finset.mem_Icc.mpr (by omega)
  have hzero : (0 : ℤ) ∈ ThetaTotal a := Finset.mem_Icc.mpr (by omega)
  unfold normalizedMixedTwoSlack normalizedMixedOneSlack
  norm_num only [Nat.sub_self, Nat.cast_one, mul_one]
  rw [normalizedCommonSum_last_one _ hminus hplus, normalizedCommonSum_last_zero _ hzero,
    normalizedSignMass_at_one_of_odd _ ha', normalizedSignMass_at_one_of_odd _ hb',
    normalizedSignMass_at_zero_of_even _ hea, normalizedSignMass_at_zero_of_even _ heb,
    centralSignMass_pred_of_even a ha hea, centralSignMass_pred_of_even b hb heb]
  ring

end BraunBruegge
