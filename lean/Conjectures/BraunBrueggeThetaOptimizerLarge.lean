import Conjectures.BraunBrueggeThetaOptimizerBalance
import Conjectures.BraunBrueggeThetaOptimizerGeometry
import Conjectures.BraunBrueggeThetaOptimizerLower
import Conjectures.BraunBrueggeThetaOptimizerUpper

/-! The exact theta optimizer at total path lengths at least 144. -/

open Real

namespace BraunBruegge

private theorem even_minimal_comparison (a b u v : ℕ) (hap : 0 < a) (ha : Even a) (hb : Even b)
    (hu : Even u) (hv : Even v) (hab : a ≤ b) (huv : u ≤ v) (hnear : v ≤ u + 2) (hs : a + b = u + v) :
    (a = u ∧ b = v) ∨ normalizedThetaFacets a b 1 < normalizedThetaFacets u v 1 := by
  obtain ⟨i, hi⟩ := ha
  obtain ⟨j, hj⟩ := hb
  obtain ⟨k, hk⟩ := hu
  obtain ⟨m, hm⟩ := hv
  have hkp : 0 < k := by omega
  have hor := thetaPairScore_balanced false i j k m (by omega) (by omega) (by omega) (by omega) (by omega)
  rcases hor with he | hlt
  · exact Or.inl ⟨by omega, by omega⟩
  · right
    rw [show a = 2 * i by omega, show b = 2 * j by omega, show u = 2 * k by omega, show v = 2 * m by omega,
      normalized_theta_even_score _ _ (by omega) (by omega), normalized_theta_even_score _ _ (by omega) (by omega)]
    exact hlt

private theorem odd_minimal_comparison (a b u v : ℕ) (ha : Odd a) (hb : Odd b)
    (hu : Odd u) (hv : Odd v) (hab : a ≤ b) (huv : u ≤ v) (hnear : v ≤ u + 2) (hs : a + b = u + v) :
    (a = u ∧ b = v) ∨ normalizedThetaFacets a b 2 < normalizedThetaFacets u v 2 := by
  obtain ⟨i, rfl⟩ := ha
  obtain ⟨j, rfl⟩ := hb
  obtain ⟨k, rfl⟩ := hu
  obtain ⟨m, rfl⟩ := hv
  have hor := thetaPairScore_balanced true (i + 1) (j + 1) (k + 1) (m + 1) (by omega) (by omega) (by omega) (by omega) (by omega)
  rcases hor with he | hlt
  · exact Or.inl ⟨by omega, by omega⟩
  · simpa only [normalized_theta_odd_score] using Or.inr hlt

private theorem proposed_lower (l : ℕ) (hl : 11 ≤ l) :
    (l : ℝ) / 2 - (if l % 2 = 0 then 13 / 5 else 11 / 10) <
      normalizedThetaFacets (thetaOptimizerLeft l) (thetaOptimizerRight l) (thetaOptimizerShort l) := by
  obtain ⟨_, hsa, hab, hnear, hsum, hca, hp⟩ := thetaOptimizer_lengths l hl
  by_cases he : l % 2 = 0
  · have hs : thetaOptimizerShort l = 2 := by simp [thetaOptimizerShort, he]
    rw [hs] at hsa hsum hca ⊢
    rw [ite_eq_left he]
    have h := odd_balanced_theta_lower _ _ ⟨thetaOptimizerLeft l / 2, by omega⟩ ⟨thetaOptimizerRight l / 2, by omega⟩
      (by omega) hnear
    have sum' : (thetaOptimizerLeft l : ℝ) + thetaOptimizerRight l + 2 = l := by exact_mod_cast (by omega : thetaOptimizerLeft l + thetaOptimizerRight l + 2 = l)
    rwa [sum'] at h
  · have hs : thetaOptimizerShort l = 1 := by unfold thetaOptimizerShort; omega
    rw [hs] at hsa hsum hca ⊢
    rw [ite_eq_right he]
    have h := even_balanced_theta_lower _ _ (by omega) (by omega) ⟨thetaOptimizerLeft l / 2, by omega⟩
      ⟨thetaOptimizerRight l / 2, by omega⟩ (by omega) hnear
    have sum' : (thetaOptimizerLeft l : ℝ) + thetaOptimizerRight l + 1 = l := by exact_mod_cast (by omega : thetaOptimizerLeft l + thetaOptimizerRight l + 1 = l)
    rwa [sum'] at h

private theorem proposed_computed (l : ℕ) (hl : 11 ≤ l) :
    computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l) =
      computedMixedFacetCount (thetaOptimizerLeft l) (thetaOptimizerRight l) (thetaOptimizerShort l) := by
  obtain ⟨_, _, _, _, _, hsa, hab⟩ := thetaOptimizer_lengths l hl
  simp only [computedThetaFacetCount, ite_eq_right hsa, ite_eq_right (by omega : thetaOptimizerShort l % 2 ≠ thetaOptimizerRight l % 2)]

private theorem mixed_comparison (l a b c : ℕ) (hl : 144 ≤ l) (hpos : 0 < a) (hab : a ≤ b) (hc : 0 < c)
    (hsum : a + b + c = l) (hp : a % 2 = b % 2) (he : a % 2 ≠ c % 2) :
    (a = thetaOptimizerLeft l ∧ b = thetaOptimizerRight l ∧ c = thetaOptimizerShort l) ∨
    computedMixedFacetCount a b c <
      computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l) := by
  let u := thetaOptimizerLeft l
  let v := thetaOptimizerRight l
  let s := thetaOptimizerShort l
  obtain ⟨hs₀, hsu, huv, hnear, htot, hsu', huv'⟩ := thetaOptimizer_lengths l (by omega)
  change 0 < s at hs₀
  change s ≤ u at hsu
  change u ≤ v at huv
  change v ≤ u + 2 at hnear
  change s + u + v = l at htot
  change s % 2 ≠ u % 2 at hsu'
  change u % 2 = v % 2 at huv'
  have hbest := proposed_lower l (by omega)
  change _ < normalizedThetaFacets u v s at hbest
  have hl' : (144 : ℝ) ≤ l := by exact_mod_cast hl
  have hsum' : (a : ℝ) + b + c = l := by exact_mod_cast hsum
  have huvsum : u + v + s = l := by omega
  have toCounts (strict : normalizedThetaFacets a b c < normalizedThetaFacets u v s) :
      computedMixedFacetCount a b c <
        computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l) := by
    rw [proposed_computed l (by omega)]
    unfold normalizedThetaFacets at strict
    rw [hsum, huvsum, ← computedMixedFacetCount_eq a b c hpos (by omega) hc (by omega) (by omega),
      ← computedMixedFacetCount_eq u v s (by omega) (by omega) hs₀ (by omega) (by omega)] at strict
    exact_mod_cast (lt_of_mul_lt_mul_left strict (by positivity))
  by_cases hcmin : c = s
  · have hal : a + b = u + v := by omega
    by_cases even : a % 2 = 0
    · have hs : s = 1 := by dsimp [s, thetaOptimizerShort]; omega
      have h := even_minimal_comparison a b u v hpos ⟨a / 2, by omega⟩ ⟨b / 2, by omega⟩ ⟨u / 2, by omega⟩
        ⟨v / 2, by omega⟩ hab huv hnear hal
      rcases h with h | h
      · exact Or.inl ⟨h.1, h.2, hcmin⟩
      · exact Or.inr (toCounts (by simpa only [hcmin, hs] using h))
    · have hs : s = 2 := by dsimp [s, thetaOptimizerShort]; omega
      have h := odd_minimal_comparison a b u v ⟨a / 2, by omega⟩ ⟨b / 2, by omega⟩ ⟨u / 2, by omega⟩
        ⟨v / 2, by omega⟩ hab huv hnear hal
      rcases h with h | h
      · exact Or.inl ⟨h.1, h.2, hcmin⟩
      · exact Or.inr (toCounts (by simpa only [hcmin, hs] using h))
  · right
    apply toCounts
    rw [normalizedThetaFacets_mixed a b c hpos (by omega) hc (by omega) (by omega)]
    by_cases small : a < 10
    · have h := normalizedMixed_smallPart_le a b c hpos (by omega) hc (by omega) (Or.inl small)
      split_ifs at hbest <;> linarith only [h, hsum', hl', hbest]
    · by_cases even : a % 2 = 0
      · have hs : s = 1 := by dsimp [s, thetaOptimizerShort]; omega
        have h := nonminimal_even_theta_upper a b c (by omega) (by omega) ⟨a / 2, by omega⟩ ⟨b / 2, by omega⟩ (by omega)
        rw [ite_eq_right (by omega : l % 2 ≠ 0)] at hbest
        linarith only [h, hbest, hsum']
      · have hs : s = 2 := by dsimp [s, thetaOptimizerShort]; omega
        have h := nonminimal_odd_theta_upper a b c (by omega) (by omega) ⟨a / 2, by omega⟩ ⟨b / 2, by omega⟩
          (by omega) ⟨c / 2, by omega⟩
        rw [ite_eq_left (by omega : l % 2 = 0)] at hbest
        linarith only [h, hbest, hsum']

private theorem same_parity_comparison (l a b c : ℕ) (hl : 144 ≤ l) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hs : a + b + c = l) (hp : a % 2 = b % 2) (he : a % 2 = c % 2) :
    computedThetaFacetCount a b c <
      computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l) := by
  obtain ⟨hs₀, hsu, huv, _, htot, hpar, hpar'⟩ := thetaOptimizer_lengths l (by omega)
  have hm := (normalizedCommonSum_le_two_centers (ThetaTotal a) a b c).trans
    (mul_le_mul (centralSignMass_le_half a ha) (centralSignMass_le_half b hb) (centralSignMass_nonneg _) (by norm_num))
  have hu := mul_le_mul_of_nonneg_left hm (by positivity : 0 ≤ 2 * π)
  rw [← normalizedThetaFacets_same a b c ha hb hc (by omega) (by omega)] at hu
  have hbest := proposed_lower l (by omega)
  have hl' : (144 : ℝ) ≤ l := by exact_mod_cast hl
  have hlt : normalizedThetaFacets a b c <
      normalizedThetaFacets (thetaOptimizerLeft l) (thetaOptimizerRight l) (thetaOptimizerShort l) := by
    split_ifs at hbest <;> linarith only [hbest, hu, hl', Real.pi_lt_four]
  rw [proposed_computed l (by omega)]
  unfold normalizedThetaFacets at hlt
  rw [hs, show thetaOptimizerLeft l + thetaOptimizerRight l + thetaOptimizerShort l = l by omega,
    ← computedThetaFacetCount_eq a b c ha hb hc,
    ← computedMixedFacetCount_eq _ _ _ (by omega) (by omega) hs₀ (by omega) (by omega)] at hlt
  exact_mod_cast (lt_of_mul_lt_mul_left hlt (by positivity))

theorem thetaOptimizer_large_sorted (l : ℕ) (hl : 144 ≤ l) (x y z : ℕ) (hx : 0 < x) (hxy : x ≤ y)
    (hyz : y ≤ z) (hs : x + y + z = l) :
    (x = thetaOptimizerShort l ∧ y = thetaOptimizerLeft l ∧ z = thetaOptimizerRight l) ∨
      computedThetaFacetCount x y z <
        computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l) := by
  obtain ⟨_, hsa, hab, _, _, _, _⟩ := thetaOptimizer_lengths l (by omega)
  by_cases h₁ : x % 2 = y % 2
  · by_cases h₂ : x % 2 = z % 2
    · exact Or.inr (same_parity_comparison l x y z hl hx (by omega) (by omega) hs h₁ h₂)
    · rcases mixed_comparison l x y z hl hx hxy (by omega) hs h₁ h₂ with ⟨h₀, hu, hv⟩ | strict
      · exact Or.inl ⟨by omega, by omega, by omega⟩
      · have e : computedThetaFacetCount x y z = computedMixedFacetCount x y z := by
          rw [computedThetaFacetCount, ite_eq_left h₁, ite_eq_right h₂]
        exact Or.inr (e.trans_lt strict)
  · by_cases h₂ : x % 2 = z % 2
    · rcases mixed_comparison l x z y hl hx (by omega) (by omega) (by omega) h₂ h₁ with ⟨h₀, hu, hv⟩ | strict
      · exact Or.inl ⟨by omega, by omega, by omega⟩
      · have e : computedThetaFacetCount x y z = computedMixedFacetCount x z y := by
          rw [computedThetaFacetCount, ite_eq_right h₁, ite_eq_left h₂]
        exact Or.inr (e.trans_lt strict)
    · rcases mixed_comparison l y z x hl (by omega) hyz hx (by omega) (by omega) (by omega) with ⟨hu, hv, h₀⟩ | strict
      · exact Or.inl ⟨h₀, hu, hv⟩
      · have e : computedThetaFacetCount x y z = computedMixedFacetCount y z x := by
          rw [computedThetaFacetCount, ite_eq_right h₁, ite_eq_right h₂]
        exact Or.inr (e.trans_lt strict)

end BraunBruegge
