module
public import Conjectures.WachsMomentConvolution
public import Conjectures.WachsCompleteGraphGammaProduct

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

theorem positive_logConcave_of_ratio {f : ℕ → ℝ}
    (hf : ∀ j,0<f j) (h : Antitone (fun j => f (j+1)/f j)) :
    PositiveLogConcave f := by
  refine ⟨hf,fun j => ?_⟩
  have he := (div_le_div_iff₀ (hf (j+1)) (hf j)).mp (h (Nat.le_succ j))
  simpa [pow_two,mul_comm] using he

theorem expAt_real_coeff (c : ℝ) (j : ℕ) :
    coeff j (expAt c) = c^j/(j.factorial:ℝ) := by
  rw [expAt,coeff_rescale,coeff_exp,map_div₀,map_one,map_natCast]
  ring

theorem exp_coeff_positive_logConcave (c : ℝ) (hc : 0<c) :
    PositiveLogConcave (fun j => coeff j (expAt c)) := by
  have hp (j : ℕ) : 0 < coeff j (expAt c) := by rw [expAt_real_coeff]; positivity
  apply positive_logConcave_of_ratio hp
  have rh (j : ℕ) : coeff (j+1) (expAt c) / coeff j (expAt c) = c/((j:ℝ)+1) := by
    rw [expAt_real_coeff,expAt_real_coeff,pow_succ,Nat.factorial_succ]
    push_cast
    have h₁ : (j.factorial:ℝ) ≠ 0 := by positivity
    have h₂ : (j:ℝ)+1 ≠ 0 := by positivity
    have h₃ : c^j ≠ 0 := pow_ne_zero _ hc.ne'
    field_simp
  simp_rw [rh]
  apply antitone_nat_of_succ_le
  intro j
  apply div_le_div_of_nonneg_left hc.le (by positivity)
  push_cast
  linarith

theorem gamma_coeff_positive (n : ℕ) (hn : 0<n) (a : ℝ) (ha : 0<a) (j : ℕ) :
    0 < coeff j (gammaMomentFactor n a) := by
  rw [gammaMomentFactor_coeff n j hn]
  have h : 0 < ((n-1+j).choose j:ℝ) := by
    exact_mod_cast Nat.choose_pos (by omega : j ≤ n-1+j)
  exact mul_pos h (pow_pos (inv_pos.mpr ha) _)

theorem gamma_coeff_ratio (n : ℕ) (hn : 0<n) (a : ℝ) (ha : 0<a) (j : ℕ) :
    coeff (j+1) (gammaMomentFactor n a) / coeff j (gammaMomentFactor n a) =
      ((n:ℝ)+(j:ℝ))/((j:ℝ)+1) * a⁻¹ := by
  have h := Nat.add_one_mul_choose_eq (n-1+j) j
  have hc : ((n:ℝ)+(j:ℝ))*((n-1+j).choose j:ℝ) =
      ((n-1+(j+1)).choose (j+1):ℝ)*((j:ℝ)+1) := by
    have h₁ : n-1+j+1 = n+j := by omega
    have h₂ : n-1+j+1 = n-1+(j+1) := by omega
    nth_rewrite 1 [h₁] at h
    rw [h₂] at h
    exact_mod_cast h
  have hdiv : coeff j (gammaMomentFactor n a) ≠ 0 := (gamma_coeff_positive n hn a ha j).ne'
  apply (div_eq_iff hdiv).mpr
  rw [gammaMomentFactor_coeff n (j+1) hn,gammaMomentFactor_coeff n j hn,pow_succ]
  have hden : (j:ℝ)+1 ≠ 0 := by positivity
  have hchoose : ((n-1+(j+1)).choose (j+1):ℝ) =
      ((n:ℝ)+(j:ℝ))/((j:ℝ)+1)*((n-1+j).choose j:ℝ) := by
    rw [div_mul_eq_mul_div]
    exact (eq_div_iff hden).mpr hc.symm
  rw [hchoose]
  ring

theorem gamma_coeff_positive_logConcave (n : ℕ) (hn : 0<n) (a : ℝ) (ha : 0<a) :
    PositiveLogConcave (fun j => coeff j (gammaMomentFactor n a)) := by
  apply positive_logConcave_of_ratio (gamma_coeff_positive n hn a ha)
  simp_rw [gamma_coeff_ratio n hn a ha]
  apply antitone_nat_of_succ_le
  intro j
  apply mul_le_mul_of_nonneg_right _ (inv_nonneg.mpr ha.le)
  apply (div_le_div_iff₀ (by positivity) (by positivity)).mpr
  have hx : 1 ≤ (n:ℝ) := by exact_mod_cast hn
  push_cast
  nlinarith

theorem positive_logConcave_series_mul {A B : PowerSeries ℝ}
    (hA : PositiveLogConcave (fun j => coeff j A)) (hB : PositiveLogConcave (fun j => coeff j B)) :
    PositiveLogConcave (fun j => coeff j (A*B)) := by
  have h (n : ℕ) : coeff n (A*B) = convNat (fun j => coeff j B) (fun j => coeff j A) n := by
    rw [coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,convNat]
    apply Finset.sum_congr rfl
    intro i _
    exact mul_comm _ _
  simp_rw [h]
  exact positive_logConcave_conv hB hA

theorem gammaSumSeries_positive_logConcave (p n : ℕ) (hn : 0<n) (rates : Fin p → ℝ)
    (hr : ∀ i,0<rates i) : PositiveLogConcave (fun j => coeff j (gammaSumSeries p n rates)) := by
  classical
  have h (s : Finset (Fin p)) :
      PositiveLogConcave (fun j => coeff j (expAt (n:ℝ)*∏ i ∈ s,gammaMomentFactor n (rates i))) := by
    induction s using Finset.induction_on with
    | empty => simpa using exp_coeff_positive_logConcave (n:ℝ) (by exact_mod_cast hn)
    | insert i s hi ih =>
      rw [Finset.prod_insert hi,show expAt (n:ℝ) * (gammaMomentFactor n (rates i) *
          ∏ j ∈ s,gammaMomentFactor n (rates j)) =
          (expAt (n:ℝ) * ∏ j ∈ s,gammaMomentFactor n (rates j))*gammaMomentFactor n (rates i) by ring]
      exact positive_logConcave_series_mul ih (gamma_coeff_positive_logConcave n hn (rates i) (hr i))
  exact h Finset.univ

end WachsCompleteGraph
