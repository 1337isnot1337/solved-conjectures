import Conjectures.HadamardAutomorphismCyclotomicQuadratic
import Conjectures.HadamardAutomorphismArithmeticRational
import Mathlib.Algebra.QuadraticAlgebra.NormDeterminant
import Mathlib.NumberTheory.NumberField.Norm

/-! Algebraic norms in the actual quadratic fixed field. This file connects
the quadratic-form computation to `Algebra.norm`; it does not assume the
ideal-class assertion from the informal alternative proof. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem quadraticGeneratorInFixed479_sq :
    quadraticGeneratorInFixed479 K ^ 2 = (-479 : quadraticFixedField479 K) := by
  apply Subtype.ext
  exact quadraticGenerator479_sq K

private theorem quadraticModel_relation479 :
    quadraticGeneratorInFixed479 K * quadraticGeneratorInFixed479 K =
      (-479 : ℚ) • (1 : quadraticFixedField479 K) +
        (0 : ℚ) • quadraticGeneratorInFixed479 K := by
  simpa only [zero_smul, add_zero, Algebra.smul_def, mul_one, map_neg,
    map_ofNat, pow_two] using quadraticGeneratorInFixed479_sq K

def quadraticModelToFixed479 :
    QuadraticAlgebra ℚ (-479) 0 →ₐ[ℚ] quadraticFixedField479 K :=
  QuadraticAlgebra.lift ⟨quadraticGeneratorInFixed479 K, quadraticModel_relation479 K⟩

theorem quadraticModelToFixed479_injective :
    Function.Injective (quadraticModelToFixed479 K) := by
  apply (QuadraticAlgebra.lift_injective_iff (quadraticModel_relation479 K)).mpr
  rw [LinearIndependent.pair_iff' one_ne_zero]
  intro a ha
  apply quadraticGenerator479_not_rational K a
  have h := congrArg (fun x : quadraticFixedField479 K => (x : K)) ha
  simpa only [IntermediateField.coe_smul, IntermediateField.coe_one,
    Algebra.smul_def, mul_one, IntermediateField.coe_algebraMap_apply,
    quadraticGeneratorInFixed479] using h

theorem quadraticModelToFixed479_surjective :
    Function.Surjective (quadraticModelToFixed479 K) := by
  intro x
  obtain ⟨a, b, hx⟩ := quadraticFixedField479_coordinates K (x : K) x.property
  refine ⟨⟨a, b⟩, ?_⟩
  apply Subtype.ext
  simpa only [quadraticModelToFixed479, QuadraticAlgebra.lift_apply_apply,
    IntermediateField.coe_add, IntermediateField.coe_smul,
    IntermediateField.coe_one, Algebra.smul_def, mul_one,
    IntermediateField.coe_algebraMap_apply,
    quadraticGeneratorInFixed479] using hx.symm

def quadraticModelEquiv479 :
    QuadraticAlgebra ℚ (-479) 0 ≃ₐ[ℚ] quadraticFixedField479 K :=
  AlgEquiv.ofBijective (quadraticModelToFixed479 K)
    ⟨quadraticModelToFixed479_injective K, quadraticModelToFixed479_surjective K⟩

@[simp] theorem quadraticModelEquiv479_coe (a b : ℚ) :
    ((quadraticModelEquiv479 K ⟨a, b⟩ : quadraticFixedField479 K) : K) =
      (a : K) + (b : K) * quadraticGenerator479 K := by
  change ((a • (1 : quadraticFixedField479 K) +
    b • quadraticGeneratorInFixed479 K : quadraticFixedField479 K) : K) = _
  simp only [IntermediateField.coe_add, IntermediateField.coe_smul,
    IntermediateField.coe_one, Algebra.smul_def, mul_one,
    IntermediateField.coe_algebraMap_apply, quadraticGeneratorInFixed479]

omit [NumberField K] [IsCyclotomicExtension {479} ℚ K] in
private theorem quadraticModel_norm479 (a b : ℚ) :
    Algebra.norm ℚ (⟨a, b⟩ : QuadraticAlgebra ℚ (-479) 0) = a ^ 2 + 479 * b ^ 2 := by
  rw [Algebra.norm_apply]
  have hlinear :
      Algebra.lmul ℚ (QuadraticAlgebra ℚ (-479) 0) ⟨a, b⟩ =
        DistribSMul.toLinearMap ℚ (QuadraticAlgebra ℚ (-479) 0)
          (⟨a, b⟩ : QuadraticAlgebra ℚ (-479) 0) := by
    ext x
    rfl
  rw [hlinear, QuadraticAlgebra.det_toLinearMap_eq_norm]
  simp only [QuadraticAlgebra.norm_def]
  ring

theorem quadraticFixedField479_norm_coordinates
    (x : quadraticFixedField479 K) (a b : ℚ)
    (hx : (x : K) = (a : K) + (b : K) * quadraticGenerator479 K) :
    Algebra.norm ℚ x = a ^ 2 + 479 * b ^ 2 := by
  have he : quadraticModelEquiv479 K ⟨a, b⟩ = x := by
    apply Subtype.ext
    rw [quadraticModelEquiv479_coe]
    exact hx.symm
  rw [← he, Algebra.norm_eq_of_algEquiv]
  exact quadraticModel_norm479 a b

theorem quadratic_integer_norm_nonnegative479 (x : 𝓞 (quadraticFixedField479 K)) :
    0 ≤ Algebra.norm ℤ x := by
  obtain ⟨a, b, hx⟩ := quadraticFixedField479_coordinates K
    ((x : quadraticFixedField479 K) : K) (x : quadraticFixedField479 K).property
  have hnorm := quadraticFixedField479_norm_coordinates K (x : quadraticFixedField479 K)
    a b hx
  have hnonneg : (0 : ℚ) ≤ (Algebra.norm ℤ x : ℚ) := by
    rw [Algebra.coe_norm_int, hnorm]
    nlinarith [sq_nonneg a, sq_nonneg b]
  exact_mod_cast hnonneg

theorem quadratic_integer_absNorm_ne599 (x : 𝓞 (quadraticFixedField479 K)) :
    (Algebra.norm ℤ x).natAbs ≠ 599 := by
  intro habs
  have hn : Algebra.norm ℤ x = 599 := by
    simpa only [habs] using
      (Int.natAbs_of_nonneg (quadratic_integer_norm_nonnegative479 K x)).symm
  obtain ⟨a, b, hx⟩ := quadraticFixedField479_coordinates K
    ((x : quadraticFixedField479 K) : K) (x : quadraticFixedField479 K).property
  let v : 𝓞 K := ⟨((x : quadraticFixedField479 K) : K),
    map_isIntegral_int (algebraMap (quadraticFixedField479 K) K) x.isIntegral_coe⟩
  obtain ⟨A, hA⟩ := integer_trace_coordinate K v a b hx
  have hnorm : a ^ 2 + 479 * b ^ 2 = 599 := by
    rw [← quadraticFixedField479_norm_coordinates K (x : quadraticFixedField479 K) a b hx,
      ← Algebra.coe_norm_int, hn]
    norm_num
  apply no_norm_prime_rational A (2 * b)
  rw [hA]
  nlinarith [hnorm]

def quadraticIntegerGenerator479 : 𝓞 (quadraticFixedField479 K) :=
  ⟨quadraticGeneratorInFixed479 K, by
    apply IsIntegral.of_pow (n := 2) (by decide)
    rw [quadraticGeneratorInFixed479_sq]
    exact (isIntegral_algebraMap :
      IsIntegral ℤ (algebraMap ℤ (quadraticFixedField479 K) (-479)))⟩

def quadraticFifthWitness479 : 𝓞 (quadraticFixedField479 K) :=
  8054400 + 159859 * quadraticIntegerGenerator479 K

def quadraticFifthConjugate479 : 𝓞 (quadraticFixedField479 K) :=
  8054400 - 159859 * quadraticIntegerGenerator479 K

theorem quadraticFifthWitness479_sum :
    quadraticFifthWitness479 K + quadraticFifthConjugate479 K = 16108800 := by
  unfold quadraticFifthWitness479 quadraticFifthConjugate479
  ring

theorem quadraticFifthWitness479_product :
    quadraticFifthWitness479 K * quadraticFifthConjugate479 K = 599 ^ 5 := by
  apply Subtype.ext
  change ((8054400 : quadraticFixedField479 K) +
    159859 * quadraticGeneratorInFixed479 K) *
      (8054400 - 159859 * quadraticGeneratorInFixed479 K) = 599 ^ 5
  linear_combination -(159859 : quadraticFixedField479 K) ^ 2 *
    quadraticGeneratorInFixed479_sq K

theorem quadraticFifthWitness479_norm :
    Algebra.norm ℤ (quadraticFifthWitness479 K) = 599 ^ 5 := by
  apply Int.cast_injective (α := ℚ)
  rw [Algebra.coe_norm_int]
  have hcoords :
      (((quadraticFifthWitness479 K : 𝓞 (quadraticFixedField479 K)) :
          quadraticFixedField479 K) : K) =
        (8054400 : K) + 159859 * quadraticGenerator479 K := by
    rfl
  rw [quadraticFixedField479_norm_coordinates K
    (quadraticFifthWitness479 K : quadraticFixedField479 K) 8054400 159859
      (by simpa only [Rat.cast_ofNat] using hcoords)]
  norm_num

theorem quadraticFifthWitness479_absNorm :
    (Algebra.norm ℤ (quadraticFifthWitness479 K)).natAbs = 599 ^ 5 := by
  rw [quadraticFifthWitness479_norm]
  norm_num

end HadamardAutomorphism
