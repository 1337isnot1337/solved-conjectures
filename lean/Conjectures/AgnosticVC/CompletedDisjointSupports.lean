module

public import Conjectures.AgnosticVC.CompletedKernel
public import Conjectures.AgnosticVC.FullOuterMatching

/-! With pairwise disjoint null supports, a completed-measurable learner can hit
at most one iid row almost surely, even if a proper perfect fit exists on a set
of positive outer probability. -/

@[expose] public section

open Set MeasureTheory ProbabilityTheory
open scoped BigOperators

namespace AgnosticVC

variable {X H : Type*} [MeasurableSpace X] [MeasurableSpace H]

private theorem measure_zero_of_countable_iid_sections {n : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D]
    (j : Fin (n + 1)) {B : Set (Fin (n + 1) → X)} (hB : MeasurableSet B)
    (hcount : ∀ r : Fin n → X,
      {a : X | (MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) j).symm (a,r) ∈ B}.Countable) :
    (Measure.pi fun _ : Fin (n + 1) => D) B = 0 := by
  let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) j
  let C := e.symm ⁻¹' B
  have hC : MeasurableSet C := e.symm.measurable hB
  have hmap := (measurePreserving_piFinSuccAbove (fun _ : Fin (n + 1) => D) j).map_eq
  have hpre : e ⁻¹' C = B := by
    ext x
    change e.symm (e x) ∈ B ↔ x ∈ B
    rw [e.symm_apply_apply]
  change (Measure.pi fun _ : Fin (n + 1) => D).map e = D.prod (Measure.pi fun _ : Fin n => D) at hmap
  rw [← hpre, ← Measure.map_apply e.measurable hC, hmap, Measure.prod_apply_symm hC]
  have hzero (r : Fin n → X) : D ((fun a => (a,r)) ⁻¹' C) = 0 := (hcount r).measure_zero D
  simp [hzero]

private theorem aemeasurable_kernel_hits_no_pair {n : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D]
    (predict : H → X → Bool) (hm : Measurable (fun p : X × H => predict p.2 p.1))
    (hsections : ∀ x : X, {y : X | ∃ h, predict h x = true ∧ predict h y = true}.Countable)
    (K : Kernel (NullMeasurableSpace (Fin (n + 1) → X) (Measure.pi fun _ : Fin (n + 1) => D)) H)
    [IsMarkovKernel K] (i j : Fin (n + 1)) (hij : i ≠ j) :
    ∀ᵐ s ∂(Measure.pi fun _ : Fin (n + 1) => D).completion,
      ∀ᵐ h ∂K s, ¬ (predict h (s i) = true ∧ predict h (s j) = true) := by
  let μ := Measure.pi fun _ : Fin (n + 1) => D
  let S := NullMeasurableSpace (Fin (n + 1) → X) μ
  let read : S → Fin (n + 1) → X := fun s => s
  have hr : Measurable read := fun _ ht => ht.nullMeasurableSet
  let A : Set (S × H) := {p | predict p.2 (read p.1 i) = true ∧ predict p.2 (read p.1 j) = true}
  have hp (k : Fin (n + 1)) : Measurable (fun p : S × H => predict p.2 (read p.1 k)) :=
    hm.comp (((measurable_pi_apply k).comp (hr.comp measurable_fst)).prodMk measurable_snd)
  have hA : MeasurableSet A := (measurableSet_eq_fun (hp i) measurable_const).inter
    (measurableSet_eq_fun (hp j) measurable_const)
  let p (s : S) := K s (Prod.mk s ⁻¹' A)
  have hpm : Measurable p := K.measurable_kernel_prodMk_left hA
  let E : Set S := {s | p s ≠ 0}
  have hE : MeasurableSet E := (measurableSet_eq_fun hpm measurable_const).compl
  obtain ⟨B,hBE,hB,hEq⟩ := NullMeasurableSet.exists_measurable_subset_ae_eq hE
  have hzero : μ B = 0 := by
    apply measure_zero_of_countable_iid_sections D j hB
    intro r
    rcases Fin.eq_self_or_eq_succAbove j i with he | ⟨k,hk⟩
    · exact (hij he).elim
    · apply (hsections (r k)).mono
      intro a ha
      let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) j
      let s := e.symm (a,r)
      have hb : s ∈ B := ha
      have hs : p s ≠ 0 := hBE hb
      have hne : (Prod.mk s ⁻¹' A).Nonempty := by
        apply nonempty_iff_ne_empty.mpr
        intro h
        apply hs
        change K s (Prod.mk s ⁻¹' A) = 0
        rw [h, measure_empty]
      obtain ⟨h,hh⟩ := hne
      have hpairs : predict h (s i) = true ∧ predict h (s j) = true := hh
      refine ⟨h, ?_, ?_⟩
      · rw [hk] at hpairs
        simpa [s, e] using hpairs.1
      · simpa [s, e] using hpairs.2
  have hezero : μ E = 0 := (measure_congr (μ := μ) hEq).symm.trans hzero
  apply Filter.Eventually.mono (ae_iff.mpr (show μ.completion E = 0 from hezero))
  intro s hs
  apply ae_iff.mpr
  simpa [p, A, read] using hs

/-- A positive outer-probability family of samples has a perfect fit. If every
pair-coincidence section is countable, any completed-measurable kernel incurs
empirical loss at least `1 - 1/(n+1)` on one such sample. -/
theorem exists_atMostOneHit_completed_kernel {n : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D]
    (predict : H → X → Bool) (hm : Measurable (fun p : X × H => predict p.2 p.1))
    (hsections : ∀ x : X, {y : X | ∃ h, predict h x = true ∧ predict h y = true}.Countable)
    (T : Set (Fin (n + 1) → X)) (hT : (Measure.pi fun _ : Fin (n + 1) => D) T ≠ 0)
    (hfit : ∀ s ∈ T, ∃ h, ∀ i, predict h (s i) = true)
    (K : Kernel (NullMeasurableSpace (Fin (n + 1) → X) (Measure.pi fun _ : Fin (n + 1) => D)) H)
    [IsMarkovKernel K] :
    ∃ s : Fin (n + 1) → X,
      1 - 1 / (n + 1 : ℝ) ≤ (∫ h, empiricalError predict (positiveLabels s) h ∂K s) ∧
      ∃ h, empiricalError predict (positiveLabels s) h = 0 := by
  classical
  let μ := Measure.pi fun _ : Fin (n + 1) => D
  have hrows : ∀ᵐ s ∂μ.completion, ∀ᵐ h ∂K s,
      ∀ i j : Fin (n + 1), i ≠ j → ¬ (predict h (s i) = true ∧ predict h (s j) = true) := by
    simp only [ae_all_iff]
    intro i j hij
    exact aemeasurable_kernel_hits_no_pair D predict hm hsections K i j hij
  obtain ⟨s,hs,hsrows⟩ : ∃ s ∈ T, ∀ᵐ h ∂K s, ∀ i j : Fin (n + 1), i ≠ j →
      ¬ (predict h (s i) = true ∧ predict h (s j) = true) := by
    by_contra h
    exact hT (measure_mono_null (fun s hs hgood => h ⟨s,hs,hgood⟩) (ae_iff.mp hrows))
  obtain ⟨w,hw⟩ := hfit s hs
  refine ⟨s, ?_, w, by simp [empiricalError_eq_zeroOne, positiveLabels, hw]⟩
  have hb : ∀ᵐ h ∂K s, 1 - 1 / (n + 1 : ℝ) ≤ empiricalError predict (positiveLabels s) h := by
    filter_upwards [hsrows] with h hh
    let F := Finset.univ.filter (fun i : Fin (n + 1) => predict h (s i) = true)
    have hF : F.card ≤ 1 := Finset.card_le_one_iff.mpr (fun {a b} ha hb => by
      by_contra hne
      exact hh a b hne ⟨(Finset.mem_filter.mp ha).2,(Finset.mem_filter.mp hb).2⟩)
    have hA : (∑ i : Fin (n + 1), if predict h (s i) = true then (0 : ℝ) else 1) =
        (n + 1 : ℝ) - F.card := by
      have hi (i : Fin (n + 1)) : (if predict h (s i) = true then (0 : ℝ) else 1) =
          1 - (if predict h (s i) = true then (1 : ℝ) else 0) := by split <;> norm_num
      simp_rw [hi, Finset.sum_sub_distrib, ← Finset.sum_filter]
      simp [F]
    have hN : 0 < (n + 1 : ℝ) := by positivity
    have hle : (F.card : ℝ) ≤ 1 := by exact_mod_cast hF
    rw [empiricalError_eq_zeroOne, Nat.cast_add, Nat.cast_one]
    change _ ≤ (∑ i : Fin (n + 1), if predict h (s i) = true then (0 : ℝ) else 1) / (n + 1 : ℝ)
    rw [hA, sub_div, div_self hN.ne']
    exact sub_le_sub_left (div_le_div_of_nonneg_right hle hN.le) _
  let s' : NullMeasurableSpace (Fin (n + 1) → X) μ := s
  let : IsProbabilityMeasure (K s') := inferInstance
  have hh := integral_mono_ae (integrable_const (μ := K s') (1 - 1 / (n + 1 : ℝ)))
    (empiricalError_integrable_of_joint_measurable predict hm (positiveLabels s) (K s')) hb
  simpa using hh

end AgnosticVC
