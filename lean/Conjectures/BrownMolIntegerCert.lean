import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
/-!
Exact Gaussian-integer certificate for Brown–Mol's finite witness. The
rational center is -574755/1000000 + (339879/1000000)i. Integer repeated
squaring proves the value and derivative inequalities without numerical
or native-computation axioms.
-/
namespace BrownInteger
abbrev G := ℤ × ℤ
def gm (a b : G) : G := (a.1*b.1-a.2*b.2,a.1*b.2+a.2*b.1)
def ga (a b : G) : G := (a.1+b.1,a.2+b.2)
def squarePow (a : G) : ℕ → G
  | 0 => a
  | n+1 => gm (squarePow a n) (squarePow a n)
def fast200 (a : G) : G := gm (gm (squarePow a 7) (squarePow a 6)) (squarePow a 3)
def A : G := (1032739220328361878392500521100, -48652745387388357474228112476)
def B : G := (3920708307100856446443356, 37760722562692530965280)
def D : ℤ := 1000000000000000000000000000000
def Q4 : ℤ := 1000000000000000000000000
def VN : G := ga (gm (fast200 A) (Q4,0)) (gm (200*(D^200),0) B)
def VD : ℤ := D^200*Q4
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem re_bound : -VD < 2*VN.1 ∧ 2*VN.1 < VD := by
  constructor <;> decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem im_bound : -VD < 2*VN.2 ∧ 2*VN.2 < VD := by
  constructor <;> decide +kernel
def fast199 (a : G) : G := gm (gm (gm (gm (squarePow a 7) (squarePow a 6)) (squarePow a 2)) (squarePow a 1)) a
def T : G := (-70471556280655010, 145122281601912486)
def R : G := (-1873775, 1699395)
def DN : G := ga (gm (200,0) (gm (fast199 A) (gm T R))) (gm (800*(D^199)*1000000,0) T)
def DD : ℤ := D^199*Q4
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem derivative_bound : 60000*DD < DN.2 := by
  decide +kernel

noncomputable def embed (a : G) : ℂ := (a.1 : ℂ) + (a.2 : ℂ)*Complex.I

theorem embed_ga (a b : G) : embed (ga a b) = embed a + embed b := by
  simp [embed, ga]
  ring

theorem embed_gm (a b : G) : embed (gm a b) = embed a * embed b := by
  simp [embed, gm]
  have hI : Complex.I * Complex.I = -1 := Complex.I_mul_I
  calc
    _ = (a.1 : ℂ)*(b.1 : ℂ) - (a.2 : ℂ)*(b.2 : ℂ) +
        ((a.1 : ℂ)*(b.2 : ℂ) + (a.2 : ℂ)*(b.1 : ℂ))*Complex.I := by rfl
    _ = _ := by linear_combination -(a.2 : ℂ)*(b.2 : ℂ)*hI

theorem embed_squarePow (a : G) (n : ℕ) : embed (squarePow a n) = embed a ^ (2^n) := by
  induction n with
  | zero => simp [squarePow]
  | succ n ih =>
    rw [squarePow, embed_gm, ih, pow_succ, pow_mul]
    ring

theorem embed_fast200 (a : G) : embed (fast200 a) = embed a ^ 200 := by
  simp only [fast200, embed_gm, embed_squarePow]
  norm_num only [show (2 : ℕ)^7 = 128 by norm_num, show (2 : ℕ)^6 = 64 by norm_num,
    show (2 : ℕ)^3 = 8 by norm_num]
  rw [← pow_add, ← pow_add]

theorem embed_fast199 (a : G) : embed (fast199 a) = embed a ^ 199 := by
  simp only [fast199, embed_gm, embed_squarePow]
  norm_num only [show (2 : ℕ)^7 = 128 by norm_num, show (2 : ℕ)^6 = 64 by norm_num,
    show (2 : ℕ)^2 = 4 by norm_num, show (2 : ℕ)^1 = 2 by norm_num]
  rw [← pow_add, ← pow_add, ← pow_add, ← pow_succ]

theorem embed_integer (n : ℤ) : embed (n,0) = (n : ℂ) := by simp [embed]
theorem embed_re (a : G) : (embed a).re = (a.1 : ℝ) := by simp [embed]
theorem embed_im (a : G) : (embed a).im = (a.2 : ℝ) := by simp [embed]

theorem VD_pos : (0 : ℝ) < (VD : ℝ) := by
  simp only [VD, D, Q4, Int.cast_mul, Int.cast_pow, Int.cast_ofNat]
  positivity

theorem DD_pos : (0 : ℝ) < (DD : ℝ) := by
  simp only [DD, D, Q4, Int.cast_mul, Int.cast_pow, Int.cast_ofNat]
  positivity

theorem value_numerator_norm : ‖embed VN‖ < (VD : ℝ) := by
  have hr1 : -(VD : ℝ) < 2*(VN.1 : ℝ) := by
    have h := (Int.cast_lt.mpr re_bound.1 : ((-VD : ℤ) : ℝ) < ((2*VN.1 : ℤ) : ℝ))
    simpa only [Int.cast_neg, Int.cast_mul, Int.cast_ofNat] using h
  have hr2 : 2*(VN.1 : ℝ) < (VD : ℝ) := by
    have h := (Int.cast_lt.mpr re_bound.2 : ((2*VN.1 : ℤ) : ℝ) < (VD : ℝ))
    simpa only [Int.cast_mul, Int.cast_ofNat] using h
  have hi1 : -(VD : ℝ) < 2*(VN.2 : ℝ) := by
    have h := (Int.cast_lt.mpr im_bound.1 : ((-VD : ℤ) : ℝ) < ((2*VN.2 : ℤ) : ℝ))
    simpa only [Int.cast_neg, Int.cast_mul, Int.cast_ofNat] using h
  have hi2 : 2*(VN.2 : ℝ) < (VD : ℝ) := by
    have h := (Int.cast_lt.mpr im_bound.2 : ((2*VN.2 : ℤ) : ℝ) < (VD : ℝ))
    simpa only [Int.cast_mul, Int.cast_ofNat] using h
  have hn := Complex.norm_le_abs_re_add_abs_im (embed VN)
  rw [embed_re, embed_im] at hn
  have hr : |(VN.1 : ℝ)| < (VD : ℝ)/2 := abs_lt.mpr ⟨by linarith, by linarith⟩
  have hi : |(VN.2 : ℝ)| < (VD : ℝ)/2 := abs_lt.mpr ⟨by linarith, by linarith⟩
  linarith

theorem derivative_numerator_norm : (60000 : ℝ)*(DD : ℝ) < ‖embed DN‖ := by
  have hi : (60000 : ℝ)*(DD : ℝ) < (DN.2 : ℝ) := by
    have h := (Int.cast_lt.mpr derivative_bound : ((60000*DD : ℤ) : ℝ) < (DN.2 : ℝ))
    simpa only [Int.cast_mul, Int.cast_ofNat] using h
  have h := Complex.abs_im_le_norm (embed DN)
  rw [embed_im] at h
  have hle : (DN.2 : ℝ) ≤ |(DN.2 : ℝ)| := le_abs_self _
  linarith

noncomputable def c : ℂ := ((-574755 : ℂ)/1000000) + ((339879 : ℂ)/1000000)*Complex.I

theorem A_bridge : embed A = (D : ℂ)*(1+c*(1+c)^4) := by
  apply Complex.ext <;> norm_num [embed, A, D, c, pow_succ,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.I_re, Complex.I_im]

theorem B_bridge : embed B = (Q4 : ℂ)*((1+c)^4+4) := by
  apply Complex.ext <;> norm_num [embed, B, Q4, c, pow_succ,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.I_re, Complex.I_im]

theorem T_bridge : embed T = (1000000 : ℂ)^3*(1+c)^3 := by
  apply Complex.ext <;> norm_num [embed, T, c, pow_succ,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.I_re, Complex.I_im]

theorem R_bridge : embed R = (1000000 : ℂ)*(1+5*c) := by
  apply Complex.ext <;> norm_num [embed, R, c,
    Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.I_re, Complex.I_im]

theorem val_scaling (a b d q : ℂ) :
    (d*a)^200*q + 200*d^200*(q*b) = (d^200*q)*(a^200+200*b) := by
  rw [mul_pow]
  ring

theorem der_scaling (a t r d q : ℂ) :
    200*((d*a)^199*((q^3*t)*(q*r))) + (800*d^199*q)*(q^3*t) =
      (d^199*q^4)*(200*a^199*t*r+800*t) := by
  rw [mul_pow]
  ring

theorem value_bridge : embed VN = (VD : ℂ)*((1+c*(1+c)^4)^200 + 200*((1+c)^4+4)) := by
  simp only [VN, embed_ga, embed_gm, embed_fast200, embed_integer, VD,
    Int.cast_mul, Int.cast_pow, Int.cast_ofNat]
  rw [A_bridge, B_bridge]
  exact val_scaling _ _ _ _

theorem derivative_bridge : embed DN = (DD : ℂ)*
    (200*(1+c*(1+c)^4)^199*(1+c)^3*(1+5*c)+800*(1+c)^3) := by
  simp only [DN, embed_ga, embed_gm, embed_fast199, embed_integer, DD,
    Int.cast_mul, Int.cast_pow, Int.cast_ofNat]
  rw [A_bridge, T_bridge, R_bridge]
  have hq : (Q4 : ℂ) = (1000000 : ℂ)^4 := by norm_num [Q4]
  rw [hq]
  exact der_scaling _ _ _ _ _

theorem value_norm : ‖(1+c*(1+c)^4)^200 + 200*((1+c)^4+4)‖ < 1 := by
  have h := value_numerator_norm
  rw [value_bridge, norm_mul, Complex.norm_intCast, abs_of_pos VD_pos] at h
  have h' : (VD : ℝ)*‖(1+c*(1+c)^4)^200 + 200*((1+c)^4+4)‖ < (VD : ℝ)*1 := by simpa only [mul_one] using h
  exact lt_of_mul_lt_mul_left h' VD_pos.le

theorem derivative_norm : 60000 <
    ‖200*(1+c*(1+c)^4)^199*(1+c)^3*(1+5*c)+800*(1+c)^3‖ := by
  have h := derivative_numerator_norm
  rw [derivative_bridge, norm_mul, Complex.norm_intCast, abs_of_pos DD_pos] at h
  have h' : (DD : ℝ)*60000 < (DD : ℝ)*
      ‖200*(1+c*(1+c)^4)^199*(1+c)^3*(1+5*c)+800*(1+c)^3‖ := by simpa only [mul_comm] using h
  exact lt_of_mul_lt_mul_left h' DD_pos.le
end BrownInteger
