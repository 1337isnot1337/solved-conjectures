module

public import Conjectures.AgnosticVC.OrbitMixture
public import Conjectures.AgnosticVC.OrbitPaddedTrace
public import Conjectures.AgnosticVC.PositiveTraceReadout

/-! Recover a canonical representative from the randomized output law, then use
the circle class to rule out measurability of this learner for arbitrarily large n. -/

@[expose] public section

open MeasureTheory ProbabilityTheory

namespace AgnosticVC

/-- When a fixed trace is realized throughout a measurable experiment, its canonical
representative can be recovered measurably from this learner's output law. -/
theorem measurable_canonicalRep_of_output {Ω X H : Type*} [MeasurableSpace Ω]
    [MeasurableSpace X] [MeasurableSpace H] [TraceOrder H] [Nonempty H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool)
    (heval : Measurable (fun p : H × X => predict p.1 p.2))
    (z : Ω → Fin n → X × Bool) (mz : Measurable z) (v : Finset (Fin n))
    (hv : ∀ w, v ∈ sampleFamily predict (fun i => (z w i).1))
    (ha : Measurable (fun w => (properLearner hd hn predict (z w)).toMeasure)) :
    Measurable (fun w => canonicalRep predict (fun i => (z w i).1) ⟨v,hv w⟩) := by
  classical
  let K : Kernel Ω H := ⟨fun w => (properLearner hd hn predict (z w)).toMeasure, ha⟩
  let : IsMarkovKernel K := ⟨fun _ => inferInstanceAs (IsProbabilityMeasure (PMF.toMeasure _))⟩
  intro B hB
  let x (p : Ω × H) (i : Fin n) := (z p.1 i).1
  have mx : Measurable x := Measurable.of_eval fun i =>
    measurable_fst.comp ((measurable_pi_apply i).comp (mz.comp measurable_fst))
  let E : Set (Ω × H) := {p | sampleTrace predict (x p) p.2 = v ∧ p.2 ∈ B}
  have hE : MeasurableSet E :=
    (measurableSet_sampleTrace_eq_readout predict heval x mx Prod.snd measurable_snd v).inter
      (measurable_snd hB)
  have mass := Kernel.measurable_kernel_prodMk_left (κ := K) hE
  convert measurableSet_lt measurable_const mass using 1
  ext w
  exact (properLearner_traceEvent_pos_iff hd hn predict (z w) ⟨v,hv w⟩ B
    (measurable_prodMk_left hE)).symm

private theorem canonicalRep_congr_rows {X H I : Type*} [Fintype I] [TraceOrder H]
    (predict : H → X → Bool) {x y : I → X} (hxy : x = y) (v : Finset I)
    (hx : v ∈ sampleFamily predict x) (hy : v ∈ sampleFamily predict y) :
    canonicalRep predict x ⟨v,hx⟩ = canonicalRep predict y ⟨v,hy⟩ := by
  cases hxy
  rfl

/-- Every global order fails for the concrete learner under one fixed iid law, for
all sample sizes at least two, including those with a nontrivial accuracy allowance. -/
theorem circleOrbit_output_not_measurable_all_large [TraceOrder UnitAddCircle] (k : ℕ) :
    ¬ Measurable (fun z : NullMeasurableSpace (Fin (k+2) → (UnitAddCircle × Bool) × Bool)
        (Measure.pi fun _ : Fin (k+2) => circleOrbitMixtureLaw) =>
      (properLearner (d := 1) (by decide) (by omega) (orbitPredict irrationalCircleSubgroup) z).toMeasure) := by
  classical
  intro hA
  let Γ := irrationalCircleSubgroup
  let C := NullMeasurableSpace UnitAddCircle volume
  let read : C → UnitAddCircle := fun x => x
  have mr : Measurable read := fun _ h => h.nullMeasurableSet
  let z (x : C) := circleOrbitMixtureSample k (read x)
  have mz : Measurable z := Measurable.of_eval fun i => by
    refine Fin.cases ?_ (fun j => ?_) i
    · exact (mr.prodMk measurable_const).prodMk measurable_const
    · exact measurable_const
  have hfeatures (x : C) : (fun i => (z x i).1) = orbitPaddedFeatures k (read x) := by
    funext i
    refine Fin.cases ?_ (fun j => ?_) i <;> simp [z,
      circleOrbitPositiveRow,circleOrbitFillerRow,orbitPaddedFeatures]
  have hv (x : C) : {0} ∈ sampleFamily (orbitPredict Γ) (fun i => (z x i).1) := by
    rw [hfeatures]
    exact orbitPaddedPositive_realized Γ k (read x)
  have hm := measurable_canonicalRep_of_output (Ω := C) (X := UnitAddCircle × Bool)
    (H := UnitAddCircle) (n := k+2) (d := 1) (by decide) (by omega)
    (orbitPredict Γ) (measurable_orbitPredict _) z mz {0} hv
    (measurable_on_circleOrbitMixtureSample k
      (f := fun u => (properLearner (d := 1) (n := k+2) (by decide)
        (by omega) (orbitPredict Γ) u).toMeasure) hA)
  have heq (x : C) : canonicalRep (orbitPredict Γ) (fun i => (z x i).1) ⟨{0},hv x⟩ =
      orbitPaddedPositiveRep Γ k (read x) := by
    exact canonicalRep_congr_rows _ (hfeatures x) {0} _ _
  have hrep : Measurable (fun x : C => orbitPaddedPositiveRep Γ k (read x)) := by
    exact (funext heq) ▸ hm
  exact no_measurable_circleOrbitTransversal _ (fun x => (orbitPaddedPositiveRep_fit Γ k x).1)
    (fun γ x => orbitPaddedPositiveRep_invariant Γ k (by simp)) hrep

end AgnosticVC
