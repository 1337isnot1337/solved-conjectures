import Conjectures.HeimNeuhauserPlanePartitionFourierSign

/-! The remaining analytic estimates and inversion identity imply strict Turán
for the original plane-partition coefficient, with the precise exponential tilt. -/

namespace PlanePartition

open Real
open scoped Interval
open OrdinaryDarcais (normalizedIntegrand)

/-- A positive centered difference of the geometrically tilted coefficients
implies the strict Turán inequality after canceling the tilt. -/
theorem strictTuran_of_tilted_center {x r c : ℝ} (hx : 0 < x) (hr : 0 < r)
    (hc : 0 < c) {n : ℕ} (hn : 0 < n)
    (h : (c * r ^ (n - 1) * planePartition x (n - 1) + c * r ^ (n + 1) * planePartition x (n + 1)) / 2 <
      c * r ^ n * planePartition x n) :
    planePartition x (n - 1) * planePartition x (n + 1) < planePartition x n ^ 2 := by
  let a := c * r ^ (n - 1) * planePartition x (n - 1)
  let b := c * r ^ n * planePartition x n
  let d := c * r ^ (n + 1) * planePartition x (n + 1)
  have ha : 0 < a := mul_pos (mul_pos hc (pow_pos hr _)) (planePartition_pos hx _)
  have hd : 0 < d := mul_pos (mul_pos hc (pow_pos hr _)) (planePartition_pos hx _)
  change (a + d) / 2 < b at h
  have hap : 0 ≤ (a + d) / 2 := by positivity
  have hprod : a * d < b ^ 2 := by
    have hmean : a * d ≤ ((a + d) / 2) ^ 2 := by nlinarith [sq_nonneg (a - d)]
    exact hmean.trans_lt (pow_lt_pow_left₀ h hap (by decide))
  have hp : r ^ (n - 1) * r ^ (n + 1) = r ^ n * r ^ n := by
    rw [← pow_add, ← pow_add]
    congr 1
    omega
  have h₁ : a * d = (c * r ^ n) ^ 2 * (planePartition x (n - 1) * planePartition x (n + 1)) := by
    calc
      _ = c ^ 2 * (r ^ (n - 1) * r ^ (n + 1)) * (planePartition x (n - 1) * planePartition x (n + 1)) := by
        dsimp [a, d]; ring
      _ = _ := by rw [hp]; ring
  have h₂ : b ^ 2 = (c * r ^ n) ^ 2 * planePartition x n ^ 2 := by simp [b, mul_pow]
  rw [h₁, h₂] at hprod
  exact (mul_lt_mul_iff_right₀ (by positivity)).mp hprod

noncomputable def tiltConstant (x r : ℝ) : ℝ := exp (-(∑' k : ℕ, intensity x r k))

theorem strictTuran_of_saddle_estimates {x r : ℝ} {n : ℕ} (hx : 1 ≤ x)
    (hr : r ∈ Set.Ioo (0 : ℝ) 1) (hn : 251 ≤ n) (hsaddle : x * moment 0 r = n)
    (hγ : 9 * (x * moment 2 r) ^ 2 ≤ (x * moment 1 r) ^ 3)
    (htail : -(2 / 5 : ℝ) ≤ ∫ u in (3 : ℝ)..(π * sqrt (x * moment 1 r)),
      normalizedIntegrand (x * moment 1 r) (damping x r) (phase x r) u)
    (hinv : tiltConstant x r * r ^ n * planePartition x n -
      (tiltConstant x r * r ^ (n - 1) * planePartition x (n - 1) +
       tiltConstant x r * r ^ (n + 1) * planePartition x (n + 1)) / 2 =
      π⁻¹ * ∫ t in (0 : ℝ)..π, (1 - cos t) * exp (-damping x r t) * cos (phase x r t)) :
    planePartition x (n - 1) * planePartition x (n + 1) < planePartition x n ^ 2 := by
  have hnormalized := positive_integral_at_saddle hx hr (by exact_mod_cast hn) hsaddle hγ htail
  let V := x * moment 1 r
  let A := damping x r
  let θ := phase x r
  let f (t : ℝ) := (1 - cos t) * exp (-A t) * cos (θ t)
  have hV₀ : 0 < V := by
    have hv := mul_le_mul_of_nonneg_left (mean_le_variance hr.1.le hr.2) (show 0 ≤ x by linarith)
    rw [hsaddle] at hv
    exact lt_of_lt_of_le (by exact_mod_cast (by omega : 0 < n)) hv
  have hs : 0 < sqrt V := sqrt_pos.mpr hV₀
  have hchange : (∫ u in (0 : ℝ)..(π * sqrt V), f (u / sqrt V)) =
      sqrt V * ∫ t in (0 : ℝ)..π, f t := by
    rw [intervalIntegral.integral_comp_div f hs.ne']
    simp [hs.ne', smul_eq_mul]
  change 0 < ∫ u in (0 : ℝ)..(π * sqrt V), normalizedIntegrand V A θ u at hnormalized
  simp_rw [show normalizedIntegrand V A θ = fun u => V * f (u / sqrt V) by
    funext u; unfold normalizedIntegrand f; ring] at hnormalized
  rw [intervalIntegral.integral_const_mul, hchange, ← mul_assoc] at hnormalized
  have hpos : 0 < ∫ t in (0 : ℝ)..π, f t :=
    pos_of_mul_pos_right hnormalized (mul_nonneg hV₀.le hs.le)
  apply strictTuran_of_tilted_center (c := tiltConstant x r) (by linarith) hr.1 (exp_pos _) (by omega : 0 < n)
  apply sub_pos.mp
  rw [hinv]
  exact mul_pos (inv_pos.mpr pi_pos) hpos

end PlanePartition
