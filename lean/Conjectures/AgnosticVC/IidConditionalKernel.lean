module

public import Conjectures.AgnosticVC.IidOrderedRates
public import Mathlib.Probability.Kernel.Composition.MeasureCompProd

/-! Construct the conditional selector/output kernel on the completed iid pool,
starting from a kernel on completed training samples. -/

@[expose] public section

open MeasureTheory ProbabilityTheory SteinkeZakynthinou

namespace AgnosticVC

variable {X H : Type*} [MeasurableSpace X] [MeasurableSpace H] {n : ℕ}

/-- The completed source of the conditional selector/output experiment. -/
abbrev IidCompletedPool (n : ℕ) (D : Measure (X × Bool)) :=
  NullMeasurableSpace (AgnosticVC.Pool n X) (Measure.pi fun _ : Fin n × Bool => D)

private theorem measurable_between_completions {B C : Type*} [MeasurableSpace B] [MeasurableSpace C]
    {μ : Measure B} {ν : Measure C} {f : B → C} (h : MeasurePreserving f μ ν) :
    @Measurable (NullMeasurableSpace B μ) (NullMeasurableSpace C ν)
      (NullMeasurableSpace.instMeasurableSpace) (NullMeasurableSpace.instMeasurableSpace) f := by
  intro _ ht
  exact NullMeasurableSet.preimage ht h.quasiMeasurePreserving

/-- One first draws the selector independently of the completed pool, then runs the
learner on its selected rows. Conditioning this experiment on the pool gives the
whole-hypothesis joint law used in the KL formula. -/
theorem exists_completed_iid_joint_kernel (D : Measure (X × Bool)) [IsProbabilityMeasure D]
    (A : (Fin n → X × Bool) → PMF H)
    (hA : Measurable (fun z : NullMeasurableSpace (Fin n → X × Bool)
      (Measure.pi fun _ : Fin n => D) => (A z).toMeasure)) :
    ∃ (K : Kernel (IidCompletedPool n D × Selector n) H)
      (J : Kernel (IidCompletedPool n D) (Selector n × H)),
      IsMarkovKernel K ∧ IsMarkovKernel J ∧
      (∀ w s, K (w,s) = (A (fun i => w (i,s i))).toMeasure) ∧
      (∀ w, J w = (originalPoolJoint A w).toMeasure) ∧
      ∀ μ : Measure (IidCompletedPool n D), [SFinite μ] →
        (μ ⊗ₘ J).map MeasurableEquiv.prodAssoc.symm =
          (μ.prod (fairSelectorLaw n).toMeasure) ⊗ₘ K := by
  classical
  let K : Kernel (IidCompletedPool n D × Selector n) H :=
    ⟨fun p => (A (fun i => p.1 (i,p.2 i))).toMeasure, by
      apply measurable_from_prod_countable_left
      intro s
      have hm := measurable_between_completions (measurePreserving_subtuple D (fun i : Fin n => (i,s i))
        (fun _ _ he => congrArg Prod.fst he))
      intro B hB
      exact hm (hA hB)⟩
  let : IsMarkovKernel K := ⟨fun _ => inferInstanceAs (IsProbabilityMeasure (PMF.toMeasure _))⟩
  let J := Kernel.const (IidCompletedPool n D) (fairSelectorLaw n).toMeasure ⊗ₖ K
  refine ⟨K,J,inferInstance,inferInstance,fun _ _ => rfl,?_,?_⟩
  · intro w
    ext B hB
    rw [show J = _ from rfl, Kernel.compProd_apply hB, Kernel.const_apply, lintegral_fintype]
    change (∑ s, (A (fun i => w (i,s i))).toMeasure (Prod.mk s ⁻¹' B) *
      (fairSelectorLaw n).toMeasure {s}) = _
    simp_rw [PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)]
    change _ = ((fairSelectorLaw n).bind (fun s => (A (fun i => w (i,s i))).map (Prod.mk s))).toMeasure B
    rw [PMF.toMeasure_bind_apply _ _ _ hB, tsum_fintype]
    simp_rw [PMF.toMeasure_map_apply _ _ _ measurable_prodMk_left hB]
    exact Finset.sum_congr rfl fun _ _ => mul_comm _ _
  · intro μ _
    rw [show J = _ from rfl, Measure.compProd_assoc, Measure.compProd_const]

end AgnosticVC
