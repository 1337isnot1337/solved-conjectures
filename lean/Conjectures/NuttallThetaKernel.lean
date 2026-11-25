module

public import Mathlib.Analysis.Real.Pi.Bounds
public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.Analysis.Normed.Group.FunctionSeries
public import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
public import Mathlib.Tactic

public section
namespace NuttallCumulants

/-- The n+1st summand of Nuttall's equation (1.3). -/
noncomputable def thetaTerm (t : ℝ) (n : ℕ) : ℝ :=
  let k : ℝ := n + 1
  (2 * Real.pi ^ 2 * k ^ 4 * Real.exp (9 * t) -
    3 * Real.pi * k ^ 2 * Real.exp (5 * t)) *
    Real.exp (-Real.pi * k ^ 2 * Real.exp (4 * t))

/-- Nuttall's theta kernel with the series indexed by natural numbers. -/
noncomputable def thetaKernel (t : ℝ) : ℝ := ∑' n : ℕ, thetaTerm t n

theorem thetaTerm_pos {t : ℝ} (ht : 0 ≤ t) (n : ℕ) : 0 < thetaTerm t n := by
  let k : ℝ := n + 1
  have hk : 1 ≤ k := by dsimp [k]; linarith [Nat.cast_nonneg (α := ℝ) n]
  have hk2 : 1 ≤ k ^ 2 := by nlinarith
  have he : 1 ≤ Real.exp (4 * t) := Real.one_le_exp (by positivity)
  have hp : 3 < Real.pi := Real.pi_gt_three
  have hkE : 1 ≤ k ^ 2 * Real.exp (4 * t) :=
    one_le_mul_of_one_le_of_one_le hk2 he
  have hπkE : Real.pi ≤ Real.pi * (k ^ 2 * Real.exp (4 * t)) := by
    simpa using mul_le_mul_of_nonneg_left hkE Real.pi_pos.le
  have hdiff : 0 < 2 * Real.pi * k ^ 2 * Real.exp (4 * t) - 3 := by nlinarith
  have hexp : Real.exp (9 * t) = Real.exp (5 * t) * Real.exp (4 * t) := by
    rw [← Real.exp_add]
    congr 1
    ring
  unfold thetaTerm
  change 0 < (2 * Real.pi ^ 2 * k ^ 4 * Real.exp (9 * t) -
    3 * Real.pi * k ^ 2 * Real.exp (5 * t)) *
    Real.exp (-Real.pi * k ^ 2 * Real.exp (4 * t))
  rw [hexp]
  have hfactor :
      2 * Real.pi ^ 2 * k ^ 4 * (Real.exp (5 * t) * Real.exp (4 * t)) -
          3 * Real.pi * k ^ 2 * Real.exp (5 * t) =
        (Real.pi * k ^ 2 * Real.exp (5 * t)) *
         (2 * Real.pi * k ^ 2 * Real.exp (4 * t) - 3) := by ring
  rw [hfactor]
  have hkpos : 0 < k := by linarith
  exact mul_pos (mul_pos (by positivity) hdiff) (Real.exp_pos _)

/-- A directly summable geometric majorant at every nonnegative real argument. -/
theorem thetaTerm_le_majorant {t : ℝ} (ht : 0 ≤ t) (n : ℕ) :
    thetaTerm t n ≤
      (2 * Real.pi ^ 2 * Real.exp (-t)) *
        (((n : ℝ) + 1) ^ 4 * Real.exp (-1) ^ (n + 1)) := by
  let k : ℝ := n + 1
  have hk : 1 ≤ k := by dsimp [k]; linarith [Nat.cast_nonneg (α := ℝ) n]
  have hkpos : 0 ≤ k := by linarith
  have hkk : k ≤ k ^ 2 := by nlinarith
  have he : 1 ≤ Real.exp (4 * t) := Real.one_le_exp (by positivity)
  have hπ : 1 ≤ Real.pi := by linarith [Real.pi_gt_three]
  have hπk : 3 ≤ Real.pi * k ^ 2 := calc
    3 ≤ Real.pi := Real.pi_gt_three.le
    _ ≤ Real.pi * k ^ 2 := le_mul_of_one_le_right Real.pi_pos.le (by nlinarith)
  have hkπ : k ≤ Real.pi * k ^ 2 := hkk.trans (le_mul_of_one_le_left (sq_nonneg _) hπ)
  have hlin := Real.add_one_le_exp (4*t)
  have hmul := mul_le_mul_of_nonneg_left hlin
    (show 0 ≤ Real.pi * k ^ 2 by positivity)
  have htprod : 0 ≤ (Real.pi * k ^ 2 - 3) * t :=
    mul_nonneg (sub_nonneg.mpr hπk) ht
  have hh : 10*t + k ≤ Real.pi * k ^ 2 * Real.exp (4*t) := by nlinarith
  have hexp : Real.exp (-Real.pi * k ^ 2 * Real.exp (4 * t)) ≤
      Real.exp (-10*t - k) := by
    apply Real.exp_le_exp.mpr
    linarith
  have hExpPow : Real.exp (-k) = Real.exp (-1) ^ (n + 1) := by
    rw [← Real.exp_nat_mul]
    congr 1
    dsimp [k]
    push_cast
    ring
  change (2 * Real.pi ^ 2 * k ^ 4 * Real.exp (9 * t) -
    3 * Real.pi * k ^ 2 * Real.exp (5 * t)) *
    Real.exp (-Real.pi * k ^ 2 * Real.exp (4 * t)) ≤
    (2 * Real.pi ^ 2 * Real.exp (-t)) * (k ^ 4 * Real.exp (-1) ^ (n + 1))
  calc
    _ ≤ (2 * Real.pi ^ 2 * k ^ 4 * Real.exp (9 * t)) *
        Real.exp (-Real.pi * k ^ 2 * Real.exp (4 * t)) := by
      apply mul_le_mul_of_nonneg_right
      · exact sub_le_self _ (by positivity)
      · positivity
    _ ≤ (2 * Real.pi ^ 2 * k ^ 4 * Real.exp (9 * t)) * Real.exp (-10*t - k) :=
      mul_le_mul_of_nonneg_left hexp (by positivity)
    _ = _ := by
      rw [show -10*t-k = (-10*t)+(-k) by ring, Real.exp_add, hExpPow]
      have htime : Real.exp (9*t) * Real.exp (-10*t) = Real.exp (-t) := by
        rw [← Real.exp_add, show 9*t + -10*t = -t by ring]
      calc
        _ = (2 * Real.pi ^ 2 * (Real.exp (9*t) * Real.exp (-10*t))) *
            (k ^ 4 * Real.exp (-1) ^ (n + 1)) := by ring
        _ = _ := by rw [htime]

private theorem geometricMajorant_summable :
    Summable (fun n : ℕ => ((n : ℝ) + 1)^4 * Real.exp (-1) ^ (n+1)) := by
  have hr : ‖Real.exp (-1)‖ < 1 := by
    rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    exact Real.exp_lt_one_iff.mpr (by norm_num)
  have h := summable_pow_mul_geometric_of_norm_lt_one 4 hr
  simpa only [Nat.cast_add, Nat.cast_one] using (summable_nat_add_iff 1).mpr h

/-- The literal series for the theta kernel is absolutely summable. -/
theorem thetaTerm_summable {t : ℝ} (ht : 0 ≤ t) : Summable (thetaTerm t) :=
  (geometricMajorant_summable.mul_left (2 * Real.pi^2 * Real.exp (-t))).of_nonneg_of_le
    (fun n => (thetaTerm_pos ht n).le) (thetaTerm_le_majorant ht)

theorem thetaTerm_norm_summable {t : ℝ} (ht : 0 ≤ t) :
    Summable (fun n => ‖thetaTerm t n‖) := by
  simpa only [Real.norm_eq_abs, abs_of_pos (thetaTerm_pos ht _)] using thetaTerm_summable ht

noncomputable def decayConstant : ℝ :=
  2 * Real.pi^2 * (∑' n : ℕ, ((n : ℝ)+1)^4 * Real.exp (-1)^(n+1))

theorem decayConstant_nonneg : 0 ≤ decayConstant := by
  unfold decayConstant
  exact mul_nonneg (by positivity) (tsum_nonneg fun _ => by positivity)

/-- Bound for the theta kernel itself; derivative bounds are separate. -/
theorem thetaKernel_le_decay {t : ℝ} (ht : 0 ≤ t) :
    thetaKernel t ≤ decayConstant * Real.exp (-t) := by
  unfold thetaKernel
  calc
    _ ≤ ∑' n : ℕ, (2 * Real.pi^2 * Real.exp (-t)) *
        (((n : ℝ)+1)^4 * Real.exp (-1)^(n+1)) :=
      (thetaTerm_summable ht).tsum_le_tsum (thetaTerm_le_majorant ht)
        (geometricMajorant_summable.mul_left _)
    _ = _ := by rw [tsum_mul_left, decayConstant]; ring

theorem thetaKernel_continuousOn : ContinuousOn thetaKernel (Set.Ici 0) := by
  unfold thetaKernel
  refine continuousOn_tsum (fun n => ?_) (geometricMajorant_summable.mul_left (2*Real.pi^2)) ?_
  · unfold thetaTerm
    fun_prop
  · intro n t ht
    have h : 0 ≤ t := ht
    rw [Real.norm_eq_abs, abs_of_pos (thetaTerm_pos h n)]
    refine (thetaTerm_le_majorant h n).trans ?_
    have hE : Real.exp (-t) ≤ 1 := Real.exp_le_one_iff.mpr (by linarith)
    exact mul_le_mul_of_nonneg_right (mul_le_of_le_one_right (by positivity) hE)
      (by positivity)

theorem thetaKernel_pos {t : ℝ} (ht : 0 ≤ t) : 0 < thetaKernel t :=
  (thetaTerm_summable ht).tsum_pos
    (fun n => (thetaTerm_pos ht n).le) 0 (thetaTerm_pos ht 0)

open MeasureTheory

/-- The exact integrand for the cumulant of order n+1. -/
noncomputable def cumulantIntegrand (n : ℕ) (u v : ℝ) : ℝ :=
  v^n * thetaKernel (u+v)

theorem cumulantIntegrand_continuousOn {u : ℝ} (hu : 0 ≤ u) (n : ℕ) :
    ContinuousOn (cumulantIntegrand n u) (Set.Ioi 0) := by
  unfold cumulantIntegrand
  apply ContinuousOn.mul ((continuous_id.pow n).continuousOn)
  apply thetaKernel_continuousOn.comp (continuous_const.add continuous_id).continuousOn
  intro v hv
  exact add_nonneg hu (le_of_lt hv)

theorem cumulantIntegrand_pos {u v : ℝ} (hu : 0 ≤ u) (hv : 0 < v) (n : ℕ) :
    0 < cumulantIntegrand n u v :=
  mul_pos (pow_pos hv _) (thetaKernel_pos (add_nonneg hu hv.le))

theorem cumulantIntegrand_integrable {u : ℝ} (hu : 0 ≤ u) (n : ℕ) :
    IntegrableOn (cumulantIntegrand n u) (Set.Ioi 0) := by
  have hΓ : IntegrableOn (fun v : ℝ => v^n * Real.exp (-v)) (Set.Ioi 0) := by
    simpa only [Real.rpow_one, Real.rpow_natCast] using
      (integrableOn_rpow_mul_exp_neg_rpow (s := (n : ℝ)) (p := 1) (by linarith [Nat.cast_nonneg (α := ℝ) n]) one_pos)
  let C := decayConstant * Real.exp (-u)
  refine (hΓ.const_mul C).mono' ((cumulantIntegrand_continuousOn hu n).aestronglyMeasurable
    measurableSet_Ioi) ?_
  filter_upwards [ae_restrict_mem (μ := volume) (measurableSet_Ioi : MeasurableSet (Set.Ioi (0:ℝ)))]
    with v hv
  have hv' : 0 < v := hv
  rw [Real.norm_eq_abs, abs_of_pos (cumulantIntegrand_pos hu hv' n)]
  calc
    cumulantIntegrand n u v ≤ v^n * (decayConstant * Real.exp (-(u+v))) :=
      mul_le_mul_of_nonneg_left (thetaKernel_le_decay (add_nonneg hu hv'.le)) (by positivity)
    _ = C * (v^n * Real.exp (-v)) := by
      rw [neg_add_rev, Real.exp_add]
      dsimp [C]
      ring

/-- The source's single-integral formula at positive order. The endpoint v=0
does not affect this Lebesgue integral. -/
noncomputable def thetaCumulant (m : ℕ) (u : ℝ) : ℝ :=
  match m with
  | 0 => thetaKernel u
  | n+1 => (∫ v in Set.Ioi (0:ℝ), cumulantIntegrand n u v) / (n.factorial : ℝ)

/-- The order-one minor of every cumulant kernel has the required strict sign. -/
theorem thetaCumulant_pos (m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    0 < thetaCumulant m u := by
  cases m with
  | zero => exact thetaKernel_pos hu
  | succ n =>
    change 0 < (∫ v in Set.Ioi (0:ℝ), cumulantIntegrand n u v) / (n.factorial : ℝ)
    apply div_pos _ (by positivity)
    have hnonneg : 0 ≤ᵐ[volume.restrict (Set.Ioi (0:ℝ))] cumulantIntegrand n u := by
      filter_upwards [ae_restrict_mem (μ := volume) (measurableSet_Ioi : MeasurableSet (Set.Ioi (0:ℝ)))]
        with v hv
      exact (cumulantIntegrand_pos hu hv n).le
    apply (setIntegral_pos_iff_support_of_nonneg_ae hnonneg (cumulantIntegrand_integrable hu n)).2
    have hsub : Set.Ioo (0:ℝ) 1 ⊆ Function.support (cumulantIntegrand n u) ∩ Set.Ioi 0 := by
      intro v hv
      exact ⟨(cumulantIntegrand_pos hu hv.1 n).ne', hv.1⟩
    refine lt_of_lt_of_le ?_ (measure_mono hsub)
    rw [Real.volume_Ioo]
    simp

theorem thetaCumulant_kernel_order_one (m : ℕ) {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) :
    0 < thetaCumulant m (x+y) :=
  thetaCumulant_pos m (add_nonneg hx hy)

end NuttallCumulants
