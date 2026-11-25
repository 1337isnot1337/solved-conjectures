module

public import Conjectures.RossiPermutohedronNearGrid
public import Conjectures.RossiPermutohedronCentral
public import Conjectures.RossiPermutohedronReflection

@[expose] public section
namespace RossiPermutohedron

noncomputable def gridCoordinate (n j : ℕ) : ℝ := Real.pi*Real.cot (gridAngle n j)
noncomputable def gridSample (n j : ℕ) : ℝ := -Real.exp (-gridCoordinate n j)

theorem gridAngle_range {n j : ℕ} (hj : 0<j) (hjn : j≤n) :
    0<gridAngle n j ∧ gridAngle n j<Real.pi := by
  have hc : 0<((n+1:ℕ):ℝ) := by positivity
  have hπ := Real.pi_pos
  unfold gridAngle
  constructor
  · positivity
  · apply (div_lt_iff₀ hc).mpr
    exact mul_lt_mul_of_pos_left (by exact_mod_cast (show j<n+1 by omega)) hπ

theorem gridAngle_strictMono {n j k : ℕ} (hjk : j<k) : gridAngle n j<gridAngle n k := by
  have hπ := Real.pi_pos
  have hN : 0<((n+1:ℕ):ℝ) := by positivity
  apply (div_lt_div_iff_of_pos_right hN).mpr
  exact mul_lt_mul_of_pos_left (by exact_mod_cast hjk) hπ

theorem cot_neg_of_grid_reflected {n j : ℕ} (hj : j≤n+1) :
    gridCoordinate n (n+1-j)= -gridCoordinate n j := by
  have hA : gridAngle n (n+1-j)=Real.pi-gridAngle n j := by
    unfold gridAngle
    rw [Nat.cast_sub hj]
    field_simp
  unfold gridCoordinate
  rw [hA,Real.cot_eq_cos_div_sin,Real.cos_pi_sub,Real.sin_pi_sub,neg_div,
    ←Real.cot_eq_cos_div_sin,mul_neg]

theorem gridCoordinate_zero_of_middle {n j : ℕ} (hj : 2*j=n+1) :
    gridCoordinate n j=0 := by
  have hA : gridAngle n j=Real.pi/2 := by
    have h : 2*(j:ℝ)=((n+1:ℕ):ℝ) := by exact_mod_cast hj
    unfold gridAngle
    field_simp
    nlinarith [congrArg (fun x : ℝ => Real.pi*x) h]
  unfold gridCoordinate
  rw [hA,Real.cot_eq_cos_div_sin,Real.cos_pi_div_two,zero_div,mul_zero]

theorem cot_decreasing_open {a b : ℝ} (ha : 0<a) (hb : b<Real.pi) (hab : a<b) :
    Real.cot b < Real.cot a := by
  have hsa := Real.sin_pos_of_pos_of_lt_pi ha (hab.trans hb)
  have hsb := Real.sin_pos_of_pos_of_lt_pi (ha.trans hab) hb
  have hs : 0<Real.sin (b-a) := Real.sin_pos_of_pos_of_lt_pi (sub_pos.mpr hab) (by linarith)
  rw [Real.cot_eq_cos_div_sin,Real.cot_eq_cos_div_sin]
  apply (div_lt_div_iff₀ hsb hsa).mpr
  rw [Real.sin_sub] at hs
  nlinarith

theorem gridSample_decreasing {n j k : ℕ} (hj : 0<j) (hjk : j<k) (hk : k≤n) :
    gridSample n k < gridSample n j := by
  have hG := cot_decreasing_open (gridAngle_range hj (hjk.le.trans hk)).1
    (gridAngle_range (hj.trans hjk) hk).2 (gridAngle_strictMono (n := n) hjk)
  have hx : gridCoordinate n k<gridCoordinate n j := mul_lt_mul_of_pos_left hG Real.pi_pos
  unfold gridSample
  have he := Real.exp_lt_exp.mpr (neg_lt_neg hx)
  exact neg_lt_neg he

theorem phaseSign_of_positive {j : ℕ} (hj : 0<j) :
    -((-1:ℝ)^j)=(-1:ℝ)^(j-1) := by
  have hEq : j=(j-1)+1 := by omega
  calc
    _ = -((-1:ℝ)^((j-1)+1)) := by rw [←hEq]
    _ = _ := by rw [pow_succ]; ring

theorem gridValue_only_positive_half {n j : ℕ} (hn : 128≤n) (hj : 2≤j)
    (hhalf : 2*j<n+1) :
    1<(-1:ℝ)^(j-1)*gridValue n (gridCoordinate n j) := by
  by_cases hnear : 9*j^2≤n
  · exact gridValue_signed_of_near_index hn hj hnear
  · have h := gridValue_signed_of_bulk_index hn (lt_of_not_ge hnear) hhalf
    rw [phaseSign_of_positive (by omega : 0<j)] at h
    exact h

theorem gridValue_only_middle {n j : ℕ} (hn : 128≤n) (hj : 0<j) (hm : 2*j=n+1) :
    1<(-1:ℝ)^(j-1)*gridValue n (gridCoordinate n j) := by
  rw [gridCoordinate_zero_of_middle hm,← phaseSign_of_positive hj]
  cases n with
  | zero => omega
  | succ n =>
    exact gridValue_signed_center hn hm

theorem phaseSign_reflection {n j : ℕ} (hj : 0<j) (hjn : j≤n) :
    (-1:ℝ)^((n+1-j)-1)*(-1)^(n-1)=(-1)^(j-1) := by
  rw [←pow_add,show n+1-j-1+(n-1)=(j-1)+2*(n-j) by omega,pow_add,pow_mul]
  norm_num

theorem gridValue_reflection_index {n j : ℕ} (hn : 0<n) (hj : 0<j) (hjn : j≤n) :
    (-1:ℝ)^((n+1-j)-1)*gridValue n (gridCoordinate n (n+1-j)) =
      (Real.exp (gridCoordinate n j))^n*((-1:ℝ)^(j-1)*gridValue n (gridCoordinate n j)) := by
  rw [cot_neg_of_grid_reflected hjn.step]
  have hr : gridValue n (-gridCoordinate n j) =
      (-1:ℝ)^(n-1)*(Real.exp (gridCoordinate n j))^n*gridValue n (gridCoordinate n j) := by
    cases n with
    | zero => omega
    | succ n => simpa using gridValue_reflection n (gridCoordinate (n+1) j)
  rw [hr]
  have hphase := phaseSign_reflection hj hjn
  linear_combination
    ((Real.exp (gridCoordinate n j))^n*gridValue n (gridCoordinate n j))*hphase

theorem pole_coordinate_first_gt_one {n : ℕ} (hn : 128≤n) : 1<gridCoordinate n 1 := by
  have h := grid_coordinate_lower (j := 1) (n := n) (by omega) (by omega)
  have hp : Real.pi^2≤(16:ℝ) := by
    have hh := pow_le_pow_left₀ Real.pi_pos.le Real.pi_lt_four.le 2
    norm_num at hh ⊢
    exact hh
  have hN : 128≤((n+1:ℕ):ℝ) := by exact_mod_cast (show 128≤n+1 by omega)
  have hN' : 0<((n+1:ℕ):ℝ) := by positivity
  have hu : Real.pi^2/(2*((n+1:ℕ):ℝ))≤1 := by
    apply (div_le_iff₀ (by positivity : 0<2*((n+1:ℕ):ℝ))).mpr
    linarith
  norm_num at h
  push_cast at hN hu
  change 1<Real.pi*Real.cot (gridAngle n 1)
  linarith

theorem gridValue_only_reflected_half {n j : ℕ} (hn : 128≤n) (_hj : 2≤j) (hjn : j≤n)
    (hhalf : n+1<2*j) :
    1<(-1:ℝ)^(j-1)*gridValue n (gridCoordinate n j) := by
  let k := n+1-j
  have hk : 0<k := by dsimp [k]; omega
  have hkn : k≤n := by dsimp [k]; omega
  have hkhalf : 2*k<n+1 := by dsimp [k]; omega
  have hr := gridValue_reflection_index (n := n) (j := k) (by omega) hk hkn
  rw [show n+1-k=j by dsimp [k]; omega] at hr
  rw [hr]
  have hE : 1≤Real.exp (gridCoordinate n k) :=
    Real.one_le_exp_iff.mpr (grid_coordinate_bound hk hkhalf).1.le
  by_cases h : 2≤k
  · have hv := gridValue_only_positive_half hn h hkhalf
    exact hv.trans_le (le_mul_of_one_le_left (zero_lt_one.trans hv).le (one_le_pow₀ hE))
  · have he : k=1 := by omega
    rw [he]
    have hg := gridValue_nearSigned_half (j := 1) (n := n) (by omega) (by omega)
    norm_num at hg
    have he2 : (2:ℝ)<Real.exp (gridCoordinate n 1) :=
      Real.exp_one_gt_two.trans (Real.exp_lt_exp.mpr (pole_coordinate_first_gt_one hn))
    have hpow : (2:ℝ)<(Real.exp (gridCoordinate n 1))^n := by
      have hE2 : 1≤Real.exp (gridCoordinate n 1) := by linarith
      exact he2.trans_le (by simpa using pow_le_pow_right₀ hE2 (show 1≤n by omega))
    have hu : (1:ℝ)/2<gridValue n (gridCoordinate n 1) := hg
    norm_num
    nlinarith [mul_pos (sub_pos.mpr hpow) (sub_pos.mpr hu)]

end RossiPermutohedron
