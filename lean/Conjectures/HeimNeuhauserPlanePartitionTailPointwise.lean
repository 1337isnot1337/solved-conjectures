import Conjectures.HeimNeuhauserPlanePartitionTailParameters

/-! Pointwise upper bounds for the possible negative part of the Fourier integrand. -/

namespace PlanePartition

open Real
open OrdinaryDarcais (normalizedIntegrand)

theorem normalizedDefect_upper {V : ℝ} (hV : 0 < V) (u : ℝ) :
    V*(1-cos (u/sqrt V)) ≤ u^2/2 := by
  have h := one_sub_sq_div_two_le_cos (x := u/sqrt V)
  have he : V*((u/sqrt V)^2/2) = u^2/2 := by
    rw [div_pow, sq_sqrt hV.le]
    field_simp
  linarith only [mul_le_mul_of_nonneg_left (show 1-cos (u/sqrt V) ≤ (u/sqrt V)^2/2 by linarith only [h]) hV.le, he]

theorem negative_integrand_le {V : ℝ} (hV : 0 ≤ V) (A θ : ℝ → ℝ) (u : ℝ) :
    -normalizedIntegrand V A θ u ≤ V*(1-cos (u/sqrt V))*exp (-A (u/sqrt V)) := by
  have hnn := mul_nonneg (mul_nonneg hV (sub_nonneg.mpr (cos_le_one (u/sqrt V)))) (exp_pos (-A (u/sqrt V))).le
  unfold normalizedIntegrand
  nlinarith only [mul_le_mul_of_nonneg_left (neg_one_le_cos (θ (u/sqrt V))) hnn]

theorem small_angle_damping {x r t : ℝ} (hx : 0 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (ht : 0 ≤ t) (ht' : t ≤ 1-r) : variance x r*t^2/16 ≤ damping x r t := by
  have hr₀ := hr.1
  have hd : 0 < 1-r := by linarith [hr.2]
  have hV : 0 ≤ variance x r := mul_nonneg hx (tsum_nonneg (fun k => momentTerm_nonneg 1 k hr.1.le))
  have hS₀ : 0 ≤ envelopeS r t := by unfold envelopeS; have := sub_nonneg.mpr (cos_le_one t); positivity
  have hD : 1-cos t ≤ t^2/2 := by linarith [one_sub_sq_div_two_le_cos (x := t)]
  have hS : envelopeS r t ≤ 1 := by
    have hsq : t^2 ≤ (1-r)^2 := pow_le_pow_left₀ ht ht' _
    unfold envelopeS
    rw [div_le_one (sq_pos_of_pos hd)]
    calc
      _ ≤ r*t^2 := by nlinarith only [mul_le_mul_of_nonneg_left hD hr.1.le]
      _ ≤ 1*(1-r)^2 := mul_le_mul hr.2.le hsq (sq_nonneg t) (by norm_num)
      _ = _ := one_mul _
  have hden : (1+envelopeS r t)^2 ≤ 4 := by
    calc
      _ ≤ (1+1 : ℝ)^2 := by gcongr
      _ = _ := by norm_num
  have hnum := mul_le_mul (baseVariance_ge hx hr.1.le hr.2)
    (defect_small ht (by linarith)) (mul_nonneg (by norm_num) (sq_nonneg _))
    (show 0 ≤ baseVariance x r by unfold baseVariance; positivity)
  apply le_trans _ (damping_ge_defect hx hr.1 hr.2 t)
  apply (le_div_iff₀ (by positivity)).mpr
  have hl := mul_le_mul_of_nonneg_left hden (show 0 ≤ variance x r*t^2/16 by positivity)
  change (20/33)*variance x r*((11/24)*t^2) ≤ _ at hnum
  nlinarith only [hl, hnum, mul_nonneg hV (sq_nonneg t)]

noncomputable def binWeight (m q l v : ℝ) := m*(1/2-v^2/(24*251))*l^2/(1+v^2/q)^2

theorem damping_ge_bin {x r m q l u v : ℝ} (hx : 0 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hV : 251 ≤ variance x r) (hm : 0 ≤ m) (hq : 0 < q)
    (hM : m*variance x r ≤ baseVariance x r) (hS : q*r ≤ (1-r)^2*variance x r)
    (hl : 0 ≤ l) (hlu : l ≤ u) (huv : u ≤ v) (hv : v ≤ 12) :
    binWeight m q l v ≤ damping x r (u/sqrt (variance x r)) := by
  let V := variance x r
  let t := u/sqrt V
  let c := 1/2-v^2/(24*251)
  have hp : 0 < V := by dsimp [V]; linarith
  have hδ : 0 < 1-r := by linarith [hr.2]
  have hr₀ := hr.1
  have hu₀ := hl.trans hlu
  have hv₀ := hu₀.trans huv
  have ht : 0 ≤ t := div_nonneg hu₀ (sqrt_nonneg _)
  have ht2 : t^2 = u^2/V := by rw [show t = u/sqrt V from rfl, div_pow, sq_sqrt hp.le]
  have hv2 : v^2 ≤ (12 : ℝ)^2 := pow_le_pow_left₀ hv₀ hv _
  have hc : 0 ≤ c := by dsimp [c]; linarith
  have htbound : t^2 ≤ v^2/251 := by
    rw [ht2]
    exact div_le_div₀ (sq_nonneg _) (pow_le_pow_left₀ hu₀ huv _) (by norm_num) hV
  have hdef : c*t^2 ≤ 1-cos t := by
    have hh := mul_le_mul_of_nonneg_right htbound (sq_nonneg t)
    dsimp [c]
    nlinarith only [hh, cosineDefect_lower ht]
  have hdef' : 1-cos t ≤ t^2/2 := by linarith [one_sub_sq_div_two_le_cos (x := t)]
  have hS₀ : 0 ≤ envelopeS r t := by unfold envelopeS; have := sub_nonneg.mpr (cos_le_one t); positivity
  have hS' : envelopeS r t ≤ v^2/q := by
    unfold envelopeS
    rw [div_le_div_iff₀ (sq_pos_of_pos hδ) hq]
    have h₁ := mul_le_mul_of_nonneg_left hdef' (mul_nonneg hr.1.le hq.le)
    have h₂ := mul_le_mul_of_nonneg_right hS (sq_nonneg t)
    have h₃ := mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hu₀ huv 2) (sq_nonneg (1-r))
    have hEq : V*t^2 = u^2 := by rw [ht2]; field_simp
    nlinarith only [h₁,h₂,h₃,congrArg (fun z : ℝ => (1-r)^2*z) hEq]
  have hA₀ : 0 ≤ baseVariance x r := by unfold baseVariance; positivity
  have hn : m*c*l^2 ≤ baseVariance x r*(1-cos t) := by
    calc
      _ ≤ m*c*u^2 := mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hl hlu _) (mul_nonneg hm hc)
      _ = (m*V)*(c*t^2) := by rw [ht2]; field_simp
      _ ≤ _ := mul_le_mul hM hdef (mul_nonneg hc (sq_nonneg t)) hA₀
  have hd : (1+envelopeS r t)^2 ≤ (1+v^2/q)^2 := by gcongr
  exact (div_le_div₀ (mul_nonneg hA₀ (sub_nonneg.mpr (cos_le_one t))) hn
    (by positivity) hd).trans (damping_ge_defect hx hr.1 hr.2 t)

end PlanePartition
