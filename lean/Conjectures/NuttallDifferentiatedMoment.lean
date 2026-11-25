module

public import Conjectures.NuttallTailMoment
import all Conjectures.NuttallTailMoment
import all Conjectures.NuttallRepeatedTails
import all Conjectures.NuttallThetaTermDerivatives

public section
namespace NuttallCumulants

open MeasureTheory Filter
open scoped Topology

theorem hasDerivAt_iteratedDeriv_thetaKernel (j : ℕ) (x : ℝ) :
    HasDerivAt (iteratedDeriv j thetaKernel) (iteratedDeriv (j+1) thetaKernel x) x := by
  rw [iteratedDeriv_thetaKernel j, iteratedDeriv_thetaKernel (j+1)]
  exact hasDerivAt_tsum_modeCore (modePolynomials j) x

private theorem continuous_thetaDeriv (j : ℕ) : Continuous (iteratedDeriv j thetaKernel) :=
  continuous_iff_continuousAt.2 fun x => (hasDerivAt_iteratedDeriv_thetaKernel j x).continuousAt

noncomputable def differentiatedMoment (k j : ℕ) (u : ℝ) : ℝ :=
  ∫ v in Set.Ioi (0:ℝ), v^k * iteratedDeriv j thetaKernel (u+v)

private theorem weighted_derivative_bound (k j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    ∃ D : ℝ, 0 ≤ D ∧ ∀ v : ℝ, 0 ≤ v →
      |v^k * iteratedDeriv j thetaKernel (u+v)| ≤ D * (v^k * Real.exp (-v)) := by
  obtain ⟨C,hC,H⟩ := thetaKernel_iteratedDeriv_le_double_exp j
  refine ⟨C * Real.exp (-u), by positivity, fun v hv => ?_⟩
  have hz : 0 ≤ u+v := add_nonneg hu hv
  have hb : u+v ≤ Real.exp (2*(u+v)) := by
    linarith [Real.add_one_le_exp (2*(u+v))]
  rw [abs_mul, abs_of_nonneg (pow_nonneg hv _)]
  calc
    _ ≤ v^k * (C * Real.exp (-Real.exp (2*(u+v)))) :=
      mul_le_mul_of_nonneg_left (H (u+v) hz) (pow_nonneg hv _)
    _ ≤ v^k * (C * Real.exp (-(u+v))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left
        (Real.exp_le_exp.mpr (by linarith)) hC) (pow_nonneg hv _)
    _ = _ := by rw [neg_add_rev, Real.exp_add]; ring

theorem differentiatedMoment_integrable (k j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    IntegrableOn (fun v : ℝ => v^k * iteratedDeriv j thetaKernel (u+v)) (Set.Ioi 0) := by
  obtain ⟨D,hD,H⟩ := weighted_derivative_bound k j hu
  have hΓ : IntegrableOn (fun v : ℝ => v^k * Real.exp (-v)) (Set.Ioi 0) := by
    simpa only [Real.rpow_one, Real.rpow_natCast] using
      (integrableOn_rpow_mul_exp_neg_rpow (s := (k:ℝ)) (p := 1)
        (by linarith [Nat.cast_nonneg (α := ℝ) k]) one_pos)
  have hf := (continuous_id.pow k).mul ((continuous_thetaDeriv j).comp
    (continuous_const.add continuous_id : Continuous (fun v : ℝ => u+v)))
  refine (hΓ.const_mul D).mono' hf.stronglyMeasurable.aestronglyMeasurable ?_
  filter_upwards [ae_restrict_mem (μ := volume) (measurableSet_Ioi : MeasurableSet (Set.Ioi (0:ℝ)))]
    with v hv
  rw [Real.norm_eq_abs]
  exact H v (le_of_lt hv)

private theorem differentiatedMoment_boundary (k j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    Tendsto (fun v : ℝ => v^k * iteratedDeriv j thetaKernel (u+v)) atTop (𝓝 0) := by
  obtain ⟨D,hD,H⟩ := weighted_derivative_bound k j hu
  have hlim : Tendsto (fun v : ℝ => D * (v^k * Real.exp (-v))) atTop (𝓝 0) := by
    simpa only [mul_zero] using (Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero k).const_mul D
  apply squeeze_zero_norm' _ hlim
  filter_upwards [eventually_ge_atTop (0:ℝ)] with v hv
  rw [Real.norm_eq_abs]
  exact H v hv

private theorem hasDerivAt_shifted_theta (j : ℕ) (u v : ℝ) :
    HasDerivAt (fun x => iteratedDeriv j thetaKernel (u+x))
      (iteratedDeriv (j+1) thetaKernel (u+v)) v := by
  change HasDerivAt (iteratedDeriv j thetaKernel ∘ (fun x : ℝ => u+x)) _ v
  simpa only [id_eq, mul_one] using
    (hasDerivAt_iteratedDeriv_thetaKernel j (u+v)).comp v ((hasDerivAt_id v).const_add u)

theorem differentiatedMoment_zero_succ (j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    differentiatedMoment 0 (j+1) u = -iteratedDeriv j thetaKernel u := by
  have hlim : Tendsto (fun v => iteratedDeriv j thetaKernel (u+v)) atTop (𝓝 0) := by
    simpa only [pow_zero, one_mul] using differentiatedMoment_boundary 0 j hu
  have hint : IntegrableOn (fun v => iteratedDeriv (j+1) thetaKernel (u+v)) (Set.Ioi 0) := by
    simpa only [pow_zero, one_mul] using differentiatedMoment_integrable 0 (j+1) hu
  have h := integral_Ioi_of_hasDerivAt_of_tendsto'
    (fun v _ => hasDerivAt_shifted_theta j u v) hint hlim
  simpa only [differentiatedMoment, pow_zero, one_mul, add_zero, zero_sub] using h

theorem differentiatedMoment_succ_succ (k j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    differentiatedMoment (k+1) (j+1) u = -((k+1 : ℕ):ℝ) * differentiatedMoment k j u := by
  let f (v : ℝ) := v^(k+1)
  let f' (v : ℝ) := ((k+1 : ℕ):ℝ) * v^k
  let g (v : ℝ) := iteratedDeriv j thetaKernel (u+v)
  let g' (v : ℝ) := iteratedDeriv (j+1) thetaKernel (u+v)
  have hf (v : ℝ) (_ : v ∈ Set.Ioi 0) : HasDerivAt f (f' v) v := by
    simpa only [f, f', Nat.succ_sub_one] using (hasDerivAt_pow (k+1) v)
  have hg (v : ℝ) (_ : v ∈ Set.Ioi 0) : HasDerivAt g (g' v) v :=
    hasDerivAt_shifted_theta j u v
  have hi1 : IntegrableOn (f*g') (Set.Ioi 0) := differentiatedMoment_integrable (k+1) (j+1) hu
  have hi2 : IntegrableOn (f'*g) (Set.Ioi 0) := by
    simp only [f', g, Pi.mul_def, mul_assoc]
    exact (differentiatedMoment_integrable k j hu).const_mul (((k+1 : ℕ):ℝ))
  have hcont : Continuous (f*g) :=
    (continuous_id.pow (k+1)).mul
      ((continuous_thetaDeriv j).comp (continuous_const.add continuous_id))
  have hzero : Tendsto (f*g) (𝓝[>] (0:ℝ)) (𝓝 (0:ℝ)) := by
    have hlim : ContinuousWithinAt (f*g) (Set.Ioi 0) 0 := hcont.continuousAt.continuousWithinAt
    change Tendsto (f*g) (𝓝[>] (0:ℝ)) (𝓝 ((f*g) 0)) at hlim
    simpa only [f,g,Pi.mul_apply,zero_pow (Nat.succ_ne_zero _), zero_mul] using hlim
  have h := integral_Ioi_mul_deriv_eq_deriv_mul hf hg hi1 hi2 hzero
    (differentiatedMoment_boundary (k+1) j hu)
  simp only [f, f', g, g', sub_self, zero_sub, mul_assoc, integral_const_mul] at h
  unfold differentiatedMoment
  rw [h, neg_mul]

private theorem iteratedDeriv_repeatedTail_succ_step (j m : ℕ) (u : ℝ) :
    iteratedDeriv (j+1) (repeatedTail (m+1)) u = -iteratedDeriv j (repeatedTail m) u := by
  rw [iteratedDeriv_succ']
  have h : deriv (repeatedTail (m+1)) = -repeatedTail m := by
    funext x
    exact (hasDerivAt_repeatedTail_succ m x).deriv
  rw [h, iteratedDeriv_neg]

/-- The polynomial-weighted integral of any theta derivative is the
factorial multiple of the corresponding cumulant derivative. -/
theorem differentiatedMoment_eq (k j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    differentiatedMoment k j u =
      (k.factorial : ℝ) * iteratedDeriv j (repeatedTail (k+1)) u := by
  induction k generalizing j with
  | zero =>
    cases j with
    | zero =>
      simpa only [differentiatedMoment, iteratedDeriv_zero, Nat.factorial_zero, Nat.cast_one,
        one_mul, tailMoment, show repeatedTail 0 = thetaKernel from rfl] using tailMoment_zero 0 u
    | succ j =>
      rw [differentiatedMoment_zero_succ j hu, iteratedDeriv_repeatedTail_succ_step,
        Nat.factorial_zero, Nat.cast_one, one_mul, show repeatedTail 0 = thetaKernel from rfl]
  | succ k ih =>
    cases j with
    | zero =>
      simpa only [differentiatedMoment, iteratedDeriv_zero, tailMoment, Nat.zero_add,
        show repeatedTail 0 = thetaKernel from rfl] using tailMoment_eq_factorial_mul (k+1) 0 hu
    | succ j =>
      rw [differentiatedMoment_succ_succ k j hu, ih j, iteratedDeriv_repeatedTail_succ_step,
        Nat.factorial_succ, Nat.cast_mul]
      ring

private theorem iterate_after_local (j i : ℕ) (f : ℝ → ℝ) :
    iteratedDeriv j (iteratedDeriv i f) = iteratedDeriv (i+j) f := by
  induction j with
  | zero => rw [iteratedDeriv_zero, Nat.add_zero]
  | succ j ih =>
    rw [iteratedDeriv_succ, ih, show i+(j+1)=i+j+1 by omega, iteratedDeriv_succ]

/-- The entrywise integral identity used for the cumulant Wronskian in §4.
Here the cumulant order is k+1+i and the moment power is k. -/
theorem repeatedTail_hankel_entry_integral (k i j : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    iteratedDeriv (i+j) (repeatedTail (k+1+i)) u =
      ((-1:ℝ)^i / (k.factorial : ℝ)) * differentiatedMoment k j u := by
  have he : iteratedDeriv i (repeatedTail (k+1+i)) =
      ((-1:ℝ)^i * repeatedTail (k+1) ·) :=
    funext (iteratedDeriv_repeatedTail_add i (k+1))
  rw [← iterate_after_local, he, iteratedDeriv_const_mul_field, differentiatedMoment_eq k j hu]
  field_simp

end NuttallCumulants
