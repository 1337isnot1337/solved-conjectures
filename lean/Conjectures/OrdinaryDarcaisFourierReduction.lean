import Conjectures.OrdinaryDarcaisInversion
import Conjectures.OrdinaryDarcaisRoot

/-! Reduce the ordinary Turán tail to the two explicit uniform inequalities
verified by the written rational-box argument. The saddle, characteristic
function, inversion and pointwise Taylor estimates are proved here. -/

namespace OrdinaryDarcais

open Real
open scoped Interval

theorem mean_le_variance {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    moment 0 r ≤ moment 1 r := by
  apply (moment_summable 0 hr hr').tsum_le_tsum _ (moment_summable 1 hr hr')
  intro k
  cases k with
  | zero => simp [momentTerm, divisorSum]
  | succ k =>
    unfold momentTerm
    simp only [pow_zero, pow_one, one_mul]
    apply mul_le_mul_of_nonneg_right _ (pow_nonneg hr _)
    simpa using mul_le_mul_of_nonneg_right
      (show (1 : ℝ) ≤ (k + 1 : ℕ) by exact_mod_cast Nat.succ_le_succ (Nat.zero_le k))
      (Nat.cast_nonneg (divisorSum (k + 1)) (α := ℝ))

theorem strictTuran_of_two_ordinary_bounds {x : ℝ} {n : ℕ} (hx : 1 ≤ x) (hn : 501 ≤ n)
    (moments : ∀ r ∈ Set.Ioo (0 : ℝ) 1, x * moment 0 r = n →
      256 * (x * moment 2 r)^2 ≤ 49 * (x * moment 1 r)^3)
    (tails : ∀ r ∈ Set.Ioo (0 : ℝ) 1, x * moment 0 r = n →
      -(19/50 : ℝ) ≤ ∫ u in (11/4 : ℝ)..(π*sqrt (x*moment 1 r)),
        normalizedIntegrand (x*moment 1 r) (damping x r) (phase x r) u) :
    darcais x (n-1) * darcais x (n+1) < darcais x n^2 := by
  have hxpos : 0 < x := by linarith
  have hnpos : 0 < n := by omega
  obtain ⟨r,⟨hr,saddle⟩,_⟩ := existsUnique_saddle hxpos (show (0:ℝ) < n by exact_mod_cast hnpos)
  let V := x*moment 1 r
  let K := x*moment 2 r
  have base : (501:ℝ) ≤ n := by exact_mod_cast hn
  have hV : 501 ≤ V := base.trans (saddle ▸ mul_le_mul_of_nonneg_left (mean_le_variance hr.1.le hr.2) hxpos.le)
  have hVpos : 0 < V := by linarith
  have hs := sqrt_pos.mpr hVpos
  have hKnon : 0 ≤ K := mul_nonneg hxpos.le (tsum_nonneg (fun k => momentTerm_nonneg 2 k hr.1.le))
  have bound := moments r hr saddle
  change 256*K^2 ≤ 49*V^3 at bound
  have hK : 16*K ≤ 7*(sqrt V)^3 := by
    apply (sq_le_sq₀ (by positivity) (by positivity)).mp
    have expand : (sqrt V)^3 = V*sqrt V := by rw [pow_succ,sq_sqrt hVpos.le]
    rw [expand]
    simp only [mul_pow,sq_sqrt hVpos.le]
    nlinarith only [bound]
  apply strictTuran_of_fourier_bounds hxpos hr.1 (exp_pos _) hnpos hV
    (damping_continuous hxpos.le hr.1.le hr.2) (phase_continuous hxpos.le hr.1.le hr.2)
    _ _ (tails r hr saddle) (darcais_fourier_inversion hxpos hr hnpos saddle)
  · intro u _
    have h := damping_bound hxpos.le hr.1.le hr.2 (u/sqrt V)
    change damping x r (u/sqrt V) ≤ V*(u/sqrt V)^2/2 at h
    rwa [div_pow,sq_sqrt hVpos.le,mul_div_cancel₀ _ hVpos.ne'] at h
  · intro u hu
    have h := phase_bound hxpos.le hr.1.le hr.2 (u/sqrt V)
    rw [abs_of_nonneg (div_nonneg hu.1 hs.le),div_pow] at h
    change |phase x r (u/sqrt V)| ≤ K*(u^3/(sqrt V)^3)/6 at h
    have ratio : K/(sqrt V)^3 ≤ 7/16 := by
      rw [div_le_div_iff₀ (pow_pos hs _) (by norm_num : (0:ℝ) < 16)]
      linarith only [hK]
    calc
      _ ≤ K*(u^3/(sqrt V)^3)/6 := h
      _ = (K/(sqrt V)^3)*u^3/6 := by ring
      _ ≤ _ := by gcongr; exact pow_nonneg hu.1 _

end OrdinaryDarcais
