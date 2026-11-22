module

public import Conjectures.AgnosticVC.TraceCoreOrder
public import Mathlib.MeasureTheory.Constructions.BorelSpace.Real

@[expose] public section

namespace AgnosticVC

open Set TopologicalSpace

/-- A separable parameter space supplies a measurable trace order when prediction at each
instance is continuous in the parameter and each predictor is measurable. -/
theorem exists_order_of_separable_continuous_predict {H X : Type*}
    [TopologicalSpace H] [SeparableSpace H] [MeasurableSpace H] [MeasurableSpace X]
    (predict : H → X → Bool) (hcont : ∀ x, Continuous (fun h => predict h x))
    (hmeas : ∀ h, Measurable (predict h)) :
    ∃ order : TraceOrder H, letI := order; HasMeasurableCanonicalRepresentatives predict := by
  obtain ⟨C, hC, hdense⟩ := exists_countable_dense H
  apply exists_order_of_countable_trace_core predict C hC (fun h _ => hmeas h)
  intro I _ x h
  let U : Set H := ⋂ i : I, (fun g => predict g (x i)) ⁻¹' {predict h (x i)}
  have hopen : IsOpen U := isOpen_iInter_of_finite fun i =>
    (isOpen_discrete {predict h (x i)}).preimage (hcont (x i))
  have hh : h ∈ U := mem_iInter.mpr fun _ => rfl
  obtain ⟨g, hg, hgU⟩ := hdense.exists_mem_open hopen ⟨h, hh⟩
  have heq (i : I) : predict g (x i) = predict h (x i) := mem_iInter.mp hgU i
  exact ⟨g, hg, Finset.ext fun i => by simp [heq i]⟩

/-- The binary classifier with real cut point `a`. -/
noncomputable def realThreshold (a x : ℝ) : Bool := decide (a ≤ x)

/-- On any finite real tuple, a real cut point has the same trace as some rational cut point. -/
theorem rational_threshold_realizes_finite_trace (I : Type) [Fintype I]
    (x : I → ℝ) (a : ℝ) :
    ∃ q : ℚ, sampleTrace realThreshold x (q : ℝ) = sampleTrace realThreshold x a := by
  classical
  let negatives := (Finset.univ.image x).filter (· < a)
  let lower := insert (a - 1) negatives
  have hne : lower.Nonempty := ⟨a - 1, Finset.mem_insert_self _ _⟩
  let largest := lower.max' hne
  have hlt : largest < a := by
    have hm : largest ∈ lower := lower.max'_mem hne
    rcases Finset.mem_insert.mp hm with h | h
    · exact h ▸ sub_lt_self a zero_lt_one
    · exact (Finset.mem_filter.mp h).2
  obtain ⟨q, hq₁, hq₂⟩ := exists_rat_btwn hlt
  refine ⟨q, Finset.ext fun i => ?_⟩
  simp only [mem_sampleTrace, realThreshold, decide_eq_true_eq]
  constructor
  · intro hi
    by_contra hn
    have hneg : x i ∈ negatives := Finset.mem_filter.mpr
      ⟨Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩, lt_of_not_ge hn⟩
    have hle : x i ≤ largest := lower.le_max' (x i) (Finset.mem_insert_of_mem hneg)
    exact (not_lt_of_ge hi) (hle.trans_lt hq₁)
  · exact fun hi => hq₂.le.trans hi

/-- The full class of real thresholds admits a measurable coherent trace order via rational cuts. -/
theorem exists_order_real_threshold :
    ∃ order : TraceOrder ℝ, letI := order; HasMeasurableCanonicalRepresentatives realThreshold := by
  classical
  let C : Set ℝ := range ((↑) : ℚ → ℝ)
  refine exists_order_of_countable_trace_core realThreshold C (countable_range _) ?_ ?_
  · intro a _
    have h : MeasurableSet (Ici a) := measurableSet_Ici
    have hm : Measurable ((Ici a).piecewise (fun _ => true) (fun _ => false)) :=
      Measurable.piecewise h measurable_const measurable_const
    convert hm using 1
    funext x
    by_cases hx : a ≤ x <;> simp [realThreshold, hx, piecewise]
  · intro I _ x a
    obtain ⟨q, hq⟩ := rational_threshold_realizes_finite_trace I x a
    exact ⟨(q : ℝ), mem_range_self q, hq⟩

end AgnosticVC
