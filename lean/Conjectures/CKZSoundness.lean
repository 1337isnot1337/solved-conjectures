import Conjectures.CKZPolynomial
import Conjectures.CKZPell
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.IntervalCases
import Mathlib.RingTheory.PowerSeries.Substitution

/-! The finite certificates imply an all-index positive Newton-kernel series. -/
namespace CKZCertificates
open Polynomial

def SeriesNonneg (f : PowerSeries ℤ) : Prop := ∀ n, 0 ≤ PowerSeries.coeff n f

theorem seriesNonneg_add {f g : PowerSeries ℤ} (hf : SeriesNonneg f) (hg : SeriesNonneg g) :
    SeriesNonneg (f+g) := by
  intro n
  simp only [map_add]
  exact add_nonneg (hf n) (hg n)

theorem seriesNonneg_mul {f g : PowerSeries ℤ} (hf : SeriesNonneg f) (hg : SeriesNonneg g) :
    SeriesNonneg (f*g) := by
  intro n
  rw [PowerSeries.coeff_mul]
  apply Finset.sum_nonneg
  intro z hz
  exact mul_nonneg (hf z.1) (hg z.2)

theorem seriesNonneg_X : SeriesNonneg (PowerSeries.X : PowerSeries ℤ) := by
  intro n
  rw [PowerSeries.coeff_X]
  split_ifs <;> omega

theorem seriesNonneg_C (c : ℤ) (hc : 0 ≤ c) : SeriesNonneg (PowerSeries.C c) := by
  intro n
  rw [PowerSeries.coeff_C]
  split_ifs <;> omega

theorem seriesNonneg_pow {f : PowerSeries ℤ} (hf : SeriesNonneg f) (n : ℕ) :
    SeriesNonneg (f^n) := by
  induction n with
  | zero => simpa using seriesNonneg_C 1 (by norm_num)
  | succ n ih => simpa [pow_succ] using seriesNonneg_mul ih hf

theorem seriesNonneg_pell : SeriesNonneg CKZPell.series := by
  intro n
  rw [CKZPell.coeff_series]
  exact Int.natCast_nonneg _

noncomputable def certState (f : List ℤ) : ℤ × ℤ × List ℤ :=
  (numerator f).foldl (fun st p => let v := p+2*st.1+st.2.1; (v,st.1,v::st.2.2)) (0,0,[])

noncomputable def certifiedSeries (f : List ℤ) : PowerSeries ℤ :=
  (toPolynomial (certState f).2.2.reverse : PowerSeries ℤ) +
    PowerSeries.X^(numerator f).length *
      (PowerSeries.C (2*(certState f).1+(certState f).2.1) +
        PowerSeries.X*PowerSeries.C (certState f).1) * CKZPell.series

theorem certifiedSeries_nonneg (f : List ℤ) (h : certOK f = true) :
    SeriesNonneg (certifiedSeries f) := by
  have hs := cert_state_nonneg f h
  change 0 ≤ (certState f).1 ∧ 0 ≤ (certState f).2.1 ∧
    ∀ v ∈ (certState f).2.2.reverse, 0 ≤ v at hs
  unfold certifiedSeries
  apply seriesNonneg_add
  · intro j
    rw [Polynomial.coeff_coe]
    exact nonneg_coeff_of_list _ hs.2.2 j
  · apply seriesNonneg_mul
    · apply seriesNonneg_mul (seriesNonneg_pow seriesNonneg_X _)
      apply seriesNonneg_add
      · apply seriesNonneg_C; omega
      · exact seriesNonneg_mul seriesNonneg_X (seriesNonneg_C _ hs.1)
    · exact seriesNonneg_pell

theorem certifiedSeries_equation (f : List ℤ) (h : certificateIdentity f = true) :
    (1-2*PowerSeries.X-PowerSeries.X^2)*certifiedSeries f =
      (((1+X)^2*(toPolynomial f).derivative : ℤ[X]) : PowerSeries ℤ) := by
  have hp := certificateIdentity_sound f h
  change (1-2*X-X^2)*toPolynomial (certState f).2.2.reverse +
    X^(numerator f).length*(C (2*(certState f).1+(certState f).2.1) +
      X*C (certState f).1) = (1+X)^2*(toPolynomial f).derivative at hp
  have hp' := congrArg (fun p : ℤ[X] => (p : PowerSeries ℤ)) hp
  simp only [Polynomial.coe_add, Polynomial.coe_mul, Polynomial.coe_sub, Polynomial.coe_pow,
    Polynomial.coe_X, Polynomial.coe_C, Polynomial.coe_one] at hp'
  have htwo : ((2 : ℤ[X]) : PowerSeries ℤ) = 2 := by
    change ((C (2 : ℤ) : ℤ[X]) : PowerSeries ℤ) = 2
    rw [Polynomial.coe_C]
    norm_num
  rw [htwo] at hp'
  have hw := CKZPell.series_equation
  unfold certifiedSeries
  norm_num at hp' ⊢
  linear_combination hp' + PowerSeries.X^(numerator f).length *
    (2*((certState f).1 : PowerSeries ℤ) + ((certState f).2.1 : PowerSeries ℤ) +
      PowerSeries.X*((certState f).1 : PowerSeries ℤ)) * hw

theorem certificate_sound (f : List ℤ) (hpos : certOK f = true)
    (hid : certificateIdentity f = true) :
    ∃ V : PowerSeries ℤ, SeriesNonneg V ∧
      (1-2*PowerSeries.X-PowerSeries.X^2)*V =
        (((1+X)^2*(toPolynomial f).derivative : ℤ[X]) : PowerSeries ℤ) :=
  ⟨certifiedSeries f, certifiedSeries_nonneg f hpos, certifiedSeries_equation f hid⟩

set_option maxHeartbeats 2000000 in
theorem G_prefix_sound (r : ℕ) (hr : r < 12) :
    ∃ V : PowerSeries ℤ, SeriesNonneg V ∧
      (1-2*PowerSeries.X-PowerSeries.X^2)*V =
        (((1+X)^2*(toPolynomial (G r)).derivative : ℤ[X]) : PowerSeries ℤ) := by
  interval_cases r
  · exact certificate_sound (G 0) cert_G0 identity_G0
  · exact certificate_sound (G 1) cert_G1 identity_G1
  · exact certificate_sound (G 2) cert_G2 identity_G2
  · exact certificate_sound (G 3) cert_G3 identity_G3
  · exact certificate_sound (G 4) cert_G4 identity_G4
  · exact certificate_sound (G 5) cert_G5 identity_G5
  · exact certificate_sound (G 6) cert_G6 identity_G6
  · exact certificate_sound (G 7) cert_G7 identity_G7
  · exact certificate_sound (G 8) cert_G8 identity_G8
  · exact certificate_sound (G 9) cert_G9 identity_G9
  · exact certificate_sound (G 10) cert_G10 identity_G10
  · exact certificate_sound (G 11) cert_G11 identity_G11

theorem sound_E1T1 :
    ∃ V : PowerSeries ℤ, SeriesNonneg V ∧
      (1-2*PowerSeries.X-PowerSeries.X^2)*V =
        (((1+X)^2*(toPolynomial (mul E1 (T 1))).derivative : ℤ[X]) : PowerSeries ℤ) :=
  certificate_sound _ cert_E1T1 identity_E1T1

theorem sound_E1T2 :
    ∃ V : PowerSeries ℤ, SeriesNonneg V ∧
      (1-2*PowerSeries.X-PowerSeries.X^2)*V =
        (((1+X)^2*(toPolynomial (mul E1 (T 2))).derivative : ℤ[X]) : PowerSeries ℤ) :=
  certificate_sound _ cert_E1T2 identity_E1T2

theorem sound_E2T13 :
    ∃ V : PowerSeries ℤ, SeriesNonneg V ∧
      (1-2*PowerSeries.X-PowerSeries.X^2)*V =
        (((1+X)^2*(toPolynomial (mul E2 (T 13))).derivative : ℤ[X]) : PowerSeries ℤ) :=
  certificate_sound _ cert_E2T13 identity_E2T13

theorem sound_E2T14 :
    ∃ V : PowerSeries ℤ, SeriesNonneg V ∧
      (1-2*PowerSeries.X-PowerSeries.X^2)*V =
        (((1+X)^2*(toPolynomial (mul E2 (T 14))).derivative : ℤ[X]) : PowerSeries ℤ) :=
  certificate_sound _ cert_E2T14 identity_E2T14


theorem seriesNonneg_subst {f g : PowerSeries ℤ} (hf : SeriesNonneg f)
    (hg : SeriesNonneg g) (h0 : PowerSeries.constantCoeff g = 0) :
    SeriesNonneg (f.subst g) := by
  intro n
  rw [PowerSeries.coeff_subst' (PowerSeries.HasSubst.of_constantCoeff_zero' h0)]
  apply finsum_nonneg
  intro j
  simp only [smul_eq_mul]
  exact mul_nonneg (hf j) (seriesNonneg_pow hg j n)

end CKZCertificates
