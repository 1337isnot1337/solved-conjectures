import Conjectures.LineSizeGeneratingBranchFactors
import Conjectures.LineSizeCoreGaussian
import Conjectures.LineSizeLatticeGaussian

/-! Summation and integration for the literal normalized branches.
The majorant is derived from the actual normalized core weights and the
shifted-lattice Gaussian bound. The coefficient index remains arbitrary. -/
noncomputable section
namespace LineSize.Generating.Branches

open Finset Complex Real MeasureTheory
open CoefficientIntegral
open scoped Interval

def branchCoefficient (n : ℕ) (beta : Fin 2) : ℚ :=
  ∑ r ∈ range (n+1), PowerSeries.coeff n (branchSeries r beta)

theorem weightedCoefficient_eq_sum_branchCoefficient (n : ℕ) :
    weightedCoefficient n=∑ beta : Fin 2, branchCoefficient n beta := by
  unfold weightedCoefficient branchCoefficient
  rw [sum_comm]

theorem hasSum_fixedBranchIntegral {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1)
    (n : ℕ) (beta : Fin 2) :
    HasSum (fun r : ℕ => branchIntegral q n r beta)
      ((2*(Real.pi : ℂ))*(Rat.castHom ℂ (branchCoefficient n beta)*(q : ℂ)^n)) := by
  have hoff : ∀ r ∉ range (n+1), branchIntegral q n r beta=0 := by
    intro r hr
    have hnr : n < r := by
      have hr' : ¬r < n+1 := by simpa only [mem_range] using hr
      omega
    exact branchIntegral_eq_zero hq hq1 n r beta hnr
  have h : HasSum (fun r : ℕ => branchIntegral q n r beta)
      (∑ r ∈ range (n+1), branchIntegral q n r beta) :=
    hasSum_sum_of_ne_finset_zero hoff
  have hs : (∑ r ∈ range (n+1), branchIntegral q n r beta)=
      (2*(Real.pi : ℂ))*(Rat.castHom ℂ (branchCoefficient n beta)*(q : ℂ)^n) := by
    simp only [branchIntegral_eq hq hq1,branchCoefficient,map_sum,mul_sum,sum_mul]
  rwa [hs] at h

theorem summable_normalizedWeight {beta t : ℝ} (hbeta : 0 ≤ beta)
    (ht : 0 < t) (ht1 : t ≤ 1) :
    Summable (fun r : ℕ => EulerKernel.normalizedWeight r beta t) := by
  obtain ⟨C,hC,hbound⟩ := EulerKernel.normalizedWeight_gaussian_bound
  have hs := Lattice.summable_norm_of_gaussian_bound
    (h := Real.sqrt t) (c := -Profile.u0/Real.sqrt t)
    (Real.sqrt_pos.mpr ht) (Real.sqrt_le_one.mpr ht1) hC.le
    (fun r : ℕ => (EulerKernel.normalizedWeight r beta t : ℂ)) (by
      intro r
      rw [Complex.norm_of_nonneg (EulerKernel.normalizedWeight_pos r beta ht).le,
        EulerKernel.coreCoordinate_grid r ht]
      exact hbound r beta t hbeta ht ht1)
  exact hs.congr (fun r =>
    Complex.norm_of_nonneg (EulerKernel.normalizedWeight_pos r beta ht).le)

theorem branchKernel_norm_le_one {t : ℝ} (ht : 0 < t)
    (n r : ℕ) (beta : Fin 2) (theta : ℝ) :
    ‖branchKernel n r beta t theta‖ ≤ 1 := by
  have hq1 : Real.exp (-t) < 1 := by
    rw [Real.exp_lt_one_iff]
    linarith
  rw [branchKernel,norm_mul,norm_mul,Geometric.phase_norm,one_mul]
  calc
    _ ≤ 1*1 := mul_le_mul (Geometric.characteristic_norm_le_one r ht theta)
      (Geometric.scalarFactor_norm_le_one (Real.exp_pos (-t)).le hq1 theta)
      (norm_nonneg _) zero_le_one
    _ = 1 := one_mul _

theorem continuous_branchKernel {t : ℝ} (ht : 0 < t)
    (n r : ℕ) (beta : Fin 2) : Continuous (branchKernel n r beta t) := by
  have hq1 : Real.exp (-t) < 1 := by
    rw [Real.exp_lt_one_iff]
    linarith
  unfold branchKernel
  apply Continuous.mul
  · apply Continuous.mul
    · unfold Geometric.phase
      fun_prop
    · exact Geometric.characteristic_continuous r ht
  · exact Geometric.scalarFactor_continuous (Real.exp_pos (-t)).le hq1

def normalizedBranchTerm (n r : ℕ) (beta : Fin 2) (t theta : ℝ) : ℂ :=
  (EulerKernel.normalizedWeight r (beta.val : ℝ) t : ℂ)*branchKernel n r beta t theta

theorem continuous_normalizedBranchTerm {t : ℝ} (ht : 0 < t)
    (n r : ℕ) (beta : Fin 2) : Continuous (normalizedBranchTerm n r beta t) :=
  continuous_const.mul (continuous_branchKernel ht n r beta)

theorem normalizedBranchTerm_norm_le {t : ℝ} (ht : 0 < t)
    (n r : ℕ) (beta : Fin 2) (theta : ℝ) :
    ‖normalizedBranchTerm n r beta t theta‖ ≤ EulerKernel.normalizedWeight r (beta.val : ℝ) t := by
  rw [normalizedBranchTerm,norm_mul,
    Complex.norm_of_nonneg (EulerKernel.normalizedWeight_pos r (beta.val : ℝ) ht).le]
  exact mul_le_of_le_one_right (EulerKernel.normalizedWeight_pos r (beta.val : ℝ) ht).le
    (branchKernel_norm_le_one ht n r beta theta)

theorem summable_norm_normalizedBranchTerm {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1)
    (n : ℕ) (beta : Fin 2) (theta : ℝ) :
    Summable (fun r : ℕ => ‖normalizedBranchTerm n r beta t theta‖) := by
  exact (summable_normalizedWeight (by positivity : (0 : ℝ) ≤ beta.val) ht ht1).of_nonneg_of_le
    (fun _ => norm_nonneg _) (fun r => normalizedBranchTerm_norm_le ht n r beta theta)

theorem hasSum_integral_normalizedBranchTerm {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1)
    (n : ℕ) (beta : Fin 2) :
    HasSum
      (fun r : ℕ => ∫ theta in -Real.pi..Real.pi, normalizedBranchTerm n r beta t theta)
      (∫ theta in -Real.pi..Real.pi, ∑' r : ℕ, normalizedBranchTerm n r beta t theta) := by
  have hsum := summable_normalizedWeight (by positivity : (0 : ℝ) ≤ beta.val) ht ht1
  apply intervalIntegral.hasSum_integral_of_dominated_convergence
    (bound := fun r (_theta : ℝ) => EulerKernel.normalizedWeight r (beta.val : ℝ) t)
  · intro r
    exact (continuous_normalizedBranchTerm ht n r beta).aestronglyMeasurable
  · intro r
    exact Filter.Eventually.of_forall (fun theta _ => normalizedBranchTerm_norm_le ht n r beta theta)
  · exact Filter.Eventually.of_forall (fun _ _ => hsum)
  · exact intervalIntegrable_const
  · exact Filter.Eventually.of_forall (fun theta _ =>
      (summable_norm_normalizedBranchTerm ht ht1 n beta theta).of_norm.hasSum)

theorem branchIntegral_normalized {t : ℝ} (ht : 0 < t)
    (n r : ℕ) (beta : Fin 2) :
    branchIntegral (Real.exp (-t)) n r beta=
      ((Real.sqrt t*Real.exp (Profile.A/t)/(1-Real.exp (-t)) : ℝ) : ℂ)*
        ∫ theta in -Real.pi..Real.pi, normalizedBranchTerm n r beta t theta := by
  have hs : Real.sqrt t ≠ 0 := (Real.sqrt_pos.mpr ht).ne'
  have he : Real.exp (Profile.A/t) ≠ 0 := (Real.exp_pos _).ne'
  have hq : 1-Real.exp (-t) ≠ 0 := by
    apply (sub_pos.mpr _).ne'
    rw [Real.exp_lt_one_iff]
    linarith
  have hw : EulerKernel.coreWeight r (beta.val : ℝ) t/(1-Real.exp (-t))=
      (Real.sqrt t*Real.exp (Profile.A/t)/(1-Real.exp (-t)))*
        EulerKernel.normalizedWeight r (beta.val : ℝ) t := by
    unfold EulerKernel.normalizedWeight
    field_simp [hs,he,hq]
  rw [branchIntegral_factor ht,hw,Complex.ofReal_mul]
  unfold normalizedBranchTerm
  rw [intervalIntegral.integral_const_mul,mul_assoc]

theorem normalized_branchCoefficient_interval {t : ℝ} (ht : 0 < t) (ht1 : t ≤ 1)
    (n : ℕ) (beta : Fin 2) :
    Rat.castHom ℂ (branchCoefficient n beta)/
        ((Real.sqrt t : ℂ)*(Real.exp ((n : ℝ)*t+Profile.A/t) : ℂ))=
      (1/(2*(Real.pi : ℂ)*(1-(Real.exp (-t) : ℂ))))*
        ∫ theta in -Real.pi..Real.pi, ∑' r : ℕ, normalizedBranchTerm n r beta t theta := by
  have hq1 : Real.exp (-t) < 1 := by
    rw [Real.exp_lt_one_iff]
    linarith
  have hs : (Real.sqrt t : ℂ) ≠ 0 := by exact_mod_cast (Real.sqrt_pos.mpr ht).ne'
  have he : (Real.exp (Profile.A/t) : ℂ) ≠ 0 := by exact_mod_cast (Real.exp_pos (Profile.A/t)).ne'
  have het : (Real.exp ((n : ℝ)*t+Profile.A/t) : ℂ) ≠ 0 := by
    exact_mod_cast (Real.exp_pos ((n : ℝ)*t+Profile.A/t)).ne'
  have hq : (Real.exp (-t) : ℂ) ≠ 0 := by exact_mod_cast (Real.exp_pos (-t)).ne'
  have hd : 1-(Real.exp (-t) : ℂ) ≠ 0 := by exact_mod_cast (sub_pos.mpr hq1).ne'
  have hpi : 2*(Real.pi : ℂ) ≠ 0 := by
    apply mul_ne_zero (by norm_num)
    exact_mod_cast Real.pi_ne_zero
  have hexpR : Real.exp ((n : ℝ)*t+Profile.A/t)*Real.exp (-t)^n=Real.exp (Profile.A/t) := by
    rw [exp_neg_pow,← Real.exp_add]
    congr 1
    ring
  have hexp : (Real.exp ((n : ℝ)*t+Profile.A/t) : ℂ)*(Real.exp (-t) : ℂ)^n=
      (Real.exp (Profile.A/t) : ℂ) := by exact_mod_cast hexpR
  have hi := (hasSum_integral_normalizedBranchTerm ht ht1 n beta).mul_left
    ((Real.sqrt t*Real.exp (Profile.A/t)/(1-Real.exp (-t)) : ℝ) : ℂ)
  have hb := hi.congr_fun (fun r => branchIntegral_normalized ht n r beta)
  have hv := (hasSum_fixedBranchIntegral (Real.exp_pos (-t)).le hq1 n beta).unique hb
  have hv' : Rat.castHom ℂ (branchCoefficient n beta)*(Real.exp (-t) : ℂ)^n=
      (((Real.sqrt t*Real.exp (Profile.A/t)/(1-Real.exp (-t)) : ℝ) : ℂ)*
        (∫ theta in -Real.pi..Real.pi, ∑' r : ℕ, normalizedBranchTerm n r beta t theta))/
          (2*(Real.pi : ℂ)) := by
    apply (eq_div_iff hpi).mpr
    rw [mul_comm]
    exact hv
  calc
    _ = (Rat.castHom ℂ (branchCoefficient n beta)*(Real.exp (-t) : ℂ)^n)/
        ((Real.sqrt t : ℂ)*(Real.exp (Profile.A/t) : ℂ)) := by
      rw [← hexp]
      field_simp [hs,het,hq]
    _ = _ := by
      rw [hv']
      push_cast
      field_simp [hs,he,hpi,hd]

end LineSize.Generating.Branches
