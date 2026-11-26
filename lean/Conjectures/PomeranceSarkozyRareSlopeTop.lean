module
public import Conjectures.PomeranceSarkozyRareCumulantStrict
public import Mathlib.MeasureTheory.Measure.Lebesgue.Integral
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory Set
open scoped NNReal ENNReal Topology

private theorem normalTailProbability_antitone : Antitone normalTailProbability := by
  intro s t h
  exact measureReal_mono (Ioi_subset_Ioi h) (measure_ne_top (gaussianReal 0 1) _)

theorem normalTailProbability_neg (s : ℝ) : normalTailProbability (-s)=1-normalTailProbability s := by
  let μ := gaussianReal 0 1
  have hN : μ.map (fun x : ℝ=>-x)=μ := by unfold μ; rw [gaussianReal_map_neg,neg_zero]
  have hPre : (fun x : ℝ=>-x)⁻¹' Ioi (-s)=Iio s := by
    ext x
    exact neg_lt_neg_iff
  have hM : μ (Iio s)=μ (Iic s) := by
    have hs : μ {s}=0 := gaussianReal_absolutelyContinuous 0 (by norm_num : (1:ℝ≥0)≠0) (measure_singleton s)
    have hd : Disjoint (Iio s) ({s}:Set ℝ) :=
      Set.disjoint_left.2 (fun x hx hxs=>(ne_of_lt hx) (Set.mem_singleton_iff.mp hxs))
    rw [← Iio_union_right,measure_union (μ:=μ) hd (measurableSet_singleton s),hs,add_zero]
  unfold normalTailProbability
  change μ.real (Ioi (-s))=1-μ.real (Ioi s)
  rw [← probReal_compl_eq_one_sub measurableSet_Ioi,compl_Ioi,
    measureReal_def,measureReal_def,← hN,Measure.map_apply (by fun_prop) measurableSet_Ioi,hPre]
  rw [hN,hM]

private theorem bernoulliTiltedProbability_one_sub (p t : ℝ)
    (h₀ : 0≤ p) (h₁ : p≤ 1) :
    1-bernoulliTiltedProbability p t=(1-p)/bernoulliExponentialDenominator p t := by
  have hD := (bernoulliExponentialDenominator_pos h₀ h₁ t).ne'
  unfold bernoulliTiltedProbability
  field_simp
  unfold bernoulliExponentialDenominator
  ring

/-- No boundary tilt is needed: the Gaussian limiting cumulant's
slope grows beyond every fixed displacement. The proof uses only
compact intervals and the exact logistic identity. -/
theorem gaussianRareCumulantSlope_tendsto_atTop :
    Tendsto gaussianRareCumulantSlope atTop atTop := by
  apply tendsto_atTop.2
  intro A
  let p := normalTailProbability
  let k := (1-p 0)/2
  have hk : 0<k := by
    have h := (normalTailProbability_strict 0).2
    exact div_pos (sub_pos.mpr h) (by norm_num)
  let M := max (A/k) 0+1
  have hM : 0<M := by unfold M; linarith [le_max_right (A/k) 0]
  have hA : A≤k*M := by
    have h : (A/k)≤M := by unfold M; linarith [le_max_left (A/k) 0]
    rw [mul_comm]
    exact (div_le_iff₀ hk).mp h
  have hpM : 0<p M := (normalTailProbability_strict M).1
  have hRec : 0<(p M*k)⁻¹ := inv_pos.mpr (mul_pos hpM hk)
  filter_upwards [eventually_ge_atTop (max (Real.log ((p M*k)⁻¹)) 0)] with t hT
  have ht : 0≤t := (le_max_right _ _).trans hT
  have he : (p M*k)⁻¹≤Real.exp t := by
    have h := Real.exp_le_exp.mpr ((le_max_left (Real.log ((p M*k)⁻¹)) 0).trans hT)
    rwa [Real.exp_log hRec] at h
  have hG : ∀ s,0≤ gaussianRareFirstIntegrand t s := by
    intro s
    obtain ⟨h0,h1⟩ := normalTailProbability_mem_Icc s
    unfold gaussianRareFirstIntegrand
    rw [bernoulliTiltedProbability_sub_parameter _ _ h0 h1]
    have hexp : 1≤Real.exp t := Real.one_le_exp_iff.mpr ht
    exact div_nonneg (by positivity) (bernoulliExponentialDenominator_pos h0 h1 t).le
  have hDom : ∀ s∈Icc (0:ℝ) M,k≤gaussianRareFirstIntegrand t s := by
    intro s hs
    have hpL : p M≤p s := normalTailProbability_antitone hs.2
    have hpU : p s≤p 0 := normalTailProbability_antitone hs.1
    obtain ⟨h0,h1⟩ := normalTailProbability_mem_Icc s
    have bh : 1≤(p M*k)*Real.exp t := (inv_le_iff_one_le_mul₀' (mul_pos hpM hk)).mp he
    have hD : p s*Real.exp t≤bernoulliExponentialDenominator (p s) t := by
      unfold bernoulliExponentialDenominator
      linarith
    have hf : 1≤k*bernoulliExponentialDenominator (p s) t := by
      calc
        _ ≤ _ := bh
        _ = k*(p M*Real.exp t) := by ring
        _ ≤ _ := mul_le_mul_of_nonneg_left
          ((mul_le_mul_of_nonneg_right hpL (Real.exp_pos _).le).trans hD) hk.le
    have hRem : 1-bernoulliTiltedProbability (p s) t≤k := by
      rw [bernoulliTiltedProbability_one_sub _ _ h0 h1]
      exact (div_le_iff₀ (bernoulliExponentialDenominator_pos h0 h1 t)).mpr (by linarith)
    unfold gaussianRareFirstIntegrand
    change k≤bernoulliTiltedProbability (p s) t-p s
    unfold k at hRem ⊢
    linarith
  have hInt := (gaussianRareCumulant_hasDerivAt t).1
  have hSmall : (∫ s : ℝ, (Icc (0:ℝ) M).indicator (fun _=>k) s)=k*M := by
    rw [integral_indicator measurableSet_Icc,setIntegral_const,Real.volume_real_Icc,
      sub_zero,smul_eq_mul,mul_comm,max_eq_left hM.le]
  refine hA.trans ?_
  rw [← hSmall]
  unfold gaussianRareCumulantSlope
  have hInd : Integrable ((Icc (0:ℝ) M).indicator (fun _ : ℝ=>k)) := by
    rw [integrable_indicator_iff measurableSet_Icc]
    exact integrableOn_const (measure_Icc_lt_top.ne)
  apply integral_mono hInd hInt
  intro s
  by_cases hs : s∈Icc (0:ℝ) M
  · rw [indicator_of_mem hs]; exact hDom s hs
  · rw [indicator_of_notMem hs]; exact hG s

end PomeranceSarkozy
