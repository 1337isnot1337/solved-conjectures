module

public import Conjectures.RossiPermutohedronBulkTail
public import Conjectures.RossiPermutohedronBulkMagnitude
public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds

@[expose] public section
namespace RossiPermutohedron
open Complex
open scoped Nat

theorem nearest_scale_norm (θ : ℝ) (hs : 0<Real.sin θ) {j N : ℕ}
    (hθ : (N:ℝ)*θ=j*Real.pi) :
    (‖oddPole (Real.pi*Real.cot θ) 0‖^N)⁻¹=(Real.sin θ/Real.pi)^N := by
  rw [← poleTerm_norm, poleTerm,nearest_individual_eval θ hs hθ,Complex.norm_real,Real.norm_eq_abs]
  rw [abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul, abs_of_pos]
  exact pow_pos (div_pos hs Real.pi_pos) _

theorem pole_sum_signed_gt {N j : ℕ} (hN : 128≤N) (θ : ℝ)
    (hs : 0<Real.sin θ) (hθ : (N:ℝ)*θ=j*Real.pi)
    (hx : ‖oddPole (Real.pi*Real.cot θ) 0‖^2 ≤ 10*(N:ℝ)) :
    (‖oddPole (Real.pi*Real.cot θ) 0‖^N)⁻¹ <
      (-1:ℝ)^j * (∑' k : ℤ,poleTerm N (Real.pi*Real.cot θ) k).re := by
  let x := Real.pi*Real.cot θ
  let a := (‖oddPole x 0‖^N)⁻¹
  let s := (-1:ℝ)^j
  let T := ∑' m : ℕ,pairTailTerm N x m
  have hT : ‖T‖ < a := paired_bulk_tail_lt hN hx
  have hAbs : |s*T.re| < a := by
    rw [abs_mul,show |s|=1 by simp [s,abs_pow],one_mul]
    exact (Complex.abs_re_le_norm T).trans_lt hT
  have hPhase (j : ℕ) : (-1:ℝ)^j*(-1)^j=1 := by rw [← mul_pow]; norm_num
  have ha : a=(Real.sin θ/Real.pi)^N := nearest_scale_norm θ hs hθ
  have hp : (poleTerm N x 0+poleTerm N x (-1)).re=2*s*a := by
    rw [ha]
    exact nearest_pair_eval θ hs hθ
  change a<s*(∑' k : ℤ,poleTerm N x k).re
  rw [pole_sum_split hN hx,Complex.add_re,hp,mul_add]
  have hss : s*s=1 := hPhase j
  have he : s*(2*s*a)=2*a := by linear_combination 2*a*hss
  rw [he]
  linarith [(abs_lt.mp hAbs).1]

/-- The original bulk sign has a strict margin at a point for which the
phase and radius conditions have been certified and x is positive. -/
theorem gridValue_bulk_signed {n j : ℕ} (hn : 128≤n+1) (θ : ℝ)
    (hs : 0<Real.sin θ) (hθ : ((n+2:ℕ):ℝ)*θ=j*Real.pi)
    (hx : 0<Real.pi*Real.cot θ)
    (hrad : ‖oddPole (Real.pi*Real.cot θ) 0‖^2 ≤ 10*((n+2:ℕ):ℝ)) :
    1 < -((-1:ℝ)^j) * gridValue (n+1) (Real.pi*Real.cot θ) := by
  let x := Real.pi*Real.cot θ
  let R := ‖oddPole x 0‖
  let S := (∑' k : ℤ,poleTerm (n+2) x k).re
  let s := (-1:ℝ)^j
  let fac : ℝ := (n+1)!
  let C := Real.exp x*(1+Real.exp (-x))^(n+3)
  have hrad' : R^2≤11*((n+1:ℕ):ℝ) := by
    have hm : (10:ℝ)≤((n+1:ℕ):ℝ) := by exact_mod_cast (show 10≤n+1 by omega)
    change R^2 ≤ _ at hrad
    push_cast at hrad hm ⊢
    linarith
  have hP : R^(n+2) < fac := power_lt_factorial_of_normSq_le hn (norm_nonneg _) hrad'
  have hf : 0<fac := by dsimp [fac]; positivity
  have hz : 0<R^(n+2) := pow_pos (oddPole_near_norm_pos x) _
  have h1 : 1<fac*(R^(n+2))⁻¹ := by
    rw [←div_eq_mul_inv]
    exact (lt_div_iff₀ hz).mpr (by simpa using hP)
  have hp := pole_sum_signed_gt (N := n+2) (j := j) (by omega) θ hs hθ hrad
  have h2 : 1<fac*(s*S) := h1.trans (mul_lt_mul_of_pos_left hp hf)
  have hC : 1≤C := by
    have hd : 1≤1+Real.exp (-x) := le_add_of_nonneg_right (Real.exp_pos _).le
    have hE : 1≤Real.exp x := Real.one_le_exp_iff.mpr hx.le
    exact one_le_mul_of_one_le_of_one_le hE (one_le_pow₀ hd)
  have ht := h2.trans_le (le_mul_of_one_le_left (zero_lt_one.trans h2).le hC)
  rw [gridValue_bulk_expansion n hx]
  convert ht using 1
  change -s * -(C*fac*S) = C*(fac*(s*S))
  ring

noncomputable def gridAngle (n j : ℕ) : ℝ :=
  Real.pi*(j:ℝ)/((n+1:ℕ):ℝ)

theorem gridAngle_mul (n j : ℕ) : ((n+1:ℕ):ℝ)*gridAngle n j=j*Real.pi := by
  unfold gridAngle
  field_simp

theorem gridAngle_open_half {n j : ℕ} (hj : 0<j) (hhalf : 2*j<n+1) :
    0<gridAngle n j ∧ gridAngle n j<Real.pi/2 := by
  have hN : 0<((n+1:ℕ):ℝ) := by positivity
  have hπ := Real.pi_pos
  constructor
  · unfold gridAngle
    positivity
  · unfold gridAngle
    apply (div_lt_iff₀ hN).mpr
    have hJ : 2*(j:ℝ)<((n+1:ℕ):ℝ) := by exact_mod_cast hhalf
    have ht := mul_lt_mul_of_pos_left hJ hπ
    linarith only [ht]

theorem grid_coordinate_bound {n j : ℕ} (hj : 0<j) (hhalf : 2*j<n+1) :
    0 < Real.pi*Real.cot (gridAngle n j) ∧
      Real.pi*Real.cot (gridAngle n j) ≤ ((n+1:ℕ):ℝ)/(j:ℝ) := by
  let θ := gridAngle n j
  have hh := gridAngle_open_half hj hhalf
  have hsin : 0<Real.sin θ := Real.sin_pos_of_pos_of_lt_pi hh.1 (by linarith [hh.2,Real.pi_pos])
  have hcos : 0<Real.cos θ := Real.cos_pos_of_mem_Ioo ⟨by linarith [hh.1,Real.pi_pos],hh.2⟩
  have htan : θ≤Real.sin θ/Real.cos θ := by
    rw [← Real.tan_eq_sin_div_cos]
    exact (Real.lt_tan hh.1 hh.2).le
  have hmt : θ*Real.cos θ≤Real.sin θ := (le_div_iff₀ hcos).mp htan
  have hJ : (0:ℝ)<j := by exact_mod_cast hj
  change 0 < Real.pi*Real.cot θ ∧ Real.pi*Real.cot θ ≤ _
  rw [Real.cot_eq_cos_div_sin]
  refine ⟨mul_pos Real.pi_pos (div_pos hcos hsin),?_⟩
  have hh' : (Real.pi*Real.cos θ)*(j:ℝ) ≤ Real.sin θ*((n+1:ℕ):ℝ) := by
    have hm := mul_le_mul_of_nonneg_right hmt (show 0≤((n+1:ℕ):ℝ) by positivity)
    have he := gridAngle_mul n j
    change ((n+1:ℕ):ℝ)*θ=(j:ℝ)*Real.pi at he
    nlinarith only [hm,congrArg (fun y : ℝ => y*Real.cos θ) he]
  rw [←mul_div_assoc]
  apply (div_le_div_iff₀ hsin hJ).mpr
  simpa [mul_comm] using hh'

theorem bulk_radius_of_index {n j : ℕ} (hn : 128≤n) (hj : n<9*j^2)
    (hhalf : 2*j<n+1) :
    ‖oddPole (Real.pi*Real.cot (gridAngle n j)) 0‖^2 ≤ 10*((n+1:ℕ):ℝ) := by
  have hj0 : 0<j := by
    by_contra! hr
    have he : j=0 := by omega
    simp [he] at hj
  have hJ : 0<(j:ℝ) := by exact_mod_cast hj0
  have hN : (128:ℝ)≤n := by exact_mod_cast hn
  have hNp : 0<(n:ℝ) := by linarith
  have hp : (n:ℝ)<9*(j:ℝ)^2 := by exact_mod_cast hj
  have hx := grid_coordinate_bound hj0 hhalf
  have h2 : (((n+1:ℕ):ℝ)/(j:ℝ))^2≤9*(((n+1:ℕ):ℝ)^2)/(n:ℝ) := by
    rw [div_pow]
    apply (div_le_div_iff₀ (pow_pos hJ _) hNp).mpr
    nlinarith [mul_nonneg (sub_nonneg.mpr hp.le) (sq_nonneg (((n+1:ℕ):ℝ)))]
  have h3 : 9*(((n+1:ℕ):ℝ)^2)/(n:ℝ) ≤ 9*((n+1:ℕ):ℝ)+10 := by
    apply (div_le_iff₀ hNp).mpr
    push_cast
    nlinarith
  have hpi : Real.pi^2≤(10:ℝ) := by
    have h := pow_le_pow_left₀ Real.pi_pos.le Real.pi_lt_d2.le 2
    norm_num at h
    linarith
  rw [oddPole_normSq_zero]
  have ht := (sq_le_sq₀ hx.1.le (by positivity)).mpr hx.2
  have ha : (128:ℝ)≤((n+1:ℕ):ℝ) := by push_cast; linarith
  linarith [ht.trans (h2.trans h3)]

theorem gridValue_signed_of_bulk_index {n j : ℕ} (hn : 128≤n) (hj : n<9*j^2)
    (hhalf : 2*j<n+1) :
    1 < -((-1:ℝ)^j)*gridValue n (Real.pi*Real.cot (gridAngle n j)) := by
  have hj0 : 0<j := by
    by_contra! hr
    have he : j=0 := by omega
    simp [he] at hj
  have gh := gridAngle_open_half hj0 hhalf
  have hs : 0<Real.sin (gridAngle n j) :=
    Real.sin_pos_of_pos_of_lt_pi gh.1 (by linarith [gh.2,Real.pi_pos])
  have hx := (grid_coordinate_bound hj0 hhalf).1
  have hrad := bulk_radius_of_index hn hj hhalf
  cases n with
  | zero => omega
  | succ n =>
    exact gridValue_bulk_signed hn (gridAngle (n+1) j) hs (gridAngle_mul (n+1) j) hx hrad

end RossiPermutohedron
