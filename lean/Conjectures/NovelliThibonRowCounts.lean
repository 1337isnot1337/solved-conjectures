module
public import Conjectures.NovelliThibonAttackCounts
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.BigOperators.Intervals
public import Mathlib.Data.Nat.Choose.Basic
public import Mathlib.Tactic.Ring

@[expose] public section
namespace NovelliThibon

def cellByRow (μ : YoungDiagram) :
    Cell μ ≃ Σ r : Fin (μ.colLen 0), Fin (μ.rowLen r.val) where
  toFun c := ⟨⟨row c,(cell_mem_col c).trans_le
      (μ.colLen_anti 0 (col c) (Nat.zero_le _))⟩,⟨col c,cell_mem_row c⟩⟩
  invFun c := ⟨(c.1.val,c.2.val),YoungDiagram.mem_iff_lt_rowLen.mpr c.2.isLt⟩
  left_inv c := Subtype.ext (Prod.eta c.val)
  right_inv c := by cases c; rfl

theorem sum_fin_col (m : ℕ) :
    (∑ i : Fin m,i.val) = m.choose 2 := by
  rw [(Fin.sum_univ_eq_sum_range (fun q : ℕ => q) m),Finset.sum_range_id,Nat.choose_two_right]

theorem sameRowAttacks_choose (μ : YoungDiagram) :
    (sameRowAttacks μ).card = ∑ r : Fin (μ.colLen 0), (μ.rowLen r.val).choose 2 := by
  rw [sameRowAttacks_card]
  have h : (∑ c : Cell μ,col c) =
      ∑ rc : (Σ r : Fin (μ.colLen 0), Fin (μ.rowLen r.val)),rc.2.val :=
    Fintype.sum_equiv (cellByRow μ) _ _ (fun _ => rfl)
  rw [h,Fintype.sum_sigma]
  simp_rw [sum_fin_col]

theorem same_adjacent_disjoint (μ : YoungDiagram) :
    Disjoint (sameRowAttacks μ) (adjacentRowAttacks μ) := by
  rw [Finset.disjoint_left]
  intro p h₁ h₂
  have he := (mem_sameRowAttacks.mp h₁).1
  have hf := (mem_adjacentRowAttacks.mp h₂).1
  omega

/-- The full attacking graph, minus its arm correction, leaves exactly
the sum of within-row pair counts. -/
theorem q_arm_correction_count (μ : YoungDiagram) :
    ((sameRowAttacks μ ∪ adjacentRowAttacks μ).card : ℤ) -
      (∑ c : NonbottomCell μ, (arm c.val:ℤ)) =
      ∑ r : Fin (μ.colLen 0), ((μ.rowLen r.val).choose 2:ℤ) := by
  rw [Finset.card_union_of_disjoint (same_adjacent_disjoint μ),sameRowAttacks_choose,
        adjacentRowAttacks_eq_total_arm]
  simp only [Nat.cast_add,Nat.cast_sum]
  ring

end NovelliThibon
