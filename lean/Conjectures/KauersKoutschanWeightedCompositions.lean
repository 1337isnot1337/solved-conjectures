import Mathlib.Combinatorics.Enumerative.Composition
import Mathlib.Tactic

/-! The ordinary first-block recurrence for arbitrary weights on compositions. -/

open scoped BigOperators

namespace KauersKoutschan

private def prependComposition (n : ℕ) (q : Σ k : Fin (n + 1), Composition (n - k)) :
    Composition (n + 1) where
  blocks := (q.1.val + 1) :: q.2.blocks
  blocks_pos := by
    intro j hj
    rcases List.mem_cons.mp hj with rfl | h
    · omega
    · exact q.2.blocks_pos h
  blocks_sum := by
    rw [List.sum_cons, q.2.blocks_sum]
    have hk := q.1.isLt
    omega

private noncomputable def firstPartEquiv (n : ℕ) :
    (Σ k : Fin (n + 1), Composition (n - k)) ≃ Composition (n + 1) :=
  Equiv.ofBijective (prependComposition n) ⟨by
    rintro ⟨i, a⟩ ⟨j, b⟩ h
    have hl : (i.val + 1) :: a.blocks = (j.val + 1) :: b.blocks :=
      congrArg Composition.blocks h
    have hij : i = j := Fin.ext (by have := (List.cons.inj hl).1; omega)
    subst j
    have hab : a = b := Composition.ext (List.cons.inj hl).2
    subst b
    rfl, by
    intro c
    cases h : c.blocks with
    | nil =>
      have hc := c.blocks_sum
      rw [h, List.sum_nil] at hc
      omega
    | cons a l =>
      have ha := c.blocks_pos (show a ∈ c.blocks by rw [h]; simp)
      have hc := c.blocks_sum
      rw [h, List.sum_cons] at hc
      let i : Fin (n + 1) := ⟨a - 1, by omega⟩
      let tail : Composition (n - i) := {
        blocks := l
        blocks_pos := fun hj => c.blocks_pos (by rw [h]; exact List.mem_cons_of_mem _ hj)
        blocks_sum := by dsimp [i]; omega }
      refine ⟨⟨i, tail⟩, Composition.ext ?_⟩
      change ((a - 1 + 1) :: l) = c.blocks
      rw [show a - 1 + 1 = a by omega, h]⟩

/-- Sum the product of part weights over all compositions of n. -/
noncomputable def weightedCompositionSum {R : Type*} [CommSemiring R]
    (weight : ℕ → R) (n : ℕ) : R :=
  ∑ c : Composition n, (c.blocks.map weight).prod

theorem weightedCompositionSum_zero {R : Type*} [CommSemiring R] (weight : ℕ → R) :
    weightedCompositionSum weight 0 = 1 := by
  let empty : Composition 0 := ⟨[], by simp, by simp⟩
  unfold weightedCompositionSum
  rw [Fintype.sum_eq_single empty]
  · rfl
  · intro c hc
    have hEmpty : c.blocks = [] := by
      cases h : c.blocks with
      | nil => rfl
      | cons a l =>
        have ha := c.blocks_pos (show a ∈ c.blocks by rw [h]; simp)
        have hs := c.blocks_sum
        rw [h, List.sum_cons] at hs
        omega
    exact (hc (Composition.ext hEmpty)).elim

/-- Weighting the first part leaves an unrestricted weighted composition
of the remaining length. -/
theorem weightedCompositionSum_succ {R : Type*} [CommSemiring R] (weight : ℕ → R) (n : ℕ) :
    weightedCompositionSum weight (n + 1) =
      ∑ k : Fin (n + 1), weight (k.val + 1) * weightedCompositionSum weight (n - k) := by
  classical
  unfold weightedCompositionSum
  calc
    _ = ∑ q : Σ k : Fin (n + 1), Composition (n - k),
      weight (q.1.val + 1) * (q.2.blocks.map weight).prod := by
      apply Fintype.sum_equiv (firstPartEquiv n).symm
      intro c
      let q := (firstPartEquiv n).symm c
      have hc : prependComposition n q = c := (firstPartEquiv n).apply_symm_apply c
      rw [← hc]
      change (weight (q.1.val + 1) * (q.2.blocks.map weight).prod) = _
      rw [show (firstPartEquiv n).symm (prependComposition n q) = q from
        (firstPartEquiv n).symm_apply_apply q]
    _ = _ := by rw [Fintype.sum_sigma]; simp_rw [Finset.mul_sum]

end KauersKoutschan
