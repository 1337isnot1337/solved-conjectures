module

public import Conjectures.AgnosticVC.OptimizerDeletion
public import Conjectures.AgnosticVC.Output

@[expose] public section

namespace AgnosticVC

open Finset
open scoped BigOperators

variable {n : ℕ} {H X : Type*}

lemma exists_map_succAbove (i : Fin (n + 1)) (s : Finset (Fin (n + 1))) (hi : i ∉ s) :
    ∃ t : Finset (Fin n), t.map i.succAboveEmb = s := by
  refine ⟨Finset.univ.filter (fun j => i.succAbove j ∈ s), ?_⟩
  ext j
  simp only [Finset.mem_map, Finset.mem_filter, Finset.mem_univ, true_and, Fin.coe_succAboveEmb]
  constructor
  · rintro ⟨k, hk, rfl⟩
    exact hk
  · intro hj
    obtain ⟨k, rfl⟩ := Fin.exists_succAbove_eq (x := j) (y := i) (fun he => hi (he ▸ hj))
    exact ⟨k, hj, rfl⟩

private lemma mem_map_succAbove (i : Fin (n + 1)) (s : Finset (Fin n)) (j : Fin n) :
    i.succAbove j ∈ s.map i.succAboveEmb ↔ j ∈ s := by
  simpa only [Fin.coe_succAboveEmb] using (Finset.mem_map' (f := i.succAboveEmb) (a := j) (s := s))

lemma notMem_map_succAbove (i : Fin (n + 1)) (s : Finset (Fin n)) :
    i ∉ s.map i.succAboveEmb := by
  simp [Finset.mem_map, Fin.succAbove_ne]

/-- Numbering the surviving positions by `Fin n` preserves sizes and bijects the two
families of feature restrictions. -/
noncomputable def avoidingSubsetEquiv (i : Fin (n + 1)) (m : ℕ) :
    SizedSubset (Fin n) m ≃ AvoidingSubset i m := by
  let f (s : SizedSubset (Fin n) m) : AvoidingSubset i m :=
    ⟨⟨s.val.map i.succAboveEmb, (Finset.card_map _).trans s.property⟩,
      notMem_map_succAbove i s.val⟩
  refine Equiv.ofBijective f ⟨?_, ?_⟩
  · intro a b h
    apply Subtype.ext
    exact Finset.map_injective _ (congrArg (fun s : AvoidingSubset i m => s.val.val) h)
  · intro s
    obtain ⟨t, ht⟩ := exists_map_succAbove i s.val.val s.property
    have hcard : t.card = m := by rw [← Finset.card_map (f := i.succAboveEmb), ht, s.val.property]
    exact ⟨⟨t, hcard⟩, Subtype.ext (Subtype.ext ht)⟩

@[simp] theorem avoidingSubsetEquiv_val (i : Fin (n + 1)) (m : ℕ) (s : SizedSubset (Fin n) m) :
    (avoidingSubsetEquiv i m s).val.val = s.val.map i.succAboveEmb := rfl

/-- Relabel every sampled restriction without changing its level. -/
noncomputable def avoidingSampleSubsetEquiv (i : Fin (n + 1)) (σ : Schedule) :
    SampleSubset (Fin n) σ ≃ AvoidingSampleSubset i σ :=
  Equiv.sigmaCongrRight fun j => avoidingSubsetEquiv i (σ.size j)

private lemma restrictionCoeff_renumber (i : Fin (n + 1)) (σ : Schedule)
    (k : SampleSubset (Fin n) σ) :
    restrictionCoeff σ k = avoidingRestrictionCoeff i σ (avoidingSampleSubsetEquiv i σ k) := by
  change σ.coeff k.1 / (Fintype.card (SizedSubset (Fin n) (σ.size k.1)) : ℝ) =
    σ.coeff k.1 / (Fintype.card (AvoidingSubset i (σ.size k.1)) : ℝ)
  rw [Fintype.card_congr (avoidingSubsetEquiv i (σ.size k.1))]

lemma sampleTrace_map_succAbove (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) (h : H) :
    (sampleTrace predict (x ∘ i.succAbove) h).map i.succAboveEmb =
      (sampleTrace predict x h).erase i := by
  ext j
  by_cases hi : j = i
  · subst j
    simp
  · obtain ⟨k, rfl⟩ := Fin.exists_succAbove_eq hi
    simp [Fin.succAbove_ne]

/-- The realized traces on a tuple with a deleted observation, in its natural order, are
equivalent to the traces with the deleted position erased from the original coordinate type. -/
noncomputable def deletedTraceEquiv (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) : TraceSpace predict (x ∘ i.succAbove) ≃ ↥(DeletedFamily (sampleFamily predict x) i) := by
  let f (v : TraceSpace predict (x ∘ i.succAbove)) : ↥(DeletedFamily (sampleFamily predict x) i) := by
    refine ⟨v.val.map i.succAboveEmb, ?_⟩
    obtain ⟨h, hh⟩ := mem_sampleFamily.mp v.property
    refine Finset.mem_image.mpr ⟨sampleTrace predict x h, sampleTrace_mem predict x h, ?_⟩
    rw [erase_inter_univ, ← hh, sampleTrace_map_succAbove]
  refine Equiv.ofBijective f ⟨?_, ?_⟩
  · intro a b h
    exact Subtype.ext (Finset.map_injective _ (congrArg Subtype.val h))
  · intro b
    obtain ⟨v, rfl⟩ := forgetTrace_surjective (sampleFamily predict x) i b
    obtain ⟨h, hh⟩ := mem_sampleFamily.mp v.property
    refine ⟨⟨sampleTrace predict (x ∘ i.succAbove) h, sampleTrace_mem ..⟩, Subtype.ext ?_⟩
    exact (sampleTrace_map_succAbove predict x i h).trans (congrArg (Finset.erase · i) hh)

@[simp] theorem deletedTraceEquiv_val (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) (v : TraceSpace predict (x ∘ i.succAbove)) :
    (deletedTraceEquiv predict x i v).val = v.val.map i.succAboveEmb := rfl

private lemma forgetTrace_extendTrace_succAbove (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) (v : TraceSpace predict (x ∘ i.succAbove)) :
    forgetTrace (sampleFamily predict x) i (extendTrace predict x i.succAbove v) =
      deletedTraceEquiv predict x i v := by
  apply Subtype.ext
  change (sampleTrace predict x (canonicalRep predict (x ∘ i.succAbove) v)).erase i =
    v.val.map i.succAboveEmb
  rw [← sampleTrace_map_succAbove, canonicalRep_trace]

/-- The global canonical representative specifies the section of the deleted trace map. -/
noncomputable def deletedTraceSection (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) : ↥(DeletedFamily (sampleFamily predict x) i) → TraceSpace predict x :=
  extendTrace predict x i.succAbove ∘ (deletedTraceEquiv predict x i).symm

theorem deletedTraceSection_leftInverse (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) : Function.LeftInverse (forgetTrace (sampleFamily predict x) i)
      (deletedTraceSection predict x i) := by
  intro b
  unfold deletedTraceSection
  simp only [Function.comp_apply, forgetTrace_extendTrace_succAbove, Equiv.apply_symm_apply]

instance deletedTrace_nonempty [Nonempty H] (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) : Nonempty ↥(DeletedFamily (sampleFamily predict x) i) :=
  Nonempty.map (deletedTraceEquiv predict x i) inferInstance

private lemma mistakeCount_map_succAbove (i : Fin (n + 1)) (y : Fin (n + 1) → Bool)
    (w : Fin (n + 1) → ℝ) (v : Finset (Fin n)) :
    mistakeCount (y ∘ i.succAbove) (w ∘ i.succAbove) v =
      mistakeCount y (Function.update w i 0) (v.map i.succAboveEmb) := by
  unfold mistakeCount
  rw [Fin.sum_univ_succAbove _ i]
  simp only [Function.update_self, ite_self, zero_add, Function.comp_apply, mem_map_succAbove,
    Function.update_of_ne (Fin.succAbove_ne _ _)]

private lemma restriction_eq_iff_renumber (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) (σ : Schedule) (k : SampleSubset (Fin n) σ)
    (u v : TraceSpace predict (x ∘ i.succAbove)) :
    restrictTrace predict (x ∘ i.succAbove) σ k u = restrictTrace predict (x ∘ i.succAbove) σ k v ↔
      survivingRestriction (sampleFamily predict x) i σ (avoidingSampleSubsetEquiv i σ k)
        (deletedTraceEquiv predict x i u) =
      survivingRestriction (sampleFamily predict x) i σ (avoidingSampleSubsetEquiv i σ k)
        (deletedTraceEquiv predict x i v) := by
  rw [Subtype.ext_iff, Subtype.ext_iff]
  change k.2.val ∩ u.val = k.2.val ∩ v.val ↔
    k.2.val.map i.succAboveEmb ∩ u.val.map i.succAboveEmb =
      k.2.val.map i.succAboveEmb ∩ v.val.map i.succAboveEmb
  rw [← Finset.map_inter, ← Finset.map_inter, Finset.map_inj]

private lemma negEntropy_marginal_sum_fibers {A B : Type*} [Fintype A] [Fintype B]
    (r : A → B) (p : A → ℝ) : negEntropy (marginal r p) =
      ∑ a, p a * Real.log (marginal r p (r a)) := by
  classical
  unfold negEntropy
  calc
    _ = ∑ b : B, ∑ a ∈ Finset.univ.filter (fun a => r a = b),
        p a * Real.log (marginal r p b) := by
      apply Finset.sum_congr rfl
      intro b hb
      simp only [marginal, Finset.sum_mul]
    _ = ∑ b : B, ∑ a ∈ Finset.univ.filter (fun a => r a = b),
        p a * Real.log (marginal r p (r a)) := by
      apply Finset.sum_congr rfl
      intro b hb
      apply Finset.sum_congr rfl
      intro a ha
      rw [(Finset.mem_filter.mp ha).2]
    _ = _ := Finset.sum_fiberwise Finset.univ r _

private lemma negEntropy_marginal_renumber {A B C D : Type*}
    [Fintype A] [Fintype B] [Fintype C] [Fintype D]
    (e : A ≃ B) (r : A → C) (s : B → D)
    (h : ∀ u v, r u = r v ↔ s (e u) = s (e v)) (p : B → ℝ) :
    negEntropy (marginal r (p ∘ e)) = negEntropy (marginal s p) := by
  classical
  have hm (v : A) : marginal r (p ∘ e) (r v) = marginal s p (s (e v)) := by
    simp only [marginal, Finset.sum_filter]
    refine Fintype.sum_equiv e _ _ (fun u => ?_)
    simp only [h u v, Function.comp_apply]
  rw [negEntropy_marginal_sum_fibers, negEntropy_marginal_sum_fibers]
  refine Fintype.sum_equiv e _ _ (fun a => ?_)
  simp only [hm a, Function.comp_apply]

private lemma law_renumber {A B : Type*} [Fintype A] [Fintype B]
    (e : A ≃ B) {p : B → ℝ} (hp : IsLaw p) : IsLaw (p ∘ e) := by
  refine ⟨fun a => hp.1 (e a), ?_⟩
  exact (Fintype.sum_equiv e _ _ (fun _ => rfl)).trans hp.2

set_option maxHeartbeats 600000 in
private lemma deletedObjective_eq (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) (σ : Schedule) (y : Fin (n + 1) → Bool) (w : Fin (n + 1) → ℝ)
    (p : ↥(DeletedFamily (sampleFamily predict x) i) → ℝ) :
    objective (fun v => mistakeCount (y ∘ i.succAbove) (w ∘ i.succAbove) v.val) σ.temperature
      (restrictionCoeff σ) (restrictTrace predict (x ∘ i.succAbove) σ) (p ∘ deletedTraceEquiv predict x i) =
    objective (fun b => mistakeCount y (Function.update w i 0) b.val) σ.temperature
      (avoidingRestrictionCoeff i σ) (survivingRestriction (sampleFamily predict x) i σ) p := by
  let e := deletedTraceEquiv predict x i
  let u := avoidingSampleSubsetEquiv i σ
  let r := restrictTrace predict (x ∘ i.succAbove) σ
  let s := survivingRestriction (sampleFamily predict x) i σ
  let l (v : TraceSpace predict (x ∘ i.succAbove)) :=
    mistakeCount (y ∘ i.succAbove) (w ∘ i.succAbove) v.val
  let L (b : ↥(DeletedFamily (sampleFamily predict x) i)) :=
    mistakeCount y (Function.update w i 0) b.val
  have hE : expected (p ∘ e) l = expected p L := by
    unfold expected
    refine Fintype.sum_equiv e _ _ (fun v => ?_)
    exact congrArg (p (e v) * ·) (mistakeCount_map_succAbove i y w v.val)
  have hN : negEntropy (p ∘ e) = negEntropy p := by
    exact Fintype.sum_equiv e _ _ (fun _ => rfl)
  have hR : (∑ k, restrictionCoeff σ k * negEntropy (marginal (r k) (p ∘ e))) =
      ∑ k, avoidingRestrictionCoeff i σ k * negEntropy (marginal (s k) p) := by
    refine Fintype.sum_equiv u _ _ (fun k => ?_)
    have h := negEntropy_marginal_renumber e (r k) (s (u k))
      (restriction_eq_iff_renumber predict x i σ k) p
    rw [h, restrictionCoeff_renumber i σ k]
  change objective l σ.temperature (restrictionCoeff σ) r (p ∘ e) =
    objective L σ.temperature (avoidingRestrictionCoeff i σ) s p
  simp only [objective, hE, hN, hR]

set_option maxHeartbeats 900000 in
/-- Renumbering the surviving positions transforms the quotient optimizer into the actual
learner's law with the original common schedule. -/
theorem traceLaw_deleted_eq [Nonempty H] (predict : H → X → Bool) (x : Fin (n + 1) → X)
    (i : Fin (n + 1)) (σ : Schedule) (y : Fin (n + 1) → Bool) (w : Fin (n + 1) → ℝ)
    (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    traceLaw σ predict (x ∘ i.succAbove) (y ∘ i.succAbove) (w ∘ i.succAbove) =
      deletedTraceOptimizer (sampleFamily predict x) i σ y w ∘ deletedTraceEquiv predict x i := by
  let e := deletedTraceEquiv predict x i
  let t := restrictionCoeff (I := Fin n) σ
  let c := avoidingRestrictionCoeff i σ
  let r := restrictTrace predict (x ∘ i.succAbove) σ
  let s := survivingRestriction (sampleFamily predict x) i σ
  let l (v : TraceSpace predict (x ∘ i.succAbove)) :=
    mistakeCount (y ∘ i.succAbove) (w ∘ i.succAbove) v.val
  let L (b : ↥(DeletedFamily (sampleFamily predict x) i)) :=
    mistakeCount y (Function.update w i 0) b.val
  let p := optimizer L σ.temperature c s
  let objSmall := objective l σ.temperature t r
  let objLarge := objective L σ.temperature c s
  have hobj (b) : objSmall (b ∘ e) = objLarge b := deletedObjective_eq predict x i σ y w b
  change optimizer l σ.temperature t r = p ∘ e
  refine minimizer_unique (loss := l) (coeff := t) (restriction := r) hτ
    (fun k => div_nonneg (hc k.1) (Nat.cast_nonneg _)) (optimizer_isLaw _ _ _ _)
    (law_renumber e (optimizer_isLaw _ _ _ _)) (optimizer_min _ _ _ _) ?_
  intro q hq
  let b := q ∘ e.symm
  have hbe : b ∘ e = q := by funext v; simp [b]
  change objSmall (p ∘ e) ≤ objSmall q
  rw [hobj p, ← hbe, hobj b]
  exact optimizer_min L σ.temperature c s b (law_renumber e.symm hq)

/-- The actual full-alphabet law of the learner trained with one observation removed. -/
theorem marginal_deletedTraceSection_optimizer_eq [Nonempty H] (predict : H → X → Bool)
    (x : Fin (n + 1) → X) (i : Fin (n + 1)) (σ : Schedule) (y : Fin (n + 1) → Bool)
    (w : Fin (n + 1) → ℝ) (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) :
    marginal (deletedTraceSection predict x i) (deletedTraceOptimizer (sampleFamily predict x) i σ y w) =
      marginal (extendTrace predict x i.succAbove)
        (traceLaw σ predict (x ∘ i.succAbove) (y ∘ i.succAbove) (w ∘ i.succAbove)) := by
  classical
  rw [traceLaw_deleted_eq predict x i σ y w hτ hc]
  funext v
  simp only [marginal, Finset.sum_filter]
  symm
  refine Fintype.sum_equiv (deletedTraceEquiv predict x i) _ _ (fun u => ?_)
  simp only [deletedTraceSection, Function.comp_apply, Equiv.symm_apply_apply]

end AgnosticVC
