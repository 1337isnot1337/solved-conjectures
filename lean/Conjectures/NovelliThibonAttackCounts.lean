module
public import Conjectures.NovelliThibonLegCounts
public import Mathlib.Data.Fintype.Sigma
public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

@[expose] public section
namespace NovelliThibon

def sameRowLeft {μ : YoungDiagram} (c : Cell μ) (j : Fin (col c)) : Cell μ :=
  ⟨(row c,j.val),YoungDiagram.mem_iff_lt_rowLen.mpr (j.isLt.trans (cell_mem_row c))⟩

def lowerLeft {μ : YoungDiagram} (c : NonbottomCell μ) (j : Fin (col c.val)) : Cell μ :=
  ⟨(row c.val-1,j.val),YoungDiagram.mem_iff_lt_rowLen.mpr
    (j.isLt.trans ((cell_mem_row c.val).trans_le
      (μ.rowLen_anti _ _ (Nat.sub_le _ _))))⟩

def sameRowAttacks_equiv (μ : YoungDiagram) :
    ↥(sameRowAttacks μ) ≃ Σ c : Cell μ, Fin (col c) where
  toFun e := ⟨e.val.2,⟨col e.val.1,(mem_sameRowAttacks.mp e.property).2⟩⟩
  invFun p := ⟨(sameRowLeft p.1 p.2,p.1),mem_sameRowAttacks.mpr ⟨rfl,p.2.isLt⟩⟩
  left_inv e := by
    apply Subtype.ext
    apply Prod.ext
    · apply cell_eq_of_coordinates
      · exact (mem_sameRowAttacks.mp e.property).1.symm
      · rfl
    · rfl
  right_inv _ := rfl

def adjacentRowAttacks_equiv (μ : YoungDiagram) :
    ↥(adjacentRowAttacks μ) ≃ Σ c : NonbottomCell μ, Fin (col c.val) where
  toFun e := ⟨⟨e.val.1,by have hp := (mem_adjacentRowAttacks.mp e.property).1; omega⟩,
    ⟨col e.val.2,(mem_adjacentRowAttacks.mp e.property).2⟩⟩
  invFun p := ⟨(p.1.val,lowerLeft p.1 p.2),mem_adjacentRowAttacks.mpr
    ⟨(Nat.sub_add_cancel p.1.property).symm,p.2.isLt⟩⟩
  left_inv e := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · apply cell_eq_of_coordinates
      · change row e.val.1-1=row e.val.2
        have hp := (mem_adjacentRowAttacks.mp e.property).1
        omega
      · rfl
  right_inv _ := rfl

theorem sameRowAttacks_card (μ : YoungDiagram) :
    (sameRowAttacks μ).card = ∑ c : Cell μ,col c := by
  rw [← Fintype.card_coe, Fintype.card_congr (sameRowAttacks_equiv μ),Fintype.card_sigma]
  simp only [Fintype.card_fin]

theorem adjacentRowAttacks_card (μ : YoungDiagram) :
    (adjacentRowAttacks μ).card = ∑ c : NonbottomCell μ,col c.val := by
  rw [← Fintype.card_coe,Fintype.card_congr (adjacentRowAttacks_equiv μ),Fintype.card_sigma]
  simp only [Fintype.card_fin]

def rowReflect {μ : YoungDiagram} (c : NonbottomCell μ) : NonbottomCell μ :=
  ⟨⟨(row c.val,arm c.val),YoungDiagram.mem_iff_lt_rowLen.mpr (by
      have h := cell_mem_row c.val
      unfold arm
      omega)⟩,c.property⟩

theorem rowReflect_involutive (μ : YoungDiagram) : Function.Involutive (rowReflect (μ:=μ)) := by
  intro c
  apply Subtype.ext
  apply cell_eq_of_coordinates
  · rfl
  · change μ.rowLen (row c.val)-1-(μ.rowLen (row c.val)-1-col c.val)=col c.val
    have h := cell_mem_row c.val
    omega

/-- The total arm correction equals the literal cross-row attack count. -/
theorem adjacentRowAttacks_eq_total_arm (μ : YoungDiagram) :
    (adjacentRowAttacks μ).card = ∑ c : NonbottomCell μ,arm c.val := by
  rw [adjacentRowAttacks_card]
  let e : NonbottomCell μ ≃ NonbottomCell μ :=
    (rowReflect_involutive μ).toPerm _
  exact (e.sum_comp fun c => col c.val).symm

end NovelliThibon
