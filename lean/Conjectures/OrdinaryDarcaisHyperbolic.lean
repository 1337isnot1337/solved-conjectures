import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series
import Mathlib.Analysis.SpecialFunctions.Trigonometric.DerivHyp
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! Hyperbolic inequalities for the ordinary second and third geometric moments. -/

namespace OrdinaryDarcais

open Real

private theorem sinh_taylor_five {v : ℝ} (hv : 0 ≤ v) :
    v * (1 + v^2/6 + v^4/120) ≤ sinh v := by
  have h := (Real.hasSum_sinh v).summable.sum_le_tsum (Finset.range 3)
    (fun i _ => show 0 ≤ v ^ (2*i+1) / (Nat.factorial (2*i+1):ℝ) by positivity)
  rw [(Real.hasSum_sinh v).tsum_eq] at h
  norm_num [Finset.sum_range_succ, Nat.factorial] at h
  linarith only [h]

/-- A uniform fourth-order bound for the third geometric moment in logarithmic radius. -/
theorem sinh_four_lower {v : ℝ} (hv : 0 ≤ v) :
    3 * v^4 * (2 + cosh (2*v)) ≤ 10 * sinh v^4 := by
  let a := v^2
  let Y := 1 + a/3 + 2*a^2/45
  have ha : 0 ≤ a := sq_nonneg _
  have hp : 0 ≤ v * (1 + v^2/6 + v^4/120) := by positivity
  have hlow := sinh_taylor_five hv
  have hB : a * Y ≤ sinh v^2 := by
    calc
      a * Y ≤ (v * (1 + v^2/6 + v^4/120))^2 := by
        dsimp [a,Y]
        nlinarith only [show 0 ≤ v^8 by positivity, show 0 ≤ v^10 by positivity]
      _ ≤ _ := pow_le_pow_left₀ hp hlow 2
  have hlin : 0 ≤ 2*Y-3/5*a := by
    dsimp [Y]
    linarith only [ha, sq_nonneg a]
  have hpoly : 0 ≤ Y^2 - 3/5*a*Y - 9/10 := by
    calc
      (0:ℝ) ≤ 1/10 + a/15 + 2*a^3/675 + 4*a^4/2025 := by positivity
      _ = _ := by dsimp [Y]; ring
  have hfac : 0 ≤ sinh v^2 + a*Y - 3/5*a^2 := by
    linarith only [hB, mul_nonneg ha hlin]
  have hprod := mul_nonneg (sub_nonneg.2 hB) hfac
  have hscaled := mul_nonneg (sq_nonneg a) hpoly
  have hc : cosh (2*v) = 1 + 2*sinh v^2 := by
    rw [Real.cosh_two_mul]
    linarith only [Real.cosh_sq_sub_sinh_sq v]
  rw [hc]
  dsimp only [a] at hprod hscaled
  nlinarith only [hprod, hscaled]

private theorem nonneg_of_derivative {f g : ℝ → ℝ} (h : ∀ t, HasDerivAt f (g t) t)
    (hz : f 0 = 0) (hg : ∀ t, 0 ≤ t → 0 ≤ g t) {v : ℝ} (hv : 0 ≤ v) : 0 ≤ f v := by
  have hm : MonotoneOn f (Set.Ici 0) := by
    apply monotoneOn_of_deriv_nonneg (convex_Ici _)
    · exact fun t _ => (h t).continuousAt.continuousWithinAt
    · exact fun t _ => (h t).differentiableAt.differentiableWithinAt
    · intro t ht
      rw [interior_Ici] at ht
      rw [(h t).deriv]
      exact hg t ht.le
  simpa only [hz] using hm (Set.self_mem_Ici (a := (0:ℝ))) hv hv

/-- The logarithmically normalized second geometric moment decreases on the positive axis. -/
theorem triple_sinh_le {v : ℝ} (hv : 0 ≤ v) : 3*sinh v ≤ v*(2+cosh v) := by
  have h₁ (t : ℝ) : HasDerivAt (fun y : ℝ => y*cosh y - sinh y) (t*sinh t) t := by
    convert ((hasDerivAt_id t).mul (hasDerivAt_cosh t)).sub (hasDerivAt_sinh t) using 1
    · rfl
    · simp
  have h₂ (t : ℝ) : HasDerivAt (fun y : ℝ => 2-2*cosh y+y*sinh y) (t*cosh t-sinh t) t := by
    convert ((hasDerivAt_const t (2:ℝ)).sub ((hasDerivAt_cosh t).const_mul 2)).add
      ((hasDerivAt_id t).mul (hasDerivAt_sinh t)) using 1
    · rfl
    · simp
      ring
  have h₃ (t : ℝ) : HasDerivAt (fun y : ℝ => y*(2+cosh y)-3*sinh y)
      (2-2*cosh t+t*sinh t) t := by
    convert ((hasDerivAt_id t).mul ((hasDerivAt_const t (2:ℝ)).add (hasDerivAt_cosh t))).sub
      ((hasDerivAt_sinh t).const_mul 3) using 1
    · rfl
    · simp
      ring
  have p₁ (t : ℝ) (ht : 0 ≤ t) : 0 ≤ t*cosh t-sinh t :=
    nonneg_of_derivative h₁ (by simp) (fun y hy => mul_nonneg hy (sinh_nonneg_iff.2 hy)) ht
  have p₂ (t : ℝ) (ht : 0 ≤ t) : 0 ≤ 2-2*cosh t+t*sinh t :=
    nonneg_of_derivative h₂ (by norm_num) p₁ ht
  exact sub_nonneg.1 (nonneg_of_derivative h₃ (by simp) p₂ hv)

end OrdinaryDarcais
