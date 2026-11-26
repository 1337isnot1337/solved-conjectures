module
public import Conjectures.PomeranceSarkozyActualCountMeasure
public import Conjectures.PomeranceSarkozyMeasureEvent

@[expose] public section
namespace PomeranceSarkozy

open ProbabilityTheory MeasureTheory
open scoped ENNReal NNReal BigOperators

theorem arithmeticOffsetCountMeasure_univ (I P : Finset ℕ) (L N : ℕ) :
    arithmeticOffsetCountMeasure I P L N Set.univ = (N:ℝ≥0∞)/(N:ℝ≥0∞) := by
  classical
  rw [arithmeticOffsetCountMeasure,Measure.map_apply (.of_discrete) MeasurableSet.univ,
    Set.preimage_univ,Measure.uniformOfFinset_apply]
  simp

instance (I P : Finset ℕ) (L N : ℕ) :
    IsFiniteMeasure (arithmeticOffsetCountMeasure I P L N) := by
  constructor
  rw [arithmeticOffsetCountMeasure_univ]
  by_cases h : N=0
  · simp [h]
  · have hN : (N:ℝ≥0∞)≠0 := by exact_mod_cast h
    rw [ENNReal.div_self hN (ENNReal.natCast_ne_top N)]
    exact ENNReal.one_lt_top

theorem arithmeticOffsetCountMeasure_isProbabilityMeasure (I P : Finset ℕ) (L N : ℕ)
    (hN : 0<N) : IsProbabilityMeasure (arithmeticOffsetCountMeasure I P L N) := by
  constructor
  rw [arithmeticOffsetCountMeasure_univ]
  exact ENNReal.div_self (by exact_mod_cast hN.ne') (ENNReal.natCast_ne_top N)

/-- The finite cutoff bound controls every event of the literal
arithmetic offset-count vector, against the independent Poisson vector. -/
theorem arithmetic_poisson_event_error_le {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (L N R y : ℕ) (hN : 0<N) (hy : 0<y)
    (hP : ∀ p∈P,p.Prime) (hPy : ∀ p∈P,y<p)
    (hI : ∀ h∈I,∀ p∈P,h<p) (hL : ∀ h∈I,h≤L) (A : Set (↥I→ℕ)) :
    let μ := arithmeticOffsetCountMeasure I P L N
    let p (i : Fin n) := (e i).val
    let ν := Measure.pi (fun _ : ↥I => poissonMeasure (∑ i,reciprocalRates p i))
    ENNReal.ofReal |μ.real A-ν.real A| ≤
      ENNReal.ofReal (crtWindowL1Bound (I×ˢP) N R:ℝ)+ENNReal.ofReal (2*(I.card:ℝ)^2/(y:ℝ)) := by
  dsimp only
  refine (measure_event_difference_le_atomicL1 _ _ A).trans ?_
  exact arithmetic_measure_poisson_count_l1 I P e L N R y hN hy hP hPy hI hL

end PomeranceSarkozy
