module

public import Mathlib.Algebra.CubicDiscriminant
public import Mathlib.Analysis.Calculus.Deriv.MeanValue
public import Mathlib.Analysis.Calculus.DSlope
public import Mathlib.Analysis.SpecialFunctions.Pow.Deriv
public import Mathlib.Tactic

/-!
# A negative cubic discriminant for small positive damping

This is the analytic part of the disproof of Cardon–Forgács–Piotrowski–
Sorensen–White, arXiv:1802.02641v1, Question 6.1.
-/

@[expose] public section

namespace CardonZeroSector

open Filter Set
open scoped Topology

noncomputable def powerGap (p : ℝ) : ℝ :=
  (3 : ℝ) ^ p - 3 * (2 : ℝ) ^ p + 3

private theorem powerGap_pos (p : ℝ) (hp : 2 < p) : 0 < powerGap p := by
  let f := fun x : ℝ => (x + 1) ^ p - x ^ p
  let g := fun x : ℝ => p * ((x + 1) ^ (p - 1) - x ^ (p - 1))
  have hf (x : ℝ) : HasDerivAt f (g x) x := by
    have h₁ := ((hasDerivAt_id x).add_const 1).rpow_const (p := p) (Or.inr (by linarith))
    have h₂ := Real.hasDerivAt_rpow_const (x := x) (p := p) (Or.inr (by linarith))
    convert h₁.sub h₂ using 1
    · rfl
    · dsimp [g]
      ring
  have hg (x : ℝ) :
      HasDerivAt g (p * (p - 1) * ((x + 1) ^ (p - 2) - x ^ (p - 2))) x := by
    have h₁ := ((hasDerivAt_id x).add_const 1).rpow_const (p := p - 1) (Or.inr (by linarith))
    have h₂ := Real.hasDerivAt_rpow_const (x := x) (p := p - 1) (Or.inr (by linarith))
    have hpred : p - 1 - 1 = p - 2 := by ring
    convert (h₁.sub h₂).const_mul p using 1
    · rfl
    · dsimp
      rw [hpred]
      ring
  have hmono : StrictMonoOn g (Ici 0) := by
    refine strictMonoOn_of_deriv_pos (convex_Ici 0) (fun x _ => (hg x).continuousAt.continuousWithinAt) ?_
    intro x hx
    rw [interior_Ici, mem_Ioi] at hx
    rw [(hg x).deriv]
    exact mul_pos (mul_pos (by linarith) (by linarith))
      (sub_pos.mpr (Real.rpow_lt_rpow hx.le (by linarith) (by linarith)))
  have hmono' : StrictMonoOn (fun x : ℝ => f (x + 1) - f x) (Ici 0) := by
    have hderiv (x : ℝ) : HasDerivAt (fun y : ℝ => f (y + 1) - f y) (g (x + 1) - g x) x := by
      have hh := ((hf (x + 1)).comp x ((hasDerivAt_id x).add_const 1)).sub (hf x)
      convert hh using 1
      · rfl
      · ring
    refine strictMonoOn_of_deriv_pos (convex_Ici 0)
      (fun x _ => (hderiv x).continuousAt.continuousWithinAt) ?_
    intro x hx
    rw [interior_Ici, mem_Ioi] at hx
    rw [(hderiv x).deriv]
    exact sub_pos.mpr (hmono hx.le (by show 0 ≤ x + 1; linarith) (by linarith))
  have h := hmono' (show (0 : ℝ) ∈ Ici 0 from le_rfl) (show (1 : ℝ) ∈ Ici 0 from zero_le_one)
    (show (0 : ℝ) < 1 from zero_lt_one)
  have hzero : (0 : ℝ) ^ p = 0 := Real.zero_rpow (by linarith)
  norm_num [f, hzero] at h
  unfold powerGap
  linarith

/-- The coefficients of the transformed cubic after translation by one. -/
noncomputable def ca (p α : ℝ) : ℝ := Real.exp (-α * (3 : ℝ) ^ p)
noncomputable def cb (p α : ℝ) : ℝ := 3 * (ca p α - Real.exp (-α * (2 : ℝ) ^ p))
noncomputable def cc (p α : ℝ) : ℝ :=
  3 * (ca p α - 2 * Real.exp (-α * (2 : ℝ) ^ p) + Real.exp (-α))
noncomputable def cd (p α : ℝ) : ℝ :=
  ca p α - 3 * Real.exp (-α * (2 : ℝ) ^ p) + 3 * Real.exp (-α) - 1

private theorem exp_scaled_deriv (t : ℝ) :
    HasDerivAt (fun α : ℝ => Real.exp (-α * t)) (-t) 0 := by
  simpa using ((hasDerivAt_id (0 : ℝ)).neg.mul_const t).exp

private theorem cb_deriv (p : ℝ) :
    HasDerivAt (cb p) (3 * (-(3 : ℝ) ^ p + (2 : ℝ) ^ p)) 0 := by
  convert ((exp_scaled_deriv ((3 : ℝ) ^ p)).sub (exp_scaled_deriv ((2 : ℝ) ^ p))).const_mul 3 using 1
  · rfl
  · ring

private theorem cc_deriv (p : ℝ) :
    HasDerivAt (cc p) (3 * (-(3 : ℝ) ^ p + 2 * (2 : ℝ) ^ p - 1)) 0 := by
  have he : HasDerivAt (fun α : ℝ => Real.exp (-α)) (-1) 0 := by
    simpa using exp_scaled_deriv 1
  convert (((exp_scaled_deriv ((3 : ℝ) ^ p)).sub
    ((exp_scaled_deriv ((2 : ℝ) ^ p)).const_mul 2)).add he).const_mul 3 using 1
  · rfl
  · ring

private theorem cd_deriv (p : ℝ) : HasDerivAt (cd p) (-powerGap p) 0 := by
  have he : HasDerivAt (fun α : ℝ => Real.exp (-α)) (-1) 0 := by
    simpa using exp_scaled_deriv 1
  convert (((exp_scaled_deriv ((3 : ℝ) ^ p)).sub
    ((exp_scaled_deriv ((2 : ℝ) ^ p)).const_mul 3)).add (he.const_mul 3)).sub_const 1 using 1
  · rfl
  · unfold powerGap
    ring

private theorem tendsto_ratio {f : ℝ → ℝ} {d : ℝ} (hd : HasDerivAt f d 0) (h0 : f 0 = 0) :
    Tendsto (fun α => f α / α) (𝓝[≠] (0 : ℝ)) (𝓝 d) := by
  simpa only [slope_fun_def_field, h0, sub_zero] using hd.tendsto_slope

/-- The leading term of the discriminant divided by the square of damping. -/
theorem discriminant_limit (p : ℝ) :
    Tendsto (fun α => (⟨ca p α, cb p α, cc p α, cd p α⟩ : Cubic ℝ).discr / α ^ 2)
      (𝓝[≠] (0 : ℝ)) (𝓝 (-27 * powerGap p ^ 2)) := by
  have ha : Tendsto (ca p) (𝓝[≠] 0) (𝓝 1) := by
    have h : Tendsto (ca p) (𝓝[≠] 0) (𝓝 (ca p 0)) :=
      (exp_scaled_deriv ((3 : ℝ) ^ p)).continuousAt.tendsto.mono_left nhdsWithin_le_nhds
    simpa [ca] using h
  have hb := tendsto_ratio (cb_deriv p) (by simp [cb, ca])
  have hc := tendsto_ratio (cc_deriv p) (by norm_num [cc, ca])
  have hd := tendsto_ratio (cd_deriv p) (by norm_num [cd, ca])
  have hα : Tendsto (fun α : ℝ => α) (𝓝[≠] 0) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have H := (((((hα.pow 2).mul (hb.pow 2)).mul (hc.pow 2)).sub
    ((((ha.mul (hc.pow 3)).mul hα)).const_mul 4)).sub
    ((((hα.pow 2).mul (hb.pow 3)).mul hd).const_mul 4)).sub
    (((ha.pow 2).mul (hd.pow 2)).const_mul 27) |>.add
    (((((ha.mul hb).mul hc).mul hd).mul hα).const_mul 18)
  refine (by simpa only [zero_pow (by decide : (2 : ℕ) ≠ 0), zero_mul, mul_zero, sub_zero,
    one_pow, one_mul, zero_sub, neg_pow_two, add_zero, neg_mul] using H :
    Tendsto _ _ (𝓝 (-27 * powerGap p ^ 2))).congr' ?_
  filter_upwards [self_mem_nhdsWithin] with α hα
  have hn : α ≠ 0 := hα
  simp only [Cubic.discr]
  field_simp

/-- For every fixed exponent above two, the translated cubic has negative
discriminant for all sufficiently small positive damping parameters. -/
theorem discriminant_neg_for_small (p : ℝ) (hp : 2 < p) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ α : ℝ, 0 < α → α < ε →
      (⟨ca p α, cb p α, cc p α, cd p α⟩ : Cubic ℝ).discr < 0 := by
  have hl := discriminant_limit p
  have hneg : -27 * powerGap p ^ 2 < 0 := by
    have hv := sq_pos_of_pos (powerGap_pos p hp)
    nlinarith
  have h := hl.eventually (gt_mem_nhds hneg)
  have h' : ∀ᶠ α : ℝ in 𝓝[>] 0,
      (⟨ca p α, cb p α, cc p α, cd p α⟩ : Cubic ℝ).discr / α ^ 2 < 0 :=
    h.filter_mono (nhdsWithin_mono (0 : ℝ)
      (fun (x : ℝ) (hx : x ∈ Ioi (0 : ℝ)) => (show 0 < x from hx).ne'))
  rw [eventually_nhdsWithin_iff] at h'
  obtain ⟨ε, hε, he⟩ := Metric.eventually_nhds_iff.mp h'
  refine ⟨ε, hε, fun α hα hαε => ?_⟩
  have hquot := he (show dist α 0 < ε by simpa [Real.dist_eq, abs_of_pos hα] using hαε) hα
  exact lt_of_not_ge fun h => (not_lt_of_ge (div_nonneg h (sq_nonneg α))) hquot

end CardonZeroSector
