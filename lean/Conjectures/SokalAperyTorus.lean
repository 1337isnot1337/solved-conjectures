import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Inverse
import Mathlib.Tactic

/-! The range and critical values of the real torus argument in the Apéry proof. -/

namespace SokalApery

open Real

/-- The argument of the Legendre polynomial on the real torus, with r = √x. -/
noncomputable def torus (r a b : ℝ) : ℝ :=
  1 + 8 * (r * cos a) ^ 2 + 8 * (r * cos a) * cos b

def saddleValue (r : ℝ) : ℝ := 1 + 8 * r ^ 2 - 8 * r

theorem saddleValue_mem_Ioo {r : ℝ} (hr₀ : 0 < r) (hr₁ : r < 1) (hr : r ≠ 1 / 2) :
    saddleValue r ∈ Set.Ioo (-1 : ℝ) 1 := by
  unfold saddleValue
  exact ⟨by nlinarith [sq_pos_of_ne_zero (sub_ne_zero.mpr hr)],
    by nlinarith [mul_pos hr₀ (sub_pos.mpr hr₁)]⟩

theorem torus_at_zero_pi (r : ℝ) : torus r 0 π = saddleValue r := by
  simp [torus, saddleValue, sub_eq_add_neg]

private theorem torus_lower_by_abs (r a b : ℝ) :
    (-1 : ℝ) + 8 * (|r * cos a| - 1 / 2) ^ 2 ≤ torus r a b := by
  have h : -|r * cos a| ≤ (r * cos a) * cos b := by
    calc
      -|r * cos a| ≤ -(|r * cos a| * |cos b|) := by
        apply neg_le_neg
        simpa only [mul_one] using mul_le_mul_of_nonneg_left
          (abs_le.mpr ⟨neg_one_le_cos b, cos_le_one b⟩) (abs_nonneg _)
      _ = -|r * cos a * cos b| := by simp only [abs_mul]
      _ ≤ _ := neg_abs_le _
  unfold torus
  nlinarith only [h, sq_abs (r * cos a)]

theorem torus_neg_one_le (r a b : ℝ) : -1 ≤ torus r a b := by
  have h := torus_lower_by_abs r a b
  linarith [sq_nonneg (|r * cos a| - 1 / 2)]

/-- Below the exceptional parameter, the saddle height is the actual minimum. -/
theorem torus_min_of_le_half {r : ℝ} (hr : 0 ≤ r) (hr' : r ≤ 1 / 2) (a b : ℝ) :
    saddleValue r ≤ torus r a b := by
  have habs : |r * cos a| ≤ r := by
    rw [abs_mul, abs_of_nonneg hr]
    simpa only [mul_one] using mul_le_mul_of_nonneg_left
      (abs_le.mpr ⟨neg_one_le_cos a, cos_le_one a⟩) hr
  have hsq := pow_le_pow_left₀ (show 0 ≤ 1 / 2 - r by linarith)
    (show 1 / 2 - r ≤ 1 / 2 - |r * cos a| by linarith) 2
  have h := torus_lower_by_abs r a b
  unfold saddleValue
  nlinarith

/-- At and above the exceptional parameter, the lower endpoint is -1. -/
theorem torus_attains_neg_one {r : ℝ} (hr : 1 / 2 ≤ r) : ∃ a b, torus r a b = -1 := by
  have hr₀ : 0 < r := by linarith
  let u := 1 / (2 * r)
  have hu : 0 ≤ u := by dsimp [u]; positivity
  have hu' : u ≤ 1 := (div_le_iff₀ (by positivity)).mpr (by linarith)
  refine ⟨arccos u, π, ?_⟩
  rw [torus, cos_arccos (by linarith) hu', cos_pi]
  have he : r * u = 1 / 2 := by dsimp [u]; field_simp
  rw [he]
  norm_num

theorem torus_deriv_first (r a b : ℝ) :
    HasDerivAt (fun t => torus r t b) (-8 * r * sin a * (2 * r * cos a + cos b)) a := by
  have hu := (hasDerivAt_cos a).const_mul r
  have hd := (((hu.pow 2).const_mul 8).const_add 1).add ((hu.const_mul 8).mul_const (cos b))
  convert hd using 1
  · rfl
  · ring

theorem torus_deriv_second (r a b : ℝ) :
    HasDerivAt (torus r a) (-8 * r * cos a * sin b) b := by
  have hd := ((hasDerivAt_cos b).const_mul (8 * (r * cos a))).const_add
    (1 + 8 * (r * cos a) ^ 2)
  convert hd using 1
  · rfl
  · ring

/-- Every critical value of the torus function is one of the four values
listed in the written proof. -/
theorem torus_critical_values {r a b : ℝ} (hr : 0 < r)
    (ha : deriv (fun t => torus r t b) a = 0) (hb : deriv (torus r a) b = 0) :
    torus r a b = -1 ∨ torus r a b = 1 ∨ torus r a b = saddleValue r ∨
      torus r a b = 1 + 8 * r ^ 2 + 8 * r := by
  rw [(torus_deriv_first r a b).deriv] at ha
  rw [(torus_deriv_second r a b).deriv] at hb
  have ha' : sin a = 0 ∨ 2 * r * cos a + cos b = 0 := by
    simpa [mul_eq_zero, hr.ne'] using ha
  have hb' : cos a = 0 ∨ sin b = 0 := by
    simpa [mul_eq_zero, hr.ne'] using hb
  rcases hb' with hca | hsb
  · exact Or.inr (Or.inl (by simp [torus, hca]))
  · have hcb : cos b = 1 ∨ cos b = -1 := by
      have hb₂ : cos b ^ 2 = 1 := by simpa [hsb] using sin_sq_add_cos_sq b
      exact sq_eq_one_iff.mp hb₂
    rcases ha' with hsa | hrel
    · have hca : cos a = 1 ∨ cos a = -1 := by
        have ha₂ : cos a ^ 2 = 1 := by simpa [hsa] using sin_sq_add_cos_sq a
        exact sq_eq_one_iff.mp ha₂
      rcases hca with hca | hca <;> rcases hcb with hcb | hcb
      · right; right; right
        simp [torus, hca, hcb]
      · right; right; left
        simp [torus, saddleValue, hca, hcb, sub_eq_add_neg]
      · right; right; left
        simp [torus, saddleValue, hca, hcb, sub_eq_add_neg]
      · right; right; right
        simp [torus, hca, hcb]
    · left
      rcases hcb with hcb | hcb <;> rw [hcb] at hrel <;>
        have he : r * cos a = -cos b / 2 := by rw [hcb]; linarith only [hrel]
      all_goals rw [torus, he, hcb]; norm_num

/-- The two diagonal entries at the saddle have opposite signs for r > 1/2. -/
theorem torus_saddle_second_derivatives (r : ℝ) :
    deriv (deriv (fun t => torus r t π)) 0 = -8 * r * (2 * r - 1) ∧
      deriv (deriv (torus r 0)) π = 8 * r := by
  have he : deriv (fun t => torus r t π) =
      fun a => -8 * r * sin a * (2 * r * cos a + cos π) :=
    funext fun a => (torus_deriv_first r a π).deriv
  have hf : deriv (torus r 0) = fun b => (-8 * r * cos 0) * sin b :=
    funext fun b => (torus_deriv_second r 0 b).deriv
  have hd := (((hasDerivAt_sin 0).const_mul (-8 * r)).mul
    (((hasDerivAt_cos 0).const_mul (2 * r)).add_const (cos π))).deriv
  have hg := ((hasDerivAt_sin π).const_mul (-8 * r * cos 0)).deriv
  rw [he, hf]
  constructor
  · change deriv ((fun t => -8 * r * sin t) * (fun t => 2 * r * cos t + cos π)) 0 = _
    rw [hd]
    simp [sub_eq_add_neg]
  · rw [hg]
    simp

end SokalApery
