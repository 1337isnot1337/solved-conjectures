module

public import Conjectures.RossiPermutohedronNearEstimates
public import Conjectures.RossiPermutohedronNearSeries
public import Mathlib.Analysis.Complex.ExponentialBounds

@[expose] public section
namespace RossiPermutohedron

theorem near_index_half {n j : ℕ} (hj : 0<j) (hnear : 9*j^2≤n) :
    2*j<n+1 := by
  have h1 : j≤j*j := by
    simpa using Nat.mul_le_mul_right j (show 1≤j by omega)
  rw [pow_two] at hnear
  omega

theorem near_grid_right_ratio {n j : ℕ} (hj : 0<j) (hnear : 9*j^2≤n) :
    (((j:ℝ)+1)/(j:ℝ))^n * Real.exp (-(Real.pi*Real.cot (gridAngle n j))) < 1/4 := by
  let x := Real.pi*Real.cot (gridAngle n j)
  let J : ℝ := j
  let N : ℝ := (n+1:ℕ)
  have hJ : 0<J := by dsimp [J]; exact_mod_cast hj
  have hJ1 : 1≤J := by dsimp [J]; exact_mod_cast (show 1≤j by omega)
  have hN : 0<N := by dsimp [N]; positivity
  have hnear' : 9*J^2≤(n:ℝ) := by dsimp [J]; exact_mod_cast hnear
  have hhalf := near_index_half hj hnear
  have hx := grid_coordinate_lower hj hhalf
  change N/J-Real.pi^2*J/(2*N)≤x at hx
  have hbase : (J+1)/J = 1+1/J := by field_simp [hJ.ne']
  have hcorr : (1/J)^2/(2*(1+1/J))=1/(2*J*(J+1)) := by
    have h : 1+1/J≠0 := by positivity
    field_simp [hJ.ne']
  have hl := near_log_plus (show 0≤1/J by positivity)
  rw [hcorr] at hl
  have hm : (9/4:ℝ)≤(n:ℝ)/(2*J*(J+1)) := by
    apply (le_div_iff₀ (show 0<2*J*(J+1) by positivity)).mpr
    nlinarith [mul_nonneg (sub_nonneg.mpr hJ1) hJ.le]
  have hpi : Real.pi^2 ≤ (10:ℝ) := by
    have hh := pow_le_pow_left₀ Real.pi_pos.le Real.pi_lt_d2.le 2
    norm_num at hh
    linarith
  have hJN : 9*J≤N := by
    have he : N=(n:ℝ)+1 := by simp [N]
    nlinarith [mul_nonneg (sub_nonneg.mpr hJ1) hJ.le]
  have hec : Real.pi^2*J/(2*N)≤(5:ℝ)/9 := by
    apply (div_le_iff₀ (show 0<2*N by positivity)).mpr
    nlinarith [mul_le_mul_of_nonneg_right hpi hJ.le]
  have hcancel : (n:ℝ)*(1/J)-N/J=-(1/J) := by
    dsimp [N]
    push_cast
    ring
  have hlog : (n:ℝ)*Real.log ((J+1)/J)-x < -(3:ℝ)/2 := by
    rw [hbase]
    have hM := mul_le_mul_of_nonneg_left hl (show 0≤(n:ℝ) by positivity)
    have hM' : (n:ℝ)*(1/(2*J*(J+1))) = (n:ℝ)/(2*J*(J+1)) := by ring
    rw [mul_sub,hM'] at hM
    linarith [show (0:ℝ)≤1/J by positivity]
  have hlog4 : Real.log (4:ℝ)<3/2 := by
    rw [show (4:ℝ)=2*2 by norm_num,Real.log_mul (by norm_num) (by norm_num)]
    linarith [Real.log_two_lt_d9]
  have hr := Real.exp_lt_exp.mpr hlog
  rw [Real.exp_sub,Real.exp_nat_mul,Real.exp_log (div_pos (by positivity) hJ),
    div_eq_mul_inv,←Real.exp_neg] at hr
  have hh := (Real.exp_lt_exp.mpr (show -(3:ℝ)/2 < -Real.log 4 by linarith))
  rw [Real.exp_neg,Real.exp_log (by norm_num : (0:ℝ)<4)] at hh
  exact hr.trans (by simpa using hh)

theorem near_grid_left_ratio {n j : ℕ} (hj : 2≤j) (hnear : 9*j^2≤n) :
    ((((j:ℝ)-1)/(j:ℝ))^n) * Real.exp (Real.pi*Real.cot (gridAngle n j)) < 1/16 := by
  let J : ℝ := j
  let x := Real.pi*Real.cot (gridAngle n j)
  let N : ℝ := (n+1:ℕ)
  have hJ : 0<J := by dsimp [J]; exact_mod_cast (show 0<j by omega)
  have hJ2 : 2≤J := by dsimp [J]; exact_mod_cast hj
  have hhalf := near_index_half (by omega : 0<j) hnear
  have hx := (grid_coordinate_bound (by omega : 0<j) hhalf).2
  change x≤N/J at hx
  have hnear' : 9*J^2≤(n:ℝ) := by dsimp [J]; exact_mod_cast hnear
  have hB : (J-1)/J=1-1/J := by field_simp
  have h1 : (1:ℝ)/J≤1/2 := (div_le_div_iff_of_pos_left (by norm_num) hJ (by norm_num)).mpr hJ2
  have hl := near_log_minus (show 0≤1/J by positivity) (by linarith)
  have hm : (9/2:ℝ) ≤ (n:ℝ)/(2*J^2) := by
    apply (le_div_iff₀ (by positivity : 0<2*J^2)).mpr
    linarith
  have hcancel : -(n:ℝ)*(1/J)+N/J=1/J := by
    dsimp [N]
    push_cast
    ring
  have hlog : (n:ℝ)*Real.log ((J-1)/J)+x≤-4 := by
    rw [hB]
    have hM := mul_le_mul_of_nonneg_left hl (show 0≤(n:ℝ) by positivity)
    have hM' : (n:ℝ)*((1/J)^2/2)=(n:ℝ)/(2*J^2) := by
      field_simp
    rw [mul_sub,hM',mul_neg] at hM
    linarith
  have hh := Real.exp_le_exp.mpr hlog
  rw [Real.exp_add,Real.exp_nat_mul,Real.exp_log (div_pos (by linarith) hJ)] at hh
  have hlog16 : Real.log (16:ℝ)<4 := by
    rw [show (16:ℝ)=(2:ℝ)^4 by norm_num,Real.log_pow]
    push_cast
    linarith [Real.log_two_lt_d9]
  have hL := Real.exp_lt_exp.mpr (show (-4:ℝ) < -Real.log 16 by linarith)
  rw [Real.exp_neg (Real.log 16),Real.exp_log (by norm_num : (0:ℝ)<16)] at hL
  exact hh.trans_lt (by simpa using hL)

end RossiPermutohedron
