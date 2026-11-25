module
public import Conjectures.WachsCompleteGraphActualLaguerre
public import Conjectures.WachsLaguerrePositiveFactors
public import Conjectures.WachsMomentFactorLogConcavity

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

noncomputable def signedRankCoeff (p k j : ℕ) : ℝ :=
  (-1:ℝ)^j * (((characteristic (p+2) (k+1)).coeff j : ℤ):ℝ)

theorem characteristic_eq_moment_polynomial (p k : ℕ) (rates : Fin p → ℝ)
    (hr : HasLaguerreFactorization p rates) :
    (characteristic (p+2) (k+1)).map (Int.castRingHom ℝ) =
      ∑ j ∈ Finset.range (k+1), Polynomial.monomial j
        ((k.choose j:ℝ)*(-1:ℝ)^j*formalGammaMoment p (k+1) j rates) := by
  apply Polynomial.funext
  intro t
  rw [Polynomial.eval_map,weighted_complete_graph_formal_moments p k t rates hr,
    Polynomial.eval_finsetSum]
  apply Finset.sum_congr rfl
  intro j _
  rw [Polynomial.eval_monomial,show -t=(-1:ℝ)*t by ring,mul_pow]
  ring

theorem signedRankCoeff_eq_factorial (p k j : ℕ) (h : j≤k) (rates : Fin p → ℝ)
    (hr : HasLaguerreFactorization p rates) :
    signedRankCoeff p k j = (k.descFactorial j:ℝ)*coeff j (gammaSumSeries p (k+1) rates) := by
  have he := congrArg (fun Q : Polynomial ℝ => Q.coeff j)
    (characteristic_eq_moment_polynomial p k rates hr)
  rw [Polynomial.coeff_map,Polynomial.finsetSum_coeff] at he
  simp only [Polynomial.coeff_monomial,Finset.sum_ite_eq',Finset.mem_range,
    ite_eq_left (Nat.lt_succ_of_le h),Int.coe_castRingHom] at he
  rw [signedRankCoeff,he,formalGammaMoment,Nat.descFactorial_eq_factorial_mul_choose,Nat.cast_mul]
  have hs : (-1:ℝ)^j*(-1:ℝ)^j=1 := by rw [← mul_pow]; norm_num
  calc
    _ = ((-1:ℝ)^j*(-1:ℝ)^j)*
      ((j.factorial:ℝ)*(k.choose j:ℝ)*coeff j (gammaSumSeries p (k+1) rates)) := by ring
    _ = _ := by rw [hs,one_mul]

theorem descFactorial_strict_logConcave (k j : ℕ) (hj : j+2≤k) :
    (k.descFactorial j:ℝ)*(k.descFactorial (j+2):ℝ) < (k.descFactorial (j+1):ℝ)^2 := by
  have h₀ : 0<(k.descFactorial j:ℝ) := by exact_mod_cast Nat.descFactorial_pos.mpr (by omega : j≤k)
  have h₁ : 0<(k.descFactorial (j+1):ℝ) := by exact_mod_cast Nat.descFactorial_pos.mpr (by omega : j+1≤k)
  have h₃ : ((k-(j+1):ℕ):ℝ) < ((k-j:ℕ):ℝ) := by exact_mod_cast (show k-(j+1)<k-j by omega)
  have he₁ : (k.descFactorial (j+1):ℝ) = (k-j:ℕ)*(k.descFactorial j:ℝ) := by
    rw [Nat.descFactorial_succ,Nat.cast_mul]
  have he₂ : (k.descFactorial (j+2):ℝ) = (k-(j+1):ℕ)*(k.descFactorial (j+1):ℝ) := by
    rw [Nat.descFactorial_succ,Nat.cast_mul]
  calc
    _ = ((k.descFactorial j:ℝ)*(k.descFactorial (j+1):ℝ))*((k-(j+1):ℕ):ℝ) := by rw [he₂]; ring
    _ < ((k.descFactorial j:ℝ)*(k.descFactorial (j+1):ℝ))*((k-j:ℕ):ℝ) :=
      mul_lt_mul_of_pos_left h₃ (mul_pos h₀ h₁)
    _ = _ := by
      rw [show ((k.descFactorial j:ℝ)*(k.descFactorial (j+1):ℝ))*((k-j:ℕ):ℝ) =
        (k.descFactorial (j+1):ℝ)*((k-j:ℕ)*(k.descFactorial j:ℝ)) by ring,← he₁,pow_two]

/-- The alternating magnitudes of every coefficient in range are
positive, including the top coefficient. -/
theorem signedRankCoeff_positive (p k j : ℕ) (hj : j≤k) : 0 < signedRankCoeff p k j := by
  obtain ⟨r,_,hpos,hr⟩ := laguerre_has_positive_factorization p
  rw [signedRankCoeff_eq_factorial p k j hj r hr]
  have hdes : 0 < (k.descFactorial j:ℝ) := by exact_mod_cast Nat.descFactorial_pos.mpr hj
  exact mul_pos hdes ((gammaSumSeries_positive_logConcave p (k+1) (by omega) r hpos).1 j)

/-- Strict ordinary coefficient log-concavity of the literal complete
graph specialization, for every two or more equal colors. -/
theorem signedRankCoeff_strict_logConcave (p k j : ℕ) (hj : j+2≤k) :
    signedRankCoeff p k j * signedRankCoeff p k (j+2) < (signedRankCoeff p k (j+1))^2 := by
  obtain ⟨r,_,hpos,hr⟩ := laguerre_has_positive_factorization p
  let b (i : ℕ) := coeff i (gammaSumSeries p (k+1) r)
  let a (i : ℕ) := (k.descFactorial i:ℝ)
  have hb := gammaSumSeries_positive_logConcave p (k+1) (by omega) r hpos
  rw [signedRankCoeff_eq_factorial p k j (by omega) r hr,
    signedRankCoeff_eq_factorial p k (j+1) (by omega) r hr,
    signedRankCoeff_eq_factorial p k (j+2) hj r hr]
  change (a j*b j)*(a (j+2)*b (j+2)) < (a (j+1)*b (j+1))^2
  calc
    _ = (a j*a (j+2))*(b j*b (j+2)) := by ring
    _ ≤ (a j*a (j+2))*(b (j+1))^2 :=
      mul_le_mul_of_nonneg_left (hb.2 j) (by dsimp [a]; positivity)
    _ < (a (j+1))^2*(b (j+1))^2 :=
      mul_lt_mul_of_pos_right (descFactorial_strict_logConcave k j hj) (pow_pos (hb.1 (j+1)) _)
    _ = _ := by ring

/-- An unconditional formal moment representation with distinct positive
Laguerre rates, simultaneous in every size and real parameter. -/
theorem weighted_complete_graph_positive_formal_moments (p : ℕ) :
    ∃ rates : Fin p → ℝ, StrictMono rates ∧ (∀ i, 0 < rates i) ∧
      ∀ (k : ℕ) (t : ℝ),
        Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic (p+2) (k+1)) =
          ∑ j ∈ Finset.range (k+1), (k.choose j:ℝ)*(-t)^j*formalGammaMoment p (k+1) j rates := by
  obtain ⟨rates,hmono,hpos,hfac⟩ := laguerre_has_positive_factorization p
  exact ⟨rates,hmono,hpos,fun k t => weighted_complete_graph_formal_moments p k t rates hfac⟩

end WachsCompleteGraph
