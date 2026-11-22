module

public import Conjectures.AgnosticVC.IidNullChainExample

/-! The null-chain counterexample on the completion of an iid law of labeled examples. -/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace AgnosticVC

/-- The labeled law with uniform features on the unit interval and label always `true`. -/
noncomputable def positiveUnitIntervalLaw : Measure (unitInterval × Bool) :=
  (volume : Measure unitInterval).map (fun x => (x, true))

instance : IsProbabilityMeasure positiveUnitIntervalLaw := by
  unfold positiveUnitIntervalLaw
  infer_instance

/-- Attaching positive labels is measurable between the two completed iid spaces. -/
theorem measurable_positiveLabels_completion (n : ℕ) :
    Measurable (α := NullMeasurableSpace (Fin n → unitInterval)
        (Measure.pi fun _ : Fin n => (volume : Measure unitInterval)))
      (β := NullMeasurableSpace (Fin n → unitInterval × Bool)
        (Measure.pi fun _ : Fin n => positiveUnitIntervalLaw)) positiveLabels := by
  have hlabel : MeasurePreserving (fun x : unitInterval => (x, true))
      (volume : Measure unitInterval) positiveUnitIntervalLaw :=
    ⟨measurable_id.prodMk measurable_const, rfl⟩
  have hpi : MeasurePreserving (positiveLabels (n := n))
      (Measure.pi fun _ : Fin n => (volume : Measure unitInterval))
      (Measure.pi fun _ : Fin n => positiveUnitIntervalLaw) :=
    measurePreserving_pi _ _ (fun _ => hlabel)
  intro _ hs
  exact NullMeasurableSet.preimage hs hpi.quasiMeasurePreserving

/-- Every Markov kernel measurable on the completion of the labeled iid law has a sample
where expected empirical error is one and the proper empirical minimum is zero. -/
theorem exists_unitInterval_vcOne_labeled_completed_kernel_full_excess :
    ∃ (H : Type) (mH : MeasurableSpace H) (predict : H → unitInterval → Bool),
      letI := mH
      Function.Injective predict ∧ MeasurableSingletonClass H ∧
      Measurable (fun p : unitInterval × H => predict p.2 p.1) ∧
      HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
      ∀ n : ℕ, 0 < n →
        ∀ (K : Kernel (NullMeasurableSpace (Fin n → unitInterval × Bool)
          (Measure.pi fun _ : Fin n => positiveUnitIntervalLaw)) H),
        IsMarkovKernel K →
        ∃ z : Fin n → unitInterval × Bool, (∫ h, empiricalError predict z h ∂K z) = 1 ∧
          ∃ h, empiricalError predict z h = 0 := by
  obtain ⟨H, mH, predict, hi, hsingletons, hm, hvc, hvc0, hobstruction⟩ :=
    exists_unitInterval_vcOne_completed_kernel_full_excess
  refine ⟨H, mH, predict, hi, hsingletons, hm, hvc, hvc0, ?_⟩
  intro n hn K hK
  let L := K.comap positiveLabels (measurable_positiveLabels_completion n)
  have hL : IsMarkovKernel L := ⟨fun s => hK.isProbabilityMeasure (positiveLabels s)⟩
  obtain ⟨s, hloss, hfit⟩ := hobstruction n hn L hL
  exact ⟨positiveLabels s, hloss, hfit⟩

/-- For every proposed constant `c`, and every sample size `n > c²`, no proper kernel
on the completed labeled iid law can attain the VC-one empirical excess rate. -/
theorem exists_unitInterval_vcOne_labeled_completed_kernel_no_rate :
    ∃ (H : Type) (mH : MeasurableSpace H) (predict : H → unitInterval → Bool),
      letI := mH
      Function.Injective predict ∧ MeasurableSingletonClass H ∧
      Measurable (fun p : unitInterval × H => predict p.2 p.1) ∧
      HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
      ∀ (c : ℝ) (n : ℕ), c^2 < (n : ℝ) →
        ∀ (K : Kernel (NullMeasurableSpace (Fin n → unitInterval × Bool)
          (Measure.pi fun _ : Fin n => positiveUnitIntervalLaw)) H),
        IsMarkovKernel K →
        ¬ ∀ z : Fin n → unitInterval × Bool, (∫ h, empiricalError predict z h ∂K z) ≤
          (⨅ h, empiricalError predict z h) + c * Real.sqrt (1 / (n : ℝ)) := by
  obtain ⟨H, mH, predict, hi, hsingletons, hm, hvc, hvc0, hobstruction⟩ :=
    exists_unitInterval_vcOne_labeled_completed_kernel_full_excess
  refine ⟨H, mH, predict, hi, hsingletons, hm, hvc, hvc0, ?_⟩
  intro c n hnc K hK hacc
  have hnR : 0 < (n : ℝ) := (sq_nonneg c).trans_lt hnc
  have hn : 0 < n := by exact_mod_cast hnR
  have hc : c < Real.sqrt (n : ℝ) := by
    by_contra! h
    have hsq := pow_le_pow_left₀ (Real.sqrt_nonneg (n : ℝ)) h 2
    rw [Real.sq_sqrt hnR.le] at hsq
    exact hnc.not_ge hsq
  have he : c * Real.sqrt (1 / (n : ℝ)) < 1 := by
    rw [Real.sqrt_div (by norm_num), Real.sqrt_one, mul_one_div]
    exact (div_lt_one (Real.sqrt_pos.mpr hnR)).mpr hc
  obtain ⟨z, hz, h, hh⟩ := hobstruction n hn K hK
  have hbelow : BddBelow (Set.range (empiricalError predict z)) := by
    refine ⟨0, ?_⟩
    rintro _ ⟨a, rfl⟩
    rw [empiricalError_eq_zeroOne]
    positivity
  have hmin := ciInf_le hbelow h
  rw [hh] at hmin
  have hbound := hacc z
  rw [hz] at hbound
  linarith only [hbound, hmin, he]

end AgnosticVC
