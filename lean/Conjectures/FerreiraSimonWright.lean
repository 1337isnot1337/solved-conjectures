module

public import Mathlib.Analysis.SpecialFunctions.Gamma.Beta
public import Mathlib.Analysis.SpecialFunctions.Gamma.BohrMollerup
public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Sinc
public import Mathlib.Analysis.Convex.Jensen
public import Mathlib.Analysis.Normed.Group.Tannery
public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.FunProp
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Ring

/-!
The Wright function is defined by its actual reciprocal-Gamma series.  The
boundary family below uses beta = 0 and alpha = 1 - t.  All estimates are
uniform over the infinite series; no finite truncation is a hypothesis.
-/

@[expose] public section

noncomputable section
open Filter Set
open scoped Topology Nat

namespace FerreiraSimonWright

def wright (rho beta z : ℝ) : ℝ :=
  ∑' n : ℕ, z ^ n / ((n.factorial : ℝ) * Real.Gamma (beta + rho * n))

def density (alpha beta x : ℝ) : ℝ :=
  Real.Gamma (alpha + beta) * wright (-alpha) beta (-x)

def scaledCoefficient (t : ℝ) (n : ℕ) : ℝ :=
  (-1) ^ n / ((n.factorial : ℝ) * Real.Gamma (-(n : ℝ) + n * t)) / t

lemma inv_gamma_reflection {z : ℝ} (hz : 0 < 1 - z) :
    (Real.Gamma z)⁻¹ = Real.Gamma (1 - z) * Real.sin (Real.pi * z) / Real.pi := by
  have hg := (Real.Gamma_pos_of_pos hz).ne'
  have h := congrArg (fun x : ℝ => x⁻¹) (Real.Gamma_mul_Gamma_one_sub z)
  rw [mul_inv_rev, inv_div] at h
  calc
    (Real.Gamma z)⁻¹ = Real.Gamma (1 - z) *
        ((Real.Gamma (1 - z))⁻¹ * (Real.Gamma z)⁻¹) := by
      rw [← mul_assoc, mul_inv_cancel₀ hg, one_mul]
    _ = _ := by rw [h]; ring

lemma coefficient_reflection {t : ℝ} (ht : 0 < t) (ht1 : t < 1) (n : ℕ) :
    scaledCoefficient t n =
      Real.Gamma ((n : ℝ) + 1 - n * t) / (n.factorial : ℝ) *
        (Real.sin (Real.pi * n * t) / (Real.pi * t)) := by
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hz : 0 < 1 - (-(n : ℝ) + n * t) := by nlinarith
  have href := inv_gamma_reflection hz
  have harg : 1 - (-(n : ℝ) + n * t) = (n : ℝ) + 1 - n * t := by ring
  have hsin : Real.sin (Real.pi * (-(n : ℝ) + n * t)) =
      (-1 : ℝ) ^ n * Real.sin (Real.pi * n * t) := by
    rw [show Real.pi * (-(n : ℝ) + n * t) = Real.pi * n * t - n * Real.pi by ring,
      Real.sin_sub_nat_mul_pi]
  have hsign : (-1 : ℝ) ^ n * (-1 : ℝ) ^ n = 1 := by
    rw [← mul_pow]; norm_num
  rw [harg, hsin] at href
  unfold scaledCoefficient
  simp only [div_eq_mul_inv, mul_inv_rev]
  rw [href]
  calc
    _ = ((-1 : ℝ) ^ n * (-1 : ℝ) ^ n) *
        (Real.Gamma ((n : ℝ) + 1 - n * t) * (n.factorial : ℝ)⁻¹ *
          (Real.sin (Real.pi * n * t) * (Real.pi * t)⁻¹)) := by ring
    _ = _ := by rw [hsign, one_mul]; simp only [mul_inv_rev]

lemma gamma_factor_bound {t : ℝ} (ht : 0 ≤ t) (ht1 : t ≤ 1) (n : ℕ) :
    0 < Real.Gamma ((n : ℝ) + 1 - n * t) ∧
      Real.Gamma ((n : ℝ) + 1 - n * t) ≤ (n.factorial : ℝ) := by
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have harg : (1 : ℝ) ≤ (n : ℝ) + 1 - n * t ∧
      (n : ℝ) + 1 - n * t ≤ (n : ℝ) + 1 := by constructor <;> nlinarith
  refine ⟨Real.Gamma_pos_of_pos (by linarith), ?_⟩
  have h := Real.convexOn_Gamma.le_max_of_mem_Icc
    (by norm_num : (1 : ℝ) ∈ Ioi 0)
    (by change 0 < (n : ℝ) + 1; positivity) harg
  rw [Real.Gamma_one, Real.Gamma_nat_eq_factorial] at h
  have hf : (1 : ℝ) ≤ n.factorial := by exact_mod_cast Nat.factorial_pos n
  simpa [max_eq_right hf] using h

lemma coefficient_bound {t : ℝ} (ht : 0 < t) (ht1 : t < 1) (n : ℕ) :
    |scaledCoefficient t n| ≤ (n : ℝ) := by
  rw [coefficient_reflection ht ht1]
  obtain ⟨hgpos, hgle⟩ := gamma_factor_bound ht.le ht1.le n
  have hf : (0 : ℝ) < n.factorial := by exact_mod_cast Nat.factorial_pos n
  have hrpos : 0 ≤ Real.Gamma ((n : ℝ) + 1 - n * t) / n.factorial :=
    le_of_lt (div_pos hgpos hf)
  have hrle : Real.Gamma ((n : ℝ) + 1 - n * t) / n.factorial ≤ 1 :=
    (div_le_one hf).2 hgle
  have hden : 0 < Real.pi * t := mul_pos Real.pi_pos ht
  have hs : |Real.sin (Real.pi * n * t) / (Real.pi * t)| ≤ (n : ℝ) := by
    rw [abs_div, abs_of_pos hden, div_le_iff₀ hden]
    have h := Real.abs_sin_le_abs (x := Real.pi * n * t)
    rw [abs_of_nonneg (show 0 ≤ Real.pi * n * t by positivity)] at h
    nlinarith
  rw [abs_mul, abs_of_nonneg hrpos]
  calc
    _ ≤ 1 * |Real.sin (Real.pi * n * t) / (Real.pi * t)| :=
      mul_le_mul_of_nonneg_right hrle (abs_nonneg _)
    _ ≤ _ := by simpa using hs

lemma coefficient_sinc {t : ℝ} (ht : 0 < t) (ht1 : t < 1) (n : ℕ) :
    scaledCoefficient t n =
      Real.Gamma ((n : ℝ) + 1 - n * t) / (n.factorial : ℝ) *
        ((n : ℝ) * Real.sinc (Real.pi * n * t)) := by
  rw [coefficient_reflection ht ht1]
  by_cases hn : n = 0
  · simp [hn]
  have hn' : (n : ℝ) ≠ 0 := by exact_mod_cast hn
  rw [Real.sinc_of_ne_zero (mul_ne_zero (mul_ne_zero Real.pi_ne_zero hn') ht.ne')]
  congr 1
  field_simp

lemma coefficient_limit (n : ℕ) :
    Tendsto (fun t : ℝ => scaledCoefficient t n) (𝓝[>] 0) (𝓝 (n : ℝ)) := by
  have hg : ContinuousAt Real.Gamma ((n : ℝ) + 1) :=
    (Real.hasDerivAt_Gamma_of_pos (by positivity)).continuousAt
  have hc : ContinuousAt
      (fun t : ℝ => Real.Gamma ((n : ℝ) + 1 - n * t) / (n.factorial : ℝ) *
        ((n : ℝ) * Real.sinc (Real.pi * n * t))) 0 := by
    apply ContinuousAt.mul
    · apply ContinuousAt.div_const
      have hg' : ContinuousAt Real.Gamma ((n : ℝ) + 1 - n * (0 : ℝ)) := by
        simpa using hg
      exact hg'.comp (f := fun t : ℝ => (n : ℝ) + 1 - n * t) (x := 0)
        (by fun_prop)
    · fun_prop
  have hf : (n.factorial : ℝ) ≠ 0 := by positivity
  have hlim : Tendsto
      (fun t : ℝ => Real.Gamma ((n : ℝ) + 1 - n * t) / (n.factorial : ℝ) *
        ((n : ℝ) * Real.sinc (Real.pi * n * t)))
      (𝓝[>] 0) (𝓝 (n : ℝ)) := by
    simpa [Real.Gamma_nat_eq_factorial, hf] using hc.tendsto.mono_left nhdsWithin_le_nhds
  apply hlim.congr'
  filter_upwards [self_mem_nhdsWithin,
    (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono nhdsWithin_le_nhds]
    with t ht ht1
  exact (coefficient_sinc ht ht1 n).symm

lemma scaled_wright_eq (t x : ℝ) :
    wright (-(1 - t)) 0 (-x) / t =
      ∑' n : ℕ, scaledCoefficient t n * x ^ n := by
  unfold wright
  rw [← tsum_div_const]
  apply tsum_congr
  intro n
  unfold scaledCoefficient
  rw [show (0 : ℝ) + -(1 - t) * n = -(n : ℝ) + n * t by ring,
    show (-x) ^ n = (-1 : ℝ) ^ n * x ^ n by rw [← mul_pow]; congr 1; ring]
  ring

theorem scaled_wright_limit {x : ℝ} (hx : 0 ≤ x) (hx1 : x < 1) :
    Tendsto (fun t : ℝ => wright (-(1 - t)) 0 (-x) / t)
      (𝓝[>] 0) (𝓝 (x / (1 - x) ^ 2)) := by
  have hnorm : ‖x‖ < 1 := by simpa [Real.norm_eq_abs, abs_of_nonneg hx] using hx1
  have hsum := (hasSum_coe_mul_geometric_of_norm_lt_one hnorm).summable
  have h := tendsto_tsum_of_dominated_convergence hsum
    (fun n : ℕ => (coefficient_limit n).mul_const (x ^ n)) ?_
  · simpa only [← scaled_wright_eq, tsum_coe_mul_geometric_of_norm_lt_one hnorm] using h
  · filter_upwards [self_mem_nhdsWithin,
      (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono nhdsWithin_le_nhds]
      with t ht ht1
    intro n
    simp only [Real.norm_eq_abs, abs_mul, abs_of_nonneg (pow_nonneg hx n)]
    exact mul_le_mul_of_nonneg_right (coefficient_bound ht ht1 n) (pow_nonneg hx n)

lemma raw_midpoint_violation :
    ∀ᶠ t : ℝ in 𝓝[>] 0,
      0 < t ∧ t < 1 ∧
      0 < wright (-(1 - t)) 0 (-(1 / 4)) ∧
      0 < wright (-(1 - t)) 0 (-(1 / 2)) ∧
      0 < wright (-(1 - t)) 0 (-(3 / 4)) ∧
      wright (-(1 - t)) 0 (-(1 / 2)) ^ 2 <
        wright (-(1 - t)) 0 (-(1 / 4)) * wright (-(1 - t)) 0 (-(3 / 4)) := by
  have hq : Tendsto (fun t : ℝ => wright (-(1 - t)) 0 (-(1 / 4)) / t)
      (𝓝[>] 0) (𝓝 (4 / 9)) := by
    convert scaled_wright_limit (x := 1 / 4) (by norm_num) (by norm_num) using 1; norm_num
  have hm : Tendsto (fun t : ℝ => wright (-(1 - t)) 0 (-(1 / 2)) / t)
      (𝓝[>] 0) (𝓝 2) := by
    convert scaled_wright_limit (x := 1 / 2) (by norm_num) (by norm_num) using 1; norm_num
  have hr : Tendsto (fun t : ℝ => wright (-(1 - t)) 0 (-(3 / 4)) / t)
      (𝓝[>] 0) (𝓝 12) := by
    convert scaled_wright_limit (x := 3 / 4) (by norm_num) (by norm_num) using 1; norm_num
  have hdiff : Tendsto (fun t : ℝ =>
      (wright (-(1 - t)) 0 (-(1 / 2)) / t) ^ 2 -
        (wright (-(1 - t)) 0 (-(1 / 4)) / t) *
        (wright (-(1 - t)) 0 (-(3 / 4)) / t)) (𝓝[>] 0) (𝓝 (-4 / 3)) := by
    convert (hm.pow 2).sub (hq.mul hr) using 1; norm_num
  filter_upwards [self_mem_nhdsWithin,
    (eventually_lt_nhds (show (0 : ℝ) < 1 by norm_num)).filter_mono nhdsWithin_le_nhds,
    (tendsto_order.1 hq).1 0 (by norm_num),
    (tendsto_order.1 hm).1 0 (by norm_num),
    (tendsto_order.1 hr).1 0 (by norm_num),
    (tendsto_order.1 hdiff).2 0 (by norm_num)] with t ht ht1 hq hm hr hdiff
  have pos_raw {v : ℝ} (hv : 0 < v / t) : 0 < v := by
    simpa [div_mul_cancel₀ _ ht.ne'] using mul_pos hv ht
  refine ⟨ht, ht1, pos_raw hq, pos_raw hm, pos_raw hr, ?_⟩
  have hi : (wright (-(1 - t)) 0 (-(1 / 2)) / t) ^ 2 <
      (wright (-(1 - t)) 0 (-(1 / 4)) / t) *
        (wright (-(1 - t)) 0 (-(3 / 4)) / t) := by linarith
  rw [div_pow, div_mul_div_comm, ← pow_two] at hi
  exact (div_lt_div_iff_of_pos_right (sq_pos_of_pos ht)).1 hi

lemma not_concave_log_of_midpoint {f : ℝ → ℝ}
    (hq : 0 < f (1 / 4)) (hm : 0 < f (1 / 2)) (hr : 0 < f (3 / 4))
    (hbad : f (1 / 2) ^ 2 < f (1 / 4) * f (3 / 4)) :
    ¬ ConcaveOn ℝ (Ioi 0) (fun x => Real.log (f x)) := by
  intro h
  have hc := h.2 (show (1 / 4 : ℝ) ∈ Ioi 0 by norm_num)
    (show (3 / 4 : ℝ) ∈ Ioi 0 by norm_num)
    (show (0 : ℝ) ≤ 1 / 2 by norm_num) (show (0 : ℝ) ≤ 1 / 2 by norm_num)
    (show (1 / 2 : ℝ) + 1 / 2 = 1 by norm_num)
  norm_num [smul_eq_mul] at hc
  have hl : Real.log (f (1 / 4) * f (3 / 4)) ≤ Real.log (f (1 / 2) ^ 2) := by
    rw [Real.log_mul hq.ne' hr.ne', Real.log_pow]
    norm_num
    linarith
  have hn := (Real.log_le_log_iff (mul_pos hq hr) (sq_pos_of_pos hm)).1 hl
  exact (not_lt_of_ge hn) hbad

/-- Every sufficiently small positive t gives an admissible boundary
counterexample, for the density defined by the infinite Wright series. -/
theorem boundary_counterexamples :
    ∀ᶠ t : ℝ in 𝓝[>] 0, 0 < t ∧ t < 1 ∧
      ¬ ConcaveOn ℝ (Ioi 0) (fun x => Real.log (density (1 - t) 0 x)) := by
  filter_upwards [raw_midpoint_violation] with t ht
  obtain ⟨ht, ht1, hq, hm, hr, hbad⟩ := ht
  refine ⟨ht, ht1, not_concave_log_of_midpoint ?_ ?_ ?_ ?_⟩
  all_goals simp only [density, add_zero]
  all_goals have hg : 0 < Real.Gamma (1 - t) := Real.Gamma_pos_of_pos (by linarith)
  · exact mul_pos hg hq
  · exact mul_pos hg hm
  · exact mul_pos hg hr
  · nlinarith [mul_lt_mul_of_pos_left hbad (sq_pos_of_pos hg)]

/-- The beta=0 clause of the conjecture already fails.  At beta=0 the source
sets alpha-star equal to one, so every alpha in this theorem meets its threshold. -/
theorem exists_boundary_counterexample :
    ∃ alpha : ℝ, 0 < alpha ∧ alpha < 1 ∧
      ¬ ConcaveOn ℝ (Ioi 0) (fun x => Real.log (density alpha 0 x)) := by
  obtain ⟨t, ht, ht1, hbad⟩ := boundary_counterexamples.exists
  exact ⟨1 - t, by linarith, by linarith, hbad⟩

theorem boundary_conjecture_false :
    ¬ (∀ alpha : ℝ, 0 < alpha → alpha < 1 →
      ConcaveOn ℝ (Ioi 0) (fun x => Real.log (density alpha 0 x))) := by
  obtain ⟨alpha, hpos, hlt, hbad⟩ := exists_boundary_counterexample
  exact fun h => hbad (h alpha hpos hlt)

end FerreiraSimonWright
