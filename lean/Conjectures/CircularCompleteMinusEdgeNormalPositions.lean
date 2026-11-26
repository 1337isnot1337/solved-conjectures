import Conjectures.CircularCompleteMinusEdgeVertexColors
import Conjectures.CircularCompleteMinusEdgeRunArithmetic

/-! Step 4(1): a genuine normal vertex's edge positions, in
chronological order, advance by residues 1 modulo the color count. -/

namespace CircularCompleteMinusEdge

open scoped Fin.NatCast

private def offsetHue {n m : ℕ} (hn : n=m+2) (i : Fin (m+1)) : Fin n :=
  ⟨i.val+1,by have := i.isLt; omega⟩

private theorem offsetHue_ne_zero {n m : ℕ} [NeZero n] (hn : n=m+2) (i : Fin (m+1)) :
    offsetHue hn i≠0 := by
  intro h
  have h₀ := congrArg Fin.val h
  change i.val+1=0 at h₀
  omega

private theorem offsetHue_surj_nonzero {n m : ℕ} [NeZero n] (hn : n=m+2)
    (b : Fin n) (hb : b≠0) :
    ∃ i : Fin (m+1),offsetHue hn i=b := by
  have hB : 0<b.val := by
    by_contra! h
    have he : b.val=0 := by omega
    exact hb (Fin.ext he)
  refine ⟨⟨b.val-1,by have := b.isLt; omega⟩,?_⟩
  apply Fin.ext
  change b.val-1+1=b.val
  omega

private theorem offsetHue_succ {n m : ℕ} [NeZero n] (hn : n=m+2) (i : Fin m) :
    offsetHue hn i.succ=offsetHue hn i.castSucc+1 := by
  apply Fin.ext
  rw [Fin.val_add,Fin.val_one',Nat.mod_eq_of_lt (by omega : 1<n)]
  change i.val+1+1=(i.val+1+1)%n
  rw [Nat.mod_eq_of_lt (by have := i.isLt; omega)]

private theorem positive_gap_mod_of_successor_hue {n : ℕ} [NeZero n] (hn : 2≤n)
    {x y : ℕ} (hxy : x<y)
    (h : ((y+1:ℕ):Fin n)=((x+1:ℕ):Fin n)+1) : (y-x)%n=1 := by
  have h' : ((y:ℕ):Fin n)+1=(((x+1:ℕ):Fin n))+1 := by simpa only [Nat.cast_add,Nat.cast_one] using h
  have e := add_right_cancel h'
  have hcast : ((y-x:ℕ):Fin n)+((x:ℕ):Fin n)=1+((x:ℕ):Fin n) := by
    rw [← Nat.cast_add,Nat.sub_add_cancel hxy.le,e,Nat.cast_add,Nat.cast_one,add_comm]
  have hg : ((y-x:ℕ):Fin n)=1 := add_right_cancel hcast
  have hv := congrArg Fin.val hg
  simpa only [Fin.val_natCast, Fin.val_one', Nat.mod_eq_of_lt (by omega : 1<n)] using hv

variable {V : Type*} [Fintype V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

/-- Enumerate every incident edge at an actual degree-(n−1)
vertex in increasing position, with each successive gap equal
to 1 modulo n. The missing hue sets the initial cyclic offset. -/
theorem LinearEdgeOrder.normal_positions_gap_mod [DecidableRel G.Adj]
    (L : LinearEdgeOrder C) (x : V) {m : ℕ} (hn : n=m+2)
    (hx : G.degree x=n-1) :
    ∃ p : Fin (m+1)→Fin (Fintype.card G.edgeSet),
      StrictMono p ∧
      (∀ i,p i∈L.incidentPositions x) ∧
      (∀ i∈L.incidentPositions x,∃ j,p j=i) ∧
      ∀ i : Fin m,runStep (fun j => (p j).val) i % n=1 := by
  classical
  obtain ⟨a,ha,hu⟩ := L.exists_unique_missing_hue x hx
  let H (i : Fin (m+1)) := a+offsetHue hn i
  have hH (i : Fin (m+1)) : H i∈L.incidentHues x := by
    by_contra h
    have hh := hu (H i) h
    have ee : offsetHue hn i=0 := add_left_cancel (by simpa [H] using hh : a+offsetHue hn i=a+0)
    exact offsetHue_ne_zero hn i ee
  have hExit (i : Fin (m+1)) := (L.exists_unique_incident_position_of_hue x (hH i)).exists
  choose p hP using hExit
  have hHue (i : Fin m) : C.color (L.position.symm (p i.succ)) =
      C.color (L.position.symm (p i.castSucc))+1 := by
    rw [(hP i.succ).2,(hP i.castSucc).2]
    unfold H
    rw [offsetHue_succ hn,add_assoc]
  have hn2 : 2≤n := by omega
  have hs (i : Fin m) : p i.castSucc<p i.succ := by
    let e := L.position.symm (p i.castSucc)
    let f := L.position.symm (p i.succ)
    have hne : e≠f := by
      intro h
      have hC : C.color e=C.color e+1 := by simpa only [e,f,← h] using hHue i
      have hc : (0:Fin n)=1 := add_left_cancel (by simpa only [add_zero] using hC)
      have hv := congrArg Fin.val hc
      simp only [Fin.val_zero,Fin.val_one',Nat.mod_eq_of_lt (by omega : 1<n)] at hv
      omega
    have hi : Incident e f :=
      ⟨x,(L.mem_incidentPositions _ _).mp (hP i.castSucc).1,
        (L.mem_incidentPositions _ _).mp (hP i.succ).1⟩
    have ht := L.arc_increases e f ((C.arc_iff_add hn2 e f).mpr ⟨hne,hi,hHue i⟩)
    change (p i.castSucc).val < (p i.succ).val
    simpa only [e,f,Equiv.apply_symm_apply] using ht
  refine ⟨p,Fin.strictMono_iff_lt_succ.mpr hs,fun j => (hP j).1,?_,?_⟩
  · intro i hi
    let b := C.color (L.position.symm i)
    have hb : b∈L.incidentHues x := Finset.mem_image.mpr ⟨i,hi,rfl⟩
    have hne : b-a≠0 := fun h => ha ((sub_eq_zero.mp h) ▸ hb)
    obtain ⟨j,hj⟩ := offsetHue_surj_nonzero hn (b-a) hne
    have he : H j=b := by rw [show H j=a+offsetHue hn j from rfl,hj,add_comm,sub_add_cancel]
    exact ⟨j,L.hue_injOn_incidentPositions _ (hP j).1 hi ((hP j).2.trans he)⟩
  · intro j
    apply positive_gap_mod_of_successor_hue hn2 (hs j)
    have hh := hHue j
    rw [L.color_position,L.color_position,Equiv.apply_symm_apply,Equiv.apply_symm_apply] at hh
    exact hh

end CircularCompleteMinusEdge
