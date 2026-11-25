import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Tactic

/-! The central lower integral in the ordinary D’Arcais Fourier estimate. -/

namespace OrdinaryDarcais

open Real Finset Set
open scoped Interval

private noncomputable def expTrunc (n : ℕ) (y : ℝ) : ℝ :=
  ∑ k ∈ range (n + 1), y ^ k / (k.factorial : ℝ)

private theorem expTrunc_deriv (n : ℕ) (y : ℝ) :
    HasDerivAt (expTrunc (n + 1)) (expTrunc n y) y := by
  have hsplit (x : ℝ) : expTrunc (n + 1) x =
      (∑ k ∈ range (n + 1), x ^ (k + 1) / ((k + 1).factorial : ℝ)) + 1 := by
    rw [expTrunc, Finset.sum_range_succ']
    simp
  have hd k : HasDerivAt (fun x : ℝ => x ^ (k + 1) / ((k + 1).factorial : ℝ))
      (y ^ k / (k.factorial : ℝ)) y := by
    have h := ((hasDerivAt_id y).fun_pow (k + 1)).div_const ((k + 1).factorial : ℝ)
    rw [id_eq, Nat.add_sub_cancel, mul_one] at h
    convert h using 1
    · rfl
    · rw [Nat.factorial_succ, Nat.cast_mul,
        mul_div_mul_left _ _ (show ((k + 1 : ℕ) : ℝ) ≠ 0 by positivity)]
  rw [show expTrunc (n + 1) = _ from funext hsplit]
  exact (HasDerivAt.fun_sum (fun k _ => hd k)).add_const 1

private noncomputable def signedRemainder (n : ℕ) (y : ℝ) : ℝ :=
  (-1 : ℝ) ^ n * (expTrunc n (-y) - exp (-y))

private theorem signedRemainder_deriv (n : ℕ) (y : ℝ) :
    HasDerivAt (signedRemainder (n + 1)) (signedRemainder n y) y := by
  have h₁ := (expTrunc_deriv n (-y)).comp y (hasDerivAt_neg y)
  have h₂ := (hasDerivAt_exp (-y)).comp y (hasDerivAt_neg y)
  convert (h₁.sub h₂).const_mul ((-1 : ℝ) ^ (n + 1)) using 1
  · rfl
  · simp only [signedRemainder, pow_succ]
    ring

private theorem signedRemainder_zero (n : ℕ) : signedRemainder n 0 = 0 := by
  rw [signedRemainder, neg_zero, exp_zero, expTrunc]
  rw [Finset.sum_eq_single 0]
  · simp
  · intro k _ hk
    simp [zero_pow hk]
  · simp

private theorem signedRemainder_nonneg (n : ℕ) {y : ℝ} (hy : 0 ≤ y) :
    0 ≤ signedRemainder n y := by
  induction n generalizing y with
  | zero =>
    simpa [signedRemainder, expTrunc] using (exp_le_one_iff.mpr (neg_nonpos.mpr hy))
  | succ n ih =>
    have hm : MonotoneOn (signedRemainder (n + 1)) (Set.Ici 0) := by
      apply monotoneOn_of_deriv_nonneg (convex_Ici _)
      · exact fun z _ => (signedRemainder_deriv n z).continuousAt.continuousWithinAt
      · exact fun z _ => (signedRemainder_deriv n z).differentiableAt.differentiableWithinAt
      · intro z hz
        rw [interior_Ici] at hz
        rw [(signedRemainder_deriv n z).deriv]
        exact ih hz.le
    have hh := hm (show (0 : ℝ) ∈ Set.Ici 0 by simp) (show y ∈ Set.Ici 0 from hy) hy
    rwa [signedRemainder_zero] at hh

private theorem expTrunc11_le {y : ℝ} (hy : 0 ≤ y) :
    expTrunc 11 (-y) ≤ exp (-y) := by
  have h := signedRemainder_nonneg 11 hy
  norm_num [signedRemainder] at h
  linarith

/-- The explicit pointwise lower bound used on the central interval. -/
noncomputable def mainLower (u : ℝ) : ℝ :=
  (239 / 288) * (1 - 1 / 1503) * (u ^ 2 / 2) * exp (-(u ^ 2 / 2))

/-- The universal central lower integral exceeds the written rational threshold. -/
theorem central_lower_integral :
    (19 / 50 : ℝ) < ∫ u in (0 : ℝ)..2, mainLower u := by
  let c : ℝ := (239 / 288) * (1 - 1 / 1503)
  let terms := fun k (u : ℝ) =>
    (c * (-1) ^ k / (2 ^ (k + 1) * (k.factorial : ℝ))) * u ^ (2 * k + 2)
  have hEq (u : ℝ) :
      c * (u ^ 2 / 2) * expTrunc 11 (-(u ^ 2 / 2)) = ∑ k ∈ range 12, terms k u := by
    rw [expTrunc, mul_sum]
    apply sum_congr rfl
    intro k _
    dsimp [terms]
    rw [show -(u ^ 2 / 2) = (-1 : ℝ) * (u ^ 2 / 2) by ring,
      mul_pow, div_pow, ← pow_mul, pow_add u, pow_succ (2 : ℝ) k]
    ring
  have hl : (19 / 50 : ℝ) < ∫ u in (0 : ℝ)..2, ∑ k ∈ range 12, terms k u := by
    rw [intervalIntegral.integral_finsetSum]
    · simp_rw [terms, intervalIntegral.integral_const_mul, integral_pow]
      norm_num [c, Finset.sum_range_succ, Nat.factorial]
    · intro k _
      exact (show Continuous (terms k) by dsimp [terms]; fun_prop).intervalIntegrable ..
  refine hl.trans_le (intervalIntegral.integral_mono_on (by norm_num) ?_ ?_ (fun u _ => ?_))
  · exact (continuous_finsetSum _ fun k _ => (show Continuous (terms k) by dsimp [terms]; fun_prop)).intervalIntegrable ..
  · exact (show Continuous mainLower by unfold mainLower; fun_prop).intervalIntegrable ..
  · rw [← hEq u]
    exact mul_le_mul_of_nonneg_left (expTrunc11_le (by positivity)) (by dsimp [c]; positivity)

private theorem cosineDefect_lower {t : ℝ} (ht : 0 ≤ t) :
    t ^ 2 / 2 - t ^ 4 / 24 ≤ 1 - cos t := by
  let f (s : ℝ) := sin s - s + s ^ 3 / 6
  have hf (s : ℝ) : HasDerivAt f (cos s - 1 + s ^ 2 / 2) s := by
    convert ((hasDerivAt_sin s).sub (hasDerivAt_id s)).add
      (((hasDerivAt_id s).fun_pow 3).div_const 6) using 1
    · rfl
    · simp
      ring
  have hmono : MonotoneOn f (Set.Ici 0) := by
    apply monotoneOn_of_deriv_nonneg (convex_Ici _)
    · exact fun s _ => (hf s).continuousAt.continuousWithinAt
    · exact fun s _ => (hf s).differentiableAt.differentiableWithinAt
    · intro s _
      rw [(hf s).deriv]
      linarith [one_sub_sq_div_two_le_cos (x := s)]
  have hf₀ (s : ℝ) (hs : 0 ≤ s) : 0 ≤ f s := by
    have hh := hmono (show (0 : ℝ) ∈ Set.Ici 0 by simp) (show s ∈ Set.Ici 0 from hs) hs
    have hfzero : f 0 = 0 := by simp [f]
    rwa [hfzero] at hh
  let g (s : ℝ) := 1 - cos s - s ^ 2 / 2 + s ^ 4 / 24
  have hg (s : ℝ) : HasDerivAt g (f s) s := by
    convert (((hasDerivAt_const s (1 : ℝ)).sub (hasDerivAt_cos s)).sub
      (((hasDerivAt_id s).fun_pow 2).div_const 2)).add
      (((hasDerivAt_id s).fun_pow 4).div_const 24) using 1
    · rfl
    · simp [f]
      ring
  have hmono' : MonotoneOn g (Set.Ici 0) := by
    apply monotoneOn_of_deriv_nonneg (convex_Ici _)
    · exact fun s _ => (hg s).continuousAt.continuousWithinAt
    · exact fun s _ => (hg s).differentiableAt.differentiableWithinAt
    · intro s hs
      rw [interior_Ici] at hs
      rw [(hg s).deriv]
      exact hf₀ s hs.le
  have hh := hmono' (show (0 : ℝ) ∈ Set.Ici 0 by simp) (show t ∈ Set.Ici 0 from ht) ht
  change g 0 ≤ g t at hh
  simp only [g, cos_zero, sub_self, zero_pow (by decide : (2 : ℕ) ≠ 0),
    zero_pow (by decide : (4 : ℕ) ≠ 0), zero_div, add_zero] at hh
  linarith

/-- The Fourier integrand in the variable `u = t √V`, including its normalization. -/
noncomputable def normalizedIntegrand (V : ℝ) (A θ : ℝ → ℝ) (u : ℝ) : ℝ :=
  V * (1 - cos (u / sqrt V)) * exp (-A (u / sqrt V)) * cos (θ (u / sqrt V))

private theorem mainLower_le {V u : ℝ} {A θ : ℝ → ℝ} (hV : 501 ≤ V)
    (hu : 0 ≤ u) (hu' : u ≤ 2) (hA : A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : |θ (u / sqrt V)| ≤ (7 / 16) * u ^ 3 / 6) :
    mainLower u ≤ normalizedIntegrand V A θ u := by
  have hV₀ : 0 < V := by linarith
  have hs : 0 < sqrt V := sqrt_pos.mpr hV₀
  have ht : 0 ≤ u / sqrt V := div_nonneg hu hs.le
  have hsq : u ^ 2 ≤ 4 := by nlinarith [mul_nonneg hu (sub_nonneg.mpr hu')]
  have htsq : (u / sqrt V) ^ 2 ≤ 4 / 501 := by
    rw [div_pow, sq_sqrt hV₀.le, div_le_div_iff₀ hV₀ (by norm_num : (0 : ℝ) < 501)]
    linarith
  have hdef : (u ^ 2 / 2) * (1 - 1 / 1503) ≤ V * (1 - cos (u / sqrt V)) := by
    have htV : V * (u / sqrt V) ^ 2 = u ^ 2 := by
      rw [div_pow, sq_sqrt hV₀.le, mul_div_cancel₀ _ hV₀.ne']
    have h := mul_le_mul_of_nonneg_left (cosineDefect_lower ht) hV₀.le
    have h₁ := mul_le_mul_of_nonneg_left htsq (sq_nonneg u)
    rw [show V * ((u / sqrt V) ^ 2 / 2 - (u / sqrt V) ^ 4 / 24) =
      (V * (u / sqrt V) ^ 2) / 2 - (V * (u / sqrt V) ^ 2) * (u / sqrt V) ^ 2 / 24 by ring,
      htV] at h
    linarith
  have hcub : u ^ 3 ≤ 8 := by nlinarith [mul_nonneg (sq_nonneg u) (sub_nonneg.mpr hu')]
  have habs : |θ (u / sqrt V)| ≤ 7 / 12 := by linarith
  have hθsq : (θ (u / sqrt V)) ^ 2 ≤ (7 / 12 : ℝ) ^ 2 := by
    rw [← sq_abs (θ (u / sqrt V))]
    exact pow_le_pow_left₀ (abs_nonneg _) habs 2
  have hcos : (239 / 288 : ℝ) ≤ cos (θ (u / sqrt V)) := by
    linarith [one_sub_sq_div_two_le_cos (x := θ (u / sqrt V))]
  have hexp : exp (-(u ^ 2 / 2)) ≤ exp (-A (u / sqrt V)) := exp_le_exp.mpr (neg_le_neg hA)
  have hh := mul_le_mul hdef hexp (exp_pos _).le
    (mul_nonneg hV₀.le (sub_nonneg.mpr (cos_le_one _)))
  have hh' := mul_le_mul hh hcos (by norm_num : (0 : ℝ) ≤ 239 / 288)
    (mul_nonneg (mul_nonneg hV₀.le (sub_nonneg.mpr (cos_le_one _))) (exp_pos _).le)
  simpa only [mainLower, normalizedIntegrand, mul_assoc, mul_left_comm, mul_comm] using hh'

/-- Under the variance and centered exponent bounds, the normalized Fourier
integral on `[0,2]` exceeds the threshold used by the written proof. -/
theorem central_fourier_bound {V : ℝ} {A θ : ℝ → ℝ} (hV : 501 ≤ V)
    (hAcont : Continuous A) (hθcont : Continuous θ)
    (hA : ∀ u ∈ Set.Icc (0 : ℝ) 2, A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : ∀ u ∈ Set.Icc (0 : ℝ) 2, |θ (u / sqrt V)| ≤ (7 / 16) * u ^ 3 / 6) :
    (19 / 50 : ℝ) < ∫ u in (0 : ℝ)..2, normalizedIntegrand V A θ u := by
  refine central_lower_integral.trans_le (intervalIntegral.integral_mono_on (by norm_num) ?_ ?_ ?_)
  · exact (show Continuous mainLower by unfold mainLower; fun_prop).intervalIntegrable ..
  · exact (show Continuous (normalizedIntegrand V A θ) by unfold normalizedIntegrand; fun_prop).intervalIntegrable ..
  · exact fun u hu => mainLower_le hV hu.1 hu.2 (hA u hu) (hθ u hu)

/-- The centered phase bound and a tail lower bound give a positive normalized
Fourier integral. The applied saddle estimates are supplied as hypotheses. -/
theorem normalized_fourier_pos_of_tail {V b : ℝ} {A θ : ℝ → ℝ} (hV : 501 ≤ V)
    (hAcont : Continuous A) (hθcont : Continuous θ)
    (hA : ∀ u ∈ Set.Icc (0 : ℝ) 2, A (u / sqrt V) ≤ u ^ 2 / 2)
    (hθ : ∀ u ∈ Set.Icc (0 : ℝ) (11 / 4), |θ (u / sqrt V)| ≤ (7 / 16) * u ^ 3 / 6)
    (htail : -(19 / 50 : ℝ) ≤ ∫ u in (11 / 4 : ℝ)..b, normalizedIntegrand V A θ u) :
    0 < ∫ u in (0 : ℝ)..b, normalizedIntegrand V A θ u := by
  let f := normalizedIntegrand V A θ
  have hcont : Continuous f := by unfold f normalizedIntegrand; fun_prop
  have hcentral := central_fourier_bound hV hAcont hθcont hA
    (fun u hu => hθ u ⟨hu.1, hu.2.trans (by norm_num)⟩)
  have hmiddle : 0 ≤ ∫ u in (2 : ℝ)..(11 / 4 : ℝ), f u := by
    apply intervalIntegral.integral_nonneg (by norm_num)
    intro u hu
    have hu₀ : 0 ≤ u := by linarith [hu.1]
    have huc := pow_le_pow_left₀ hu₀ hu.2 3
    have hphase := hθ u ⟨hu₀, hu.2⟩
    have hcos : 0 ≤ cos (θ (u / sqrt V)) := by
      apply cos_nonneg_of_mem_Icc
      apply abs_le.mp
      norm_num at huc
      linarith [pi_gt_d2]
    have hdef : 0 ≤ 1 - cos (u / sqrt V) := sub_nonneg.mpr (cos_le_one _)
    exact mul_nonneg (mul_nonneg (mul_nonneg (by linarith) hdef) (exp_pos _).le) hcos
  change 0 < ∫ u in (0 : ℝ)..b, f u
  rw [← intervalIntegral.integral_add_adjacent_intervals
    (hcont.intervalIntegrable 0 (11 / 4)) (hcont.intervalIntegrable (11 / 4) b),
    ← intervalIntegral.integral_add_adjacent_intervals
      (hcont.intervalIntegrable 0 2) (hcont.intervalIntegrable 2 (11 / 4))]
  change 19 / 50 < ∫ u in (0 : ℝ)..2, f u at hcentral
  change -(19 / 50 : ℝ) ≤ ∫ u in (11 / 4 : ℝ)..b, f u at htail
  linarith

end OrdinaryDarcais
