import Conjectures.CircularCompleteMinusEdgeSpecialColumnForward
import Conjectures.CircularCompleteMinusEdgeReverseOrder
import Conjectures.CircularCompleteMinusEdgeReverseRuns

/-! The backward table step is the checked forward argument in
the actual reflected edge order. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

theorem LinearEdgeOrder.special_position_backward_period (L : LinearEdgeOrder C) (hn : 2≤n)
    {u v : V} {period m : ℕ} (hPeriod : 2≤period)
    (hNormal : ∀ x : V,x≠u → x≠v →
      ∃ p : Fin (m+1)→Fin (Fintype.card G.edgeSet),
        StrictMono p ∧ (∀ k,x∈L.verticesAt (p k)) ∧
        (∀ j,x∈L.verticesAt j → ∃ k,p k=j) ∧
        Fintype.card G.edgeSet ≤ (p (Fin.last m)).val+period ∧
        ∀ k,runStep (fun j => (p j).val) k=1 ∨ runStep (fun j => (p j).val) k=period)
    (hu : ∀ i j : Fin (Fintype.card G.edgeSet),j.val=i.val+1 →
      u∈L.verticesAt i → u∉L.verticesAt j)
    (hv : ∀ i j : Fin (Fintype.card G.edgeSet),j.val=i.val+1 →
      v∈L.verticesAt i → v∉L.verticesAt j)
    {i j : Fin (Fintype.card G.edgeSet)} (hij : i.val=j.val+period)
    (hI : u∈L.verticesAt i ∨ v∈L.verticesAt i) :
    u∈L.verticesAt j ∨ v∈L.verticesAt j := by
  let N := Fintype.card G.edgeSet
  let L' := L.reverse hn
  have hRev (x : V) (i : Fin N) : x∈L'.verticesAt i ↔ x∈L.verticesAt i.rev := by
    simp only [LinearEdgeOrder.mem_verticesAt,L',LinearEdgeOrder.reverse_position_symm]
  have hNorm (x : V) (hx : x≠u) (hy : x≠v) :
      ∃ p : Fin (m+1)→Fin N, StrictMono p ∧ (∀ k,x∈L'.verticesAt (p k)) ∧
        (∀ j,x∈L'.verticesAt j → ∃ k,p k=j) ∧
        (p 0).val<period ∧
        ∀ k,runStep (fun j => (p j).val) k=1 ∨ runStep (fun j => (p j).val) k=period := by
    obtain ⟨p,hp,hM,hA,hL,hG⟩ := hNormal x hx hy
    refine ⟨reversePositions p,reversePositions_strictMono hp,?_,?_,?_,?_⟩
    · intro k
      apply (hRev _ _).mpr
      simpa only [reversePositions,Fin.rev_rev] using hM k.rev
    · intro j hj
      obtain ⟨k,hk⟩ := hA j.rev ((hRev _ _).mp hj)
      exact ⟨k.rev,by simp only [reversePositions,Fin.rev_rev,hk]⟩
    · rw [reversePositions_first]
      have he := (p (Fin.last m)).isLt
      change N-((p (Fin.last m)).val+1)<period
      change N≤(p (Fin.last m)).val+period at hL
      omega
    · intro k
      rw [reversePositions_gap p hp]
      exact hG k.rev
  have hNo (x : V)
      (h : ∀ a b : Fin N,b.val=a.val+1 → x∈L.verticesAt a → x∉L.verticesAt b)
      (a b : Fin N) (hab : b.val=a.val+1) (ha : x∈L'.verticesAt a) :
      x∉L'.verticesAt b := by
    intro hb
    have hh : a.rev.val=b.rev.val+1 := by
      change N-(a.val+1)=N-(b.val+1)+1
      have ua := a.isLt
      have ub := b.isLt
      omega
    exact h b.rev a.rev hh ((hRev _ _).mp hb) ((hRev _ _).mp ha)
  have hStep : j.rev.val=i.rev.val+period := by
    change N-(j.val+1)=N-(i.val+1)+period
    have hi := i.isLt
    have hj := j.isLt
    change i.val<N at hi
    change j.val<N at hj
    omega
  have hi' : u∈L'.verticesAt i.rev ∨ v∈L'.verticesAt i.rev := by
    simpa only [hRev,Fin.rev_rev] using hI
  have hj' := L'.special_position_forward_period (m:=m) hPeriod hNorm (hNo u hu) (hNo v hv) hStep hi'
  simpa only [hRev,Fin.rev_rev] using hj'

end CircularCompleteMinusEdge
