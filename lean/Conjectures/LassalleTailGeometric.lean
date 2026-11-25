module

public import Conjectures.LassalleConvolutionRatio

@[expose] public section
namespace LassalleRefinement

noncomputable def certificateWeight (m : ℕ) : ℝ :=
  max 1 (4*(m:ℝ)^2) * besselConvolution (rootHi:ℝ) m

theorem rootHi_real_nonnegative : (0:ℝ)≤(rootHi:ℝ) := by
  exact_mod_cast (show (0:ℚ)≤rootHi by decide +kernel)

theorem certificateWeight_nonnegative (m : ℕ) : 0≤certificateWeight m :=
  mul_nonneg (le_trans (by norm_num) (le_max_left ..))
    (besselConvolution_nonneg rootHi_real_nonnegative _)

theorem certificateWeight_cast (m : ℕ) : (weight m:ℝ)=certificateWeight m := by
  unfold weight certificateWeight besselConvolution besselTerm besselPositive
  push_cast
  rfl

theorem certificateWeight_ratio (m : ℕ) (hm : 15≤m) :
    certificateWeight (m+1)≤certificateWeight m/8 := by
  let R : ℝ := rootHi
  have h₀ : (15:ℝ)≤m := by exact_mod_cast hm
  have hm' : (0:ℝ)<m := by linarith
  have hma : 1≤4*(m:ℝ)^2 := by nlinarith
  have hmb : 1≤4*((m+1:ℕ):ℝ)^2 := by push_cast; nlinarith
  have hr : 2*R/72*(16/15)^2 < (1/8:ℝ) := by
    norm_num [R,rootHi]
  have h : (m+1:ℝ)/(m:ℝ)≤16/15 := by
    apply (div_le_iff₀ hm').mpr
    linarith
  have hb : (m+1:ℝ)^2≤(16/15:ℝ)^2*(m:ℝ)^2 := by
    have hh := (div_le_iff₀ hm').mp h
    calc
      _ ≤ ((16/15:ℝ)*(m:ℝ))^2 := pow_le_pow_left₀ (by positivity) hh 2
      _ = _ := by ring
  have hC := besselConvolution_ratio rootHi_real_nonnegative m (by omega)
  have hC₀ := besselConvolution_nonneg rootHi_real_nonnegative m
  unfold certificateWeight
  rw [max_eq_right hmb,max_eq_right hma]
  push_cast
  change 4*(m+1:ℝ)^2*besselConvolution R (m+1) ≤
    4*(m:ℝ)^2*besselConvolution R m / 8
  calc
    _ ≤ (4*(m+1:ℝ)^2)*((2*R/72)*besselConvolution R m) :=
      mul_le_mul_of_nonneg_left hC (by positivity)
    _ ≤ (4*((16/15:ℝ)^2*(m:ℝ)^2))*((2*R/72)*besselConvolution R m) :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hb (by norm_num))
        (mul_nonneg (by have := rootHi_real_nonnegative; positivity) hC₀)
    _ = (2*R/72*(16/15)^2)*(4*(m:ℝ)^2*besselConvolution R m) := by ring
    _ ≤ _ := by
      have hp : 0≤4*(m:ℝ)^2*besselConvolution R m := by positivity
      have ht := mul_le_mul_of_nonneg_right hr.le hp
      linarith

theorem certificateWeight_le_geometric (j : ℕ) :
    certificateWeight (15+j)≤certificateWeight 15*(1/8:ℝ)^j := by
  induction j with
  | zero => simp
  | succ j ih =>
    calc
      _ ≤ certificateWeight (15+j)/8 := certificateWeight_ratio _ (by omega)
      _ ≤ (certificateWeight 15*(1/8:ℝ)^j)/8 :=
        div_le_div_of_nonneg_right ih (by norm_num)
      _ = _ := by rw [pow_succ]; ring

theorem geometric_eighth_sum (n : ℕ) :
    (7/8:ℝ)*(∑ j ∈ Finset.range n,(1/8:ℝ)^j)=1-(1/8:ℝ)^n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ,mul_add,ih,pow_succ]
    ring

theorem certificateWeight_tail (n : ℕ) :
    (∑ j ∈ Finset.range n, certificateWeight (15+j))≤(8/7:ℝ)*certificateWeight 15 := by
  have hpos : (0:ℝ)<7/8 := by norm_num
  have hs := geometric_eighth_sum n
  have hn : (0:ℝ)≤(1/8:ℝ)^n := by positivity
  have hgeom : (∑ j ∈ Finset.range n,(1/8:ℝ)^j)≤8/7 := by linarith
  calc
    _ ≤ ∑ j ∈ Finset.range n, certificateWeight 15*(1/8:ℝ)^j :=
      Finset.sum_le_sum (fun i _ => certificateWeight_le_geometric i)
    _ = certificateWeight 15*(∑ j ∈ Finset.range n,(1/8:ℝ)^j) := by rw [Finset.mul_sum]
    _ ≤ _ := by
      rw [mul_comm (8/7:ℝ)]
      exact mul_le_mul_of_nonneg_left hgeom (certificateWeight_nonnegative _)

end LassalleRefinement
