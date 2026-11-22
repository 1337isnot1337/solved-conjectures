module

public import Conjectures.AgnosticVC.PairedDeletion
public import Mathlib.Probability.Distributions.Bernoulli

/-! Measurability on the completion of a fair-labeled iid law supplies fixed-label
readouts on any injectively indexed subtuple. -/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace AgnosticVC

/-- The law that gives equal probability to the two Boolean labels. -/
noncomputable abbrev iidFairLabels : Measure Bool :=
  bernoulliMeasure true false ⟨(1 / 2 : ℝ), by constructor <;> norm_num⟩

/-- Label a feature drawn from `D` independently by a fair bit. -/
noncomputable abbrev iidFairLabelLaw {X : Type*} [MeasurableSpace X]
    (D : Measure X) : Measure (X × Bool) :=
  D.prod iidFairLabels

private theorem dirac_absolutelyContinuous_iidFairLabels (b : Bool) :
    Measure.dirac b ≪ iidFairLabels := by
  have hpos : iidFairLabels {b} ≠ 0 := by
    classical
    rw [bernoulliMeasure_apply _ (measurableSet_singleton b)]
    let half : NNReal := ⟨(1 / 2 : ℝ), by norm_num⟩
    have hhalf : (↑half : ENNReal) ≠ 0 := by
      rw [ENNReal.coe_ne_zero, ← NNReal.coe_ne_zero]
      change (1 / 2 : ℝ) ≠ 0
      norm_num
    cases b <;> norm_num [unitInterval.toNNReal, unitInterval.symm] <;> exact hhalf
  intro s hs
  by_cases hb : b ∈ s
  · exact (hpos (measure_mono_null (Set.singleton_subset_iff.mpr hb) hs)).elim
  · simp [hb]

private theorem piFin_absolutelyContinuous {Z : Type*} [MeasurableSpace Z] {m : ℕ}
    (μ ν : Fin m → Measure Z) [∀ i, SigmaFinite (μ i)] [∀ i, SigmaFinite (ν i)]
    (h : ∀ i, μ i ≪ ν i) : Measure.pi μ ≪ Measure.pi ν := by
  induction m with
  | zero =>
    rw [Subsingleton.elim μ ν]
  | succ m ih =>
    let i : Fin (m + 1) := 0
    let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (m + 1) => Z) i
    have hμ := (measurePreserving_piFinSuccAbove μ i).symm e
    have hν := (measurePreserving_piFinSuccAbove ν i).symm e
    have hprod := (h i).prod (ih (fun j => μ (i.succAbove j))
      (fun j => ν (i.succAbove j)) (fun j => h (i.succAbove j)))
    rw [← hμ.map_eq, ← hν.map_eq]
    exact hprod.map e.symm.measurable

/-- A function measurable on the completed fair-labeled iid experiment can be read at
any prescribed labels on an injectively indexed subtuple of a different iid experiment
with the same feature marginal. The actual labels of that experiment may be dependent
on the features. -/
theorem iid_fixedLabel_readout_measurable {X H I : Type*} [MeasurableSpace X]
    [MeasurableSpace H] [Fintype I] {m : ℕ}
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (e : Fin m → I) (he : Function.Injective e) (labels : Fin m → Bool)
    (learn : (Fin m → X × Bool) → H)
    (hlearn : Measurable (fun z : NullMeasurableSpace (Fin m → X × Bool)
      (Measure.pi fun _ : Fin m => iidFairLabelLaw (D.map Prod.fst)) => learn z)) :
    Measurable (fun z : NullMeasurableSpace (I → X × Bool) (Measure.pi fun _ : I => D) =>
      learn (fun i => ((z (e i)).1, labels i))) := by
  let μ := D.map Prod.fst
  have : IsProbabilityMeasure μ := inferInstanceAs (IsProbabilityMeasure (D.map Prod.fst))
  let mark (i : Fin m) (p : X × Bool) := (p.1, labels i)
  have hm (i : Fin m) : Measurable (mark i) := measurable_fst.prodMk measurable_const
  have hrow (i : Fin m) : D.map (mark i) = μ.prod (Measure.dirac (labels i)) := by
    rw [Measure.prod_dirac, Measure.map_map measurable_prodMk_right measurable_fst]
    rfl
  have (i : Fin m) : SigmaFinite (D.map (mark i)) := by
    rw [hrow i]
    infer_instance
  have hsub := measurePreserving_subtuple D e he
  let assemble (z : Fin m → X × Bool) (i : Fin m) := mark i (z i)
  have hassemble : Measurable assemble := .of_eval fun i => (hm i).comp (measurable_pi_apply i)
  have hquasi : QuasiMeasurePreserving (assemble ∘ (fun z : I → X × Bool => z ∘ e))
      (Measure.pi fun _ : I => D) (Measure.pi fun _ : Fin m => iidFairLabelLaw μ) := by
    refine ⟨hassemble.comp hsub.measurable, ?_⟩
    rw [← Measure.map_map hassemble hsub.measurable, hsub.map_eq]
    change (Measure.pi fun _ : Fin m => D).map (fun z i => mark i (z i)) ≪ _
    rw [Measure.pi_map_pi fun i => (hm i).aemeasurable]
    apply piFin_absolutelyContinuous
    intro i
    rw [hrow i]
    exact Measure.AbsolutelyContinuous.rfl.prod (dirac_absolutelyContinuous_iidFairLabels _)
  intro s hs
  have hnull : NullMeasurableSet (learn ⁻¹' s)
      (Measure.pi fun _ : Fin m => iidFairLabelLaw μ) := hlearn hs
  exact hnull.preimage hquasi

end AgnosticVC
