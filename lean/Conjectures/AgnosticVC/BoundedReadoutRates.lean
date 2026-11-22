module

public import Conjectures.AgnosticVC.BoundedReadout
public import Conjectures.AgnosticVC.OriginalInformation
public import Conjectures.AgnosticVC.EmpiricalInfimum

@[expose] public section

open scoped BigOperators ENNReal

namespace AgnosticVC

open SteinkeZakynthinou
open SteinkeZakynthinou.Learner (selectorMean)

variable {X H : Type*} [Nonempty H] {n d k : ℕ} {predict : H → X → Bool}

/-- The bounded-readout learner uses the same trace optimizer. -/
noncomputable def BoundedTraceReadout.learn (r : BoundedTraceReadout predict k)
    (hd : 0 < d) (hn : d ≤ n) (z : Fin n → X × Bool) : PMF H :=
  traceReadoutLearner hd hn predict z (r.represent (Prod.fst ∘ z))

theorem BoundedTraceReadout.learn_empirical_le (r : BoundedTraceReadout predict k)
    (hd : 0 < d) (hn : d ≤ n) (hvc : HasVCDimensionAtMost predict d) (z : Fin n → X × Bool) :
    (∑' t : H, (r.learn hd hn z t).toReal * empiricalError predict z t) ≤
      (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n) := by
  apply sub_le_iff_le_add.mp
  apply le_ciInf
  intro h
  exact sub_le_iff_le_add.mpr (traceReadoutLearner_empirical_le hd hn predict hvc z
    (r.represent _) (fun v => congrArg Subtype.val (r.realizes _ v)) h)

private theorem traceReadoutLearner_mass (hd : 0 < d) (hn : d ≤ n)
    (z : Fin n → X × Bool) (f : TraceSpace predict (Prod.fst ∘ z) → H) (h : H) :
    (traceReadoutLearner hd hn predict z f h).toReal =
      marginal f (learnedTraceMass (schedule n d) predict (Prod.fst ∘ z) (Prod.snd ∘ z)) h := by
  classical
  have hq := learnedTraceMass_isLaw (schedule_temperature_pos hd (hd.trans_le hn))
    (schedule_coeff_nonneg n d) predict (Prod.fst ∘ z) (Prod.snd ∘ z)
  unfold traceReadoutLearner
  rw [PMF.map_apply, tsum_fintype]
  simp only [PMF.ofFintype_apply, marginal, Finset.sum_filter]
  rw [ENNReal.toReal_sum (fun v _ => by split <;> simp)]
  apply Finset.sum_congr rfl
  intro v _
  by_cases hv : f v = h
  · simp only [hv, ite_true]
    exact ENNReal.toReal_ofReal (hq.1 v)
  · simp [hv, eq_comm (a := h)]

omit [Nonempty H] in
private theorem marginal_embedding_mass {A B : Type*} [Fintype A]
    (e : B ↪ H) (g : A → B) (q : A → ℝ) (b : B) :
    marginal (e ∘ g) q (e b) = marginal g q b := by
  classical
  simp [marginal, e.injective.eq_iff]

/-- The whole returned hypothesis has bounded information on every paired
pool, including when a representative depends on the training features. -/
theorem BoundedTraceReadout.learn_fixedPairing_le (r : BoundedTraceReadout predict k)
    {m : ℕ} (hd : 0 < d) (hn : d ≤ m + 1) (hvc : HasVCDimensionAtMost predict d)
    (z : Pool (m+1) X) :
    originalPoolInformation (r.learn hd hn) z ≤ 197120 * (d : ℝ) + 32 * (k : ℝ) := by
  classical
  let N := m + 1
  let T (s : Selector N) (i : Fin N) := z (i,s i)
  let x (s : Selector N) := Prod.fst ∘ T s
  let y (s : Selector N) := Prod.snd ∘ T s
  let S (s : Selector N) (i : Fin N) := T s ∘ i.succAbove
  let u (s : Selector N) (i : Fin N) := Prod.fst ∘ S s i
  let v (s : Selector N) (i : Fin N) := Prod.snd ∘ S s i
  let fullNames (s : Selector N) : Finset H :=
    Finset.univ.image (r.represent (x s))
  let shortNames (s : Selector N) (i : Fin N) : Finset H :=
    Finset.univ.image (r.represent (u s i))
  let names : Finset H := Finset.univ.biUnion (fun s =>
    fullNames s ∪ Finset.univ.biUnion (shortNames s))
  let B := ↥names
  let emb : B ↪ H := ⟨Subtype.val, Subtype.val_injective⟩
  let full (s : Selector N) (a : TraceSpace predict (x s)) : B :=
    ⟨r.represent (x s) a, Finset.mem_biUnion.mpr ⟨s, Finset.mem_univ _, Finset.mem_union_left _
      (Finset.mem_image_of_mem _ (Finset.mem_univ a))⟩⟩
  let short (s : Selector N) (i : Fin N) (a : TraceSpace predict (u s i)) : B :=
    ⟨r.represent (u s i) a, Finset.mem_biUnion.mpr ⟨s, Finset.mem_univ _, Finset.mem_union_right _
      (Finset.mem_biUnion.mpr ⟨i, Finset.mem_univ _, Finset.mem_image_of_mem _ (Finset.mem_univ a)⟩)⟩⟩
  let σ := schedule N d
  let p (s : Selector N) := marginal (full s) (learnedTraceMass σ predict (x s) (y s))
  let q (i : Fin N) (s : Selector N) := marginal (short s i) (learnedTraceMass σ predict (u s i) (v s i))
  have hp (s : Selector N) : IsLaw (p s) := (learnedTraceMass_isLaw
    (schedule_temperature_pos hd (hd.trans_le hn)) (schedule_coeff_nonneg N d) predict _ _).marginal _
  have hinfo : originalPoolInformation (r.learn hd hn) z = channelInfo p := by
    apply originalPoolInformation_eq_channelInfo_of_embedding (r.learn hd hn) z emb p (fun s => (hp s).1)
    · intro s b
      change (traceReadoutLearner hd hn predict (T s) (emb ∘ full s) (emb b)).toReal = p s b
      rw [traceReadoutLearner_mass]
      exact marginal_embedding_mass emb (full s) _ b
    · intro s h hh
      by_contra! hnone
      have hz : (r.learn hd hn (T s) h).toReal = 0 := by
        rw [BoundedTraceReadout.learn, traceReadoutLearner_mass]
        apply marginal_zero_of_no_preimage
        intro he
        obtain ⟨a,ha⟩ := he
        exact hnone (full s a) ha
      exact (ENNReal.toReal_pos hh (PMF.apply_ne_top _ _)).ne' hz
  rw [hinfo]
  rcases hn.eq_or_lt with he | hlt
  · apply (channelInfo_le_two_mul_size p (fun s => (hp s).1) (fun s => (hp s).2)).trans
    change 2 * ((m + 1 : ℕ) : ℝ) ≤ _
    rw [← he]
    linarith only [Nat.cast_nonneg (α := ℝ) d, Nat.cast_nonneg (α := ℝ) k]
  have hbudget (s : Selector N) : ∑ i, hellingerSq (p s) (q i s) ≤ 49280 * (d : ℝ) + 8 * (k : ℝ) :=
    r.named_deletion_sum_le hd hlt hvc (T s) emb (full s) (short s) (fun _ => rfl) (fun _ _ => rfl)
  have hdelete (i : Fin N) (s : Selector N) (b : Bool) : q i (Function.update s i b) = q i s := by
    have ht : S (Function.update s i b) i = S s i := by
      funext j
      change z (i.succAbove j, Function.update s i b (i.succAbove j)) =
        z (i.succAbove j, s (i.succAbove j))
      rw [Function.update_of_ne (Fin.succAbove_ne i j)]
    funext j
    change marginal (short (Function.update s i b) i) (learnedTraceMass σ predict
      (Prod.fst ∘ S (Function.update s i b) i) (Prod.snd ∘ S (Function.update s i b) i)) j = _
    have he (s' : Selector N) : q i s' j =
        marginal (r.represent (Prod.fst ∘ S s' i))
          (learnedTraceMass σ predict (Prod.fst ∘ S s' i) (Prod.snd ∘ S s' i)) (emb j) :=
      (marginal_embedding_mass emb (short s' i) _ j).symm
    change q i (Function.update s i b) j = q i s j
    rw [he, he, ht]
  have h := channelInfo_le_commonDeletion p (fun s => (hp s).1) q
    (fun i s => hellingerSq (p s) (q i s)) _ hbudget (fun i s b => by rw [hdelete i s b])
  linarith only [h]

end AgnosticVC
