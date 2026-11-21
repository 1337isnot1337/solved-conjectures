module

public import Mathlib.Analysis.SpecialFunctions.Sqrt
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-!
The proper real-threshold case of Steinke and Zakynthinou, COLT 2020,
Conjecture 6 and §3. Information is measured in nats.
-/

open MeasureTheory
@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

abbrev Observation := ℝ × Bool
abbrev Sample (n : ℕ) := Fin n → Observation
abbrev Pool (n : ℕ) := Fin n → Bool → Observation
abbrev Selector (n : ℕ) := Fin n → Bool

def select {n : ℕ} (pool : Pool n) (s : Selector n) : Sample n :=
  fun i => pool i (s i)

noncomputable def totalLoss {n : ℕ} (z : Sample n) (t : ℝ) : ℝ :=
  ∑ i, if (decide (t ≤ (z i).1) : Bool) = (z i).2 then 0 else 1

noncomputable def empiricalLoss {n : ℕ} (z : Sample n) (t : ℝ) : ℝ :=
  totalLoss z t / n

/-- A finite-support randomized real-threshold learner. The indices of
its random outcomes form a fixed finite set. Several indices may produce
the same threshold, and every returned parameter is a finite real. -/
structure Learner (n : ℕ) where
  outcomes : ℕ
  threshold : Sample n → Fin outcomes → ℝ
  weight : Sample n → Fin outcomes → ℝ
  weight_nonneg : ∀ z i, 0 ≤ weight z i
  weight_sum : ∀ z, ∑ i, weight z i = 1
  measurable_threshold : ∀ i, Measurable (fun z => threshold z i)
  measurable_weight : ∀ i, Measurable (fun z => weight z i)

namespace Learner

variable {n : ℕ}

noncomputable def expectedLoss (a : Learner n) (z : Sample n) : ℝ :=
  ∑ i, a.weight z i * empiricalLoss z (a.threshold z i)

/-- The total mass at a parameter, combining all indices returning it. -/
noncomputable def mass (a : Learner n) (z : Sample n) (t : ℝ) : ℝ :=
  ∑ i, if a.threshold z i = t then a.weight z i else 0

noncomputable def selectorMean (f : Selector n → ℝ) : ℝ :=
  (∑ s, f s) / Fintype.card (Selector n)

/-- Mutual information at a fixed pool. The denominator is the output
mass averaged over all independent fair selections of the pool. The sum
over outcome indices equals the sum over distinct returned thresholds
because the likelihood ratio is constant across indices with the same
threshold. -/
noncomputable def poolInformation (a : Learner n) (pool : Pool n) : ℝ :=
  selectorMean fun s =>
    ∑ i,
      let z := select pool s
      let t := a.threshold z i
      a.weight z i * Real.log (a.mass z t / selectorMean (fun v => a.mass (select pool v) t))

/-- Original CMI, with all 2n pool entries independently drawn from D. -/
noncomputable def cmi (a : Learner n) (D : Measure Observation) : ℝ :=
  ∫ pool, a.poolInformation pool ∂(Measure.pi fun _ : Fin n => Measure.pi fun _ : Bool => D)

end Learner

/-- One constant serves every positive sample size, every distribution,
and every fixed sample. The loss inequality is stated for every
comparator, equivalently for the infimum over real thresholds. -/
def ProperThresholdProblem : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ n : ℕ, 0 < n → ∃ a : Learner n,
    (∀ D : Measure Observation, IsProbabilityMeasure D →
      Integrable a.poolInformation
        (Measure.pi fun _ : Fin n => Measure.pi fun _ : Bool => D) ∧ a.cmi D ≤ C) ∧
    ∀ (z : Sample n) (t : ℝ),
      a.expectedLoss z ≤ empiricalLoss z t + C / Real.sqrt n

end SteinkeZakynthinou
