import Conjectures.HadamardAutomorphismArithmeticBasic
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Ring

/-! Coefficient congruences in the full ring of integers of the 479th
cyclotomic field. Divisibility is in the actual ring of integers; the
conclusion follows from its integral power basis.
-/

noncomputable section

namespace HadamardAutomorphism

open NumberField Module
open scoped BigOperators

variable {K : Type*} [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]
  {ζ : K} (hζ : IsPrimitiveRoot ζ 479)

private theorem integral_basis_dimension479 : hζ.integralPowerBasis.dim = 478 := by
  rw [hζ.integralPowerBasis_dim, Nat.totient_prime prime_479]

def integerBasis479 : Basis (Fin 478) ℤ (𝓞 K) :=
  hζ.integralPowerBasis.basis.reindex (finCongr (integral_basis_dimension479 hζ))

@[simp] theorem integerBasis479_apply (i : Fin 478) :
    integerBasis479 hζ i = hζ.toInteger ^ (i : ℕ) := by
  change hζ.integralPowerBasis.basis
    ((finCongr (integral_basis_dimension479 hζ)).symm i) = _
  rw [hζ.integralPowerBasis.basis_eq_pow, hζ.integralPowerBasis_gen]
  rfl

omit [NumberField K] [IsCyclotomicExtension {479} ℚ K] in
theorem last_power_eq_neg_sum479 :
    hζ.toInteger ^ 478 = -∑ i : Fin 478, hζ.toInteger ^ (i : ℕ) := by
  have hsum : (∑ i : Fin 479, hζ.toInteger ^ (i : ℕ)) = 0 := by
    simpa only [Finset.sum_range] using
      hζ.toInteger_isPrimitiveRoot.geom_sum_eq_zero (by decide : 1 < 479)
  rw [Fin.sum_univ_castSucc] at hsum
  simpa only [Fin.val_castSucc, Fin.val_last] using (eq_neg_of_add_eq_zero_right hsum)

theorem coefficient_sum_reduction479 (C : Fin 479 → ℤ) :
    (∑ i : Fin 479, C i • hζ.toInteger ^ (i : ℕ)) =
      ∑ i : Fin 478, (C i.castSucc - C (Fin.last 478)) • integerBasis479 hζ i := by
  rw [Fin.sum_univ_castSucc]
  simp only [Fin.val_castSucc, Fin.val_last, integerBasis479_apply]
  rw [last_power_eq_neg_sum479 hζ, smul_neg]
  simp_rw [sub_smul]
  rw [Finset.sum_sub_distrib, Finset.smul_sum]
  rfl

theorem cyclotomic_coefficient_differences_dvd479 (p : ℤ) (C : Fin 479 → ℤ)
    (hdiv : (p : 𝓞 K) ∣ ∑ i : Fin 479, C i • hζ.toInteger ^ (i : ℕ)) :
    ∀ i j : Fin 479, p ∣ C i - C j := by
  classical
  obtain ⟨x, hx⟩ := hdiv
  rw [coefficient_sum_reduction479 hζ C] at hx
  have hpcast : (p : 𝓞 K) * x = p • x := by simp
  rw [hpcast] at hx
  have hcoeff (i : Fin 478) : p ∣ C i.castSucc - C (Fin.last 478) := by
    refine ⟨(integerBasis479 hζ).equivFun x i, ?_⟩
    have hh := congrArg (fun y => (integerBasis479 hζ).equivFun y i) hx
    rw [← (integerBasis479 hζ).equivFun_symm_apply,
      (integerBasis479 hζ).equivFun.apply_symm_apply] at hh
    simpa only [map_smul, Pi.smul_apply, smul_eq_mul] using hh
  have hall (i : Fin 479) : p ∣ C i - C (Fin.last 478) := by
    refine Fin.lastCases ?_ (fun j => hcoeff j) i
    simp
  intro i j
  have hd := dvd_sub (hall i) (hall j)
  have heq : (C i - C (Fin.last 478)) - (C j - C (Fin.last 478)) = C i - C j := by ring
  simpa only [heq] using hd

theorem cyclotomic_coefficients_congruent_mod599 (C : Fin 479 → ℤ)
    (hdiv : (599 : 𝓞 K) ∣ ∑ i : Fin 479, C i • hζ.toInteger ^ (i : ℕ)) :
    ∀ i j : Fin 479, (599 : ℤ) ∣ C i - C j := by
  exact cyclotomic_coefficient_differences_dvd479 hζ 599 C (by simpa using hdiv)

theorem cyclotomic_coefficients_equal_of_bounds599 (C : Fin 479 → ℤ)
    (hlow : ∀ i, 0 ≤ C i) (hhigh : ∀ i, C i ≤ 479)
    (hdiv : (599 : 𝓞 K) ∣ ∑ i : Fin 479, C i • hζ.toInteger ^ (i : ℕ)) :
    ∀ i j : Fin 479, C i = C j := by
  intro i j
  obtain ⟨k, hk⟩ := cyclotomic_coefficients_congruent_mod599 hζ C hdiv i j
  have hi0 := hlow i
  have hj0 := hlow j
  have hi479 := hhigh i
  have hj479 := hhigh j
  omega

end HadamardAutomorphism
