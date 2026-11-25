module

public import Conjectures.NuttallTailCalculus
import all Conjectures.NuttallRepeatedTails
import all Conjectures.NuttallThetaKernel
public import Mathlib.MeasureTheory.Integral.IntegralEqImproper
public import Mathlib.Analysis.SpecialFunctions.Exp

public section
namespace NuttallCumulants

open MeasureTheory Filter
open scoped Topology

noncomputable def tailMoment (k m : ℕ) (u : ℝ) : ℝ :=
  ∫ v in Set.Ioi (0:ℝ), v^k * repeatedTail m (u+v)

theorem tailMoment_integrable (k m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    IntegrableOn (fun v : ℝ => v^k * repeatedTail m (u+v)) (Set.Ioi 0) := by
  have hΓ : IntegrableOn (fun v : ℝ => v^k * Real.exp (-v)) (Set.Ioi 0) := by
    simpa only [Real.rpow_one, Real.rpow_natCast] using
      (integrableOn_rpow_mul_exp_neg_rpow (s := (k : ℝ)) (p := 1)
        (by linarith [Nat.cast_nonneg (α := ℝ) k]) one_pos)
  have hf : Continuous (fun v : ℝ => v^k * repeatedTail m (u+v)) :=
    (continuous_id.pow k).mul ((repeatedTail_continuous m).comp (continuous_const.add continuous_id))
  let C := decayConstant * Real.exp (-u)
  refine (hΓ.const_mul C).mono' hf.stronglyMeasurable.aestronglyMeasurable ?_
  filter_upwards [ae_restrict_mem (μ := volume) (measurableSet_Ioi : MeasurableSet (Set.Ioi (0:ℝ)))]
    with v hv
  have hV : 0 < v := hv
  have hUV : 0 ≤ u+v := add_nonneg hu hV.le
  obtain ⟨hp,hb⟩ := (repeatedTail_invariant m).2 (u+v) hUV
  rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg (pow_nonneg hV.le _) hp.le)]
  calc
    _ ≤ v^k * (decayConstant * Real.exp (-(u+v))) :=
      mul_le_mul_of_nonneg_left hb (pow_nonneg hV.le _)
    _ = C * (v^k * Real.exp (-v)) := by
      rw [neg_add_rev, Real.exp_add]
      dsimp [C]
      ring

private theorem tailMoment_boundary_atTop (k m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    Tendsto (fun v : ℝ => v^k * repeatedTail m (u+v)) atTop (𝓝 0) := by
  let C := decayConstant * Real.exp (-u)
  have hE : Tendsto (fun v : ℝ => C * (v^k * Real.exp (-v))) atTop (𝓝 0) := by
    simpa only [mul_zero] using (Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero k).const_mul C
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hE
  · filter_upwards [eventually_ge_atTop (0:ℝ)] with v hv
    exact mul_nonneg (pow_nonneg hv _) ((repeatedTail_invariant m).2 (u+v) (add_nonneg hu hv)).1.le
  · filter_upwards [eventually_ge_atTop (0:ℝ)] with v hv
    have hb := ((repeatedTail_invariant m).2 (u+v) (add_nonneg hu hv)).2
    calc
      _ ≤ v^k * (decayConstant * Real.exp (-(u+v))) :=
        mul_le_mul_of_nonneg_left hb (pow_nonneg hv _)
      _ = C * (v^k * Real.exp (-v)) := by rw [neg_add_rev, Real.exp_add]; dsimp [C]; ring

theorem tailMoment_succ (k m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    tailMoment (k+1) m u = (k+1 : ℕ) * tailMoment k (m+1) u := by
  let f (v : ℝ) := v^(k+1)
  let f' (v : ℝ) := ((k+1 : ℕ):ℝ) * v^k
  let g (v : ℝ) := repeatedTail (m+1) (u+v)
  let g' (v : ℝ) := -repeatedTail m (u+v)
  have hf (v : ℝ) (_ : v ∈ Set.Ioi 0) : HasDerivAt f (f' v) v := by
    simpa only [f, f', Nat.succ_sub_one] using (hasDerivAt_pow (k+1) v)
  have hg (v : ℝ) (_ : v ∈ Set.Ioi 0) : HasDerivAt g (g' v) v := by
    have h := (hasDerivAt_id v).const_add u
    change HasDerivAt ((repeatedTail (m+1)) ∘ (fun x : ℝ => u+x)) (g' v) v
    simpa only [g', id_eq, mul_one] using
      (hasDerivAt_repeatedTail_succ m (u+v)).comp v h
  have hi1 : IntegrableOn (f*g') (Set.Ioi 0) := by
    simp only [f, g', Pi.mul_def, mul_neg]
    exact (tailMoment_integrable (k+1) m hu).neg
  have hi2 : IntegrableOn (f'*g) (Set.Ioi 0) := by
    simp only [f', g, Pi.mul_def, mul_assoc]
    exact (tailMoment_integrable k (m+1) hu).const_mul (((k+1 : ℕ):ℝ))
  have hcont : Continuous (f*g) :=
    (continuous_id.pow (k+1)).mul
      ((repeatedTail_continuous (m+1)).comp (continuous_const.add continuous_id))
  have hzero : Tendsto (f*g) (𝓝[>] (0:ℝ)) (𝓝 (0:ℝ)) := by
    have hlim : ContinuousWithinAt (f*g) (Set.Ioi 0) 0 := hcont.continuousAt.continuousWithinAt
    change Tendsto (f*g) (𝓝[>] (0:ℝ)) (𝓝 ((f*g) 0)) at hlim
    simpa only [f,g,Pi.mul_apply,zero_pow (Nat.succ_ne_zero _), zero_mul] using hlim
  have h := integral_Ioi_mul_deriv_eq_deriv_mul hf hg hi1 hi2 hzero
    (tailMoment_boundary_atTop (k+1) (m+1) hu)
  simp only [f, f', g, g', mul_neg, integral_neg, sub_self, zero_sub,
    mul_assoc, integral_const_mul] at h
  unfold tailMoment
  exact neg_injective h

theorem tailMoment_zero (m : ℕ) (u : ℝ) :
    tailMoment 0 m u = repeatedTail (m+1) u := by
  let e : ℝ ≃ᵐ ℝ := MeasurableEquiv.addLeft u
  have hpres : MeasurePreserving e volume volume := measurePreserving_add_left volume u
  have hp : e ⁻¹' Set.Ioi u = Set.Ioi (0:ℝ) := by
    ext v
    change u < u+v ↔ 0 < v
    constructor <;> intro h <;> linarith
  have h := hpres.setIntegral_preimage_emb e.measurableEmbedding (repeatedTail m) (Set.Ioi u)
  rw [hp] at h
  change (∫ v in Set.Ioi (0:ℝ), repeatedTail m (u+v)) =
    (∫ t in Set.Ioi u, repeatedTail m t) at h
  change (∫ v in Set.Ioi (0:ℝ), v^0 * repeatedTail m (u+v)) =
    (∫ t in Set.Ioi u, repeatedTail m t)
  simpa only [pow_zero, one_mul] using h

/-- All moments of the repeated tails are exact factorial multiples of further
iterates. The right boundary is controlled by decay, not a formal asymptotic. -/
theorem tailMoment_eq_factorial_mul (k m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    tailMoment k m u = (k.factorial : ℝ) * repeatedTail (m+k+1) u := by
  induction k generalizing m with
  | zero => simpa only [Nat.factorial_zero, Nat.cast_one, one_mul, Nat.add_zero] using
      tailMoment_zero m u
  | succ k ih =>
    rw [tailMoment_succ k m hu, ih (m+1), Nat.factorial_succ, Nat.cast_mul]
    rw [show m+1+k+1=m+(k+1)+1 by omega]
    ring

/-- The literal repeated-tail definition equals the weighted integral in §1
for all orders at every nonnegative real argument. -/
theorem repeatedTail_eq_thetaCumulant (m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    repeatedTail m u = thetaCumulant m u := by
  cases m with
  | zero => rfl
  | succ k =>
    change repeatedTail (k+1) u = tailMoment k 0 u / (k.factorial : ℝ)
    rw [tailMoment_eq_factorial_mul k 0 hu, Nat.zero_add]
    field_simp

end NuttallCumulants
