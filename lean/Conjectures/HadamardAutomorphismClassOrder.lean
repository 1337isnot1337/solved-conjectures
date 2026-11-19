import Conjectures.HadamardAutomorphismQuadraticNorm
import Conjectures.HadamardAutomorphismClassGroup

/-! The separate class-order assertion for the actual quadratic fixed field.
The explicit algebraic integers produce the prime ideal through Dedekind
factorization; no splitting or class-number assertion is assumed. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField
open scoped nonZeroDivisors

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem exists_prime_above599_class_order_five :
    ∃ P : (Ideal (𝓞 (quadraticFixedField479 K)))⁰,
      (P : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime ∧
      (P : Ideal (𝓞 (quadraticFixedField479 K))).absNorm = 599 ∧
      (P : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver
        (Ideal.span {(599 : ℤ)}) ∧
      orderOf (ClassGroup.mk0 P) = 5 := by
  exact class_order_five_from_conjugate_witness
    (quadraticFifthWitness479 K) (quadraticFifthConjugate479 K)
    (quadraticFifthWitness479_product K) (quadraticFifthWitness479_sum K)
    (quadraticFifthWitness479_absNorm K) (quadratic_integer_absNorm_ne599 K)

end HadamardAutomorphism
