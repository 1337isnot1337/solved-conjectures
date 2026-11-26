import Conjectures.BraunBrueggeBicyclicThetaCount
import Conjectures.BraunBrueggeBicyclicCentralMass

/-! The normalized theta count is a sum of products of sign masses.
Summing out one total bounds the product by the other two maxima. -/

open Finset Real

namespace BraunBruegge

theorem sum_binomialSignCount_le (m : ℕ) (s : Finset ℤ) :
    ∑ r ∈ s, binomialSignCount m r ≤ 2 ^ m := by
  classical
  let f (p : Σ r : s, SignsWithTotal (Fin m) r.val) : Fin m → Bool := p.2.val
  have hi : Function.Injective f := by
    rintro ⟨r, x⟩ ⟨t, y⟩ h
    have e : x.val = y.val := h
    have he : r = t := Subtype.ext (x.property.symm.trans (e.symm ▸ y.property))
    subst t
    have hxy : x = y := Subtype.ext e
    subst y
    rfl
  have hc := Fintype.card_le_of_injective f hi
  rw [Fintype.card_sigma, Fintype.card_fun, Fintype.card_bool, Fintype.card_fin] at hc
  have he (r : s) : Fintype.card (SignsWithTotal (Fin m) r.val) = binomialSignCount m r.val := by
    rw [← Nat.card_eq_fintype_card, card_signsWithTotal, Fintype.card_fin]
  simp_rw [he] at hc
  rwa [Finset.sum_coe_sort] at hc

theorem sum_normalizedSignMass_le_one (m : ℕ) (s : Finset ℤ) :
    ∑ r ∈ s, normalizedSignMass m r ≤ 1 := by
  unfold normalizedSignMass
  rw [← Finset.sum_div, div_le_one (by positivity), ← Nat.cast_sum]
  exact_mod_cast sum_binomialSignCount_le m s

noncomputable def normalizedCommonSum (s : Finset ℤ) (a b c : ℕ) : ℝ :=
  ∑ r ∈ s, normalizedSignMass a r * normalizedSignMass b r * normalizedSignMass c r

theorem normalizedCommonSum_nonneg (s : Finset ℤ) (a b c : ℕ) : 0 ≤ normalizedCommonSum s a b c := by
  apply Finset.sum_nonneg
  intro r _
  exact mul_nonneg (mul_nonneg (normalizedSignMass_nonneg a r) (normalizedSignMass_nonneg b r))
    (normalizedSignMass_nonneg c r)

theorem normalizedCommonSum_rotate (s : Finset ℤ) (a b c : ℕ) :
    normalizedCommonSum s a b c = normalizedCommonSum s b c a := by
  unfold normalizedCommonSum
  apply Finset.sum_congr rfl
  intro r _
  ring

theorem normalizedCommonSum_le_two_centers (s : Finset ℤ) (a b c : ℕ) :
    normalizedCommonSum s a b c ≤ centralSignMass a * centralSignMass b := by
  calc
    _ ≤ ∑ r ∈ s, (centralSignMass a * centralSignMass b) * normalizedSignMass c r := by
      apply Finset.sum_le_sum
      intro r _
      have ha := normalizedSignMass_le_center a r
      have hb := normalizedSignMass_le_center b r
      exact mul_le_mul_of_nonneg_right
        (mul_le_mul ha hb (normalizedSignMass_nonneg b r) (centralSignMass_nonneg a))
        (normalizedSignMass_nonneg c r)
    _ = (centralSignMass a * centralSignMass b) * ∑ r ∈ s, normalizedSignMass c r := by rw [Finset.mul_sum]
    _ ≤ _ := by
      simpa only [mul_one] using mul_le_mul_of_nonneg_left (sum_normalizedSignMass_le_one c s)
        (mul_nonneg (centralSignMass_nonneg a) (centralSignMass_nonneg b))

def signProductCount (s : Finset ℤ) (a b c : ℕ) : ℕ :=
  ∑ r ∈ s, binomialSignCount a r * binomialSignCount b r * binomialSignCount c r

private theorem normalizedSignMass_mul_pow (m : ℕ) (r : ℤ) :
    normalizedSignMass m r * 2 ^ m = (binomialSignCount m r : ℝ) :=
  (div_mul_cancel₀ _ (by positivity))

theorem cast_signProductCount (s : Finset ℤ) (a b c : ℕ) :
    (signProductCount s a b c : ℝ) = (2 : ℝ) ^ (a + b + c) * normalizedCommonSum s a b c := by
  unfold signProductCount normalizedCommonSum
  push_cast
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro r _
  rw [← normalizedSignMass_mul_pow a r, ← normalizedSignMass_mul_pow b r,
    ← normalizedSignMass_mul_pow c r, pow_add, pow_add]
  ring

noncomputable def normalizedThetaFacets (a b c : ℕ) : ℝ :=
  2 * π / (2 : ℝ) ^ (a + b + c) * (Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} : ℝ)

noncomputable def normalizedMixedTwoSlack (a b c : ℕ) : ℝ :=
  (2 * π * a * b / 4) * normalizedCommonSum (ThetaTotal a) (a - 1) (b - 1) c

noncomputable def normalizedMixedOneSlack (a b c : ℕ) : ℝ :=
  (2 * π * c / 2) * normalizedCommonSum (ThetaTotal a) a b (c - 1)

private theorem ratio_pow_add (n k : ℕ) : (2 : ℝ) ^ n / 2 ^ (n + k) = 1 / 2 ^ k := by
  rw [pow_add]
  field_simp

theorem normalizedThetaFacets_mixed (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    normalizedThetaFacets a b c = normalizedMixedTwoSlack a b c + normalizedMixedOneSlack a b c := by
  have h : Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} =
      a * b * signProductCount (ThetaTotal a) (a - 1) (b - 1) c +
        c * signProductCount (ThetaTotal a) a b (c - 1) := by
    have he := theta_facet_card_mixed_parity a b c ha hb hc hab hac
    rw [Finset.sum_coe_sort (ThetaTotal a) (fun r => binomialSignCount (a - 1) r *
      binomialSignCount (b - 1) r * binomialSignCount c r),
      Finset.sum_coe_sort (ThetaTotal a) (fun r => binomialSignCount a r *
        binomialSignCount b r * binomialSignCount (c - 1) r)] at he
    exact he
  rw [normalizedThetaFacets, h]
  push_cast
  rw [cast_signProductCount, cast_signProductCount]
  have h₂ : (2 : ℝ) ^ (a - 1 + (b - 1) + c) / 2 ^ (a + b + c) = 1 / 4 := by
    simpa only [show a - 1 + (b - 1) + c + 2 = a + b + c by omega, show (2 : ℝ) ^ 2 = 4 by norm_num] using ratio_pow_add (a - 1 + (b - 1) + c) 2
  have h₁ : (2 : ℝ) ^ (a + b + (c - 1)) / 2 ^ (a + b + c) = 1 / 2 := by
    simpa only [show a + b + (c - 1) + 1 = a + b + c by omega, pow_one] using ratio_pow_add (a + b + (c - 1)) 1
  calc
    _ = (2 * π * a * b * ((2 : ℝ) ^ (a - 1 + (b - 1) + c) / 2 ^ (a + b + c))) *
          normalizedCommonSum (ThetaTotal a) (a - 1) (b - 1) c +
        (2 * π * c * ((2 : ℝ) ^ (a + b + (c - 1)) / 2 ^ (a + b + c))) *
          normalizedCommonSum (ThetaTotal a) a b (c - 1) := by ring
    _ = _ := by rw [h₂, h₁]; unfold normalizedMixedTwoSlack normalizedMixedOneSlack; ring

end BraunBruegge
