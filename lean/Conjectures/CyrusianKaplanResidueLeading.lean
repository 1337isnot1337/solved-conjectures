module
public import Conjectures.CyrusianKaplanRayShiftCount
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Positivity

@[expose] public section
namespace CyrusianKaplan

open Polynomial
open scoped BigOperators

theorem shiftedRayPolynomial_top_coeff (k p h : ℕ) (hp : 0<p) :
    (shiftedRayPolynomial k p h).coeff k =
      (k.factorial:ℚ)⁻¹*((p:ℚ)⁻¹)^k := by
  have hF : (k.factorial:ℚ)≠0 := by exact_mod_cast Nat.factorial_ne_zero k
  have hP : (p:ℚ)≠0 := by exact_mod_cast hp.ne'
  let Q := rayBinomialPolynomial k
  let S : ℚ[X] := C ((p:ℚ)⁻¹)*(X-C (h:ℚ))
  have hQdeg : Q.natDegree=k := by
    unfold Q rayBinomialPolynomial
    rw [natDegree_comp,natDegree_C_mul (inv_ne_zero hF),descPochhammer_natDegree,
      natDegree_X_add_C,mul_one]
  have hQL : Q.leadingCoeff=(k.factorial:ℚ)⁻¹ := by
    unfold Q rayBinomialPolynomial
    rw [leadingCoeff_comp (by rw [natDegree_X_add_C]; exact one_ne_zero),
      leadingCoeff_mul,leadingCoeff_C,(monic_descPochhammer ℚ k).leadingCoeff,
      leadingCoeff_X_add_C,one_pow,mul_one,mul_one]
  have hSdeg : S.natDegree=1 := by
    unfold S
    rw [natDegree_C_mul (inv_ne_zero hP),natDegree_X_sub_C]
  have hSL : S.leadingCoeff=(p:ℚ)⁻¹ := by
    unfold S
    rw [leadingCoeff_mul,leadingCoeff_C,leadingCoeff_X_sub_C,mul_one]
  have hDeg : (Q.comp S).natDegree=k := by rw [natDegree_comp,hQdeg,hSdeg,mul_one]
  change (Q.comp S).coeff k=_
  rw [← hDeg,coeff_natDegree,leadingCoeff_comp (by rw [hSdeg]; exact one_ne_zero),hQL,hSL,hQdeg,hDeg]

/-- Translation by any lift of b-a gives a bijection of additive
height fibres. The quotient version of the numerator correction
uses this, with surjectivity provided by a lattice point at height one. -/
noncomputable def additive_fibres_equiv_of_surjective {G H : Type*}
    [AddCommGroup G] [AddCommGroup H] (f : G →+ H) (hf : Function.Surjective f) (a b : H) :
    {x : G // f x=a} ≃ {x : G // f x=b} := by
  let u := (hf (b-a)).choose
  have hu : f u=b-a := (hf (b-a)).choose_spec
  exact
    { toFun := fun x => ⟨x.val+u,by rw [map_add,x.property,hu]; abel⟩
      invFun := fun x => ⟨x.val-u,by rw [map_sub,x.property,hu]; abel⟩
      left_inv := fun x => Subtype.ext (add_sub_cancel_right _ _)
      right_inv := fun x => Subtype.ext (sub_add_cancel _ _) }

theorem additive_fibres_equal_cardinality {G H : Type*}
    [AddCommGroup G] [AddCommGroup H] (f : G →+ H) (hf : Function.Surjective f) (a b : H) :
    Nat.card {x : G // f x=a}=Nat.card {x : G // f x=b} :=
  Nat.card_congr (additive_fibres_equiv_of_surjective f hf a b)

/-- A numerator period polynomial's top coefficient depends only
on the number of numerator terms of that residue, not their shifts. -/
theorem finite_ray_residue_top_coeff {B : Type*} [Fintype B] (h : B → ℕ)
    (k p : ℕ) (hp : 0<p) (r : ℕ) :
    (∑ b, if r=(h b)%p then shiftedRayPolynomial k p (h b) else 0 : ℚ[X]).coeff k =
      ((Finset.univ.filter fun b => r=(h b)%p).card:ℚ)*
        ((k.factorial:ℚ)⁻¹*((p:ℚ)⁻¹)^k) := by
  rw [finsetSum_coeff]
  simp_rw [apply_ite (fun f : ℚ[X] => f.coeff k),shiftedRayPolynomial_top_coeff k p _ hp,
    coeff_zero]
  rw [← Finset.sum_filter,Finset.sum_const,nsmul_eq_mul]

end CyrusianKaplan
