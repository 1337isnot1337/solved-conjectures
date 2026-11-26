import Conjectures.BraunBrueggeBicyclicThetaReindex
import Conjectures.BraunBrueggeThetaOptimizerArithmetic
import Mathlib.Data.Fin.Tuple.Sort

/-! Relating the executable comparisons to geometric facet counts at every path ordering. -/

namespace BraunBruegge

theorem computedThetaFacetCount_eq (x y z : ℕ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) :
    computedThetaFacetCount x y z = Nat.card {F // IsFacet (thetaGraph (thetaLengths x y z)) F} := by
  let length := thetaLengths x y z
  have hp : ∀ i, 0 < length i := by intro i; fin_cases i <;> assumption
  unfold computedThetaFacetCount
  by_cases hxy : x % 2 = y % 2
  · rw [ite_eq_left hxy]
    by_cases hxz : x % 2 = z % 2
    · rw [ite_eq_left hxz, theta_facet_card_same_parity x y z hx hy hz (by omega) (by omega)]
      rw [computedSignProduct_eq x x y z (min_le_left _ _) hxy hxz]
      exact (Finset.sum_coe_sort _ _).symm
    · rw [ite_eq_right hxz]
      exact computedMixedFacetCount_eq x y z hx hy hz (by omega) (by omega)
  · rw [ite_eq_right hxy]
    by_cases hxz : x % 2 = z % 2
    · rw [ite_eq_left hxz, computedMixedFacetCount_eq x z y hx hz hy (by omega) (by omega)]
      let e := Equiv.swap (1 : Fin 3) 2
      have he : thetaLengths x z y = length ∘ e := by funext i; fin_cases i <;> rfl
      rw [he]
      exact theta_reindex_facet_card length e hp
    · rw [ite_eq_right hxz, computedMixedFacetCount_eq y z x hy hz hx (by omega) (by omega)]
      let e := (Equiv.swap (0 : Fin 3) 1).trans (Equiv.swap 0 2)
      have he : thetaLengths y z x = length ∘ e := by funext i; fin_cases i <;> rfl
      rw [he]
      exact theta_reindex_facet_card length e hp

/-- The proposed optimizer in ascending order. -/
abbrev thetaOptimizerLengths (l : ℕ) : Fin 3 → ℕ :=
  thetaLengths (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l)

/-- A strict comparison on sorted triples gives the geometric maximum and all equality cases
for arbitrary positive path lengths, allowing any permutation of the three paths. -/
theorem thetaOptimizer_of_sorted (l : ℕ) (lo : 11 ≤ l)
    (compare : ∀ x y z : ℕ, 0 < x → x ≤ y → y ≤ z → x + y + z = l →
      (x = thetaOptimizerShort l ∧ y = thetaOptimizerLeft l ∧ z = thetaOptimizerRight l) ∨
        computedThetaFacetCount x y z <
          computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l))
    (length : Fin 3 → ℕ) (hp : ∀ i, 0 < length i) (hs : ∑ i, length i = l) :
    Nat.card {F // IsFacet (thetaGraph length) F} ≤
      Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths l)) F} ∧
    (Nat.card {F // IsFacet (thetaGraph length) F} =
      Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths l)) F} ↔
        ∃ e : Equiv.Perm (Fin 3), length ∘ e = thetaOptimizerLengths l) := by
  let e := Tuple.sort length
  let f := length ∘ e
  have hf : Monotone f := Tuple.monotone_sort length
  have hf' : thetaLengths (f 0) (f 1) (f 2) = f := by funext i; fin_cases i <;> rfl
  have hsum : f 0 + f 1 + f 2 = l := by
    have h : ∑ i, f i = l := (Equiv.sum_comp e length).trans hs
    simpa only [Fin.sum_univ_three] using h
  have ordered := compare (f 0) (f 1) (f 2) (hp _)
    (hf (by decide : (0 : Fin 3) ≤ 1)) (hf (by decide : (1 : Fin 3) ≤ 2)) hsum
  have base := thetaOptimizer_lengths l lo
  obtain ⟨hs₀, hsa, hab, _, _, _, _⟩ := base
  have hactual := computedThetaFacetCount_eq (f 0) (f 1) (f 2) (hp _) (hp _) (hp _)
  rw [hf', theta_reindex_facet_card length e hp] at hactual
  have hbest := computedThetaFacetCount_eq _ _ _ hs₀ (hs₀.trans_le hsa) ((hs₀.trans_le hsa).trans_le hab)
  have same (h : ∃ p : Equiv.Perm (Fin 3), length ∘ p = thetaOptimizerLengths l) :
      Nat.card {F // IsFacet (thetaGraph length) F} =
        Nat.card {F // IsFacet (thetaGraph (thetaOptimizerLengths l)) F} := by
    obtain ⟨p, he⟩ := h
    rw [← he]
    exact (theta_reindex_facet_card length p hp).symm
  rcases ordered with ⟨h₀, h₁, h₂⟩ | hlt
  · have he : length ∘ e = thetaOptimizerLengths l := by
      change f = _
      rw [← hf', h₀, h₁, h₂]
    exact ⟨(same ⟨e, he⟩).le, fun _ => ⟨e, he⟩, same⟩
  · rw [hactual, hbest] at hlt
    exact ⟨hlt.le, fun h => (hlt.ne h).elim, same⟩

end BraunBruegge
