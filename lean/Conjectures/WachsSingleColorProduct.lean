module
public import Conjectures.WachsSingleColorDifferential

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

theorem coeff_X_derivative (A : PowerSeries ℝ) (n : ℕ) :
    coeff n (X*derivative A) = (n:ℝ)*coeff n A := by
  cases n with
  | zero => simp
  | succ n => rw [coeff_succ_X_mul,coeff_derivative,Nat.cast_succ,mul_comm]

theorem single_characteristic_coefficient_step (t : ℝ) (n : ℕ) :
    (n.factorial:ℝ)*((n:ℝ)+1)*coeff (n+1) (singleCharacteristicSeries t) =
      (1-(n:ℝ)*t)*((n.factorial:ℝ)*coeff n (singleCharacteristicSeries t)) := by
  let A := singleCharacteristicSeries t
  have h := congrArg (coeff n) (single_characteristic_differential t)
  change coeff n ((1+C t*X)*derivative A) = coeff n A at h
  rw [add_mul,one_mul,mul_assoc,map_add,coeff_C_mul,coeff_X_derivative,coeff_derivative] at h
  linear_combination (n.factorial:ℝ)*h

theorem singleCharacteristic_constant (t : ℝ) : coeff 0 (singleCharacteristicSeries t) = 1 := by
  rw [singleCharacteristicSeries,singleBlockSeries,coeff_subst_zero_constant_range _ _ (constant_blockEGF _),
    Finset.sum_range_one]
  simp

/-- The exact one-color answer including zero parameter, obtained from
the actual weighted Möbius values, not from a chromatic-polynomial axiom. -/
theorem weighted_complete_graph_single_color (n : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic 1 n) =
      ∏ j ∈ Finset.range n, (1-(j:ℝ)*t) := by
  simp_rw [single_characteristic_coeff]
  induction n with
  | zero => simp [singleCharacteristic_constant]
  | succ n ih =>
    rw [Finset.prod_range_succ,← ih,Nat.factorial_succ,Nat.cast_mul,Nat.cast_succ]
    have he := single_characteristic_coefficient_step t n
    linear_combination he

end WachsCompleteGraph
