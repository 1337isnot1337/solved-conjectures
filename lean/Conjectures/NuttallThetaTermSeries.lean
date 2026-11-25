module

public import Conjectures.NuttallThetaTermDerivatives
import all Conjectures.NuttallThetaTermDerivatives
public import Mathlib.Analysis.Calculus.SmoothSeries
public import Mathlib.Analysis.SpecialFunctions.Exp

public section
namespace NuttallCumulants

open Polynomial Finset

noncomputable def polynomialDecayConstant (P : ℝ[X]) : ℝ :=
  ∑ i ∈ P.support, |P.coeff i| * (2:ℝ)^i * (i.factorial : ℝ)

theorem polynomialDecayConstant_nonneg (P : ℝ[X]) :
    0 ≤ polynomialDecayConstant P := by
  unfold polynomialDecayConstant
  exact sum_nonneg fun _ _ => by positivity

theorem abs_eval_le_exp_half (P : ℝ[X]) {z : ℝ} (hz : 0 ≤ z) :
    |P.eval z| ≤ polynomialDecayConstant P * Real.exp (z/2) := by
  have hmon (i : ℕ) : z^i ≤ (2:ℝ)^i * (i.factorial : ℝ) * Real.exp (z/2) := by
    have h := (div_le_iff₀ (by positivity : 0 < (i.factorial : ℝ))).1
      (Real.pow_div_factorial_le_exp (z/2) (by positivity) i)
    calc
      z^i = (2:ℝ)^i * (z/2)^i := by rw [← mul_pow]; congr 1; ring
      _ ≤ (2:ℝ)^i * (Real.exp (z/2) * (i.factorial : ℝ)) :=
        mul_le_mul_of_nonneg_left h (by positivity)
      _ = _ := by ring
  rw [eval_eq_sum, Polynomial.sum, polynomialDecayConstant, sum_mul]
  apply (abs_sum_le_sum_abs _ _).trans
  apply sum_le_sum
  intro i _
  rw [abs_mul, abs_of_nonneg (pow_nonneg hz _)]
  calc
    _ ≤ |P.coeff i| * ((2:ℝ)^i * (i.factorial : ℝ) * Real.exp (z/2)) :=
      mul_le_mul_of_nonneg_left (hmon i) (abs_nonneg _)
    _ = _ := by ring

theorem abs_modeCore_le_exp (P : ℝ[X]) (n : ℕ) (t : ℝ) :
    |modeCore P n t| ≤ polynomialDecayConstant P * Real.exp (t - thetaModeScale n t / 2) := by
  have hz : 0 ≤ thetaModeScale n t := by unfold thetaModeScale; positivity
  unfold modeCore
  rw [abs_mul, abs_of_pos (mul_pos (Real.exp_pos _) (Real.exp_pos _))]
  calc
    _ ≤ (Real.exp t * Real.exp (-thetaModeScale n t)) *
          (polynomialDecayConstant P * Real.exp (thetaModeScale n t/2)) :=
      mul_le_mul_of_nonneg_left (abs_eval_le_exp_half P hz) (by positivity)
    _ = polynomialDecayConstant P *
        (Real.exp t * (Real.exp (-thetaModeScale n t) * Real.exp (thetaModeScale n t/2))) := by ring
    _ = _ := by rw [← Real.exp_add, ← Real.exp_add]; congr 2; ring

theorem abs_modeCore_le_on_interval (P : ℝ[X]) (n : ℕ) {a b t : ℝ}
    (hat : a ≤ t) (htb : t ≤ b) :
    |modeCore P n t| ≤ (polynomialDecayConstant P * Real.exp b) *
      Real.exp (-(Real.pi * Real.exp (4*a)/2) * (n : ℝ)) := by
  let c : ℝ := Real.pi * Real.exp (4*a)/2
  have hc : 0 ≤ c := by dsimp [c]; positivity
  have hk : (n : ℝ) ≤ ((n : ℝ)+1)^2 := by
    nlinarith [Nat.cast_nonneg (α := ℝ) n, sq_nonneg (n:ℝ)]
  have he : Real.exp (4*a) ≤ Real.exp (4*t) :=
    Real.exp_le_exp.mpr (by linarith)
  have hscale : c * (n : ℝ) ≤ thetaModeScale n t / 2 := by
    calc
      _ ≤ c * ((n:ℝ)+1)^2 := mul_le_mul_of_nonneg_left hk hc
      _ = (Real.pi * ((n:ℝ)+1)^2) * Real.exp (4*a)/2 := by dsimp [c]; ring
      _ ≤ (Real.pi * ((n:ℝ)+1)^2) * Real.exp (4*t)/2 :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left he (by positivity)) (by norm_num)
      _ = _ := by unfold thetaModeScale; rfl
  calc
    _ ≤ polynomialDecayConstant P * Real.exp (t-thetaModeScale n t / 2) :=
      abs_modeCore_le_exp P n t
    _ ≤ polynomialDecayConstant P * Real.exp (b + (-c) * (n:ℝ)) :=
      mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (by linarith)) (polynomialDecayConstant_nonneg P)
    _ = _ := by rw [Real.exp_add, mul_assoc]

theorem summable_modeCore_norm (P : ℝ[X]) (t : ℝ) :
    Summable (fun n => ‖modeCore P n t‖) := by
  let c : ℝ := Real.pi * Real.exp (4*t)/2
  have hc : 0 < c := by dsimp [c]; positivity
  have hS : Summable (fun n : ℕ => Real.exp ((-c) * (n:ℝ))) := by
    simpa only [mul_comm] using (Real.summable_exp_nat_mul_iff.mpr (neg_lt_zero.mpr hc))
  refine (hS.mul_left (polynomialDecayConstant P * Real.exp t)).of_nonneg_of_le (fun _ => norm_nonneg _) (fun n => ?_)
  exact (Real.norm_eq_abs _).trans_le (abs_modeCore_le_on_interval P n le_rfl le_rfl)

theorem hasDerivAt_tsum_modeCore (P : ℝ[X]) (t : ℝ) :
    HasDerivAt (fun u => ∑' n, modeCore P n u)
      (∑' n, modeCore (modeDerivativePolynomial P) n t) t := by
  let Q := modeDerivativePolynomial P
  let c := Real.pi * Real.exp (4*(t-1))/2
  let w (n : ℕ) := (polynomialDecayConstant Q * Real.exp (t+1)) *
    Real.exp ((-c) * (n:ℝ))
  have hc : 0 < c := by dsimp [c]; positivity
  have hw0 : Summable (fun n : ℕ => Real.exp ((-c) * (n:ℝ))) := by
    simpa only [mul_comm] using (Real.summable_exp_nat_mul_iff.mpr (neg_lt_zero.mpr hc))
  have hw : Summable w := hw0.mul_left _
  have ht : t ∈ Set.Ioo (t-1) (t+1) := ⟨by linarith, by linarith⟩
  refine hasDerivAt_tsum_of_isPreconnected hw isOpen_Ioo
    ((convex_Ioo (t-1) (t+1)).isPreconnected) (fun n u _ => hasDerivAt_modeCore P n u)
    (fun n u hu => ?_) ht (summable_modeCore_norm P t).of_norm ht
  rw [Real.norm_eq_abs]
  exact abs_modeCore_le_on_interval Q n hu.1.le hu.2.le

/-- The infinite source series is differentiable term by term at every order. -/
theorem iteratedDeriv_thetaKernel (j : ℕ) :
    iteratedDeriv j thetaKernel = fun t => ∑' n, modeCore (modePolynomials j) n t := by
  induction j with
  | zero =>
    rw [iteratedDeriv_zero]
    funext t
    unfold thetaKernel
    exact tsum_congr (fun n => thetaTerm_eq_modeCore n t)
  | succ j ih =>
    rw [iteratedDeriv_succ, ih]
    funext t
    exact (hasDerivAt_tsum_modeCore (modePolynomials j) t).deriv

/-- Global modewise estimate, summable in the mode index with a uniform
double-exponential time factor. -/
theorem abs_modeCore_le_double_exp (P : ℝ[X]) (n : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    |modeCore P n t| ≤ (polynomialDecayConstant P * Real.exp (-Real.exp (2*t))) *
      Real.exp (-(n:ℝ)) := by
  let E := Real.exp (2*t)
  let k : ℝ := (n:ℝ)+1
  have hE : 1 + 2*t ≤ E := by simpa only [add_comm] using Real.add_one_le_exp (2*t)
  have hE1 : 1 ≤ E := by linarith
  have hE2 : 1 ≤ E^2 := by nlinarith
  have hEt : E+t ≤ E^2 := by nlinarith [sq_nonneg (E-1)]
  have hk : (n:ℝ) ≤ k^2-1 := by
    dsimp [k]
    nlinarith [Nat.cast_nonneg (α := ℝ) n, sq_nonneg (n:ℝ)]
  have hkm := mul_le_mul hk hE2 (by norm_num : (0:ℝ) ≤ 1)
    (show 0 ≤ k^2-1 by linarith [Nat.cast_nonneg (α := ℝ) n])
  have hm : E + t + (n:ℝ) ≤ k^2 * E^2 := by nlinarith
  have he4 : Real.exp (4*t) = E^2 := by
    rw [show 4*t = 2*t+2*t by ring, Real.exp_add, pow_two]
  have hscale : k^2 * E^2 ≤ thetaModeScale n t / 2 := by
    unfold thetaModeScale
    rw [he4]
    change k^2 * E^2 ≤ Real.pi * k^2 * E^2 / 2
    have hπ : (2:ℝ) ≤ Real.pi := by linarith [Real.pi_gt_three]
    have hp := mul_le_mul_of_nonneg_right hπ (show 0 ≤ k^2*E^2 by positivity)
    nlinarith
  calc
    _ ≤ polynomialDecayConstant P * Real.exp (t-thetaModeScale n t / 2) :=
      abs_modeCore_le_exp P n t
    _ ≤ polynomialDecayConstant P * Real.exp (-E - (n:ℝ)) := by
      apply mul_le_mul_of_nonneg_left _ (polynomialDecayConstant_nonneg P)
      exact Real.exp_le_exp.mpr (by linarith)
    _ = _ := by rw [sub_eq_add_neg, Real.exp_add, mul_assoc]

/-- The global bound in §3 at every fixed differentiation order. -/
theorem thetaKernel_iteratedDeriv_le_double_exp (j : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ t : ℝ, 0 ≤ t →
      |iteratedDeriv j thetaKernel t| ≤ C * Real.exp (-Real.exp (2*t)) := by
  let P := modePolynomials j
  let S : ℝ := ∑' n : ℕ, Real.exp (-(n:ℝ))
  refine ⟨polynomialDecayConstant P * S,
    mul_nonneg (polynomialDecayConstant_nonneg P) (tsum_nonneg fun _ => (Real.exp_pos _).le),
    fun t ht => ?_⟩
  rw [iteratedDeriv_thetaKernel]
  change |∑' n, modeCore P n t| ≤ _
  rw [← Real.norm_eq_abs]
  refine (norm_tsum_le_tsum_norm (summable_modeCore_norm P t)).trans ?_
  have hl := (summable_modeCore_norm P t).tsum_le_tsum
    (fun n => (Real.norm_eq_abs _).trans_le (abs_modeCore_le_double_exp P n ht))
    (Real.summable_exp_neg_nat.mul_left (polynomialDecayConstant P *
      Real.exp (-Real.exp (2*t))))
  rw [tsum_mul_left] at hl
  exact hl.trans_eq (by dsimp [S]; ring)

/-- Each differentiated tail after the first theta mode has a uniform
strictly smaller exponential scale than the first mode. -/
theorem thetaKernel_iteratedDeriv_first_mode_error (j : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ t : ℝ, 0 ≤ t →
      |iteratedDeriv j thetaKernel t - iteratedDeriv j (fun u => thetaTerm u 0) t| ≤
        C * Real.exp (t - 2 * (Real.pi * Real.exp (4*t))) := by
  let P := modePolynomials j
  let S : ℝ := ∑' n : ℕ, Real.exp (-(n:ℝ))
  refine ⟨polynomialDecayConstant P * S,
    mul_nonneg (polynomialDecayConstant_nonneg P) (tsum_nonneg fun _ => (Real.exp_pos _).le),
    fun t ht => ?_⟩
  rw [iteratedDeriv_thetaKernel, iteratedDeriv_thetaTerm]
  change |(∑' n, modeCore P n t) - modeCore P 0 t| ≤ _
  rw [(summable_modeCore_norm P t).of_norm.tsum_eq_zero_add, add_sub_cancel_left]
  have hs := (summable_nat_add_iff 1).mpr (summable_modeCore_norm P t)
  rw [← Real.norm_eq_abs]
  refine (norm_tsum_le_tsum_norm hs).trans ?_
  let y := Real.pi * Real.exp (4*t)
  have hy : 2 ≤ y := by
    dsimp [y]
    have hE : 1 ≤ Real.exp (4*t) := Real.one_le_exp (by positivity)
    have hπ := le_mul_of_one_le_right Real.pi_pos.le hE
    linarith [Real.pi_gt_three]
  have hmaj (n : ℕ) : ‖modeCore P (n+1) t‖ ≤
      (polynomialDecayConstant P * Real.exp (t-2*y)) * Real.exp (-(n:ℝ)) := by
    let k : ℝ := (n:ℝ)+2
    have hk : 4+(n:ℝ) ≤ k^2 := by dsimp [k]; nlinarith [Nat.cast_nonneg (α := ℝ) n]
    have hprod := mul_le_mul_of_nonneg_right hk (show 0 ≤ y/2 by linarith)
    have hn := mul_nonneg (Nat.cast_nonneg (α := ℝ) n) (show 0 ≤ y/2-1 by linarith)
    have hscale : 2*y+(n:ℝ) ≤ thetaModeScale (n+1) t/2 := by
      unfold thetaModeScale
      have hcast : ((↑(n+1) : ℝ)+1) = k := by push_cast; dsimp [k]; ring
      rw [hcast]
      have he : Real.pi * k^2 * Real.exp (4*t) / 2 = k^2*(y/2) := by
        dsimp [y]
        ring
      rw [he]
      nlinarith
    rw [Real.norm_eq_abs]
    calc
      _ ≤ polynomialDecayConstant P * Real.exp (t-thetaModeScale (n+1) t/2) :=
        abs_modeCore_le_exp P (n+1) t
      _ ≤ polynomialDecayConstant P * Real.exp ((t-2*y) + (-(n:ℝ))) :=
        mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr (by linarith))
          (polynomialDecayConstant_nonneg P)
      _ = _ := by rw [Real.exp_add, mul_assoc]
  have hb := hs.tsum_le_tsum hmaj
    (Real.summable_exp_neg_nat.mul_left (polynomialDecayConstant P * Real.exp (t-2*y)))
  rw [tsum_mul_left] at hb
  exact hb.trans_eq (by dsimp [S,y]; ring)

end NuttallCumulants
