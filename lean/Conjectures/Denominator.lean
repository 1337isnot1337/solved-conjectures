import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Trunc
import Mathlib.RingTheory.Coprime.Basic
import Mathlib.Algebra.Polynomial.Degree.Lemmas
import Mathlib.Tactic.ComputeDegree
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith

/-! The finite-coefficient identity principle and exact polynomial certificates.
The degree bounds and the correspondence between the listed coefficients and
necklace orbit counts are explicit hypotheses, not project axioms. -/
noncomputable section
namespace Denominator
open Polynomial

/-- A polynomial of degree less than N is determined by its first N coefficients. -/
theorem finite_polynomial_identity (P : ℚ[X]) (N : Nat)
    (hd : P.natDegree < N) (hc : ∀ i < N, P.coeff i = 0) : P = 0 := by
  ext i
  simp only [Polynomial.coeff_zero]
  by_cases hi : i < N
  · exact hc i hi
  · exact Polynomial.coeff_eq_zero_of_natDegree_lt (by omega)

/-- The note's finite-coefficient identity principle, including cancellation of B. -/
theorem finite_coefficient_identity (H : PowerSeries ℚ) (A B U V : ℚ[X]) (N : Nat)
    (hB : B.coeff 0 ≠ 0)
    (hrep : (B : PowerSeries ℚ) * H = (A : PowerSeries ℚ))
    (hdegree : max (U.natDegree + A.natDegree) (V.natDegree + B.natDegree) < N)
    (hcoeff : ∀ i < N, PowerSeries.coeff i
      ((U : PowerSeries ℚ) * H - (V : PowerSeries ℚ)) = 0) :
    (U : PowerSeries ℚ) * H = (V : PowerSeries ℚ) := by
  have hdiv := PowerSeries.X_pow_dvd_iff.mpr hcoeff
  have hprod : ((U*A - V*B : ℚ[X]) : PowerSeries ℚ) =
      ((U : PowerSeries ℚ) * H - (V : PowerSeries ℚ)) * (B : PowerSeries ℚ) := by
    simp only [Polynomial.coe_sub, Polynomial.coe_mul]
    rw [← hrep]
    ring
  have hzero : U*A - V*B = 0 := by
    apply finite_polynomial_identity _ N
    · exact lt_of_le_of_lt ((Polynomial.natDegree_sub_le _ _).trans
        (max_le_max Polynomial.natDegree_mul_le Polynomial.natDegree_mul_le)) hdegree
    · intro i hi
      rw [← Polynomial.coeff_coe, hprod]
      exact PowerSeries.X_pow_dvd_iff.mp (dvd_mul_of_dvd_left hdiv _) i hi
  have hz : ((U : PowerSeries ℚ) * H - (V : PowerSeries ℚ)) *
      (B : PowerSeries ℚ) = 0 * (B : PowerSeries ℚ) := by
    rw [← hprod, hzero]
    simp
  have hunit : IsUnit (B : PowerSeries ℚ) := by
    apply PowerSeries.isUnit_iff_constantCoeff.mpr
    rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply, Polynomial.coeff_coe]
    exact isUnit_iff_ne_zero.mpr hB
  exact sub_eq_zero.mp (hunit.mul_right_cancel hz)

/-- A polynomial certificate and a checked truncation give the low coefficients. -/
theorem coefficients_from_truncation (H : PowerSeries ℚ) (U V T W : ℚ[X]) (N : Nat)
    (htrunc : H.trunc N = T) (hcert : U*T - V = X^N * W) :
    ∀ i < N, PowerSeries.coeff i
      ((U : PowerSeries ℚ) * H - (V : PowerSeries ℚ)) = 0 := by
  have hdiff : (PowerSeries.X : PowerSeries ℚ)^N ∣ H - (T : PowerSeries ℚ) := by
    apply PowerSeries.X_pow_dvd_iff.mpr
    intro i hi
    have h := congrArg (fun p : ℚ[X] => p.coeff i) htrunc
    simp only [PowerSeries.coeff_trunc, ite_eq_left hi] at h
    simpa only [map_sub, Polynomial.coeff_coe, sub_eq_zero] using h
  have hpoly : (PowerSeries.X : PowerSeries ℚ)^N ∣
      ((U*T-V : ℚ[X]) : PowerSeries ℚ) := by
    rw [hcert]
    simp only [Polynomial.coe_mul, Polynomial.coe_pow, Polynomial.coe_X]
    exact dvd_mul_right _ _
  have hsum := dvd_add (dvd_mul_of_dvd_right hdiff (U : PowerSeries ℚ)) hpoly
  have heq : (U : PowerSeries ℚ) * (H - (T : PowerSeries ℚ)) +
      ((U*T-V : ℚ[X]) : PowerSeries ℚ) =
      (U : PowerSeries ℚ) * H - (V : PowerSeries ℚ) := by
    simp only [Polynomial.coe_sub, Polynomial.coe_mul]
    ring
  rw [heq] at hsum
  exact PowerSeries.X_pow_dvd_iff.mp hsum

def primaryQ : ℚ[X] := (1 : ℚ[X]) + (-1 : ℚ[X]) * X^3 + (-4 : ℚ[X]) * X^4 + (-6 : ℚ[X]) * X^5
def primaryR : ℚ[X] := (10 : ℚ[X]) + (4 : ℚ[X]) * X^1 + (10 : ℚ[X]) * X^2 + (8 : ℚ[X]) * X^3 + (-14 : ℚ[X]) * X^4 + (-34 : ℚ[X]) * X^5 + (14 : ℚ[X]) * X^6 + (2 : ℚ[X]) * X^7
def primaryT : ℚ[X] := (10 : ℚ[X]) + (4 : ℚ[X]) * X^1 + (10 : ℚ[X]) * X^2 + (18 : ℚ[X]) * X^3 + (30 : ℚ[X]) * X^4 + (52 : ℚ[X]) * X^5 + (96 : ℚ[X]) * X^6 + (164 : ℚ[X]) * X^7 + (280 : ℚ[X]) * X^8 + (484 : ℚ[X]) * X^9 + (860 : ℚ[X]) * X^10 + (1512 : ℚ[X]) * X^11 + (2588 : ℚ[X]) * X^12 + (4476 : ℚ[X]) * X^13 + (7856 : ℚ[X]) * X^14 + (13796 : ℚ[X]) * X^15 + (23900 : ℚ[X]) * X^16 + (41288 : ℚ[X]) * X^17 + (72076 : ℚ[X]) * X^18 + (126220 : ℚ[X]) * X^19 + (219664 : ℚ[X]) * X^20 + (380628 : ℚ[X]) * X^21 + (662252 : ℚ[X]) * X^22 + (1157000 : ℚ[X]) * X^23 + (2016604 : ℚ[X]) * X^24 + (3502748 : ℚ[X]) * X^25

theorem primary_certificate : primaryQ * primaryT - primaryR = X^26 * ((-6089776 : ℚ[X]) + (-10618116 : ℚ[X]) * X^1 + (-18511164 : ℚ[X]) * X^2 + (-26110616 : ℚ[X]) * X^3 + (-21016488 : ℚ[X]) * X^4) := by
  unfold primaryQ primaryR primaryT
  ring

theorem primary_coprime : IsCoprime primaryQ primaryR := by
  refine ⟨(Polynomial.C (1 / 9400 : ℚ)) * ((125210 : ℚ[X]) + (-28466 : ℚ[X]) * X^1 + (-89496 : ℚ[X]) * X^2 + (-34388 : ℚ[X]) * X^3 + (19558 : ℚ[X]) * X^4 + (6224 : ℚ[X]) * X^5 + (418 : ℚ[X]) * X^6), (Polynomial.C (1 / 9400 : ℚ)) * ((-11581 : ℚ[X]) + (7479 : ℚ[X]) * X^1 + (17539 : ℚ[X]) * X^2 + (10730 : ℚ[X]) * X^3 + (1254 : ℚ[X]) * X^4), ?_⟩
  unfold primaryQ primaryR
  norm_num
  ring_nf
  change Polynomial.C (1 / 9400 : ℚ) * Polynomial.C (9400 : ℚ) = Polynomial.C (1 : ℚ)
  rw [← map_mul]
  norm_num

/-- Conditional on the published degree bounds and the orbit-count truncation. -/
theorem primary_identity_of_representation (H : PowerSeries ℚ) (A B : ℚ[X])
    (hB : B.coeff 0 ≠ 0) (hrep : (B : PowerSeries ℚ) * H = (A : PowerSeries ℚ))
    (hAdegree : A.natDegree ≤ 20) (hBdegree : B.natDegree ≤ 10)
    (hcounts : H.trunc 26 = primaryT) :
    (primaryQ : PowerSeries ℚ) * H = (primaryR : PowerSeries ℚ) := by
  apply finite_coefficient_identity H A B primaryQ primaryR 26 hB hrep
  · have hQ : primaryQ.natDegree = 5 := by unfold primaryQ; compute_degree <;> norm_num
    have hR : primaryR.natDegree = 7 := by unfold primaryR; compute_degree <;> norm_num
    rw [hQ, hR]
    omega
  · exact coefficients_from_truncation H _ _ _ _ _ hcounts primary_certificate

#print axioms primary_identity_of_representation
#print axioms primary_coprime

def dualQ : ℚ[X] := (1 : ℚ[X]) + (-1 : ℚ[X]) * X^6 + (-8 : ℚ[X]) * X^7 + (-28 : ℚ[X]) * X^8 + (-48 : ℚ[X]) * X^9 + (-36 : ℚ[X]) * X^10
def dualR : ℚ[X] := (10 : ℚ[X]) + (5 : ℚ[X]) * X^1 + (12 : ℚ[X]) * X^2 + (20 : ℚ[X]) * X^3 + (32 : ℚ[X]) * X^4 + (58 : ℚ[X]) * X^5 + (97 : ℚ[X]) * X^6 + (92 : ℚ[X]) * X^7 + (-46 : ℚ[X]) * X^8 + (-227 : ℚ[X]) * X^9 + (-161 : ℚ[X]) * X^10 + (90 : ℚ[X]) * X^11 + (18 : ℚ[X]) * X^12
def dualT : ℚ[X] := (10 : ℚ[X]) + (5 : ℚ[X]) * X^1 + (12 : ℚ[X]) * X^2 + (20 : ℚ[X]) * X^3 + (32 : ℚ[X]) * X^4 + (58 : ℚ[X]) * X^5 + (107 : ℚ[X]) * X^6 + (177 : ℚ[X]) * X^7 + (286 : ℚ[X]) * X^8 + (509 : ℚ[X]) * X^9 + (967 : ℚ[X]) * X^10 + (1720 : ℚ[X]) * X^11 + (2877 : ℚ[X]) * X^12 + (4913 : ℚ[X]) * X^13 + (8634 : ℚ[X]) * X^14 + (14977 : ℚ[X]) * X^15 + (25395 : ℚ[X]) * X^16 + (43808 : ℚ[X]) * X^17 + (78441 : ℚ[X]) * X^18 + (140829 : ℚ[X]) * X^19 + (245866 : ℚ[X]) * X^20 + (421629 : ℚ[X]) * X^21 + (726359 : ℚ[X]) * X^22 + (1257624 : ℚ[X]) * X^23 + (2169685 : ℚ[X]) * X^24 + (3753113 : ℚ[X]) * X^25 + (6585850 : ℚ[X]) * X^26 + (11674025 : ℚ[X]) * X^27 + (20567307 : ℚ[X]) * X^28 + (35745520 : ℚ[X]) * X^29 + (61658097 : ℚ[X]) * X^30

theorem dual_certificate : dualQ * dualT - dualR = X^31 * ((-106367941 : ℚ[X]) + (-183876810 : ℚ[X]) * X^1 + (-318867333 : ℚ[X]) * X^2 + (-556621391 : ℚ[X]) * X^3 + (-978389544 : ℚ[X]) * X^4 + (-1720950653 : ℚ[X]) * X^5 + (-2901634972 : ℚ[X]) * X^6 + (-4182634728 : ℚ[X]) * X^7 + (-4246427376 : ℚ[X]) * X^8 + (-2219691492 : ℚ[X]) * X^9) := by
  unfold dualQ dualR dualT
  ring

theorem dual_coprime : IsCoprime dualQ dualR := by
  refine ⟨(Polynomial.C (1 / 4704240 : ℚ)) * ((82817290 : ℚ[X]) + (1169835 : ℚ[X]) * X^1 + (133646565 : ℚ[X]) * X^2 + (79997447 : ℚ[X]) * X^3 + (184740235 : ℚ[X]) * X^4 + (58139087 : ℚ[X]) * X^5 + (344190594 : ℚ[X]) * X^6 + (-86902660 : ℚ[X]) * X^7 + (-350789918 : ℚ[X]) * X^8 + (-843579379 : ℚ[X]) * X^9 + (322927344 : ℚ[X]) * X^10 + (73604358 : ℚ[X]) * X^11), (Polynomial.C (1 / 4704240 : ℚ)) * ((-7811305 : ℚ[X]) + (3788669 : ℚ[X]) * X^1 + (-5885425 : ℚ[X]) * X^2 + (6019175 : ℚ[X]) * X^3 + (2997737 : ℚ[X]) * X^4 + (30416891 : ℚ[X]) * X^5 + (15647328 : ℚ[X]) * X^6 + (74729696 : ℚ[X]) * X^7 + (106089396 : ℚ[X]) * X^8 + (147208716 : ℚ[X]) * X^9), ?_⟩
  unfold dualQ dualR
  norm_num
  ring_nf
  change Polynomial.C (1 / 4704240 : ℚ) * Polynomial.C (4704240 : ℚ) = Polynomial.C (1 : ℚ)
  rw [← map_mul]
  norm_num

/-- Conditional on the published degree bounds and the orbit-count truncation. -/
theorem dual_identity_of_representation (H : PowerSeries ℚ) (A B : ℚ[X])
    (hB : B.coeff 0 ≠ 0) (hrep : (B : PowerSeries ℚ) * H = (A : PowerSeries ℚ))
    (hAdegree : A.natDegree ≤ 20) (hBdegree : B.natDegree ≤ 10)
    (hcounts : H.trunc 31 = dualT) :
    (dualQ : PowerSeries ℚ) * H = (dualR : PowerSeries ℚ) := by
  apply finite_coefficient_identity H A B dualQ dualR 31 hB hrep
  · have hQ : dualQ.natDegree = 10 := by unfold dualQ; compute_degree <;> norm_num
    have hR : dualR.natDegree = 12 := by unfold dualR; compute_degree <;> norm_num
    rw [hQ, hR]
    omega
  · exact coefficients_from_truncation H _ _ _ _ _ hcounts dual_certificate

#print axioms dual_identity_of_representation
#print axioms dual_coprime

end Denominator
