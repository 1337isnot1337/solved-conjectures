module
public import Conjectures.WachsSingleColorProduct
public import Conjectures.WachsFiniteLogConcavity

@[expose] public section
namespace WachsCompleteGraph

open Polynomial WeightedCompletePartition

noncomputable def positiveSingleProduct (k : ℕ) : Polynomial ℝ :=
  ∏ j ∈ Finset.range k,(1+C ((j:ℝ)+1)*X)

theorem coeff_mul_positive_linear (P : Polynomial ℝ) (a : ℝ) (j : ℕ) :
    (P*(1+C a*X)).coeff j = addLinearWeight a P.coeff j := by
  rw [mul_add,mul_one,show P*(C a*X)=C a*(X*P) by ring,coeff_add,coeff_C_mul]
  cases j with
  | zero => simp [addLinearWeight]
  | succ j => simp [addLinearWeight,coeff_X_mul]

theorem positiveSingleProduct_logConcave (k : ℕ) :
    FinitePositiveLogConcave k (positiveSingleProduct k).coeff := by
  induction k with
  | zero =>
    simp only [positiveSingleProduct,Finset.range_zero,Finset.prod_empty]
    refine ⟨fun j hj => ?_,fun j hj => ?_,fun j hj => by omega⟩
    · have h : j=0 := by omega
      subst j
      simp
    · simp [Polynomial.coeff_one,show j≠0 by omega]
  | succ k ih =>
    rw [positiveSingleProduct,Finset.prod_range_succ]
    have hh := finiteLogConcave_addLinear ih (a:=(k:ℝ)+1) (by positivity)
    convert hh using 1
    funext j
    exact coeff_mul_positive_linear _ _ j

theorem coeff_comp_neg_X_all (P : Polynomial ℝ) (j : ℕ) :
    (P.comp (-X)).coeff j = (-1:ℝ)^j * P.coeff j := by
  induction P using Polynomial.induction_on' with
  | add P Q hp hq =>
    rw [Polynomial.add_comp,coeff_add,hp,hq,coeff_add,mul_add]
  | monomial n a =>
    rw [Polynomial.monomial_comp]
    have h : (-X:Polynomial ℝ)^n = C ((-1:ℝ)^n)*X^n := by
      rw [show (-X:Polynomial ℝ) = C (-1:ℝ)*X by simp,mul_pow,map_pow]
    rw [h,←mul_assoc,← map_mul,Polynomial.C_mul_X_pow_eq_monomial]
    by_cases h : j=n
    · subst j
      simp [mul_comm]
    · simp [Polynomial.coeff_monomial,Ne.symm h]

theorem singleColor_negated_eq_product (k : ℕ) :
    ((characteristic 1 (k+1)).map (Int.castRingHom ℝ)).comp (-X) = positiveSingleProduct k := by
  apply Polynomial.funext
  intro t
  rw [Polynomial.eval_comp,Polynomial.eval_neg,Polynomial.eval_X,Polynomial.eval_map,
    weighted_complete_graph_single_color,Finset.prod_range_succ',positiveSingleProduct,Polynomial.eval_prod]
  norm_num

theorem single_color_signed_coefficients (k : ℕ) :
    FinitePositiveLogConcave k
      (fun j => (-1:ℝ)^j * (((characteristic 1 (k+1)).coeff j:ℤ):ℝ)) := by
  have h (j : ℕ) :
      (positiveSingleProduct k).coeff j = (-1:ℝ)^j *
        (((characteristic 1 (k+1)).coeff j:ℤ):ℝ) := by
    rw [←singleColor_negated_eq_product,coeff_comp_neg_X_all,Polynomial.coeff_map]
    rfl
  have he : (positiveSingleProduct k).coeff =
      (fun j => (-1:ℝ)^j * (((characteristic 1 (k+1)).coeff j:ℤ):ℝ)) := funext h
  rw [← he]
  exact positiveSingleProduct_logConcave k

end WachsCompleteGraph
