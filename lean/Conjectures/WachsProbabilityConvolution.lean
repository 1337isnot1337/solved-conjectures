module
public import Conjectures.WachsProbabilitySeriesMoments

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory PowerSeries

variable {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]

private theorem binomial_add_real (x y : ℝ) (j : ℕ) :
    (x+y)^j = ∑ i ∈ Finset.range (j+1), (j.choose i:ℝ)*(x^i*y^(j-i)) := by
  rw [add_pow]
  apply Finset.sum_congr rfl
  intro i _
  ring

/-- Moments of the literal law of the sum of two independent variables
multiply as exponential generating series. -/
theorem probabilitySeriesMoments_independentSum {A B : PowerSeries ℝ}
    (hA : ProbabilitySeriesMoments μ A) (hB : ProbabilitySeriesMoments ν B) :
    ProbabilitySeriesMoments (independentSumLaw μ ν) (A*B) := by
  have hsum (j : ℕ) : (fun z : ℝ × ℝ => (z.1+z.2)^j) =
      fun z => ∑ i ∈ Finset.range (j+1), (j.choose i:ℝ)*(z.1^i*z.2^(j-i)) :=
    funext (fun z => binomial_add_real z.1 z.2 j)
  have hpow (j : ℕ) : Measurable (fun x : ℝ => x^j) := by fun_prop
  have hadd : Measurable (fun z : ℝ × ℝ => z.1+z.2) := by fun_prop
  have hi (i j : ℕ) :
      Integrable (fun z : ℝ × ℝ => (j.choose i:ℝ)*(z.1^i*z.2^(j-i))) (μ.prod ν) :=
    ((hA.moments_integrable i).mul_prod (hB.moments_integrable (j-i))).const_mul _
  constructor
  · intro j
    unfold independentSumLaw
    apply (integrable_map_measure (hpow j).aestronglyMeasurable hadd.aemeasurable).mpr
    change Integrable (fun z : ℝ × ℝ => (z.1+z.2)^j) (μ.prod ν)
    rw [hsum]
    exact integrable_finsetSum _ (fun i _ => hi i j)
  · intro j
    unfold independentSumLaw
    rw [integral_map hadd.aemeasurable (hpow j).aestronglyMeasurable]
    rw [hsum,integral_finsetSum _ (fun i _ => hi i j),coeff_mul,
      Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hi'
    rw [integral_const_mul,integral_prod_mul (fun x : ℝ => x^i) (fun y : ℝ => y^(j-i)),hA.integral_eq_coeff,hB.integral_eq_coeff]
    have hd : i≤j := Nat.le_of_lt_succ (Finset.mem_range.mp hi')
    have hcast : (j.choose i:ℝ)*(i.factorial:ℝ)*((j-i).factorial:ℝ)=(j.factorial:ℝ) := by
      exact_mod_cast Nat.choose_mul_factorial_mul_factorial hd
    linear_combination (coeff i A*coeff (j-i) B)*hcast

end WachsCompleteGraph
