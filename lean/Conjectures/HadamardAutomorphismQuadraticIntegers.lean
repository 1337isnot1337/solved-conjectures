import Conjectures.HadamardAutomorphismQuadraticNorm

/-! Integer coordinates and equal parity in the actual quadratic fixed field. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem quadratic_integer_coordinates479
    (x : 𝓞 (quadraticFixedField479 K)) :
    ∃ A B : ℤ,
      (((x : quadraticFixedField479 K) : K) =
        ((A : K) + (B : K) * quadraticGenerator479 K) / 2) ∧
      A % 2 = B % 2 ∧
      A ^ 2 + 479 * B ^ 2 = 4 * Algebra.norm ℤ x := by
  obtain ⟨a, b, hx⟩ := quadraticFixedField479_coordinates K
    ((x : quadraticFixedField479 K) : K) (x : quadraticFixedField479 K).property
  let v : 𝓞 K := ⟨((x : quadraticFixedField479 K) : K),
    map_isIntegral_int (algebraMap (quadraticFixedField479 K) K) x.isIntegral_coe⟩
  obtain ⟨A, hA⟩ := integer_trace_coordinate K v a b hx
  have hnorm : (Algebra.norm ℤ x : ℚ) = a ^ 2 + 479 * b ^ 2 := by
    rw [Algebra.coe_norm_int]
    exact quadraticFixedField479_norm_coordinates K (x : quadraticFixedField479 K) a b hx
  have hden : (2 * b).den = 1 :=
    rational_den_one_of_prime_square (2 * b) (4 * Algebra.norm ℤ x - A ^ 2) (by
      push_cast
      rw [hA]
      nlinarith [hnorm])
  let B : ℤ := (2 * b).num
  have hB : (B : ℚ) = 2 * b := Rat.coe_int_num_of_den_eq_one hden
  have hnormZ : A ^ 2 + 479 * B ^ 2 = 4 * Algebra.norm ℤ x := by
    exact_mod_cast (show (A : ℚ) ^ 2 + 479 * (B : ℚ) ^ 2 =
        4 * (Algebra.norm ℤ x : ℚ) by
      rw [hA, hB]
      nlinarith [hnorm])
  have hparity : A % 2 = B % 2 := by
    have hmod := congrArg (fun n : ℤ => n % 2) hnormZ
    rcases Int.emod_two_eq_zero_or_one A with hA2 | hA2 <;>
      rcases Int.emod_two_eq_zero_or_one B with hB2 | hB2 <;>
      norm_num [Int.add_emod, Int.mul_emod, pow_two, hA2, hB2] at hmod ⊢
  have hAK : (A : K) = 2 * (a : K) := by exact_mod_cast hA
  have hBK : (B : K) = 2 * (b : K) := by exact_mod_cast hB
  refine ⟨A, B, ?_, hparity, hnormZ⟩
  apply (eq_div_iff (by norm_num : (2 : K) ≠ 0)).mpr
  rw [hx, hAK, hBK]
  ring

end HadamardAutomorphism
