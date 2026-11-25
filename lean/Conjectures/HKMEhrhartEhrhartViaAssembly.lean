module

public import Conjectures.HKMEhrhartClipCount
public import Conjectures.HKMEhrhartPolynomialAssembly

public section
namespace HKMEhrhart
open Polynomial
open scoped Polynomial

theorem cocktailSixEhrhart_exists :
    ∃ E : ℂ[X], (∀ m : ℕ, E.eval (m:ℂ) = (Fintype.card (CocktailLattice 6 m):ℂ)) ∧
      E.natDegree ≤ 11 := by
  apply counting_polynomial_complex
  have h : Fintype.card CocktailCoordinates = 12 := by simp [CocktailCoordinates,Fintype.card_prod]
  have hh : 2 ≤ Fintype.card CocktailCoordinates := by rw [h]; decide
  have hD : Fintype.card CocktailCoordinates - 1 ≤ 11 := by rw [h]
  refine assemble_counting_polynomial (unclippedPolynomial (α:=CocktailCoordinates))
    (pairViolationPolynomial 9) (fun m => Fintype.card (UnclippedCocktail CocktailCoordinates m))
    (fun m => Fintype.card (CocktailLattice 6 m)) (fun m => Nat.card (PairViolationData (Fin 10) m))
    6 11 unclippedPolynomial_eval (pairViolationPolynomial_eval 9)
    unclipped_card_eq_clipped_add_violations ?_ (pairViolationPolynomial_degree 9)
  exact (unclippedPolynomial_degree hh).trans hD

noncomputable def cocktailSixEhrhart : ℂ[X] := Classical.choose cocktailSixEhrhart_exists

theorem cocktailSixEhrhart_eval (m : ℕ) :
    cocktailSixEhrhart.eval (m:ℂ) = (Fintype.card (CocktailLattice 6 m):ℂ) :=
  (Classical.choose_spec cocktailSixEhrhart_exists).1 m

theorem cocktailSixEhrhart_degree : cocktailSixEhrhart.natDegree ≤ 11 :=
  (Classical.choose_spec cocktailSixEhrhart_exists).2

theorem cocktailSixEhrhart_unique (P : ℂ[X])
    (hP : ∀ m : ℕ, P.eval (m:ℂ) = (Fintype.card (CocktailLattice 6 m):ℂ)) :
    P = cocktailSixEhrhart := by
  apply Polynomial.eq_of_infinite_eval_eq
  have hi : Set.Infinite (Set.range (fun m : ℕ => (m:ℂ))) :=
    Set.infinite_range_of_injective Nat.cast_injective
  apply hi.mono
  rintro _ ⟨m,rfl⟩
  exact (hP m).trans (cocktailSixEhrhart_eval m).symm

end HKMEhrhart
