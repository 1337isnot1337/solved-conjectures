module

public import Conjectures.RossiPermutohedronCotEulerian

@[expose] public section
namespace RossiPermutohedron
open Complex
open scoped UpperHalfPlane Nat

local notation "UHP" => UpperHalfPlane.upperHalfPlaneSet

/-- The affine parameter puts the exponential on the negative real axis
and sends the integer cotangent poles to the odd imaginary poles. -/
noncomputable def cotPoint (x : ℝ) : ℂ :=
  (1/2:ℂ)+(x/(2*Real.pi):ℝ)*I

theorem cotPoint_im (x : ℝ) : (cotPoint x).im=x/(2*Real.pi) := by
  simp only [cotPoint, Complex.add_im, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.I_im, Complex.I_re, mul_one, mul_zero]
  have h : (1/2:ℂ).im=0 := by norm_num [Complex.div_im]
  rw [h,zero_add,add_zero]

theorem cotPoint_in_uhp {x : ℝ} (hx : 0<x) : cotPoint x∈UHP := by
  change 0 < (cotPoint x).im
  rw [cotPoint_im]
  positivity

theorem cotPoint_frequency (x : ℝ) :
    cotFrequency*cotPoint x = (Real.pi:ℂ)*I-(x:ℂ) := by
  unfold cotFrequency cotPoint
  push_cast
  field_simp [Real.pi_ne_zero]
  linear_combination (x:ℂ)*I_sq

theorem cotQ_at_point (x : ℝ) : cotQ (cotPoint x)=-(Real.exp (-x):ℂ) := by
  rw [cotQ,cotPoint_frequency,sub_eq_add_neg,exp_add,exp_pi_mul_I,← ofReal_neg,← ofReal_exp]
  ring

noncomputable def oddPole (x : ℝ) (k : ℤ) : ℂ :=
  (x:ℂ)-(2*(k:ℂ)+1)*(Real.pi:ℂ)*I

theorem oddPole_affine (x : ℝ) (k : ℤ) :
    oddPole x k = -cotFrequency*(cotPoint x+(k:ℂ)) := by
  rw [neg_mul,mul_add,cotPoint_frequency]
  unfold oddPole cotFrequency
  ring

theorem oddPole_term {x : ℝ} (hx : 0<x) (k : ℤ) (N : ℕ) :
    1/(cotPoint x+(k:ℂ))^N = (-cotFrequency)^N * (1/(oddPole x k)^N) := by
  have hz : cotPoint x + (k:ℂ) ≠ 0 := by
    intro h
    have hi := congrArg Complex.im h
    simp [cotPoint_im] at hi
    exact hx.ne' hi
  rw [oddPole_affine,mul_pow]
  field_simp [hz,cotFrequency_ne_zero]

theorem rationalEulerian_odd_poles (n : ℕ) {x : ℝ} (hx : 0<x) :
    rationalEulerian (n+1) (cotQ (cotPoint x)) =
      ((n+1)!:ℂ) * ∑' k : ℤ, 1/(oddPole x k)^(n+2) := by
  have hder := iteratedDerivWithin_cot_eulerian n (cotPoint_in_uhp hx)
  have hsum := iteratedDerivWithin_cot_pi_mul_eq_mul_tsum_div_pow
    (k := n+1) (by omega) (cotPoint_in_uhp hx)
  change iteratedDerivWithin (n+1) scaledCot UHP (cotPoint x) = _ at hsum
  rw [hder] at hsum
  simp_rw [oddPole_term hx] at hsum
  rw [tsum_mul_left] at hsum
  have hN : (-1:ℂ)^(n+2)=(-1)^(n+1)*(-1) := pow_succ (-1 : ℂ) (n+1)
  have hsign : (-1:ℂ)^(n+1)*(-1)^(n+2)=-1 := by
    rw [hN,←mul_assoc,← mul_pow]
    norm_num
  rw [show n+1+1=n+2 by omega, show -cotFrequency=(-1:ℂ)*cotFrequency by ring,mul_pow] at hsum
  let S : ℂ := ∑' k : ℤ, 1/(oddPole x k)^(n+2)
  have hh : -(cotFrequency^(n+2)*rationalEulerian (n+1) (cotQ (cotPoint x))) =
      -1 * (cotFrequency^(n+2)*((n+1)!:ℂ)*S) := by
    calc
      _ = ((-1:ℂ)^(n+1)*(-1)^(n+2)) * (cotFrequency^(n+2)*((n+1)!:ℂ)*S) := by
        unfold S
        rw [hsum]
        ring
      _ = _ := by rw [hsign]
  apply mul_left_cancel₀ (pow_ne_zero (n+2) cotFrequency_ne_zero)
  change _ = cotFrequency^(n+2)*(((n+1)!:ℂ)*S)
  linear_combination -hh

end RossiPermutohedron
