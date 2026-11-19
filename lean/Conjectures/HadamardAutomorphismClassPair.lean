import Conjectures.HadamardAutomorphismClassOrder
import Mathlib.RingTheory.UniqueFactorizationDomain.Multiplicity

/-! The actual primes above 599 in the quadratic fixed field: norms, ideal classes, and conjugation. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField
open scoped nonZeroDivisors

theorem ideal_eq_of_fifth_power_eq
    {R : Type*} [CommRing R] [IsDedekindDomain R]
    (I J : Ideal R) (h : I ^ 5 = J ^ 5) : I = J := by
  apply le_antisymm
  · exact Ideal.dvd_iff_le.mp
      ((UniqueFactorizationMonoid.pow_dvd_pow_iff_dvd (by decide : 5 ≠ 0)).mp
        (dvd_of_eq h.symm))
  · exact Ideal.dvd_iff_le.mp
      ((UniqueFactorizationMonoid.pow_dvd_pow_iff_dvd (by decide : 5 ≠ 0)).mp
        (dvd_of_eq h))

set_option maxHeartbeats 1000000 in
theorem prime_fifth_root_from_conjugate_witness
    {F : Type*} [Field F] [NumberField F] (a b : 𝓞 F)
    (hprod : a * b = 599 ^ 5) (hsum : a + b = 16108800)
    (hnorm : (Algebra.norm ℤ a).natAbs = 599 ^ 5) :
    ∃ P : (Ideal (𝓞 F))⁰,
      (P : Ideal (𝓞 F)).IsPrime ∧
      (P : Ideal (𝓞 F)).absNorm = 599 ∧
      (P : Ideal (𝓞 F)) ^ 5 = Ideal.span {a} := by
  have hcop := principal_witness_ideals_coprime a b hprod hsum
  have hidprod : Ideal.span {a} * Ideal.span {b} = Ideal.span {(599 : 𝓞 F)} ^ 5 := by
    rw [Ideal.span_singleton_mul_span_singleton, hprod, Ideal.span_singleton_pow]
  have hgcd : IsUnit (gcd (Ideal.span {a}) (Ideal.span {b})) :=
    hcop.isUnit_of_dvd' (gcd_dvd_left _ _) (gcd_dvd_right _ _)
  obtain ⟨P, hP⟩ := exists_associated_pow_of_mul_eq_pow hgcd hidprod
  have hPpow : P ^ 5 = Ideal.span {a} := associated_iff_eq.mp hP
  have hnormpow : P.absNorm ^ 5 = 599 ^ 5 := by
    rw [← map_pow, hPpow, Ideal.absNorm_span_singleton, hnorm]
  have hPnorm : P.absNorm = 599 := Nat.pow_left_injective (by decide) hnormpow
  have hnormprime : Nat.Prime P.absNorm := by
    rw [hPnorm]
    exact prime_599
  have hprime : P.IsPrime := Ideal.isPrime_of_irreducible_absNorm
    ((Nat.irreducible_iff_nat_prime _).mpr hnormprime)
  have hP0 : P ≠ 0 := by
    intro hzero
    simp [hzero] at hPnorm
  exact ⟨⟨P, mem_nonZeroDivisors_of_ne_zero hP0⟩, hprime, hPnorm, hPpow⟩

theorem prime_above599_eq_factor_of_pair
    {F : Type*} [Field F] [NumberField F]
    (P Q R : (Ideal (𝓞 F))⁰)
    (hP : (P : Ideal (𝓞 F)).IsPrime)
    (hQ : (Q : Ideal (𝓞 F)).IsPrime)
    (hR : (R : Ideal (𝓞 F)).IsPrime)
    (hover : (R : Ideal (𝓞 F)).LiesOver (Ideal.span {(599 : ℤ)}))
    (hPQ : (P : Ideal (𝓞 F)) * (Q : Ideal (𝓞 F)) = Ideal.span {(599 : 𝓞 F)}) :
    R = P ∨ R = Q := by
  let : (R : Ideal (𝓞 F)).LiesOver (Ideal.span {(599 : ℤ)}) := hover
  have h599 : (599 : 𝓞 F) ∈ (R : Ideal (𝓞 F)) := by
    simpa only [map_ofNat] using
      (Ideal.mem_of_liesOver (R : Ideal (𝓞 F)) (Ideal.span {(599 : ℤ)}) 599).mp
        (Ideal.mem_span_singleton_self (599 : ℤ))
  have hRdiv : (R : Ideal (𝓞 F)) ∣ Ideal.span {(599 : 𝓞 F)} :=
    Ideal.dvd_iff_le.mpr ((Ideal.span_singleton_le_iff_mem _).mpr h599)
  have hRp : Prime (R : Ideal (𝓞 F)) :=
    Ideal.prime_of_isPrime (mem_nonZeroDivisors_iff_ne_zero.mp R.property) hR
  have hPp : Prime (P : Ideal (𝓞 F)) :=
    Ideal.prime_of_isPrime (mem_nonZeroDivisors_iff_ne_zero.mp P.property) hP
  have hQp : Prime (Q : Ideal (𝓞 F)) :=
    Ideal.prime_of_isPrime (mem_nonZeroDivisors_iff_ne_zero.mp Q.property) hQ
  rw [← hPQ] at hRdiv
  rcases hRp.dvd_or_dvd hRdiv with h | h
  · exact Or.inl (Subtype.ext (associated_iff_eq.mp (hRp.associated_of_dvd hPp h)))
  · exact Or.inr (Subtype.ext (associated_iff_eq.mp (hRp.associated_of_dvd hQp h)))

set_option maxHeartbeats 1000000 in
theorem all_primes_above599_order_five_of_witnesses
    {F : Type*} [Field F] [NumberField F] (a b : 𝓞 F)
    (hprod : a * b = 599 ^ 5) (hsum : a + b = 16108800)
    (hnorma : (Algebra.norm ℤ a).natAbs = 599 ^ 5)
    (hnormb : (Algebra.norm ℤ b).natAbs = 599 ^ 5)
    (hexcluded : ∀ x : 𝓞 F, (Algebra.norm ℤ x).natAbs ≠ 599)
    (R : (Ideal (𝓞 F))⁰)
    (hR : (R : Ideal (𝓞 F)).IsPrime)
    (hover : (R : Ideal (𝓞 F)).LiesOver (Ideal.span {(599 : ℤ)})) :
    orderOf (ClassGroup.mk0 R) = 5 := by
  obtain ⟨P, hP, hPnorm, hPpow⟩ :=
    prime_fifth_root_from_conjugate_witness a b hprod hsum hnorma
  obtain ⟨Q, hQ, hQnorm, hQpow⟩ :=
    prime_fifth_root_from_conjugate_witness b a
      (by simpa only [mul_comm] using hprod)
      (by simpa only [add_comm] using hsum) hnormb
  have hPQ : (P : Ideal (𝓞 F)) * (Q : Ideal (𝓞 F)) = Ideal.span {(599 : 𝓞 F)} := by
    apply ideal_eq_of_fifth_power_eq
    rw [mul_pow, hPpow, hQpow, Ideal.span_singleton_mul_span_singleton,
      hprod, Ideal.span_singleton_pow]
  have hPord : orderOf (ClassGroup.mk0 P) = 5 := by
    apply ideal_class_order_five_of_nonprincipal_fifth (R := 𝓞 F) P
      (ideal_nonprincipal_of_absNorm_excluded (F := F)
        (P : Ideal (𝓞 F)) 599 hPnorm hexcluded)
    rw [hPpow]
    infer_instance
  have hQord : orderOf (ClassGroup.mk0 Q) = 5 := by
    apply ideal_class_order_five_of_nonprincipal_fifth (R := 𝓞 F) Q
      (ideal_nonprincipal_of_absNorm_excluded (F := F)
        (Q : Ideal (𝓞 F)) 599 hQnorm hexcluded)
    rw [hQpow]
    infer_instance
  rcases prime_above599_eq_factor_of_pair (F := F) P Q R hP hQ hR hover hPQ with h | h
  · simpa only [h] using hPord
  · simpa only [h] using hQord

theorem paired_prime_classes_inverse
    {F : Type*} [Field F] [NumberField F]
    (P Q : (Ideal (𝓞 F))⁰)
    (hPQ : (P : Ideal (𝓞 F)) * (Q : Ideal (𝓞 F)) = Ideal.span {(599 : 𝓞 F)}) :
    ClassGroup.mk0 P = (ClassGroup.mk0 Q)⁻¹ := by
  apply ClassGroup.mk0_eq_mk0_inv_iff.mpr
  exact ⟨599, by norm_num, hPQ⟩

theorem liesOver599_of_absNorm599
    {F : Type*} [Field F] [NumberField F]
    (P : Ideal (𝓞 F)) (hPnorm : P.absNorm = 599) :
    P.LiesOver (Ideal.span {(599 : ℤ)}) := by
  rw [Ideal.liesOver_iff, Ideal.under_def]
  have hp : Nat.Prime P.absNorm := by
    rw [hPnorm]
    exact prime_599
  simpa only [hPnorm, Nat.cast_ofNat] using Ideal.span_singleton_absNorm hp

section ActualQuadraticField

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

set_option maxRecDepth 4096 in
theorem quadraticFifthConjugate479_absNorm :
    (Algebra.norm ℤ (quadraticFifthConjugate479 K)).natAbs = 599 ^ 5 := by
  have hn : Algebra.norm ℤ (quadraticFifthConjugate479 K) = 599 ^ 5 := by
    apply Int.cast_injective (α := ℚ)
    rw [Algebra.coe_norm_int]
    have hcoords0 :
        (((quadraticFifthConjugate479 K : 𝓞 (quadraticFixedField479 K)) :
            quadraticFixedField479 K) : K) =
          (8054400 : K) - 159859 * quadraticGenerator479 K := by
      let ι : 𝓞 (quadraticFixedField479 K) →+* K :=
        (algebraMap (quadraticFixedField479 K) K).comp
          (algebraMap (𝓞 (quadraticFixedField479 K)) (quadraticFixedField479 K))
      have hgen : ι (quadraticIntegerGenerator479 K) = quadraticGenerator479 K := by
        change (quadraticGeneratorInFixed479 K : K) = quadraticGenerator479 K
        exact quadraticGeneratorInFixed479_coe K
      change ι (quadraticFifthConjugate479 K) = _
      rw [quadraticFifthConjugate479, map_sub, map_mul, map_ofNat, map_ofNat, hgen]
    rw [quadraticFixedField479_norm_coordinates K
      (quadraticFifthConjugate479 K : quadraticFixedField479 K) 8054400 (-159859)
        (by simpa only [Rat.cast_ofNat, Rat.cast_neg, neg_mul, sub_eq_add_neg] using hcoords0)]
    norm_num
  rw [hn]
  norm_num

theorem every_prime_above599_class_order_five
    (P : (Ideal (𝓞 (quadraticFixedField479 K)))⁰)
    (hP : (P : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime)
    (hover : (P : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver
      (Ideal.span {(599 : ℤ)})) :
    orderOf (ClassGroup.mk0 P) = 5 := by
  exact all_primes_above599_order_five_of_witnesses
    (quadraticFifthWitness479 K) (quadraticFifthConjugate479 K)
    (quadraticFifthWitness479_product K) (quadraticFifthWitness479_sum K)
    (quadraticFifthWitness479_absNorm K) (quadraticFifthConjugate479_absNorm K)
    (quadratic_integer_absNorm_ne599 K) P hP hover

def quadraticConjugation479 :
    quadraticFixedField479 K ≃ₐ[ℚ] quadraticFixedField479 K := by
  let : Algebra.IsQuadraticExtension ℚ (quadraticFixedField479 K) :=
    ⟨quadraticFixedField479_degree K⟩
  exact (conjugation479 K).restrictNormal (quadraticFixedField479 K)

theorem quadraticConjugation479_coe (x : quadraticFixedField479 K) :
    (quadraticConjugation479 K x : K) = conjugation479 K (x : K) := by
  let : Algebra.IsQuadraticExtension ℚ (quadraticFixedField479 K) :=
    ⟨quadraticFixedField479_degree K⟩
  exact AlgEquiv.restrictNormal_apply (quadraticFixedField479 K) (conjugation479 K) x

theorem quadraticConjugation479_involutive :
    Function.Involutive (quadraticConjugation479 K) := by
  intro x
  apply Subtype.ext
  rw [quadraticConjugation479_coe, quadraticConjugation479_coe,
    conjugation479_apply_apply]

def quadraticIntegerConjugation479 :
    𝓞 (quadraticFixedField479 K) ≃+* 𝓞 (quadraticFixedField479 K) :=
  RingOfIntegers.mapRingEquiv (quadraticConjugation479 K).toRingEquiv

theorem quadraticIntegerConjugation479_involutive :
    Function.Involutive (quadraticIntegerConjugation479 K) := by
  intro x
  apply RingOfIntegers.ext
  change quadraticConjugation479 K (quadraticConjugation479 K (x : quadraticFixedField479 K)) =
    (x : quadraticFixedField479 K)
  exact quadraticConjugation479_involutive K (x : quadraticFixedField479 K)

theorem quadraticIntegerConjugation479_generator :
    quadraticIntegerConjugation479 K (quadraticIntegerGenerator479 K) =
      -quadraticIntegerGenerator479 K := by
  apply RingOfIntegers.ext
  apply Subtype.ext
  change (quadraticConjugation479 K (quadraticGeneratorInFixed479 K) : K) =
    -quadraticGenerator479 K
  rw [quadraticConjugation479_coe, quadraticGeneratorInFixed479_coe,
    quadraticGenerator479_conjugate]

theorem quadraticIntegerConjugation479_witness :
    quadraticIntegerConjugation479 K (quadraticFifthWitness479 K) =
      quadraticFifthConjugate479 K := by
  simp only [quadraticFifthWitness479, quadraticFifthConjugate479, map_add,
    map_mul, map_ofNat, quadraticIntegerConjugation479_generator, mul_neg,
    sub_eq_add_neg]

theorem conjugate_ideal_of_witness_fifth_powers
    (P Q : Ideal (𝓞 (quadraticFixedField479 K)))
    (hP : P ^ 5 = Ideal.span {quadraticFifthWitness479 K})
    (hQ : Q ^ 5 = Ideal.span {quadraticFifthConjugate479 K}) :
    Ideal.map (quadraticIntegerConjugation479 K).toRingHom P = Q := by
  apply ideal_eq_of_fifth_power_eq
  rw [← Ideal.map_pow, hP, Ideal.map_span, Set.image_singleton,
    RingEquiv.toRingHom_eq_coe, RingEquiv.coe_toRingHom,
    quadraticIntegerConjugation479_witness, hQ]

def conjugateQuadraticIdeal479
    (P : (Ideal (𝓞 (quadraticFixedField479 K)))⁰) :
    (Ideal (𝓞 (quadraticFixedField479 K)))⁰ :=
  ⟨Ideal.map (quadraticIntegerConjugation479 K).toRingHom (P : Ideal (𝓞 (quadraticFixedField479 K))),
    mem_nonZeroDivisors_of_ne_zero (by
      intro hzero
      have hP0 := (Ideal.map_eq_bot_iff_of_injective
        (quadraticIntegerConjugation479 K).injective).mp hzero
      exact nonZeroDivisors.coe_ne_zero P hP0)⟩

theorem conjugateQuadraticIdeal479_involutive :
    Function.Involutive (conjugateQuadraticIdeal479 K) := by
  intro P
  apply Subtype.ext
  change Ideal.map (quadraticIntegerConjugation479 K).toRingHom
    (Ideal.map (quadraticIntegerConjugation479 K).toRingHom
      (P : Ideal (𝓞 (quadraticFixedField479 K)))) =
        (P : Ideal (𝓞 (quadraticFixedField479 K)))
  rw [Ideal.map_map]
  have hcomp : (quadraticIntegerConjugation479 K).toRingHom.comp
      (quadraticIntegerConjugation479 K).toRingHom =
        RingHom.id (𝓞 (quadraticFixedField479 K)) := by
    apply RingHom.ext
    intro x
    exact quadraticIntegerConjugation479_involutive K x
  rw [hcomp, Ideal.map_id]

theorem witness_prime_conjugate_class_inverse
    (P Q : (Ideal (𝓞 (quadraticFixedField479 K)))⁰)
    (hP : (P : Ideal (𝓞 (quadraticFixedField479 K))) ^ 5 = Ideal.span {quadraticFifthWitness479 K})
    (hQ : (Q : Ideal (𝓞 (quadraticFixedField479 K))) ^ 5 = Ideal.span {quadraticFifthConjugate479 K})
    (hPQ : (P : Ideal (𝓞 (quadraticFixedField479 K))) *
      (Q : Ideal (𝓞 (quadraticFixedField479 K))) =
        Ideal.span {(599 : 𝓞 (quadraticFixedField479 K))}) :
    ClassGroup.mk0 P = (ClassGroup.mk0 (conjugateQuadraticIdeal479 K P))⁻¹ := by
  have hconj : conjugateQuadraticIdeal479 K P = Q := by
    apply Subtype.ext
    exact conjugate_ideal_of_witness_fifth_powers K P Q hP hQ
  rw [hconj]
  exact paired_prime_classes_inverse P Q hPQ

theorem exists_conjugate_prime_pair599_class_inverse :
    ∃ P Q : (Ideal (𝓞 (quadraticFixedField479 K)))⁰,
      (P : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime ∧
      (Q : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime ∧
      (P : Ideal (𝓞 (quadraticFixedField479 K))).absNorm = 599 ∧
      (Q : Ideal (𝓞 (quadraticFixedField479 K))).absNorm = 599 ∧
      P ≠ Q ∧
      (P : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver (Ideal.span {(599 : ℤ)}) ∧
      (Q : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver (Ideal.span {(599 : ℤ)}) ∧
      (P : Ideal (𝓞 (quadraticFixedField479 K))) *
        (Q : Ideal (𝓞 (quadraticFixedField479 K))) =
          Ideal.span {(599 : 𝓞 (quadraticFixedField479 K))} ∧
      conjugateQuadraticIdeal479 K P = Q ∧
      ClassGroup.mk0 P = (ClassGroup.mk0 Q)⁻¹ := by
  obtain ⟨P, hP, hPnorm, hPpow⟩ := prime_fifth_root_from_conjugate_witness
    (quadraticFifthWitness479 K) (quadraticFifthConjugate479 K)
    (quadraticFifthWitness479_product K) (quadraticFifthWitness479_sum K)
    (quadraticFifthWitness479_absNorm K)
  obtain ⟨Q, hQ, hQnorm, hQpow⟩ := prime_fifth_root_from_conjugate_witness
    (quadraticFifthConjugate479 K) (quadraticFifthWitness479 K)
    (by simpa only [mul_comm] using quadraticFifthWitness479_product K)
    (by simpa only [add_comm] using quadraticFifthWitness479_sum K)
    (quadraticFifthConjugate479_absNorm K)
  have hPQ : (P : Ideal (𝓞 (quadraticFixedField479 K))) *
      (Q : Ideal (𝓞 (quadraticFixedField479 K))) =
      Ideal.span {(599 : 𝓞 (quadraticFixedField479 K))} := by
    apply ideal_eq_of_fifth_power_eq
    rw [mul_pow, hPpow, hQpow, Ideal.span_singleton_mul_span_singleton,
      quadraticFifthWitness479_product, Ideal.span_singleton_pow]
  have hconj : conjugateQuadraticIdeal479 K P = Q := by
    apply Subtype.ext
    exact conjugate_ideal_of_witness_fifth_powers K P Q hPpow hQpow
  have hne : P ≠ Q := by
    intro heq
    have hcop := principal_witness_ideals_coprime
      (quadraticFifthWitness479 K) (quadraticFifthConjugate479 K)
      (quadraticFifthWitness479_product K) (quadraticFifthWitness479_sum K)
    rw [← hPpow, ← hQpow, heq] at hcop
    have hunit : IsUnit ((Q : Ideal (𝓞 (quadraticFixedField479 K))) ^ 5) :=
      hcop.isUnit_of_dvd (dvd_refl _)
    exact hQ.ne_top (Ideal.isUnit_iff.mp
      ((isUnit_pow_iff (by decide : 5 ≠ 0)).mp hunit))
  exact ⟨P, Q, hP, hQ, hPnorm, hQnorm, hne,
    liesOver599_of_absNorm599 (F := quadraticFixedField479 K)
      (P : Ideal (𝓞 (quadraticFixedField479 K))) hPnorm,
    liesOver599_of_absNorm599 (F := quadraticFixedField479 K)
      (Q : Ideal (𝓞 (quadraticFixedField479 K))) hQnorm, hPQ, hconj,
    paired_prime_classes_inverse P Q hPQ⟩

theorem every_prime_above599_absNorm
    (R : (Ideal (𝓞 (quadraticFixedField479 K)))⁰)
    (hR : (R : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime)
    (hover : (R : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver (Ideal.span {(599 : ℤ)})) :
    (R : Ideal (𝓞 (quadraticFixedField479 K))).absNorm = 599 := by
  obtain ⟨P, Q, hP, hQ, hPnorm, hQnorm, _, _, _, hPQ, _, _⟩ :=
    exists_conjugate_prime_pair599_class_inverse K
  rcases prime_above599_eq_factor_of_pair (F := quadraticFixedField479 K)
    P Q R hP hQ hR hover hPQ with h | h
  · simpa only [h] using hPnorm
  · simpa only [h] using hQnorm

theorem every_prime_above599_conjugate_class_inverse
    (R : (Ideal (𝓞 (quadraticFixedField479 K)))⁰)
    (hR : (R : Ideal (𝓞 (quadraticFixedField479 K))).IsPrime)
    (hover : (R : Ideal (𝓞 (quadraticFixedField479 K))).LiesOver (Ideal.span {(599 : ℤ)})) :
    ClassGroup.mk0 R = (ClassGroup.mk0 (conjugateQuadraticIdeal479 K R))⁻¹ := by
  obtain ⟨P, Q, hP, hQ, _, _, _, _, _, hPQ, hconj, hinv⟩ :=
    exists_conjugate_prime_pair599_class_inverse K
  have hconjQ : conjugateQuadraticIdeal479 K Q = P := by
    rw [← hconj]
    exact conjugateQuadraticIdeal479_involutive K P
  rcases prime_above599_eq_factor_of_pair (F := quadraticFixedField479 K)
    P Q R hP hQ hR hover hPQ with h | h
  · subst R
    rw [hconj]
    exact hinv
  · subst R
    rw [hconjQ]
    simpa only [inv_inv] using
      (congrArg (fun x : ClassGroup (𝓞 (quadraticFixedField479 K)) => x⁻¹) hinv).symm

end ActualQuadraticField

end HadamardAutomorphism
