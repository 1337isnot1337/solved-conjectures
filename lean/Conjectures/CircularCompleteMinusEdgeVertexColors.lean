import Conjectures.CircularCompleteMinusEdgeOrder

/-! The actual sorted edge positions at a vertex carry exactly
its incident edges. At each normal vertex one hue is missing. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [Fintype V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

noncomputable def LinearEdgeOrder.incidentPositions (L : LinearEdgeOrder C) (x : V) :
    Finset (Fin (Fintype.card G.edgeSet)) := by
  classical
  exact Finset.univ.filter fun i => x∈(L.position.symm i).val

omit [Fintype V] in
@[simp] theorem LinearEdgeOrder.mem_incidentPositions (L : LinearEdgeOrder C) (x : V)
    (i : Fin (Fintype.card G.edgeSet)) :
    i ∈ L.incidentPositions x ↔ x∈(L.position.symm i).val := by
  classical
  simp [LinearEdgeOrder.incidentPositions]

noncomputable def LinearEdgeOrder.incidentPositionsEquiv (L : LinearEdgeOrder C) (x : V) :
    ↥(L.incidentPositions x) ≃ ↥(G.incidenceSet x) where
  toFun i := ⟨(L.position.symm i.val).val,(L.position.symm i.val).property,
    (L.mem_incidentPositions x i.val).mp i.property⟩
  invFun e := ⟨L.position ⟨e.val,e.property.1⟩,by
    rw [L.mem_incidentPositions, L.position.symm_apply_apply]
    exact e.property.2⟩
  left_inv i := by
    apply Subtype.ext
    exact L.position.apply_symm_apply i.val
  right_inv e := by
    apply Subtype.ext
    change (L.position.symm (L.position ⟨e.val,e.property.1⟩)).val=e.val
    exact congrArg (fun q : G.edgeSet => q.val) (L.position.symm_apply_apply ⟨e.val,e.property.1⟩)

theorem LinearEdgeOrder.card_incidentPositions [DecidableRel G.Adj] (L : LinearEdgeOrder C)
    (x : V) : (L.incidentPositions x).card=G.degree x := by
  classical
  rw [← Fintype.card_coe, Fintype.card_congr (L.incidentPositionsEquiv x),
    G.card_incidenceSet_eq_degree]

noncomputable def LinearEdgeOrder.incidentHues (L : LinearEdgeOrder C) (x : V) :
    Finset (Fin n) :=
  (L.incidentPositions x).image (fun i => C.color (L.position.symm i))

omit [Fintype V] in
theorem LinearEdgeOrder.hue_injOn_incidentPositions (L : LinearEdgeOrder C) (x : V) :
    Set.InjOn (fun i => C.color (L.position.symm i)) (L.incidentPositions x) := by
  intro i hi j hj h
  by_contra hne
  have hn : L.position.symm i≠L.position.symm j := fun e => hne (L.position.symm.injective e)
  exact C.proper _ _ hn ⟨x,(L.mem_incidentPositions x i).mp hi,
    (L.mem_incidentPositions x j).mp hj⟩ h

theorem LinearEdgeOrder.card_incidentHues [DecidableRel G.Adj] (L : LinearEdgeOrder C)
    (x : V) : (L.incidentHues x).card=G.degree x := by
  unfold LinearEdgeOrder.incidentHues
  exact (Finset.card_image_of_injOn (L.hue_injOn_incidentPositions x)).trans
    (L.card_incidentPositions x)

theorem LinearEdgeOrder.exists_unique_missing_hue [DecidableRel G.Adj]
    (L : LinearEdgeOrder C) (x : V) (hx : G.degree x=n-1) :
    ∃! a : Fin n,a∉L.incidentHues x := by
  classical
  let M := Finset.univ \ L.incidentHues x
  have hC : M.card=1 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ (L.incidentHues x)),
      Finset.card_univ,Fintype.card_fin,L.card_incidentHues x,hx]
    have hn : 0<n := NeZero.pos n
    omega
  obtain ⟨a,ha⟩ := Finset.card_eq_one.mp hC
  have h := Finset.eq_singleton_iff_unique_mem.mp ha
  exact ⟨a,(Finset.mem_sdiff.mp h.1).2,fun b hb => h.2 b
    (Finset.mem_sdiff.mpr ⟨Finset.mem_univ _,hb⟩)⟩

omit [Fintype V] in
theorem LinearEdgeOrder.exists_unique_incident_position_of_hue (L : LinearEdgeOrder C)
    (x : V) {a : Fin n} (ha : a∈L.incidentHues x) :
    ∃! i, i∈L.incidentPositions x ∧ C.color (L.position.symm i)=a := by
  obtain ⟨i,hi,he⟩ := Finset.mem_image.mp ha
  exact ⟨i,⟨hi,he⟩,fun j hj => L.hue_injOn_incidentPositions x hj.1 hi (hj.2.trans he.symm)⟩

end CircularCompleteMinusEdge
