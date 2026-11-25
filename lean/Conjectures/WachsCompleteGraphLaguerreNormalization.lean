module

public import Conjectures.WachsCompleteGraphCoefficientFormula

@[expose] public section
namespace WachsCompleteGraph

/-- The conventional coefficient formula for the associated Laguerre
polynomial L_p^(1)(z), before changing the sign of its variable. -/
noncomputable def classicalLaguerre (p : ℕ) : Polynomial ℚ :=
  ∑ i ∈ Finset.range (p+1),
    Polynomial.monomial i (((-1:ℚ)^i)*((p+1).choose (i+1):ℚ)/(i.factorial:ℚ))

theorem classicalLaguerre_coeff (p i : ℕ) :
    (classicalLaguerre p).coeff i =
      (-1:ℚ)^i*((p+1).choose (i+1):ℚ)/(i.factorial:ℚ) := by
  unfold classicalLaguerre
  rw [Polynomial.finsetSum_coeff]
  simp only [Polynomial.coeff_monomial,Finset.sum_ite_eq',Finset.mem_range]
  by_cases h : i<p+1
  · simp [h]
  · have hn : p+1 < i+1 := by omega
    simp [h,Nat.choose_eq_zero_of_lt hn]

theorem laguerre_coeff_normalized (p i : ℕ) :
    (p+1:ℚ)*((p.choose i:ℚ)/((i+1).factorial:ℚ)) =
      ((p+1).choose (i+1):ℚ)/(i.factorial:ℚ) := by
  have h := congrArg (fun n : ℕ => (n:ℚ)) (Nat.add_one_mul_choose_eq p i)
  push_cast at h
  rw [Nat.factorial_succ i]
  push_cast
  have hn : ((i.factorial:ℕ):ℚ)≠0 := by positivity
  have hi : (i+1:ℚ)≠0 := by positivity
  field_simp
  exact h.trans (mul_comm _ _)

theorem normalizedLaguerre_is_classical (p : ℕ) :
    PowerSeries.rescale (-1:ℚ) (classicalLaguerre p).toPowerSeries =
      PowerSeries.C (p+1:ℚ)*(normalizedLaguerre p).toPowerSeries := by
  apply PowerSeries.ext
  intro i
  rw [PowerSeries.coeff_rescale,PowerSeries.coeff_C_mul,Polynomial.coeff_coe,
    Polynomial.coeff_coe,normalizedLaguerre_coeff,classicalLaguerre_coeff,
    laguerre_coeff_normalized]
  have hs : (-1:ℚ)^i*(-1:ℚ)^i=1 := by rw [←mul_pow]; norm_num
  calc
    _ = (((p+1).choose (i+1):ℚ)/(i.factorial:ℚ))*((-1:ℚ)^i*(-1:ℚ)^i) := by ring
    _ = _ := by rw [hs,mul_one]

end WachsCompleteGraph
