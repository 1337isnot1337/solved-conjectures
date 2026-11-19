import Mathlib.Algebra.Group.AddChar
import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.MeasureTheory.Group.Integral

/-! Character averages for translation-invariant measures and integer
velocity circles. All circle integrals use the standard volume on the
unit additive circle. -/

namespace Loneliness.Hyperplane

open MeasureTheory
open scoped BigOperators

noncomputable section

section AdditiveCharacters

variable {G : Type*} [AddGroup G] [MeasurableSpace G] [MeasurableAdd G]
variable (μ : Measure G) [Measure.IsAddLeftInvariant μ]

/-- A nontrivial character has zero average under a translation-invariant
measure. The Bochner convention also makes this true without a separate
integrability assumption. -/
theorem addChar_integral_eq_zero (χ : AddChar G ℂ) {g : G} (hg : χ g ≠ 1) :
    (∫ x, χ x ∂μ) = 0 := by
  have hmul : χ g * (∫ x, χ x ∂μ) = ∫ x, χ x ∂μ := by
    calc
      _ = ∫ x, χ g * χ x ∂μ := (integral_const_mul _ _).symm
      _ = ∫ x, χ (g + x) ∂μ := by
        congr 1
        funext x
        exact (χ.map_add_eq_mul g x).symm
      _ = _ := integral_add_left_eq_self (fun x => χ x) g
  have hz : (χ g - 1) * (∫ x, χ x ∂μ) = 0 := by
    rw [sub_mul, one_mul, hmul, sub_self]
  exact (mul_eq_zero.mp hz).resolve_left (sub_ne_zero.mpr hg)

theorem addChar_integral_eq_one [IsProbabilityMeasure μ]
    (χ : AddChar G ℂ) (hχ : ∀ x, χ x = 1) :
    (∫ x, χ x ∂μ) = 1 := by
  simp [hχ]

end AdditiveCharacters

variable {ι : Type*} [Fintype ι]

/-- The usual multivariate Fourier function as an additive character. -/
def mFourierChar (n : ι → ℤ) : AddChar (UnitAddTorus ι) ℂ where
  toFun := UnitAddTorus.mFourier n
  map_zero_eq_one' := by
    simp only [UnitAddTorus.mFourier, ContinuousMap.coe_mk, Pi.zero_apply,
      fourier_eval_zero, Finset.prod_const_one]
  map_add_eq_mul' := by
    intro x y
    simp only [UnitAddTorus.mFourier, ContinuousMap.coe_mk, Pi.add_apply,
      fourier_apply, zsmul_add, AddCircle.toCircle_add, Circle.coe_mul,
      Finset.prod_mul_distrib]

theorem mFourier_apply_add (n : ι → ℤ) (x y : UnitAddTorus ι) :
    UnitAddTorus.mFourier n (x + y) =
      UnitAddTorus.mFourier n x * UnitAddTorus.mFourier n y :=
  (mFourierChar n).map_add_eq_mul x y

def subgroupFourierChar (H : AddSubgroup (UnitAddTorus ι)) (n : ι → ℤ) :
    AddChar H ℂ where
  toFun x := UnitAddTorus.mFourier n (x : UnitAddTorus ι)
  map_zero_eq_one' := (mFourierChar n).map_zero_eq_one
  map_add_eq_mul' x y := (mFourierChar n).map_add_eq_mul x y

/-- Orthogonality on a subgroup requires only its actual invariant
measure and a point that detects the character. -/
theorem integral_subgroup_mFourier_eq_zero
    (H : AddSubgroup (UnitAddTorus ι)) (μ : Measure H)
    [Measure.IsAddLeftInvariant μ] (n : ι → ℤ)
    (h : ∃ x : H, UnitAddTorus.mFourier n (x : UnitAddTorus ι) ≠ 1) :
    (∫ x : H, UnitAddTorus.mFourier n (x : UnitAddTorus ι) ∂μ) = 0 := by
  obtain ⟨x, hx⟩ := h
  exact addChar_integral_eq_zero μ (subgroupFourierChar H n) hx

theorem integral_subgroup_mFourier_eq_one
    (H : AddSubgroup (UnitAddTorus ι)) (μ : Measure H)
    [Measure.IsAddLeftInvariant μ] [IsProbabilityMeasure μ] (n : ι → ℤ)
    (h : ∀ x : H, UnitAddTorus.mFourier n (x : UnitAddTorus ι) = 1) :
    (∫ x : H, UnitAddTorus.mFourier n (x : UnitAddTorus ι) ∂μ) = 1 :=
  addChar_integral_eq_one μ (subgroupFourierChar H n) h

theorem fourier_zsmul (n v : ℤ) (t : UnitAddCircle) :
    fourier n (v • t) = fourier (n * v) t := by
  simp only [fourier_apply, mul_smul]

private theorem prod_fourier (S : Finset ι) (n : ι → ℤ) (t : UnitAddCircle) :
    (∏ i ∈ S, fourier (n i) t) = fourier (∑ i ∈ S, n i) t := by
  classical
  induction S using Finset.induction_on with
  | empty => simp only [Finset.prod_empty, Finset.sum_empty, fourier_zero]
  | @insert i S hi ih =>
    rw [Finset.prod_insert hi, Finset.sum_insert hi, ih, fourier_add]

/-- Restricting a multivariate character to an integer velocity circle
replaces its frequency by the integer dot product. -/
theorem mFourier_velocity (n v : ι → ℤ) (t : UnitAddCircle) :
    UnitAddTorus.mFourier n (fun i => v i • t) =
      fourier (∑ i, n i * v i) t := by
  change (∏ i, fourier (n i) (v i • t)) = _
  simp only [fourier_zsmul]
  exact prod_fourier Finset.univ (fun i => n i * v i) t

theorem integral_fourier (n : ℤ) :
    (∫ t : UnitAddCircle, fourier n t) = if n = 0 then (1 : ℂ) else 0 := by
  letI : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  by_cases hn : n = 0
  · subst n
    simp [fourier_zero]
  · rw [if_neg hn]
    exact integral_eq_zero_of_add_right_eq_neg
      (μ := (volume : Measure UnitAddCircle))
      (g := (((1 : ℝ) / 2 / (n : ℝ) : ℝ) : UnitAddCircle))
      (fourier_add_half_inv_index hn (by norm_num))

theorem integral_mFourier_velocity (n v : ι → ℤ) :
    (∫ t : UnitAddCircle, UnitAddTorus.mFourier n (fun i => v i • t)) =
      if ∑ i, n i * v i = 0 then (1 : ℂ) else 0 := by
  simp only [mFourier_velocity]
  exact integral_fourier _

theorem integral_mFourier_shifted_velocity
    (n v : ι → ℤ) (s : UnitAddTorus ι) :
    (∫ t : UnitAddCircle, UnitAddTorus.mFourier n (s + fun i => v i • t)) =
      UnitAddTorus.mFourier n s *
        (if ∑ i, n i * v i = 0 then (1 : ℂ) else 0) := by
  simp_rw [mFourier_apply_add]
  rw [integral_const_mul, integral_mFourier_velocity]

end

end Loneliness.Hyperplane
