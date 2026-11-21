import Conjectures.CKZSoundness
import Conjectures.CKZLow
import Mathlib.RingTheory.PowerSeries.Derivative

/-! Transfer of the Newton certificates through the Schröder power series. -/
namespace CKZComposition
open Polynomial PowerSeries

noncomputable def R : PowerSeries ℤ :=
  PowerSeries.X * (PowerSeries.map (Nat.castRingHom ℤ)) PowerSeries.largeSchroderSeries

theorem R_equation : R = PowerSeries.X + PowerSeries.X*R + R^2 := by
  have h := congrArg (PowerSeries.map (Nat.castRingHom ℤ))
    PowerSeries.largeSchroderSeries_eq_one_add_X_mul_largeSchroderSeries_add_X_mul_largeSchroderSeries_sq
  simp only [map_add, map_mul, map_one, map_pow, PowerSeries.map_X] at h
  unfold R
  linear_combination PowerSeries.X * h

theorem R_coeff (n : ℕ) : PowerSeries.coeff n R = (CKZ.schroder n : ℤ) := by
  cases n with
  | zero => simp [R, CKZ.schroder, PowerSeries.coeff_zero_eq_constantCoeff_apply]
  | succ n =>
    unfold R
    rw [← pow_one (PowerSeries.X : PowerSeries ℤ)]
    rw [PowerSeries.coeff_X_pow_mul, PowerSeries.coeff_map, PowerSeries.coeff_largeSchroderSeries]
    rfl

theorem R_nonneg : CKZCertificates.SeriesNonneg R := by
  intro n
  rw [R_coeff]
  exact Int.natCast_nonneg _

theorem R_constant : PowerSeries.constantCoeff R = 0 := by
  simp [R]

theorem R_derivative_equation :
    (1-2*R-R^2)*PowerSeries.derivative R = (1+R)^2 := by
  have hdiff := congrArg (PowerSeries.derivative (R := ℤ)) R_equation
  simp only [map_add, Derivation.leibniz, PowerSeries.derivative_pow, PowerSeries.derivative_X] at hdiff
  linear_combination (1+R)*hdiff - (PowerSeries.derivative R)*R_equation

theorem denominator_ne_zero : (1-2*R-R^2 : PowerSeries ℤ) ≠ 0 := by
  intro h
  have hc := congrArg (PowerSeries.constantCoeff (R := ℤ)) h
  simp [R_constant] at hc

theorem certificate_composition_derivative (f : List ℤ)
    (hid : CKZCertificates.certificateIdentity f = true) :
    PowerSeries.derivative (((CKZCertificates.toPolynomial f : ℤ[X]) : PowerSeries ℤ).subst R) =
      (CKZCertificates.certifiedSeries f).subst R := by
  have hR := PowerSeries.HasSubst.of_constantCoeff_zero' R_constant
  let φ : PowerSeries ℤ →ₐ[ℤ] PowerSeries ℤ := PowerSeries.substAlgHom hR
  have hs := congrArg φ (CKZCertificates.certifiedSeries_equation f hid)
  simp only [map_mul, map_sub, map_add, map_one, map_ofNat, map_pow, Polynomial.coe_mul,
    Polynomial.coe_pow, Polynomial.coe_add, Polynomial.coe_one, Polynomial.coe_X] at hs
  have hφX : φ PowerSeries.X = R := PowerSeries.substAlgHom_X hR
  rw [hφX] at hs
  have hd := R_derivative_equation
  have hp : (1-2*R-R^2) *
      (φ (CKZCertificates.certifiedSeries f) -
        φ (((CKZCertificates.toPolynomial f).derivative : ℤ[X]) : PowerSeries ℤ) * PowerSeries.derivative R) = 0 := by
    linear_combination hs - (φ (((CKZCertificates.toPolynomial f).derivative : ℤ[X]) : PowerSeries ℤ))*hd
  have heq := (mul_eq_zero.mp hp).resolve_left denominator_ne_zero
  rw [sub_eq_zero] at heq
  rw [PowerSeries.derivative_subst hR, PowerSeries.derivative_coe]
  simpa only [φ, PowerSeries.coe_substAlgHom] using heq.symm

/-- The finite certificate proves nonnegativity of every coefficient after composition with R. -/
theorem certified_composition_nonneg (f : List ℤ)
    (hpos : CKZCertificates.certOK f = true)
    (hid : CKZCertificates.certificateIdentity f = true) :
    CKZCertificates.SeriesNonneg (((CKZCertificates.toPolynomial f : ℤ[X]) : PowerSeries ℤ).subst R) := by
  let P : PowerSeries ℤ := ((CKZCertificates.toPolynomial f : ℤ[X]) : PowerSeries ℤ).subst R
  have hder : CKZCertificates.SeriesNonneg (PowerSeries.derivative P) := by
    rw [show PowerSeries.derivative P = (CKZCertificates.certifiedSeries f).subst R from
      certificate_composition_derivative f hid]
    exact CKZCertificates.seriesNonneg_subst (CKZCertificates.certifiedSeries_nonneg f hpos) R_nonneg R_constant
  have hconst : 0 ≤ f.headD 0 := by
    exact of_decide_eq_true (Bool.and_eq_true_iff.mp hpos).1
  intro n
  cases n with
  | zero =>
    change 0 ≤ PowerSeries.coeff 0 P
    rw [PowerSeries.coeff_zero_eq_constantCoeff_apply]
    dsimp [P]
    rw [PowerSeries.constantCoeff_eq, PowerSeries.constantCoeff_subst_of_constantCoeff_zero R_constant]
    simp only [algebraMap_int_eq, ← PowerSeries.coeff_zero_eq_constantCoeff_apply,
      Polynomial.coeff_coe, CKZCertificates.coeff_toPolynomial]
    cases f <;> simp_all
  | succ n =>
    have h := hder n
    rw [PowerSeries.coeff_derivative] at h
    have hn : (0 : ℤ) < n+1 := by positivity
    exact nonneg_of_mul_nonneg_left h hn

set_option maxHeartbeats 2000000 in
theorem G_prefix_nonneg (r : ℕ) (hr : r < 12) :
    CKZCertificates.SeriesNonneg (((CKZCertificates.toPolynomial (CKZCertificates.G r) : ℤ[X]) : PowerSeries ℤ).subst R) := by
  interval_cases r
  · exact certified_composition_nonneg _ CKZCertificates.cert_G0 CKZCertificates.identity_G0
  · exact certified_composition_nonneg _ CKZCertificates.cert_G1 CKZCertificates.identity_G1
  · exact certified_composition_nonneg _ CKZCertificates.cert_G2 CKZCertificates.identity_G2
  · exact certified_composition_nonneg _ CKZCertificates.cert_G3 CKZCertificates.identity_G3
  · exact certified_composition_nonneg _ CKZCertificates.cert_G4 CKZCertificates.identity_G4
  · exact certified_composition_nonneg _ CKZCertificates.cert_G5 CKZCertificates.identity_G5
  · exact certified_composition_nonneg _ CKZCertificates.cert_G6 CKZCertificates.identity_G6
  · exact certified_composition_nonneg _ CKZCertificates.cert_G7 CKZCertificates.identity_G7
  · exact certified_composition_nonneg _ CKZCertificates.cert_G8 CKZCertificates.identity_G8
  · exact certified_composition_nonneg _ CKZCertificates.cert_G9 CKZCertificates.identity_G9
  · exact certified_composition_nonneg _ CKZCertificates.cert_G10 CKZCertificates.identity_G10
  · exact certified_composition_nonneg _ CKZCertificates.cert_G11 CKZCertificates.identity_G11

theorem E1T1_nonneg :
    CKZCertificates.SeriesNonneg (((CKZCertificates.toPolynomial (CKZCertificates.mul CKZCertificates.E1 (CKZCertificates.T 1)) : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ CKZCertificates.cert_E1T1 CKZCertificates.identity_E1T1

theorem E1T2_nonneg :
    CKZCertificates.SeriesNonneg (((CKZCertificates.toPolynomial (CKZCertificates.mul CKZCertificates.E1 (CKZCertificates.T 2)) : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ CKZCertificates.cert_E1T2 CKZCertificates.identity_E1T2

theorem E2T13_nonneg :
    CKZCertificates.SeriesNonneg (((CKZCertificates.toPolynomial (CKZCertificates.mul CKZCertificates.E2 (CKZCertificates.T 13)) : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ CKZCertificates.cert_E2T13 CKZCertificates.identity_E2T13

theorem E2T14_nonneg :
    CKZCertificates.SeriesNonneg (((CKZCertificates.toPolynomial (CKZCertificates.mul CKZCertificates.E2 (CKZCertificates.T 14)) : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ CKZCertificates.cert_E2T14 CKZCertificates.identity_E2T14


end CKZComposition
