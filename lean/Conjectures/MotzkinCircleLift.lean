import Mathlib.MeasureTheory.Integral.IntervalIntegral.Periodic
import Mathlib.MeasureTheory.Measure.Real

/-! The quotient image of a measurable subset of `[0,1)` has the same
Lebesgue measure. The canonical representative also proves measurability of
the image, without requiring a general measurable-image assertion. -/
namespace Motzkin.RationalIntervals

open Set MeasureTheory MeasureTheory.Measure

noncomputable def representative (x : UnitAddCircle) : ℝ :=
  (AddCircle.equivIco (1:ℝ) 0 x : ℝ)

theorem representative_mem (x : UnitAddCircle) : representative x ∈ Ico (0:ℝ) 1 := by
  simpa only [representative,zero_add] using (AddCircle.equivIco (1:ℝ) 0 x).property

theorem representative_coe {r : ℝ} (hr : r ∈ Ico (0:ℝ) 1) :
    representative (r:UnitAddCircle)=r := by
  exact AddCircle.equivIco_coe_of_mem (by simpa only [zero_add] using hr)

theorem coe_representative (x : UnitAddCircle) :
    (representative x:UnitAddCircle)=x := AddCircle.coe_equivIco

theorem representative_coe_fract (r : ℝ) :
    representative (r:UnitAddCircle)=Int.fract r := by
  simpa only [representative,div_one,mul_one] using
    (AddCircle.coe_equivIco_mk_apply (p := (1:ℝ)) r)

theorem measurable_representative : Measurable representative :=
  measurable_subtype_coe.comp (AddCircle.measurableEquivIco (1:ℝ) 0).measurable

def liftSet (U : Set ℝ) : Set UnitAddCircle := representative ⁻¹' U

theorem measurable_liftSet {U : Set ℝ} (hU : MeasurableSet U) :
    MeasurableSet (liftSet U) := hU.preimage measurable_representative

theorem image_eq_liftSet {U : Set ℝ} (hU : U ⊆ Ico (0:ℝ) 1) :
    ((↑):ℝ → UnitAddCircle) '' U=liftSet U := by
  ext x
  constructor
  · rintro ⟨r,hr,rfl⟩
    change representative (r:UnitAddCircle) ∈ U
    rwa [representative_coe (hU hr)]
  · intro hx
    exact ⟨representative x,hx,coe_representative x⟩

theorem liftSet_volume {U : Set ℝ} (hU : U ⊆ Ico (0:ℝ) 1)
    (hm : MeasurableSet U) :
    volume (liftSet U)=volume U := by
  let W : Set ℝ := ((↑):ℝ → UnitAddCircle) ⁻¹' liftSet U
  have hW : MeasurableSet W :=
    (measurable_liftSet hm).preimage AddCircle.measurable_mk'
  have hinter : W ∩ Ico (0:ℝ) 1=U := by
    ext r
    constructor
    · rintro ⟨hr,hrI⟩
      change representative (r:UnitAddCircle) ∈ U at hr
      rwa [representative_coe hrI] at hr
    · intro hr
      have hrI := hU hr
      refine ⟨?_,hrI⟩
      change representative (r:UnitAddCircle) ∈ U
      rwa [representative_coe hrI]
  calc
    volume (liftSet U)=volume (W ∩ Ioc (0:ℝ) 1) := by
      simpa only [zero_add] using
        AddCircle.add_projection_respects_measure (1:ℝ) 0 (measurable_liftSet hm)
    _=(volume.restrict (Ioc (0:ℝ) 1)) W := (Measure.restrict_apply hW).symm
    _=(volume.restrict (Ico (0:ℝ) 1)) W := by
      rw [MeasureTheory.restrict_Ico_eq_restrict_Ioc]
    _=volume (W ∩ Ico (0:ℝ) 1) := Measure.restrict_apply hW
    _=volume U := congrArg volume hinter

theorem image_measurable {U : Set ℝ} (hU : U ⊆ Ico (0:ℝ) 1)
    (hm : MeasurableSet U) :
    MeasurableSet (((↑):ℝ → UnitAddCircle) '' U) := by
  rw [image_eq_liftSet hU]
  exact measurable_liftSet hm

theorem image_volume {U : Set ℝ} (hU : U ⊆ Ico (0:ℝ) 1)
    (hm : MeasurableSet U) :
    volume (((↑):ℝ → UnitAddCircle) '' U)=volume U := by
  rw [image_eq_liftSet hU]
  exact liftSet_volume hU hm

theorem image_volume_real {U : Set ℝ} (hU : U ⊆ Ico (0:ℝ) 1)
    (hm : MeasurableSet U) :
    volume.real (((↑):ℝ → UnitAddCircle) '' U)=volume.real U :=
  congrArg ENNReal.toReal (image_volume hU hm)

end Motzkin.RationalIntervals
