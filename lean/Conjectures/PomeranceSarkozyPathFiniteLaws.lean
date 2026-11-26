module
public import Conjectures.PomeranceSarkozyGridTightness
public import Mathlib.MeasureTheory.Constructions.BorelSpace.ContinuousMap
public import Mathlib.MeasureTheory.Constructions.Cylinders
public import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
public import Mathlib.Topology.ContinuousMap.Compact
public import Mathlib.Topology.ContinuousMap.SecondCountableSpace

@[expose] public section
namespace PomeranceSarkozy

open Set Filter MeasureTheory MeasurableSpace
open scoped Topology BoundedContinuousFunction

abbrev ProcessTime := Icc (0:ℝ) 1

instance instSecondCountableUnitIntervalPath : SecondCountableTopology UnitIntervalPath :=
  ((ContinuousMap.isometryEquivBoundedOfCompact ProcessTime ℝ).symm.isometry.isEmbedding).secondCountableTopology

def finitePathEvaluation (s : Finset ProcessTime) (f : UnitIntervalPath) (i : ↥s) : ℝ :=
  f i.val

theorem continuous_finitePathEvaluation (s : Finset ProcessTime) :
    Continuous (finitePathEvaluation s) :=
  continuous_pi (fun i => (BoundedContinuousFunction.lipschitz_eval_const i.val).continuous)

private def fullPathEvaluation (f : UnitIntervalPath) : ProcessTime→ℝ := fun i=>f i

private theorem fullPathEvaluation_measurable : Measurable fullPathEvaluation :=
  Measurable.of_eval (fun i => (BoundedContinuousFunction.lipschitz_eval_const i).continuous.measurable)

private theorem fullPathEvaluation_comap_eq :
    MeasurableSpace.comap fullPathEvaluation (MeasurableSpace.pi : MeasurableSpace (ProcessTime→ℝ)) =
      (inferInstance : MeasurableSpace UnitIntervalPath) := by
  let e := (ContinuousMap.isometryEquivBoundedOfCompact ProcessTime ℝ).symm.toHomeomorph
  have he : borel UnitIntervalPath = (borel C(ProcessTime, ℝ)).comap e := by
    rw [← borel_comap]
    exact congrArg (fun t=>@borel UnitIntervalPath t) e.isInducing.eq_induced
  change MeasurableSpace.comap fullPathEvaluation MeasurableSpace.pi = borel UnitIntervalPath
  rw [he,ContinuousMap.borel_eq_iSup_comap_eval]
  rw [MeasurableSpace.pi,MeasurableSpace.comap_iSup,MeasurableSpace.comap_iSup]
  apply iSup_congr
  intro i
  rw [MeasurableSpace.comap_comp,MeasurableSpace.comap_comp]
  rfl

/-- Two continuous-path laws with the same finite-dimensional
marginals are equal. This uses measurable cylinders, not a claim that
the full image of continuous functions is measurable in an uncountable product. -/
theorem pathMeasure_ext_finitedim (μ ν : ProbabilityMeasure UnitIntervalPath)
    (h : ∀ s : Finset ProcessTime,μ.map (finitePathEvaluation s)=ν.map (finitePathEvaluation s)) :
    μ=ν := by
  apply ProbabilityMeasure.toMeasure_injective
  let μ' := (μ:Measure UnitIntervalPath).map fullPathEvaluation
  let ν' := (ν:Measure UnitIntervalPath).map fullPathEvaluation
  have hm : μ'=ν' := by
    apply ext_of_generate_finite (measurableCylinders (fun _ : ProcessTime => ℝ))
      (generateFrom_measurableCylinders (α:=fun _ : ProcessTime => ℝ)).symm isPiSystem_measurableCylinders
    · intro s hs
      obtain ⟨I,E,hE,rfl⟩ := (mem_measurableCylinders s).mp hs
      unfold μ' ν'
      rw [Measure.map_apply fullPathEvaluation_measurable hE.cylinder,
        Measure.map_apply fullPathEvaluation_measurable hE.cylinder]
      have hh := congrArg (fun η : ProbabilityMeasure (↥I→ℝ) => (η : Measure (↥I→ℝ)) E) (h I)
      change ((μ:Measure UnitIntervalPath).map (finitePathEvaluation I)) E =
        ((ν:Measure UnitIntervalPath).map (finitePathEvaluation I)) E at hh
      rw [Measure.map_apply (continuous_finitePathEvaluation I).measurable hE,
        Measure.map_apply (continuous_finitePathEvaluation I).measurable hE] at hh
      exact hh
    · unfold μ' ν'
      rw [Measure.map_apply fullPathEvaluation_measurable MeasurableSet.univ,
        Measure.map_apply fullPathEvaluation_measurable MeasurableSet.univ]
      simp
  apply Measure.ext
  intro A hA
  have hA' : @MeasurableSet UnitIntervalPath (MeasurableSpace.comap fullPathEvaluation
      (MeasurableSpace.pi : MeasurableSpace (ProcessTime→ℝ))) A := by rwa [fullPathEvaluation_comap_eq]
  obtain ⟨E,hE,rfl⟩ := hA'
  have hh := congrArg (fun η : Measure (ProcessTime→ℝ)=>η E) hm
  unfold μ' ν' at hh
  rw [Measure.map_apply fullPathEvaluation_measurable hE,Measure.map_apply fullPathEvaluation_measurable hE] at hh
  exact hh

end PomeranceSarkozy
