import Conjectures.BraunBrueggeBicyclicFiniteArithmetic
import Conjectures.BraunBrueggeBicyclicNormalizedCounts
import Conjectures.BraunBrueggeBicyclicWedgeBenchmark

/-! Correctness of the integer recurrence used for the finite comparison.
The common-total sum is supported on the shortest sign word's parity range. -/

open Finset

namespace BraunBruegge

private theorem nextBinomial_eq (n k : ℕ) : nextBinomial n k (n.choose k) = n.choose (k + 1) := by
  unfold nextBinomial
  rw [← Nat.choose_succ_right_eq, Nat.mul_div_cancel _ (by omega)]

private theorem binomialProductLoop_eq_sum (a b c steps i j k : ℕ) :
    binomialProductLoop a b c steps i j k (a.choose i) (b.choose j) (c.choose k) =
      ∑ u ∈ range (steps + 1), a.choose (i + u) * b.choose (j + u) * c.choose (k + u) := by
  induction steps generalizing i j k with
  | zero => simp [binomialProductLoop]
  | succ steps ih =>
    rw [binomialProductLoop, nextBinomial_eq, nextBinomial_eq, nextBinomial_eq, ih]
    conv_rhs => rw [Finset.sum_range_succ']
    simp only [Nat.add_zero, Nat.add_assoc, Nat.add_comm 1]
    ac_rfl

private theorem nonzero_signCount_bounds {n : ℕ} {r : ℤ} (h : binomialSignCount n r ≠ 0) :
    |r| ≤ (n : ℤ) ∧ r % 2 = (n : ℤ) % 2 := by
  have hm : Nat.card (SignsWithTotal (Fin n) r) ≠ 0 := by
    rw [card_signsWithTotal, Fintype.card_fin]
    exact h
  obtain ⟨b⟩ := (Nat.card_ne_zero.mp hm).1
  exact ⟨((fullWordEquiv n r) b).val.abs_total_le_length,
    by simpa only [Fintype.card_fin] using signsWithTotal_parity b⟩

private def commonTotalIndex (m : ℕ) : ℕ ↪ ℤ where
  toFun i := 2 * (i : ℤ) - m
  inj' := by intro i j e; change 2 * (i : ℤ) - m = 2 * (j : ℤ) - m at e; omega

private theorem signCount_on_commonTotalIndex (m n i : ℕ) (h : m ≤ n) (hp : m % 2 = n % 2) :
    binomialSignCount n (commonTotalIndex m i) = n.choose ((n - m) / 2 + i) := by
  have hn : 2 * ((n - m) / 2) + m = n := by omega
  have hn' : 2 * (((n - m) / 2 : ℕ) : ℤ) + (m : ℤ) = (n : ℤ) := by exact_mod_cast hn
  have hp' : commonTotalIndex m i = 2 * ((((n - m) / 2 + i) : ℕ) : ℤ) - (Fintype.card (Fin n) : ℤ) := by
    simp only [Fintype.card_fin, Nat.cast_add]
    change 2 * (i : ℤ) - m = _
    omega
  have hCount := card_signsWithTotal_of_eq ((n - m) / 2 + i) (commonTotalIndex m i) hp'
  simpa only [card_signsWithTotal, Fintype.card_fin] using hCount

theorem computedSignProduct_eq (bound a b c : ℕ) (hbound : min a (min b c) ≤ bound)
    (hab : a % 2 = b % 2) (hac : a % 2 = c % 2) :
    computedSignProduct a b c = signProductCount (ThetaTotal bound) a b c := by
  classical
  let m := min a (min b c)
  have hmA : m ≤ a := min_le_left _ _
  have hmB : m ≤ b := (min_le_right _ _).trans (min_le_left _ _)
  have hmC : m ≤ c := (min_le_right _ _).trans (min_le_right _ _)
  have hp : m % 2 = a % 2 := by
    dsimp [m]
    simp only [min_def]
    split_ifs <;> omega
  let D := (range (m + 1)).map (commonTotalIndex m)
  have hD : D ⊆ ThetaTotal bound := by
    intro r hr
    obtain ⟨i, hi, rfl⟩ := Finset.mem_map.mp hr
    have hi' := Finset.mem_range.mp hi
    have hm : m ≤ bound := hbound
    apply Finset.mem_Icc.mpr
    change -(bound : ℤ) ≤ 2 * (i : ℤ) - m ∧ 2 * (i : ℤ) - m ≤ bound
    omega
  have hzero (r : ℤ) (_ : r ∈ ThetaTotal bound) (hr : r ∉ D) :
      binomialSignCount a r * binomialSignCount b r * binomialSignCount c r = 0 := by
    by_contra h
    have ha' : binomialSignCount a r ≠ 0 := fun e => h (by simp [e])
    have hb' : binomialSignCount b r ≠ 0 := fun e => h (by simp [e])
    have hc' : binomialSignCount c r ≠ 0 := fun e => h (by simp [e])
    have ha := nonzero_signCount_bounds ha'
    have hb := nonzero_signCount_bounds hb'
    have hc := nonzero_signCount_bounds hc'
    have habs : |r| ≤ (m : ℤ) := by
      change |r| ≤ ((min a (min b c)) : ℕ)
      rw [Nat.cast_min, Nat.cast_min]
      exact le_min ha.1 (le_min hb.1 hc.1)
    have hpar : r % 2 = (m : ℤ) % 2 := by omega
    let j := ((r + (m : ℤ)) / 2).toNat
    have hbnd := abs_le.mp habs
    have hj : j ∈ range (m + 1) := Finset.mem_range.mpr (by dsimp [j]; omega)
    have hre : commonTotalIndex m j = r := by change 2 * (j : ℤ) - m = r; dsimp [j]; omega
    exact hr (Finset.mem_map.mpr ⟨j, hj, hre⟩)
  unfold signProductCount
  rw [← Finset.sum_subset hD hzero, Finset.sum_map]
  unfold computedSignProduct
  simp only [← Nat.choose_eq_fast_choose]
  rw [binomialProductLoop_eq_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [signCount_on_commonTotalIndex m a i hmA hp,
    signCount_on_commonTotalIndex m b i hmB (hp.trans hab), signCount_on_commonTotalIndex m c i hmC (hp.trans hac)]

private theorem binomialProductLoop_swap (a b c steps i j k x y z : ℕ) :
    binomialProductLoop a b c steps i j k x y z = binomialProductLoop b a c steps j i k y x z := by
  induction steps generalizing i j k x y z with
  | zero => simp [binomialProductLoop, Nat.mul_comm x y]
  | succ steps ih => simp only [binomialProductLoop, ih, Nat.mul_comm x y]

private theorem computedSignProduct_swap (a b c : ℕ) : computedSignProduct a b c = computedSignProduct b a c := by
  unfold computedSignProduct
  simp only [min_left_comm b a]
  exact binomialProductLoop_swap a b c _ _ _ _ _ _ _

theorem computedMixedFacetCount_swap (a b c : ℕ) :
    computedMixedFacetCount a b c = computedMixedFacetCount b a c := by
  unfold computedMixedFacetCount
  rw [computedSignProduct_swap (a - 1), computedSignProduct_swap a, Nat.mul_comm a b]

theorem computedMixedFacetCount_eq (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    computedMixedFacetCount a b c = Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} := by
  rw [theta_facet_card_mixed_parity a b c ha hb hc hab hac]
  rw [Finset.sum_coe_sort (ThetaTotal a) (fun r => binomialSignCount (a - 1) r *
    binomialSignCount (b - 1) r * binomialSignCount c r),
    Finset.sum_coe_sort (ThetaTotal a) (fun r => binomialSignCount a r *
      binomialSignCount b r * binomialSignCount (c - 1) r)]
  unfold computedMixedFacetCount
  rw [computedSignProduct_eq a (a - 1) (b - 1) c ((min_le_left _ _).trans (Nat.sub_le _ _)) (by omega) (by omega),
    computedSignProduct_eq a a b (c - 1) (min_le_left _ _) (by omega) (by omega)]
  rfl

theorem computedWedgeCount_eq (l : ℕ) : computedWedgeCount l = wedgeBenchmark l := by
  let x := wedgeLeftLength l
  let y := wedgeRightLength l
  change 2 ^ (l - wedgeEffectiveLength l) * (x * (x - 1).fast_choose ((x - 1) / 2)) *
      (y * (y - 1).fast_choose ((y - 1) / 2)) = _
  simp only [← Nat.choose_eq_fast_choose, wedgeBenchmark, oddCycleFacetNumber, x, y]

private theorem checkMixedAtTotal_sound_ordered (l a b : ℕ) (h : checkMixedAtTotal l = true)
    (ha : 0 < a) (hab : a ≤ b) (hsum : a + b < l) (hp : a % 2 = b % 2)
    (hpc : a % 2 ≠ (l - a - b) % 2) :
    computedMixedFacetCount a b (l - a - b) ≤ computedWedgeCount l := by
  have hi : a - 1 ∈ List.range ((l - 1) / 2) := List.mem_range.mpr (by omega)
  have hj : b - a ∈ List.range (l - 2 * a) := List.mem_range.mpr (by omega)
  unfold checkMixedAtTotal at h
  have h₁ := List.all_eq_true.mp h (a - 1) hi
  rw [Nat.sub_add_cancel (show 1 ≤ a by omega)] at h₁
  have h₂ := List.all_eq_true.mp h₁ (b - a) hj
  rw [Nat.add_sub_of_le hab] at h₂
  change (if a % 2 = b % 2 ∧ a % 2 ≠ (l - a - b) % 2 then
    decide (computedMixedFacetCount a b (l - a - b) ≤ computedWedgeCount l) else true) = true at h₂
  have he : a % 2 = b % 2 ∧ a % 2 ≠ (l - a - b) % 2 := ⟨hp, hpc⟩
  split at h₂
  · exact of_decide_eq_true h₂
  · rename_i hn
    exact (hn he).elim

theorem checkMixedAtTotal_sound (l a b : ℕ) (h : checkMixedAtTotal l = true)
    (ha : 0 < a) (hb : 0 < b) (hsum : a + b < l) (hp : a % 2 = b % 2) (hpc : a % 2 ≠ (l - a - b) % 2) :
    computedMixedFacetCount a b (l - a - b) ≤ computedWedgeCount l := by
  by_cases hab : a ≤ b
  · exact checkMixedAtTotal_sound_ordered l a b h ha hab hsum hp hpc
  · have he : l - b - a = l - a - b := by omega
    have hcp : b % 2 ≠ (l - b - a) % 2 := by rw [he, ← hp]; exact hpc
    have e := checkMixedAtTotal_sound_ordered l b a h hb (by omega) (by omega) hp.symm hcp
    rw [he, computedMixedFacetCount_swap b a] at e
    exact e

end BraunBruegge
