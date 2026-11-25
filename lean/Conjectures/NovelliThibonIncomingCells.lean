module
public import Conjectures.NovelliThibonDiagramMoments
public import Conjectures.NovelliThibonSignedGraph

@[expose] public section
namespace NovelliThibon

variable {μ : YoungDiagram}

def edgesInto (E : Finset (Cell μ × Cell μ)) (b : Cell μ) : Finset (Cell μ × Cell μ) :=
  E.filter fun p => p.2=b

def sameIncomingEquiv (b : Cell μ) : ↥(edgesInto (sameRowAttacks μ) b) ≃ Fin (col b) where
  toFun e := ⟨col e.val.1,by
    have hh := Finset.mem_filter.mp e.property
    have hc := (mem_sameRowAttacks.mp hh.1).2
    rwa [hh.2] at hc⟩
  invFun j := ⟨(sameRowLeft b j,b),Finset.mem_filter.mpr ⟨mem_sameRowAttacks.mpr ⟨rfl,j.isLt⟩,rfl⟩⟩
  left_inv e := by
    have hh := Finset.mem_filter.mp e.property
    apply Subtype.ext
    apply Prod.ext
    · apply cell_eq_of_coordinates
      · change row b = row e.val.1
        exact (congrArg row hh.2).symm.trans (mem_sameRowAttacks.mp hh.1).1.symm
      · rfl
    · exact hh.2.symm
  right_inv _ := rfl

def upperRightCount (b : Cell μ) : ℕ :=
  μ.rowLen (row b+1) - (col b+1)

def upperRightCell (b : Cell μ) (i : Fin (upperRightCount b)) : Cell μ :=
  ⟨(row b+1,col b+1+i.val),YoungDiagram.mem_iff_lt_rowLen.mpr (by
    have h := i.isLt
    unfold upperRightCount at h
    omega)⟩

def crossIncomingEquiv (b : Cell μ) : ↥(edgesInto (adjacentRowAttacks μ) b) ≃ Fin (upperRightCount b) where
  toFun e := ⟨col e.val.1-(col b+1),by
    have h := Finset.mem_filter.mp e.property
    obtain ⟨hr,hc⟩ := mem_adjacentRowAttacks.mp h.1
    rw [h.2] at hr hc
    have hh := cell_mem_row e.val.1
    rw [hr] at hh
    unfold upperRightCount
    omega⟩
  invFun j := ⟨(upperRightCell b j,b),Finset.mem_filter.mpr ⟨mem_adjacentRowAttacks.mpr
    ⟨rfl,by change col b<col b+1+j.val; omega⟩,rfl⟩⟩
  left_inv e := by
    have hh := Finset.mem_filter.mp e.property
    obtain ⟨hr,hc⟩ := mem_adjacentRowAttacks.mp hh.1
    rw [hh.2] at hr hc
    apply Subtype.ext
    apply Prod.ext
    · apply cell_eq_of_coordinates
      · exact hr.symm
      · change col b+1+(col e.val.1-(col b+1))=col e.val.1
        omega
    · exact hh.2.symm
  right_inv j := by
    apply Fin.ext
    change col b+1+j.val-(col b+1)=j.val
    omega

theorem attacking_indegree_cell (b : Cell μ) :
    (edgesInto (attackingEdges μ) b).card = col b + upperRightCount b := by
  have hUnion : edgesInto (attackingEdges μ) b =
      edgesInto (sameRowAttacks μ) b ∪ edgesInto (adjacentRowAttacks μ) b := by
    unfold attackingEdges edgesInto
    exact Finset.filter_union (fun e : Cell μ × Cell μ => e.2=b) _ _
  have ha : (edgesInto (sameRowAttacks μ) b).card = col b := by
    rw [← Fintype.card_coe,Fintype.card_congr (sameIncomingEquiv b),Fintype.card_fin]
  have hb : (edgesInto (adjacentRowAttacks μ) b).card = upperRightCount b := by
    rw [← Fintype.card_coe,Fintype.card_congr (crossIncomingEquiv b),Fintype.card_fin]
  have hd : Disjoint (edgesInto (sameRowAttacks μ) b) (edgesInto (adjacentRowAttacks μ) b) :=
    (same_adjacent_disjoint μ).mono (Finset.filter_subset _ _) (Finset.filter_subset _ _)
  rw [hUnion,Finset.card_union_of_disjoint hd,ha,hb]

def cellAbove (b : Cell μ) (h : col b < μ.rowLen (row b+1)) : Cell μ :=
  ⟨(row b+1,col b),YoungDiagram.mem_iff_lt_rowLen.mpr h⟩

theorem vertical_into_singleton (b : Cell μ) (h : col b < μ.rowLen (row b+1)) :
    edgesInto (optionalVertical μ) b = {(cellAbove b h,b)} := by
  ext e
  simp only [edgesInto,Finset.mem_filter,Finset.mem_singleton,mem_optionalVertical]
  constructor
  · rintro ⟨⟨hr,hc⟩,hb⟩
    apply Prod.ext _ hb
    apply cell_eq_of_coordinates
    · rwa [hb] at hr
    · rwa [hb] at hc
  · rintro rfl
    exact ⟨⟨rfl,rfl⟩,rfl⟩

theorem vertical_into_empty (b : Cell μ) (h : ¬ col b < μ.rowLen (row b+1)) :
    edgesInto (optionalVertical μ) b = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro e he
  have hh := Finset.mem_filter.mp he
  obtain ⟨hr,hc⟩ := mem_optionalVertical.mp hh.1
  rw [hh.2] at hr hc
  exact h (by simpa only [hr,hc] using cell_mem_row e.1)

theorem upperRightCount_eq_arm (b : Cell μ) (h : col b < μ.rowLen (row b+1)) :
    upperRightCount b = arm (cellAbove b h) := by
  change μ.rowLen (row b+1)-(col b+1) = μ.rowLen (row b+1)-1-col b
  omega

/-- Every cell has incoming attack count equal to its column index
plus exactly the correction due to the optional vertical edge above it. -/
theorem attacking_indegree_sub_vertical_arms (b : Cell μ) :
    ((edgesInto (attackingEdges μ) b).card:ℤ) -
      (∑ e ∈ edgesInto (optionalVertical μ) b,(arm e.1:ℤ)) = (col b:ℤ) := by
  rw [attacking_indegree_cell]
  by_cases h : col b<μ.rowLen (row b+1)
  · rw [vertical_into_singleton b h,Finset.sum_singleton,upperRightCount_eq_arm b h]
    simp
  · rw [vertical_into_empty b h,Finset.sum_empty]
    have hn : upperRightCount b = 0 := by unfold upperRightCount; omega
    simp [hn]

end NovelliThibon
