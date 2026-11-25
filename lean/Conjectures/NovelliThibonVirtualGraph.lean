module
public import Conjectures.NovelliThibonVirtualFundamental
public import Conjectures.NovelliThibonSignedShape

@[expose] public section
namespace NovelliThibon

open Polynomial
open Classical
variable {n : ℕ}

noncomputable def graphRepeatedPolynomial (E : Finset (LabelEdge (n+1))) (q z : ℚ) : ℚ[X] :=
  ∑ D : Finset (Fin n), C (q^E.card * graphLLTCoordinate E q⁻¹ Dᶜ) *
    fundamentalRepeatedPolynomial D z

theorem graphRepeatedPolynomial_eval_nat (E : Finset (LabelEdge (n+1))) (q z : ℚ) (m : ℕ) :
    (graphRepeatedPolynomial E q z).eval (m:ℚ) =
      modifiedOmegaGraphLLT (repeatedLetterWeight m z) E q := by
  unfold graphRepeatedPolynomial modifiedOmegaGraphLLT
  simp_rw [eval_finsetSum,eval_mul,eval_C,fundamentalRepeatedPolynomial_eval_nat]

theorem graphRepeatedPolynomial_eval_neg_one (E : Finset (LabelEdge (n+1))) (q z : ℚ) :
    (graphRepeatedPolynomial E q z).eval (-1) = signedModifiedOmegaGraphLLT E q z := by
  unfold graphRepeatedPolynomial signedModifiedOmegaGraphLLT
  simp_rw [eval_finsetSum,eval_mul,eval_C,fundamentalRepeatedPolynomial_eval_neg_one]

noncomputable def sourceRepeatedPolynomial (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : ℚ) (t : ℕ → ℚ) : ℚ[X] :=
  let E := indexEdges μ h (attackingEdges μ)
  let U := indexEdges μ h (optionalVertical μ)
  let b := fun e : LabelEdge (n+1) => t (legLabel ((indexCells μ h).symm e.1))
  let a := fun e : LabelEdge (n+1) => arm ((indexCells μ h).symm e.1)
  (∑ S ∈ U.powerset,C (intermediateGraphScalar U S q b a) * graphRepeatedPolynomial (E∪S) q z) *
    C (((q-1)^U.card)⁻¹) * C ((q^(∑ e ∈ U,a e))⁻¹)

/-- Ordinary evaluations for every nonnegative integer multiplicity. -/
theorem sourceRepeatedPolynomial_eval_nat (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : ℚ) (t : ℕ → ℚ) (m : ℕ) :
    (sourceRepeatedPolynomial μ h q z t).eval (m:ℚ) =
      sourceShapeEvaluation μ h (repeatedLetterWeight m z) q t := by
  unfold sourceRepeatedPolynomial sourceShapeEvaluation sourceModifiedGraphSum
  simp_rw [eval_mul,eval_C,eval_finsetSum,eval_mul,eval_C,graphRepeatedPolynomial_eval_nat,div_eq_mul_inv]

/-- At multiplicity (-1), the exact same polynomial gives the
literal signed two-letter source calculation. -/
theorem sourceRepeatedPolynomial_eval_neg_one (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : ℚ) (t : ℕ → ℚ) :
    (sourceRepeatedPolynomial μ h q z t).eval (-1) =
      signedSourceShapeEvaluation μ h q z t := by
  unfold sourceRepeatedPolynomial signedSourceShapeEvaluation signedSourceModifiedGraphSum
  simp_rw [eval_mul,eval_C,eval_finsetSum,eval_mul,eval_C,graphRepeatedPolynomial_eval_neg_one,div_eq_mul_inv]

theorem sourceRepeatedPolynomial_virtual_product (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : ℚ) (hq : q≠0) (hq1 : q≠1) (t : ℕ → ℚ) :
    (sourceRepeatedPolynomial μ h q z t).eval (-1) =
      ∏ b : Cell μ,(1-z*(q^col b*(if row b=0 then 1 else t (row b)))) := by
  rw [sourceRepeatedPolynomial_eval_neg_one,signedSourceShapeEvaluation_cell_product μ h q z hq hq1]

end NovelliThibon
