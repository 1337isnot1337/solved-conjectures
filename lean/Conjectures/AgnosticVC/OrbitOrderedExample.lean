module

public import Conjectures.AgnosticVC.IidOrderedRates
public import Conjectures.AgnosticVC.OrbitClass
public import Conjectures.AgnosticVC.OrbitTransversal
public import Mathlib.Analysis.Normed.Group.AddCircle
public import Mathlib.MeasureTheory.Constructions.Polish.Basic

/-! A standard Borel VC-one class with no ordered empirical minimizer measurable
for the completed iid experiment. -/

@[expose] public section

open MeasureTheory
open scoped MeasureTheory

namespace AgnosticVC

/-- A feature in the orbit layer equipped with a positive label. -/
def circleOrbitPositiveRow (x : UnitAddCircle) : (UnitAddCircle × Bool) × Bool :=
  ((x, false), true)

private theorem measurable_circleOrbitPositiveRow : Measurable circleOrbitPositiveRow :=
  (measurable_id.prodMk measurable_const).prodMk measurable_const

/-- Haar features in the orbit layer, with every label positive. -/
noncomputable def circleOrbitPositiveLaw : Measure ((UnitAddCircle × Bool) × Bool) :=
  volume.map circleOrbitPositiveRow

instance : IsProbabilityMeasure circleOrbitPositiveLaw := by
  let _ : IsProbabilityMeasure (volume : Measure UnitAddCircle) := ⟨UnitAddCircle.measure_univ⟩
  exact inferInstanceAs (IsProbabilityMeasure (volume.map circleOrbitPositiveRow))

/-- Reading a completed singleton experiment at a Haar feature preserves measurability. -/
theorem measurable_on_circleOrbitPositiveSample {Y : Type*} [MeasurableSpace Y]
    {f : (Fin 1 → (UnitAddCircle × Bool) × Bool) → Y}
    (hf : Measurable (fun z : NullMeasurableSpace (Fin 1 → (UnitAddCircle × Bool) × Bool)
      (Measure.pi fun _ : Fin 1 => circleOrbitPositiveLaw) => f z)) :
    Measurable (fun x : NullMeasurableSpace UnitAddCircle volume => f (orbitPositiveSample x)) := by
  let rows := MeasurableEquiv.funUnique (Fin 1) ((UnitAddCircle × Bool) × Bool)
  have hrow : MeasurePreserving circleOrbitPositiveRow volume circleOrbitPositiveLaw :=
    ⟨measurable_circleOrbitPositiveRow, rfl⟩
  have hmap : MeasurePreserving (rows.symm ∘ circleOrbitPositiveRow) volume
      (Measure.pi fun _ : Fin 1 => circleOrbitPositiveLaw) :=
    ((measurePreserving_funUnique circleOrbitPositiveLaw (Fin 1)).symm rows).comp hrow
  intro s hs
  have hnull : NullMeasurableSet (f ⁻¹' s) (Measure.pi fun _ : Fin 1 => circleOrbitPositiveLaw) :=
    hf hs
  exact hnull.preimage hmap.quasiMeasurePreserving

/-- For every global order, a completed-iid measurable ordered minimizer would
give a measurable selector for the cosets of the irrational rotation. -/
theorem circleOrbit_no_iidMeasurableOrderedERM [TraceOrder UnitAddCircle] :
    IsEmpty (IidMeasurableOrderedERM (orbitPredict irrationalCircleSubgroup)
      (circleOrbitPositiveLaw.map Prod.fst)) := by
  refine ⟨fun erm => ?_⟩
  obtain ⟨hfit, hinvariant⟩ := orbitPositiveERM_properties irrationalCircleSubgroup
    (erm.learn 1) (fun _ _ => erm.minimizes 1 _ _) (fun _ _ => erm.breaks_ties 1 _ _)
  have hread := iid_fixedLabel_readout_measurable circleOrbitPositiveLaw (fun i : Fin 1 => i)
    Function.injective_id (fun _ => true) (erm.learn 1) (erm.measurable_learn 1)
  have hm := measurable_on_circleOrbitPositiveSample hread
  refine no_measurable_circleOrbitTransversal _ hfit (fun γ x => hinvariant ?_) hm
  simp [γ.property]

/-- Both spaces are standard Borel, the class has VC dimension one with jointly
measurable evaluation, and the completed-iid ordered ERM condition fails for every order. -/
theorem circleOrbit_orderedERM_counterexample :
    StandardBorelSpace UnitAddCircle ∧ StandardBorelSpace (UnitAddCircle × Bool) ∧
    HasVCDimensionAtMost (orbitPredict irrationalCircleSubgroup) 1 ∧
    ¬ HasVCDimensionAtMost (orbitPredict irrationalCircleSubgroup) 0 ∧
    Measurable (fun p : UnitAddCircle × (UnitAddCircle × Bool) =>
      orbitPredict irrationalCircleSubgroup p.1 p.2) ∧
    ∀ order : TraceOrder UnitAddCircle, letI := order
      IsEmpty (IidMeasurableOrderedERM (orbitPredict irrationalCircleSubgroup)
        (circleOrbitPositiveLaw.map Prod.fst)) := by
  obtain ⟨a, b, hab⟩ := exists_pair_ne irrationalCircleSubgroup
  let _ : Nontrivial UnitAddCircle := ⟨a, b, fun h => hab (Subtype.ext h)⟩
  refine ⟨inferInstance, inferInstance, orbitPredict_vc_le_one _, orbitPredict_vc_not_zero _,
    measurable_orbitPredict _, ?_⟩
  intro order
  exact @circleOrbit_no_iidMeasurableOrderedERM order

end AgnosticVC
