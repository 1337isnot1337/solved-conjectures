import Conjectures.BraunBrueggeBicyclicThetaGraph

/-! A spanning subgraph of a theta is connected exactly when every path
has at most one missing step and some path contains all of its steps. -/

namespace BraunBruegge

variable {length : Fin 3 → ℕ}

abbrev ThetaStepPresent (T : SimpleGraph (ThetaVertex length)) (p : Fin 3) (i : Fin (length p)) : Prop :=
  T.Adj (thetaPosition p i.castSucc) (thetaPosition p i.succ)

private theorem thetaLabels_preserve_edges {T : SimpleGraph (ThetaVertex length)} (hT : T ≤ thetaGraph length)
    {α : Type*} {start finish : α} {values : (p : Fin 3) → Fin (length p + 1) → α}
    (h₀ : ∀ p, values p 0 = start) (h₁ : ∀ p, values p (thetaLast p) = finish)
    (hStep : ∀ p i, ThetaStepPresent T p i → values p i.castSucc = values p i.succ)
    {u v : ThetaVertex length} (e : T.Adj u v) : thetaLabels start finish values u = thetaLabels start finish values v := by
  obtain ⟨p, i, he | he⟩ := (hT e).2
  · obtain ⟨rfl, rfl⟩ := he
    rw [thetaLabels_position h₀ h₁, thetaLabels_position h₀ h₁]
    exact hStep p i e
  · obtain ⟨rfl, rfl⟩ := he
    rw [thetaLabels_position h₀ h₁, thetaLabels_position h₀ h₁]
    exact (hStep p i e.symm).symm

private theorem theta_cannot_miss_two_ordered_steps {T : SimpleGraph (ThetaVertex length)}
    (hT : T ≤ thetaGraph length) (hC : T.Connected) (p : Fin 3) (i j : Fin (length p))
    (hij : i.val < j.val) (hi : ¬ThetaStepPresent T p i) (hj : ¬ThetaStepPresent T p j) : False := by
  let values (q : Fin 3) (k : Fin (length q + 1)) : Bool :=
    decide (q = p ∧ i.val < k.val ∧ k.val ≤ j.val)
  have h₀ (q : Fin 3) : values q 0 = false := by simp [values]
  have h₁ (q : Fin 3) : values q (thetaLast q) = false := by
    by_cases hq : q = p
    · subst q
      simp [values, thetaLast, not_le.mpr j.isLt]
    · simp [values, hq]
  have hstep (q : Fin 3) (k : Fin (length q)) (hk : ThetaStepPresent T q k) :
      values q k.castSucc = values q k.succ := by
    by_cases hq : q = p
    · subst q
      have hki : k.val ≠ i.val := fun e => hi ((Fin.ext e : k = i) ▸ hk)
      have hkj : k.val ≠ j.val := fun e => hj ((Fin.ext e : k = j) ▸ hk)
      apply Bool.eq_iff_iff.mpr
      simp only [values, true_and, decide_eq_true_eq, Fin.val_castSucc, Fin.val_succ]
      omega
    · simp [values, hq]
  let b := thetaLabels false false values
  have hb := eq_of_reachable b (fun _ _ e => thetaLabels_preserve_edges hT h₀ h₁ hstep e)
    (hC thetaStart (thetaPosition p i.succ))
  have hv : values p i.succ = true := by
    simp only [values, true_and, decide_eq_true_eq, Fin.val_succ]
    omega
  change false = b (thetaPosition p i.succ) at hb
  rw [show b (thetaPosition p i.succ) = values p i.succ from thetaLabels_position h₀ h₁ p _, hv] at hb
  cases hb

private theorem theta_exists_full_path {T : SimpleGraph (ThetaVertex length)}
    (hT : T ≤ thetaGraph length) (hC : T.Connected) : ∃ p, ∀ i, ThetaStepPresent T p i := by
  classical
  by_contra! h
  choose gap hgap using h
  let values (p : Fin 3) (i : Fin (length p + 1)) : Bool := decide ((gap p).val < i.val)
  have h₀ (p : Fin 3) : values p 0 = false := by simp [values]
  have h₁ (p : Fin 3) : values p (thetaLast p) = true := by simp [values, thetaLast, (gap p).isLt]
  have hstep (p : Fin 3) (i : Fin (length p)) (hi : ThetaStepPresent T p i) :
      values p i.castSucc = values p i.succ := by
    have hne : i.val ≠ (gap p).val := fun h => hgap p ((Fin.ext h : i = gap p) ▸ hi)
    apply Bool.eq_iff_iff.mpr
    simp only [values, decide_eq_true_eq, Fin.val_castSucc, Fin.val_succ]
    omega
  let b := thetaLabels false true values
  have hb := eq_of_reachable b (fun _ _ e => thetaLabels_preserve_edges hT h₀ h₁ hstep e)
    (hC thetaStart thetaFinish)
  change false = true at hb
  cases hb

theorem theta_spanning_connected_iff {T : SimpleGraph (ThetaVertex length)} (hT : T ≤ thetaGraph length)
    (positive : ∀ p, 0 < length p) : T.Connected ↔
      (∀ p i j, ¬ThetaStepPresent T p i → ¬ThetaStepPresent T p j → i = j) ∧
      (∃ p, ∀ i, ThetaStepPresent T p i) := by
  constructor
  · intro hC
    refine ⟨?_, theta_exists_full_path hT hC⟩
    intro p i j hi hj
    by_contra hne
    rcases lt_or_gt_of_ne (fun h : i.val = j.val => hne (Fin.ext h)) with h | h
    · exact theta_cannot_miss_two_ordered_steps hT hC p i j h hi hj
    · exact theta_cannot_miss_two_ordered_steps hT hC p j i h hj hi
  · rintro ⟨hgap, p, hp⟩
    have hjoin : T.Reachable thetaStart thetaFinish := by
      rw [← thetaPosition_zero p, ← thetaPosition_last positive p]
      exact theta_path_reachable p 0 (thetaLast p) (Nat.zero_le _) (fun k _ _ => hp k)
    have hr (v : ThetaVertex length) : T.Reachable thetaStart v := by
      obtain ⟨q, i, rfl⟩ := thetaPosition_surjective positive v
      by_cases hbefore : ∀ k : Fin (length q), k.val < i.val → ThetaStepPresent T q k
      · rw [← thetaPosition_zero q]
        exact theta_path_reachable q 0 i (Nat.zero_le _) (fun k _ hk => hbefore k hk)
      · push Not at hbefore
        obtain ⟨j, hj, hmissing⟩ := hbefore
        have hafter (k : Fin (length q)) (hk : i.val ≤ k.val) : ThetaStepPresent T q k := by
          by_contra he
          have h := congrArg Fin.val (hgap q j k hmissing he)
          omega
        have he : i.val ≤ (thetaLast (length := length) q).val := by
          have hi := i.isLt
          change i.val ≤ length q
          omega
        have hreach := theta_path_reachable q i (thetaLast q) he (fun k hk _ => hafter k hk)
        rw [thetaPosition_last positive q] at hreach
        exact hjoin.trans hreach.symm
    exact ⟨fun u v => (hr u).symm.trans (hr v)⟩

end BraunBruegge
