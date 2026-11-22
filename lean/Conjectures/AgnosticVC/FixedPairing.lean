module

public import Conjectures.AgnosticVC.Theorem

/-! Information on each fixed paired pool, using a common deleted sample for both
possible choices in each row. -/

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

private theorem extendTrace_comp {I J K H X : Type*} [Fintype I] [Fintype J] [Fintype K]
    [TraceOrder H] (predict : H → X → Bool) (x : I → X) (e : J → I) (f : K → J) :
    extendTrace predict x e ∘ extendTrace predict (x ∘ e) f =
      extendTrace predict x (e ∘ f) := by
  funext v
  apply canonicalRep_injective predict x
  simp only [Function.comp_apply, canonicalRep_extendTrace]
  rfl

private theorem properLearner_fixedPairing_information_le_succ {m d : ℕ} {X H : Type*}
    [Nonempty H] [TraceOrder H] (hd : 0 < d) (hn : d ≤ m + 1) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (z : Pool (m + 1) X) :
    poolInformation hd hn predict z ≤ 19712 * d := by
  classical
  let n := m + 1
  let p := outputChannel hd hn predict z
  have hp s : IsLaw (p s) := outputChannel_isLaw hd hn predict z s
  change SteinkeZakynthinou.channelInfo p ≤ _
  rcases hn.eq_or_lt with hdn | hdn
  · have h := channelInfo_le_two_mul_size p (fun s => (hp s).1) (fun s => (hp s).2)
    apply h.trans
    rw [← hdn]
    linarith only [Nat.cast_nonneg (α := ℝ) d]
  let σ := schedule n d
  let x := fun k => (z k).1
  let pos (s : Fin n → Bool) (i : Fin n) := (i, s i)
  let T (s : Fin n → Bool) (i : Fin n) := z (pos s i)
  let base (s : Fin n → Bool) := learnedTraceMass σ predict (x ∘ pos s) (fun j => (T s j).2)
  let skip (i : Fin n) (s : Fin n → Bool) := pos s ∘ i.succAbove
  let deleted (i : Fin n) (s : Fin n → Bool) :=
    marginal (extendTrace predict x (skip i s))
      (learnedTraceMass σ predict (x ∘ skip i s) (fun j => (z (skip i s j)).2))
  let charge (i : Fin n) (s : Fin n → Bool) := blockDeletionCharge σ predict (T s) i
  have hlast : d * 4 ^ depth n d < n := by
    have hsq := last_size_sq_le hd hn
    have hlt : n * d < n ^ 2 := by
      rw [pow_two]
      exact Nat.mul_lt_mul_of_pos_left hdn (Nat.succ_pos m)
    exact (Nat.pow_lt_pow_iff_left (by decide : 2 ≠ 0)).mp (hsq.trans_lt hlt)
  have hsize (j : Fin σ.levels) : σ.size j < n := by
    change d * 4 ^ j.val < n
    exact (Nat.mul_le_mul_left d (Nat.pow_le_pow_right (by decide) (Nat.le_of_lt_succ j.isLt))).trans_lt hlast
  have budget (s : Fin n → Bool) : ∑ i, charge i s ≤ 4928 * d :=
    deletion_sum_le_of_loss_integral hd hn le_rfl hsize predict hvc (T s)
      (traceLaw_remove_loss_integral_le hd hn hlast (by omega) predict _ _ (sampleFamily_vcDim_le hvc _))
  have hdel (i : Fin n) (s : Fin n → Bool) (b : Bool) :
      skip i (Function.update s i b) = skip i s := by
    funext j
    change (i.succAbove j, Function.update s i b (i.succAbove j)) = (i.succAbove j, s (i.succAbove j))
    rw [Function.update_of_ne (Fin.succAbove_ne i j)]
  have hcharge (i : Fin n) (s : Fin n → Bool) : hellingerSq (p s) (deleted i s) = charge i s := by
    let g := extendTrace predict x (pos s)
    let f := extendTrace predict (x ∘ pos s) i.succAbove
    let q := learnedTraceMass σ predict (x ∘ skip i s) (fun j => (z (skip i s j)).2)
    have he : g ∘ f = extendTrace predict x (skip i s) := extendTrace_comp predict x _ _
    change hellingerSq (marginal g (base s)) (marginal (extendTrace predict x (skip i s)) q) = _
    rw [← he, ← marginal_comp, hellingerSq_marginal_injective _ (extendTrace_injective predict x _)]
    exact hellingerSq_comm _ _
  have hc (i : Fin n) (s : Fin n → Bool) (b : Bool) :
      hellingerSq (p (Function.update s i b)) (deleted i s) ≤ charge i (Function.update s i b) := by
    have he : deleted i (Function.update s i b) = deleted i s := by
      unfold deleted
      rw [hdel]
    rw [← he, hcharge]
  have h := channelInfo_le_commonDeletion p (fun s => (hp s).1) deleted charge _ budget hc
  linarith only [h]

theorem properLearner_fixedPairing_information_le {n d : ℕ} {X H : Type*}
    [Nonempty H] [TraceOrder H] (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) (z : Pool n X) :
    poolInformation hd hn predict z ≤ 19712 * d := by
  cases n with
  | zero => exact False.elim (Nat.not_succ_le_zero _ (hd.trans_le hn))
  | succ m => exact properLearner_fixedPairing_information_le_succ hd hn predict hvc z

/-- The same proper algorithm meets both rates on every deterministic paired pool and
every training sample. This statement uses an exact finite-channel information law. -/
theorem steinkeZakynthinou_fixedPairing {X H : Type*} [Nonempty H] [TraceOrder H]
    {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) :
    ∃ A : (Fin n → X × Bool) → PMF H,
      (∀ z : Pool n X, originalPoolInformation A z ≤ 19712 * d) ∧
      ∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n) := by
  refine ⟨properLearner hd hn predict, ?_, properLearner_empirical_le_iInf hd hn predict hvc⟩
  intro z
  rw [originalPoolInformation_eq_poolInformation]
  exact properLearner_fixedPairing_information_le hd hn predict hvc z

end AgnosticVC
