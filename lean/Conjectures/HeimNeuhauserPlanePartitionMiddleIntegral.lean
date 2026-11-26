import Conjectures.HeimNeuhauserPlanePartitionMiddleGrid
import Conjectures.HeimNeuhauserPlanePartitionTailPointwise
import Conjectures.HeimNeuhauserPlanePartitionTailExponential

/-! Integrate the middle-range bounds on the exact seventy-two rational bins. -/

namespace PlanePartition

open Real MeasureTheory Finset
open scoped Interval
open OrdinaryDarcais (normalizedIntegrand)

private noncomputable def binPoint (i : ℕ) : ℝ := (binPointQ i : ℝ)

private theorem binPoint_eq (i : ℕ) : binPoint i = (24+(i : ℝ))/8 := by
  simp [binPoint, binPointQ]

private theorem weight_cast (m q : ℚ) (i : ℕ) :
    (binWeightQ m q i : ℝ) = binWeight (m : ℝ) (q : ℝ) (binPoint i) (binPoint (i+1)) := by
  simp [binWeightQ, binWeight, binPoint]

private theorem cost_cast (m q : ℚ) (i : ℕ) :
    (binCostQ m q i : ℝ) = ((binPoint (i+1))^3-(binPoint i)^3)/
      (6*(1+binWeight (m : ℝ) (q : ℝ) (binPoint i) (binPoint (i+1))/256)^256) := by
  simp only [binCostQ, Rat.cast_div, Rat.cast_mul, Rat.cast_add, Rat.cast_sub, Rat.cast_pow,
    Rat.cast_ofNat, Rat.cast_one, weight_cast, binPoint]

theorem normalized_continuous {x r : ℝ} (hx : 0 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1) :
    Continuous (normalizedIntegrand (variance x r) (damping x r) (phase x r)) := by
  have ha := damping_continuous hx hr.1.le hr.2
  have hp := phase_continuous hx hr.1.le hr.2
  unfold normalizedIntegrand
  fun_prop

private theorem integral_bin {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hV : 251 ≤ variance x r) (m q : ℚ) (a : Array ℕ) (hm : 0 ≤ (m : ℝ)) (hq : 0 < (q : ℝ))
    (hM : (m : ℝ)*variance x r ≤ baseVariance x r) (hS : (q : ℝ)*r ≤ (1-r)^2*variance x r)
    (hc : BinCertificate m q a) (i : ℕ) (hi : i < 72) :
    (∫ u in binPoint i..binPoint (i+1), -normalizedIntegrand (variance x r) (damping x r) (phase x r) u)
      ≤ (allocation a i : ℝ)/10^7 := by
  let l := binPoint i
  let v := binPoint (i+1)
  let w := binWeight (m : ℝ) (q : ℝ) l v
  have hx₀ : 0 ≤ x := by linarith
  have hp : 0 < variance x r := by linarith
  have hl : 0 ≤ l := by dsimp [l]; rw [binPoint_eq]; positivity
  have hv₀ : 0 ≤ v := by dsimp [v]; rw [binPoint_eq]; positivity
  have hv : v ≤ 12 := by
    have hh : (i : ℝ) ≤ 71 := by exact_mod_cast (show i ≤ 71 by omega)
    dsimp [v]; rw [binPoint_eq]; push_cast; linarith
  have hlv : l ≤ v := by simp only [l,v,binPoint_eq,Nat.cast_add_one]; linarith
  have hw : 0 ≤ w := by
    have hh := pow_le_pow_left₀ hv₀ hv 2
    have hv' : 0 ≤ 1/2-v^2/(24*251) := by linarith
    dsimp [w,binWeight]; positivity
  have hpoint (u : ℝ) (hu : u ∈ Set.Icc l v) : -normalizedIntegrand (variance x r) (damping x r) (phase x r) u
      ≤ (u^2/2)*exp (-w) := by
    apply (negative_integrand_le hp.le ..).trans
    apply mul_le_mul (normalizedDefect_upper hp _) _ (exp_pos _).le (by positivity)
    exact exp_le_exp.mpr (neg_le_neg (damping_ge_bin hx₀ hr hV hm hq hM hS hl hu.1 hu.2 hv))
  have he := expNegative_bound hw (by decide : 0 < 256)
  simp only [Nat.cast_ofNat] at he
  have hmass : 0 ≤ (v^3-l^3)/6 := by
    have hh := pow_le_pow_left₀ hl hlv 3
    linarith
  have hcert := hc.1 ⟨i,hi⟩
  have hreal : (binCostQ m q i : ℝ) ≤ (allocation a i : ℝ)/10^7 := by
    have ht : (binCostQ m q i : ℝ) ≤ (((allocation a i : ℚ)/10^7 : ℚ) : ℝ) := Rat.cast_le.mpr hcert
    push_cast at ht
    exact ht
  calc
    _ ≤ ∫ u in l..v, (u^2/2)*exp (-w) := intervalIntegral.integral_mono_on hlv
      ((normalized_continuous hx₀ hr).neg.intervalIntegrable ..)
      ((show Continuous (fun u : ℝ => (u^2/2)*exp (-w)) by fun_prop).intervalIntegrable ..) hpoint
    _ = ((v^3-l^3)/6)*exp (-w) := by
      rw [intervalIntegral.integral_mul_const, intervalIntegral.integral_div, integral_pow]
      norm_num
      ring
    _ ≤ ((v^3-l^3)/6)*(1/(1+w/256)^256) := mul_le_mul_of_nonneg_left he hmass
    _ = (binCostQ m q i : ℝ) := by
      rw [cost_cast]
      change (v^3-l^3)/6*(1/(1+w/256)^256) = (v^3-l^3)/(6*(1+w/256)^256)
      rw [div_mul_div_comm, mul_one]
    _ ≤ _ := hreal

theorem middle_integral_bound {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hV : 251 ≤ variance x r) (h : TailParameters x r) :
    -(3/10 : ℝ) ≤ ∫ u in (3 : ℝ)..12, normalizedIntegrand (variance x r) (damping x r) (phase x r) u := by
  have hx₀ : 0 ≤ x := by linarith
  let f := normalizedIntegrand (variance x r) (damping x r) (phase x r)
  have hi : ∀ i, IntervalIntegrable (fun u => -f u) volume (binPoint i) (binPoint (i+1)) :=
    fun _ => (normalized_continuous hx₀ hr).neg.intervalIntegrable ..
  have hsum := intervalIntegral.sum_integral_adjacent_intervals (n := 72) (fun i _ => hi i)
  have hstart : binPoint 0 = 3 := by norm_num [binPoint_eq]
  have hend : binPoint 72 = 12 := by norm_num [binPoint_eq]
  rw [hstart,hend,intervalIntegral.integral_neg] at hsum
  have sum_bound (m q : ℚ) (a : Array ℕ) (hm : 0 ≤ (m : ℝ)) (hq : 0 < (q : ℝ))
      (hM : (m : ℝ)*variance x r ≤ baseVariance x r) (hS : (q : ℝ)*r ≤ (1-r)^2*variance x r)
      (hc : BinCertificate m q a) : -(∫ u in (3 : ℝ)..12, f u) ≤ 3/10 := by
    rw [← hsum]
    calc
      _ ≤ ∑ i ∈ range 72, (allocation a i : ℝ)/10^7 := sum_le_sum (fun i hi =>
        integral_bin hx hr hV m q a hm hq hM hS hc i (mem_range.mp hi))
      _ ≤ _ := by
        rw [← sum_div, ← Nat.cast_sum, div_le_iff₀ (by norm_num)]
        have hh : ((∑ i ∈ range 72, allocation a i : ℕ) : ℝ) ≤ 3000000 := by exact_mod_cast hc.2
        linarith
  change -(3/10 : ℝ) ≤ ∫ u in (3 : ℝ)..12, f u
  rcases h.middle with h₁|h₂
  · have hh := sum_bound (7/10) 145 _ (by norm_num) (by norm_num)
      (by simpa using h₁.1) (by simpa using h₁.2) intermediate_bin_certificate
    linarith
  · have hh := sum_bound (20/33) 400 _ (by norm_num) (by norm_num)
      (by simpa using h₂.1) (by simpa using h₂.2) outerRadii_bin_certificate
    linarith

end PlanePartition
