import Conjectures.LineSizeGeneratingBranchInterchange

/-! Exact Fourier rescaling of the actual line-size count.
The branch coefficient is normalized by `sqrt(t) exp(n*t + A/t)`.
The change of variables uses the literal support condition
`|t * sqrt(t) * y| ≤ π`. -/
noncomputable section
namespace LineSize.Generating.Branches

open Finset Complex Real MeasureTheory
open CoefficientIntegral
open scoped Interval

theorem integral_supported_rescale (f : ℝ → ℂ) {d : ℝ} (hd : 0 < d) :
    (∫ theta in -Real.pi..Real.pi, f theta)=
      (d : ℂ)*∫ y : ℝ, if |d*y| ≤ Real.pi then f (d*y) else 0 := by
  have hmem (y : ℝ) : |d*y| ≤ Real.pi ↔ y ∈ Set.Icc (-Real.pi/d) (Real.pi/d) := by
    rw [abs_le,Set.mem_Icc,div_le_iff₀ hd,le_div_iff₀ hd]
    simp only [mul_comm]
  have hfun : (fun y : ℝ => if |d*y| ≤ Real.pi then f (d*y) else 0)=
      (Set.Icc (-Real.pi/d) (Real.pi/d)).indicator (fun y : ℝ => f (d*y)) := by
    funext y
    simp only [Set.indicator_apply]
    simp only [← hmem y]
  have hab : -Real.pi/d ≤ Real.pi/d :=
    (div_nonpos_of_nonpos_of_nonneg (by linarith [Real.pi_pos]) hd.le).trans
      (div_nonneg Real.pi_pos.le hd.le)
  have hint : (∫ y : ℝ, if |d*y| ≤ Real.pi then f (d*y) else 0)=
      ∫ y in -Real.pi/d..Real.pi/d, f (d*y) := by
    rw [hfun,MeasureTheory.integral_indicator measurableSet_Icc,
      MeasureTheory.integral_Icc_eq_integral_Ioc,← intervalIntegral.integral_of_le hab]
  rw [hint]
  have hchange := intervalIntegral.smul_integral_comp_mul_left
    (a := -Real.pi/d) (b := Real.pi/d) f d
  have ha : d*(-Real.pi/d)=-Real.pi := by field_simp [hd.ne']
  have hb : d*(Real.pi/d)=Real.pi := by field_simp [hd.ne']
  rw [ha,hb,Complex.real_smul] at hchange
  exact hchange.symm

def normalizedBranchSumIntegral (n : ℕ) (beta : Fin 2) (t : ℝ) : ℂ :=
  ∫ y : ℝ, if |t*Real.sqrt t*y| ≤ Real.pi then
    (Real.sqrt t : ℂ)*∑' r : ℕ, normalizedBranchTerm n r beta t (t*Real.sqrt t*y)
    else 0

theorem normalizedBranchSumIntegral_eq (n : ℕ) (beta : Fin 2) (t : ℝ) :
    normalizedBranchSumIntegral n beta t=(Real.sqrt t : ℂ)*
      ∫ y : ℝ, if |t*Real.sqrt t*y| ≤ Real.pi then
        ∑' r : ℕ, normalizedBranchTerm n r beta t (t*Real.sqrt t*y) else 0 := by
  have hfun :
      (fun y : ℝ => if |t*Real.sqrt t*y| ≤ Real.pi then
        (Real.sqrt t : ℂ)*∑' r : ℕ, normalizedBranchTerm n r beta t (t*Real.sqrt t*y) else 0)=
      (fun y : ℝ => (Real.sqrt t : ℂ)*(if |t*Real.sqrt t*y| ≤ Real.pi then
        ∑' r : ℕ, normalizedBranchTerm n r beta t (t*Real.sqrt t*y) else 0)) := by
    funext y
    split_ifs <;> simp
  unfold normalizedBranchSumIntegral
  rw [hfun,MeasureTheory.integral_const_mul]

theorem normalized_branchCoefficient_rescale {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1)
    (n : ℕ) (beta : Fin 2) :
    Rat.castHom ℂ (branchCoefficient n beta)/
        ((Real.sqrt t : ℂ)*(Real.exp ((n : ℝ)*t+Profile.A/t) : ℂ))=
      ((t : ℂ)/(2*(Real.pi : ℂ)*(1-(Real.exp (-t) : ℂ))))*
        normalizedBranchSumIntegral n beta t := by
  have hscale := integral_supported_rescale
    (fun theta : ℝ => ∑' r : ℕ, normalizedBranchTerm n r beta t theta)
    (mul_pos ht (Real.sqrt_pos.mpr ht))
  rw [normalized_branchCoefficient_interval ht ht1 n beta,hscale,
    normalizedBranchSumIntegral_eq]
  push_cast
  ring

/-- Both beta branches and the exact small-core correction are retained. -/
theorem normalized_count_eq_branch_integrals {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1)
    (n : ℕ) (hn : 3 ≤ n) :
    (lineSizeCount n : ℂ)/
        ((Real.sqrt t : ℂ)*(Real.exp ((n : ℝ)*t+Profile.A/t) : ℂ))=
      (1/8 : ℂ)*((t : ℂ)/(2*(Real.pi : ℂ)*(1-(Real.exp (-t) : ℂ))))*
        (∑ beta : Fin 2, normalizedBranchSumIntegral n beta t)+
      (1/2 : ℂ)/((Real.sqrt t : ℂ)*(Real.exp ((n : ℝ)*t+Profile.A/t) : ℂ)) := by
  have hcount : (lineSizeCount n : ℂ)=
      (1/8 : ℂ)*(∑ beta : Fin 2, Rat.castHom ℂ (branchCoefficient n beta))+1/2 := by
    rw [lineSizeCount_extension_complex n hn,weightedCoefficient_eq_sum_branchCoefficient,map_sum]
    ring
  rw [hcount,add_div,mul_div_assoc,Finset.sum_div]
  simp_rw [normalized_branchCoefficient_rescale ht ht1 n]
  rw [← mul_sum]
  ring

theorem branchKernel_of_index_relation {t : ℝ} (n r : ℕ) (beta : Fin 2)
    (hn : (n : ℝ)=Profile.A/t^2) (theta : ℝ) :
    branchKernel n r beta t theta=
      Geometric.phase (((r : ℝ)^2+(beta.val : ℝ)*(r : ℝ)-Profile.A/t^2)*theta)*
        Geometric.characteristic r t theta*Geometric.scalarFactor (Real.exp (-t)) theta := by
  unfold branchKernel
  rw [hn]

end LineSize.Generating.Branches
