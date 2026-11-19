import Conjectures.HadamardAutomorphismCyclotomicPrimes
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.NumberTheory.NumberField.Ideal.Basic
import Lean.Elab.Tactic.Omega

/-! The norm-cube equation determines the exponents of the two actual primes above 599. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped Pointwise

/-- A divisor of powers of two prime ideals has exactly those prime factors. -/
theorem ideal_divisor_of_two_prime_powers
    {R : Type*} [CommRing R] [IsDedekindDomain R]
    (U P Q : Ideal R) (hP : Prime P) (hQ : Prime Q) (n : ℕ)
    (hU : U ∣ P ^ n * Q ^ n) :
    ∃ a b : ℕ, a ≤ n ∧ b ≤ n ∧ U = P ^ a * Q ^ b := by
  obtain ⟨I, J, hI, hJ, hU⟩ := exists_dvd_and_dvd_of_dvd_mul hU
  obtain ⟨a, ha, hIa⟩ := (dvd_prime_pow hP n).mp hI
  obtain ⟨b, hb, hJb⟩ := (dvd_prime_pow hQ n).mp hJ
  refine ⟨a, b, ha, hb, ?_⟩
  rw [hU, associated_iff_eq.mp hIa, associated_iff_eq.mp hJb]

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

/-- The norm equation itself forces the exponents of the two actual primes
above 599 to add to three. -/
theorem norm_cube_principal_factorization479
    (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})]
    (u : 𝓞 K)
    (hu : u * (conjugation479 K • u) = (599 : 𝓞 K) ^ 3) :
    ∃ a b : ℕ, a + b = 3 ∧
      Ideal.span {u} = P ^ a * (conjugation479 K • P) ^ b := by
  let U : Ideal (𝓞 K) := Ideal.span {u}
  let Q : Ideal (𝓞 K) := conjugation479 K • P
  have hnorm : U * (conjugation479 K • U) =
      (Ideal.span {(599 : 𝓞 K)}) ^ 3 := by
    dsimp only [U]
    rw [Ideal.smul_closure, Set.smul_set_singleton,
      Ideal.span_singleton_mul_span_singleton, hu, Ideal.span_singleton_pow]
  have hdiv : U ∣ P ^ 3 * Q ^ 3 := by
    have h : U ∣ (Ideal.span {(599 : 𝓞 K)}) ^ 3 :=
      ⟨conjugation479 K • U, hnorm.symm⟩
    rw [prime599_ideal_factorization K P, mul_pow] at h
    exact h
  have hp0 : (Ideal.span {(599 : ℤ)}) ≠ ⊥ := by
    rw [ne_eq, Ideal.span_singleton_eq_bot]
    norm_num
  have hP : Prime P := Ideal.prime_of_isPrime
    (Ideal.ne_bot_of_liesOver_of_ne_bot hp0 P) inferInstance
  have hQ : Prime Q := Ideal.prime_of_isPrime
    (Ideal.ne_bot_of_liesOver_of_ne_bot hp0 Q) inferInstance
  obtain ⟨a, b, _, _, hfactor⟩ :=
    ideal_divisor_of_two_prime_powers U P Q hP hQ 3 hdiv
  have hswap : conjugation479 K • Q = P := by
    dsimp only [Q]
    rw [← mul_smul, ← pow_two, conjugation479_sq, one_smul]
  have hconj : conjugation479 K • U = Q ^ a * P ^ b := by
    rw [hfactor, smul_mul', smul_pow', smul_pow', hswap]
  have hexponents : (Ideal.span {(599 : 𝓞 K)}) ^ (a + b) =
      (Ideal.span {(599 : 𝓞 K)}) ^ 3 := by
    calc
      (Ideal.span {(599 : 𝓞 K)}) ^ (a + b) = (P * Q) ^ (a + b) := by
        rw [prime599_ideal_factorization K P]
      _ = (P ^ a * Q ^ b) * (Q ^ a * P ^ b) := by
        rw [mul_pow, pow_add, pow_add]
        ac_rfl
      _ = U * (conjugation479 K • U) :=
        congrArg₂ (· * ·) hfactor.symm hconj.symm
      _ = (Ideal.span {(599 : 𝓞 K)}) ^ 3 := hnorm
  have hbase0 : (Ideal.span {(599 : 𝓞 K)}) ≠ ⊥ := by
    rw [ne_eq, Ideal.span_singleton_eq_bot]
    norm_num
  have hnorm0 : (Ideal.span {(599 : 𝓞 K)}).absNorm ≠ 0 :=
    Ideal.absNorm_eq_zero_iff.not.mpr hbase0
  have hnorm1 : (Ideal.span {(599 : 𝓞 K)}).absNorm ≠ 1 := by
    intro h
    have htop := Ideal.absNorm_eq_one_iff.mp h
    have hle : Ideal.span {(599 : 𝓞 K)} ≤ P := by
      rw [prime599_ideal_factorization K P]
      exact Ideal.mul_le_left
    rw [htop] at hle
    exact (Ideal.IsPrime.ne_top' : P ≠ ⊤) (top_unique hle)
  have hlarge : 2 ≤ (Ideal.span {(599 : 𝓞 K)}).absNorm := by omega
  have habs := congrArg (fun I : Ideal (𝓞 K) => I.absNorm) hexponents
  rw [map_pow, map_pow] at habs
  exact ⟨a, b, Nat.pow_right_injective hlarge habs, hfactor⟩

/-- The same factorization with the norm equation stated in the ambient field. -/
theorem norm_cube_principal_factorization479_of_coe
    (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})]
    (u : 𝓞 K)
    (hu : (u : K) * conjugation479 K (u : K) = (599 : K) ^ 3) :
    ∃ a b : ℕ, a + b = 3 ∧
      Ideal.span {u} = P ^ a * (conjugation479 K • P) ^ b := by
  apply norm_cube_principal_factorization479 K P u
  apply RingOfIntegers.ext
  exact hu

end HadamardAutomorphism
