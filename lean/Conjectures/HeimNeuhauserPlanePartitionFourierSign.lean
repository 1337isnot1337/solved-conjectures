import Conjectures.HeimNeuhauserPlanePartitionFourier

/-! Apply the normalized central integral to the actual divisor-square means and phases. -/

namespace PlanePartition

open Real
open scoped Interval
open OrdinaryDarcais (normalizedIntegrand)

theorem mean_le_variance {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    moment 0 r ≤ moment 1 r := by
  apply (moment_summable 0 hr hr').tsum_le_tsum _ (moment_summable 1 hr hr')
  intro k
  cases k with
  | zero => simp [momentTerm, divisorSquareSum]
  | succ k =>
    unfold momentTerm
    simp only [pow_zero, pow_one, one_mul]
    apply mul_le_mul_of_nonneg_right _ (pow_nonneg hr _)
    simpa using mul_le_mul_of_nonneg_right
      (show (1 : ℝ) ≤ (k + 1 : ℕ) by exact_mod_cast Nat.succ_le_succ (Nat.zero_le k))
      (Nat.cast_nonneg (divisorSquareSum (k + 1)) (α := ℝ))

/-- The normalized sign is positive once its third-moment and outer-tail bounds hold. -/
theorem positive_integral_at_saddle {x r n : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ n) (hsaddle : x * moment 0 r = n)
    (hγ : 9 * (x * moment 2 r) ^ 2 ≤ (x * moment 1 r) ^ 3)
    (htail : -(2 / 5 : ℝ) ≤ ∫ u in (3 : ℝ)..(π * sqrt (x * moment 1 r)),
      normalizedIntegrand (x * moment 1 r) (damping x r) (phase x r) u) :
    0 < ∫ u in (0 : ℝ)..(π * sqrt (x * moment 1 r)),
      normalizedIntegrand (x * moment 1 r) (damping x r) (phase x r) u := by
  let V := x * moment 1 r
  let K := x * moment 2 r
  have hx₀ : 0 ≤ x := by linarith
  have hV : 251 ≤ V := hn.trans (hsaddle ▸ mul_le_mul_of_nonneg_left (mean_le_variance hr.1.le hr.2) hx₀)
  have hV₀ : 0 < V := by linarith
  have hK₀ : 0 ≤ K := mul_nonneg hx₀ (tsum_nonneg (fun k => momentTerm_nonneg 2 k hr.1.le))
  have hs := sqrt_pos.mpr hV₀
  have hVpow : (sqrt V) ^ 3 = V * sqrt V := by rw [pow_succ, sq_sqrt hV₀.le]
  have hK : 3 * K ≤ (sqrt V) ^ 3 := by
    apply (sq_le_sq₀ (by positivity) (by positivity)).mp
    simp only [hVpow, mul_pow, sq_sqrt hV₀.le]
    change 9 * K ^ 2 ≤ V ^ 3 at hγ
    nlinarith only [hγ]
  apply normalized_fourier_pos_of_tail hV (damping_continuous hx₀ hr.1.le hr.2)
    (phase_continuous hx₀ hr.1.le hr.2) _ _ htail
  · intro u _
    have h := damping_bound hx₀ hr.1.le hr.2 (u / sqrt V)
    change damping x r (u / sqrt V) ≤ V * (u / sqrt V) ^ 2 / 2 at h
    rwa [div_pow, sq_sqrt hV₀.le, mul_div_cancel₀ _ hV₀.ne'] at h
  · intro u hu
    have hp := phase_bound hx₀ hr.1.le hr.2 (u / sqrt V)
    rw [abs_of_nonneg (div_nonneg hu.1 hs.le), div_pow] at hp
    change |phase x r (u / sqrt V)| ≤ K * (u ^ 3 / (sqrt V) ^ 3) / 6 at hp
    have hpos : 0 < (sqrt V) ^ 3 := pow_pos hs _
    have hk : K / (sqrt V) ^ 3 ≤ 1 / 3 := by
      rw [div_le_div_iff₀ hpos (by norm_num : (0 : ℝ) < 3)]
      linarith
    calc
      _ ≤ K * (u ^ 3 / (sqrt V) ^ 3) / 6 := hp
      _ = (K / (sqrt V) ^ 3) * u ^ 3 / 6 := by ring
      _ ≤ _ := by gcongr; exact pow_nonneg hu.1 _

end PlanePartition
