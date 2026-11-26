import Conjectures.BraunBrueggeBicyclicNormalizedCounts
import Conjectures.BraunBrueggeBicyclicWedgeBenchmark
import Mathlib.Analysis.Real.Pi.Bounds

/-! A prescribed sign total fixes one sign once the other signs are given.
This bounds all positive-length same-parity theta counts by the wedge benchmark. -/

open Real Finset

namespace BraunBruegge

private theorem binomialSignCount_succ_le (n : ℕ) (r : ℤ) : binomialSignCount (n + 1) r ≤ 2 ^ n := by
  classical
  let f (b : SignsWithTotal (Fin (n + 1)) r) (i : Fin n) := b.val i.succ
  have hf : Function.Injective f := by
    intro x y e
    have htail : ∑ i : Fin n, stepSign (x.val i.succ) = ∑ i : Fin n, stepSign (y.val i.succ) := by
      apply Finset.sum_congr rfl
      intro i _
      exact congrArg stepSign (congrFun e i)
    have hx := x.property
    have hy := y.property
    rw [Fin.sum_univ_succ, htail] at hx
    rw [Fin.sum_univ_succ] at hy
    have hzero : x.val 0 = y.val 0 := stepSign_injective (by linarith)
    apply Subtype.ext
    funext i
    refine Fin.cases hzero (fun j => congrFun e j) i
  have hc := Nat.card_le_card_of_injective f hf
  rw [card_signsWithTotal, Fintype.card_fin, Nat.card_fun, Nat.card_fin, show Nat.card Bool = 2 by simp] at hc
  exact hc

theorem normalizedSignMass_le_half (m : ℕ) (r : ℤ) (hm : 0 < m) : normalizedSignMass m r ≤ 1 / 2 := by
  obtain ⟨n, rfl⟩ : ∃ n, m = n + 1 := ⟨m - 1, by omega⟩
  have h : (binomialSignCount (n + 1) r : ℝ) ≤ 2 ^ n := by exact_mod_cast binomialSignCount_succ_le n r
  unfold normalizedSignMass
  apply (div_le_iff₀ (by positivity)).mpr
  rw [pow_succ]
  linarith

theorem centralSignMass_le_half (m : ℕ) (hm : 0 < m) : centralSignMass m ≤ 1 / 2 := by
  let r := 2 * (((m / 2 : ℕ) : ℤ)) - m
  have h := card_signsWithTotal_of_eq (I := Fin m) (m / 2) r (by simp [r])
  rw [card_signsWithTotal, Fintype.card_fin] at h
  have e := normalizedSignMass_le_half m r hm
  simpa only [normalizedSignMass, h, centralSignMass] using e

theorem normalizedThetaFacets_same (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 = (c : ℤ) % 2) :
    normalizedThetaFacets a b c = 2 * π * normalizedCommonSum (ThetaTotal a) a b c := by
  have h := theta_facet_card_same_parity a b c ha hb hc hab hac
  rw [Finset.sum_coe_sort (ThetaTotal a) (fun r => binomialSignCount a r * binomialSignCount b r * binomialSignCount c r)] at h
  change Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} = signProductCount (ThetaTotal a) a b c at h
  rw [normalizedThetaFacets, h, cast_signProductCount]
  field_simp

theorem same_parity_theta_facets_lt_wedge (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hl : 6 ≤ a + b + c) (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 = (c : ℤ) % 2) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} < wedgeBenchmark (a + b + c) := by
  let l := a + b + c
  have he : (6 : ℝ) ≤ wedgeEffectiveLength l := by
    exact_mod_cast (show 6 ≤ wedgeEffectiveLength l by unfold wedgeEffectiveLength; omega)
  have hfrac : (2 : ℝ) / (wedgeEffectiveLength l : ℝ) ≤ 1 / 3 := (div_le_iff₀ (by linarith)).mpr (by linarith)
  have hW := normalizedWedgeBenchmark_lower l hl
  have hB : (2 : ℝ) < normalizedWedgeBenchmark l := by linarith only [he, hfrac, hW]
  have hprod : normalizedCommonSum (ThetaTotal a) a b c ≤ (1 : ℝ) / 4 := by
    apply (normalizedCommonSum_le_two_centers _ _ _ _).trans
    have e := mul_le_mul (centralSignMass_le_half a ha) (centralSignMass_le_half b hb)
      (centralSignMass_nonneg b) (show 0 ≤ (1 : ℝ) / 2 by norm_num)
    norm_num at e ⊢
    exact e
  have hN : normalizedThetaFacets a b c < normalizedWedgeBenchmark l := by
    rw [normalizedThetaFacets_same a b c ha hb hc hab hac]
    have e := mul_le_mul_of_nonneg_left hprod (by positivity : 0 ≤ 2 * π)
    linarith only [e, Real.pi_lt_four, hB]
  unfold normalizedThetaFacets normalizedWedgeBenchmark at hN
  have hp : 0 < 2 * π / (2 : ℝ) ^ l := by positivity
  have hc : (Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} : ℝ) < (wedgeBenchmark l : ℝ) := by
    by_contra! hn
    exact (not_lt_of_ge (mul_le_mul_of_nonneg_left hn hp.le)) hN
  exact_mod_cast hc

end BraunBruegge
