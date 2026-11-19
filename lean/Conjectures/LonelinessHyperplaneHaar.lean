import Conjectures.LonelinessHyperplane
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Group.AddCircle
import Mathlib.MeasureTheory.Measure.Haar.Unique
import Mathlib.Topology.Algebra.Group.ZPow

/-! The primitive integer normal map sends product Haar probability on the
torus to Haar probability on the unit circle. The exact hyperplane profile
therefore has the uniform law on its stated interval.

These are distribution statements for the containing-hyperplane profile.
The random-velocity convergence and exceptional-point counts are separate. -/

namespace Loneliness.Hyperplane

open scoped BigOperators ENNReal
open MeasureTheory

noncomputable section

variable {ι : Type*} [Fintype ι]

section AdditiveGroup

variable {G : Type*} [AddCommGroup G]

def normalHom (m : ι → ℤ) : (ι → G) →+ G where
  toFun x := ∑ i, m i • x i
  map_zero' := by simp
  map_add' := by
    intro x y
    simp only [Pi.add_apply, smul_add, Finset.sum_add_distrib]

theorem normalHom_surjective (m : ι → ℤ) (hm : PrimitiveNormal m) :
    Function.Surjective (normalHom (G := G) m) := by
  obtain ⟨e, he⟩ := primitive_bezout m hm
  intro y
  refine ⟨fun i => e i • y, ?_⟩
  change (∑ i, m i • (e i • y)) = y
  simp only [smul_smul, ← Finset.sum_smul, he, one_smul]

variable [TopologicalSpace G] [IsTopologicalAddGroup G]

theorem continuous_normalHom (m : ι → ℤ) :
    Continuous (normalHom (G := G) m) := by
  change Continuous (fun x : ι → G => ∑ i, m i • x i)
  exact continuous_finset_sum _
    (fun i _ => (continuous_zsmul (m i)).comp (continuous_apply i))

end AdditiveGroup

theorem normalHom_coe (m : ι → ℤ) (x : ι → ℝ) :
    normalHom m (fun i => (x i : UnitAddCircle)) =
      ((pairing m x : ℝ) : UnitAddCircle) := by
  let q : ℝ →+ UnitAddCircle := QuotientAddGroup.mk' (AddSubgroup.zmultiples (1 : ℝ))
  change (∑ i, m i • q (x i)) = q (pairing m x)
  rw [pairing, map_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [← zsmul_eq_mul, map_zsmul]

/-- The measures are the actual standard circle measure and its finite
product. Both have total mass one. -/
theorem normalHom_measurePreserving (m : ι → ℤ) (hm : PrimitiveNormal m) :
    MeasurePreserving (normalHom (G := UnitAddCircle) m)
      (volume : Measure (ι → UnitAddCircle)) volume := by
  letI : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  exact (normalHom (G := UnitAddCircle) m).measurePreserving
    (continuous_normalHom m) (normalHom_surjective m hm) (by simp)

def normalPhase (m : ι → ℤ) (c s : ι → UnitAddCircle) : UnitAddCircle :=
  normalHom m (c - s)

theorem normalPhase_measurePreserving (m : ι → ℤ) (hm : PrimitiveNormal m)
    (c : ι → UnitAddCircle) :
    MeasurePreserving (normalPhase m c)
      (volume : Measure (ι → UnitAddCircle)) volume := by
  simpa only [normalPhase, map_sub, Function.comp_def] using
    (Measure.measurePreserving_sub_left (volume : Measure UnitAddCircle) (normalHom m c)).comp
      (normalHom_measurePreserving m hm)

theorem normalPhase_map_volume (m : ι → ℤ) (hm : PrimitiveNormal m)
    (c : ι → UnitAddCircle) :
    Measure.map (normalPhase m c) (volume : Measure (ι → UnitAddCircle)) = volume :=
  (normalPhase_measurePreserving m hm c).map_eq

/-- The norm of a uniform circle phase has the exact uniform law on
`[0, 1/2]`, including every real threshold through `ENNReal.ofReal`. -/
theorem normalPhase_norm_distribution (m : ι → ℤ) (hm : PrimitiveNormal m)
    (c : ι → UnitAddCircle) (r : ℝ) :
    (volume : Measure (ι → UnitAddCircle)) {s | ‖normalPhase m c s‖ ≤ r} =
      ENNReal.ofReal (min 1 (2 * r)) := by
  have hp := normalPhase_measurePreserving m hm c
  have he := congrArg
    (fun μ : Measure UnitAddCircle => μ (Metric.closedBall 0 r)) hp.map_eq
  rw [Measure.map_apply hp.measurable measurableSet_closedBall] at he
  have hs : {s : ι → UnitAddCircle | ‖normalPhase m c s‖ ≤ r} =
      normalPhase m c ⁻¹' Metric.closedBall 0 r := by
    ext s
    simp only [Set.mem_setOf_eq, Set.mem_preimage, Metric.mem_closedBall, dist_zero_right]
  rw [hs, he]
  exact AddCircle.volume_closedBall (T := (1 : ℝ)) (x := 0) r

def torusCenter : ι → UnitAddCircle := fun _ => ((1 / 2 : ℝ) : UnitAddCircle)

def torusPredictedValue (m : ι → ℤ) (s : ι → UnitAddCircle) : ℝ :=
  1 / 2 - ‖normalPhase m torusCenter s‖ / normalMass m

/-- The torus profile is precisely the already checked real-coordinate
formula, for every choice of real representatives of the shifts. -/
theorem torusPredictedValue_coe (m : ι → ℤ) (s : ι → ℝ) :
    torusPredictedValue m (fun i => (s i : UnitAddCircle)) = predictedValue m s := by
  have hphase : normalPhase m torusCenter (fun i => (s i : UnitAddCircle)) =
      ((pairing m (centerMinus s) : ℝ) : UnitAddCircle) := by
    calc
      _ = normalHom m (fun i => (centerMinus s i : UnitAddCircle)) := by
        unfold normalPhase
        congr 1
      _ = _ := normalHom_coe m (centerMinus s)
  unfold torusPredictedValue
  rw [hphase, UnitAddCircle.norm_eq]
  rfl

theorem shifted_hyperplane_value_eq_torus [Nonempty ι]
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) :
    shiftedSpaceValue (relationSpace m) s =
      torusPredictedValue m (fun i => (s i : UnitAddCircle)) :=
  (shifted_hyperplane_value m hm s).trans (torusPredictedValue_coe m s).symm

/-- Exact upper-tail formula for the uniform law on
`[1/2 - 1/(2 * normalMass m), 1/2]`. This is the distribution of the
containing-hyperplane value, with no random-velocity convergence premise. -/
theorem haar_predictedValue_tail (m : ι → ℤ) (hm : PrimitiveNormal m) (u : ℝ) :
    (volume : Measure (ι → UnitAddCircle)) {s | u ≤ torusPredictedValue m s} =
      ENNReal.ofReal (min 1 (normalMass m * (1 - 2 * u))) := by
  have hA := normalMass_pos m hm
  have hs : {s : ι → UnitAddCircle | u ≤ torusPredictedValue m s} =
      {s | ‖normalPhase m torusCenter s‖ ≤ normalMass m * (1 / 2 - u)} := by
    ext s
    change u ≤ 1 / 2 - ‖normalPhase m torusCenter s‖ / normalMass m ↔
      ‖normalPhase m torusCenter s‖ ≤ normalMass m * (1 / 2 - u)
    constructor
    · intro h
      have hd : ‖normalPhase m torusCenter s‖ / normalMass m ≤ 1 / 2 - u := by
        linarith
      have hmul := (div_le_iff₀ hA).mp hd
      simpa only [mul_comm] using hmul
    · intro h
      have hd : ‖normalPhase m torusCenter s‖ / normalMass m ≤ 1 / 2 - u := by
        apply (div_le_iff₀ hA).2
        simpa only [mul_comm] using h
      linarith
  rw [hs, normalPhase_norm_distribution m hm torusCenter]
  have he : 2 * (normalMass m * (1 / 2 - u)) = normalMass m * (1 - 2 * u) := by ring
  rw [he]

end

end Loneliness.Hyperplane
