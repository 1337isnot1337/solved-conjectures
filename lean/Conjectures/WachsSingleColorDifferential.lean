module
public import Conjectures.WachsSingleColorComposition

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

noncomputable def singleCharacteristicSeries (t : ℝ) : PowerSeries ℝ :=
  (PowerSeries.exp ℝ).subst (singleBlockSeries t)

theorem single_characteristic_coeff (n : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic 1 n) =
      (n.factorial:ℝ)*coeff n (singleCharacteristicSeries t) := by
  have h (j : ℕ) : coeff j (PowerSeries.exp ℝ) = (fun _ : ℕ => (1:ℝ)) j/(j.factorial:ℝ) := by
    rw [coeff_exp,map_div₀,map_one,map_natCast]
  have hn : (n.factorial:ℝ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  rw [singleCharacteristicSeries,singleBlockSeries,coeff_subst_blockEGF _ _ _ h,
    show characteristic 1 n = characteristic (0+1) n from rfl,characteristic_by_block_sizes 0]
  simp only [one_mul,singleBlockProduct,Polynomial.eval₂_finsetSum,Polynomial.eval₂_monomial,
    map_prod,Int.coe_castRingHom]
  field_simp
  apply Finset.sum_congr rfl
  intro π _
  rw [Finset.prod_coe_sort π.parts (fun b : Finset (Fin n) => (canonicalBlockTotal 1 b.card:ℝ))]

theorem single_forcing_derivative (t : ℝ) :
    derivative (singleForcing t) = 1+C t*(singleForcing t) := by
  ext n
  rw [map_add,coeff_C_mul,singleForcing_coeff]
  rw [show derivative (singleForcing t) = derivative (blockEGF (singleForcingWeight t)) from rfl,
    coeff_blockEGF_derivative]
  cases n with
  | zero => simp [singleForcingWeight]
  | succ j =>
    simp only [singleForcingWeight,Nat.add_one_ne_zero,ite_false,Nat.add_sub_cancel,
      coeff_one,zero_add,pow_succ]
    ring

theorem single_characteristic_differential (t : ℝ) :
    (1+C t*X) * derivative (singleCharacteristicSeries t) = singleCharacteristicSeries t := by
  let B : PowerSeries ℝ := singleBlockSeries t
  let F : PowerSeries ℝ := singleForcing t
  have hb : HasSubst B := HasSubst.of_constantCoeff_zero' (constant_blockEGF _)
  have hFB : F.subst B = (X : PowerSeries ℝ) := single_forcing_comp_actual t
  have hderiv : (derivative F).subst B * derivative B = 1 := by
    have h := congrArg derivative hFB
    rw [derivative_subst hb,derivative_X] at h
    exact h
  have hs : (derivative F).subst B = 1+C t*X := by
    rw [show derivative F=1+C t*F from single_forcing_derivative t,
      ← coe_substAlgHom hb,map_add,map_one,map_mul,coe_substAlgHom,subst_C,
      hFB]
    rfl
  rw [hs] at hderiv
  have hA : derivative (singleCharacteristicSeries t) =
      singleCharacteristicSeries t * derivative B := by
    change derivative ((PowerSeries.exp ℝ).subst B) = _
    rw [derivative_subst hb,derivative_exp]
    rfl
  rw [hA,show (1+C t*X)*(singleCharacteristicSeries t*derivative B) =
    singleCharacteristicSeries t*((1+C t*X)*derivative B) by ring,hderiv,mul_one]

end WachsCompleteGraph
