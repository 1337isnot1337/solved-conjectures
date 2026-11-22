module

public import Conjectures.AgnosticVC.DeletionSum
public import Conjectures.AgnosticVC.RepresentativeTransfer
public import Conjectures.AgnosticVC.ProjectionWeightIntegral

/-! The empirical trace optimizer with representatives that depend on a bounded
number of rows. Its information bound is for the actual hypothesis names. -/

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {H X : Type*}

/-- The trace of a named hypothesis as an element of the realized trace space. -/
noncomputable def traceIndex (predict : H → X → Bool) {n : ℕ} (x : Fin n → X) (h : H) :
    TraceSpace predict x :=
  ⟨sampleTrace predict x h, sampleTrace_mem predict x h⟩

/-- Representatives realizing each trace, with the rows used to choose them.
For a short trace, compare its name with the representative of that name's
full trace. These names agree if the full representative's rows survive. -/
structure BoundedTraceReadout (predict : H → X → Bool) (k : ℕ) where
  represent : ∀ {n : ℕ} (x : Fin n → X), TraceSpace predict x → H
  realizes : ∀ {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x),
    traceIndex predict x (represent x v) = v
  rows : ∀ {n : ℕ} (x : Fin n → X), TraceSpace predict x → Finset (Fin n)
  card_rows_le : ∀ {n : ℕ} (x : Fin n → X) (v : TraceSpace predict x), (rows x v).card ≤ k
  agrees_after_deletion : ∀ {n : ℕ} (x : Fin (n+1) → X) (i : Fin (n+1))
      (v : TraceSpace predict (x ∘ i.succAbove)),
    let short := represent (x ∘ i.succAbove) v
    let long := traceIndex predict x short
    i ∉ rows x long → represent x long = short

variable {predict : H → X → Bool} {k : ℕ}

theorem BoundedTraceReadout.represent_injective (r : BoundedTraceReadout predict k)
    {n : ℕ} (x : Fin n → X) : Function.Injective (r.represent x) := by
  intro a b h
  exact (r.realizes x a).symm.trans ((congrArg (traceIndex predict x) h).trans (r.realizes x b))

/-- Lift through the full trace of the actual short-sample representative. -/
noncomputable def BoundedTraceReadout.liftAfterDeletion (r : BoundedTraceReadout predict k)
    {n : ℕ} (x : Fin (n+1) → X) (i : Fin (n+1))
    (v : TraceSpace predict (x ∘ i.succAbove)) : TraceSpace predict x :=
  traceIndex predict x (r.represent (x ∘ i.succAbove) v)

theorem BoundedTraceReadout.forget_liftAfterDeletion (r : BoundedTraceReadout predict k)
    {n : ℕ} (x : Fin (n+1) → X) (i : Fin (n+1))
    (v : TraceSpace predict (x ∘ i.succAbove)) :
    forgetTrace (sampleFamily predict x) i (r.liftAfterDeletion x i v) =
      deletedTraceEquiv predict x i v := by
  apply Subtype.ext
  let h := r.represent (x ∘ i.succAbove) v
  change (sampleTrace predict x h).erase i = v.val.map i.succAboveEmb
  rw [← sampleTrace_map_succAbove]
  exact congrArg (fun t : TraceSpace predict (x ∘ i.succAbove) => t.val.map i.succAboveEmb)
    (r.realizes (x ∘ i.succAbove) v)

/-- Named output deletion budget, in any common finite alphabet embedding into
the hypothesis names. The embedding can depend on the entire fixed pool. -/
theorem BoundedTraceReadout.named_deletion_sum_le [Nonempty H] (r : BoundedTraceReadout predict k)
    {m d : ℕ} (hd : 0 < d) (hdn : d < m + 1) (hvc : HasVCDimensionAtMost predict d)
    (T : Fin (m+1) → X × Bool) {B : Type*} [Fintype B] (embed : B ↪ H)
    (full : TraceSpace predict (Prod.fst ∘ T) → B)
    (short : ∀ i : Fin (m+1), TraceSpace predict (Prod.fst ∘ T ∘ i.succAbove) → B)
    (hfull : ∀ a, embed (full a) = r.represent (Prod.fst ∘ T) a)
    (hshort : ∀ i a, embed (short i a) = r.represent (Prod.fst ∘ T ∘ i.succAbove) a) :
    let σ := schedule (m+1) d
    let x := Prod.fst ∘ T
    let y := Prod.snd ∘ T
    ∑ i : Fin (m+1), hellingerSq (marginal full (learnedTraceMass σ predict x y))
      (marginal (short i) (learnedTraceMass σ predict (x ∘ i.succAbove) (y ∘ i.succAbove))) ≤
        49280 * (d : ℝ) + 8 * (k : ℝ) := by
  classical
  intro σ x y
  let q := learnedTraceMass σ predict x y
  let p (i : Fin (m+1)) := learnedTraceMass σ predict (x ∘ i.succAbove) (y ∘ i.succAbove)
  let lift (i : Fin (m+1)) := r.liftAfterDeletion x i
  let charge (i : Fin (m+1)) := liftedDeletionCharge σ predict T i (lift i)
  have hτ := schedule_temperature_pos hd (hd.trans hdn)
  have hc := schedule_coeff_nonneg (m + 1) d
  have hq : IsLaw q := learnedTraceMass_isLaw hτ hc predict x y
  have hf : Function.Injective full := by
    intro a b hab
    apply r.represent_injective x
    rw [← hfull a, ← hfull b, hab]
  have hlast : d * 4 ^ depth (m + 1) d < m + 1 := by
    have hsq := last_size_sq_le hd hdn.le
    have hlt : (m + 1) * d < (m + 1) ^ 2 := by
      rw [pow_two]
      exact Nat.mul_lt_mul_of_pos_left hdn (Nat.succ_pos m)
    exact (Nat.pow_lt_pow_iff_left (by decide : 2 ≠ 0)).mp (hsq.trans_lt hlt)
  have hsize (j : Fin σ.levels) : σ.size j < m + 1 := by
    change d * 4 ^ j.val < m + 1
    exact (Nat.mul_le_mul_left d (Nat.pow_le_pow_right (by decide)
      (Nat.le_of_lt_succ j.isLt))).trans_lt hlast
  have hcharges : ∑ i, charge i ≤ 4928 * (d : ℝ) :=
    lifted_deletion_sum_le_of_loss_integral hd hdn.le le_rfl hsize predict hvc T lift
      (r.forget_liftAfterDeletion x)
      (traceLaw_remove_loss_integral_le hd hdn.le hlast (by omega) predict x y
        (sampleFamily_vcDim_le hvc x))
  let bad (i : Fin (m+1)) := Finset.univ.filter (fun a => i ∈ r.rows x a)
  have hcompare (i : Fin (m+1)) :
      hellingerSq (marginal full q) (marginal (short i) (p i)) ≤
        10 * charge i + 8 * ∑ a ∈ bad i, q a := by
    rw [show charge i = hellingerSq q (marginal (lift i) (p i)) from hellingerSq_comm _ _]
    apply hellingerSq_named_le_of_trace_lift full hf (short i) (lift i) q (p i) hq.1
      (learnedTraceMass_isLaw hτ hc predict _ _).1
    intro a ha
    apply embed.injective
    rw [hfull, hshort]
    have hnot : i ∉ r.rows x (lift i a) := by simpa [bad] using ha
    exact r.agrees_after_deletion x i a hnot
  have hrows : (∑ i, ∑ a ∈ bad i, q a) ≤ (k : ℝ) := by
    convert representative_anchor_mass_le q hq (r.rows x) k (r.card_rows_le x) using 1
    apply Finset.sum_congr rfl
    intro i _
    apply Finset.sum_congr _ (fun _ _ => rfl)
    ext a
    simp [bad]
  have hs := Finset.sum_le_sum fun i (_ : i ∈ Finset.univ) => hcompare i
  simp only [Finset.sum_add_distrib, ← Finset.mul_sum] at hs
  change (∑ i, hellingerSq (marginal full q) (marginal (short i) (p i))) ≤ _
  linarith only [hs, hcharges, hrows]

end AgnosticVC
