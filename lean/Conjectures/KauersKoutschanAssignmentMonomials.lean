import Conjectures.KauersKoutschanTraceCoefficients

/-! Exact exponents and factorial weights of a chosen assignment of blocks. -/

open scoped BigOperators

namespace KauersKoutschan

noncomputable def blockMarker (row : Fin 2) (length : ℕ) : rowMarkedWeights :=
  MvPolynomial.X row * MvPolynomial.C (rowMarker row ^ length)

private theorem blockMarker_eq_monomial (row : Fin 2) (length : ℕ) :
    blockMarker row length = MvPolynomial.monomial (Finsupp.single row 1)
      (MvPolynomial.monomial (Finsupp.single row length) 1) := by
  rw [blockMarker, mul_comm, MvPolynomial.C_mul_X_eq_monomial, rowMarker, MvPolynomial.X_pow_eq_monomial]

theorem prod_blockMarker {Q : Type*} (S : Finset Q) (color : Q → Fin 2) (length : Q → ℕ) :
    (∏ q ∈ S, blockMarker (color q) (length q)) =
      MvPolynomial.monomial (∑ q ∈ S, Finsupp.single (color q) 1)
        (MvPolynomial.monomial (∑ q ∈ S, Finsupp.single (color q) (length q)) 1) := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | insert q S h ih =>
    rw [Finset.prod_insert h, ih, blockMarker_eq_monomial,
      MvPolynomial.monomial_mul_monomial, MvPolynomial.monomial_mul_monomial,
      Finset.sum_insert h, Finset.sum_insert h, mul_one]

theorem assignmentLength_exponent {Q : Type*} [Fintype Q] (color : Q → Fin 2)
    (length : Q → ℕ) (row : Fin 2) :
    (∑ q : Q, Finsupp.single (color q) (length q)) row =
      ∑ q : {q : Q // color q = row}, length q.1 := by
  classical
  rw [← Finset.sum_subtype (Finset.univ.filter (fun q => color q = row)) (by simp) length,
    Finset.sum_filter, Finsupp.finsetSum_apply]
  apply Finset.sum_congr rfl
  intro q _
  simp [Finsupp.single_apply, eq_comm]

theorem assignmentCount_exponent {Q : Type*} [Fintype Q] (color : Q → Fin 2) (row : Fin 2) :
    (∑ q : Q, Finsupp.single (color q) (1 : ℕ)) row = Fintype.card {q : Q // color q = row} := by
  classical
  rw [assignmentLength_exponent]
  simp

/-- A chosen assignment contributes its row-order factorials precisely to
the monomial with its two total row lengths. -/
theorem coeff_moment_assignment {Q : Type*} [Fintype Q] (color : Q → Fin 2)
    (length : Q → ℕ) (d : Fin 2 →₀ ℕ) :
    (factorialMomentPair (∏ q : Q, blockMarker (color q) (length q))).coeff d =
      if (∀ row, (∑ q : {q : Q // color q = row}, length q.1) = d row) then
        (∏ row : Fin 2, ((Fintype.card {q : Q // color q = row}).factorial : ℝ))
      else 0 := by
  classical
  rw [prod_blockMarker, factorialMomentPair_monomial, assignmentCount_exponent, assignmentCount_exponent]
  let f₀ := (Fintype.card {q : Q // color q = 0}).factorial
  let f₁ := (Fintype.card {q : Q // color q = 1}).factorial
  let e := ∑ q : Q, Finsupp.single (color q) (length q)
  change (MvPolynomial.monomial e (1 : ℝ) * (f₀ : TwoVariablePolynomial) *
    (f₁ : TwoVariablePolynomial)).coeff d = _
  rw [show MvPolynomial.monomial e (1 : ℝ) * (f₀ : TwoVariablePolynomial) *
    (f₁ : TwoVariablePolynomial) = MvPolynomial.C ((f₀ : ℝ) * f₁) * MvPolynomial.monomial e 1 by
      simp only [map_mul, map_natCast]; ring, MvPolynomial.coeff_C_mul, MvPolynomial.coeff_monomial]
  have heq :
      (∑ q : Q, Finsupp.single (color q) (length q)) = d ↔
        ∀ row, (∑ q : {q : Q // color q = row}, length q.1) = d row := by
    rw [Finsupp.ext_iff]
    simp only [assignmentLength_exponent]
  by_cases h : (∑ q : Q, Finsupp.single (color q) (length q)) = d
  · rw [ite_eq_left h, ite_eq_left (heq.mp h)]
    simp [Fin.prod_univ_two, f₀, f₁]
  · rw [ite_eq_right h, ite_eq_right (fun hc => h (heq.mpr hc)), mul_zero]

end KauersKoutschan
