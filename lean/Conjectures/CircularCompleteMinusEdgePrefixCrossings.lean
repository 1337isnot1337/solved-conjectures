import Conjectures.CircularCompleteMinusEdgePrefixIntervals

/-! The crossing between two successive short-count levels happens
at a unique adjacent pair and preserves the long-step coordinate. -/

namespace CircularCompleteMinusEdge

theorem crossing_adjacent_preserves_jump {m : ℕ} (p : Fin (m+1) → ℕ) (g : ℕ)
    (hg : g < edgeStepPrefix p false (Fin.last m)) :
    ∃ i : Fin m, edgeStepPrefix p false i.castSucc = g ∧
      edgeStepPrefix p false i.succ = g+1 ∧
      edgeStepPrefix p true i.castSucc = edgeStepPrefix p true i.succ ∧
      (∀ a, edgeStepPrefix p false a = g → a ≤ i.castSucc) ∧
      (∀ a, edgeStepPrefix p false a = g+1 → i.succ ≤ a) ∧
      runStep p i = 1 := by
  classical
  let s := Finset.univ.filter fun a : Fin (m+1) => edgeStepPrefix p false a = g
  obtain ⟨a,_,ha⟩ := edgeStepPrefix_attains_below p false (Fin.last m) g hg.le
  have hne : s.Nonempty := ⟨a, Finset.mem_filter.mpr ⟨Finset.mem_univ _, ha⟩⟩
  let b := s.max' hne
  have hb := Finset.max'_mem s hne
  have hcut := (Finset.mem_filter.mp hb).2
  change edgeStepPrefix p false b = g at hcut
  have hb_lt : b.val < m := by
    by_contra! h
    have he : b = Fin.last m := Fin.ext (by have := b.isLt; change b.val=m; omega)
    rw [he] at hcut
    omega
  let i : Fin m := ⟨b.val,hb_lt⟩
  have hib : i.castSucc = b := Fin.ext rfl
  have hmax (j : Fin (m+1)) (hj : edgeStepPrefix p false j = g) : j ≤ i.castSucc := by
    rw [hib]
    exact Finset.le_max' s _ (Finset.mem_filter.mpr ⟨Finset.mem_univ _,hj⟩)
  have hg0 : edgeStepPrefix p false i.castSucc = g := hib ▸ hcut
  have hstep : runStep p i = 1 := by
    by_contra hn
    have hNext := edgeStepPrefix_succ p false i
    simp [hg0,hn] at hNext
    have hbad := hmax i.succ hNext
    exact (not_le_of_gt (show i.castSucc < i.succ from Nat.lt_succ_self _)) hbad
  have hg1 : edgeStepPrefix p false i.succ = g+1 := by
    simp [edgeStepPrefix_succ,hg0,hstep]
  have hsame : edgeStepPrefix p true i.castSucc = edgeStepPrefix p true i.succ := by
    simp [edgeStepPrefix_succ,hstep]
  refine ⟨i,hg0,hg1,hsame,hmax,?_,hstep⟩
  intro j hj
  by_contra! hn
  have hprev : j ≤ i.castSucc := by
    change j.val ≤ i.val
    change j.val < i.val+1 at hn
    omega
  have h := edgeStepPrefix_monotone p false hprev
  omega

end CircularCompleteMinusEdge
