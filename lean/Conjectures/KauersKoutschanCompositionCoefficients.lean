import Conjectures.KauersKoutschanAssignmentMonomials
import Conjectures.KauersKoutschanColumnSeries
import Conjectures.KauersKoutschanCompositionCount

/-! The original permutation count is a coefficient of the two column series. -/

open scoped BigOperators

namespace KauersKoutschan

open PowerSeries

noncomputable def targetDegree (n : ℕ) : Fin 2 →₀ ℕ :=
  Finsupp.single 0 (rowLength n 0) + Finsupp.single 1 (rowLength n 1)

theorem targetDegree_apply (n : ℕ) (row : Fin 2) :
    targetDegree n row = rowLength n row := by
  fin_cases row <;> simp [targetDegree]

private noncomputable def signedMarkerWeight (length : ℕ) : rowMarkedWeights :=
  (-1) ^ (length - 1) * (blockMarker 0 length + blockMarker 1 length)

private theorem markedColumn_coeff_compositions (n : ℕ) :
    coeff n markedColumns =
      ∑ c : Composition n, ∏ k : Fin c.toCompositionAsSet.length,
        signedMarkerWeight (c.toCompositionAsSet.blocksFun k) := by
  rw [show markedColumns = compositionSeries (fun length =>
    (-1 : rowMarkedWeights) ^ (length - 1) *
      (MvPolynomial.X 0 * (MvPolynomial.C (rowMarker 0)) ^ length +
        MvPolynomial.X 1 * (MvPolynomial.C (rowMarker 1)) ^ length)) by rfl,
    compositionSeries, coeff_mk, weightedCompositionSum]
  apply Finset.sum_congr rfl
  intro c _
  rw [← c.toCompositionAsSet_blocks]
  simp only [CompositionAsSet.blocks, List.map_ofFn, List.prod_ofFn]
  apply Finset.prod_congr rfl
  intro k _
  simp only [signedMarkerWeight, blockMarker, map_pow, Function.comp_apply]

private def twoCompositions (n : ℕ) :
    ValueCompositions n ≃ Composition (rowLength n 0) × Composition (rowLength n 1) :=
  piFinTwoEquiv (fun row => Composition (rowLength n row))

private theorem markedColumns_product (n : ℕ) :
    coeff (rowLength n 0) markedColumns * coeff (rowLength n 1) markedColumns =
      ∑ c : ValueCompositions n,
        ∏ q : CompositionHeads c, signedMarkerWeight (compositionBlockSize c q) := by
  rw [markedColumn_coeff_compositions, markedColumn_coeff_compositions, Finset.sum_mul]
  simp_rw [Finset.mul_sum]
  rw [← Fintype.sum_prod_type (fun k : Composition (rowLength n 0) × Composition (rowLength n 1) =>
    (∏ j : Fin k.1.toCompositionAsSet.length, signedMarkerWeight (k.1.toCompositionAsSet.blocksFun j)) *
    ∏ j : Fin k.2.toCompositionAsSet.length, signedMarkerWeight (k.2.toCompositionAsSet.blocksFun j))]
  apply Fintype.sum_equiv (twoCompositions n).symm
  intro c
  rw [Fintype.prod_sigma, Fin.prod_univ_two]
  rfl

private theorem compositionProduct_coeff {n : ℕ} (c : ValueCompositions n) :
        (factorialMomentPair (∏ q : CompositionHeads c, signedMarkerWeight (compositionBlockSize c q))).coeff
      (targetDegree n) =
        (compositionSign c : ℝ) * (compositionAssignmentCount c : ℝ) := by
  classical
  let length := compositionBlockSize c
  have hsign : (∏ q : CompositionHeads c, (-1 : rowMarkedWeights) ^ (length q - 1)) =
      MvPolynomial.C (MvPolynomial.C (compositionSign c : ℝ) : TwoVariablePolynomial) := by
    unfold compositionSign
    simp only [Rat.cast_prod, sign, Rat.cast_pow, Rat.cast_neg, Rat.cast_one, map_prod, map_pow, map_neg,
      map_one]
    rfl
  have hprod : (∏ q : CompositionHeads c, (blockMarker 0 (length q) + blockMarker 1 (length q))) =
      ∑ color : CompositionHeads c → Fin 2, ∏ q, blockMarker (color q) (length q) := by
    simpa only [Fin.sum_univ_two] using
      (Fintype.prod_sum (fun (q : CompositionHeads c) (row : Fin 2) => blockMarker row (length q)))
  simp only [signedMarkerWeight, Finset.prod_mul_distrib]
  rw [hsign, hprod, ← MvPolynomial.smul_eq_C_mul, map_smul, smul_eq_mul,
    MvPolynomial.coeff_C_mul, map_sum]
  apply congrArg (fun a => (compositionSign c : ℝ) * a)
  change (MvPolynomial.coeffAddMonoidHom (targetDegree n))
    (∑ color : CompositionHeads c → Fin 2, factorialMomentPair (∏ q, blockMarker (color q) (length q))) = _
  rw [map_sum]
  unfold compositionAssignmentCount
  push_cast
  apply Finset.sum_congr rfl
  intro color _
  change (factorialMomentPair (∏ q, blockMarker (color q) (length q))).coeff (targetDegree n) = _
  rw [coeff_moment_assignment]
  simp only [targetDegree_apply]
  split_ifs <;> first | rfl | contradiction

/-- The literal permutation count is obtained by extracting the two target
row lengths after applying the two-variable factorial functional. -/
theorem permutationCount_eq_column_coefficient (n : ℕ) :
    (permutationCount n : ℝ) =
      (factorialMomentPair
        (coeff (rowLength n 0) markedColumns * coeff (rowLength n 1) markedColumns)).coeff (targetDegree n) := by
  classical
  have h := congrArg (Rat.castHom ℝ) (permutationCount_signed_compositions n)
  change ((permutationCount n : ℚ) : ℝ) =
    (↑(∑ c : ValueCompositions n, compositionSign c * (compositionAssignmentCount c : ℚ)) : ℝ) at h
  push_cast at h
  rw [h, markedColumns_product, map_sum]
  change _ = (MvPolynomial.coeffAddMonoidHom (targetDegree n)) (∑ c : ValueCompositions n,
    factorialMomentPair (∏ q : CompositionHeads c, signedMarkerWeight (compositionBlockSize c q)))
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro c _
  exact (compositionProduct_coeff c).symm

end KauersKoutschan
