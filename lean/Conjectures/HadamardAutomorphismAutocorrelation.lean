import Conjectures.HadamardAutomorphismBinary
import Conjectures.HadamardAutomorphismCoefficients
import Conjectures.HadamardAutomorphismCyclotomicCharacter

/-! The literal Fourier norm of a cyclic support has its actual overlap
counts as coefficients. Divisibility by 599 then forces a binary support
on 479 positions to be empty or full.
-/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped BigOperators Pointwise

section FiniteCorrelation

variable {q : ℕ} [NeZero q] {R : Type*} [CommRing R]

theorem support_shift_sum (χ : AddChar (ZMod q) R) (D : Finset (ZMod q))
    (x : ZMod q) :
    (∑ y ∈ D, χ (y - x)) = ∑ g : ZMod q, if x + g ∈ D then χ g else 0 := by
  classical
  have h := Fintype.sum_equiv (Equiv.addLeft x)
    (fun g => if x + g ∈ D then χ g else 0)
    (fun y => if y ∈ D then χ (y - x) else 0)
    (by intro g; simp [add_comm])
  have hr : (∑ y : ZMod q, if y ∈ D then χ (y - x) else 0) =
      ∑ y ∈ D, χ (y - x) := by
    rw [← Finset.sum_filter, Finset.filter_mem_eq_inter, Finset.univ_inter]
  rw [hr] at h
  exact h.symm

theorem support_character_correlation (χ : AddChar (ZMod q) R)
    (D : Finset (ZMod q)) :
    (∑ x ∈ D, χ (-x)) * (∑ y ∈ D, χ y) =
      ∑ g : ZMod q, binaryAutocorrelation D g • χ g := by
  classical
  calc
    (∑ x ∈ D, χ (-x)) * (∑ y ∈ D, χ y) =
        ∑ x ∈ D, ∑ y ∈ D, χ (-x) * χ y := by
          rw [Finset.sum_mul]
          simp only [Finset.mul_sum]
    _ = ∑ x ∈ D, ∑ y ∈ D, χ (y - x) := by
      apply Finset.sum_congr rfl
      intro x hx
      apply Finset.sum_congr rfl
      intro y hy
      rw [← AddChar.map_add_eq_mul]
      congr 1
      simp [sub_eq_add_neg, add_comm]
    _ = ∑ x ∈ D, ∑ g : ZMod q, if x + g ∈ D then χ g else 0 := by
      apply Finset.sum_congr rfl
      intro x hx
      exact support_shift_sum χ D x
    _ = ∑ g : ZMod q, ∑ x ∈ D, if x + g ∈ D then χ g else 0 := by
      rw [Finset.sum_comm]
    _ = ∑ g : ZMod q, binaryAutocorrelation D g • χ g := by
      apply Finset.sum_congr rfl
      intro g hg
      rw [← Finset.sum_filter]
      simp [binaryAutocorrelation]

end FiniteCorrelation

section CyclotomicSupport

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

def supportFourier479 (D : Finset (ZMod 479)) : 𝓞 K :=
  ∑ a ∈ D, (zeta_spec 479 ℚ K).toInteger ^ a.val

theorem supportFourier479_eq_sum_char (D : Finset (ZMod 479)) :
    supportFourier479 K D = ∑ a ∈ D, integerCyclotomicChar479 K a := by
  simp only [supportFourier479, integerCyclotomicChar479_apply]

theorem supportFourier479_conjugate (D : Finset (ZMod 479)) :
    conjugation479 K • supportFourier479 K D =
      ∑ a ∈ D, integerCyclotomicChar479 K (-a) := by
  rw [supportFourier479_eq_sum_char, Finset.smul_sum]
  simp only [conjugation479_integerChar]

theorem supportFourier479_norm (D : Finset (ZMod 479)) :
    supportFourier479 K D * (conjugation479 K • supportFourier479 K D) =
      ∑ g : ZMod 479, binaryAutocorrelation D g • integerCyclotomicChar479 K g := by
  rw [supportFourier479_conjugate, supportFourier479_eq_sum_char, mul_comm]
  exact support_character_correlation (integerCyclotomicChar479 K) D

theorem supportFourier479_norm_coefficients (D : Finset (ZMod 479)) :
    supportFourier479 K D * (conjugation479 K • supportFourier479 K D) =
      ∑ i : Fin 479, (binaryAutocorrelation D i : ℤ) •
        (zeta_spec 479 ℚ K).toInteger ^ (i : ℕ) := by
  simpa only [integerCyclotomicChar479_apply, natCast_zsmul] using
    supportFourier479_norm K D

theorem supportFourier479_norm_dvd_forces_constant (D : Finset (ZMod 479))
    (hdiv : (599 : 𝓞 K) ∣
      supportFourier479 K D * (conjugation479 K • supportFourier479 K D)) :
    D = ∅ ∨ D = Finset.univ := by
  classical
  rw [supportFourier479_norm_coefficients] at hdiv
  let C : Fin 479 → ℤ := fun i => (binaryAutocorrelation D i : ℤ)
  have hlow (i : Fin 479) : 0 ≤ C i := Int.natCast_nonneg _
  have hhigh (i : Fin 479) : C i ≤ 479 := by
    exact_mod_cast binaryAutocorrelation_le_modulus D i
  have hall := cyclotomic_coefficients_equal_of_bounds599 (zeta_spec 479 ℚ K)
    C hlow hhigh hdiv
  have heq : binaryAutocorrelation D 1 = binaryAutocorrelation D 0 := by
    exact_mod_cast (show (binaryAutocorrelation D 1 : ℤ) =
      (binaryAutocorrelation D 0 : ℤ) by simpa only [C] using hall 1 0)
  by_cases hne : D.Nonempty
  · right
    by_contra hproper
    exact (ne_of_lt (binaryAutocorrelation_one_lt D hne hproper)) heq
  · exact Or.inl (Finset.not_nonempty_iff_eq_empty.mp hne)

theorem supportFourier479_norm_not_dvd (D : Finset (ZMod 479))
    (hne : D.Nonempty) (hproper : D ≠ Finset.univ) :
    ¬ (599 : 𝓞 K) ∣
      supportFourier479 K D * (conjugation479 K • supportFourier479 K D) := by
  intro hdiv
  rcases supportFourier479_norm_dvd_forces_constant K D hdiv with hempty | hfull
  · exact hne.ne_empty hempty
  · exact hproper hfull

theorem support_norm_divisible_forces_constant (D : Finset (ZMod 479))
    (hdiv : (599 : 𝓞 K) ∣
      (∑ a ∈ D, integerCyclotomicChar479 K a) *
        (conjugation479 K • ∑ a ∈ D, integerCyclotomicChar479 K a)) :
    D = ∅ ∨ D = Finset.univ := by
  apply supportFourier479_norm_dvd_forces_constant K D
  simpa only [supportFourier479_eq_sum_char] using hdiv

end CyclotomicSupport

end HadamardAutomorphism
