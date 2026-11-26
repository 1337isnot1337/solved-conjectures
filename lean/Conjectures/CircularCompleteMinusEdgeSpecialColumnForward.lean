import Conjectures.CircularCompleteMinusEdgeOrderedRuns

/-! The forward closure of special positions under one table
period. The hypotheses are the actual run properties supplied
by Step 4; no tiling or column equality is assumed. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

theorem LinearEdgeOrder.special_position_forward_period (L : LinearEdgeOrder C)
    {u v : V} {period m : ℕ} (hPeriod : 2≤period)
    (hNormal : ∀ x : V,x≠u → x≠v →
      ∃ p : Fin (m+1)→Fin (Fintype.card G.edgeSet),
        StrictMono p ∧ (∀ k,x∈L.verticesAt (p k)) ∧
        (∀ j,x∈L.verticesAt j → ∃ k,p k=j) ∧
        (p 0).val<period ∧
        ∀ k,runStep (fun j => (p j).val) k=1 ∨ runStep (fun j => (p j).val) k=period)
    (hu : ∀ i j : Fin (Fintype.card G.edgeSet),j.val=i.val+1 →
      u∈L.verticesAt i → u∉L.verticesAt j)
    (hv : ∀ i j : Fin (Fintype.card G.edgeSet),j.val=i.val+1 →
      v∈L.verticesAt i → v∉L.verticesAt j)
    {i j : Fin (Fintype.card G.edgeSet)} (hij : j.val=i.val+period)
    (hI : u∈L.verticesAt i ∨ v∈L.verticesAt i) :
    u∈L.verticesAt j ∨ v∈L.verticesAt j := by
  by_contra! hJ
  have hj : j.val≠0 := by omega
  have hOn : (L.runStartsAt j).card=1 := by
    rw [L.card_runStartsAt]
    simp [hj]
  obtain ⟨z,hz⟩ := Finset.card_pos.mp (by omega : 0<(L.runStartsAt j).card)
  have hZ := (L.mem_runStartsAt_iff z j).mp hz
  have hnu : z≠u := fun e => hJ.1 (e ▸ hZ.1)
  have hnv : z≠v := fun e => hJ.2 (e ▸ hZ.1)
  obtain ⟨p,hp,hMem,hAll,hInit,hGaps⟩ := hNormal z hnu hnv
  obtain ⟨k,hk⟩ := hAll j hZ.1
  have hK : k≠0 := by
    intro he
    subst k
    rw [hk] at hInit
    omega
  obtain ⟨l,hl⟩ : ∃ l : Fin m,l.succ=k := by
    refine Fin.cases ?_ (fun a => ?_) k hK
    · intro h
      exact (h rfl).elim
    · intro _
      exact ⟨a,rfl⟩
  have hPj : p l.succ=j := hl ▸ hk
  have hLt : (p l.castSucc).val < (p l.succ).val :=
    hp (show l.castSucc < l.succ from Nat.lt_succ_self _)
  have hG : runStep (fun q => (p q).val) l = period := by
    rcases hGaps l with h|h
    · exfalso
      exact hZ.2 (p l.castSucc) (by change (p l.succ).val-(p l.castSucc).val=1 at h; rw [← hPj]; omega) (hMem _)
    · exact h
  have hPi : p l.castSucc=i := by
    apply Fin.ext
    change (p l.succ).val-(p l.castSucc).val=period at hG
    have h := congrArg Fin.val hPj
    omega
  have hzI : z∈L.verticesAt i := hPi ▸ hMem _
  let next : Fin (Fintype.card G.edgeSet) := ⟨i.val+1,by have := j.isLt; omega⟩
  have hn : next.val=i.val+1 := rfl
  have hzN : z∉L.verticesAt next := by
    intro h
    obtain ⟨q,hq⟩ := hAll next h
    have h₁ : p l.castSucc < p q := by rw [hPi,hq]; exact Nat.lt_succ_self _
    have h₂ : p q < p l.succ := by
      rw [hq,hPj]
      change next.val<j.val
      omega
    have h₁' := hp.lt_iff_lt.mp h₁
    have h₂' := hp.lt_iff_lt.mp h₂
    change l.val < q.val at h₁'
    change q.val < l.val+1 at h₂'
    omega
  have hExit (s : V) (hs : z≠s) (hsI : s∈L.verticesAt i) (hsN : s∉L.verticesAt next) :
      False := by
    have hPair : ({z,s}:Finset V)⊆L.verticesAt i := by
      intro a ha
      rcases Finset.mem_insert.mp ha with rfl|ha
      · exact hzI
      · rw [Finset.mem_singleton.mp ha]
        exact hsI
    have he : ({z,s}:Finset V)=L.verticesAt i := by
      apply Finset.eq_of_subset_of_card_le hPair
      simp [hs]
    have hiN := L.consecutive_card_inter hn
    obtain ⟨a,ha⟩ := Finset.card_pos.mp (by omega : 0<(L.verticesAt next∩L.verticesAt i).card)
    have hA := Finset.mem_inter.mp ha
    rw [← he] at hA
    rcases (Finset.mem_insert.mp hA.2) with h|h
    · exact hzN (h ▸ hA.1)
    · exact hsN ((Finset.mem_singleton.mp h) ▸ hA.1)
  rcases hI with hi|hi
  · exact hExit u hnu hi (hu i next hn hi)
  · exact hExit v hnv hi (hv i next hn hi)

end CircularCompleteMinusEdge
