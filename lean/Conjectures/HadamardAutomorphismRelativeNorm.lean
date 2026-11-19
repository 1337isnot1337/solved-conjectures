import Conjectures.HadamardAutomorphismQuadraticIntegers
import Conjectures.HadamardAutomorphismClassPair
import Conjectures.HadamardAutomorphismClassArithmetic
import Conjectures.HadamardAutomorphismCyclotomicPrimes
import Conjectures.HadamardAutomorphismNormFactorization
import Mathlib.RingTheory.Ideal.Norm.RelNorm

/-! An independent cyclotomic norm obstruction through relative ideal norms and ideal classes. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped nonZeroDivisors Pointwise

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

local instance relativeNorm479_moduleFinite :
    Module.Finite (𝓞 (quadraticFixedField479 K)) (𝓞 K) :=
  Module.Finite.of_restrictScalars_finite ℤ (𝓞 (quadraticFixedField479 K)) (𝓞 K)

attribute [local instance] FractionRing.liftAlgebra

theorem prime599_individual_inertia (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] : P.inertiaDeg ℤ = 239 := by
  let : IsGalois ℚ K := IsCyclotomicExtension.isGalois {479} ℚ K
  rw [← Ideal.inertiaDegIn_eq_inertiaDeg
    (Ideal.span {(599 : ℤ)}) P (K ≃ₐ[ℚ] K)]
  exact prime599_inertia_degree K

def quadraticPrimeUnder479 (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    (Ideal (𝓞 (quadraticFixedField479 K)))⁰ :=
  ⟨P.under (𝓞 (quadraticFixedField479 K)), mem_nonZeroDivisors_of_ne_zero (by
    apply Ideal.ne_bot_of_liesOver_of_ne_bot
      (p := Ideal.span {(599 : ℤ)})
    rw [ne_eq, Ideal.span_singleton_eq_bot]
    norm_num)⟩

@[simp] theorem quadraticPrimeUnder479_coe (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    (quadraticPrimeUnder479 K P : Ideal (𝓞 (quadraticFixedField479 K))) =
      P.under (𝓞 (quadraticFixedField479 K)) := by
  simp only [quadraticPrimeUnder479]

theorem prime599_quadratic_inertia
    (p : (Ideal (𝓞 (quadraticFixedField479 K)))⁰)
    (hp : (p : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime)
    (hover : (p : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver
      (Ideal.span {(599 : ℤ)})) :
    (p : Ideal (𝓞 (quadraticFixedField479 K))).inertiaDeg ℤ = 1 := by
  let : (p : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime := hp
  let : (p : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver
    (Ideal.span {(599 : ℤ)}) := hover
  have h := Ideal.pow_inertiaDeg 599 (p : Ideal (𝓞 (quadraticFixedField479 K)))
  rw [every_prime_above599_absNorm K p hp hover] at h
  exact Nat.pow_right_injective (by decide : 2 ≤ 599) (by simpa only [pow_one] using h)

theorem prime599_relative_inertia (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    P.inertiaDeg (𝓞 (quadraticFixedField479 K)) = 239 := by
  have hp := prime599_quadratic_inertia K (quadraticPrimeUnder479 K P)
    (by change (P.under (𝓞 (quadraticFixedField479 K))).IsPrime; infer_instance)
    (by change (P.under (𝓞 (quadraticFixedField479 K))).LiesOver
          (Ideal.span {(599 : ℤ)}); infer_instance)
  change (P.under (𝓞 (quadraticFixedField479 K))).inertiaDeg ℤ = 1 at hp
  have h := Ideal.inertiaDeg_tower (R := ℤ)
    (P.under (𝓞 (quadraticFixedField479 K))) P
  rw [prime599_individual_inertia K P, hp, one_mul] at h
  exact h.symm

theorem prime599_relative_ideal_norm (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    Ideal.relNorm (𝓞 (quadraticFixedField479 K)) P =
      (P.under (𝓞 (quadraticFixedField479 K))) ^ 239 := by
  let : P.IsMaximal :=
    Ideal.IsMaximal.of_liesOver_isMaximal P (Ideal.span {(599 : ℤ)})
  let : (P.under (𝓞 (quadraticFixedField479 K))).IsMaximal :=
    Ideal.IsMaximal.of_liesOver_isMaximal
      (P.under (𝓞 (quadraticFixedField479 K))) (Ideal.span {(599 : ℤ)})
  rw [Ideal.relNorm_eq_pow_of_isMaximal P
    (P.under (𝓞 (quadraticFixedField479 K))), prime599_relative_inertia K P]

theorem quadraticIntegerConjugation479_algebraMap
    (x : 𝓞 (quadraticFixedField479 K)) :
    conjugation479 K • (algebraMap (𝓞 (quadraticFixedField479 K)) (𝓞 K) x) =
      algebraMap (𝓞 (quadraticFixedField479 K)) (𝓞 K)
        (quadraticIntegerConjugation479 K x) := by
  apply RingOfIntegers.ext
  change conjugation479 K ((x : quadraticFixedField479 K) : K) =
    (quadraticConjugation479 K (x : quadraticFixedField479 K) : K)
  exact (quadraticConjugation479_coe K (x : quadraticFixedField479 K)).symm

theorem conjugate_prime_under479 (P : Ideal (𝓞 K)) :
    (conjugation479 K • P).under (𝓞 (quadraticFixedField479 K)) =
      Ideal.map (quadraticIntegerConjugation479 K).toRingHom
        (P.under (𝓞 (quadraticFixedField479 K))) := by
  have ht : (conjugation479 K)⁻¹ = conjugation479 K :=
    inv_eq_of_mul_eq_one_left (by simpa only [pow_two] using conjugation479_sq K)
  have hr (x : 𝓞 (quadraticFixedField479 K)) :
      (quadraticIntegerConjugation479 K).symm x = quadraticIntegerConjugation479 K x := by
    apply (quadraticIntegerConjugation479 K).injective
    rw [RingEquiv.apply_symm_apply, quadraticIntegerConjugation479_involutive K]
  rw [RingEquiv.toRingHom_eq_coe]
  ext x
  rw [Ideal.mem_under, Ideal.mem_pointwise_smul_iff_inv_smul_mem, ht,
    ← Ideal.symm_apply_mem_of_equiv_iff, hr, Ideal.mem_under,
    quadraticIntegerConjugation479_algebraMap K x]

theorem quadraticPrimeUnder479_conjugate (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    quadraticPrimeUnder479 K (conjugation479 K • P) =
      conjugateQuadraticIdeal479 K (quadraticPrimeUnder479 K P) := by
  apply Subtype.ext
  exact conjugate_prime_under479 K P

theorem principal_norm_class_exponent479 (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] (u : 𝓞 K) (a b : ℕ)
    (hfactor : Ideal.span {u} = P ^ a * (conjugation479 K • P) ^ b) :
    ClassGroup.mk0 (quadraticPrimeUnder479 K P) ^
      (239 * ((a : ℤ) - (b : ℤ))) = 1 := by
  let p := quadraticPrimeUnder479 K P
  let q := conjugateQuadraticIdeal479 K p
  have hp : (p : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime := by
    change (P.under (𝓞 (quadraticFixedField479 K))).IsPrime
    infer_instance
  have hover : (p : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver
      (Ideal.span {(599 : ℤ)}) := by
    change (P.under (𝓞 (quadraticFixedField479 K))).LiesOver _
    infer_instance
  have hqcoe : (q : Ideal (𝓞 (quadraticFixedField479 K))) =
      (conjugation479 K • P).under (𝓞 (quadraticFixedField479 K)) :=
    (conjugate_prime_under479 K P).symm
  have hn := congrArg (Ideal.relNorm (𝓞 (quadraticFixedField479 K))) hfactor
  rw [Ideal.relNorm_singleton, map_mul, map_pow, map_pow,
    prime599_relative_ideal_norm K P,
    prime599_relative_ideal_norm K (conjugation479 K • P),
    ← pow_mul, ← pow_mul] at hn
  let J : (Ideal (𝓞 (quadraticFixedField479 K)))⁰ := p ^ (239 * a) * q ^ (239 * b)
  have hJ : (J : Ideal (𝓞 (quadraticFixedField479 K))) =
      Ideal.span {Algebra.intNorm (𝓞 (quadraticFixedField479 K)) (𝓞 K) u} := by
    change (p : Ideal (𝓞 (quadraticFixedField479 K))) ^ (239 * a) *
      (q : Ideal (𝓞 (quadraticFixedField479 K))) ^ (239 * b) = _
    rw [hqcoe]
    exact hn.symm
  have hprincipal : (J : Ideal (𝓞 (quadraticFixedField479 K))).IsPrincipal := by
    rw [hJ]
    infer_instance
  have hc := (ClassGroup.mk0_eq_one_iff J.property).mpr hprincipal
  change ClassGroup.mk0 (p ^ (239 * a) * q ^ (239 * b)) = 1 at hc
  rw [map_mul, map_pow, map_pow] at hc
  have hinv := every_prime_above599_conjugate_class_inverse K p hp hover
  have hq : ClassGroup.mk0 q = (ClassGroup.mk0 p)⁻¹ := by
    simpa only [inv_inv] using
      (congrArg (fun x : ClassGroup (𝓞 (quadraticFixedField479 K)) => x⁻¹) hinv).symm
  rw [hq, inv_pow, ← div_eq_mul_inv] at hc
  have he : (239 : ℤ) * ((a : ℤ) - (b : ℤ)) =
      ((239 * a : ℕ) : ℤ) - ((239 * b : ℕ) : ℤ) := by
    push_cast
    ring
  rw [he, zpow_sub, zpow_natCast, zpow_natCast]
  exact hc

theorem no_principal_norm_cube_factorization479 (P : Ideal (𝓞 K)) [P.IsPrime]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] (u : 𝓞 K) (a b : ℕ)
    (hab : a + b = 3) :
    Ideal.span {u} ≠ P ^ a * (conjugation479 K • P) ^ b := by
  intro hfactor
  have horder := every_prime_above599_class_order_five K (quadraticPrimeUnder479 K P)
    (by change (P.under (𝓞 (quadraticFixedField479 K))).IsPrime; infer_instance)
    (by change (P.under (𝓞 (quadraticFixedField479 K))).LiesOver
          (Ideal.span {(599 : ℤ)}); infer_instance)
  exact class_order_five_excludes_norm_cube _ horder a b hab
    (principal_norm_class_exponent479 K P u a b hfactor)

/-- The alternative ideal-class proof, without using the unit-descent obstruction. -/
theorem cyclotomic_norm_cube_impossible_by_class_group (u : 𝓞 K) :
    (u : K) * conjugation479 K u ≠ (599 : K) ^ 3 := by
  intro hnorm
  obtain ⟨P, hP, hover⟩ := Ideal.exists_maximal_ideal_liesOver_of_isIntegral
    (S := 𝓞 K) (Ideal.span {(599 : ℤ)})
  let : P.IsMaximal := hP
  let : P.LiesOver (Ideal.span {(599 : ℤ)}) := hover
  obtain ⟨a, b, hab, hfactor⟩ :=
    norm_cube_principal_factorization479_of_coe K P u hnorm
  exact no_principal_norm_cube_factorization479 K P u a b hab hfactor

end HadamardAutomorphism
