import Mathlib.Basic.Real.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Positivity

namespace DospolovaGermanskovZaporozhets

noncomputable def factorialSequence (c : ℝ) (n : ℕ) : ℝ := c^n / (n.factorial : ℝ)

theorem factorialSequence_zero (c : ℝ) : factorialSequence c 0 = 1 := by
  simp [factorialSequence]

theorem factorialSequence_positive (c : ℝ) (hc : 0 < c) (n : ℕ) :
    0 < factorialSequence c n := by
  unfold factorialSequence
  positivity

theorem ultra_log_concavity_eq (c : ℝ) (n : ℕ) (hn : 1 ≤ n) :
    (factorialSequence c n)^2 = ((n+1 : ℕ) : ℝ) / n *
      factorialSequence c (n-1) * factorialSequence c (n+1) := by
  obtain ⟨k, rfl⟩ : ∃ k, n = k+1 := ⟨n-1, by omega⟩
  unfold factorialSequence
  have hk : (Nat.factorial k : ℝ) ≠ 0 := by positivity
  have hk1 : ((k+1 : ℕ) : ℝ) ≠ 0 := by positivity
  have hk2 : ((k+2 : ℕ) : ℝ) ≠ 0 := by positivity
  simp only [Nat.add_sub_cancel, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
  rw [show k+1+1 = k+2 by omega, pow_succ, show k+2 = (k+1)+1 by omega, pow_succ]
  field_simp
  ring

theorem scaled_ratio (c : ℝ) (hc : 0 < c) (n : ℕ) (hn : 1 ≤ n) :
    (n : ℝ) * factorialSequence c n / factorialSequence c (n-1) = c := by
  obtain ⟨k, rfl⟩ : ∃ k, n = k+1 := ⟨n-1, by omega⟩
  unfold factorialSequence
  have hf : (Nat.factorial k : ℝ) ≠ 0 := by positivity
  have hpow : c^k ≠ 0 := by positivity
  have hk : ((k+1 : ℕ) : ℝ) ≠ 0 := by positivity
  simp only [Nat.add_sub_cancel, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one, pow_succ]
  field_simp

open MeasureTheory Filter
open scoped Topology

theorem mean_strict_of_tail {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (range : Ω → ℝ) (a : ℝ)
    (hint : Integrable range μ) (hbound : ∀ᵐ x ∂μ, a ≤ range x)
    (htail : 0 < μ {x | a < range x}) : a < ∫ x, range x ∂μ := by
  have hint' : Integrable (fun x => range x - a) μ := hint.sub (integrable_const a)
  have hnonneg : 0 ≤ᵐ[μ] (fun x => range x - a) := by
    filter_upwards [hbound] with x hx
    change 0 ≤ range x - a
    linarith
  have hsupport : 0 < μ (Function.support (fun x => range x - a)) := by
    apply lt_of_lt_of_le htail
    apply measure_mono
    intro x hx
    simp only [Set.mem_ofPred_eq] at hx
    change range x - a ≠ 0
    linarith
  have hpos := (integral_pos_iff_support_of_nonneg_ae hnonneg hint').2 hsupport
  rw [integral_sub hint (integrable_const a), integral_const] at hpos
  simpa using hpos

theorem ae_bound_of_countable_limit {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (range : Ω → ℝ) (b : ℕ → ℝ) (a : ℝ)
    (hlim : Tendsto b atTop (𝓝 a)) (hbound : ∀ n, ∀ᵐ x ∂μ, b n ≤ range x) :
    ∀ᵐ x ∂μ, a ≤ range x := by
  have hall : ∀ᵐ x ∂μ, ∀ n, b n ≤ range x := ae_all_iff.mpr hbound
  filter_upwards [hall] with x hx
  exact le_of_tendsto' hlim hx

theorem gaussian_tail_positive {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (hX : Measurable X) (m : ℝ) (v : NNReal) (hv : v ≠ 0)
    (hlaw : μ.map X = ProbabilityTheory.gaussianReal m v) (a : ℝ) :
    0 < μ {x | a < X x} := by
  have hgauss : 0 < ProbabilityTheory.gaussianReal m v (Set.Ioi a) := by
    apply pos_iff_ne_zero.mpr
    intro hz
    have hac := ProbabilityTheory.gaussianReal_absolutelyContinuous' m hv
    have hz' := hac hz
    rw [Real.volume_Ioi] at hz'
    exact ENNReal.top_ne_zero hz'
  rw [← hlaw, Measure.map_apply hX measurableSet_Ioi] at hgauss
  exact hgauss

theorem gaussian_forces_strict_mean {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (range X : Ω → ℝ) (a m : ℝ) (v : NNReal)
    (hv : v ≠ 0) (hX : Measurable X)
    (hlaw : μ.map X = ProbabilityTheory.gaussianReal m v)
    (hdom : ∀ x, X x ≤ range x) (hint : Integrable range μ)
    (hbound : ∀ᵐ x ∂μ, a ≤ range x) : a < ∫ x, range x ∂μ := by
  apply mean_strict_of_tail μ range a hint hbound
  apply lt_of_lt_of_le (gaussian_tail_positive μ X hX m v hv hlaw a)
  apply measure_mono
  intro x hx
  change a < X x at hx
  change a < range x
  exact lt_of_lt_of_le hx (hdom x)

theorem no_saturated_gaussian_range {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (range X : Ω → ℝ) (a m : ℝ) (v : NNReal)
    (hv : v ≠ 0) (hX : Measurable X)
    (hlaw : μ.map X = ProbabilityTheory.gaussianReal m v)
    (hdom : ∀ x, X x ≤ range x) (hint : Integrable range μ)
    (hbound : ∀ᵐ x ∂μ, a ≤ range x) : (∫ x, range x ∂μ) ≠ a := by
  exact ne_of_gt (gaussian_forces_strict_mean μ range X a m v hv hX hlaw hdom hint hbound)

end DospolovaGermanskovZaporozhets
