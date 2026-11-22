module

public import Conjectures.AgnosticVC.NullChainObstruction
public import Conjectures.AgnosticVC.Obstruction
public import Mathlib.Probability.Kernel.Composition.MeasureCompProd

/-! Empirical accuracy on every sample, even for kernels measurable only for the
completion of one iid experiment. -/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace AgnosticVC

variable {X H : Type*} [MeasurableSpace X] [MeasurableSpace H] {n : ℕ}

/-- Features have their iid product law and every training label is positive. -/
def positiveLabels (s : Fin n → X) (i : Fin n) : X × Bool := (s i, true)

/-- A learner on the completion of the iid law can miss every training point almost
surely, although some proper hypothesis fits the selected sample perfectly. -/
theorem exists_full_excess_completed_kernel
    (hn : 0 < n) (predict : H → X → Bool)
    (hm : Measurable (fun p : X × H => predict p.2 p.1))
    (D : Measure X) [IsProbabilityMeasure D]
    (hnull : ∀ h, D {x | predict h x = true} = 0)
    (hchain : ∀ a b : H,
      {x | predict a x = true} ⊆ {x | predict b x = true} ∨
      {x | predict b x = true} ⊆ {x | predict a x = true})
    (U : Set X) (hU : D U ≠ 0)
    (hfit : ∀ s : Fin n → X, (∀ i, s i ∈ U) → ∃ h, ∀ i, predict h (s i) = true)
    (K : Kernel (NullMeasurableSpace (Fin n → X) (Measure.pi fun _ : Fin n => D)) H)
    [IsMarkovKernel K] :
    ∃ s : Fin n → X, (∫ h, empiricalError predict (positiveLabels s) h ∂K s) = 1 ∧
      ∃ h, empiricalError predict (positiveLabels s) h = 0 := by
  classical
  let μ := Measure.pi (fun _ : Fin n => D)
  let S := NullMeasurableSpace (Fin n → X) μ
  let read : S → Fin n → X := fun s => s
  have hr : Measurable read := fun _ ht => ht.nullMeasurableSet
  have hread : μ.completion.map read = μ := by
    ext t ht
    exact Measure.map_apply hr ht
  let : IsProbabilityMeasure μ.completion := ⟨by
    change μ Set.univ = 1
    exact measure_univ⟩
  let ν := μ.completion ⊗ₘ K
  have hfst : ν.map Prod.fst = μ.completion := Measure.fst_compProd _ _
  have hall : ∀ᵐ p : S × H ∂ν, ∀ i, predict p.2 (read p.1 i) ≠ true := by
    apply ae_all_iff.mpr
    intro i
    let row : S → X := fun s => read s i
    have hrow : Measurable row := (measurable_pi_apply i).comp hr
    have hmap : ν.map (row ∘ Prod.fst) = D := by
      rw [← Measure.map_map hrow measurable_fst, hfst]
      change μ.completion.map (Function.eval i ∘ read) = D
      rw [← Measure.map_map (measurable_pi_apply i) hr, hread]
      exact (measurePreserving_eval (fun _ : Fin n => D) i).map_eq
    have hz := measure_selfHit_eq_zero_of_null_chain predict hm D hnull hchain ν
      (hrow.comp measurable_fst) measurable_snd hmap
    apply ae_iff.mpr
    simpa [row] using hz
  have halmost := Measure.ae_ae_of_ae_compProd hall
  let box : Set S := Set.univ.pi (fun _ : Fin n => U)
  have hbox : μ.completion box ≠ 0 := by
    change μ (Set.univ.pi (fun _ : Fin n => U)) ≠ 0
    rw [Measure.pi_pi]
    exact Finset.prod_ne_zero_iff.mpr fun _ _ => hU
  obtain ⟨s, hs, hmiss⟩ : ∃ s ∈ box, ∀ᵐ h ∂K s, ∀ i, predict h (read s i) ≠ true := by
    by_contra hf
    apply hbox
    exact measure_mono_null (fun s hs hgood => hf ⟨s, hs, hgood⟩) (ae_iff.mp halmost)
  obtain ⟨a, ha⟩ := hfit (read s) (fun i => hs i (Set.mem_univ i))
  refine ⟨read s, ?_, a, ?_⟩
  · have he : (fun h => empiricalError predict (positiveLabels (read s)) h) =ᵐ[K s]
        (fun _ => (1 : ℝ)) := by
      filter_upwards [hmiss] with h hh
      simp [empiricalError_eq_zeroOne, positiveLabels, hh, Nat.cast_ne_zero.mpr hn.ne']
    rw [integral_congr_ae he]
    simp
  · simp [empiricalError_eq_zeroOne, positiveLabels, ha]

end AgnosticVC
