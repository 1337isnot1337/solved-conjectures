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

private theorem originalPoolInformation_constant {X H : Type*} {n : ℕ}
    (p : PMF H) (z : Pool n X) : originalPoolInformation (fun _ => p) z = 0 := by
  have hout : originalPoolOutput (fun _ => p) z = p := by
    rw [originalPoolOutput_eq_bind, PMF.bind_const]
  unfold originalPoolInformation
  calc
    _ = ∑' _ : SteinkeZakynthinou.Selector n × H, (0 : ℝ) := by
      apply tsum_congr
      rintro ⟨s,h⟩
      rw [originalPoolJoint_apply, originalPoolMarginalProduct_apply, hout]
      simp
    _ = 0 := tsum_zero

/-- Conjecture 4.18 of Steinke and Zakynthinou's framework paper. The information
bound is the distribution-free CMI of Definition 1.1, namely the bound on the
whole named output at every fixed paired supersample. The source allows all
positive sample sizes. When `n < d`, a constant proper output suffices. -/
theorem steinkeZakynthinou_framework_conjecture418 {X H : Type*} [Nonempty H]
    {n d : ℕ} (hd : 0 < d) (hn : 0 < n) (predict : H → X → Bool)
    (hvc : HasVCDimensionAtMost predict d) :
    ∃ A : (Fin n → X × Bool) → PMF H,
      (∀ z : Pool n X, originalPoolInformation A z ≤ 19712 * d) ∧
      ∀ z, (∑' h : H, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : H, empiricalError predict z h) + 19712 * Real.sqrt ((d : ℝ) / n) := by
  by_cases hdn : d ≤ n
  · obtain ⟨A,hi,ha⟩ := steinkeZakynthinou_fixedPairing hd hdn predict hvc
    refine ⟨A,hi,fun z => (ha z).trans ?_⟩
    linarith only [Real.sqrt_nonneg ((d : ℝ) / n)]
  classical
  let h₀ : H := Classical.ofNonempty
  refine ⟨fun _ => PMF.pure h₀, ?_, ?_⟩
  · intro z
    rw [originalPoolInformation_constant]
    positivity
  · intro z
    have ho : (∑' h : H, ((PMF.pure h₀) h).toReal * empiricalError predict z h) =
        empiricalError predict z h₀ := by
      rw [tsum_eq_single h₀]
      · simp
      · intro h hh
        simp [PMF.pure_apply, hh]
    have hmin : 0 ≤ (⨅ h : H, empiricalError predict z h) := by
      apply le_ciInf
      intro h
      rw [empiricalError_eq_zeroOne]
      exact div_nonneg (Finset.sum_nonneg fun i _ => by split <;> norm_num) (Nat.cast_nonneg n)
    have hmax : empiricalError predict z h₀ ≤ 1 := by
      rw [empiricalError_eq_zeroOne, div_le_iff₀ (Nat.cast_pos.mpr hn), one_mul]
      calc
        _ ≤ ∑ _ : Fin n, (1 : ℝ) := Finset.sum_le_sum fun i _ => by split <;> norm_num
        _ = n := by simp
    have hratio : (1 : ℝ) ≤ (d : ℝ) / n := (le_div_iff₀ (Nat.cast_pos.mpr hn)).mpr (by
      rw [one_mul]
      exact_mod_cast (Nat.le_of_lt (Nat.lt_of_not_ge hdn)))
    have hsqrt : 1 ≤ Real.sqrt ((d : ℝ) / n) := by
      simpa only [Real.sqrt_one] using Real.sqrt_le_sqrt hratio
    rw [ho]
    linarith only [hmin,hmax,hsqrt]

end AgnosticVC
