module

public import Conjectures.AgnosticVC.OrbitOrderedExample
public import Conjectures.AgnosticVC.PositiveTraceReadout
public import Mathlib.Probability.Kernel.MeasurableLIntegral

/-! The output of the ordered trace learner itself fails completed-law measurability
on the circle-orbit class. A measurable kernel would reveal the positive representative. -/

@[expose] public section

open MeasureTheory ProbabilityTheory
open scoped MeasureTheory

namespace AgnosticVC

private abbrev CompletedCircle := NullMeasurableSpace UnitAddCircle volume

private theorem measurable_circleOrbitPositiveRep_of_kernel [TraceOrder UnitAddCircle]
    (hp : ∀ x : UnitAddCircle, ∃ a, orbitPredict irrationalCircleSubgroup a (x, false) = true)
    (K : Kernel CompletedCircle UnitAddCircle) [IsMarkovKernel K]
    (hK : ∀ x : CompletedCircle, K x =
      (onePositiveRowLearner (orbitPredict irrationalCircleSubgroup) (x, false)).toMeasure) :
    Measurable (fun x : CompletedCircle =>
      positiveTraceRep (orbitPredict irrationalCircleSubgroup) (x, false) (hp x)) := by
  intro B hB
  let read : CompletedCircle → UnitAddCircle := fun x => x
  have hread : Measurable read := fun _ hs => hs.nullMeasurableSet
  let t : Set (CompletedCircle × UnitAddCircle) :=
    {p | orbitPredict irrationalCircleSubgroup p.2 (read p.1, false) = true ∧ p.2 ∈ B}
  have hfeature : Measurable (fun p : CompletedCircle × UnitAddCircle => (p.2, (read p.1, false))) :=
    measurable_snd.prodMk ((hread.comp measurable_fst).prodMk measurable_const)
  have ht : MeasurableSet t :=
    ((measurable_orbitPredict _).comp hfeature (measurableSet_singleton true)).inter
      (measurable_snd hB)
  have hpositive : MeasurableSet {x : CompletedCircle | 0 < K x (Prod.mk x ⁻¹' t)} :=
    measurableSet_lt measurable_const (Kernel.measurable_kernel_prodMk_left (κ := K) ht)
  refine hpositive.congr ?_
  ext x
  change (0 < K x (Prod.mk x ⁻¹' t)) ↔
    positiveTraceRep (orbitPredict irrationalCircleSubgroup) (x, false) (hp x) ∈ B
  rw [hK x]
  exact properLearner_positiveEvent_pos_iff (orbitPredict irrationalCircleSubgroup) (x, false)
    (hp x) B (measurable_prodMk_left ht)

/-- Already at one training observation, the proper learner from the trace construction
cannot be a measurable kernel for the completion of the positive Haar experiment. -/
theorem circleOrbit_properLearner_one_not_measurable [TraceOrder UnitAddCircle] :
    ¬ Measurable (fun z : NullMeasurableSpace (Fin 1 → (UnitAddCircle × Bool) × Bool)
      (Measure.pi fun _ : Fin 1 => circleOrbitPositiveLaw) =>
      (properLearner (n := 1) (d := 1) (by decide) le_rfl
        (orbitPredict irrationalCircleSubgroup) z).toMeasure) := by
  intro hm
  let Γ := irrationalCircleSubgroup
  have hp (x : UnitAddCircle) : ∃ a, orbitPredict Γ a (x, false) = true := ⟨x, by simp⟩
  let r (x : CompletedCircle) := positiveTraceRep (orbitPredict Γ) (x, false) (hp x)
  have hfit (x : UnitAddCircle) : x - r x ∈ Γ :=
    (orbitPredict_false_iff Γ _ x).mp (positiveTraceRep_predict _ _ (hp x))
  have hmin (x a : UnitAddCircle) (ha : x - a ∈ Γ) : ¬ TraceOrder.rel a (r x) :=
    positiveTraceRep_minimal _ _ (hp x) ((orbitPredict_false_iff Γ a x).mpr ha)
  have hsame {x y : UnitAddCircle} (hxy : x - y ∈ Γ) : r x = r y := by
    apply Std.Trichotomous.trichotomous (r := TraceOrder.rel (H := UnitAddCircle)) (r x) (r y)
    · exact hmin y (r x) ((orbit_coset_mem_iff Γ hxy).mp (hfit x))
    · exact hmin x (r y) ((orbit_coset_mem_iff Γ hxy).mpr (hfit y))
  have hinvar (γ : Γ) (x : UnitAddCircle) : r ((γ : UnitAddCircle) + x) = r x :=
    hsame (by simp [γ.property])
  apply no_measurable_circleOrbitTransversal r hfit hinvar
  have hmeas : Measurable (fun x : CompletedCircle =>
      (onePositiveRowLearner (orbitPredict Γ) (x, false)).toMeasure) :=
    measurable_on_circleOrbitPositiveSample (f := fun z =>
      (properLearner (n := 1) (d := 1) Nat.zero_lt_one le_rfl (orbitPredict Γ) z).toMeasure) hm
  let K : Kernel CompletedCircle UnitAddCircle := ⟨_, hmeas⟩
  have : IsMarkovKernel K := ⟨fun x =>
    PMF.toMeasure.isProbabilityMeasure (onePositiveRowLearner (orbitPredict Γ) (x, false))⟩
  exact measurable_circleOrbitPositiveRep_of_kernel hp K fun _ => rfl

end AgnosticVC
