import Conjectures.HadamardAutomorphismDeterminantNorm
import Conjectures.HadamardAutomorphismAutocorrelation
import Conjectures.HadamardAutomorphismCyclotomicPrimes
import Conjectures.HadamardAutomorphismDescent
import Mathlib.RingTheory.Ideal.GoingUp

/-! Assembly of the Fourier determinant obstruction over the actual ring of
integers of the 479th cyclotomic field. All binary supports are extracted from
the given sign matrix. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped BigOperators Matrix Pointwise

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

local instance obstructionPrime599Fact : Fact (Nat.Prime 599) := ⟨prime_599⟩
local instance obstructionIntegerStarRing479 : StarRing (𝓞 K) := integerCyclotomicStarRing479 K

theorem norm_divisible_of_mem_prime599 (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] (u : 𝓞 K) (hu : u ∈ P) :
    (599 : 𝓞 K) ∣ u * (conjugation479 K • u) := by
  apply Ideal.mem_span_singleton.mp
  rw [← prime599_ideal_intersection K P]
  exact ⟨P.mul_mem_right _ hu,
    (conjugation479 K • P).mul_mem_left _
      (Ideal.smul_mem_pointwise_smul (conjugation479 K) u P hu)⟩

theorem support_sum_not_mem_prime599 (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] (D : Finset (ZMod 479))
    (hne : D.Nonempty) (hproper : D ≠ Finset.univ) :
    (∑ a ∈ D, integerCyclotomicChar479 K a) ∉ P := by
  intro hu
  have hd := norm_divisible_of_mem_prime599 K P _ hu
  rcases support_norm_divisible_forces_constant K D hd with he | hf
  · exact hne.ne_empty he
  · exact hproper hf

theorem indicator_nonzero_mod_prime599
    (H : Matrix (OrbitIndex (Fin 5) (ZMod 479))
      (OrbitIndex (Fin 5) (ZMod 479)) (𝓞 K))
    (hX : (indicatorFourierBlock H (integerCyclotomicChar479 K))ᴴ *
      indicatorFourierBlock H (integerCyclotomicChar479 K) =
      (599 : 𝓞 K) • (1 : Matrix (Fin 5) (Fin 5) (𝓞 K)))
    (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    (indicatorFourierBlock H (integerCyclotomicChar479 K)).map
      (Ideal.Quotient.mk P) ≠ 0 := by
  obtain ⟨i, j, hne, hproper⟩ := indicator_exists_nonconstant H
    (integerCyclotomicChar479 K) (integerCyclotomicChar479_nontrivial K) hX
  intro hz
  have he := congrArg (fun M : Matrix (Fin 5) (Fin 5) ((𝓞 K) ⧸ P) => M i j) hz
  have hm : indicatorFourierBlock H (integerCyclotomicChar479 K) i j ∈ P := by
    apply Ideal.Quotient.eq_zero_iff_mem.mp
    exact he
  exact support_sum_not_mem_prime599 K P (negativeBlock H i j) hne hproper hm

omit [NumberField K] [IsCyclotomicExtension {479} ℚ K] in
theorem prime599_mem_of_liesOver (P : Ideal (𝓞 K))
    [P.LiesOver (Ideal.span {(599 : ℤ)})] : (599 : 𝓞 K) ∈ P := by
  simpa only [map_ofNat] using
    (P.mem_of_liesOver (Ideal.span {(599 : ℤ)}) (599 : ℤ)).mp
      (Ideal.mem_span_singleton_self (599 : ℤ))

/-- The literal five-by-five indicator Fourier matrix gives an impossible
algebraic integer of norm 599 cubed. -/
theorem cyclic_integer_hadamard_impossible
    (H : Matrix (OrbitIndex (Fin 5) (ZMod 479))
      (OrbitIndex (Fin 5) (ZMod 479)) (𝓞 K))
    (hH : Hᴴ * H = (2396 : 𝓞 K) • (1 : Matrix
      (OrbitIndex (Fin 5) (ZMod 479)) (OrbitIndex (Fin 5) (ZMod 479)) (𝓞 K)))
    (hsign : ∀ i j a, H (some (i, 0)) (some (j, a)) = 1 ∨
      H (some (i, 0)) (some (j, a)) = -1)
    (hfixed : ∀ j b, H none (some (j, b)) = H none (some (j, 0)))
    (hblock : ∀ i j a b,
      H (some (i, a)) (some (j, b)) = H (some (i, 0)) (some (j, b - a))) : False := by
  let χ := integerCyclotomicChar479 K
  let X := indicatorFourierBlock H χ
  have hX : Xᴴ * X = (599 : 𝓞 K) • (1 : Matrix (Fin 5) (Fin 5) (𝓞 K)) :=
    indicator_gram_599 H χ (integerCyclotomicChar479_nontrivial K)
      (integerCyclotomicChar479_star_norm K) hH hsign hfixed hblock
  let : (Ideal.span {(599 : ℤ)}).IsMaximal := Int.ideal_span_isMaximal_of_prime 599
  obtain ⟨P, hP, hover⟩ := Ideal.exists_maximal_ideal_liesOver_of_isIntegral
    (S := 𝓞 K) (Ideal.span {(599 : ℤ)})
  let := hP
  let := hover
  let Q : Ideal (𝓞 K) := conjugation479 K • P
  let : Q.IsMaximal := Ideal.IsMaximal.of_liesOver_isMaximal Q
    (Ideal.span {(599 : ℤ)})
  have hdiv : (599 : 𝓞 K) ∣ X.det := determinant_divisible_of_gram_two_primes X P Q
    (prime599_mem_of_liesOver K P) (prime599_mem_of_liesOver K Q)
    (prime599_ideal_intersection K P) hX
    (indicator_nonzero_mod_prime599 K H hX P)
    (indicator_nonzero_mod_prime599 K H hX Q)
  obtain ⟨u, _, hu⟩ := determinant_quotient_norm_cube X (by decide) hX hdiv
  apply cyclotomic_norm_cube_impossible K u
  have h := congrArg (algebraMap (𝓞 K) K) hu
  rw [map_mul, map_pow, map_ofNat] at h
  change (u : K) * conjugation479 K (u : K) = (599 : K) ^ 3 at h
  exact h

end HadamardAutomorphism
