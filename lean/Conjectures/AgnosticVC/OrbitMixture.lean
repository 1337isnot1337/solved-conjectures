module

public import Conjectures.AgnosticVC.OrbitOrderedExample

/-! The completed iid mixture admits a measurable readout along a Haar positive row
followed by an arbitrary finite number of copies of a fixed negative row. -/

@[expose] public section

open MeasureTheory
open scoped ENNReal

namespace AgnosticVC

/-- A feature in the identifying layer, equipped with a negative label. -/
def circleOrbitFillerRow : (UnitAddCircle × Bool) × Bool := ((0, true), false)

/-- A fixed population law mixing the Haar positive row with the negative filler atom. -/
noncomputable def circleOrbitMixtureLaw : Measure ((UnitAddCircle × Bool) × Bool) :=
  (1 / 2 : ℝ≥0∞) • circleOrbitPositiveLaw + (1 / 2 : ℝ≥0∞) • Measure.dirac circleOrbitFillerRow

instance : IsProbabilityMeasure circleOrbitMixtureLaw := by
  constructor
  simp only [circleOrbitMixtureLaw, Measure.add_apply, Measure.smul_apply, measure_univ,
    smul_eq_mul, mul_one]
  exact ENNReal.add_halves 1

/-- The sample with one variable positive example followed by `k + 1` negative fillers. -/
def circleOrbitMixtureSample (k : ℕ) (x : UnitAddCircle) :
    Fin (k + 2) → (UnitAddCircle × Bool) × Bool :=
  Fin.cases (circleOrbitPositiveRow x) (fun _ => circleOrbitFillerRow)

@[simp] theorem circleOrbitMixtureSample_zero (k : ℕ) (x : UnitAddCircle) :
    circleOrbitMixtureSample k x 0 = circleOrbitPositiveRow x := rfl

@[simp] theorem circleOrbitMixtureSample_succ (k : ℕ) (x : UnitAddCircle) (j : Fin (k + 1)) :
    circleOrbitMixtureSample k x j.succ = circleOrbitFillerRow := by
  simp [circleOrbitMixtureSample]

/-- The family of one-positive-row inputs has a law absolutely continuous with respect
to the iid sample law from the mixture. -/
theorem quasiMeasurePreserving_circleOrbitMixtureSample (k : ℕ) :
    QuasiMeasurePreserving (circleOrbitMixtureSample k) volume
      (Measure.pi fun _ : Fin (k + 2) => circleOrbitMixtureLaw) := by
  let fill : Fin (k + 1) → (UnitAddCircle × Bool) × Bool := fun _ => circleOrbitFillerRow
  let pair (x : UnitAddCircle) := (circleOrbitPositiveRow x, fill)
  let e := MeasurableEquiv.piFinSuccAbove
    (fun _ : Fin (k + 2) => (UnitAddCircle × Bool) × Bool) 0
  have hrow : Measurable circleOrbitPositiveRow :=
    (measurable_id.prodMk measurable_const).prodMk measurable_const
  have hpositive : circleOrbitPositiveLaw ≪ circleOrbitMixtureLaw :=
    (Measure.absolutelyContinuous_smul (μ := circleOrbitPositiveLaw) (c := 1 / 2)
      (by norm_num)).add_right _
  have hfiller : Measure.dirac circleOrbitFillerRow ≪ circleOrbitMixtureLaw :=
    (Measure.absolutelyContinuous_smul (μ := Measure.dirac circleOrbitFillerRow) (c := 1 / 2)
      (by norm_num)).add_right' _
  have hatom : circleOrbitMixtureLaw {circleOrbitFillerRow} ≠ 0 := by
    intro hzero
    simpa using hfiller hzero
  have htail : Measure.dirac fill ≪ Measure.pi (fun _ : Fin (k + 1) => circleOrbitMixtureLaw) := by
    intro s hs
    rw [Measure.dirac_apply]
    apply Set.indicator_of_notMem
    intro hmem
    have hnull := measure_mono_null (Set.singleton_subset_iff.mpr hmem) hs
    rw [Measure.pi_singleton] at hnull
    exact (Finset.prod_ne_zero_iff.mpr fun _ _ => hatom) hnull
  have hpair : QuasiMeasurePreserving pair volume
      (circleOrbitMixtureLaw.prod (Measure.pi fun _ : Fin (k + 1) => circleOrbitMixtureLaw)) := by
    refine ⟨hrow.prodMk measurable_const, ?_⟩
    have hmap : volume.map pair = circleOrbitPositiveLaw.prod (Measure.dirac fill) := by
      rw [Measure.prod_dirac, circleOrbitPositiveLaw,
        Measure.map_map measurable_prodMk_right hrow]
      rfl
    rw [hmap]
    exact hpositive.prod htail
  have hpres := (measurePreserving_piFinSuccAbove
    (fun _ : Fin (k + 2) => circleOrbitMixtureLaw) 0).symm e
  have hsample : e.symm ∘ pair = circleOrbitMixtureSample k := by
    funext x i
    refine Fin.cases ?_ (fun j => ?_) i
    · simp [e, pair]
    · change e.symm (pair x) ((0 : Fin (k + 2)).succAbove j) = circleOrbitMixtureSample k x j.succ
      simp only [e, MeasurableEquiv.piFinSuccAbove_symm_apply, Fin.insertNthEquiv, Equiv.coe_fn_mk,
        pair, Fin.insertNth_apply_succAbove, circleOrbitMixtureSample_succ, fill]
  rw [← hsample]
  exact hpres.quasiMeasurePreserving.comp hpair

/-- The sample map is measurable from the completed circle to the completed iid mixture. -/
theorem measurable_circleOrbitMixtureSample_completion (k : ℕ) :
    Measurable (α := NullMeasurableSpace UnitAddCircle volume)
      (β := NullMeasurableSpace (Fin (k + 2) → (UnitAddCircle × Bool) × Bool)
        (Measure.pi fun _ : Fin (k + 2) => circleOrbitMixtureLaw)) (circleOrbitMixtureSample k) :=
  fun _ hs => NullMeasurableSet.preimage hs (quasiMeasurePreserving_circleOrbitMixtureSample k)

/-- Every measurable function on the completed iid mixture is measurably readable on
the completed circle along samples with one Haar positive row and fixed negative fillers. -/
theorem measurable_on_circleOrbitMixtureSample {Y : Type*} [MeasurableSpace Y] (k : ℕ)
    {f : (Fin (k + 2) → (UnitAddCircle × Bool) × Bool) → Y}
    (hf : Measurable (fun z : NullMeasurableSpace (Fin (k + 2) → (UnitAddCircle × Bool) × Bool)
      (Measure.pi fun _ : Fin (k + 2) => circleOrbitMixtureLaw) => f z)) :
    Measurable (fun x : NullMeasurableSpace UnitAddCircle volume => f (circleOrbitMixtureSample k x)) :=
  hf.comp (measurable_circleOrbitMixtureSample_completion k)

end AgnosticVC
