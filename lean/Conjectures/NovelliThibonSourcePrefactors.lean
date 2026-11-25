module
public import Conjectures.NovelliThibonFillingFirstOrder

@[expose] public section
namespace NovelliThibon

def bottomCellEquiv (μ : YoungDiagram) : {c : Cell μ // row c=0} ≃ Fin (μ.rowLen 0) where
  toFun c := ⟨col c.val,by simpa only [c.property] using cell_mem_row c.val⟩
  invFun j := ⟨⟨(0,j.val),YoungDiagram.mem_iff_lt_rowLen.mpr j.isLt⟩,rfl⟩
  left_inv c := Subtype.ext (cell_eq_of_coordinates c.property.symm rfl)
  right_inv _ := rfl

theorem source_optional_card (μ : YoungDiagram) :
    (optionalVertical μ).card = μ.card - μ.rowLen 0 := by
  classical
  have hv : (optionalVertical μ).card = Fintype.card (NonbottomCell μ) := by
    rw [← Fintype.card_congr (vertical_edges_equiv μ),Fintype.card_coe]
  have hb : Fintype.card {c : Cell μ // row c=0} = μ.rowLen 0 := by
    rw [Fintype.card_congr (bottomCellEquiv μ),Fintype.card_fin]
  have hsum := Finset.card_filter_add_card_filter_not
      (s:=(Finset.univ : Finset (Cell μ))) (fun c => row c=0)
  have hpred : (Finset.univ.filter fun c : Cell μ => ¬ row c=0) =
      Finset.univ.filter (fun c : Cell μ => 0<row c) := by
    ext c
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
    omega
  rw [hpred,←Fintype.card_subtype,←Fintype.card_subtype,Finset.card_univ,Fintype.card_coe,hb,← hv] at hsum
  change μ.rowLen 0 + (optionalVertical μ).card = μ.card at hsum
  omega

def nonbottomByRow (μ : YoungDiagram) :
    NonbottomCell μ ≃ (Σ r : {i : Fin (μ.colLen 0) // i.val ≠ 0},Fin (μ.rowLen r.val.val)) where
  toFun c :=
    ⟨⟨(cellByRow μ c.val).1,by
      exact Nat.ne_of_gt c.property⟩,(cellByRow μ c.val).2⟩
  invFun rc := ⟨(cellByRow μ).symm ⟨rc.1.val,rc.2⟩,Nat.pos_of_ne_zero rc.1.property⟩
  left_inv c := Subtype.ext ((cellByRow μ).symm_apply_apply c.val)
  right_inv rc := by cases rc; rfl

theorem source_arm_sum_rows (μ : YoungDiagram) :
    (∑ c : NonbottomCell μ,arm c.val) =
      ∑ r : {i : Fin (μ.colLen 0) // i.val ≠ 0},(μ.rowLen r.val.val).choose 2 := by
  rw [← adjacentRowAttacks_eq_total_arm,adjacentRowAttacks_card]
  have h : (∑ c : NonbottomCell μ,col c.val) =
      ∑ rc : (Σ r : {i : Fin (μ.colLen 0) // i.val ≠ 0},Fin (μ.rowLen r.val.val)),rc.2.val :=
    Fintype.sum_equiv (nonbottomByRow μ) _ _ (fun _ => rfl)
  rw [h,Fintype.sum_sigma]
  simp_rw [sum_fin_col]

theorem source_arm_prefactor (μ : YoungDiagram) (hμ : 0<μ.colLen 0) :
    (∑ c : NonbottomCell μ,arm c.val) =
      (∑ r : Fin (μ.colLen 0),(μ.rowLen r.val).choose 2) - (μ.rowLen 0).choose 2 := by
  classical
  let r0 : Fin (μ.colLen 0) := ⟨0,hμ⟩
  rw [source_arm_sum_rows]
  have he : (Finset.univ : Finset (Fin (μ.colLen 0))).erase r0 =
      Finset.univ.filter fun i => i.val ≠ 0 := by
    ext i
    simp only [Finset.mem_erase,Finset.mem_filter,Finset.mem_univ,and_true,true_and]
    simpa only [r0] using not_congr (@Fin.ext_iff _ i r0)
  have ha := Finset.sum_erase_add (Finset.univ : Finset (Fin (μ.colLen 0)))
    (fun i => (μ.rowLen i.val).choose 2) (Finset.mem_univ r0)
  rw [he] at ha
  have hf : (∑ i ∈ (Finset.univ.filter fun i : Fin (μ.colLen 0) => i.val ≠ 0),
        (μ.rowLen i.val).choose 2) =
      ∑ i : {i : Fin (μ.colLen 0) // i.val ≠ 0},(μ.rowLen i.val.val).choose 2 :=
    Finset.sum_subtype _ (fun i => by simp) _
  rw [hf] at ha
  have h0 : r0.val=0 := rfl
  rw [h0] at ha
  omega

end NovelliThibon
