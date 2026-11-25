module
public import Conjectures.WachsCompleteGraphStrictLogConcavity

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

theorem gammaSumSeries_zero_eq_exp (n : ℕ) (rates : Fin 0 → ℝ) :
    gammaSumSeries 0 n rates = expAt (n:ℝ) := by simp [gammaSumSeries]

theorem formalGammaMoment_zero (n j : ℕ) (rates : Fin 0 → ℝ) :
    formalGammaMoment 0 n j rates=(n:ℝ)^j := by
  unfold formalGammaMoment
  rw [gammaSumSeries_zero_eq_exp,expAt_real_coeff]
  have h : (j.factorial:ℝ) ≠ 0 := by positivity
  field_simp

/-- The source's classical two-color specialization in the rank
convention, for all nonempty complete graphs and real parameters. -/
theorem weighted_complete_graph_two_colors (k : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic 2 (k+1)) =
      (1-((k+1:ℕ):ℝ)*t)^k := by
  obtain ⟨rates,_,_,h⟩ := weighted_complete_graph_positive_formal_moments 0
  rw [show characteristic 2 (k+1)=characteristic (0+2) (k+1) from rfl,h k t]
  simp_rw [formalGammaMoment_zero]
  rw [show 1-((k+1:ℕ):ℝ)*t = (-t)*((k+1:ℕ):ℝ)+1 by ring,add_pow]
  apply Finset.sum_congr rfl
  intro j _
  rw [mul_pow,one_pow]
  ring

end WachsCompleteGraph
