import Conjectures.MeylenderThalmaierParallelogram
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-! Lebesgue area of the actual two-strip parallelogram. -/

noncomputable section

namespace MeylenderThalmaier

open Set MeasureTheory

def axesMatrix (a : ℝ) : Matrix (Fin 2) (Fin 2) ℝ := !![1, 1; a-1, 1]

theorem determinant_axes (a : ℝ) : LinearMap.det (axesMatrix a).toLin'=2-a := by
  rw [LinearMap.det_toLin']
  simp [axesMatrix,Matrix.det_fin_two_of]
  ring

theorem axes_apply (a : ℝ) (x : Plane) : (axesMatrix a).toLin' x = ![axisU x,axisV a x] := by
  ext i
  fin_cases i <;> simp [Matrix.toLin'_apply,axesMatrix,Matrix.mulVec,dotProduct,Fin.sum_univ_two,axisU,axisV]
  ring

private def square : Set Plane := Icc (fun _ => -(1/2)) (fun _ => 1/2)

theorem parallelogram_preimage (a : ℝ) : parallelogram a=(axesMatrix a).toLin' ⁻¹' square := by
  ext x
  change (|axisU x|≤1/2 ∧ |axisV a x|≤1/2) ↔ _
  simp only [Set.mem_preimage,axes_apply,square,Set.mem_Icc,abs_le,Pi.le_def]
  constructor
  · rintro ⟨⟨hu₁,hu₂⟩,⟨hv₁,hv₂⟩⟩
    constructor <;> intro i <;> fin_cases i <;> first | exact hu₁ | exact hu₂ | exact hv₁ | exact hv₂
  · rintro ⟨h,k⟩
    exact ⟨⟨h 0,k 0⟩,⟨h 1,k 1⟩⟩

theorem volume_parallelogram {a : ℝ} (ha : a<1) :
    volume (parallelogram a)=ENNReal.ofReal (1/(2-a)) := by
  have hd : LinearMap.det (axesMatrix a).toLin'≠0 := by rw [determinant_axes]; linarith
  have hsq : volume square=1 := by
    rw [square,Real.volume_Icc_pi,Fin.prod_univ_two]
    norm_num
  rw [parallelogram_preimage,Measure.addHaar_preimage_linearMap volume hd,hsq,mul_one,determinant_axes]
  rw [abs_of_pos (inv_pos.mpr (by linarith)),one_div]

end MeylenderThalmaier
