import Conjectures.PublishedDruryPermanent
import Mathlib.Data.Finset.Sort

/-!
# Pate's conjecture and Soules's permanent-on-top conjecture

Candidate formalization of the displayed matrix and coefficient vector in
Hoang Anh Tran, Mathematical Inequalities & Applications 25 (2022), 1–16,
DOI 10.7153/mia-2022-25-01, Section 4.
-/

noncomputable section

open Matrix Complex
open scoped BigOperators ComplexOrder
local notation "ℤ[i]" => GaussianInt

namespace Published.Tran

/-- Real eigenvalues, expressed by their defining nonzero eigenvectors. -/
def realEigenvalues {ι : Type*} [Fintype ι] (A : Matrix ι ι ℂ) : Set ℝ :=
  {r | ∃ v : ι → ℂ, v ≠ 0 ∧ A *ᵥ v = (r : ℂ) • v}

/-- The source's phrase "largest eigenvalue". -/
def IsLargestEigenvalue {ι : Type*} [Fintype ι]
    (A : Matrix ι ι ℂ) (r : ℝ) : Prop := IsGreatest (realEigenvalues A) r

/-- Every subset of the original ordered index set with precisely k elements. -/
abbrev Subsets (n k : ℕ) := {s : Finset (Fin n) // s.card = k}

/-- The complementary permanental compound, including both minor factors. -/
def compound {n : ℕ} {R : Type*} [CommSemiring R]
    (A : Matrix (Fin n) (Fin n) R) (k : ℕ) :
    Matrix (Subsets n k) (Subsets n k) R := fun S T =>
  (A.submatrix (S.val.orderEmbOfFin S.property) (T.val.orderEmbOfFin T.property)).permanent *
    (A.submatrix
      (S.valᶜ.orderEmbOfFin (k := n - k) (by simp [Finset.card_compl, S.property]))
      (T.valᶜ.orderEmbOfFin (k := n - k) (by simp [Finset.card_compl, T.property]))).permanent

/-- Pate's full original quantification. -/
def PateConjecture : Prop :=
  ∀ (n k : ℕ) (A : Matrix (Fin n) (Fin n) ℂ), 0 < k → k < n →
    A.PosSemidef → IsLargestEigenvalue (compound A k) A.permanent.re

/-- The full Schur-power matrix on the symmetric group. -/
def schurPower {n : ℕ} {R : Type*} [CommSemiring R]
    (A : Matrix (Fin n) (Fin n) R) :
    Matrix (Equiv.Perm (Fin n)) (Equiv.Perm (Fin n)) R :=
  fun σ τ => ∏ i, A (σ i) (τ i)

/-- Soules's original conjecture, for all orders and complex PSD matrices. -/
def SoulesConjecture : Prop :=
  ∀ (n : ℕ) (A : Matrix (Fin n) (Fin n) ℂ), A.PosSemidef →
    IsLargestEigenvalue (schurPower A) A.permanent.re

def tranZ : Matrix (Fin 5) (Fin 5) ℤ[i] :=
  !![⟨3, 0⟩, ⟨1, -2⟩, ⟨-1, 0⟩, ⟨1, 2⟩, ⟨1, 0⟩;
     ⟨1, 2⟩, ⟨3, 0⟩, ⟨1, -2⟩, ⟨-1, 0⟩, ⟨1, 0⟩;
     ⟨-1, 0⟩, ⟨1, 2⟩, ⟨3, 0⟩, ⟨1, -2⟩, ⟨1, 0⟩;
     ⟨1, -2⟩, ⟨-1, 0⟩, ⟨1, 2⟩, ⟨3, 0⟩, ⟨1, 0⟩;
     ⟨1, 0⟩, ⟨1, 0⟩, ⟨1, 0⟩, ⟨1, 0⟩, ⟨1, 0⟩]

def tran : Matrix (Fin 5) (Fin 5) ℂ := tranZ.map GaussianInt.toComplex

/-- Repeated Gram rows avoid introducing square roots. -/
def gramRows : Matrix (Fin 3) (Fin 5) ℂ :=
  !![1, 1, 1, 1, 1;
     -I, -1, I, 1, 0;
     -I, -1, I, 1, 0]

lemma tran_gram : tran = gramRowsᴴ * gramRows := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [tran, tranZ, gramRows, Matrix.mul_apply, Matrix.conjTranspose_apply,
      Matrix.map_apply, GaussianInt.toComplex_def', Fin.sum_univ_succ, Complex.ext_iff,
      Matrix.vecHead, Matrix.vecTail, map_ofNat]

lemma tran_posSemidef : tran.PosSemidef := by
  rw [tran_gram]
  exact Matrix.posSemidef_conjTranspose_mul_self _

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
lemma tran_permanent_Z : Published.Drury.permanentFinite tranZ = 504 := by
  decide

/-- Conjugates of Tran's coefficients, for matrix-times-column eigenvectors. -/
def coefficient (S : Finset (Fin 5)) : ℤ[i] :=
  if S = {0, 1} then ⟨-1, -1⟩ else
  if S = {1, 2} then ⟨-1, 1⟩ else
  if S = {2, 3} then ⟨1, 1⟩ else
  if S = {0, 3} then ⟨1, -1⟩ else
  if S = {0, 4} then ⟨0, 2⟩ else
  if S = {1, 4} then ⟨2, 0⟩ else
  if S = {2, 4} then ⟨0, -2⟩ else
  if S = {3, 4} then ⟨-2, 0⟩ else 0

/-- Transparent permanent evaluators on the same two complementary minors. -/
def compoundFinite {n : ℕ} {R : Type*} [CommSemiring R]
    (A : Matrix (Fin n) (Fin n) R) (k : ℕ) :
    Matrix (Subsets n k) (Subsets n k) R := fun S T =>
  Published.Drury.permanentFinite
    (A.submatrix (S.val.orderEmbOfFin S.property) (T.val.orderEmbOfFin T.property)) *
  Published.Drury.permanentFinite
    (A.submatrix
      (S.valᶜ.orderEmbOfFin (k := n - k) (by simp [Finset.card_compl, S.property]))
      (T.valᶜ.orderEmbOfFin (k := n - k) (by simp [Finset.card_compl, T.property])))

lemma compoundFinite_eq {n : ℕ} {R : Type*} [CommSemiring R]
    (A : Matrix (Fin n) (Fin n) R) (k : ℕ) : compoundFinite A k = compound A k := by
  ext S T
  simp [compoundFinite, compound, Published.Drury.permanentFinite_eq]

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
lemma compound_eigenvector_Z :
    compoundFinite tranZ 2 *ᵥ (fun S => coefficient S.val) =
      (512 : ℤ[i]) • (fun S : Subsets 5 2 => coefficient S.val) := by
  decide

/-- Lift the pair coefficient through the images of positions zero and one. -/
def schurCoefficient (σ : Equiv.Perm (Fin 5)) : ℤ[i] :=
  coefficient {σ 0, σ 1}

/-- The actual Schur-power action as a transparent finite permutation sum. -/
def schurActionFinite (σ : Equiv.Perm (Fin 5)) : ℤ[i] :=
  ∑ τ ∈ permsOfFinset (Finset.univ : Finset (Fin 5)),
    schurPower tranZ σ τ * schurCoefficient τ

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
lemma schur_eigenvector_certificate_Z :
    (permsOfList (List.finRange 5)).all (fun σ =>
      decide (schurActionFinite σ = (512 : ℤ[i]) * schurCoefficient σ)) = true := by
  decide

lemma tran_permanent : tran.permanent = 504 := by
  rw [tran, Published.Drury.permanent_map, ← Published.Drury.permanentFinite_eq,
    tran_permanent_Z]
  exact map_natCast GaussianInt.toComplex _

lemma compound_map {n : ℕ} {R S : Type*} [CommSemiring R] [CommSemiring S]
    (f : R →+* S) (A : Matrix (Fin n) (Fin n) R) (k : ℕ) :
    compound (A.map f) k = (compound A k).map f := by
  ext X Y
  simp [compound, Matrix.permanent, Matrix.map_apply, Matrix.submatrix_apply,
    map_sum, map_prod, map_mul]

lemma schurPower_map {n : ℕ} {R S : Type*} [CommSemiring R] [CommSemiring S]
    (f : R →+* S) (A : Matrix (Fin n) (Fin n) R) :
    schurPower (A.map f) = (schurPower A).map f := by
  ext σ τ
  simp [schurPower, Matrix.map_apply, map_prod]

def compoundVector : Subsets 5 2 → ℂ :=
  fun S => GaussianInt.toComplex (coefficient S.val)

lemma compoundVector_ne_zero : compoundVector ≠ 0 := by
  intro h
  have hh := congrFun h (⟨{0, 1}, by decide⟩ : Subsets 5 2)
  norm_num [compoundVector, coefficient, GaussianInt.toComplex_def'] at hh

lemma tran_compound_eigenvector :
    compound tran 2 *ᵥ compoundVector = (512 : ℂ) • compoundVector := by
  rw [tran, compound_map]
  ext S
  have h := congrArg GaussianInt.toComplex (congrFun compound_eigenvector_Z S)
  rw [compoundFinite_eq] at h
  simpa [RingHom.map_mulVec, compoundVector, Function.comp_def, map_mul, map_ofNat] using h

lemma tran_compound_eigenvalue : (512 : ℝ) ∈ realEigenvalues (compound tran 2) := by
  exact ⟨compoundVector, compoundVector_ne_zero, by simpa using tran_compound_eigenvector⟩

/-- Tran's witness refutes Pate's full complementary-compound conjecture. -/
theorem not_pateConjecture : ¬ PateConjecture := by
  intro h
  have hb := (h 5 2 tran (by norm_num) (by norm_num) tran_posSemidef).2
    tran_compound_eigenvalue
  norm_num [tran_permanent] at hb

lemma schur_eigenvector_action_Z :
    schurPower tranZ *ᵥ schurCoefficient = (512 : ℤ[i]) • schurCoefficient := by
  ext σ
  have hm : σ ∈ permsOfList (List.finRange 5) :=
    mem_permsOfList_of_mem (fun i _ => by simp)
  have h := of_decide_eq_true ((List.all_eq_true.mp schur_eigenvector_certificate_Z) σ hm)
  have hu : permsOfFinset (Finset.univ : Finset (Fin 5)) = Finset.univ := by
    ext τ
    simp [mem_perms_of_finset_iff]
  simpa [schurActionFinite, hu, Matrix.mulVec, dotProduct] using h

def schurVector : Equiv.Perm (Fin 5) → ℂ :=
  fun σ => GaussianInt.toComplex (schurCoefficient σ)

lemma schurVector_ne_zero : schurVector ≠ 0 := by
  intro h
  have hh := congrFun h (1 : Equiv.Perm (Fin 5))
  norm_num [schurVector, schurCoefficient, coefficient, GaussianInt.toComplex_def'] at hh

lemma tran_schur_eigenvector :
    schurPower tran *ᵥ schurVector = (512 : ℂ) • schurVector := by
  rw [tran, schurPower_map]
  ext σ
  have h := congrArg GaussianInt.toComplex (congrFun schur_eigenvector_action_Z σ)
  simpa [RingHom.map_mulVec, schurVector, Function.comp_def, map_mul, map_ofNat] using h

lemma tran_schur_eigenvalue : (512 : ℝ) ∈ realEigenvalues (schurPower tran) := by
  exact ⟨schurVector, schurVector_ne_zero, by simpa using tran_schur_eigenvector⟩

/-- Tran's witness refutes Soules's full permanent-on-top conjecture. -/
theorem not_soulesConjecture : ¬ SoulesConjecture := by
  intro h
  have hb := (h 5 tran tran_posSemidef).2 tran_schur_eigenvalue
  norm_num [tran_permanent] at hb

end Published.Tran
