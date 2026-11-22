module

public import Conjectures.AgnosticVC.Kernel
public import Mathlib.Order.Sum.Order
public import Mathlib.Order.RelIso.Basic

/-! A well-order putting a prescribed subclass first, and a criterion for that
subclass to realize every finite trace. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Filter

variable {H X : Type*}

@[instance_reducible] private noncomputable def coreFirstOrder (C : Set H) : TraceOrder H := by
  classical
  let e := (Equiv.sumCompl (· ∈ C)).symm
  let r := Sum.Lex (@WellOrderingRel C) (@WellOrderingRel {a : H // a ∉ C})
  exact ⟨fun a b => r (e a) (e b), RelIso.IsWellOrder.preimage r e⟩

/-- A countable measurable subclass realizing all finite traces can always be
made an initial segment. No order on the ambient hypothesis space is prescribed. -/
theorem exists_order_of_countable_trace_core [MeasurableSpace X] [MeasurableSpace H]
    (predict : H → X → Bool) (C : Set H) (hC : C.Countable)
    (hmeas : ∀ h ∈ C, Measurable (predict h))
    (hcore : ∀ (I : Type) [Fintype I] (x : I → X) (h : H),
      ∃ g ∈ C, sampleTrace predict x g = sampleTrace predict x h) :
    ∃ order : TraceOrder H, letI := order; HasMeasurableCanonicalRepresentatives predict := by
  classical
  let _ := coreFirstOrder C
  refine ⟨coreFirstOrder C, hasMeasurableCanonicalRepresentatives_of_countable_trace_core
    predict C hC ?_ hmeas hcore⟩
  intro a b ha hba
  by_contra hb
  change Sum.Lex _ _ ((Equiv.sumCompl (· ∈ C)).symm b) ((Equiv.sumCompl (· ∈ C)).symm a) at hba
  rw [Equiv.sumCompl_symm_apply_of_neg hb, Equiv.sumCompl_symm_apply_of_pos ha] at hba
  cases hba

/-- For binary predictors, pointwise convergence from a subclass implies that
every finite trace is already realized in that subclass. -/
theorem finite_trace_core_of_pointwise_limits (predict : H → X → Bool) (C : Set H)
    (hlim : ∀ h : H, ∃ seq : ℕ → C, ∀ x, Tendsto (fun k => predict (seq k) x)
      atTop (nhds (predict h x))) (I : Type) [Fintype I] (x : I → X) (h : H) :
    ∃ g ∈ C, sampleTrace predict x g = sampleTrace predict x h := by
  obtain ⟨seq, hseq⟩ := hlim h
  have hi (i : I) : ∀ᶠ k in atTop, predict (seq k) (x i) = predict h (x i) :=
    (hseq (x i)) (IsOpen.mem_nhds (isOpen_discrete {predict h (x i)}) rfl)
  obtain ⟨k, hk⟩ := (Filter.eventually_all.mpr hi).exists
  exact ⟨seq k, (seq k).property, Finset.ext fun i => by simp [hk i]⟩

end AgnosticVC
