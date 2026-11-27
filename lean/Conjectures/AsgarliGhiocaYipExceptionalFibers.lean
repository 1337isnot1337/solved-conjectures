import Conjectures.AsgarliGhiocaYipPlaneFactor
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! # Bounding the exceptional fibers of a monic plane polynomial

Use the resultant with the `Z` derivative, keeping the matrix size fixed after
specialization. This matters when the leading coefficient of the derivative vanishes.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial

variable {K : Type*} [Field K]

/-- A polynomial in `T` cutting out the nonseparable fibers. -/
noncomputable def exceptionalPolynomial (P : PlanePolynomial K) : K[X] :=
  P.resultant P.derivative P.natDegree (P.natDegree - 1)

theorem separable_map_iff_exceptional {P : PlanePolynomial K} (hP : P.Monic)
    {L : Type*} [Field L] (φ : K[X] →+* L) :
    (P.map φ).Separable ↔ φ (exceptionalPolynomial P) ≠ 0 := by
  let f := P.map φ
  have hf : f.Monic := hP.map _
  have hdeg : f.natDegree = P.natDegree := hP.natDegree_map _
  have hderiv : P.derivative.map φ = f.derivative := (derivative_map ..).symm
  have hres : φ (exceptionalPolynomial P) = f.resultant f.derivative := by
    unfold exceptionalPolynomial
    rw [← resultant_map_map]
    change f.resultant (P.derivative.map φ) P.natDegree (P.natDegree - 1) = _
    rw [hderiv, ← hdeg, ← Nat.add_sub_cancel' (natDegree_derivative_le f),
      resultant_add_right_deg _ _ _ _ _ le_rfl, coeff_natDegree, hf.leadingCoeff, one_pow, one_mul]
  rw [hres, Ne, resultant_eq_zero_iff]
  simp [hf.ne_zero, Separable, f]

theorem separable_specialize_iff {P : PlanePolynomial K} (hP : P.Monic) (t : K) :
    (specialize t P).Separable ↔ (exceptionalPolynomial P).eval t ≠ 0 :=
  separable_map_iff_exceptional hP (evalRingHom t)

theorem natDegree_exceptionalPolynomial_le (P : PlanePolynomial K) {b : ℕ}
    (hb : ∀ j, (P.coeff j).natDegree ≤ b) :
    (exceptionalPolynomial P).natDegree ≤ (P.natDegree + (P.natDegree - 1)) * b := by
  classical
  have hderiv (j : ℕ) : (P.derivative.coeff j).natDegree ≤ b := by
    rw [coeff_derivative]
    exact natDegree_mul_le.trans (by simpa using hb (j + 1))
  let M := P.sylvester P.derivative P.natDegree (P.natDegree - 1)
  have hM (i j) : (M i j).natDegree ≤ b := by
    induction j using Fin.addCases with
    | left j =>
      simp only [M, sylvester, Matrix.of_apply, Fin.addCases_left]
      split_ifs <;> simp [hderiv]
    | right j =>
      simp only [M, sylvester, Matrix.of_apply, Fin.addCases_right]
      split_ifs <;> simp [hb]
  change M.det.natDegree ≤ _
  rw [Matrix.det_apply]
  apply natDegree_sum_le_of_forall_le
  intro σ _
  apply (natDegree_smul_le _ _).trans
  apply (natDegree_prod_le _ _).trans
  exact (sum_le_sum (fun i _ ↦ hM (σ i) i)).trans (by simp)

section Counting

variable [Fintype K] [DecidableEq K]

/-- The affine rational points of a plane polynomial. -/
noncomputable def planePoints (F : PlanePolynomial K) : Finset (K × K) := by
  classical
  exact univ.filter fun p ↦ planeEval p.1 p.2 F = 0

/-- The points left after deleting `T = 0` and the nonseparable fibers of `P`. -/
noncomputable def regularPlanePoints (P F : PlanePolynomial K) : Finset (K × K) := by
  classical
  exact (planePoints F).filter fun p ↦ p.1 ≠ 0 ∧ (exceptionalPolynomial P).eval p.1 ≠ 0

/-- Step 4's deletion bound: at most one zero fiber, the roots of the exceptional
polynomial, and at most `F.natDegree` rational points per deleted fiber. -/
theorem card_planePoints_le_regular_add {P F : PlanePolynomial K} (hF : F.Monic)
    (hPex : exceptionalPolynomial P ≠ 0) :
    (planePoints F).card ≤ (regularPlanePoints P F).card +
      ((exceptionalPolynomial P).natDegree + 1) * F.natDegree := by
  classical
  let bad := insert 0 (exceptionalPolynomial P).roots.toFinset
  let fiber (t : K) := (specialize t F).roots.toFinset.image (Prod.mk t)
  have hbad : bad.card ≤ (exceptionalPolynomial P).natDegree + 1 :=
    (card_insert_le _ _).trans (Nat.add_le_add_right
      ((Multiset.toFinset_card_le _).trans (card_roots' _)) 1)
  have hf (t : K) : (fiber t).card ≤ F.natDegree := calc
    _ ≤ _ := card_image_le
    _ ≤ (specialize t F).natDegree := (Multiset.toFinset_card_le _).trans (card_roots' _)
    _ = _ := hF.natDegree_map _
  have hs : planePoints F ⊆ regularPlanePoints P F ∪ bad.biUnion fiber := by
    intro p hp
    by_cases h : p.1 ≠ 0 ∧ (exceptionalPolynomial P).eval p.1 ≠ 0
    · exact mem_union_left _ (mem_filter.mpr ⟨hp, h⟩)
    · apply mem_union_right
      refine mem_biUnion.mpr ⟨p.1, ?_, mem_image.mpr ⟨p.2, ?_, rfl⟩⟩
      · rcases not_and_or.mp h with h | h
        · exact mem_insert.mpr (Or.inl (not_ne_iff.mp h))
        · exact mem_insert.mpr (Or.inr (Multiset.mem_toFinset.mpr
            ((mem_roots hPex).mpr (not_ne_iff.mp h))))
      · exact Multiset.mem_toFinset.mpr ((mem_roots (hF.map _).ne_zero).mpr (mem_filter.mp hp).2)
  calc
    _ ≤ _ := card_le_card hs
    _ ≤ (regularPlanePoints P F).card + (bad.biUnion fiber).card := card_union_le _ _
    _ ≤ _ := Nat.add_le_add_left
      ((card_biUnion_le_card_mul _ _ _ (fun t _ ↦ hf t)).trans (Nat.mul_le_mul_right _ hbad)) _

end Counting

end Conjectures.AsgarliGhiocaYip
