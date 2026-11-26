import Conjectures.BraunBrueggeBicyclicCycleCount
import Conjectures.BraunBrueggeBicyclicCentralMass

/-! The balanced odd-cycle wedge benchmark and its uniform lower bound.
When the total edge count is odd, one bridge accounts for the extra edge. -/

open Real

namespace BraunBruegge

def oddCycleFacetNumber (n : ℕ) : ℕ := n * (n - 1).choose ((n - 1) / 2)

theorem cycle_facet_card_odd_as_number (n : ℕ) (h : Odd (n + 3)) :
    Nat.card {F // IsFacet (SimpleGraph.cycleGraph (n + 3)) F} = oddCycleFacetNumber (n + 3) := by
  rw [cycle_facet_card_odd n h, oddCycleFacetNumber, show n + 3 - 1 = n + 2 by omega]

private theorem normalized_oddCycleFacetNumber (n : ℕ) (hn : 0 < n) :
    (oddCycleFacetNumber n : ℝ) / 2 ^ n = (n : ℝ) / 2 * centralSignMass (n - 1) := by
  unfold oddCycleFacetNumber centralSignMass
  push_cast
  have h : (2 : ℝ) ^ n = 2 ^ (n - 1) * 2 := by
    rw [← pow_succ, Nat.sub_add_cancel (show 1 ≤ n by omega)]
  rw [h]
  field_simp

noncomputable def normalizedOddWedge (x y : ℕ) : ℝ :=
  2 * π / 2 ^ (x + y) * (oddCycleFacetNumber x : ℝ) * (oddCycleFacetNumber y : ℝ)

private theorem normalizedOddWedge_eq_centers (x y : ℕ) (hx : 0 < x) (hy : 0 < y) :
    normalizedOddWedge x y = (π / 2) * x * y * centralSignMass (x - 1) * centralSignMass (y - 1) := by
  unfold normalizedOddWedge
  rw [pow_add]
  calc
    _ = (2 * π) * ((oddCycleFacetNumber x : ℝ) / 2 ^ x) * ((oddCycleFacetNumber y : ℝ) / 2 ^ y) := by ring
    _ = _ := by rw [normalized_oddCycleFacetNumber x hx, normalized_oddCycleFacetNumber y hy]; ring

theorem normalizedOddWedge_sq_lower (x y : ℕ) (hx : Odd x) (hy : Odd y) :
    (x : ℝ) * y ≤ normalizedOddWedge x y ^ 2 := by
  obtain ⟨i, hi⟩ := hx
  obtain ⟨j, hj⟩ := hy
  have hx' : 0 < x := by omega
  have hy' : 0 < y := by omega
  have ha := centralSignMass_sq_lower_of_even (x - 1) ⟨i, by omega⟩
  have hb := centralSignMass_sq_lower_of_even (y - 1) ⟨j, by omega⟩
  have hxc : ((x - 1 : ℕ) : ℝ) + 1 = x := by exact_mod_cast Nat.sub_add_cancel (show 1 ≤ x by omega)
  have hyc : ((y - 1 : ℕ) : ℝ) + 1 = y := by exact_mod_cast Nat.sub_add_cancel (show 1 ≤ y by omega)
  rw [hxc] at ha
  rw [hyc] at hb
  have hprod := mul_le_mul ha hb (by positivity : 0 ≤ 2 / π) (by positivity : 0 ≤ centralSignMass (x - 1) ^ 2 * x)
  have hscaled : 1 ≤ ((π / 2) * centralSignMass (x - 1) * centralSignMass (y - 1)) ^ 2 * (x * (y : ℝ)) := by
    calc
      _ = (π / 2) ^ 2 * ((2 / π) * (2 / π)) := by field_simp
      _ ≤ (π / 2) ^ 2 * ((centralSignMass (x - 1) ^ 2 * x) * (centralSignMass (y - 1) ^ 2 * y)) :=
        mul_le_mul_of_nonneg_left hprod (sq_nonneg _)
      _ = _ := by ring
  calc
    _ = 1 * ((x : ℝ) * y) := by ring
    _ ≤ (((π / 2) * centralSignMass (x - 1) * centralSignMass (y - 1)) ^ 2 * (x * (y : ℝ))) * (x * (y : ℝ)) :=
      mul_le_mul_of_nonneg_right hscaled (by positivity)
    _ = _ := by rw [normalizedOddWedge_eq_centers x y hx' hy']; ring

theorem normalizedOddWedge_lower (x y : ℕ) (hx : Odd x) (hy : Odd y) (hxy : x ≤ y + 2) (hyx : y ≤ x + 2)
    (hsum : 2 ≤ x + y) : ((x : ℝ) + y) / 2 - 2 / ((x : ℝ) + y) ≤ normalizedOddWedge x y := by
  have hs : (2 : ℝ) ≤ (x : ℝ) + y := by exact_mod_cast hsum
  have hpos : 0 < (x : ℝ) + y := by linarith
  have h₁ : (x : ℝ) ≤ (y : ℝ) + 2 := by exact_mod_cast hxy
  have h₂ : (y : ℝ) ≤ (x : ℝ) + 2 := by exact_mod_cast hyx
  have hd : ((x : ℝ) - y) ^ 2 ≤ (2 : ℝ) ^ 2 := sq_le_sq' (by linarith) (by linarith)
  have hu : 4 / ((x : ℝ) + y) ^ 2 ≤ 1 := by
    apply (div_le_one (by positivity)).mpr
    nlinarith
  apply le_of_sq_le_sq _ (by unfold normalizedOddWedge; positivity)
  apply le_trans _ (normalizedOddWedge_sq_lower x y hx hy)
  calc
    _ = ((x : ℝ) + y) ^ 2 / 4 - 2 + 4 / ((x : ℝ) + y) ^ 2 := by
      field_simp
      ring
    _ ≤ _ := by nlinarith only [hd, hu]

def wedgeEffectiveLength (l : ℕ) : ℕ := l - l % 2

def wedgeLeftLength (l : ℕ) : ℕ := 2 * ((wedgeEffectiveLength l - 2) / 4) + 1

def wedgeRightLength (l : ℕ) : ℕ := wedgeEffectiveLength l - wedgeLeftLength l

def wedgeBenchmark (l : ℕ) : ℕ :=
  2 ^ (l - wedgeEffectiveLength l) * oddCycleFacetNumber (wedgeLeftLength l) * oddCycleFacetNumber (wedgeRightLength l)

noncomputable def normalizedWedgeBenchmark (l : ℕ) : ℝ :=
  2 * π / (2 : ℝ) ^ l * wedgeBenchmark l

theorem wedge_lengths (l : ℕ) (hl : 6 ≤ l) :
    let x := wedgeLeftLength l
    let y := wedgeRightLength l
    3 ≤ x ∧ 3 ≤ y ∧ Odd x ∧ Odd y ∧ x + y = wedgeEffectiveLength l ∧ x ≤ y + 2 ∧ y ≤ x + 2 := by
  dsimp only
  unfold wedgeRightLength wedgeLeftLength wedgeEffectiveLength
  refine ⟨by omega, by omega, ⟨_, rfl⟩, ?_, by omega, by omega, by omega⟩
  let y := l - l % 2 - (2 * ((l - l % 2 - 2) / 4) + 1)
  exact ⟨y / 2, by dsimp [y]; omega⟩

theorem normalizedWedgeBenchmark_lower (l : ℕ) (hl : 6 ≤ l) :
    (wedgeEffectiveLength l : ℝ) / 2 - 2 / (wedgeEffectiveLength l : ℝ) ≤ normalizedWedgeBenchmark l := by
  obtain ⟨hx₁, hy₁, hx₂, hy₂, he, hxy, hyx⟩ := wedge_lengths l hl
  let x := wedgeLeftLength l
  let y := wedgeRightLength l
  have hs : 2 ≤ x + y := by change 2 ≤ wedgeLeftLength l + wedgeRightLength l; omega
  have hh := normalizedOddWedge_lower x y hx₂ hy₂ hxy hyx hs
  have hpow : (2 : ℝ) ^ l = 2 ^ (l - wedgeEffectiveLength l) * 2 ^ (x + y) := by
    have hle : wedgeEffectiveLength l ≤ l := Nat.sub_le _ _
    rw [← pow_add, show l - wedgeEffectiveLength l + (x + y) = l from by simp only [x, y, he, Nat.sub_add_cancel hle]]
  have hnorm : normalizedWedgeBenchmark l = normalizedOddWedge x y := by
    unfold normalizedWedgeBenchmark normalizedOddWedge wedgeBenchmark
    push_cast
    rw [hpow]
    field_simp
    rfl
  change x + y = wedgeEffectiveLength l at he
  rw [← hnorm, ← Nat.cast_add, he] at hh
  exact hh

end BraunBruegge
