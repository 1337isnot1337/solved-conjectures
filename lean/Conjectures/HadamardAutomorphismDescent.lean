import Conjectures.HadamardAutomorphismDescentUnits
import Conjectures.HadamardAutomorphismCyclotomicQuadratic
import Conjectures.HadamardAutomorphismArithmeticRational

/-! The norm obstruction in the actual 479th cyclotomic field. No quadratic
descent, norm obstruction, or class group assertion is an input hypothesis. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

theorem norm_cube_descends_to_fixed_integer (u : 𝓞 K)
    (hnorm : (u : K) * conjugation479 K u = (599 : K) ^ 3) :
    ∃ v : 𝓞 K, frobenius479 K (v : K) = v ∧
      (v : K) * conjugation479 K v = (599 : K) ^ 3 := by
  have huK : (u : K) ≠ 0 := by
    intro h
    rw [h, zero_mul] at hnorm
    norm_num at hnorm
  have hu : u ≠ 0 := RingOfIntegers.coe_ne_zero_iff.mp huK
  obtain ⟨ε, hε, hroot⟩ := frobenius_ratio_root K u hu hnorm
  have hroot' := frobenius_ratio_pow479 K (u : K) ε huK hε hroot
  obtain ⟨k, hk⟩ := root_twist_frobenius_fixed K (u : K) ε hε hroot'
  have hzint : IsIntegral ℤ (zeta 479 ℚ K) :=
    (zeta_spec 479 ℚ K).isIntegral (by decide)
  have hvint : IsIntegral ℤ ((zeta 479 ℚ K) ^ k * (u : K)) :=
    (hzint.pow k).mul u.isIntegral_coe
  let v : 𝓞 K := ⟨(zeta 479 ℚ K) ^ k * (u : K), hvint⟩
  have hv : (v : K) = (zeta 479 ℚ K) ^ k * (u : K) :=
    RingOfIntegers.coe_mk hvint
  refine ⟨v, ?_, ?_⟩
  · simpa only [hv] using hk
  simp only [hv, map_mul, map_pow, conjugation479_zeta]
  have hz : zeta 479 ℚ K ≠ 0 := (zeta_spec 479 ℚ K).ne_zero (by decide)
  calc
    (zeta 479 ℚ K) ^ k * (u : K) *
        ((zeta 479 ℚ K)⁻¹ ^ k * conjugation479 K (u : K)) =
        ((zeta 479 ℚ K) * (zeta 479 ℚ K)⁻¹) ^ k *
          ((u : K) * conjugation479 K (u : K)) := by rw [mul_pow]; ring
    _ = (599 : K) ^ 3 := by rw [mul_inv_cancel₀ hz, one_pow, one_mul, hnorm]

theorem fixed_integer_norm_cube_impossible (v : 𝓞 K)
    (hfixed : frobenius479 K (v : K) = v) :
    (v : K) * conjugation479 K v ≠ (599 : K) ^ 3 := by
  intro hnorm
  obtain ⟨a, b, hab⟩ := quadraticFixedField479_coordinates K (v : K)
    ((mem_quadraticFixedField479 K _).mpr hfixed)
  obtain ⟨A, hA⟩ := integer_trace_coordinate K v a b hab
  have he := (norm_of_quadratic_coordinates K (v : K) a b hab).symm.trans hnorm
  have hr : a ^ 2 + 479 * b ^ 2 = (599 : ℚ) ^ 3 := by
    exact Rat.cast_injective (by simpa only [Rat.cast_pow, Rat.cast_ofNat] using he)
  apply no_norm_cube_rational A (2 * b)
  rw [hA]
  nlinarith

/-- No algebraic integer in the 479th cyclotomic field has conjugate norm 599³. -/
theorem cyclotomic_norm_cube_impossible (u : 𝓞 K) :
    (u : K) * conjugation479 K u ≠ (599 : K) ^ 3 := by
  intro hnorm
  obtain ⟨v, hv, hn⟩ := norm_cube_descends_to_fixed_integer K u hnorm
  exact fixed_integer_norm_cube_impossible K v hv hn

end HadamardAutomorphism
