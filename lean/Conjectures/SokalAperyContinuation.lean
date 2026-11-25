import Conjectures.SokalAperyMoments
import Mathlib.Analysis.SpecialFunctions.Complex.Analytic
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv
import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Analysis.Complex.Convex

/-! The inverse Joukowski coordinate in the Stieltjes obstruction. -/

namespace SokalApery

open Set Filter Complex MeasureTheory
open scoped Topology

private noncomputable def principalSqrt (z : ℂ) : ℂ := z ^ (2 : ℂ)⁻¹

private theorem principalSqrt_sq (z : ℂ) : principalSqrt z ^ 2 = z :=
  Complex.cpow_ofNat_inv_pow z 2

private theorem principalSqrt_re_pos {z : ℂ} (hz : z ∈ slitPlane) :
    0 < (principalSqrt z).re := by
  have harg : z.arg < Real.pi :=
    (lt_of_le_of_ne (arg_le_pi z) (slitPlane_arg_ne_pi hz))
  rw [principalSqrt, show (2 : ℂ)⁻¹ = ((1 / 2 : ℝ) : ℂ) by norm_num, cpow_ofReal_re]
  exact mul_pos (Real.rpow_pos_of_pos (norm_pos_iff.mpr (slitPlane_ne_zero hz)) _)
    (Real.cos_pos_of_mem_Ioo ⟨by linarith [neg_pi_lt_arg z], by linarith⟩)

private theorem principalSqrt_analyticAt {z : ℂ} (hz : z ∈ slitPlane) :
    AnalyticAt ℂ principalSqrt z := by
  have hf : AnalyticAt ℂ (fun w : ℂ => exp (log w * (2 : ℂ)⁻¹)) z :=
    analyticAt_cexp.comp ((analyticAt_clog hz).mul analyticAt_const)
  have he : ∀ᶠ w : ℂ in 𝓝 z, w ∈ slitPlane := isOpen_slitPlane.mem_nhds hz
  exact hf.congr (he.mono fun w hw => (cpow_def_of_ne_zero (slitPlane_ne_zero hw) _).symm)

/-- The inverse of w = (z + z⁻¹)/2 on the upper half-plane. -/
noncomputable def inverseJoukowski (w : ℂ) : ℂ :=
  w - I * principalSqrt (1 - w ^ 2)

private theorem one_sub_sq_mem_slitPlane {w : ℂ} (hw : 0 < w.im) :
    1 - w ^ 2 ∈ slitPlane := by
  rw [mem_slitPlane_iff]
  simp only [sub_re, one_re, pow_two, mul_re, sub_im, one_im, mul_im]
  by_cases he : w.re = 0
  · left; nlinarith only [he, sq_nonneg w.im]
  · right
    intro h
    exact (mul_ne_zero he hw.ne') (by linarith only [h, mul_comm w.re w.im])

theorem inverseJoukowski_analyticAt {w : ℂ} (hw : 1 - w ^ 2 ∈ slitPlane) :
    AnalyticAt ℂ inverseJoukowski w := by
  have ha : AnalyticAt ℂ (fun z : ℂ => 1 - z ^ 2) w :=
    analyticAt_const.sub (analyticAt_id.pow 2)
  have hc := (principalSqrt_analyticAt hw).comp (f := fun z : ℂ => 1 - z ^ 2) ha
  exact analyticAt_id.sub (analyticAt_const.mul hc)

private theorem inverseJoukowski_mul (w : ℂ) :
    inverseJoukowski w * (2 * w - inverseJoukowski w) = 1 := by
  have h := principalSqrt_sq (1 - w ^ 2)
  unfold inverseJoukowski
  calc
    _ = w ^ 2 + I ^ 2 * principalSqrt (1 - w ^ 2) ^ 2 * (-1) := by ring
    _ = _ := by rw [I_sq, h]; ring

theorem inverseJoukowski_ne_zero (w : ℂ) : inverseJoukowski w ≠ 0 := by
  intro hz
  simpa [hz] using inverseJoukowski_mul w

theorem inverseJoukowski_equation (w : ℂ) :
    inverseJoukowski w + (inverseJoukowski w)⁻¹ = 2 * w := by
  have h := inverseJoukowski_mul w
  have hj : 2 * w - inverseJoukowski w = (inverseJoukowski w)⁻¹ :=
    mul_left_cancel₀ (inverseJoukowski_ne_zero w)
      (h.trans (mul_inv_cancel₀ (inverseJoukowski_ne_zero w)).symm)
  rw [← hj]
  ring

theorem inverseJoukowski_im_neg {w : ℂ} (hw : 0 < w.im) :
    (inverseJoukowski w).im < 0 := by
  let v := principalSqrt (1 - w ^ 2)
  have hv : 0 < v.re := principalSqrt_re_pos (one_sub_sq_mem_slitPlane hw)
  have he : v ^ 2 = 1 - w ^ 2 := principalSqrt_sq _
  have hre := congrArg Complex.re he
  have him := congrArg Complex.im he
  simp only [pow_two, mul_re, sub_re, one_re] at hre
  simp only [pow_two, mul_im, sub_im, one_im] at him
  have hp : (v.re ^ 2 - w.im ^ 2) * (v.re ^ 2 + w.re ^ 2) = v.re ^ 2 := by
    have hr := congrArg (fun z : ℝ => z * v.re ^ 2) hre
    have hi : v.re * v.im = -(w.re * w.im) := by linarith [mul_comm v.re v.im, mul_comm w.re w.im]
    have hi' := congrArg (fun z : ℝ => z ^ 2) hi
    nlinarith only [hr, hi']
  have hsq : w.im ^ 2 < v.re ^ 2 :=
    sub_pos.mp (pos_of_mul_pos_left (hp ▸ sq_pos_of_pos hv) (by positivity))
  have hl : w.im < v.re := by
    by_contra! h
    exact hsq.not_ge (pow_le_pow_left₀ hv.le h 2)
  change (w - I * v).im < 0
  simpa [sub_im, mul_im] using sub_neg.mpr hl

theorem inverseJoukowski_norm_lt_one {w : ℂ} (hw : 0 < w.im) :
    ‖inverseJoukowski w‖ < 1 := by
  let z := inverseJoukowski w
  have hz : z.im < 0 := inverseJoukowski_im_neg hw
  have hq : 0 < normSq z := normSq_pos.mpr (inverseJoukowski_ne_zero w)
  have he := congrArg Complex.im (inverseJoukowski_equation w)
  change (z + z⁻¹).im = (2 * w).im at he
  norm_num [add_im, inv_im, mul_im] at he
  have h : z.im * (normSq z - 1) = (2 * w.im) * normSq z := by
    field_simp at he
    linarith only [he]
  have hs : normSq z - 1 < 0 := by
    by_contra! hge
    have hle := mul_nonpos_of_nonpos_of_nonneg hz.le hge
    have hpos := mul_pos (mul_pos (by norm_num : (0 : ℝ) < 2) hw) hq
    linarith only [h, hle, hpos]
  rw [normSq_eq_norm_sq] at hs
  nlinarith only [hs, norm_nonneg z]

theorem inverseJoukowski_real_boundary {s : ℝ} (hs : s ∈ Ioo (-1 : ℝ) 1) :
    inverseJoukowski (s : ℂ) = (s : ℂ) - I * (Real.sqrt (1 - s ^ 2) : ℂ) := by
  have hp : 0 ≤ 1 - s ^ 2 := by
    have h₁ : 0 < 1 + s := by linarith [hs.1]
    have h₂ : 0 < 1 - s := by linarith [hs.2]
    nlinarith only [mul_pos h₁ h₂]
  unfold inverseJoukowski principalSqrt
  rw [← Complex.ofReal_one, ← Complex.ofReal_pow, ← Complex.ofReal_sub,
    show (2 : ℂ)⁻¹ = ((1 / 2 : ℝ) : ℂ) by norm_num, ← Complex.ofReal_cpow hp,
    ← Real.sqrt_eq_rpow]

/-- The moment transform in the Joukowski coordinate. -/
noncomputable def pulledBackMoment (ν : Measure ℝ) (w : ℂ) : ℂ :=
  principalSqrt (2 * inverseJoukowski w) * momentTransform ν (inverseJoukowski w)

private theorem pulledBackMoment_analyticAt {ν : Measure ℝ} {a : ℕ → ℝ}
    (hν : Represents ν a) {w : ℂ} (hw : 1 - w ^ 2 ∈ slitPlane)
    (hz : (inverseJoukowski w).im < 0) : AnalyticAt ℂ (pulledBackMoment ν) w := by
  have ha := inverseJoukowski_analyticAt hw
  have hb : 2 * inverseJoukowski w ∈ slitPlane := by
    apply mem_slitPlane_iff.mpr
    right
    simp [mul_im, hz.ne]
  have hc : AnalyticAt ℂ (fun z => 2 * inverseJoukowski z) w := analyticAt_const.mul ha
  exact ((principalSqrt_analyticAt hb).comp (f := fun z => 2 * inverseJoukowski z) hc).mul
    ((momentTransform_analyticAt hν (Or.inl hz.ne)).comp (f := inverseJoukowski) ha)

/-- Under the Stieltjes hypothesis the transformed moment function is analytic even at
the real parameters inside the Joukowski cut. -/
theorem pulledBackMoment_analyticAt_boundary {ν : Measure ℝ} {a : ℕ → ℝ}
    (hν : Represents ν a) {s : ℝ} (hs : s ∈ Ioo (-1 : ℝ) 1) :
    AnalyticAt ℂ (pulledBackMoment ν) (s : ℂ) := by
  have hp : 0 < 1 - s ^ 2 := by
    have h₁ : 0 < 1 + s := by linarith [hs.1]
    have h₂ : 0 < 1 - s := by linarith [hs.2]
    nlinarith only [mul_pos h₁ h₂]
  have hz : (inverseJoukowski (s : ℂ)).im < 0 := by
    rw [inverseJoukowski_real_boundary hs]
    simp [sub_im, mul_im, Real.sqrt_pos.mpr hp]
  apply pulledBackMoment_analyticAt hν _ hz
  rw [← Complex.ofReal_one, ← Complex.ofReal_pow, ← Complex.ofReal_sub]
  exact ofReal_mem_slitPlane.mpr hp

/-- The half-power kernel used for the torus distribution. -/
noncomputable def halfTransform (μ : Measure ℝ) (w : ℂ) : ℂ :=
  ∫ t : ℝ, (w - (t : ℂ)) ^ ((-1 / 2 : ℝ) : ℂ) ∂μ

private theorem sub_real_mem_slitPlane {w : ℂ} (hw : 0 < w.im) (t : ℝ) :
    w - (t : ℂ) ∈ slitPlane := by
  exact mem_slitPlane_iff.mpr (Or.inr (by simpa using hw.ne'))

private theorem continuous_sub_real_cpow {w : ℂ} (hw : 0 < w.im) (c : ℂ) :
    Continuous (fun t : ℝ => (w - (t : ℂ)) ^ c) := by
  apply continuous_iff_continuousAt.mpr
  intro t
  have hc : ContinuousAt (fun q : ℝ => w - (q : ℂ)) t :=
    (continuous_const.sub Complex.continuous_ofReal).continuousAt
  exact (continuousAt_cpow_const (b := c) (sub_real_mem_slitPlane hw t)).comp
    (f := fun q : ℝ => w - (q : ℂ)) hc

theorem halfTransform_analyticOnNhd (μ : Measure ℝ) [IsFiniteMeasure μ] :
    AnalyticOnNhd ℂ (halfTransform μ) {w | 0 < w.im} := by
  apply DifferentiableOn.analyticOnNhd _ (isOpen_lt continuous_const continuous_im)
  intro w hw
  change 0 < w.im at hw
  let c : ℂ := ((-1 / 2 : ℝ) : ℂ)
  let S : Set ℂ := {z | w.im / 2 < z.im}
  have hs : S ∈ 𝓝 w := (isOpen_lt continuous_const continuous_im).mem_nhds
    (show w.im / 2 < w.im by linarith)
  have hlim (z : ℂ) (hz : 0 < z.im) (t : ℝ) : z.im ≤ ‖z - (t : ℂ)‖ := by
    simpa [sub_im, abs_of_pos hz] using abs_im_le_norm (z - (t : ℂ))
  have hF : Integrable (fun t : ℝ => (w - (t : ℂ)) ^ c) μ := by
    apply Integrable.of_bound (continuous_sub_real_cpow hw c).aestronglyMeasurable
      (w.im ^ (-1 / 2 : ℝ))
    filter_upwards [] with t
    rw [show c = ((-1 / 2 : ℝ) : ℂ) from rfl, norm_cpow_real]
    exact Real.rpow_le_rpow_of_nonpos hw (hlim w hw t) (by norm_num)
  have hderiv := (hasDerivAt_integral_of_dominated_loc_of_deriv_le
      (μ := μ) (x₀ := w) (F := fun z (t : ℝ) => (z - (t : ℂ)) ^ c)
      (F' := fun z t => c * (z - (t : ℂ)) ^ (c - 1))
      (bound := fun _ => ‖c‖ * (w.im / 2) ^ (-3 / 2 : ℝ)) hs
      ?_ hF ((continuous_sub_real_cpow hw (c - 1)).const_mul c).aestronglyMeasurable
      ?_ (integrable_const _) ?_).2
  · exact hderiv.differentiableAt.differentiableWithinAt
  · filter_upwards [hs] with z hz
    exact (continuous_sub_real_cpow (by change w.im / 2 < z.im at hz; linarith) c).aestronglyMeasurable
  · filter_upwards [] with t z hz
    change w.im / 2 < z.im at hz
    rw [norm_mul, show c - 1 = ((-3 / 2 : ℝ) : ℂ) by dsimp [c]; norm_num, norm_cpow_real]
    apply mul_le_mul_of_nonneg_left _ (norm_nonneg c)
    exact Real.rpow_le_rpow_of_nonpos (by linarith)
      (hz.le.trans (hlim z (by linarith) t)) (by norm_num)
  · filter_upwards [] with t z hz
    change w.im / 2 < z.im at hz
    have hpos : 0 < z.im := by linarith
    have hd := ((hasDerivAt_id z).sub_const (t : ℂ)).cpow_const (c := c)
      (sub_real_mem_slitPlane hpos t)
    simpa only [mul_one, id_eq] using hd

/-- A local identification of the torus kernel with the pulled-back moment transform
forces analytic extension at every point inside the real cut. -/
theorem halfTransform_extends_of_germ {μ ν : Measure ℝ} [IsFiniteMeasure μ] {a : ℕ → ℝ}
    (hν : Represents ν a) {w₀ : ℂ} (hw₀ : 0 < w₀.im)
    (hg : halfTransform μ =ᶠ[𝓝 w₀] pulledBackMoment ν)
    {s : ℝ} (hs : s ∈ Ioo (-1 : ℝ) 1) :
    ∃ H : ℂ → ℂ, AnalyticAt ℂ H (s : ℂ) ∧ EqOn (halfTransform μ) H {w | 0 < w.im} := by
  refine ⟨pulledBackMoment ν, pulledBackMoment_analyticAt_boundary hν hs, ?_⟩
  apply AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq (halfTransform_analyticOnNhd μ) _
    (convex_halfSpace_im_gt 0).isPreconnected hw₀ hg
  intro w hw
  exact pulledBackMoment_analyticAt hν (one_sub_sq_mem_slitPlane hw) (inverseJoukowski_im_neg hw)

end SokalApery
