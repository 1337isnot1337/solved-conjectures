module
public import Conjectures.NovelliThibonDiagram

@[expose] public section
namespace NovelliThibon

theorem cell_eq_of_coordinates {μ : YoungDiagram} {a b : Cell μ}
    (hr : row a=row b) (hc : col a=col b) : a=b :=
  Subtype.ext (Prod.ext hr hc)

abbrev NonbottomCell (μ : YoungDiagram) := {c : Cell μ // 0 < row c}

def belowCell {μ : YoungDiagram} (u : NonbottomCell μ) : Cell μ :=
  ⟨(row u.val-1,col u.val),YoungDiagram.mem_iff_lt_rowLen.mpr
    ((cell_mem_row u.val).trans_le (μ.rowLen_anti _ _ (Nat.sub_le _ _)))⟩

theorem belowCell_row {μ : YoungDiagram} (u : NonbottomCell μ) :
    row (belowCell u)+1=row u.val := Nat.sub_add_cancel u.property

theorem belowCell_col {μ : YoungDiagram} (u : NonbottomCell μ) :
    col (belowCell u)=col u.val := rfl

/-- Every optional vertical edge is precisely one nonbottom upper cell
together with its unique next lower cell. -/
def vertical_edges_equiv (μ : YoungDiagram) :
    ↥(optionalVertical μ) ≃ NonbottomCell μ where
  toFun e := ⟨e.val.1,by have hh := (mem_optionalVertical.mp e.property).1; omega⟩
  invFun u := ⟨(u.val,belowCell u),mem_optionalVertical.mpr
    ⟨(belowCell_row u).symm,(belowCell_col u).symm⟩⟩
  left_inv e := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · apply cell_eq_of_coordinates
      · have h₁ := (mem_optionalVertical.mp e.property).1
        change row e.val.1-1=row e.val.2
        omega
      · exact (mem_optionalVertical.mp e.property).2
  right_inv _ := rfl

/-- Level j of the positive leg labels has exactly one cell over each
column in row j, with rows counted from the bottom starting at zero. -/
def legLabel_equiv_row (μ : YoungDiagram) {j : ℕ} (hj : 0<j) :
    {c : NonbottomCell μ // legLabel c.val=j} ≃ Fin (μ.rowLen j) where
  toFun c := ⟨col c.val.val,by
    apply YoungDiagram.mem_iff_lt_rowLen.mp
    apply YoungDiagram.mem_iff_lt_colLen.mpr
    have h := cell_mem_col c.val.val
    have hpos := c.val.property
    have hleg := c.property
    unfold legLabel at hleg
    omega⟩
  invFun v := by
    have hc : j < μ.colLen v.val :=
      YoungDiagram.mem_iff_lt_colLen.mp (YoungDiagram.mem_iff_lt_rowLen.mpr v.isLt)
    let u : Cell μ := ⟨(μ.colLen v.val-j,v.val),
      YoungDiagram.mem_iff_lt_colLen.mpr (by omega)⟩
    refine ⟨⟨u,?_⟩,?_⟩
    · change 0 < μ.colLen v.val-j
      omega
    · change μ.colLen v.val-(μ.colLen v.val-j)=j
      omega
  left_inv c := by
    apply Subtype.ext
    apply Subtype.ext
    apply cell_eq_of_coordinates
    · change μ.colLen (col c.val.val)-j=row c.val.val
      have h := cell_mem_col c.val.val
      have hleg := c.property
      unfold legLabel at hleg
      omega
    · rfl
  right_inv _ := rfl

theorem legLabel_card (μ : YoungDiagram) {j : ℕ} (hj : 0<j) :
    Fintype.card {c : NonbottomCell μ // legLabel c.val=j} = μ.rowLen j := by
  rw [Fintype.card_congr (legLabel_equiv_row μ hj),Fintype.card_fin]

end NovelliThibon
