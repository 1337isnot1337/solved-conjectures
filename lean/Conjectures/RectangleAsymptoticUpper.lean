import Conjectures.RectangleOptimizedUpper

/-! Uniform asymptotic upper estimates in the height and unrestricted regimes. -/
namespace RectangleAsymptoticUpper

open Filter
open scoped Topology

noncomputable def saddle (N : ℝ) : ℝ :=
  Real.sqrt RectangleEuler.basel * Real.sqrt (Real.log N) / (2 * Real.sqrt N)

noncomputable def errorConstant : ℝ :=
  Real.sqrt RectangleEuler.basel * |Real.log (Real.sqrt RectangleEuler.basel / 2)| +
    (3 * RectangleEuler.basel + 4) / Real.sqrt RectangleEuler.basel

lemma saddle_pos {N : ℝ} (hN : 1 < N) : 0 < saddle N := by
  unfold saddle
  exact div_pos
    (mul_pos (Real.sqrt_pos.2 RectangleEuler.basel_pos) (Real.sqrt_pos.2 (Real.log_pos hN)))
    (mul_pos (by norm_num) (Real.sqrt_pos.2 (by linarith)))

lemma saddle_eq (N : ℝ) :
    saddle N = (Real.sqrt RectangleEuler.basel / 2) *
      (Real.sqrt (Real.log N) / Real.sqrt N) := by
  unfold saddle
  ring

lemma saddle_tendsto_zero : Tendsto saddle atTop (𝓝 0) := by
  have hl : Tendsto (fun N : ℝ => Real.log N / N) atTop (𝓝 0) := by
    simpa using Real.tendsto_pow_log_div_mul_add_atTop 1 0 1 (by norm_num : (1 : ℝ) ≠ 0)
  have hs : Tendsto (fun N : ℝ => Real.sqrt (Real.log N / N)) atTop (𝓝 0) := by
    simpa only [Function.comp_def, Real.sqrt_zero] using
      Real.continuous_sqrt.continuousAt.tendsto.comp hl
  have hc : Tendsto (fun N : ℝ => (Real.sqrt RectangleEuler.basel / 2) *
      Real.sqrt (Real.log N / N)) atTop (𝓝 0) := by
    simpa using hs.const_mul (Real.sqrt RectangleEuler.basel / 2)
  apply hc.congr'
  filter_upwards [eventually_gt_atTop (1 : ℝ)] with N hN
  rw [saddle_eq, Real.sqrt_div (Real.log_pos hN).le]

lemma log_inverse_saddle_le {N : ℝ} (hN : 0 < N) (hL : 1 ≤ Real.log N) :
    Real.log (1 / saddle N) ≤ Real.log N / 2 +
      |Real.log (Real.sqrt RectangleEuler.basel / 2)| := by
  have hc : 0 < Real.sqrt RectangleEuler.basel / 2 := by
    exact div_pos (Real.sqrt_pos.2 RectangleEuler.basel_pos) (by norm_num)
  have hr : 0 < Real.sqrt N := Real.sqrt_pos.2 hN
  have hs : 0 < Real.sqrt (Real.log N) := Real.sqrt_pos.2 (by linarith)
  have hs1 : 1 ≤ Real.sqrt (Real.log N) := by simpa using Real.sqrt_le_sqrt hL
  have hls : 0 ≤ Real.log (Real.sqrt (Real.log N)) := Real.log_nonneg hs1
  have ha := neg_le_abs (Real.log (Real.sqrt RectangleEuler.basel / 2))
  rw [saddle_eq, one_div, Real.log_inv,
    Real.log_mul (ne_of_gt hc) (ne_of_gt (div_pos hs hr)),
    Real.log_div (ne_of_gt hs) (ne_of_gt hr), Real.log_sqrt hN.le]
  linarith

lemma saddle_ratio_identity {N L C : ℝ} (hN : 0 < N) (hL : 0 < L) (hC : 0 < C)
    (q D : ℝ) :
    (N*(Real.sqrt C*Real.sqrt L/(2*Real.sqrt N)) +
      (C*q+D)/(2*(Real.sqrt C*Real.sqrt L/(2*Real.sqrt N)))) /
        Real.sqrt (N*L) =
      Real.sqrt C/2+(Real.sqrt C*q+D/Real.sqrt C)/L := by
  let r := Real.sqrt N
  let s := Real.sqrt L
  let c := Real.sqrt C
  have hr : r ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hN)
  have hs : s ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hL)
  have hc : c ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hC)
  have hr2 : r^2=N := Real.sq_sqrt hN.le
  have hs2 : s^2=L := Real.sq_sqrt hL.le
  have hc2 : c^2=C := Real.sq_sqrt hC.le
  rw [Real.sqrt_mul hN.le]
  change (N*(c*s/(2*r))+(C*q+D)/(2*(c*s/(2*r))))/(r*s) = c/2+(c*q+D/c)/L
  rw [←hr2,←hs2,←hc2]
  field_simp

lemma unrestricted_saddle_bound (h w : ℕ) (hN : (0 : ℝ) < (h*w : ℕ))
    (hL : 1 ≤ Real.log (h*w : ℕ)) (ht : saddle (h*w : ℕ) ≤ 1) :
    Real.log (RectanglePartitions.rectangleCount h w : ℝ) ≤
      (Real.sqrt RectangleEuler.basel + errorConstant/Real.log (h*w : ℕ)) *
        Real.sqrt ((h*w : ℕ)*Real.log (h*w : ℕ)) := by
  let N : ℝ := (h*w : ℕ)
  have hN1 : 1 < N := by
    by_contra hn
    have hl := Real.log_nonpos hN.le (le_of_not_gt hn)
    linarith
  have hLN : 0 < Real.log N := by dsimp [N]; linarith
  have hs := saddle_pos hN1
  have hR : 0 < Real.sqrt (N*Real.log N) := Real.sqrt_pos.2 (by positivity)
  have hc : 0 < Real.sqrt RectangleEuler.basel := Real.sqrt_pos.2 RectangleEuler.basel_pos
  have hb := RectanglePartitions.log_rectangleCount_le_unrestricted h w hs ht
  have hi := saddle_ratio_identity hN (by dsimp [N]; linarith : 0 < Real.log N)
    RectangleEuler.basel_pos (Real.log (1/saddle N)) (3*RectangleEuler.basel+4)
  have hl := log_inverse_saddle_le hN hL
  have hratio : Real.log (RectanglePartitions.rectangleCount h w : ℝ)/Real.sqrt (N*Real.log N) ≤
      Real.sqrt RectangleEuler.basel + errorConstant/Real.log N := by
    calc
      _ ≤ (N*saddle N+(RectangleEuler.basel*Real.log (1/saddle N)+
          3*RectangleEuler.basel+4)/(2*saddle N))/Real.sqrt (N*Real.log N) :=
        div_le_div_of_nonneg_right hb hR.le
      _ = Real.sqrt RectangleEuler.basel/2+
          (Real.sqrt RectangleEuler.basel*Real.log (1/saddle N)+
          (3*RectangleEuler.basel+4)/Real.sqrt RectangleEuler.basel)/Real.log N := by
        simpa only [saddle, add_assoc] using hi
      _ ≤ Real.sqrt RectangleEuler.basel/2+
          (Real.sqrt RectangleEuler.basel*(Real.log N/2+
            |Real.log (Real.sqrt RectangleEuler.basel/2)|)+
          (3*RectangleEuler.basel+4)/Real.sqrt RectangleEuler.basel)/Real.log N := by
        apply add_le_add le_rfl
        apply div_le_div_of_nonneg_right _ (by dsimp [N]; linarith)
        exact add_le_add (mul_le_mul_of_nonneg_left hl hc.le) le_rfl
      _ = _ := by
        unfold errorConstant
        field_simp [ne_of_gt hLN, ne_of_gt hc]; ring
  exact (div_le_iff₀ hR).1 hratio

/-- The unrestricted rectangle-product bound has leading constant sqrt(C). -/
theorem eventually_unrestricted_upper {ι : Type*} {l : Filter ι}
    (h w : ι → ℕ)
    (hN : Tendsto (fun x => ((h x*w x : ℕ) : ℝ)) l atTop)
    {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x in l, Real.log (RectanglePartitions.rectangleCount (h x) (w x) : ℝ) ≤
      (Real.sqrt RectangleEuler.basel+ε)*
        Real.sqrt (((h x*w x : ℕ) : ℝ)*Real.log (h x*w x : ℕ)) := by
  have hlog := Real.tendsto_log_atTop.comp hN
  have he := hlog.const_div_atTop errorConstant
  have ht := saddle_tendsto_zero.comp hN
  filter_upwards [hN.eventually (eventually_gt_atTop 0),
    hlog.eventually (eventually_ge_atTop 1),
    (tendsto_order.1 ht).2 1 (by norm_num),
    (tendsto_order.1 he).2 ε hε] with x hNx hLx htx hex
  apply (unrestricted_saddle_bound (h x) (w x) hNx hLx htx.le).trans
  exact mul_le_mul_of_nonneg_right (add_le_add le_rfl hex.le) (Real.sqrt_nonneg _)

noncomputable def heightFactor (h : ℝ) : ℝ :=
  2*Real.sqrt (RectangleEuler.basel*(1+1/Real.log h))

lemma heightFactor_tendsto : Tendsto heightFactor atTop (𝓝 (2*Real.sqrt RectangleEuler.basel)) := by
  change Tendsto (fun h : ℝ => 2*Real.sqrt (RectangleEuler.basel*(1+1/Real.log h)))
    atTop (𝓝 (2*Real.sqrt RectangleEuler.basel))
  have hi := Real.tendsto_log_atTop.const_div_atTop (1 : ℝ)
  have ha : Tendsto (fun h : ℝ => RectangleEuler.basel*(1+1/Real.log h)) atTop
      (𝓝 RectangleEuler.basel) := by
    simpa using ((tendsto_const_nhds : Tendsto (fun _ : ℝ => (1 : ℝ)) atTop
      (𝓝 1)).add hi).const_mul RectangleEuler.basel
  have hs := Real.continuous_sqrt.continuousAt.tendsto.comp ha
  simpa only [Function.comp_def] using hs.const_mul 2

lemma height_factor_bound (h w : ℕ) (hh : 1 < h) (hw : 0 < w) :
    Real.log (RectanglePartitions.rectangleCount h w : ℝ) ≤
      heightFactor h * Real.sqrt ((h*w : ℕ)*Real.log h) := by
  have hh0 : 0 < h := by omega
  have hN : (0 : ℝ) < (h*w : ℕ) := by exact_mod_cast Nat.mul_pos hh0 hw
  have hL : 0 < Real.log (h : ℝ) := Real.log_pos (by exact_mod_cast hh)
  have hH := RectangleEuler.harmonicSum_le h
  have hA : 0 ≤ RectangleEuler.basel*(1+1/Real.log (h : ℝ)) :=
    mul_nonneg RectangleEuler.basel_pos.le (by positivity)
  have hb := RectanglePartitions.log_rectangleCount_le_sqrt_harmonic h w hh0 hw
  calc
    Real.log (RectanglePartitions.rectangleCount h w : ℝ) ≤
        2*Real.sqrt ((h*w : ℕ)*RectangleEuler.basel*RectangleEuler.harmonicSum h) := hb
    _ ≤ 2*Real.sqrt ((h*w : ℕ)*RectangleEuler.basel*(1+Real.log h)) := by
      apply mul_le_mul_of_nonneg_left _ (by norm_num)
      apply Real.sqrt_le_sqrt
      exact mul_le_mul_of_nonneg_left hH (mul_nonneg hN.le RectangleEuler.basel_pos.le)
    _ = heightFactor h * Real.sqrt ((h*w : ℕ)*Real.log h) := by
      unfold heightFactor
      rw [show 2*Real.sqrt (RectangleEuler.basel*(1+1/Real.log (h : ℝ))) *
          Real.sqrt ((h*w : ℕ)*Real.log h) =
          2*(Real.sqrt (RectangleEuler.basel*(1+1/Real.log (h : ℝ))) *
          Real.sqrt ((h*w : ℕ)*Real.log h)) by ring,
        ←Real.sqrt_mul hA]
      congr 2
      field_simp [ne_of_gt hL]; ring

/-- The bounded-height upper estimate has leading constant 2sqrt(C). -/
theorem eventually_height_upper {ι : Type*} {l : Filter ι}
    (h w : ι → ℕ) (hh : Tendsto h l atTop) (hw : ∀ᶠ x in l, 0 < w x)
    {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ x in l, Real.log (RectanglePartitions.rectangleCount (h x) (w x) : ℝ) ≤
      (2*Real.sqrt RectangleEuler.basel+ε)*
        Real.sqrt (((h x*w x : ℕ) : ℝ)*Real.log (h x)) := by
  have hhR : Tendsto (fun x => (h x : ℝ)) l atTop := tendsto_natCast_atTop_atTop.comp hh
  have hf := heightFactor_tendsto.comp hhR
  filter_upwards [hh.eventually (eventually_gt_atTop 1), hw,
    (tendsto_order.1 hf).2 (2*Real.sqrt RectangleEuler.basel+ε) (by linarith)] with x hx hwx hfx
  apply (height_factor_bound (h x) (w x) hx hwx).trans
  exact mul_le_mul_of_nonneg_right hfx.le (Real.sqrt_nonneg _)

end RectangleAsymptoticUpper
