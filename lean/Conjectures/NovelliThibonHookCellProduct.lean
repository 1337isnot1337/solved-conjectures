module
public import Conjectures.NovelliThibonIncomingCells

@[expose] public section
namespace NovelliThibon

open Classical

variable {μ : YoungDiagram} {K : Type*} [Field K]

theorem sum_edges_by_head {R : Type*} [AddCommMonoid R]
    (E : Finset (Cell μ × Cell μ)) (S : Finset (Cell μ))
    (w : Cell μ × Cell μ → R) :
    (∑ e ∈ E with e.2∈S,w e) = ∑ b ∈ S,∑ e ∈ edgesInto E b,w e :=
  (Finset.sum_fiberwise_eq_sum_filter E S Prod.snd w).symm

theorem prod_edges_by_head {R : Type*} [CommMonoid R]
    (E : Finset (Cell μ × Cell μ)) (S : Finset (Cell μ))
    (w : Cell μ × Cell μ → R) :
    (∏ e ∈ E with e.2∈S,w e) = ∏ b ∈ S,∏ e ∈ edgesInto E b,w e :=
  (Finset.prod_fiberwise_eq_prod_filter E S Prod.snd w).symm

noncomputable def hookCellT (t : ℕ → K) (b : Cell μ) : K :=
  ∏ e ∈ edgesInto (optionalVertical μ) b,t (legLabel e.1)

/-- Integral exponent when descents are exactly the edges with marked heads. -/
def markedCellExponent (μ : YoungDiagram) (S : Finset (Cell μ)) : ℤ :=
  ((attackingEdges μ).filter fun e => e.2∈S).card -
    ∑ e ∈ optionalVertical μ with e.2∈S,(arm e.1:ℤ)

theorem markedCellExponent_eq_columns (μ : YoungDiagram) (S : Finset (Cell μ)) :
    markedCellExponent μ S = (∑ b ∈ S,(col b:ℤ)) := by
  unfold markedCellExponent
  have ha :
      (((attackingEdges μ).filter fun e => e.2∈S).card:ℤ) =
        ∑ b ∈ S,((edgesInto (attackingEdges μ) b).card:ℤ) := by
    have h := Finset.sum_card_fiberwise_eq_card_filter (attackingEdges μ) S Prod.snd
    exact_mod_cast h.symm
  rw [ha,sum_edges_by_head,← Finset.sum_sub_distrib]
  exact Finset.sum_congr rfl (fun b _ => attacking_indegree_sub_vertical_arms b)

/-- This is the normalized signed sum before interpreting or simplifying
the contribution of a single cell. -/
noncomputable def markedDiagramEvaluation (μ : YoungDiagram) (q z : K) (t : ℕ → K) : K :=
  ∑ S : Finset (Cell μ),
    q^markedCellExponent μ S *
      (∏ e ∈ optionalVertical μ with e.2∈S,t (legLabel e.1)) * (-z)^S.card

theorem markedDiagramEvaluation_factor (μ : YoungDiagram) (q z : K) (t : ℕ → K) :
    markedDiagramEvaluation μ q z t = ∏ b : Cell μ,(1-z*(q^col b*hookCellT t b)) := by
  unfold markedDiagramEvaluation
  simp_rw [markedCellExponent_eq_columns,prod_edges_by_head,sub_eq_add_neg,← neg_mul,
    Finset.prod_one_add,Finset.powerset_univ,Finset.prod_mul_distrib,Finset.prod_const,
    Finset.prod_pow_eq_pow_sum,hookCellT]
  apply Finset.sum_congr rfl
  intro S _
  have he : (∑ b ∈ S,(col b:ℤ)) = ((∑ b ∈ S,col b : ℕ):ℤ) := by
    exact_mod_cast rfl
  rw [he,zpow_natCast]
  ac_rfl

def columnReflect {μ : YoungDiagram} (b : Cell μ) : Cell μ :=
  ⟨(μ.colLen (col b)-1-row b,col b),YoungDiagram.mem_iff_lt_colLen.mpr (by
    have h := cell_mem_col b
    omega)⟩

theorem columnReflect_involutive (μ : YoungDiagram) : Function.Involutive (columnReflect (μ:=μ)) := by
  intro b
  apply cell_eq_of_coordinates
  · change μ.colLen (col b)-1-(μ.colLen (col b)-1-row b)=row b
    have h := cell_mem_col b
    omega
  · rfl

theorem hookCellT_eq_reflected_row (t : ℕ → K) (b : Cell μ) :
    hookCellT t b = if row (columnReflect b)=0 then 1 else t (row (columnReflect b)) := by
  have hc := cell_mem_col b
  by_cases h : col b<μ.rowLen (row b+1)
  · have hm : (row b+1,col b) ∈ μ := YoungDiagram.mem_iff_lt_rowLen.mpr h
    have ha := YoungDiagram.mem_iff_lt_colLen.mp hm
    have hrow : row (columnReflect b) ≠ 0 := by
      change μ.colLen (col b)-1-row b ≠ 0
      omega
    have he : legLabel (cellAbove b h) = row (columnReflect b) := by
      change μ.colLen (col b)-(row b+1)=μ.colLen (col b)-1-row b
      omega
    rw [hookCellT,vertical_into_singleton b h,Finset.prod_singleton,he,ite_eq_right hrow]
  · have hm : (row b+1,col b) ∉ μ := fun hm => h (YoungDiagram.mem_iff_lt_rowLen.mp hm)
    have hu : ¬ row b+1 < μ.colLen (col b) := fun hu =>
      hm (YoungDiagram.mem_iff_lt_colLen.mpr hu)
    have hrow : row (columnReflect b) = 0 := by
      change μ.colLen (col b)-1-row b=0
      omega
    rw [hookCellT,vertical_into_empty b h,Finset.prod_empty,hrow,ite_eq_left rfl]

/-- The product runs over the literal cells with column exponent (c-1),
row label (r-1), and (t_0=1), as in the proposed hook formula. -/
theorem markedDiagramEvaluation_cell_product (μ : YoungDiagram) (q z : K) (t : ℕ → K) :
    markedDiagramEvaluation μ q z t =
      ∏ b : Cell μ,(1-z*(q^col b*(if row b=0 then 1 else t (row b)))) := by
  rw [markedDiagramEvaluation_factor]
  simp_rw [hookCellT_eq_reflected_row]
  let e : Cell μ ≃ Cell μ := (columnReflect_involutive μ).toPerm _
  exact Equiv.prod_comp e (fun b => 1-z*(q^col b*(if row b=0 then 1 else t (row b))))

end NovelliThibon
