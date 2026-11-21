module

public import Mathlib.Analysis.Complex.Norm
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.LinearCombination
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.FieldSimp

/-!
# The reciprocal-segment argument for Vishnyakova's root-radius problem

This file proves the geometric zero-exclusion step used in Sections 2--3 of
`results/vishnyakova-root-radius/PROOF.md`.  In particular, it does not assume
the Grace--Walsh--Szegő theorem or any asymptotic or root-location assertion.
The bridge from the original transformed polynomials to this geometry is a
separate obligation.
-/

@[expose] public section

namespace VishnyakovaRootRadius

private theorem reciprocal_coordinates (x y u v : ℝ)
    (hre : x * u - y * v = 1) (him : x * v + y * u = 0) :
    0 < x ^ 2 + y ^ 2 ∧
    (x ^ 2 + y ^ 2) * u = x ∧
    (x ^ 2 + y ^ 2) * v = -y ∧
    (x ^ 2 + y ^ 2) * (u ^ 2 + v ^ 2) = 1 := by
  have hprod : (x ^ 2 + y ^ 2) * (u ^ 2 + v ^ 2) = 1 := by
    calc
      (x ^ 2 + y ^ 2) * (u ^ 2 + v ^ 2) =
          (x * u - y * v) ^ 2 + (x * v + y * u) ^ 2 := by ring
      _ = 1 := by rw [hre, him]; norm_num
  refine ⟨?_, ?_, ?_, hprod⟩
  · have hnonneg : 0 ≤ x ^ 2 + y ^ 2 := by positivity
    have hne : x ^ 2 + y ^ 2 ≠ 0 := by
      intro hz
      rw [hz, zero_mul] at hprod
      norm_num at hprod
    exact lt_of_le_of_ne hnonneg (Ne.symm hne)
  · linear_combination x * hre + y * him
  · linear_combination x * him - y * hre

private theorem reciprocal_segment_positive_endpoint (x y u v t : ℝ)
    (hre : x * u - y * v = 1) (him : x * v + y * u = 0)
    (hy : 0 < y) (hmean : y + v ≤ 0)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    (hw : 0 < t * y + (1 - t) * v) :
    (t * x + (1 - t) * u) ^ 2 + (t * y + (1 - t) * v) ^ 2 ≤ 1 ∧
    (y + v < 0 →
      (t * x + (1 - t) * u) ^ 2 + (t * y + (1 - t) * v) ^ 2 < 1) := by
  obtain ⟨hR, hRu, hRv, hRS⟩ := reciprocal_coordinates x y u v hre him
  let R : ℝ := x ^ 2 + y ^ 2
  let A : ℝ := t * (R + 1) - 1
  let N : ℝ := (t * x + (1 - t) * u) ^ 2 + (t * y + (1 - t) * v) ^ 2
  have hRpos : 0 < R := hR
  have hRle : R ≤ 1 := by
    have h := mul_nonpos_of_nonneg_of_nonpos hRpos.le hmean
    change R * v = -y at hRv
    have h' : y * (R - 1) ≤ 0 := by nlinarith only [h, hRv]
    exact le_of_not_gt (fun hlt => (not_lt_of_ge h') (mul_pos hy (by linarith)))
  have hApos : 0 < A := by
    have h := mul_pos hRpos hw
    have heq : R * (t * y + (1 - t) * v) = y * A := by
      dsimp [A]
      linear_combination (1 - t) * hRv
    rw [heq] at h
    exact pos_of_mul_pos_right h hy.le
  have hcross : R * (x * u + y * v) = x ^ 2 - y ^ 2 := by
    linear_combination x * hRu + y * hRv
  have hidentity : R * (1 - N) =
      (1 - R) * A + t * (1 - t) * ((1 - R) ^ 2 + 4 * y ^ 2) := by
    dsimp [N, A]
    linear_combination -(1 - t) ^ 2 * hRS - 2 * t * (1 - t) * hcross
  have hlast : 0 ≤ t * (1 - t) * ((1 - R) ^ 2 + 4 * y ^ 2) := by
    apply mul_nonneg
    · exact mul_nonneg ht0 (by linarith)
    · positivity
  have hfirst : 0 ≤ (1 - R) * A := mul_nonneg (by linarith) hApos.le
  constructor
  · have h : 0 ≤ R * (1 - N) := by rw [hidentity]; positivity
    have : 0 ≤ 1 - N := nonneg_of_mul_nonneg_right h hRpos
    change N ≤ 1
    linarith
  · intro hstrict
    have h := mul_neg_of_pos_of_neg hRpos hstrict
    have hRlt : R < 1 := by
      have h' : y * (R - 1) < 0 := by nlinarith only [h, hRv]
      have : R - 1 < 0 := neg_of_mul_neg_right h' hy.le
      linarith
    have hfirst' : 0 < (1 - R) * A := mul_pos (by linarith) hApos
    have h : 0 < R * (1 - N) := by rw [hidentity]; linarith
    have : 0 < 1 - N := pos_of_mul_pos_right h hRpos.le
    change N < 1
    linarith

/-- A point above the real axis on the segment between reciprocal complex
numbers whose midpoint lies on or below that axis belongs to the closed unit
disk.  If the midpoint is strictly below the axis, the point is in the open
unit disk. -/
theorem reciprocal_segment (r s : ℂ) (hrs : r * s = 1)
    (hmean : r.im + s.im ≤ 0) (t : ℝ) (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    (hw : 0 < ((t : ℂ) * r + (1 - (t : ℂ)) * s).im) :
    ‖(t : ℂ) * r + (1 - (t : ℂ)) * s‖ ≤ 1 ∧
    (r.im + s.im < 0 → ‖(t : ℂ) * r + (1 - (t : ℂ)) * s‖ < 1) := by
  have hre : r.re * s.re - r.im * s.im = 1 := by
    simpa using congrArg Complex.re hrs
  have him : r.re * s.im + r.im * s.re = 0 := by
    simpa using congrArg Complex.im hrs
  have hw' : 0 < t * r.im + (1 - t) * s.im := by simpa using hw
  have hcoord :
      (t * r.re + (1 - t) * s.re) ^ 2 +
        (t * r.im + (1 - t) * s.im) ^ 2 ≤ 1 ∧
      (r.im + s.im < 0 →
        (t * r.re + (1 - t) * s.re) ^ 2 +
          (t * r.im + (1 - t) * s.im) ^ 2 < 1) := by
    by_cases hr : 0 < r.im
    · exact reciprocal_segment_positive_endpoint r.re r.im s.re s.im t
        hre him hr hmean ht0 ht1 hw'
    · have hs : 0 < s.im := by
        by_contra hs
        have h1 := mul_nonpos_of_nonneg_of_nonpos ht0 (le_of_not_gt hr)
        have h2 := mul_nonpos_of_nonneg_of_nonpos (by linarith : 0 ≤ 1 - t)
          (le_of_not_gt hs)
        linarith
      have h := reciprocal_segment_positive_endpoint s.re s.im r.re r.im (1 - t)
        (by nlinarith only [hre]) (by nlinarith only [him]) hs (by linarith)
        (by linarith) (by linarith) (by nlinarith only [hw'])
      convert h using 1 <;> ring_nf
  have hn : ‖(t : ℂ) * r + (1 - (t : ℂ)) * s‖ ^ 2 =
      (t * r.re + (1 - t) * s.re) ^ 2 +
        (t * r.im + (1 - t) * s.im) ^ 2 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp
    ring
  constructor
  · nlinarith only [hn, hcoord.1, norm_nonneg ((t : ℂ) * r + (1 - (t : ℂ)) * s)]
  · intro hmean'
    nlinarith only [hn, hcoord.2 hmean', norm_nonneg ((t : ℂ) * r + (1 - (t : ℂ)) * s)]

/-- The reciprocal-segment lemma in the square-root form used by the written
proof.  The equality for `v` permits either square root. -/
theorem reciprocal_segment_sqrt (u v : ℂ) (hv : v ^ 2 = 1 - u ^ 2)
    (hu : u.im ≤ 0) (k : ℝ) (hk0 : -1 ≤ k) (hk1 : k ≤ 1)
    (hw : 0 < (u + Complex.I * (k : ℂ) * v).im) :
    ‖u + Complex.I * (k : ℂ) * v‖ ≤ 1 ∧
    (u.im < 0 → ‖u + Complex.I * (k : ℂ) * v‖ < 1) := by
  let r := u + Complex.I * v
  let s := u - Complex.I * v
  have hrs : r * s = 1 := by
    dsimp [r, s]
    calc
      (u + Complex.I * v) * (u - Complex.I * v) =
          u ^ 2 - Complex.I ^ 2 * v ^ 2 := by ring
      _ = 1 := by rw [Complex.I_sq, hv]; ring
  have hmean : r.im + s.im = 2 * u.im := by simp [r, s]; ring
  have heq : (((1 + k) / 2 : ℝ) : ℂ) * r +
      (1 - (((1 + k) / 2 : ℝ) : ℂ)) * s = u + Complex.I * (k : ℂ) * v := by
    dsimp [r, s]
    push_cast
    ring
  have h := reciprocal_segment r s hrs (by rw [hmean]; linarith)
    ((1 + k) / 2) (by linarith) (by linarith) (by rw [heq]; exact hw)
  rw [heq] at h
  exact ⟨h.1, fun hstrict => h.2 (by rw [hmean]; linarith)⟩

/-- The scalar Rayleigh-quotient estimate.  Its assumptions are exactly the
quadratic-form bounds used in Section 3; the tridiagonal-matrix bridge is not
assumed to have been formalized by this lemma. -/
theorem rayleigh_disk_bound (beta d R k : ℝ) (hbeta : 0 < beta)
    (hd : 0 ≤ d) (hdR : d ≤ R) (hk : |k| ≤ 2 * d + beta)
    (t s z : ℂ) (hs : s ^ 2 = t * (1 - t)) (ht : 0 ≤ t.im)
    (hz : 0 < z.im)
    (heigen : z = (d : ℂ) - t * ((2 * d + beta : ℝ) : ℂ) +
      Complex.I * s * (k : ℂ)) :
    ‖z + ((beta / 2 : ℝ) : ℂ)‖ ≤ R + beta / 2 ∧
    (0 < t.im → ‖z + ((beta / 2 : ℝ) : ℂ)‖ < R + beta / 2) := by
  let c : ℝ := d + beta / 2
  let u : ℂ := 1 - 2 * t
  let v : ℂ := 2 * s
  let q : ℝ := k / (2 * d + beta)
  have hc : 0 < c := by dsimp [c]; linarith
  have hden : 0 < 2 * d + beta := by linarith
  have hv : v ^ 2 = 1 - u ^ 2 := by
    dsimp [u, v]
    calc
      (2 * s) ^ 2 = 4 * s ^ 2 := by ring
      _ = 1 - (1 - 2 * t) ^ 2 := by rw [hs]; ring
  have hu : u.im ≤ 0 := by simp [u]; linarith
  have hq0 : -1 ≤ q := by
    dsimp [q]
    rw [le_div_iff₀ hden]
    have := (abs_le.mp hk).1
    linarith
  have hq1 : q ≤ 1 := by
    dsimp [q]
    rw [div_le_iff₀ hden]
    have := (abs_le.mp hk).2
    linarith
  have hcq : c * q * 2 = k := by
    dsimp [c, q]
    field_simp [hden.ne']
  have hcqC : (c : ℂ) * (q : ℂ) * 2 = (k : ℂ) := by exact_mod_cast hcq
  have heq : (c : ℂ) * (u + Complex.I * (q : ℂ) * v) =
      z + ((beta / 2 : ℝ) : ℂ) := by
    rw [heigen]
    dsimp [c, u, v] at *
    push_cast at *
    linear_combination (Complex.I * s) * hcqC
  have hw : 0 < (u + Complex.I * (q : ℂ) * v).im := by
    have him : c * (u + Complex.I * (q : ℂ) * v).im = z.im := by
      simpa only [Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
        Complex.ofReal_im, zero_mul, add_zero, Complex.add_im] using
        congrArg Complex.im heq
    have hprod : 0 < c * (u + Complex.I * (q : ℂ) * v).im := by rw [him]; exact hz
    exact pos_of_mul_pos_right hprod hc.le
  have hgeom := reciprocal_segment_sqrt u v hv hu q hq0 hq1 hw
  have hnorm : ‖z + ((beta / 2 : ℝ) : ℂ)‖ =
      c * ‖u + Complex.I * (q : ℂ) * v‖ := by
    rw [← heq, Complex.norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos hc]
  have hcR : c ≤ R + beta / 2 := by dsimp [c]; linarith
  constructor
  · rw [hnorm]
    calc
      c * ‖u + Complex.I * (q : ℂ) * v‖ ≤ c * 1 :=
        mul_le_mul_of_nonneg_left hgeom.1 hc.le
      _ ≤ R + beta / 2 := by simpa using hcR
  · intro htpos
    have hup : u.im < 0 := by simp [u]; linarith
    rw [hnorm]
    calc
      c * ‖u + Complex.I * (q : ℂ) * v‖ < c * 1 :=
        mul_lt_mul_of_pos_left (hgeom.2 hup) hc
      _ ≤ R + beta / 2 := by simpa using hcR

end VishnyakovaRootRadius
