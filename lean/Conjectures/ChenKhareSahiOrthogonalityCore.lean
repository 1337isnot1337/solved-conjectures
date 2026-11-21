module

public import Conjectures.ChenKhareSahiOrthogonalityTransition
public import Conjectures.ChenKhareSahiOrthogonalityGram
public import Conjectures.ChenKhareSahiOrthogonalityDual
public import Conjectures.ChenKhareSahiOrthogonalityFamily
public import Mathlib.Basic.Real.Basic
public import Mathlib.Data.Rat.BigOperators
public import Mathlib.Tactic.Ring
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

@[expose] public section

namespace ChenKhareSahi.Orthogonality

open Matrix

noncomputable section

abbrev RealVector := Index → ℝ

def realMatrix (A : Matrix Index Index ℚ) : Matrix Index Index ℝ :=
  fun i j => (A i j : ℝ)

def realMacdonald : Index → RealVector := realMatrix macdonald

def realDual : Matrix Index Index ℝ := realMatrix dual

/-- Both directions of the change of basis hold over the real coefficient field. -/
theorem real_inverse_transition :
    realMatrix monomialInPower * realMatrix powerTransition = 1 := by
  have hr : monomialInPower * powerTransition = 1 :=
    mul_eq_one_comm.mp transition_inverse
  ext i j
  have h := congrFun (congrFun hr i) j
  simp only [Matrix.mul_apply, Matrix.one_apply] at h ⊢
  unfold realMatrix
  by_cases hij : i = j
  · simp only [ite_eq_left hij] at h ⊢
    exact_mod_cast h
  · simp only [ite_eq_right hij] at h ⊢
    exact_mod_cast h

theorem real_evaluation_inverse :
    realMatrix evaluationInverse * realMatrix evaluationMatrix = 1 := by
  ext i j
  have h := congrFun (congrFun evaluation_inverse i) j
  simp only [Matrix.mul_apply, Matrix.one_apply] at h ⊢
  unfold realMatrix
  by_cases hij : i = j
  · simp only [ite_eq_left hij] at h ⊢
    exact_mod_cast h
  · simp only [ite_eq_right hij] at h ⊢
    exact_mod_cast h

theorem real_gram_macdonald (i : Index) :
    (realMatrix gram).mulVec (realMacdonald i) = realDual i := by
  funext j
  have h := congrFun (gram_macdonald i) j
  unfold Matrix.mulVec dotProduct at h
  change (∑ k : Index, (gram j k : ℝ) * (macdonald i k : ℝ)) = (dual i j : ℝ)
  exact_mod_cast h

theorem real_dual_upper (i j : Index) (h : j < i) : realDual i j = 0 := by
  change (dual i j : ℝ) = 0
  exact_mod_cast dual_upper i j h

theorem real_dual_diagonal_positive (i : Index) : 0 < realDual i i := by
  change (0 : ℝ) < (dual i i : ℝ)
  exact_mod_cast dual_diagonal_positive i

theorem real_macdonald_monic (i : Index) : realMacdonald i i = 1 := by
  change (macdonald i i : ℝ) = 1
  exact_mod_cast macdonald_monic i

theorem real_macdonald_triangular (i j : Index) (h : ¬ dominates i j) :
    realMacdonald i j = 0 := by
  change (macdonald i j : ℝ) = 0
  exact_mod_cast macdonald_triangular i j h

theorem real_macdonald_dual (i j : Index) :
    dotProduct (realMacdonald i) (realDual j) = if i = j then realDual i i else 0 := by
  have h := macdonald_dual i j
  unfold dotProduct at h ⊢
  unfold realMacdonald realDual realMatrix
  by_cases hij : i = j
  · simp only [ite_eq_left hij] at h ⊢
    exact_mod_cast h
  · simp only [ite_eq_right hij] at h ⊢
    exact_mod_cast h

/-- Monomial coordinates converted to power-sum coordinates. -/
def powerCoordinates (v : RealVector) : RealVector := v ᵥ* realMatrix monomialInPower

/-- The source Hall form in the monomial basis, at q=1/10 and t=9/10. -/
def hall (v w : RealVector) : ℝ := dotProduct v ((realMatrix gram).mulVec w)

theorem gram_factorization :
    realMatrix gram = realMatrix monomialInPower *
      Matrix.diagonal (fun i => (hallWeight i : ℝ)) *
      (realMatrix monomialInPower).transpose := by
  ext i j
  rw [Matrix.mul_apply]
  simp only [Matrix.mul_diagonal, Matrix.transpose_apply]
  have h := gram_from_power i j
  change (gram i j : ℝ) = ∑ k : Index,
    (monomialInPower i k : ℝ) * (hallWeight k : ℝ) * (monomialInPower j k : ℝ)
  exact_mod_cast h

theorem hall_power_coordinates (v w : RealVector) :
    hall v w = ∑ k : Index, powerCoordinates v k * (hallWeight k : ℝ) * powerCoordinates w k := by
  unfold hall
  rw [gram_factorization, ← Matrix.mulVec_mulVec, ← Matrix.mulVec_mulVec,
    Matrix.dotProduct_mulVec, Matrix.mulVec_transpose]
  simp only [dotProduct, Matrix.mulVec_diagonal, powerCoordinates]
  apply Finset.sum_congr rfl
  intro k _
  ring

theorem powerCoordinates_power (i : Index) :
    powerCoordinates (realMatrix powerTransition i) = Pi.single i 1 := by
  funext j
  have h := congrFun (congrFun transition_inverse i) j
  simp only [Matrix.mul_apply, Matrix.one_apply] at h
  change (∑ k : Index, (powerTransition i k : ℝ) * (monomialInPower k j : ℝ)) =
    (Pi.single i (1 : ℝ) : RealVector) j
  rw [Pi.single_apply]
  by_cases hij : i = j
  · simp only [ite_eq_left hij, ite_eq_left hij.symm] at h ⊢
    exact_mod_cast h
  · simp only [ite_eq_right hij, ite_eq_right (Ne.symm hij)] at h ⊢
    exact_mod_cast h

/-- The power-sum basis has exactly the diagonal scalar product in source equation (2.8). -/
theorem hall_power_basis (i j : Index) :
    hall (realMatrix powerTransition i) (realMatrix powerTransition j) =
      if i = j then (hallWeight i : ℝ) else 0 := by
  rw [hall_power_coordinates, powerCoordinates_power, powerCoordinates_power]
  by_cases hij : i = j
  · subst j
    simp [Pi.single_apply]
  · simp [Pi.single_apply, hij, Ne.symm hij]

theorem hall_macdonald (v : RealVector) (i : Index) :
    hall v (realMacdonald i) = dotProduct v (realDual i) := by
  unfold hall
  rw [real_gram_macdonald]

/-- A complete degree-six Macdonald family in the source's defining form:
monic dominance-triangular polynomials and pairwise Hall orthogonality. -/
structure IsSourceFamily (F : Index → RealVector) : Prop where
  monic : ∀ i, F i i = 1
  triangular : ∀ i j, ¬ dominates i j → F i j = 0
  orthogonal : ∀ i j, i ≠ j → hall (F i) (F j) = 0

theorem macdonald_source_family : IsSourceFamily realMacdonald := by
  refine ⟨real_macdonald_monic, real_macdonald_triangular, ?_⟩
  intro i j hij
  rw [hall_macdonald, real_macdonald_dual, ite_eq_right hij]

theorem IsSourceFamily.above {F : Index → RealVector} (hF : IsSourceFamily F)
    (i j : Index) (hij : i < j) : F i j = 0 := by
  apply hF.triangular i j
  intro h
  exact (not_le_of_gt hij) (dominates_index i j h)

theorem macdonald_above (i j : Index) (hij : i < j) : realMacdonald i j = 0 :=
  macdonald_source_family.above i j hij

theorem dual_isUpperTriangular : realDual.IsUpperTriangular := by
  intro i j h
  exact real_dual_upper i j h

theorem dual_injective : Function.Injective realDual.mulVec := by
  apply Matrix.mulVec_injective_of_isUnit
  apply (Matrix.isUnit_iff_isUnit_det realDual).mpr
  apply isUnit_iff_ne_zero.mpr
  apply dual_isUpperTriangular.det_ne_zero_iff.mpr
  intro i
  exact ne_of_gt (real_dual_diagonal_positive i)

theorem dot_dual_diagonal (v : RealVector) (i : Index)
    (hv : ∀ k, i < k → v k = 0) :
    dotProduct v (realDual i) = v i * realDual i i := by
  unfold dotProduct
  apply Finset.sum_eq_single i
  · intro k _ hki
    by_cases h : k < i
    · rw [real_dual_upper i k h, mul_zero]
    · have hi : i < k := lt_of_le_of_ne (le_of_not_gt h) (Ne.symm hki)
      rw [hv k hi, zero_mul]
  · simp

theorem dot_dual_above (v : RealVector) (i j : Index)
    (hv : ∀ k, i < k → v k = 0) (hij : i < j) :
    dotProduct v (realDual j) = 0 := by
  unfold dotProduct
  apply Finset.sum_eq_zero
  intro k _
  by_cases h : k < j
  · rw [real_dual_upper j k h, mul_zero]
  · rw [hv k (lt_of_lt_of_le hij (le_of_not_gt h)), zero_mul]

/-- Uniqueness uses the full source conditions; no eigenfunction
characterization or equivalence theorem is assumed. -/
theorem source_family_unique (F : Index → RealVector) (hF : IsSourceFamily F) :
    F = realMacdonald := by
  have h : ∀ n : ℕ, ∀ i : Index, i.val = n → F i = realMacdonald i := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro i hin
      apply dual_injective
      funext j
      change dotProduct (realDual j) (F i) = dotProduct (realDual j) (realMacdonald i)
      rw [dotProduct_comm (realDual j), dotProduct_comm (realDual j)]
      by_cases hj : j < i
      · have hj' : j.val < n := by
          rw [← hin]
          exact hj
        have hFj := ih j.val hj' j rfl
        rw [← hall_macdonald, ← hFj, hF.orthogonal i j (ne_of_gt hj),
          real_macdonald_dual, ite_eq_right (ne_of_gt hj)]
      · by_cases he : i = j
        · subst j
          rw [dot_dual_diagonal (F i) i (hF.above i),
            dot_dual_diagonal (realMacdonald i) i (macdonald_above i),
            hF.monic i, real_macdonald_monic]
        · have hij : i < j := lt_of_le_of_ne (le_of_not_gt hj) he
          rw [dot_dual_above (F i) i j (hF.above i) hij,
            dot_dual_above (realMacdonald i) i j (macdonald_above i) hij]
  funext i
  exact h i.val i rfl

theorem source_family_exists_unique : ∃! F : Index → RealVector, IsSourceFamily F :=
  ⟨realMacdonald, macdonald_source_family, fun F hF => source_family_unique F hF⟩

end

/- Materialize the defining equations in their owning module.
Sibling modules must import these checked equations, rather than create them independently. -/
open Lean Elab Command in
run_cmd do
  liftTermElabM do
    for name in #[
      ``ChenKhareSahi.Orthogonality.RealVector,
      ``ChenKhareSahi.Orthogonality.realMatrix,
      ``ChenKhareSahi.Orthogonality.realMacdonald,
      ``ChenKhareSahi.Orthogonality.realDual,
      ``ChenKhareSahi.Orthogonality.powerCoordinates,
      ``ChenKhareSahi.Orthogonality.hall] do
      discard <| Lean.Meta.getEqnsFor? name

end ChenKhareSahi.Orthogonality
