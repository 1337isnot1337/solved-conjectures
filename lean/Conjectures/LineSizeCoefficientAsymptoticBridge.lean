import Conjectures.LineSizeCoefficientAsymptoticScale
import Conjectures.LineSizeGeneratingRescale
import Conjectures.LineSizeSaddleIntegral

/-! Assembly of the actual count from the exact coefficient identity and
the discharged supported-integral limit. The saddle relation is supplied
by the explicit integer-indexed scale. -/
noncomputable section
namespace LineSize.CoefficientAsymptotic

open Real Complex Finset Filter MeasureTheory
open Generating.Branches
open scoped Topology

def normalizedCount (n : ℕ) : ℝ := (lineSizeCount n : ℝ)/normalizer n

theorem branchSumIntegral_eq_supported (n : ℕ) (beta : Fin 2) {t : ℝ}
    (hn : (n : ℝ)=Profile.A/t^2) :
    normalizedBranchSumIntegral n beta t=Geometric.supportedIntegral (beta.val : ℝ) t := by
  unfold normalizedBranchSumIntegral Geometric.supportedIntegral
  apply MeasureTheory.integral_congr_ae
  exact ae_of_all _ (fun y => by
    by_cases hy : |t*Real.sqrt t*y| ≤ Real.pi
    · simp only [hy,ite_true]
      apply congrArg (fun z : ℂ => (Real.sqrt t : ℂ)*z)
      apply tsum_congr
      intro r
      simp only [normalizedBranchTerm,Geometric.normalizedCoefficient,
        Geometric.centeredCharacteristic,branchKernel]
      rw [hn]
    · simp only [hy,ite_false])

theorem normalized_count_identity (n : ℕ) (hn : 3 ≤ n) (ht1 : scale n ≤ 1) :
    (normalizedCount n : ℂ)=
      (1/8 : ℂ)*((scale n : ℂ)/(2*(Real.pi : ℂ)*(1-(Real.exp (-scale n) : ℂ))))*
        (∑ beta : Fin 2, Geometric.supportedIntegral (beta.val : ℝ) (scale n))+
      (((1/2 : ℝ)/normalizer n) : ℂ) := by
  have hnpos : 0 < n := by omega
  have h := normalized_count_eq_branch_integrals (scale_pos hnpos) ht1 n hn
  have hsum : (∑ beta : Fin 2, normalizedBranchSumIntegral n beta (scale n))=
      ∑ beta : Fin 2, Geometric.supportedIntegral (beta.val : ℝ) (scale n) := by
    apply sum_congr rfl
    intro beta _hbeta
    exact branchSumIntegral_eq_supported n beta (index_eq hnpos)
  rw [hsum] at h
  simpa [normalizedCount,normalizer] using h

theorem gaussian_constant_sum :
    (Real.exp (-(0 : ℝ)*Profile.u0)/Real.sqrt Real.pi*
      (2*Real.pi/Real.sqrt (6*Profile.A)))+
    (Real.exp (-(1 : ℝ)*Profile.u0)/Real.sqrt Real.pi*
      (2*Real.pi/Real.sqrt (6*Profile.A)))=
    ((3/2 : ℝ)/Real.sqrt Real.pi)*(2*Real.pi/Real.sqrt (6*Profile.A)) := by
  have he : Real.exp (-Profile.u0)=(1/2 : ℝ) := by
    rw [Real.exp_neg,Profile.exp_u0]
    norm_num
  simp only [neg_zero,zero_mul,Real.exp_zero,neg_one_mul,he]
  ring

theorem supported_sum_tendsto :
    Tendsto (fun n : ℕ => ∑ beta : Fin 2, Geometric.supportedIntegral (beta.val : ℝ) (scale n))
      atTop (𝓝 (((((3/2 : ℝ)/Real.sqrt Real.pi)*(2*Real.pi/Real.sqrt (6*Profile.A))) : ℝ) : ℂ)) := by
  have h0 := Geometric.supportedIntegral_tendsto (β := 0)
    (by norm_num : (0 : ℝ) ≤ 0) scale_tendsto_zero scale_eventually_pos
  have h1 := Geometric.supportedIntegral_tendsto (β := 1)
    (by norm_num : (0 : ℝ) ≤ 1) scale_tendsto_zero scale_eventually_pos
  have hs := h0.add h1
  rw [← Complex.ofReal_add,gaussian_constant_sum] at hs
  simpa only [Fin.sum_univ_two,Fin.val_zero,Fin.val_one,Nat.cast_zero,Nat.cast_one] using hs

theorem coefficient_prefactor_tendsto :
    Tendsto (fun n : ℕ => (scale n : ℂ)/(2*(Real.pi : ℂ)*(1-(Real.exp (-scale n) : ℂ))))
      atTop (𝓝 (1/(2*(Real.pi : ℂ)))) := by
  have hc : Tendsto (fun n : ℕ => ((scale n/(1-Real.exp (-scale n)) : ℝ) : ℂ))
      atTop (𝓝 (1 : ℂ)) := by
    simpa only [Complex.ofReal_one,Function.comp_def] using
      (Complex.continuous_ofReal.tendsto 1).comp scale_prefactor_tendsto_one
  have hd := hc.div_const (2*(Real.pi : ℂ))
  apply hd.congr'
  exact Filter.Eventually.of_forall (fun n => by
    push_cast
    rw [div_div]
    congr 1
    ring)

theorem half_normalizer_complex_tendsto :
    Tendsto (fun n : ℕ => (((1/2 : ℝ)/normalizer n) : ℂ)) atTop (𝓝 0) := by
  simpa only [Complex.ofReal_zero,Function.comp_def] using
    (Complex.continuous_ofReal.tendsto 0).comp half_normalizer_tendsto_zero

theorem normalizedCount_complex_tendsto :
    Tendsto (fun n : ℕ => (normalizedCount n : ℂ)) atTop (𝓝 (normalizedConstant : ℂ)) := by
  have hm := ((tendsto_const_nhds (x := (1/8 : ℂ))).mul coefficient_prefactor_tendsto).mul
    supported_sum_tendsto
  have h := hm.add half_normalizer_complex_tendsto
  have hpi : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_pos.ne'
  have hsp : (Real.sqrt Real.pi : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.mpr Real.pi_pos).ne'
  have hsa : (Real.sqrt (6*Profile.A) : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.mpr (by positivity : (0 : ℝ) < 6*Profile.A)).ne'
  have hvalue :
      (1/8 : ℂ)*(1/(2*(Real.pi : ℂ)))*
        (((((3/2 : ℝ)/Real.sqrt Real.pi)*(2*Real.pi/Real.sqrt (6*Profile.A))) : ℝ) : ℂ)+0=
      (normalizedConstant : ℂ) := by
    unfold normalizedConstant
    push_cast
    field_simp [hpi,hsp,hsa] <;> ring
  rw [hvalue] at h
  apply h.congr'
  filter_upwards [eventually_ge_atTop (3 : ℕ),scale_eventually_le_one] with n hn ht1
  exact (normalized_count_identity n hn ht1).symm

theorem normalizedCount_tendsto :
    Tendsto normalizedCount atTop (𝓝 normalizedConstant) := by
  have h := (Complex.continuous_re.tendsto (normalizedConstant : ℂ)).comp
    normalizedCount_complex_tendsto
  simpa only [Complex.ofReal_re,Function.comp_def] using h

end LineSize.CoefficientAsymptotic
