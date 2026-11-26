import Conjectures.OrdinaryDarcaisGeometricDamping

/-! Certified lower bounds for ordinary damping on normalized Fourier intervals. -/

namespace OrdinaryDarcais

open Real

noncomputable def classVariance (x q d : ℝ) := x*d*q*(1+q)/(1-q)^3

private theorem class_identity {x q d V C : ℝ} (hq : 0 ≤ q) (hq' : q < 1)
    (hd : 0 < d) (hV : 0 < V) (hC : 0 ≤ C) :
    d⁻¹*x*(q/(1-q))*((1+q)*C)/((1-q)^2+2*q*C) =
      (classVariance x q d / V * (V/d^2)*C) / (1+2*q*C/(1-q)^2) := by
  have h : 0 < 1-q := sub_pos.mpr hq'
  have de : 0 < (1-q)^2+2*q*C := by positivity
  rw [show 1+2*q*C/(1-q)^2 = ((1-q)^2+2*q*C)/(1-q)^2 by
    field_simp [h.ne']]
  unfold classVariance
  field_simp [de.ne',hV.ne',hd.ne',h.ne']

theorem divisor_interval_lower {x r V Vmin l u v M S : ℝ} {d : ℕ}
    (hr : 0 ≤ r) (hr' : r < 1) (hd : 0 < d)
    (hVmin : 0 < Vmin) (hV : Vmin ≤ V)
    (hl : 0 ≤ l) (hlu : l ≤ u) (huv : u ≤ v) (hM : 0 ≤ M)
    (hm : M ≤ classVariance x (r^d) d / V)
    (hs : r^d*(d:ℝ)^2/((1-r^d)^2*V) ≤ S) :
    l^2*M*max 0 (1/2-(d:ℝ)^2*v^2/(24*Vmin))/(1+S*v^2) ≤
      ∑' k : ℕ, divisorDampingTerm x r (u/sqrt V) d k := by
  let q := r^d
  let y := (d:ℝ)*(u/sqrt V)
  let C := 1-cos y
  let E := max 0 (1/2-(d:ℝ)^2*v^2/(24*Vmin))
  have hv := hVmin.trans_le hV
  have du : 0 < (d:ℝ) := by exact_mod_cast hd
  have hq : 0 ≤ q := pow_nonneg hr _
  have hq' : q < 1 := pow_lt_one₀ hr hr' hd.ne'
  have hu : 0 ≤ u := hl.trans hlu
  have hC : 0 ≤ C := sub_nonneg.mpr (cos_le_one _)
  have hy : 0 ≤ y := mul_nonneg du.le (div_nonneg hu (sqrt_nonneg _))
  have hy2 : y^2 = (d:ℝ)^2*u^2/V := by
    simp [y,mul_pow,div_pow,sq_sqrt hv.le,mul_div_assoc]
  have hab : y^2 ≤ (d:ℝ)^2*v^2/Vmin := by
    rw [hy2]
    gcongr
  have hquart := PlanePartition.cosineDefect_lower hy
  have hlower : (d:ℝ)^2*u^2/V*E ≤ C := by
    rw [← hy2]
    change y^2*max 0 (1/2-(d:ℝ)^2*v^2/(24*Vmin)) ≤ C
    rw [mul_max_of_nonneg _ _ (sq_nonneg y)]
    apply max_le
    · simpa only [mul_zero] using hC
    · calc
        _ ≤ y^2*(1/2-y^2/24) := by
          apply mul_le_mul_of_nonneg_left _ (sq_nonneg _)
          have h := div_le_div_of_nonneg_right hab (by norm_num : (0:ℝ) ≤ 24)
          linarith only [h,show (d:ℝ)^2*v^2/Vmin/24 = (d:ℝ)^2*v^2/(24*Vmin) by ring]
        _ ≤ C := by dsimp [C]; nlinarith only [hquart]
  have hupper : C ≤ (d:ℝ)^2*u^2/V/2 := by
    rw [← hy2]
    dsimp [C]
    linarith only [one_sub_sq_div_two_le_cos (x:=y)]
  have hS : 0 ≤ S := le_trans (by positivity) hs
  have hE : 0 ≤ E := le_max_left _ _
  have hM' : 0 ≤ classVariance x q d / V := hM.trans hm
  have hn : l^2*M*E ≤ classVariance x q d / V * (V/(d:ℝ)^2)*C := by
    calc
      _ ≤ u^2*(classVariance x q d / V)*E := by gcongr
      _ = classVariance x q d / V * (V/(d:ℝ)^2)*((d:ℝ)^2*u^2/V*E) := by
        field_simp [hv.ne',du.ne']
      _ ≤ _ := mul_le_mul_of_nonneg_left hlower (mul_nonneg hM' (by positivity))
  have hdamping : 2*q*C/(1-q)^2 ≤ S*v^2 := by
    calc
      _ ≤ 2*q*((d:ℝ)^2*u^2/V/2)/(1-q)^2 := by gcongr
      _ = (q*(d:ℝ)^2/((1-q)^2*V))*u^2 := by
        rw [div_mul_eq_div_div]; ring
      _ ≤ S*v^2 := by gcongr
  rw [divisorDamping_tsum hr hr' _ _ hd]
  change l^2*M*E/(1+S*v^2) ≤ (d:ℝ)⁻¹*x*(q/(1-q))*((1+q)*C)/((1-q)^2+2*q*C)
  rw [class_identity hq hq' du hv hC]
  apply div_le_div₀ (by positivity) hn (by positivity) (by linarith only [hdamping])

/-- Sum the interval estimates for any finite set of positive divisor indices. -/
theorem damping_interval_lower {x r V Vmin l u v : ℝ} (D : Finset ℕ) (M S : ℕ → ℝ)
    (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) (hD : ∀ d ∈ D, 0 < d)
    (hmin : 0 < Vmin) (hV : Vmin ≤ V) (hl : 0 ≤ l) (hlu : l ≤ u) (huv : u ≤ v)
    (hm0 : ∀ d ∈ D, 0 ≤ M d) (hm : ∀ d ∈ D, M d ≤ classVariance x (r^d) d / V)
    (hs : ∀ d ∈ D, r^d*(d:ℝ)^2/((1-r^d)^2*V) ≤ S d) :
    (∑ d ∈ D, l^2*M d*max 0 (1/2-(d:ℝ)^2*v^2/(24*Vmin))/(1+S d*v^2)) ≤
      damping x r (u/sqrt V) :=
  (Finset.sum_le_sum (fun d hd => divisor_interval_lower hr hr' (hD d hd) hmin hV
    hl hlu huv (hm0 d hd) (hm d hd) (hs d hd))).trans
      (divisorDamping_lower hx hr hr' (u/sqrt V) D)

end OrdinaryDarcais
