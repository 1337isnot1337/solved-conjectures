module

public import Conjectures.RossiPermutohedronBulkGrid
public import Mathlib.Analysis.SpecialFunctions.Log.Deriv
public import Mathlib.Analysis.Calculus.Deriv.MeanValue

@[expose] public section
namespace RossiPermutohedron
open Set

theorem near_log_plus {u : ℝ} (hu : 0≤u) :
    Real.log (1+u) ≤ u-u^2/(2*(1+u)) := by
  let f : ℝ→ℝ := fun v => v-v^2/(2*(1+v))-Real.log (1+v)
  let g : ℝ→ℝ := fun v => v^2/(2*(1+v)^2)
  have hF (v : ℝ) (hv : 0≤v) : HasDerivAt f (g v) v := by
    have H₁ := hasDerivAt_id v
    have H₂ := H₁.const_add (1:ℝ)
    have H₃ := H₂.const_mul (2:ℝ)
    have hp : 0<1+v := by linarith
    have hP : 2*(1+v)≠0 := by positivity
    have H₄ := (H₁.pow 2).div H₃ hP
    have H₅ := (Real.hasDerivAt_log hp.ne').comp v H₂
    have H := (H₁.sub H₄).sub H₅
    convert H using 1
    · rfl
    · dsimp [g]
      field_simp
      ring
  have hm : MonotoneOn f (Ici (0:ℝ)) := by
    apply monotoneOn_of_hasDerivWithinAt_nonneg (f' := g) (convex_Ici _)
    · intro v hv
      exact (hF v hv).continuousAt.continuousWithinAt
    · intro v hv
      exact (hF v (interior_subset hv)).hasDerivWithinAt
    · intro v _
      dsimp [g]
      positivity
  have h := hm (show (0:ℝ)∈Ici 0 from le_rfl) (show u∈Ici 0 from hu) hu
  have h0 : f 0=0 := by simp [f]
  rw [h0] at h
  exact sub_nonneg.mp h

theorem near_log_minus {u : ℝ} (hu : 0≤u) (hu1 : u<1) :
    Real.log (1-u) ≤ -u-u^2/2 := by
  let f : ℝ→ℝ := fun v => -v-v^2/2-Real.log (1-v)
  let g : ℝ→ℝ := fun v => v^2/(1-v)
  have hF (v : ℝ) (hv : v<1) : HasDerivAt f (g v) v := by
    have H₁ := hasDerivAt_id v
    have H₂ := H₁.const_sub (1:ℝ)
    have hp : 0<1-v := sub_pos.mpr hv
    have H₃ := (H₁.pow 2).div_const (2:ℝ)
    have H₄ := (Real.hasDerivAt_log hp.ne').comp v H₂
    have H := (H₁.neg.sub H₃).sub H₄
    convert H using 1
    · rfl
    · dsimp [g]
      field_simp
      ring
  have hm : MonotoneOn f (Ico (0:ℝ) 1) := by
    apply monotoneOn_of_hasDerivWithinAt_nonneg (f' := g) (convex_Ico _ _)
    · intro v hv
      exact (hF v hv.2).continuousAt.continuousWithinAt
    · intro v hv
      exact (hF v (interior_subset hv).2).hasDerivWithinAt
    · intro v hv
      have hpos : 0<1-v := sub_pos.mpr (interior_subset hv).2
      dsimp [g]
      positivity
  have h := hm (show (0:ℝ)∈Ico 0 1 from ⟨le_rfl,zero_lt_one⟩)
    (show u∈Ico 0 1 from ⟨hu,hu1⟩) hu
  have h0 : f 0=0 := by simp [f]
  rw [h0] at h
  exact sub_nonneg.mp h

theorem cot_lower_from_taylor {θ : ℝ} (h0 : 0<θ) (hθ : θ<Real.pi/2) :
    1/θ-θ/2 ≤ Real.cot θ := by
  have hsin : 0<Real.sin θ := Real.sin_pos_of_pos_of_lt_pi h0 (by linarith [Real.pi_pos])
  have hcos : 0<Real.cos θ := Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos],hθ⟩
  rw [Real.cot_eq_cos_div_sin]
  calc
    _ = (1-θ^2/2)/θ := by field_simp
    _ ≤ Real.cos θ/θ := div_le_div_of_nonneg_right Real.one_sub_sq_div_two_le_cos h0.le
    _ ≤ _ := (div_le_div_iff_of_pos_left hcos h0 hsin).mpr (Real.sin_le h0.le)

theorem grid_coordinate_lower {n j : ℕ} (hj : 0<j) (hhalf : 2*j<n+1) :
    ((n+1:ℕ):ℝ)/(j:ℝ) - Real.pi^2*(j:ℝ)/(2*((n+1:ℕ):ℝ)) ≤
      Real.pi*Real.cot (gridAngle n j) := by
  have G := gridAngle_open_half hj hhalf
  have h := mul_le_mul_of_nonneg_left (cot_lower_from_taylor G.1 G.2) Real.pi_pos.le
  have hJ : (j:ℝ) ≠ 0 := by exact_mod_cast hj.ne'
  have hN : ((n+1:ℕ):ℝ)≠0 := by positivity
  convert h using 1
  unfold gridAngle
  field_simp [Real.pi_ne_zero,hJ,hN]

end RossiPermutohedron
