module

public import Conjectures.RossiPermutohedronBulkGrid
public import Mathlib.Analysis.Normed.Group.FunctionSeries

@[expose] public section
namespace RossiPermutohedron
open Complex Filter Set
open scoped Nat Topology

theorem oddPole_ne_zero (x : ℝ) (k : ℤ) : oddPole x k≠0 := by
  intro h
  have H := congrArg Complex.im h
  simp [oddPole,Complex.mul_im,Complex.mul_re] at H
  have hC : ((2*k+1 : ℤ):ℝ)=0 := by push_cast; exact H
  have hz : 2*k+1=0 := by exact_mod_cast hC
  omega

theorem continuous_poleTerm (N : ℕ) (k : ℤ) :
    Continuous (fun x : ℝ => poleTerm N x k) := by
  unfold poleTerm
  apply Continuous.div continuous_const (by unfold oddPole; fun_prop)
  exact fun x => pow_ne_zero _ (oddPole_ne_zero x k)

theorem pi_le_near_norm (x : ℝ) : Real.pi≤‖oddPole x 0‖ := by
  apply (sq_le_sq₀ Real.pi_pos.le (norm_nonneg _)).mp
  rw [oddPole_normSq_zero]
  nlinarith [sq_nonneg x]

theorem bulk_radius_near_zero {N : ℕ} (hN : 128≤N) {x : ℝ}
    (hx : x∈Ioo (-1:ℝ) 1) : ‖oddPole x 0‖^2 ≤ 10*(N:ℝ) := by
  have hp : Real.pi^2≤(16:ℝ) := by
    have h := pow_le_pow_left₀ Real.pi_pos.le Real.pi_lt_four.le 2
    norm_num at h ⊢
    exact h
  have hX : x^2≤1 := by
    have hA : |x|≤1 := abs_le.mpr ⟨hx.1.le,hx.2.le⟩
    have hS := pow_le_pow_left₀ (abs_nonneg _) hA 2
    simpa [sq_abs] using hS
  have hn : (128:ℝ)≤N := by exact_mod_cast hN
  rw [oddPole_normSq_zero]
  linarith

theorem pole_sum_continuousOn_near_zero {N : ℕ} (hN : 128≤N) :
    ContinuousOn (fun x : ℝ => ∑' k : ℤ,poleTerm N x k) (Ioo (-1:ℝ) 1) := by
  have hB : ContinuousOn (fun x : ℝ => ∑' m : ℕ,pairTailTerm N x m) (Ioo (-1:ℝ) 1) := by
    have hS := (reciprocalDrop_hasSum.mul_left (Real.pi^N)⁻¹).summable
    refine continuousOn_tsum (fun i => ?_) hS ?_
    · exact ((continuous_poleTerm N _).add (continuous_poleTerm N _)).continuousOn
    · intro m x hx
      apply (pairTailTerm_norm_lt hN (bulk_radius_near_zero hN hx) m).le.trans
      apply mul_le_mul_of_nonneg_right _ (reciprocalDrop_nonneg m)
      exact inv_anti₀ (pow_pos Real.pi_pos _) (pow_le_pow_left₀ Real.pi_pos.le (pi_le_near_norm x) _)
  have hC := (continuous_poleTerm N 0).add (continuous_poleTerm N (-1))
  refine (hC.continuousOn.add hB).congr ?_
  intro x hx
  exact pole_sum_split hN (bulk_radius_near_zero hN hx)

theorem gridValue_bulk_expansion_zero {n : ℕ} (hn : 128≤n+1) :
    gridValue (n+1) 0 = -((2:ℝ)^(n+3)*((n+1)!:ℝ) *
      (∑' k : ℤ,poleTerm (n+2) 0 k).re) := by
  let G : ℝ→ℝ := fun x => -((Real.exp x)*(1+Real.exp (-x))^(n+3)*((n+1)!:ℝ)*
    (∑' k : ℤ,poleTerm (n+2) x k).re)
  have hF : ContinuousAt (gridValue (n+1)) 0 := by
    unfold gridValue
    fun_prop
  have hD : ContinuousAt (fun x : ℝ => ∑' k : ℤ,poleTerm (n+2) x k) 0 :=
    (pole_sum_continuousOn_near_zero (by omega : 128≤n+2)).continuousAt
      (isOpen_Ioo.mem_nhds ⟨by norm_num,by norm_num⟩)
  have hG : ContinuousAt G 0 := by unfold G; fun_prop
  have he : (gridValue (n+1)) =ᶠ[nhdsWithin 0 (Ioi 0)] G := by
    filter_upwards [self_mem_nhdsWithin] with y hy
    exact gridValue_bulk_expansion n hy
  have : (nhdsWithin (0:ℝ) (Ioi 0)).NeBot := nhdsWithin_Ioi_neBot le_rfl
  have heq := tendsto_nhds_unique_of_eventuallyEq hF.continuousWithinAt hG.continuousWithinAt he
  have hG0 : G 0 = -((2:ℝ)^(n+3)*((n+1)!:ℝ)*(∑' k : ℤ,poleTerm (n+2) 0 k).re) := by
    dsimp only [G]
    rw [neg_zero, Real.exp_zero, show (1:ℝ)+1=2 by norm_num, one_mul]
  exact heq.trans hG0

set_option maxRecDepth 4000 in
/-- The exceptional middle point, where the positive-coordinate expansion
must first be extended to zero by continuity. -/
theorem gridValue_signed_center {n j : ℕ} (hn : 128≤n+1) (hj : 2*j=n+2) :
    1 < -((-1:ℝ)^j)*gridValue (n+1) 0 := by
  let θ := Real.pi/2
  have hx : Real.pi*Real.cot θ=0 := by
    dsimp [θ]
    rw [Real.cot_eq_cos_div_sin,Real.cos_pi_div_two,zero_div,mul_zero]
  have hs : 0<Real.sin θ := by simp [θ]
  have hθ : ((n+2:ℕ):ℝ)*θ=j*Real.pi := by
    have hi : 2*(j:ℝ)=((n+2:ℕ):ℝ) := by exact_mod_cast hj
    dsimp [θ]
    nlinarith [congrArg (fun y : ℝ => y*Real.pi) hi]
  have hr : ‖oddPole (Real.pi*Real.cot θ) 0‖^2 ≤10*((n+2:ℕ):ℝ) := by
    rw [hx]
    exact bulk_radius_near_zero (N := n+2) (x := 0) (by omega) ⟨by norm_num,by norm_num⟩
  have hp := pole_sum_signed_gt (N := n+2) (j := j) (by omega) θ hs hθ hr
  rw [hx] at hp
  let R := ‖oddPole 0 0‖
  let s := (-1:ℝ)^j
  let fac : ℝ := (n+1)!
  let A := (∑' k : ℤ,poleTerm (n+2) 0 k).re
  have hRad : R^2≤11*((n+1:ℕ):ℝ) := by
    have hL : (10:ℝ)≤((n+1:ℕ):ℝ) := by exact_mod_cast (show 10≤n+1 by omega)
    rw [hx] at hr
    change R^2 ≤ _ at hr
    push_cast at hr hL ⊢
    linarith
  have hPow : R^(n+2)<fac := power_lt_factorial_of_normSq_le hn (norm_nonneg _) hRad
  have h1 : 1<fac*(R^(n+2))⁻¹ := by
    rw [←div_eq_mul_inv]
    exact (lt_div_iff₀ (pow_pos (oddPole_near_norm_pos 0) _)).mpr (by simpa using hPow)
  have h2 : 1<fac*(s*A) := h1.trans (mul_lt_mul_of_pos_left hp (by dsimp [fac]; positivity))
  have hc : 1 ≤ (2:ℝ)^(n+3) := one_le_pow₀ (by norm_num)
  have hm := h2.trans_le (le_mul_of_one_le_left (zero_lt_one.trans h2).le hc)
  rw [gridValue_bulk_expansion_zero hn]
  change 1 < -s*(-((2:ℝ)^(n+3)*fac*A))
  convert hm using 1
  ring

end RossiPermutohedron
