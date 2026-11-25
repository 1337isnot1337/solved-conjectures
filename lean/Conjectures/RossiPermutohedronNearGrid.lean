module

public import Conjectures.RossiPermutohedronNearRatios
public import Conjectures.RossiPermutohedronNearDominance

@[expose] public section
namespace RossiPermutohedron

theorem near_grid_neighbor_right {n j : ℕ} (hj : 0<j) (hn : 9*j^2≤n) {m : ℕ}
    (hm : j≤m) :
    nearTerm n (Real.pi*Real.cot (gridAngle n j)) (m+1) ≤
      (1:ℝ)/4 * nearTerm n (Real.pi*Real.cot (gridAngle n j)) m := by
  let x := Real.pi*Real.cot (gridAngle n j)
  have hm0 : 0<m := hj.trans_le hm
  have hJ : (0:ℝ)<j := by exact_mod_cast hj
  have hM : (0:ℝ)<m := by exact_mod_cast hm0
  have hMJ : (j:ℝ)≤m := by exact_mod_cast hm
  have hfrac : ((m:ℝ)+1)/(m:ℝ) ≤ ((j:ℝ)+1)/(j:ℝ) := by
    apply (div_le_div_iff₀ hM hJ).mpr
    nlinarith only [hMJ]
  have hpow := pow_le_pow_left₀ (show 0≤((m:ℝ)+1)/(m:ℝ) by positivity) hfrac n
  have hcoef : (((m:ℝ)+1)/(m:ℝ))^n*Real.exp (-x) ≤ 1/4 :=
    (mul_le_mul_of_nonneg_right hpow (Real.exp_pos _).le).trans
      (near_grid_right_ratio hj hn).le
  change nearTerm n x (m+1) ≤ 1/4*nearTerm n x m
  rw [nearTerm_ratio_right n x hm0]
  exact mul_le_mul_of_nonneg_right hcoef (nearTerm_pos n x hm0).le

theorem near_grid_neighbor_left {n j : ℕ} (hn : 9*j^2≤n) {m : ℕ}
    (hm0 : 0<m) (hm : m<j) :
    nearTerm n (Real.pi*Real.cot (gridAngle n j)) m ≤
      (1:ℝ)/16 * nearTerm n (Real.pi*Real.cot (gridAngle n j)) (m+1) := by
  let x := Real.pi*Real.cot (gridAngle n j)
  have hj : 2≤j := by omega
  have hJ : (0:ℝ)<j := by exact_mod_cast (show 0<j by omega)
  have hMJ : (m:ℝ)+1≤j := by exact_mod_cast (show m+1≤j by omega)
  have hfrac : (m:ℝ)/((m:ℝ)+1) ≤ ((j:ℝ)-1)/(j:ℝ) := by
    apply (div_le_div_iff₀ (by positivity) hJ).mpr
    nlinarith only [hMJ]
  have hpow := pow_le_pow_left₀ (show 0≤(m:ℝ)/((m:ℝ)+1) by positivity) hfrac n
  have hcoef : ((m:ℝ)/((m:ℝ)+1))^n*Real.exp x ≤ 1/16 :=
    (mul_le_mul_of_nonneg_right hpow (Real.exp_pos _).le).trans (near_grid_left_ratio hj hn).le
  change nearTerm n x m ≤ 1/16*nearTerm n x (m+1)
  rw [nearTerm_ratio_left n x m]
  exact mul_le_mul_of_nonneg_right hcoef (nearTerm_pos n x (by omega : 0<m+1)).le

theorem gridValue_nearSigned_half {n j : ℕ} (hj : 0<j) (hn : 9*j^2≤n) :
    (j:ℝ)^n*Real.exp (-((j:ℝ)-1)*(Real.pi*Real.cot (gridAngle n j)))/2 <
      (-1:ℝ)^(j-1)*gridValue n (Real.pi*Real.cot (gridAngle n j)) := by
  let x := Real.pi*Real.cot (gridAngle n j)
  let a : ℕ→ℝ := fun m => nearTerm n x (m+1)
  have hx : 0<x := (grid_coordinate_bound hj (near_index_half hj hn)).1
  have h0 (m : ℕ) : 0≤a m := (nearTerm_pos n x (by omega : 0<m+1)).le
  have hk : 0<a (j-1) := nearTerm_pos n x (by omega)
  have ha : Summable a := (summable_nat_add_iff 1).mpr (nearTerm_summable n hx)
  have hR (m : ℕ) (hm : j-1≤m) : a (m+1)≤(1:ℝ)/4*a m :=
    near_grid_neighbor_right hj hn (show j≤m+1 by omega)
  have hL (m : ℕ) (hm : m<j-1) : a m≤(1:ℝ)/16*a (m+1) :=
    near_grid_neighbor_left hn (show 0<m+1 by omega) (show m+1<j by omega)
  have h := near_alternating_dominance a (j-1) h0 hk ha hR hL
  have hE : 0<Real.exp x := Real.exp_pos _
  have hU : 1≤(1+Real.exp (-x))^(n+2) :=
    one_le_pow₀ (le_add_of_nonneg_right (Real.exp_pos _).le)
  have hS : 0<Real.exp x*(1+Real.exp (-x))^(n+2) :=
    mul_pos hE (zero_lt_one.trans_le hU)
  have hAJ : a (j-1)=(j:ℝ)^n*Real.exp (-(j:ℝ)*x) := by
    unfold a
    rw [show j-1+1=j by omega,nearTerm]
  have hA : (j:ℝ)^n*Real.exp (-((j:ℝ)-1)*x)/2=Real.exp x*(a (j-1)/2) := by
    rw [hAJ,show -((j:ℝ)-1)*x=x+(-(j:ℝ)*x) by ring,Real.exp_add]
    ring
  rw [gridValue_near_real_series n hx]
  change _ < (-1:ℝ)^(j-1)*( (Real.exp x*(1+Real.exp (-x))^(n+2))* ∑' m : ℕ,(-1:ℝ)^m*a m)
  rw [hA]
  calc
    _ ≤ (Real.exp x*(1+Real.exp (-x))^(n+2))*(a (j-1)/2) := by
      apply mul_le_mul_of_nonneg_right _ (by exact div_nonneg hk.le (by norm_num))
      simpa using mul_le_mul_of_nonneg_left hU hE.le
    _ < (Real.exp x*(1+Real.exp (-x))^(n+2))*
          ((-1:ℝ)^(j-1)* ∑' m : ℕ,(-1:ℝ)^m*a m) := mul_lt_mul_of_pos_left h hS
    _ = _ := by ring

theorem near_margin_of_index {n j : ℕ} (hn : 128≤n) (hj : 2≤j) (ha : 9*j^2≤n) :
    2 < (j:ℝ)^n*Real.exp (-((j:ℝ)-1)*(Real.pi*Real.cot (gridAngle n j))) := by
  let J : ℝ := j
  let x := Real.pi*Real.cot (gridAngle n j)
  have hJ2 : 2≤J := by dsimp [J]; exact_mod_cast hj
  have hJ : 0<J := by linarith
  have hN : 128≤(n:ℝ) := by exact_mod_cast hn
  have hX := (grid_coordinate_bound (by omega : 0<j) (near_index_half (by omega) ha)).2
  change x≤((n+1:ℕ):ℝ)/J at hX
  have hlog := Real.one_sub_inv_le_log_of_pos (show 0<J/2 by positivity)
  rw [Real.log_div hJ.ne' (by norm_num), inv_div, show (2:ℝ)/J=2*(1/J) by ring] at hlog
  have hJinv : (1:ℝ)/J≤1/2 := (div_le_div_iff_of_pos_left (by norm_num) hJ (by norm_num)).mpr hJ2
  have hLg : 1/6 < Real.log J-1+1/J := by
    linarith [Real.log_two_gt_d9]
  have hB : (J-1)*x ≤ (J-1)*(((n+1:ℕ):ℝ)/J) :=
    mul_le_mul_of_nonneg_left hX (by linarith)
  have hEq : (J-1)*(((n+1:ℕ):ℝ)/J) = ((n:ℝ)+1)*(1-1/J) := by
    push_cast
    field_simp
  rw [hEq] at hB
  have hn' : 0<(n:ℝ) := by linarith
  have hP := mul_lt_mul_of_pos_left hLg hn'
  have hZ : Real.log 2 < (n:ℝ)*Real.log J-((J-1)*x) := by
    nlinarith [Real.log_two_lt_d9,show 0≤(1:ℝ)/J by positivity]
  have h := Real.exp_lt_exp.mpr hZ
  rw [Real.exp_log (by norm_num),Real.exp_sub,Real.exp_nat_mul,Real.exp_log hJ,
    div_eq_mul_inv,←Real.exp_neg] at h
  simpa only [neg_mul] using h

theorem gridValue_signed_of_near_index {n j : ℕ} (hn : 128≤n) (hj : 2≤j) (ha : 9*j^2≤n) :
    1<(-1:ℝ)^(j-1)*gridValue n (Real.pi*Real.cot (gridAngle n j)) := by
  have h := gridValue_nearSigned_half (by omega : 0<j) ha
  have hm := near_margin_of_index hn hj ha
  have he : 1 < (j:ℝ)^n*Real.exp (-((j:ℝ)-1)*(Real.pi*Real.cot (gridAngle n j)))/2 := by
    linarith
  exact he.trans h

end RossiPermutohedron
