import Conjectures.HadamardAutomorphismQuadraticIntegers
import Mathlib.Algebra.Polynomial.Degree.IsMonicOfDegree
import Mathlib.Data.Int.ModEq
import Mathlib.Tactic.FieldSimp

/-! The converse and equivalence for the actual quadratic integer coordinate
description. The half generator satisfies a monic polynomial over the integers. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField Polynomial

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem quadratic_half_generator_integral479 :
    IsIntegral ℤ ((1 + quadraticGeneratorInFixed479 K) / 2) := by
  refine ⟨X ^ 2 - C (1 : ℤ) * X + C 120,
    (Polynomial.isMonicOfDegree_sub_add_two (1 : ℤ) 120).monic, ?_⟩
  change Polynomial.aeval ((1 + quadraticGeneratorInFixed479 K) / 2)
    (X ^ 2 - C (1 : ℤ) * X + C 120) = 0
  simp only [map_add, map_sub, map_pow, map_mul, Polynomial.aeval_X,
    Polynomial.aeval_C, map_one, map_ofNat, one_mul]
  field_simp
  linear_combination quadraticGeneratorInFixed479_sq K

theorem quadratic_coordinates_integral479 (A B : ℤ) (hparity : A % 2 = B % 2) :
    IsIntegral ℤ (((A : quadraticFixedField479 K) +
      (B : quadraticFixedField479 K) * quadraticGeneratorInFixed479 K) / 2) := by
  have hd : (2 : ℤ) ∣ A - B := Int.modEq_iff_dvd.mp hparity.symm
  obtain ⟨m, hm⟩ := hd
  have hA : A = B + 2 * m := by omega
  have hAF : (A : quadraticFixedField479 K) =
      (B : quadraticFixedField479 K) + 2 * (m : quadraticFixedField479 K) := by
    exact_mod_cast hA
  have hcoords : ((A : quadraticFixedField479 K) +
      (B : quadraticFixedField479 K) * quadraticGeneratorInFixed479 K) / 2 =
      (m : quadraticFixedField479 K) + (B : quadraticFixedField479 K) *
        ((1 + quadraticGeneratorInFixed479 K) / 2) := by
    rw [hAF]
    field_simp
    ring
  rw [hcoords]
  exact (isIntegral_intCast m).add
    ((isIntegral_intCast B).mul (quadratic_half_generator_integral479 K))


/-- The actual quadratic integers are exactly the equal-parity half-coordinate elements. -/
theorem quadratic_integer_coordinates_iff479 (x : quadraticFixedField479 K) :
    IsIntegral ℤ x ↔ ∃ A B : ℤ,
      (x : K) = ((A : K) + (B : K) * quadraticGenerator479 K) / 2 ∧
      A % 2 = B % 2 := by
  constructor
  · intro hx
    obtain ⟨A, B, hcoords, hparity, _⟩ :=
      quadratic_integer_coordinates479 K (⟨x, hx⟩ : 𝓞 (quadraticFixedField479 K))
    refine ⟨A, B, ?_, hparity⟩
    simpa only [RingOfIntegers.coe_mk] using hcoords
  · rintro ⟨A, B, hcoords, hparity⟩
    have hx : x = ((A : quadraticFixedField479 K) +
        (B : quadraticFixedField479 K) * quadraticGeneratorInFixed479 K) / 2 := by
      apply (algebraMap (quadraticFixedField479 K) K).injective
      rw [map_div₀, map_add, map_mul, map_intCast, map_intCast, map_ofNat]
      simpa only [IntermediateField.algebraMap_apply,
        quadraticGeneratorInFixed479_coe] using hcoords
    rw [hx]
    exact quadratic_coordinates_integral479 K A B hparity

end HadamardAutomorphism
