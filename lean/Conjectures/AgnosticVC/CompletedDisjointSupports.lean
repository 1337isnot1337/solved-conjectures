module

public import Conjectures.AgnosticVC.CompletedKernel
public import Conjectures.AgnosticVC.FullOuterMatching
public import Mathlib.Probability.Kernel.MeasurableIntegral

/-! With countable sections for pairs of positive predictions, the samplewise
empirical rate can fail solely from requiring measurable expected loss. -/

@[expose] public section

open Set MeasureTheory ProbabilityTheory
open scoped BigOperators

namespace AgnosticVC

variable {X H : Type*} [MeasurableSpace X] [MeasurableSpace H]

private theorem iid_measure_eq_section_integral {n : ℕ}
    (D : Measure X) [IsProbabilityMeasure D]
    (j : Fin (n + 1)) {B : Set (Fin (n + 1) → X)} (hB : MeasurableSet B) :
    (Measure.pi fun _ : Fin (n + 1) => D) B =
        ∫⁻ r, D {a : X | (MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) j).symm
          (a,r) ∈ B} ∂(Measure.pi fun _ : Fin n => D) := by
  let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) j
  let C := e.symm ⁻¹' B
  have hC : MeasurableSet C := e.symm.measurable hB
  have hmap := (measurePreserving_piFinSuccAbove (fun _ : Fin (n + 1) => D) j).map_eq
  have hpre : e ⁻¹' C = B := by
    ext x
    change e.symm (e x) ∈ B ↔ x ∈ B
    rw [e.symm_apply_apply]
  change (Measure.pi fun _ : Fin (n + 1) => D).map e = D.prod (Measure.pi fun _ : Fin n => D) at hmap
  conv_lhs => rw [← hpre, ← Measure.map_apply e.measurable hC, hmap, Measure.prod_apply_symm hC]
  rfl

/-- Every positive measurable set of iid samples contains a sample avoiding
all pairs in a relation with countable sections. The relation itself can be
nonmeasurable. -/
theorem exists_iid_sample_avoiding_countable_sections
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D]
    (R : X → X → Prop) (hR : ∀ x, {y | R x y}.Countable) (hsymm : ∀ ⦃x y⦄, R x y → R y x) :
    ∀ (n : ℕ) (B : Set (Fin n → X)), MeasurableSet B →
      (Measure.pi fun _ : Fin n => D) B ≠ 0 →
      ∃ s ∈ B, ∀ i j, i ≠ j → ¬ R (s i) (s j) := by
  classical
  intro n
  induction n with
  | zero =>
    intro B _ hB
    have hne : B.Nonempty := nonempty_iff_ne_empty.mpr fun he => hB (by rw [he, measure_empty])
    obtain ⟨s,hs⟩ := hne
    exact ⟨s,hs,fun i => Fin.elim0 i⟩
  | succ n ih =>
    intro B hm hp
    let j : Fin (n + 1) := 0
    let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) j
    let C := e.symm ⁻¹' B
    have hmC : MeasurableSet C := e.symm.measurable hm
    let A (r : Fin n → X) := {a : X | (a,r) ∈ C}
    let E := {r | D (A r) ≠ 0}
    have hmA : Measurable (fun r => D (A r)) := measurable_measure_prodMk_right hmC
    have hmE : MeasurableSet E := (measurableSet_eq_fun hmA measurable_const).compl
    have hpE : (Measure.pi fun _ : Fin n => D) E ≠ 0 := by
      intro hz
      apply hp
      rw [iid_measure_eq_section_integral D j hm]
      apply (lintegral_eq_zero_iff hmA).mpr
      exact ae_iff.mpr hz
    obtain ⟨r,hr,hgood⟩ := ih E hmE hpE
    let F : Set X := ⋃ k : Fin n, {a | R (r k) a}
    have hF : F.Countable := countable_iUnion fun k => hR (r k)
    obtain ⟨a,ha,hnot⟩ : ∃ a ∈ A r, a ∉ F := by
      by_contra! h
      exact hr (measure_mono_null h (hF.measure_zero D))
    let s := e.symm (a,r)
    have hs₁ : s j = a := by simp [s, e]
    have hs₂ (k : Fin n) : s (j.succAbove k) = r k := by simp [s, e]
    refine ⟨s,ha,?_⟩
    intro p q hpq hpqR
    rcases Fin.eq_self_or_eq_succAbove j p with rfl | ⟨i,rfl⟩ <;>
      rcases Fin.eq_self_or_eq_succAbove j q with rfl | ⟨k,rfl⟩
    · exact hpq rfl
    · rw [hs₁, hs₂] at hpqR
      exact hnot (mem_iUnion.mpr ⟨k, hsymm hpqR⟩)
    · rw [hs₂, hs₁] at hpqR
      exact hnot (mem_iUnion.mpr ⟨i, hpqR⟩)
    · rw [hs₂, hs₂] at hpqR
      exact hgood i k (fun he => hpq (congrArg j.succAbove he)) hpqR

omit [MeasurableSpace X] [MeasurableSpace H] in
private theorem empiricalError_ge_of_atMostOneHit {n : ℕ}
    (predict : H → X → Bool) (s : Fin (n + 1) → X) (h : H)
    (hh : ∀ i j : Fin (n + 1), i ≠ j →
      ¬ (predict h (s i) = true ∧ predict h (s j) = true)) :
    1 - 1 / (n + 1 : ℝ) ≤ empiricalError predict (positiveLabels s) h := by
  classical
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

omit [MeasurableSpace H] in
/-- The completed-iid obstruction already applies to the scalar expected loss,
with no measurable structure or probability kernel on the hypothesis space. -/
theorem exists_bad_sample_of_aemeasurable_empirical_loss {n : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D]
    (predict : H → X → Bool)
    (hsections : ∀ x : X, {y : X | ∃ h, predict h x = true ∧ predict h y = true}.Countable)
    (T : Set (Fin (n + 1) → X)) (hT : (Measure.pi fun _ : Fin (n + 1) => D) T ≠ 0)
    (hfit : ∀ s ∈ T, ∃ h, ∀ i, predict h (s i) = true)
    (r : (Fin (n + 1) → X) → ℝ) (hr : AEMeasurable r (Measure.pi fun _ : Fin (n + 1) => D))
    (hbound : ∀ s a, (∀ h, a ≤ empiricalError predict (positiveLabels s) h) → a ≤ r s) :
    ∃ s : Fin (n + 1) → X, 1 - 1 / (n + 1 : ℝ) ≤ r s ∧
      ∃ h, empiricalError predict (positiveLabels s) h = 0 := by
  let μ := Measure.pi fun _ : Fin (n + 1) => D
  let a : ℝ := 1 - 1 / (n + 1 : ℝ)
  let R (x y : X) := ∃ h, predict h x = true ∧ predict h y = true
  let E := r ⁻¹' Iio a
  have hm : NullMeasurableSet E μ := hr.nullMeasurableSet_preimage measurableSet_Iio
  obtain ⟨B,hBE,hB,hEq⟩ := NullMeasurableSet.exists_measurable_subset_ae_eq hm
  have hB0 : μ B = 0 := by
    by_contra hp
    have hsymm : ∀ ⦃x y⦄, R x y → R y x := by
      rintro _ _ ⟨h,hx,hy⟩
      exact ⟨h,hy,hx⟩
    obtain ⟨s,hs,hgood⟩ := exists_iid_sample_avoiding_countable_sections D R hsections hsymm
      (n + 1) B hB hp
    have hge := hbound s a (fun h => empiricalError_ge_of_atMostOneHit predict s h
      (fun i j hij hh => hgood i j hij ⟨h,hh⟩))
    exact not_lt_of_ge hge (hBE hs)
  have hE0 : μ E = 0 := (measure_congr (μ := μ) hEq).symm.trans hB0
  obtain ⟨s,hs,hsE⟩ : ∃ s ∈ T, s ∉ E := by
    by_contra! h
    exact hT (measure_mono_null h hE0)
  obtain ⟨w,hw⟩ := hfit s hs
  exact ⟨s, le_of_not_gt hsE, w, by simp [empiricalError_eq_zeroOne, positiveLabels, hw]⟩

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
  let μ := Measure.pi fun _ : Fin (n + 1) => D
  let S := NullMeasurableSpace (Fin (n + 1) → X) μ
  let read : S → Fin (n + 1) → X := fun s => s
  have hr : Measurable read := fun _ ht => ht.nullMeasurableSet
  have hmeas : Measurable (fun p : S × H => empiricalError predict (positiveLabels (read p.1)) p.2) := by
    simp only [empiricalError_eq_zeroOne, positiveLabels]
    apply Measurable.div_const
    apply Finset.measurable_sum
    intro i _
    have hp : Measurable (fun p : S × H => predict p.2 (read p.1 i)) :=
      hm.comp (((measurable_pi_apply i).comp (hr.comp measurable_fst)).prodMk measurable_snd)
    exact Measurable.ite (measurableSet_eq_fun hp measurable_const) measurable_const measurable_const
  let r (s : Fin (n + 1) → X) := ∫ h, empiricalError predict (positiveLabels s) h ∂K s
  have hmr : AEMeasurable r μ := by
    have h : Measurable (α := S) r :=
      hmeas.stronglyMeasurable.integral_kernel_prod_right'.measurable
    exact (show NullMeasurable r μ from h).aemeasurable
  refine exists_bad_sample_of_aemeasurable_empirical_loss D predict hsections T hT hfit r hmr ?_
  intro s a ha
  let s' : S := s
  let : IsProbabilityMeasure (K s') := inferInstance
  have hi := empiricalError_integrable_of_joint_measurable predict hm (positiveLabels s) (K s')
  simpa [r] using integral_mono (integrable_const (μ := K s') a) hi ha

end AgnosticVC
