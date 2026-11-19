import Conjectures.LineSizeGeneratingCoefficient

/-! The exact formal generating function of the line-size tuple count.
The infinite core sum is defined coefficientwise; only finitely many core
lengths contribute to each coefficient. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

theorem coeff_coreTerm_eq_zero_of_gt (r n : ℕ) (h : n < r) :
    coeff n (coreTerm r)=0 := by
  rw [coeff_coreTerm,exactCoreSizes_eq_empty_of_gt r n h,card_empty,Nat.cast_zero]

theorem coeff_largeCoreTerm_eq_zero_of_gt (r n : ℕ) (hr : 3 ≤ r) (h : n < r) :
    coeff n (largeCoreTerm r)=0 := by
  rw [← coreTerm_of_ge_three r hr]
  exact coeff_coreTerm_eq_zero_of_gt r n h

/-- The coefficientwise sum over all core lengths at least three.
The omitted terms vanish by `coeff_largeCoreTerm_eq_zero_of_gt`. -/
def largeCoreSeries : PowerSeries ℚ :=
  PowerSeries.mk (fun n => ∑ r ∈ Ico 3 (n+1), coeff n (largeCoreTerm r))

@[simp] theorem coeff_largeCoreSeries (n : ℕ) :
    coeff n largeCoreSeries=∑ r ∈ Ico 3 (n+1), coeff n (largeCoreTerm r) := by
  simp only [largeCoreSeries,PowerSeries.coeff_mk]

theorem coeff_tupleCostSeries_eq_core_sum (n : ℕ) :
    coeff n tupleCostSeries=∑ r ∈ range (n+1), coeff n (coreTerm r) := by
  rw [coeff_tupleCostSeries,exactCount_eq_sum_coreCounts,Nat.cast_sum]
  simp only [coeff_coreTerm]

theorem sum_range_eq_three_add_Ico (n : ℕ) (f : ℕ → ℚ)
    (h : ∀ r, n < r → f r=0) :
    (∑ r ∈ range (n+1), f r)=f 0+f 1+f 2+∑ r ∈ Ico 3 (n+1), f r := by
  by_cases hn : 2 ≤ n
  · have hsplit := sum_range_add_sum_Ico f (show 3 ≤ n+1 by omega)
    have hfirst : (∑ r ∈ range 3, f r)=f 0+f 1+f 2 := by
      simp only [sum_range_succ,sum_range_zero,zero_add]
    rw [hfirst] at hsplit
    exact hsplit.symm
  · have hsmall : n=0 ∨ n=1 := by omega
    rcases hsmall with rfl | rfl
    · simp [h 1 (by omega),h 2 (by omega)]
    · simp [sum_range_succ,h 2 (by omega)]

/-- The complete exact-cost generating function. The finite products
`gapSeries r` are the inverses of `∏_{j=1}^r (1-X^j)`. -/
theorem tupleCostSeries_eq :
    tupleCostSeries=1+(PowerSeries.X : PowerSeries ℚ)^3*gapSeries 1+
      (PowerSeries.X : PowerSeries ℚ)^6*gapSeries 2+largeCoreSeries := by
  ext n
  rw [coeff_tupleCostSeries_eq_core_sum,
    sum_range_eq_three_add_Ico n (fun r => coeff n (coreTerm r))
      (fun r hr => coeff_coreTerm_eq_zero_of_gt r n hr)]
  simp only [map_add,coreTerm_zero,coreTerm_one,coreTerm_two,coeff_largeCoreSeries]
  congr 1
  apply sum_congr rfl
  intro r hr
  rw [coreTerm_of_ge_three r (mem_Ico.mp hr).1]

/-- The cumulative count has the asserted generating function after
the factor `1-X` is removed. -/
theorem one_sub_X_mul_tupleCountSeries_eq :
    (1-(PowerSeries.X : PowerSeries ℚ))*tupleCountSeries=
      1+(PowerSeries.X : PowerSeries ℚ)^3*gapSeries 1+
        (PowerSeries.X : PowerSeries ℚ)^6*gapSeries 2+largeCoreSeries := by
  rw [one_sub_X_mul_tupleCountSeries,tupleCostSeries_eq]

theorem coeff_largeCoreTerm (r n : ℕ) :
    coeff n (largeCoreTerm r)=
      (2^(r-3)) • ((if r^2 ≤ n then (gapCount r (n-r^2) : ℚ) else 0)+
        (if r^2+r ≤ n then (gapCount r (n-(r^2+r)) : ℚ) else 0)) := by
  rw [largeCoreTerm,map_nsmul,mul_add,mul_one,add_mul,← pow_add,map_add,
    PowerSeries.coeff_X_pow_mul',PowerSeries.coeff_X_pow_mul']
  simp only [coeff_gapSeries]

/-- An explicit finite coefficient formula for every exact tuple cost. -/
theorem exactCount_formula (n : ℕ) :
    (exactCount n : ℚ)=(if n=0 then 1 else 0)+
      (if 3 ≤ n then (gapCount 1 (n-3) : ℚ) else 0)+
      (if 6 ≤ n then (gapCount 2 (n-6) : ℚ) else 0)+
      ∑ r ∈ Ico 3 (n+1), (2^(r-3)) •
        ((if r^2 ≤ n then (gapCount r (n-r^2) : ℚ) else 0)+
          (if r^2+r ≤ n then (gapCount r (n-(r^2+r)) : ℚ) else 0)) := by
  rw [← coeff_tupleCostSeries,tupleCostSeries_eq]
  simp only [map_add,PowerSeries.coeff_one,PowerSeries.coeff_X_pow_mul',coeff_gapSeries,
    coeff_largeCoreSeries,coeff_largeCoreTerm]

theorem largeCoreTerm_mul_denominator (r : ℕ) :
    largeCoreTerm r*(∏ j : Fin r, (1-(PowerSeries.X : PowerSeries ℚ)^(j.val+1)))=
      (2^(r-3)) • ((PowerSeries.X : PowerSeries ℚ)^(r^2)*
        (1+(PowerSeries.X : PowerSeries ℚ)^r)) := by
  rw [largeCoreTerm,smul_mul_assoc,mul_assoc,gapSeries_mul_denominator,mul_one]

end LineSize.Generating
