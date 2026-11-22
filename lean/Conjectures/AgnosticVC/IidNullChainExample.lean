module

public import Conjectures.AgnosticVC.CompletedKernel
public import Conjectures.AgnosticVC.NullChain
public import Conjectures.AgnosticVC.NullChainDimension

/-! A VC-one class with jointly measurable evaluation obstructs even kernels on the
completion of a fixed iid law. -/

@[expose] public section

open MeasureTheory ProbabilityTheory Set

namespace AgnosticVC

/-- For the uniform law on the unit interval with labels fixed to one, there is a
proper VC-one class such that every learner on the completion of an iid feature law
has expected empirical error one on a sample that a hypothesis fits perfectly. -/
theorem exists_unitInterval_vcOne_completed_kernel_full_excess :
    ∃ (H : Type) (mH : MeasurableSpace H) (predict : H → unitInterval → Bool),
      letI := mH
      Function.Injective predict ∧
      MeasurableSingletonClass H ∧
      Measurable (fun p : unitInterval × H => predict p.2 p.1) ∧
      HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
      ∀ n : ℕ, 0 < n →
        ∀ (K : Kernel (NullMeasurableSpace (Fin n → unitInterval)
          (Measure.pi fun _ : Fin n => (volume : Measure unitInterval))) H),
        IsMarkovKernel K →
        ∃ s : Fin n → unitInterval, (∫ h, empiricalError predict (positiveLabels s) h ∂K s) = 1 ∧
          ∃ h, empiricalError predict (positiveLabels s) h = 0 := by
  classical
  obtain ⟨C, hC, hG, hzero, hU⟩ := exists_unitInterval_nullGdelta_chain
  let gdelta (s : Set unitInterval) (hs : s ∈ C) : IsGδ s := (hG s hs).1
  let mH := nullChainMeasurableSpace gdelta
  let predict := nullChainPredict (C := C)
  have hsupport (h : C) : {x | predict h x = true} = h.val := by
    ext x
    exact nullChainPredict_eq_true h x
  have hchain (a b : C) :
      {x | predict a x = true} ⊆ {x | predict b x = true} ∨
      {x | predict b x = true} ⊆ {x | predict a x = true} := by
    rw [hsupport, hsupport]
    exact hC.total a.property b.property
  have hcovered (x : unitInterval) (hx : x ∈ ⋃₀ C) : ∃ h, predict h x = true := by
    obtain ⟨s, hs, hxs⟩ := mem_sUnion.mp hx
    exact ⟨⟨s, hs⟩, (nullChainPredict_eq_true _ _).mpr hxs⟩
  have hnonempty : (⋃₀ C).Nonempty :=
    nonempty_iff_ne_empty.mpr fun h => hU (h ▸ measure_empty)
  obtain ⟨x, hx⟩ := hnonempty
  obtain ⟨a, ha⟩ := hcovered x hx
  have hzeroPredict : ∃ h, ∀ x, predict h x = false := by
    refine ⟨⟨∅, hzero⟩, fun x => ?_⟩
    rw [← Bool.not_eq_true]
    simp [predict]
  refine ⟨C, mH, predict, injective_nullChainPredict, measurableSingletonClass_nullChain gdelta,
    measurable_nullChainPredict gdelta, nullChain_vc_le_one _ hchain,
    nullChain_vc_not_zero _ hzeroPredict ⟨x, a, ha⟩, ?_⟩
  intro n hn K hK
  let _ : IsMarkovKernel K := hK
  let _ : Nonempty C := ⟨⟨∅, hzero⟩⟩
  exact exists_full_excess_completed_kernel hn predict (measurable_nullChainPredict gdelta) volume
    (fun h => by rw [hsupport]; exact (hG h.val h.property).2) hchain (⋃₀ C) hU
    (fun s hs => nullChain_exists_fits predict hchain s fun i => hcovered (s i) (hs i)) K

end AgnosticVC
