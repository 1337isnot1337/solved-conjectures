import Conjectures.BraunBrueggeBicyclicCycleBalance

/-! The balanced odd-cycle wedge dominates every product of two cycle
facet counts with bridges, and its normalized count is nondecreasing. -/

open Real

namespace BraunBruegge

def cycleFacetNumber (m : ℕ) : ℕ := if Even m then m.choose (m / 2) else oddCycleFacetNumber m

theorem cycle_facets_eq_number (m : ℕ) (hm : 3 ≤ m) :
    Nat.card {F // IsFacet (SimpleGraph.cycleGraph m) F} = cycleFacetNumber m := by
  obtain ⟨k, rfl⟩ : ∃ k, m = k + 3 := ⟨m - 3, by omega⟩
  rcases Nat.even_or_odd (k + 3) with he | ho
  · simpa only [cycleFacetNumber, he, ite_true] using cycle_facet_card_even k he
  · have hn : ¬Even (k + 3) := by
      rintro ⟨a, ha⟩
      obtain ⟨b, hb⟩ := ho
      omega
    simpa only [cycleFacetNumber, hn, ite_false] using cycle_facet_card_odd_as_number k ho

noncomputable def normalizedCycleMass (m : ℕ) : ℝ := (cycleFacetNumber m : ℝ) / 2 ^ m

private theorem normalizedCycleMass_nonneg (m : ℕ) : 0 ≤ normalizedCycleMass m := by
  unfold normalizedCycleMass
  positivity

theorem normalizedCycleMass_le_oddIndex (m : ℕ) (hm : 0 < m) :
    normalizedCycleMass m ≤ oddIndexMass ((m - 1) / 2) := by
  rcases Nat.even_or_odd m with ⟨j, hj⟩ | ho
  · obtain ⟨i, rfl⟩ : ∃ i, j = i + 1 := ⟨j - 1, by omega⟩
    have e : m = 2 * (i + 1) := by omega
    have he : Even m := ⟨i + 1, hj⟩
    have hn : (m - 1) / 2 = i := by omega
    unfold normalizedCycleMass cycleFacetNumber
    simp only [he, ite_true, hn]
    change centralSignMass m ≤ oddIndexMass i
    rw [e, centralSignMass_even_succ, oddIndexMass]
    apply mul_le_mul_of_nonneg_right _ (centralSignMass_nonneg _)
    apply (div_le_div_iff₀ (by positivity) (by norm_num)).mpr
    nlinarith [Nat.cast_nonneg (α := ℝ) i]
  · obtain ⟨j, hj⟩ := ho
    have hn : (m - 1) / 2 = j := by omega
    have h : ¬Even m := by rintro ⟨a, ha⟩; omega
    unfold normalizedCycleMass cycleFacetNumber
    simp only [h, ite_false, hn]
    rw [hj]
    exact (normalized_oddCycle_index j).le

private def wedgePairIndexSum (l : ℕ) : ℕ := (wedgeEffectiveLength l - 2) / 2

theorem normalizedWedgeBenchmark_eq_odd_indices (l : ℕ) (hl : 5 ≤ l) :
    normalizedWedgeBenchmark l = 2 * π * oddIndexMass (wedgePairIndexSum l / 2) *
      oddIndexMass ((wedgePairIndexSum l + 1) / 2) := by
  let s := wedgeEffectiveLength l
  let i := wedgePairIndexSum l / 2
  let j := (wedgePairIndexSum l + 1) / 2
  have hs : 4 ≤ s := by dsimp [s, wedgeEffectiveLength]; omega
  have hmod : s % 2 = 0 := by dsimp [s, wedgeEffectiveLength]; omega
  have hle : s ≤ l := Nat.sub_le _ _
  have hx : wedgeLeftLength l = 2 * i + 1 := by dsimp [wedgeLeftLength, i, wedgePairIndexSum]; omega
  have hy : wedgeRightLength l = 2 * j + 1 := by
    rw [wedgeRightLength, hx]
    change s - (2 * i + 1) = 2 * j + 1
    dsimp [i, j, wedgePairIndexSum]
    omega
  have hpow : (2 : ℝ) ^ l = 2 ^ (l - s) * 2 ^ (2 * i + 1) * 2 ^ (2 * j + 1) := by
    rw [← pow_add, ← pow_add]
    congr 1
    dsimp [i, j, wedgePairIndexSum]
    omega
  unfold normalizedWedgeBenchmark wedgeBenchmark
  rw [hx, hy, hpow]
  push_cast
  calc
    _ = 2 * π * ((oddCycleFacetNumber (2 * i + 1) : ℝ) / 2 ^ (2 * i + 1)) *
      ((oddCycleFacetNumber (2 * j + 1) : ℝ) / 2 ^ (2 * j + 1)) := by
      change 2 * π / ((2 : ℝ) ^ (l - s) * _ * _) * ((2 : ℝ) ^ (l - s) * _ * _) = _
      field_simp
    _ = _ := by rw [normalized_oddCycle_index i, normalized_oddCycle_index j]

theorem normalizedWedgeBenchmark_mono {l m : ℕ} (hl : 5 ≤ l) (h : l ≤ m) :
    normalizedWedgeBenchmark l ≤ normalizedWedgeBenchmark m := by
  have hm : 5 ≤ m := hl.trans h
  rw [normalizedWedgeBenchmark_eq_odd_indices l hl, normalizedWedgeBenchmark_eq_odd_indices m hm]
  have he : wedgePairIndexSum l ≤ wedgePairIndexSum m := by unfold wedgePairIndexSum wedgeEffectiveLength; omega
  have hi := oddIndexMass_monotone (show wedgePairIndexSum l / 2 ≤ wedgePairIndexSum m / 2 by omega)
  have hj := oddIndexMass_monotone (show (wedgePairIndexSum l + 1) / 2 ≤ (wedgePairIndexSum m + 1) / 2 by omega)
  exact mul_le_mul (mul_le_mul_of_nonneg_left hi (by positivity)) hj
    (oddIndexMass_nonneg _) (mul_nonneg (by positivity) (oddIndexMass_nonneg _))

theorem wedgeBenchmark_bridge_le (l b : ℕ) (hl : 5 ≤ l) : 2 ^ b * wedgeBenchmark l ≤ wedgeBenchmark (l + b) := by
  have h := normalizedWedgeBenchmark_mono hl (show l ≤ l + b by omega)
  have hp : 0 < 2 * π / (2 : ℝ) ^ (l + b) := by positivity
  have he : (2 * π / (2 : ℝ) ^ (l + b)) * (2 ^ b * (wedgeBenchmark l : ℝ)) = normalizedWedgeBenchmark l := by
    unfold normalizedWedgeBenchmark
    rw [pow_add]
    field_simp
  have hh : (2 * π / (2 : ℝ) ^ (l + b)) * (2 ^ b * (wedgeBenchmark l : ℝ)) ≤
      (2 * π / (2 : ℝ) ^ (l + b)) * (wedgeBenchmark (l + b) : ℝ) := he ▸ h
  have hc : 2 ^ b * (wedgeBenchmark l : ℝ) ≤ (wedgeBenchmark (l + b) : ℝ) := by
    by_contra! hn
    exact (not_lt_of_ge hh) (mul_lt_mul_of_pos_left hn hp)
  exact_mod_cast hc

theorem cycleProducts_le_wedgeBenchmark (x y b : ℕ) (hx : 3 ≤ x) (hy : 3 ≤ y) :
    2 ^ b * cycleFacetNumber x * cycleFacetNumber y ≤ wedgeBenchmark (x + y + b) := by
  let l := x + y + b
  let a := (x - 1) / 2
  let c := (y - 1) / 2
  let n := wedgePairIndexSum l
  have hac : a + c ≤ n := by dsimp [n, a, c, l, wedgePairIndexSum, wedgeEffectiveLength]; omega
  have hprod : normalizedCycleMass x * normalizedCycleMass y ≤ oddIndexMass (n / 2) * oddIndexMass ((n + 1) / 2) := by
    calc
      _ ≤ oddIndexMass a * oddIndexMass c := mul_le_mul
          (normalizedCycleMass_le_oddIndex x (by omega)) (normalizedCycleMass_le_oddIndex y (by omega))
          (normalizedCycleMass_nonneg _) (oddIndexMass_nonneg _)
      _ ≤ oddIndexMass a * oddIndexMass (n - a) :=
        mul_le_mul_of_nonneg_left (oddIndexMass_monotone (by omega)) (oddIndexMass_nonneg _)
      _ ≤ _ := by
        have h := oddIndexMass_product_balanced a (n - a)
        rwa [Nat.add_sub_of_le (show a ≤ n by omega)] at h
  have hNorm : (2 * π / (2 : ℝ) ^ l) * (2 ^ b * (cycleFacetNumber x : ℝ) * (cycleFacetNumber y : ℝ)) ≤
      normalizedWedgeBenchmark l := by
    rw [normalizedWedgeBenchmark_eq_odd_indices l (by omega)]
    have e : (2 * π / (2 : ℝ) ^ l) * (2 ^ b * (cycleFacetNumber x : ℝ) * (cycleFacetNumber y : ℝ)) =
        (2 * π) * (normalizedCycleMass x * normalizedCycleMass y) := by
      unfold normalizedCycleMass
      dsimp [l]
      rw [pow_add, pow_add]
      field_simp
    rw [e]
    calc
      _ ≤ (2 * π) * (oddIndexMass (n / 2) * oddIndexMass ((n + 1) / 2)) :=
        mul_le_mul_of_nonneg_left hprod (by positivity)
      _ = _ := by dsimp [n]; ring
  have hp : 0 < 2 * π / (2 : ℝ) ^ l := by positivity
  have h : 2 ^ b * (cycleFacetNumber x : ℝ) * (cycleFacetNumber y : ℝ) ≤ (wedgeBenchmark l : ℝ) := by
    by_contra! hn
    exact (not_lt_of_ge hNorm) (mul_lt_mul_of_pos_left hn hp)
  exact_mod_cast h

end BraunBruegge
