module

public import Conjectures.LassalleDerivativeAtIndex
public import Conjectures.LassalleTailGeometric

@[expose] public section
namespace LassalleRefinement

theorem abs_realCoeff_eq_besselTerm {R : ℝ} (hR : 0≤R) (i j : ℕ) :
    |realCoeff R i j|=besselTerm R i*besselTerm R j := by
  unfold realCoeff besselTerm coeffFactor
  have hz : 0≤R^(i+j)/((i.factorial*(i+1).factorial*j.factorial*(j+1).factorial:ℕ):ℝ) :=
    div_nonneg (pow_nonneg hR _) (by positivity)
  have hsign : |(-1:ℝ)^(i+j)|=1 := by simp [abs_pow]
  rw [abs_mul,abs_of_nonneg hz,hsign,mul_one,pow_add]
  push_cast
  field_simp

theorem besselTerm_mono {R S : ℝ} (h : 0≤R) (hRS : R≤S) (m : ℕ) :
    besselTerm R m≤besselTerm S m := by
  unfold besselTerm
  exact div_le_div_of_nonneg_right (pow_le_pow_left₀ h hRS _) (by positivity)

theorem derivativeSupNorm_twice (i j : ℕ) :
    derivativeSupNorm (2*i) (2*j)=max 1 (4*(((i+j:ℕ):ℝ))^2) := by
  unfold derivativeSupNorm
  push_cast
  by_cases h : i+j=0
  · have hi : i=0 := by omega
    have hj : j=0 := by omega
    simp [hi,hj]
  · have ha : (1:ℝ)≤(i:ℝ)+(j:ℝ) := by exact_mod_cast (by omega : 1 ≤ i+j)
    rw [max_eq_right (by linarith : (1:ℝ)≤2*i+2*j),max_eq_right (by nlinarith : (1:ℝ)≤4*((i:ℝ)+j)^2)]
    ring

noncomputable def bernsteinLayer (R t z : ℝ) (c : Component) (m : ℕ) : ℝ :=
  ∑ i ∈ Finset.range (m+1), realCoeff R i (m-i)*derivativeValue t z c (2*i) (2*(m-i))

theorem abs_bernsteinLayer_le {R : ℝ} (hR : 0≤R) (hRhi : R≤(rootHi:ℝ))
    {n a : ℕ} (hn : 0<n) (ha : a≤n) (c : Component) (hx : c.offset≤a)
    (hy : c.degree-c.offset≤n-a) (m : ℕ) (hm : 2*m≤n) :
    |bernsteinLayer R ((a:ℝ)/n) (1/(n:ℝ)) c m| ≤ certificateWeight m := by
  unfold bernsteinLayer certificateWeight besselConvolution
  rw [Finset.mul_sum]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  apply Finset.sum_le_sum
  intro i hi
  have hi' := Finset.mem_range.mp hi
  have hed : i+(m-i)=m := by omega
  have hdeg : 2*i+2*(m-i)≤n := by omega
  rw [abs_mul,abs_realCoeff_eq_besselTerm hR,
    derivativeValue_at_index hn ha c _ _ hdeg hx hy]
  have hD := abs_fallingDerivative_le c (a-c.offset) (n-a-(c.degree-c.offset)) (2*i) (2*(m-i))
  rw [derivativeSupNorm_twice,hed] at hD
  have hB := mul_le_mul (besselTerm_mono hR hRhi i) (besselTerm_mono hR hRhi (m-i))
    (besselTerm_nonneg hR _) (besselTerm_nonneg (hR.trans hRhi) _)
  rw [mul_comm (max 1 _)]
  exact mul_le_mul hB hD (abs_nonneg _)
    (mul_nonneg (besselTerm_nonneg (hR.trans hRhi) _) (besselTerm_nonneg (hR.trans hRhi) _))

end LassalleRefinement
