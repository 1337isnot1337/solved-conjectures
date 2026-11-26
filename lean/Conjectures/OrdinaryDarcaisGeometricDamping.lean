import Conjectures.OrdinaryDarcaisDivisorDamping

/-! Closed geometric formula for the damping from a divisor class. -/

namespace OrdinaryDarcais

open Real

theorem geometric_damping {q : ℝ} (hq : 0 ≤ q) (hq' : q < 1) (t : ℝ) :
    (∑' k : ℕ, q^k * (1-cos (k*t))) =
      q/(1-q) * ((1+q)*(1-cos t)) / ((1-q)^2+2*q*(1-cos t)) := by
  let z := (q : ℂ) * Complex.exp ((t : ℂ)*Complex.I)
  have hz : ‖z‖ < 1 := by
    simpa [z, norm_mul, Complex.norm_exp_ofReal_mul_I, Real.norm_eq_abs, abs_of_nonneg hq] using hq'
  have hp (k : ℕ) : (Complex.exp ((t:ℂ)*Complex.I))^k =
      Complex.exp (((k*t : ℝ):ℂ)*Complex.I) := by
    rw [← Complex.exp_nat_mul]
    push_cast
    ring_nf
  have hRe (k : ℕ) : (z^k).re = q^k*cos (k*t) := by
    simp only [z, mul_pow, hp, ← Complex.ofReal_pow, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, zero_mul, sub_zero, Complex.exp_ofReal_mul_I_re]
  have hrgeom := summable_geometric_of_lt_one hq hq'
  have hcos : Summable (fun k : ℕ => q^k*cos (k*t)) := by
    apply hrgeom.of_norm_bounded
    intro k
    rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (pow_nonneg hq _)]
    exact mul_le_of_le_one_right (pow_nonneg hq _) (abs_cos_le_one _)
  have hseries : (∑' k : ℕ, q^k*cos (k*t)) = ((1-z)⁻¹).re := by
    simp_rw [← hRe]
    rw [← Complex.re_tsum (summable_geometric_of_norm_lt_one hz),tsum_geometric_of_norm_lt_one hz]
  have zr : z.re = q*cos t := by simp [z,Complex.mul_re,Complex.exp_ofReal_mul_I_re]
  have zi : z.im = q*sin t := by simp [z,Complex.mul_im,Complex.exp_ofReal_mul_I_im]
  have hD : Complex.normSq (1-z) = (1-q)^2 + 2*q*(1-cos t) := by
    rw [Complex.normSq_apply]
    simp only [Complex.sub_re,Complex.one_re,zr,Complex.sub_im,Complex.one_im,zi,zero_sub]
    nlinarith only [congrArg (fun v : ℝ => q^2*v) (sin_sq_add_cos_sq t)]
  have denom : 0 < (1-q)^2+2*q*(1-cos t) := by
    have h : 0 < (1-q)^2 := sq_pos_of_pos (by linarith)
    linarith only [h,mul_nonneg (show 0 ≤ 2*q by linarith) (sub_nonneg.mpr (cos_le_one t))]
  have sube (k : ℕ) : q^k*(1-cos (k*t)) = q^k-q^k*cos (k*t) := by ring
  conv_lhs => enter [1,k]; rw [sube k]
  rw [hrgeom.tsum_sub hcos,hseries,tsum_geometric_of_lt_one hq hq',Complex.inv_re,hD,Complex.sub_re,Complex.one_re,zr]
  apply (eq_div_iff denom.ne').2
  rw [sub_mul, div_mul_cancel₀ _ denom.ne']
  field_simp [sub_ne_zero.mpr hq'.ne']
  ring

theorem divisorDamping_tsum {x r : ℝ} (hr : 0 ≤ r) (hr' : r < 1)
    (t : ℝ) (d : ℕ) (hd : 0 < d) :
    (∑' k : ℕ, divisorDampingTerm x r t d k) =
      (d : ℝ)⁻¹*x*(r^d/(1-r^d)) * ((1+r^d)*(1-cos (d*t))) /
        ((1-r^d)^2+2*r^d*(1-cos (d*t))) := by
  have hinj : Function.Injective (fun m : ℕ => d*m) := by
    intro a b hab
    exact Nat.eq_of_mul_eq_mul_left hd hab
  have support : Function.support (divisorDampingTerm x r t d) ⊆ Set.range (fun m : ℕ => d*m) := by
    intro k hk
    by_contra h
    have nd : ¬d ∣ k := by
      rintro ⟨m,hm⟩
      exact h ⟨m,hm.symm⟩
    exact hk (by simp [divisorDampingTerm, Nat.mem_divisors, nd])
  rw [← hinj.tsum_eq support]
  have atMul (m : ℕ) : divisorDampingTerm x r t d (d*m) =
      ((d : ℝ)⁻¹*x)*((r^d)^m*(1-cos (m*((d:ℝ)*t)))) := by
    by_cases hm : m = 0
    · simp [hm,divisorDampingTerm]
    have mem := Nat.mem_divisors.mpr ⟨show d ∣ d*m from dvd_mul_right _ _,Nat.mul_ne_zero hd.ne' hm⟩
    simp only [divisorDampingTerm,mem,ite_true,Nat.cast_mul,pow_mul]
    ring_nf
  simp_rw [atMul]
  rw [tsum_mul_left,geometric_damping (pow_nonneg hr _) (pow_lt_one₀ hr hr' hd.ne')]
  ring

end OrdinaryDarcais
