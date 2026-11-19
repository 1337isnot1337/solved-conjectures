import Conjectures.HadamardAutomorphismCyclotomicGauss
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.Tactic.LinearCombination

/-! Rational coordinates of the actual quadratic fixed field. For integral
elements the rational trace coordinate is an integer. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem quadraticGenerator479_not_rational (a : ℚ) :
    (a : K) ≠ quadraticGenerator479 K := by
  intro h
  have hc := congrArg (conjugation479 K) h
  rw [map_ratCast, quadraticGenerator479_conjugate] at hc
  have hz : quadraticGenerator479 K = 0 := by
    linear_combination (1 / 2 : K) * hc - (1 / 2 : K) * h
  have hs := quadraticGenerator479_sq K
  rw [hz] at hs
  norm_num at hs

def quadraticGeneratorInFixed479 : quadraticFixedField479 K :=
  ⟨quadraticGenerator479 K,
    (mem_quadraticFixedField479 K _).mpr (quadraticGenerator479_fixed K)⟩

theorem quadraticFixedField479_coordinates (v : K) (hv : v ∈ quadraticFixedField479 K) :
    ∃ a b : ℚ, v = (a : K) + (b : K) * quadraticGenerator479 K := by
  let g : quadraticFixedField479 K := quadraticGeneratorInFixed479 K
  have hli : LinearIndependent ℚ ![(1 : quadraticFixedField479 K), g] := by
    rw [LinearIndependent.pair_iff' one_ne_zero]
    intro a ha
    apply quadraticGenerator479_not_rational K a
    have h := congrArg (fun x : quadraticFixedField479 K => (x : K)) ha
    simpa only [IntermediateField.coe_smul, IntermediateField.coe_one,
      Algebra.smul_def, mul_one,
      quadraticGeneratorInFixed479, g] using h
  have hcard : Fintype.card (Fin 2) = Module.finrank ℚ (quadraticFixedField479 K) := by
    rw [Fintype.card_fin, quadraticFixedField479_degree K]
  let B := basisOfLinearIndependentOfCardEqFinrank hli hcard
  let w : quadraticFixedField479 K := ⟨v, hv⟩
  refine ⟨B.repr w 0, B.repr w 1, ?_⟩
  have h := B.sum_repr w
  have he : B.repr w 0 • (1 : quadraticFixedField479 K) + B.repr w 1 • g = w := by
    simpa only [Fin.sum_univ_two, B, coe_basisOfLinearIndependentOfCardEqFinrank,
      Matrix.cons_val_zero, Matrix.cons_val_one] using h
  have he' := congrArg (fun x : quadraticFixedField479 K => (x : K)) he
  simpa only [IntermediateField.coe_add, IntermediateField.coe_smul,
    IntermediateField.coe_one, Algebra.smul_def, mul_one,
    quadraticGeneratorInFixed479, g, w] using he'.symm

theorem conjugate_of_quadratic_coordinates (v : K) (a b : ℚ)
    (hv : v = (a : K) + (b : K) * quadraticGenerator479 K) :
    conjugation479 K v = (a : K) - (b : K) * quadraticGenerator479 K := by
  rw [hv, map_add, map_mul, map_ratCast, map_ratCast, quadraticGenerator479_conjugate]
  ring

theorem integer_trace_coordinate (v : 𝓞 K) (a b : ℚ)
    (hv : (v : K) = (a : K) + (b : K) * quadraticGenerator479 K) :
    ∃ A : ℤ, (A : ℚ) = 2 * a := by
  have hi : IsIntegral ℤ ((v : K) + conjugation479 K v) :=
    v.isIntegral_coe.add (map_isIntegral_int (conjugation479 K) v.isIntegral_coe)
  have he : (v : K) + conjugation479 K v = ((2 * a : ℚ) : K) := by
    rw [conjugate_of_quadratic_coordinates K (v : K) a b hv, hv]
    push_cast
    ring
  rw [he, isIntegral_ratCast_iff] at hi
  obtain ⟨A, hA⟩ := IsIntegrallyClosed.algebraMap_eq_of_integral hi
  exact ⟨A, hA⟩

theorem norm_of_quadratic_coordinates (v : K) (a b : ℚ)
    (hv : v = (a : K) + (b : K) * quadraticGenerator479 K) :
    v * conjugation479 K v = ((a ^ 2 + 479 * b ^ 2 : ℚ) : K) := by
  rw [conjugate_of_quadratic_coordinates K v a b hv, hv]
  push_cast
  linear_combination -((b : K) ^ 2) * quadraticGenerator479_sq K

end HadamardAutomorphism
