module
public import Conjectures.WachsCompleteGraphStrictLogConcavity

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

theorem normalizedLaguerre_one_explicit :
    normalizedLaguerre 1 = 1+Polynomial.C (1/2:ℚ)*Polynomial.X := by
  ext i
  cases i with
  | zero => norm_num [normalizedLaguerre_coeff,Polynomial.coeff_C_mul]
  | succ i =>
    cases i with
    | zero => norm_num [normalizedLaguerre_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_one]
    | succ i =>
      have hi : 1 < i+1+1 := by omega
      simp only [normalizedLaguerre_coeff,Nat.choose_eq_zero_of_lt hi,Nat.cast_zero,zero_div,
        Polynomial.coeff_add,Polynomial.coeff_C_mul]
      simp [Polynomial.coeff_one,Polynomial.coeff_X]

theorem laguerre_three_color_rate : HasLaguerreFactorization 1 (fun _ : Fin 1 => (2:ℝ)) := by
  unfold HasLaguerreFactorization laguerreAt
  rw [PowerSeries.rescale_one,Fin.prod_univ_one,normalizedLaguerre_one_explicit]
  simp [linearFactor,Polynomial.coe_add,Polynomial.coe_mul, one_div]

theorem formalGammaMoment_three_color (k j : ℕ) :
    formalGammaMoment 1 (k+1) j (fun _ : Fin 1 => (2:ℝ)) =
      ∑ i ∈ Finset.range (j+1), (j.choose i:ℝ)*((k+1:ℕ):ℝ)^(j-i)*
        (((k+i).factorial:ℝ)/(k.factorial:ℝ))/(2:ℝ)^i := by
  unfold formalGammaMoment gammaSumSeries
  rw [Fin.prod_univ_one,mul_comm (expAt _),coeff_mul,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  change (j.factorial:ℝ)*(coeff i (gammaMomentFactor (k+1) (2:ℝ))*
    coeff (j-i) (expAt ((k+1:ℕ):ℝ))) = _
  rw [gammaMomentFactor_coeff _ _ (by omega),Nat.add_sub_cancel,expAt_real_coeff,inv_pow]
  have i_le : i≤j := Nat.le_of_lt_succ (Finset.mem_range.mp hi)
  have h₁ : (j.factorial:ℝ)/((j-i).factorial:ℝ) = (j.choose i:ℝ)*(i.factorial:ℝ) := by
    apply (div_eq_iff (by positivity)).mpr
    exact_mod_cast (Nat.choose_mul_factorial_mul_factorial i_le).symm
  have h₂ : (i.factorial:ℝ)*((k+i).choose i:ℝ) = ((k+i).factorial:ℝ)/(k.factorial:ℝ) := by
    apply (eq_div_iff (by positivity)).mpr
    have h := Nat.add_choose_mul_factorial_mul_factorial k i
    exact_mod_cast (show i.factorial * (k+i).choose i * k.factorial = (k+i).factorial from by
      simpa [Nat.mul_assoc,Nat.mul_left_comm,Nat.mul_comm] using h)
  calc
    _ = ((j.factorial:ℝ)/((j-i).factorial:ℝ))*((k+i).choose i:ℝ)*
      ((k+1:ℕ):ℝ)^(j-i)/(2:ℝ)^i := by ring
    _ = _ := by
      rw [h₁]
      linear_combination (((j.choose i:ℝ)*((k+1:ℕ):ℝ)^(j-i))/(2:ℝ)^i)*h₂

/-- The printed three-color coefficient example is the exact literal
complete-graph evaluation, not merely a finite numerical check. -/
theorem weighted_complete_graph_three_color_example (k : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic 3 (k+1)) =
      ∑ j ∈ Finset.range (k+1), (k.choose j:ℝ)*(-t)^j*
        (∑ i ∈ Finset.range (j+1),(j.choose i:ℝ)*((k+1:ℕ):ℝ)^(j-i)*
          (((k+i).factorial:ℝ)/(k.factorial:ℝ))/(2:ℝ)^i) := by
  rw [show characteristic 3 (k+1)=characteristic (1+2) (k+1) from rfl,
    weighted_complete_graph_formal_moments 1 k t _ laguerre_three_color_rate]
  simp_rw [formalGammaMoment_three_color]

end WachsCompleteGraph
