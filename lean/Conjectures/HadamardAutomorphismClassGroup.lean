import Conjectures.HadamardAutomorphismArithmeticBasic
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.Ideal.Over
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.GroupTheory.OrderOfElement

/-! The exact ideal-class bridge used by the separate class-group argument.
The concrete prime above 599 still requires a principal fifth-power identity.
These lemmas do not assert that the arithmetic witness alone supplies it. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField
open scoped nonZeroDivisors

theorem ideal_class_order_five_of_nonprincipal_fifth
    {R : Type*} [CommRing R] [IsDomain R] [IsDedekindDomain R]
    (P : (Ideal R)⁰) (hnot : ¬ (P : Ideal R).IsPrincipal)
    (hfifth : ((P : Ideal R) ^ 5).IsPrincipal) :
    orderOf (ClassGroup.mk0 P) = 5 := by
  let : Fact (Nat.Prime 5) := ⟨by decide⟩
  apply orderOf_eq_prime
  · rw [← map_pow, ClassGroup.mk0_eq_one_iff]
    exact hfifth
  · intro h
    exact hnot ((ClassGroup.mk0_eq_one_iff P.property).mp h)

theorem ideal_nonprincipal_of_absNorm_excluded
    {F : Type*} [Field F] [NumberField F]
    (P : Ideal (𝓞 F)) (n : ℕ) (hP : P.absNorm = n)
    (hexcluded : ∀ x : 𝓞 F, (Algebra.norm ℤ x).natAbs ≠ n) :
    ¬ P.IsPrincipal := by
  intro hprincipal
  obtain ⟨x, hx⟩ := Submodule.isPrincipal_iff.mp hprincipal
  apply hexcluded x
  rw [hx, Ideal.absNorm_span_singleton] at hP
  exact hP

theorem principal_witness_ideals_coprime
    {F : Type*} [Field F] [NumberField F] (a b : 𝓞 F)
    (hprod : a * b = 599 ^ 5) (hsum : a + b = 16108800) :
    IsCoprime (Ideal.span {a}) (Ideal.span {b}) := by
  apply Ideal.coprime_of_no_prime_ge
  intro P haP hbP hprime
  have ha : a ∈ P := haP (Ideal.mem_span_singleton_self a)
  have hb : b ∈ P := hbP (Ideal.mem_span_singleton_self b)
  have hp : (599 : 𝓞 F) ∈ P := by
    apply hprime.mem_of_pow_mem 5
    rw [← hprod]
    exact P.mul_mem_right b ha
  have hs : (16108800 : 𝓞 F) ∈ P := by
    rw [← hsum]
    exact P.add_mem ha hb
  have hcomb := P.add_mem (P.mul_mem_left (-15355801) hp) (P.mul_mem_left 571 hs)
  norm_num at hcomb
  exact hprime.one_notMem hcomb

/-- Actual ideal factorization follows from coprime conjugate witnesses.
There is no assumed split-prime factorization in this bridge. -/
theorem class_order_five_from_conjugate_witness
    {F : Type*} [Field F] [NumberField F] (a b : 𝓞 F)
    (hprod : a * b = 599 ^ 5) (hsum : a + b = 16108800)
    (hnorm : (Algebra.norm ℤ a).natAbs = 599 ^ 5)
    (hexcluded : ∀ x : 𝓞 F, (Algebra.norm ℤ x).natAbs ≠ 599) :
    ∃ P : (Ideal (𝓞 F))⁰,
      (P : Ideal (𝓞 F)).IsPrime ∧
      (P : Ideal (𝓞 F)).absNorm = 599 ∧
      (P : Ideal (𝓞 F)).LiesOver (Ideal.span {(599 : ℤ)}) ∧
      orderOf (ClassGroup.mk0 P) = 5 := by
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
    simpa [hzero] using hPnorm
  have hprincipal : (P ^ 5).IsPrincipal := by
    rw [hPpow]
    infer_instance
  have hnonprincipal : ¬ P.IsPrincipal :=
    ideal_nonprincipal_of_absNorm_excluded P 599 hPnorm hexcluded
  have hover : P.LiesOver (Ideal.span {(599 : ℤ)}) := by
    rw [Ideal.liesOver_iff, Ideal.under_def]
    simpa only [hPnorm, Nat.cast_ofNat] using Ideal.span_singleton_absNorm hnormprime
  refine ⟨⟨P, mem_nonZeroDivisors_of_ne_zero hP0⟩, hprime, hPnorm, hover, ?_⟩
  exact ideal_class_order_five_of_nonprincipal_fifth
    ⟨P, mem_nonZeroDivisors_of_ne_zero hP0⟩ hnonprincipal hprincipal

end HadamardAutomorphism
