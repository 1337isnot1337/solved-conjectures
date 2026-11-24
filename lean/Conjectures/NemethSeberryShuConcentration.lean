import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Probability.Distributions.Bernoulli
import Mathlib.MeasureTheory.Integral.Pi
import Mathlib.Tactic

/-! Real weighted indicator concentration for the Fourier sampling step. -/

open Finset MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal

namespace NemethSeberryShu

noncomputable section

variable {Ω α : Type*} [MeasurableSpace Ω]
variable {μ : Measure Ω}

private def weightedIndicator (b : ℝ) (x : Bool) : ℝ := if x then b else 0

private theorem measurable_weightedIndicator (b : ℝ) : Measurable (weightedIndicator b) :=
  measurable_of_countable _

private theorem weightedIndicator_bounds (b : ℝ) (x : Bool) :
    weightedIndicator b x ∈ Set.Icc (min 0 b) (max 0 b) := by
  cases x
  · exact ⟨min_le_left _ _, le_max_left _ _⟩
  · exact ⟨min_le_right _ _, le_max_right _ _⟩

private theorem indicator_subgaussian [IsProbabilityMeasure μ] {X : Ω → Bool}
    (hX : Measurable X) (b : ℝ) (hb : |b| ≤ 1) :
    HasSubgaussianMGF
      (fun ω => weightedIndicator b (X ω) - ∫ z, weightedIndicator b (X z) ∂μ)
      (1 / 4 : ℝ≥0) μ := by
  have hsub := hasSubgaussianMGF_of_mem_Icc (μ := μ)
    (((measurable_weightedIndicator b).comp hX).aemeasurable)
    (Filter.Eventually.of_forall fun ω => weightedIndicator_bounds b (X ω))
  have hwidth : max 0 b - min 0 b = |b| := by
    by_cases h : 0 ≤ b
    · simp [max_eq_right h, min_eq_left h, abs_of_nonneg h]
    · have h' : b ≤ 0 := le_of_not_ge h
      simp [max_eq_left h', min_eq_right h', abs_of_nonpos h']
  have hn : ‖max 0 b - min 0 b‖ ≤ 1 := by rw [hwidth, Real.norm_eq_abs, abs_abs]; exact hb
  refine ⟨hsub.integrable_exp_mul, fun t => (hsub.mgf_le t).trans ?_⟩
  apply Real.exp_le_exp.mpr
  have hnn : 0 ≤ ‖max 0 b - min 0 b‖ := norm_nonneg _
  have hsq : (‖max 0 b - min 0 b‖ / 2) ^ 2 ≤ 1 / 4 := by
    nlinarith [mul_nonneg hnn (sub_nonneg.2 hn)]
  push_cast
  exact div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_right hsq (sq_nonneg _)) (by norm_num)

private def centeredIndicator (μ : Measure Ω) (X : Ω → Bool) (b : ℝ) (ω : Ω) : ℝ :=
  weightedIndicator b (X ω) - ∫ z, weightedIndicator b (X z) ∂μ

/-- One side of the real weighted Fourier tail, in the units of the source. -/
theorem indicator_sum_tail [Fintype α] [IsProbabilityMeasure μ] {X : α → Ω → Bool}
    (hX : ∀ i, Measurable (X i)) (hIndep : iIndepFun X μ) (b : α → ℝ)
    (hb : ∀ i, |b i| ≤ 1) {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | t ≤ ∑ i, centeredIndicator μ (X i) (b i) ω} ≤
      Real.exp (-(2 * t ^ 2) / (Fintype.card α : ℝ)) := by
  have hC : iIndepFun (fun i => centeredIndicator μ (X i) (b i)) μ := by
    let g (i : α) (x : Bool) : ℝ :=
      weightedIndicator (b i) x - ∫ z, weightedIndicator (b i) (X i z) ∂μ
    exact hIndep.comp g (fun _ => measurable_of_countable _)
  have h := HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun hC
    (c := fun _ => (1 / 4 : ℝ≥0)) (s := univ)
    (fun i _ => indicator_subgaussian (hX i) (b i) (hb i)) ht
  convert h using 1
  push_cast
  rw [sum_const, card_univ, nsmul_eq_mul]
  congr 1
  ring

private theorem weightedIndicator_neg (b : ℝ) (x : Bool) :
    weightedIndicator (-b) x = -weightedIndicator b x := by
  cases x <;> simp [weightedIndicator]

private theorem centeredIndicator_neg (μ : Measure Ω) (X : Ω → Bool) (b : ℝ) (ω : Ω) :
    centeredIndicator μ X (-b) ω = -centeredIndicator μ X b ω := by
  simp only [centeredIndicator, weightedIndicator_neg, integral_neg]
  ring

/-- Two-sided probability bound for the real weighted indicator sum. -/
theorem indicator_sum_abs_tail [Fintype α] [IsProbabilityMeasure μ] {X : α → Ω → Bool}
    (hX : ∀ i, Measurable (X i)) (hIndep : iIndepFun X μ) (b : α → ℝ)
    (hb : ∀ i, |b i| ≤ 1) {t : ℝ} (ht : 0 ≤ t) :
    μ.real {ω | t ≤ |∑ i, centeredIndicator μ (X i) (b i) ω|} ≤
      2 * Real.exp (-(2 * t ^ 2) / (Fintype.card α : ℝ)) := by
  let sum (ω : Ω) := ∑ i, centeredIndicator μ (X i) (b i) ω
  have hPlus := indicator_sum_tail hX hIndep b hb ht
  have hMinus := indicator_sum_tail hX hIndep (fun i => -b i) (by simpa using hb) ht
  simp only [centeredIndicator_neg, sum_neg_distrib] at hMinus
  have hset : {ω | t ≤ |sum ω|} = {ω | t ≤ sum ω} ∪ {ω | t ≤ -sum ω} := by
    ext ω
    simp only [Set.mem_union, Set.mem_ofPred_eq, abs_eq_max_neg, le_max_iff]
  change μ.real {ω | t ≤ |sum ω|} ≤ _
  rw [hset, two_mul]
  exact (measureReal_union_le _ _).trans (add_le_add hPlus hMinus)

private def bernoulliMarginal {α : Type*} (q : α → ℝ≥0) (hq : ∀ i, q i ≤ 1) (i : α) :
    Measure Bool :=
  bernoulliMeasure true false ⟨(q i : ℝ), ⟨by positivity, by exact_mod_cast hq i⟩⟩

private instance bernoulliMarginal_probability {α : Type*}
    (q : α → ℝ≥0) (hq : ∀ i, q i ≤ 1) (i : α) :
    IsProbabilityMeasure (bernoulliMarginal q hq i) := by
  unfold bernoulliMarginal
  infer_instance

private theorem integral_indicator_prod [Fintype α] (q : α → ℝ≥0) (hq : ∀ i, q i ≤ 1)
    (i : α) (b : ℝ) :
    (∫ ω : α → Bool, weightedIndicator b (ω i) ∂Measure.pi (bernoulliMarginal q hq)) =
      (q i : ℝ) * b := by
  rw [integral_comp_eval (measurable_weightedIndicator b).aestronglyMeasurable]
  rw [bernoulliMarginal, integral_bernoulliMeasure]
  simp [weightedIndicator, smul_eq_mul]

/-- Simultaneously approximate the weighted means of a finite family of real
modes by one binary support. -/
theorem select_real_modes {β : Type*} [Fintype α] [Fintype β] (q : α → ℝ≥0)
    (hq : ∀ i, q i ≤ 1) (b : β → α → ℝ) (hb : ∀ l i, |b l i| ≤ 1)
    {t : ℝ} (ht : 0 ≤ t)
    (hsmall : 2 * (Fintype.card β : ℝ) *
      Real.exp (-(2 * t ^ 2) / (Fintype.card α : ℝ)) < 1) :
    ∃ S : Finset α, ∀ l, |(∑ i ∈ S, b l i) - ∑ i, (q i : ℝ) * b l i| < t := by
  classical
  let μ := Measure.pi (bernoulliMarginal q hq)
  have hX (i : α) : Measurable (fun ω : α → Bool => ω i) := measurable_pi_apply i
  have hIndep : iIndepFun (fun i (ω : α → Bool) => ω i) μ :=
    iIndepFun_pi (μ := bernoulliMarginal q hq) (X := fun _ => id)
      (fun _ => aemeasurable_id)
  let bad (l : β) : Set (α → Bool) :=
    {ω | t ≤ |∑ i, centeredIndicator μ (fun ω : α → Bool => ω i) (b l i) ω|}
  have hBad : μ.real (⋃ l, bad l) < 1 := by
    apply lt_of_le_of_lt (measureReal_iUnion_fintype_le bad)
    calc
      _ ≤ ∑ _l : β, (2 * Real.exp (-(2 * t ^ 2) / (Fintype.card α : ℝ))) := by
        apply sum_le_sum
        intro l _
        exact indicator_sum_abs_tail hX hIndep (b l) (hb l) ht
      _ = 2 * (Fintype.card β : ℝ) * Real.exp (-(2 * t ^ 2) / (Fintype.card α : ℝ)) := by
        simp [nsmul_eq_mul]
        ring
      _ < 1 := hsmall
  obtain ⟨ω, hω⟩ : ∃ ω, ω ∉ ⋃ l, bad l := by
    by_contra! h
    have he : (⋃ l, bad l) = Set.univ := Set.eq_univ_iff_forall.2 h
    rw [he] at hBad
    simp at hBad
  let S := univ.filter (fun i => ω i = true)
  refine ⟨S, fun l => ?_⟩
  have hgood : |∑ i, centeredIndicator μ (fun ω : α → Bool => ω i) (b l i) ω| < t := by
    apply lt_of_not_ge
    exact fun h => hω (Set.mem_iUnion.2 ⟨l, h⟩)
  have hs : (∑ i ∈ S, b l i) = ∑ i, weightedIndicator (b l i) (ω i) := by
    simp [S, sum_filter, weightedIndicator]
  simp only [centeredIndicator, μ, integral_indicator_prod, sum_sub_distrib] at hgood
  rwa [hs]

end

end NemethSeberryShu
