module

public import Conjectures.AgnosticVC.NullChain
public import Mathlib.MeasureTheory.Constructions.Pi

/-! The null chain witnesses maximal uniform deviation at every sample size for one
fixed law, on a set of samples of outer measure one. -/

@[expose] public section

open MeasureTheory Set
open scoped ENNReal

namespace AgnosticVC

private theorem exists_probability_full_outer_measure {X : Type*} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] (U : Set X) (hU : D U ≠ 0) :
    ∃ Q : Measure X, IsProbabilityMeasure Q ∧ Q ≪ D ∧ Q U = 1 := by
  let V := toMeasurable D U
  let Q : Measure X := (D U)⁻¹ • D.restrict V
  have hmass : (D U)⁻¹ * D U = 1 := ENNReal.inv_mul_cancel hU (measure_ne_top D U)
  refine ⟨Q, ⟨?_⟩, Measure.smul_absolutelyContinuous.trans Measure.absolutelyContinuous_restrict,
    ?_⟩
  · change (D U)⁻¹ • D.restrict V univ = 1
    rw [Measure.restrict_apply_univ, measure_toMeasurable, smul_eq_mul, hmass]
  · change (D U)⁻¹ • D.restrict V U = 1
    rw [Measure.restrict_apply' (measurableSet_toMeasurable D U),
      inter_eq_left.mpr (subset_toMeasurable D U), smul_eq_mul, hmass]

/-- Normalize on a measurable hull of the union of a fixed null chain. Each member
remains null, and at every sample size the event that one member contains all sampled
features has outer probability one. -/
theorem nullChain_exists_probability_full_outer_samples {X : Type*} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] (C : Set (Set X))
    (hchain : IsChain (· ⊆ ·) C) (hne : C.Nonempty) (hnull : ∀ t ∈ C, D t = 0)
    (hU : D (⋃₀ C) ≠ 0) :
    ∃ Q : Measure X, IsProbabilityMeasure Q ∧ Q ≪ D ∧
      (∀ t ∈ C, Q t = 0) ∧ Q (⋃₀ C) = 1 ∧
      ∀ n : ℕ, (Measure.pi fun _ : Fin n => Q) {s | ∃ t ∈ C, ∀ i, s i ∈ t} = 1 := by
  obtain ⟨Q, hprob, hac, hfull⟩ := exists_probability_full_outer_measure D (⋃₀ C) hU
  refine ⟨Q, hprob, hac, fun t ht => hac (hnull t ht), hfull, ?_⟩
  intro n
  have hevent : {s : Fin n → X | ∃ t ∈ C, ∀ i, s i ∈ t} = univ.pi (fun _ : Fin n => ⋃₀ C) := by
    ext s
    simp only [mem_ofPred_eq, mem_univ_pi]
    constructor
    · rintro ⟨t, ht, hs⟩ i
      exact mem_sUnion_of_mem (hs i) ht
    · intro hs
      obtain ⟨t, ht, hsub⟩ := hchain.directedOn.exists_mem_subset_of_finite_of_subset_sUnion
        hne (finite_range s) (range_subset_iff.mpr hs)
      exact ⟨t, ht, fun i => hsub (mem_range_self i)⟩
  let _ : IsProbabilityMeasure Q := hprob
  rw [hevent, Measure.pi_pi]
  simp [hfull]

/-- For a null `Gδ` chain on the unit interval, the normalized law has a set of
samples of outer measure one on which some member fits all positive labels. That
member has empirical error zero and population error one. -/
theorem exists_unitInterval_nullGdelta_chain_full_outer_samples :
    ∃ (C : Set (Set unitInterval)) (Q : Measure unitInterval),
      IsProbabilityMeasure Q ∧ IsChain (· ⊆ ·) C ∧
      (∀ t ∈ C, IsGδ t ∧ volume t = 0 ∧ Q t = 0) ∧ ∅ ∈ C ∧ Q (⋃₀ C) = 1 ∧
      ∀ n : ℕ, (Measure.pi fun _ : Fin n => Q) {s | ∃ t ∈ C, ∀ i, s i ∈ t} = 1 := by
  obtain ⟨C, hchain, hnull, hempty, hU⟩ := exists_unitInterval_nullGdelta_chain
  obtain ⟨Q, hprob, _, hQ, hfull, hfit⟩ := nullChain_exists_probability_full_outer_samples
    volume C hchain ⟨∅, hempty⟩ (fun t ht => (hnull t ht).2) hU
  exact ⟨C, Q, hprob, hchain, fun t ht => ⟨(hnull t ht).1, (hnull t ht).2, hQ t ht⟩,
    hempty, hfull, hfit⟩

end AgnosticVC
