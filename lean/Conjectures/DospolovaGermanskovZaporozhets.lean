import Mathlib.Basic.Real.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.Distributions.Gaussian.IsGaussianProcess.Basic
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
    (X : Ω → ℝ) (hX : AEMeasurable X μ) (m : ℝ) (v : NNReal) (hv : v ≠ 0)
    (hlaw : μ.map X = ProbabilityTheory.gaussianReal m v) (a : ℝ) :
    0 < μ {x | a < X x} := by
  have hgauss : 0 < ProbabilityTheory.gaussianReal m v (Set.Ioi a) := by
    apply pos_iff_ne_zero.mpr
    intro hz
    have hac := ProbabilityTheory.gaussianReal_absolutelyContinuous' m hv
    have hz' := hac hz
    rw [Real.volume_Ioi] at hz'
    exact ENNReal.top_ne_zero hz'
  rw [← hlaw, Measure.map_apply_of_aemeasurable hX measurableSet_Ioi] at hgauss
  exact hgauss

theorem gaussian_forces_strict_mean {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (range X : Ω → ℝ) (a m : ℝ) (v : NNReal)
    (hv : v ≠ 0) (hX : AEMeasurable X μ)
    (hlaw : μ.map X = ProbabilityTheory.gaussianReal m v)
    (hdom : ∀ᵐ x ∂μ, X x ≤ range x) (hint : Integrable range μ)
    (hbound : ∀ᵐ x ∂μ, a ≤ range x) : a < ∫ x, range x ∂μ := by
  apply mean_strict_of_tail μ range a hint hbound
  apply lt_of_lt_of_le (gaussian_tail_positive μ X hX m v hv hlaw a)
  apply measure_mono_ae
  filter_upwards [hdom] with x hx htail
  change a < X x at htail
  exact lt_of_lt_of_le htail hx

theorem no_saturated_gaussian_range {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (range X : Ω → ℝ) (a m : ℝ) (v : NNReal)
    (hv : v ≠ 0) (hX : AEMeasurable X μ)
    (hlaw : μ.map X = ProbabilityTheory.gaussianReal m v)
    (hdom : ∀ᵐ x ∂μ, X x ≤ range x) (hint : Integrable range μ)
    (hbound : ∀ᵐ x ∂μ, a ≤ range x) : (∫ x, range x ∂μ) ≠ a := by
  exact ne_of_gt (gaussian_forces_strict_mean μ range X a m v hv hX hlaw hdom hint hbound)

noncomputable def sampleRange {T Ω : Type*} (K : Set T) (X : T → Ω → ℝ) (ω : Ω) : ℝ :=
  sSup ((fun t => X t ω) '' K) - sInf ((fun t => X t ω) '' K)

theorem increment_le_sampleRange {T Ω : Type*} (K : Set T) (X : T → Ω → ℝ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (ω : Ω)
    (hupper : BddAbove ((fun u => X u ω) '' K))
    (hlower : BddBelow ((fun u => X u ω) '' K)) :
    X s ω - X t ω ≤ sampleRange K X ω := by
  unfold sampleRange
  have h1 : X s ω ≤ sSup ((fun u => X u ω) '' K) := le_csSup hupper ⟨s, hs, rfl⟩
  have h2 : sInf ((fun u => X u ω) '' K) ≤ X t ω := csInf_le hlower ⟨t, ht, rfl⟩
  linarith

theorem process_range_strict {T Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (a m : ℝ) (v : NNReal)
    (hv : v ≠ 0) (hX : AEMeasurable (fun ω => X s ω - X t ω) μ)
    (hlaw : μ.map (fun ω => X s ω - X t ω) = ProbabilityTheory.gaussianReal m v)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ)
    (hbound : ∀ᵐ ω ∂μ, a ≤ sampleRange K X ω) :
    a < ∫ ω, sampleRange K X ω ∂μ := by
  apply gaussian_forces_strict_mean μ (sampleRange K X) (fun ω => X s ω - X t ω)
    a m v hv hX hlaw ?_ hint hbound
  filter_upwards [hbounded] with ω hω
  exact increment_le_sampleRange K X s t hs ht ω hω.1 hω.2

theorem gaussian_process_range_strict {T Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (hX : ProbabilityTheory.IsGaussianProcess X μ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (a : ℝ)
    (hvariance : 0 < ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ)
    (hbound : ∀ᵐ ω ∂μ, a ≤ sampleRange K X ω) :
    a < ∫ ω, sampleRange K X ω ∂μ := by
  have hgauss := hX.hasGaussianLaw_fun_sub (s := s) (t := t)
  have hv : (ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ).toNNReal ≠ 0 :=
    ne_of_gt (Real.toNNReal_pos.mpr hvariance)
  exact process_range_strict μ K X s t hs ht a
    (∫ ω, (X s ω - X t ω) ∂μ)
    (ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ).toNNReal
    hv hgauss.aemeasurable hgauss.map_eq_gaussianReal hbounded hint hbound

theorem gaussian_process_strict_from_local_bounds {T Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (hX : ProbabilityTheory.IsGaussianProcess X μ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (a : ℝ) (b : ℕ → ℝ)
    (hvariance : 0 < ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ) (hlim : Tendsto b atTop (𝓝 a))
    (hlocal : ∀ n, ∀ᵐ ω ∂μ, b n ≤ sampleRange K X ω) :
    a < ∫ ω, sampleRange K X ω ∂μ :=
  gaussian_process_range_strict μ K X hX s t hs ht a hvariance hbounded hint
    (ae_bound_of_countable_limit μ (sampleRange K X) b a hlim hlocal)

theorem gaussian_process_strict_from_local_sup {T Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (hX : ProbabilityTheory.IsGaussianProcess X μ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (S : Set ℝ)
    (hS : S.Nonempty) (hSbound : BddAbove S)
    (hvariance : 0 < ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ)
    (hlocal : ∀ b ∈ S, ∀ᵐ ω ∂μ, b ≤ sampleRange K X ω) :
    sSup S < ∫ ω, sampleRange K X ω ∂μ := by
  obtain ⟨b, _, hlim, hb⟩ := exists_seq_tendsto_sSup hS hSbound
  apply gaussian_process_strict_from_local_bounds μ K X hX s t hs ht (sSup S) b
    hvariance hbounded hint hlim
  intro n
  exact hlocal (b n) (hb n)

theorem sampleRange_mono {T Ω : Type*} (A B : Set T) (X : T → Ω → ℝ)
    (hA : A.Nonempty) (hAB : A ⊆ B) (ω : Ω)
    (hupper : BddAbove ((fun u => X u ω) '' B))
    (hlower : BddBelow ((fun u => X u ω) '' B)) :
    sampleRange A X ω ≤ sampleRange B X ω := by
  have himage : ((fun u => X u ω) '' A) ⊆ ((fun u => X u ω) '' B) := Set.image_mono hAB
  have hne : (((fun u => X u ω) '' A) : Set ℝ).Nonempty := hA.image _
  have hs := csSup_le_csSup hupper hne himage
  have hi := csInf_le_csInf hlower hne himage
  unfold sampleRange
  linarith

theorem local_limit_bounded {T Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (K : Set T) (X : T → Ω → ℝ) (A : ℕ → Set T) (b : ℝ)
    (hne : ∀ n, (A n).Nonempty) (hsub : ∀ n, A n ⊆ K)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hlim : ∀ᵐ ω ∂μ, Tendsto (fun n => sampleRange (A n) X ω) atTop (𝓝 b)) :
    ∀ᵐ ω ∂μ, b ≤ sampleRange K X ω := by
  filter_upwards [hbounded, hlim] with ω hw hl
  apply le_of_tendsto' hl
  intro n
  exact sampleRange_mono (A n) K X (hne n) (hsub n) ω hw.1 hw.2

theorem local_oscillation_strict {T Ω : Type*} [PseudoMetricSpace T] [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (hX : ProbabilityTheory.IsGaussianProcess X μ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (osc : T → ℝ)
    (hoscBound : BddAbove (osc '' K))
    (hvariance : 0 < ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ)
    (hlocal : ∀ u ∈ K, ∀ᵐ ω ∂μ,
      Tendsto (fun n : ℕ => sampleRange (K ∩ Metric.ball u (1/((n:ℝ)+1))) X ω) atTop (𝓝 (osc u))) :
    sSup (osc '' K) < ∫ ω, sampleRange K X ω ∂μ := by
  have hne : K.Nonempty := ⟨s, hs⟩
  apply gaussian_process_strict_from_local_sup μ K X hX s t hs ht (osc '' K)
    (hne.image osc) hoscBound hvariance hbounded hint
  intro b hb
  obtain ⟨u, hu, rfl⟩ := hb
  apply local_limit_bounded μ K X (fun n => K ∩ Metric.ball u (1/((n:ℝ)+1))) (osc u)
  · intro n
    exact ⟨u, hu, Metric.mem_ball_self (by positivity)⟩
  · intro n
    exact Set.inter_subset_left
  · exact hbounded
  · exact hlocal u hu

theorem local_oscillation_bounded {T Ω : Type*} [PseudoMetricSpace T] [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (osc : T → ℝ)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ)
    (hlocal : ∀ u ∈ K, ∀ᵐ ω ∂μ,
      Tendsto (fun n : ℕ => sampleRange (K ∩ Metric.ball u (1/((n:ℝ)+1))) X ω) atTop (𝓝 (osc u))) :
    BddAbove (osc '' K) := by
  refine ⟨∫ ω, sampleRange K X ω ∂μ, ?_⟩
  rintro y ⟨u, hu, rfl⟩
  have ha : ∀ᵐ ω ∂μ, osc u ≤ sampleRange K X ω := by
    apply local_limit_bounded μ K X (fun n => K ∩ Metric.ball u (1/((n:ℝ)+1))) (osc u)
    · intro n
      exact ⟨u, hu, Metric.mem_ball_self (by positivity)⟩
    · intro n
      exact Set.inter_subset_left
    · exact hbounded
    · exact hlocal u hu
  have h := integral_mono_ae (integrable_const (osc u)) hint ha
  simpa using h

theorem local_oscillation_strict_unconditional_bound {T Ω : Type*} [PseudoMetricSpace T] [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (K : Set T) (X : T → Ω → ℝ)
    (hX : ProbabilityTheory.IsGaussianProcess X μ)
    (s t : T) (hs : s ∈ K) (ht : t ∈ K) (osc : T → ℝ)
    (hvariance : 0 < ProbabilityTheory.variance (fun ω => X s ω - X t ω) μ)
    (hbounded : ∀ᵐ ω ∂μ, BddAbove ((fun u => X u ω) '' K) ∧ BddBelow ((fun u => X u ω) '' K))
    (hint : Integrable (sampleRange K X) μ)
    (hlocal : ∀ u ∈ K, ∀ᵐ ω ∂μ,
      Tendsto (fun n : ℕ => sampleRange (K ∩ Metric.ball u (1/((n:ℝ)+1))) X ω) atTop (𝓝 (osc u))) :
    sSup (osc '' K) < ∫ ω, sampleRange K X ω ∂μ :=
  local_oscillation_strict μ K X hX s t hs ht osc
    (local_oscillation_bounded μ K X osc hbounded hint hlocal) hvariance hbounded hint hlocal

end DospolovaGermanskovZaporozhets
