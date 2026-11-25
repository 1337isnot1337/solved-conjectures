module

public import Conjectures.RossiPermutohedronRational
public import Mathlib.Analysis.Calculus.SmoothSeries
public import Mathlib.Analysis.SpecificLimits.Normed

@[expose] public section
namespace RossiPermutohedron
open Complex Filter
open scoped Topology

noncomputable def eulerianGeometricTerm (n m : ℕ) (w : ℂ) : ℂ :=
  ((m+1:ℕ):ℂ)^n*w^(m+1)

noncomputable def eulerianGeometricDerivative (n m : ℕ) (w : ℂ) : ℂ :=
  ((m+1:ℕ):ℂ)^(n+1)*w^m

theorem hasDerivAt_eulerianGeometricTerm (n m : ℕ) (w : ℂ) :
    HasDerivAt (eulerianGeometricTerm n m) (eulerianGeometricDerivative n m w) w := by
  have h := ((hasDerivAt_id w).pow (m+1)).const_mul (((m+1:ℕ):ℂ)^n)
  change HasDerivAt (fun z => ((m+1:ℕ):ℂ)^n * z^(m+1)) _ w
  convert h using 1
  · rfl
  · unfold eulerianGeometricDerivative
    simp only [id_eq,add_tsub_cancel_right,pow_succ]
    ring

theorem summable_eulerianGeometric_majorant (n : ℕ) {r : ℝ} (hp : 0<r) (hr : r<1) :
    Summable (fun m : ℕ => ((m+1:ℕ):ℝ)^(n+1)*r^m) := by
  have hs := summable_pow_mul_geometric_of_norm_lt_one (n+1)
    (show ‖r‖<1 by simpa [Real.norm_eq_abs,abs_of_pos hp] using hr)
  have hs' := (summable_nat_add_iff 1).mpr hs
  refine (hs'.mul_right r⁻¹).congr (fun m => ?_)
  simp only [pow_succ r m,mul_assoc, mul_inv_cancel₀ hp.ne',mul_one]

theorem hasDerivAt_eulerianGeometric_sum (n : ℕ) {w : ℂ} (hw : ‖w‖<1) :
    HasDerivAt (fun z => ∑' m : ℕ,eulerianGeometricTerm n m z)
      (∑' m : ℕ,eulerianGeometricDerivative n m w) w := by
  let r : ℝ := (‖w‖+1)/2
  have hp : 0<r := by dsimp [r]; positivity
  have hr : r<1 := by dsimp [r]; linarith
  have hwr : w ∈ Metric.ball (0:ℂ) r := by
    rw [Metric.mem_ball,dist_zero_right]
    dsimp [r]
    linarith
  refine hasDerivAt_tsum_of_isPreconnected
    (summable_eulerianGeometric_majorant n hp hr) Metric.isOpen_ball
    (convex_ball (0:ℂ) r).isPreconnected
    (fun m z _ => hasDerivAt_eulerianGeometricTerm n m z) ?_
    (Metric.mem_ball_self hp) ?_ hwr
  · intro m z hz
    rw [Metric.mem_ball,dist_zero_right] at hz
    simp only [eulerianGeometricDerivative,norm_mul,norm_pow,Complex.norm_natCast]
    gcongr
  · simp [eulerianGeometricTerm,pow_succ]

/-- The exact power-series identity used at the near endpoints of the
sign grid, proved by differentiating on subdisks of the unit disk. -/
theorem rationalEulerian_geometric (n : ℕ) {w : ℂ} (hw : ‖w‖<1) :
    rationalEulerian n w = ∑' m : ℕ,eulerianGeometricTerm n m w := by
  induction n generalizing w with
  | zero =>
    simp only [rationalEulerian_zero,eulerianGeometricTerm,pow_zero,one_mul,pow_succ']
    rw [tsum_mul_left,tsum_geometric_of_norm_lt_one hw,div_eq_mul_inv]
  | succ n ih =>
    have hne : w≠1 := by
      intro h
      rw [h,norm_one] at hw
      exact (lt_irrefl _ hw)
    have hloc : (fun z => ∑' m : ℕ,eulerianGeometricTerm n m z)
        =ᶠ[𝓝 w] rationalEulerian n := by
      have hs : {z : ℂ | ‖z‖<1} ∈ 𝓝 w := (isOpen_lt continuous_norm continuous_const).mem_nhds hw
      filter_upwards [hs] with z hz using (ih hz).symm
    have hder : (complexEulerian (n+1)).eval w/(1-w)^(n+2) =
        ∑' m : ℕ,eulerianGeometricDerivative n m w :=
      ((hasDerivAt_rationalEulerian n w hne).congr_of_eventuallyEq hloc).unique
        (hasDerivAt_eulerianGeometric_sum n hw)
    calc
      _ = w*((complexEulerian (n+1)).eval w/(1-w)^(n+2)) := by
        unfold rationalEulerian
        rw [mul_div_assoc]
      _ = w*(∑' m : ℕ,eulerianGeometricDerivative n m w) := by rw [hder]
      _ = _ := by
        rw [← tsum_mul_left]
        apply tsum_congr
        intro m
        simp only [eulerianGeometricDerivative,eulerianGeometricTerm,pow_succ' w]
        ring

end RossiPermutohedron
