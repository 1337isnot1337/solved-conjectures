module

public import Conjectures.AgnosticVC.BoundedReadoutRates
public import Conjectures.AgnosticVC.IidConditionalKernel
public import Conjectures.AgnosticVC.OriginalKL
public import Mathlib.Probability.Kernel.MeasurableIntegral

/-! For a finite-support learner with a measurable output law, compute
ordinary iid information on the completed experiment. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory ProbabilityTheory Set

variable {X H Ω : Type*} [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableEq H]

private theorem measurable_kernel_singletons (K : Kernel Ω H) [IsMarkovKernel K] :
    Measurable (fun p : Ω × H => K p.1 {p.2}) := by
  let D : Set ((Ω × H) × H) := {p | p.1.2 = p.2}
  have hD : MeasurableSet D := measurableSet_eq_fun (measurable_snd.comp measurable_fst) measurable_snd
  have hm := (K.comap Prod.fst measurable_fst).measurable_kernel_prodMk_left hD
  convert hm using 1
  funext p
  change K p.1 {p.2} = K p.1 (Prod.mk p ⁻¹' D)
  congr 1
  ext h
  simp [D, eq_comm]

omit [MeasurableSpace Ω] in
private theorem logRatio_integral_eq (p q : PMF H) (hp : p.support.Finite) :
    (∫ h, Real.log ((p h).toReal / (q h).toReal) ∂p.toMeasure) =
      ∑' h, (p h).toReal * Real.log ((p h).toReal / (q h).toReal) := by
  have hi : Integrable (fun h => Real.log ((p h).toReal / (q h).toReal)) p.toMeasure := by
    simpa only [IntegrableOn, PMF.restrict_toMeasure_support] using
      (IntegrableOn.of_finite (μ := p.toMeasure)
        (f := fun h => Real.log ((p h).toReal / (q h).toReal)) hp)
  rw [PMF.integral_eq_tsum _ _ hi]
  simp only [smul_eq_mul]

/-- The actual named-output information is measurable when the joint law is
a kernel with finite-support outputs. -/
theorem measurable_originalPoolInformation_of_joint_kernel
    {n : ℕ} (A : (Fin n → X × Bool) → PMF H) (pool : Ω → Pool n X)
    (J : Kernel Ω (SteinkeZakynthinou.Selector n × H))
    (hJ : ∀ z, J z = (originalPoolJoint A (pool z)).toMeasure)
    (hf : ∀ z, (originalPoolJoint A (pool z)).support.Finite) :
    Measurable (fun z => originalPoolInformation A (pool z)) := by
  let : IsMarkovKernel J := ⟨fun z => hJ z ▸ inferInstance⟩
  let Q := (J.map Prod.fst) ×ₖ (J.map Prod.snd)
  let : MeasurableEq (SteinkeZakynthinou.Selector n × H) := ⟨by
    rw [show diagonal (SteinkeZakynthinou.Selector n × H) =
        {p | p.1.1 = p.2.1} ∩ {p | p.1.2 = p.2.2} by
      ext p; simp [diagonal, Prod.ext_iff]]
    exact (measurableSet_eq_fun (measurable_fst.comp measurable_fst) (measurable_fst.comp measurable_snd)).inter
      (measurableSet_eq_fun (measurable_snd.comp measurable_fst) (measurable_snd.comp measurable_snd))⟩
  have hQ (z : Ω) : Q z = (originalPoolMarginalProduct A (pool z)).toMeasure := by
    rw [originalPoolMarginalProduct_toMeasure_eq_prod]
    unfold Q
    rw [Kernel.prod_apply, Kernel.map_apply _ measurable_fst, Kernel.map_apply _ measurable_snd, hJ]
  let : IsMarkovKernel Q := ⟨fun z => hQ z ▸ inferInstance⟩
  let f (p : Ω × (SteinkeZakynthinou.Selector n × H)) :=
    Real.log ((J p.1 {p.2}).toReal / (Q p.1 {p.2}).toReal)
  have hm : Measurable f := ((measurable_kernel_singletons J).ennreal_toReal.div
    (measurable_kernel_singletons Q).ennreal_toReal).log
  have he (z : Ω) : (∫ a, f (z,a) ∂J z) = originalPoolInformation A (pool z) := by
    simp only [f, hJ, hQ, PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]
    exact logRatio_integral_eq _ _ (hf z)
  simpa only [he] using (hm.stronglyMeasurable.integral_kernel_prod_right' (κ := J)).measurable

omit [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableEq H] in
theorem BoundedTraceReadout.learn_support_finite {n d k : ℕ} [Nonempty H]
    {predict : H → X → Bool} (r : BoundedTraceReadout predict k) (hd : 0 < d) (hn : d ≤ n)
    (z : Fin n → X × Bool) : (r.learn hd hn z).support.Finite := by
  apply (finite_range (r.represent (Prod.fst ∘ z))).subset
  intro h hh
  unfold BoundedTraceReadout.learn traceReadoutLearner at hh
  rw [PMF.mem_support_map_iff] at hh
  obtain ⟨a,_,ha⟩ := hh
  exact ⟨a,ha⟩

omit [MeasurableSpace Ω] in
/-- Information bound for the proper learner on an iid completed law. Its
information is the integral of the literal KL of the actual joint and product
of marginals. The kernel assumption is on this same learner. -/
theorem BoundedTraceReadout.learn_iid_le [MeasurableSpace X] [Nonempty H]
    {d m k : ℕ} {predict : H → X → Bool} (r : BoundedTraceReadout predict k)
    (hd : 0 < d) (hn : d ≤ m+1) (hvc : HasVCDimensionAtMost predict d)
    (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (hr : Measurable (fun z : NullMeasurableSpace (Fin (m+1) → X × Bool)
      (Measure.pi fun _ : Fin (m+1) => D) => (r.learn hd hn z).toMeasure)) :
    let μ := Measure.pi fun _ : Fin (m+1) × Bool => D
    let A := r.learn hd hn
    let info z := (InformationTheory.klDiv (originalPoolJoint A z).toMeasure
      (originalPoolMarginalProduct A z).toMeasure).toReal
    Integrable info μ ∧ (∫ z, info z ∂μ) ≤ 197120 * (d : ℝ) + 32 * (k : ℝ) := by
  intro μ A info
  have hf (z : Pool (m+1) X) : (originalPoolJoint A z).support.Finite := by
    apply (finite_iUnion (fun s : SteinkeZakynthinou.Selector (m+1) =>
      (r.learn_support_finite hd hn (fun i => z (i,s i))).image (Prod.mk s))).subset
    rintro ⟨s,h⟩ hh
    rw [PMF.mem_support_iff, originalPoolJoint_apply, mul_ne_zero_iff] at hh
    exact mem_iUnion.mpr ⟨s,h,(PMF.mem_support_iff _ _).mpr hh.2,rfl⟩
  obtain ⟨K,J,_,_,_,hJ,_⟩ := exists_completed_iid_joint_kernel D A hr
  have hm : Measurable (fun z : IidCompletedPool (m+1) D => originalPoolInformation A z) :=
    measurable_originalPoolInformation_of_joint_kernel A (fun z : IidCompletedPool (m+1) D => z) J hJ hf
  have he (z : Pool (m+1) X) : info z = originalPoolInformation A z :=
    (originalPoolInformation_eq_klDiv_of_finite_support A z (hf z)).2
  have hm' : AEMeasurable info μ := by
    have hc : Measurable (fun z : IidCompletedPool (m+1) D => info z) := by
      convert hm using 1
      exact funext (fun z : IidCompletedPool (m+1) D => he z)
    exact (show NullMeasurable info μ from fun _ hs => hc hs).aemeasurable
  let C : ℝ := 197120 * (d : ℝ) + 32 * (k : ℝ)
  have hbound (z : Pool (m+1) X) : info z ≤ C := by
    rw [he]
    exact r.learn_fixedPairing_le hd hn hvc z
  have hi : Integrable info μ := Integrable.of_bound hm'.aestronglyMeasurable C
    (Filter.Eventually.of_forall (fun z => (Real.norm_of_nonneg ENNReal.toReal_nonneg).trans_le (hbound z)))
  refine ⟨hi,?_⟩
  have h := integral_mono hi (integrable_const (μ := μ) C) hbound
  simpa [μ] using h

end AgnosticVC
