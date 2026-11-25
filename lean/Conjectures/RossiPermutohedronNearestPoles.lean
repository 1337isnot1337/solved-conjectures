module

public import Conjectures.RossiPermutohedronAnalyticExpansions
public import Mathlib.Analysis.Complex.Trigonometric

@[expose] public section
namespace RossiPermutohedron
open Complex

theorem oddPole_normSq (x : ℝ) (k : ℤ) :
    Complex.normSq (oddPole x k)=x^2+((2*(k:ℝ)+1)*Real.pi)^2 := by
  simp [oddPole,Complex.normSq_apply,Complex.mul_re,Complex.mul_im]
  ring

theorem oddPole_conj (x : ℝ) (k : ℤ) :
    oddPole x (-k-1)=star (oddPole x k) := by
  apply Complex.ext
  · simp [oddPole,Complex.mul_re,Complex.mul_im]
  · simp [oddPole,Complex.mul_re,Complex.mul_im]
    ring

theorem polar_pole_zero (θ : ℝ) (hs : 0<Real.sin θ) :
    oddPole (Real.pi*Real.cot θ) 0 =
      ((Real.pi/Real.sin θ:ℝ):ℂ)*Complex.exp (-(θ:ℂ)*Complex.I) := by
  rw [Complex.exp_mul_I, Complex.cos_neg, Complex.sin_neg]
  simp only [oddPole, Int.cast_zero,mul_zero,zero_add,one_mul,Real.cot_eq_cos_div_sin,
    Complex.ofReal_mul,Complex.ofReal_div,Complex.ofReal_cos,Complex.ofReal_sin]
  have h0 : Complex.sin (θ:ℂ) ≠ 0 := by
    rw [←Complex.ofReal_sin]
    exact Complex.ofReal_ne_zero.mpr hs.ne'
  field_simp [h0]
  ring

theorem nearest_phase (θ : ℝ) {j N : ℕ} (hθ : (N:ℝ)*θ=j*Real.pi) :
    Complex.exp ((N:ℂ)*(-(θ:ℂ)*I))=(-1:ℂ)^j := by
  have he : (N:ℂ)*(θ:ℂ) = (j:ℂ)*(Real.pi:ℂ) := by exact_mod_cast hθ
  rw [show (N:ℂ)*(-(θ:ℂ)*I) = -((N:ℂ)*(θ:ℂ))*I by ring,he]
  rw [show -((j:ℂ)*(Real.pi:ℂ))*I = -((j:ℂ)*((Real.pi:ℂ)*I)) by ring,
    Complex.exp_neg,Complex.exp_nat_mul,Complex.exp_pi_mul_I,← inv_pow]
  norm_num

theorem nearest_individual_eval (θ : ℝ) (hs : 0<Real.sin θ) {j N : ℕ}
    (hθ : (N:ℝ)*θ=j*Real.pi) :
    1/(oddPole (Real.pi*Real.cot θ) 0)^N =
      ((-1:ℝ)^j*(Real.sin θ/Real.pi)^N:ℝ) := by
  rw [polar_pole_zero θ hs,mul_pow,← Complex.exp_nat_mul,nearest_phase θ hθ]
  push_cast
  simp only [one_div,mul_inv_rev,← inv_pow,inv_div]
  norm_num

theorem nearest_pair_eval (θ : ℝ) (hs : 0<Real.sin θ) {j N : ℕ}
    (hθ : (N:ℝ)*θ=j*Real.pi) :
    (1/(oddPole (Real.pi*Real.cot θ) 0)^N +
       1/(oddPole (Real.pi*Real.cot θ) (-1))^N).re =
       2*(-1:ℝ)^j*(Real.sin θ/Real.pi)^N := by
  have hb : oddPole (Real.pi*Real.cot θ) (-1) = star (oddPole (Real.pi*Real.cot θ) 0) := by
    simpa using oddPole_conj (Real.pi*Real.cot θ) 0
  let z := oddPole (Real.pi*Real.cot θ) 0
  have hstar : 1/(star z)^N = star (1/z^N) := by
    simp
  rw [hb]
  change (1/z^N+1/(star z)^N).re = _
  rw [hstar]
  change (1/(oddPole (Real.pi*Real.cot θ) 0)^N +
    star (1/(oddPole (Real.pi*Real.cot θ) 0)^N)).re = _
  rw [nearest_individual_eval θ hs hθ]
  simp only [Complex.add_re, Complex.star_def, Complex.conj_re, Complex.ofReal_re]
  ring

end RossiPermutohedron
