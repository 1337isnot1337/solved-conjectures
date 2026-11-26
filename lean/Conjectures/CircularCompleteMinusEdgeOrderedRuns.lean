import Conjectures.CircularCompleteMinusEdgeActualRuns
import Conjectures.CircularCompleteMinusEdgeVertexColors
import Conjectures.CircularCompleteMinusEdgeRunArithmetic

/-! Relate actual run starts to the gaps of a strict enumeration.
The proof applies to each literal incident-position set, not to
arbitrary guessed run counts. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

variable {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

theorem LinearEdgeOrder.mem_runStartsAt_iff (L : LinearEdgeOrder C)
    (x : V) (i : Fin (Fintype.card G.edgeSet)) :
    x∈L.runStartsAt i ↔ x∈L.verticesAt i ∧
      ∀ j : Fin (Fintype.card G.edgeSet), j.val+1=i.val → x∉L.verticesAt j := by
  unfold LinearEdgeOrder.runStartsAt
  split_ifs with hi
  · exact ⟨fun h => ⟨h,fun j e => (show False by omega).elim⟩,And.left⟩
  · rw [Finset.mem_sdiff]
    constructor
    · rintro ⟨h,hno⟩
      refine ⟨h,fun j e => ?_⟩
      have he : j=⟨i.val-1,(Nat.sub_le _ _).trans_lt i.isLt⟩ := Fin.ext (by change j.val=i.val-1; omega)
      rwa [he]
    · rintro ⟨h,hno⟩
      refine ⟨h,?_⟩
      exact hno ⟨i.val-1,(Nat.sub_le _ _).trans_lt i.isLt⟩ (by change i.val-1+1=i.val; omega)

private theorem le_last_of_enumerated_position {m K : ℕ} {p : Fin (m+1)→Fin K}
    (hp : StrictMono p) (i : Fin m) {j : Fin (m+1)} (h : p j<p i.succ) :
    p j≤p i.castSucc := by
  have hj : j < i.succ := hp.lt_iff_lt.mp h
  exact hp.monotone (show j ≤ i.castSucc from by
    change j.val ≤ i.val
    change j.val < i.val+1 at hj
    omega)

private theorem first_is_runStart (L : LinearEdgeOrder C) (x : V)
    {m : ℕ} (p : Fin (m+1)→Fin (Fintype.card G.edgeSet)) (hp : StrictMono p)
    (hMem : ∀ i,p i∈L.incidentPositions x)
    (hAll : ∀ j∈L.incidentPositions x,∃ i,p i=j) :
    x∈L.runStartsAt (p 0) := by
  apply (L.mem_runStartsAt_iff x _).mpr
  refine ⟨(L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp (hMem _)),?_⟩
  intro j hj hJ
  obtain ⟨i,he⟩ := hAll j ((L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hJ))
  have hle := hp.monotone (Fin.zero_le i)
  rw [he] at hle
  change (p 0).val≤j.val at hle
  omega

private theorem successor_is_runStart_iff (L : LinearEdgeOrder C) (x : V)
    {m : ℕ} (p : Fin (m+1)→Fin (Fintype.card G.edgeSet)) (hp : StrictMono p)
    (hMem : ∀ i,p i∈L.incidentPositions x)
    (hAll : ∀ j∈L.incidentPositions x,∃ i,p i=j) (i : Fin m) :
    x∈L.runStartsAt (p i.succ) ↔ runStep (fun j => (p j).val) i≠1 := by
  have hlt : (p i.castSucc).val<(p i.succ).val := hp (show i.castSucc < i.succ from Nat.lt_succ_self _)
  have hPrev : x∈L.verticesAt (p i.castSucc) :=
    (L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp (hMem _))
  rw [L.mem_runStartsAt_iff]
  constructor
  · rintro ⟨_,hN⟩ he
    change (p i.succ).val-(p i.castSucc).val=1 at he
    exact hN (p i.castSucc) (by omega) hPrev
  · intro hDiff
    refine ⟨(L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp (hMem _)),?_⟩
    intro j hj hJ
    obtain ⟨k,hk⟩ := hAll j ((L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hJ))
    have hlt' : p k<p i.succ := by rw [hk]; change j.val<(p i.succ).val; omega
    have hle := le_last_of_enumerated_position hp i hlt'
    rw [hk] at hle
    change j.val≤(p i.castSucc).val at hle
    apply hDiff
    change (p i.succ).val-(p i.castSucc).val=1
    omega

/-- The literal run count is one plus the number of gaps whose
quotient by the color period is positive. -/
theorem LinearEdgeOrder.runCount_eq_one_add_jumpCount (L : LinearEdgeOrder C) (x : V)
    {m : ℕ} (hn : 2≤n) (p : Fin (m+1)→Fin (Fintype.card G.edgeSet)) (hp : StrictMono p)
    (hMem : ∀ i,p i∈L.incidentPositions x)
    (hAll : ∀ j∈L.incidentPositions x,∃ i,p i=j)
    (hMod : ∀ i : Fin m,runStep (fun j => (p j).val) i%n=1) :
    L.runCount x=jumpCount n (fun j => (p j).val)+1 := by
  classical
  let S : Finset (Fin (m+1)) := Finset.univ.filter fun j => x∈L.runStartsAt (p j)
  have hS : S.image p=Finset.univ.filter (fun j => x∈L.runStartsAt j) := by
    ext i
    constructor
    · intro h
      obtain ⟨j,hj,rfl⟩ := Finset.mem_image.mp h
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,(Finset.mem_filter.mp hj).2⟩
    · intro hi
      have h := (Finset.mem_filter.mp hi).2
      have hV := ((L.mem_runStartsAt_iff x i).mp h).1
      obtain ⟨j,rfl⟩ := hAll i ((L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hV))
      exact Finset.mem_image.mpr ⟨j,Finset.mem_filter.mpr ⟨Finset.mem_univ _,h⟩,rfl⟩
  have hEq (i : Fin m) :
      runStep (fun j => (p j).val) i≠1 ↔ 0<stepQuotient n (fun j => (p j).val) i := by
    have h := Nat.mod_add_div (runStep (fun j => (p j).val) i) n
    rw [hMod i] at h
    change 1+n*stepQuotient n (fun j => (p j).val) i=runStep (fun j => (p j).val) i at h
    rw [← h]
    constructor
    · intro hh
      by_contra! he
      exact hh (by simp [Nat.eq_zero_of_le_zero he])
    · intro hh
      have hpos := Nat.mul_pos (by omega : 0<n) hh
      omega
  unfold LinearEdgeOrder.runCount
  rw [← hS, Finset.card_image_of_injective _ hp.injective]
  unfold S jumpCount
  rw [Finset.card_filter,Finset.card_filter,Fin.sum_univ_succ]
  simp only [first_is_runStart L x p hp hMem hAll, ite_true]
  have hSummands : (∑ i : Fin m,if x∈L.runStartsAt (p i.succ) then (1:ℕ) else 0) =
      ∑ i : Fin m,if 0<stepQuotient n (fun j => (p j).val) i then (1:ℕ) else 0 := by
    apply Finset.sum_congr rfl
    intro i _
    simp only [successor_is_runStart_iff L x p hp hMem hAll i,hEq i]
  rw [hSummands, Nat.add_comm]

end CircularCompleteMinusEdge
