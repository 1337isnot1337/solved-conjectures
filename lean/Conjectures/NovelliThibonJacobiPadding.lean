module
public import Conjectures.NovelliThibonJacobiFactorization
public import Mathlib.Logic.Equiv.Fin.Basic

@[expose] public section
namespace NovelliThibon

open Matrix
open Classical
variable {R : Type*} [CommRing R]

noncomputable def jacobiOnSequence {r : ℕ} (h : ℤ → R) (rows : Fin r → ℕ) :
    Matrix (Fin r) (Fin r) R :=
  Matrix.of fun i j => h ((rows i:ℤ)-(i.val:ℤ)+j.val)

theorem jacobiOnSequence_zero_det (h : ℤ → R) (hn : ∀ d < 0,h d=0) (h0 : h 0=1)
    (r : ℕ) : (jacobiOnSequence h (fun _ : Fin r => 0)).det=1 := by
  have ht : (jacobiOnSequence h (fun _ : Fin r => 0)).IsUpperTriangular := by
    intro i j hij
    have he : j.val < i.val := hij
    change h ((0:ℤ)-(i.val:ℤ)+j.val)=0
    exact hn _ (by omega)
  rw [Matrix.det_of_isUpperTriangular ht]
  apply Finset.prod_eq_one
  intro i _
  change h ((0:ℤ)-(i.val:ℤ)+i.val)=1
  rw [show (0:ℤ)-(i.val:ℤ)+i.val=0 by ring,h0]

/-- Padding the row list with zero rows does not change the
Jacobi–Trudi determinant. The appended block has determinant one. -/
theorem jacobiOnSequence_padding {r : ℕ} (h : ℤ → R) (hn : ∀ d < 0,h d=0) (h0 : h 0=1)
    (rows : Fin r → ℕ) (s : ℕ) :
    (jacobiOnSequence h (Fin.append rows (fun _ : Fin s => 0))).det =
      (jacobiOnSequence h rows).det := by
  let X := jacobiOnSequence h (Fin.append rows (fun _ : Fin s => 0))
  let A := jacobiOnSequence h rows
  let B : Matrix (Fin r) (Fin s) R :=
    Matrix.of fun i j => h ((rows i:ℤ)-(i.val:ℤ)+(r:ℤ)+j.val)
  let D := jacobiOnSequence h (fun _ : Fin s => 0)
  let e : Fin r ⊕ Fin s ≃ Fin (r+s) := finSumFinEquiv
  have he : Matrix.reindex e.symm e.symm X = Matrix.fromBlocks A B 0 D := by
    ext i j
    rcases i with i|i <;> rcases j with j|j
    · simp [e,X,A,jacobiOnSequence,finSumFinEquiv_apply_left]
    · simp [e,X,B,jacobiOnSequence,finSumFinEquiv_apply_left,finSumFinEquiv_apply_right,add_assoc]
    · have hv := j.isLt
      simp [e,X,jacobiOnSequence,finSumFinEquiv_apply_left,finSumFinEquiv_apply_right]
      exact hn _ (by omega)
    · simp [e,X,D,jacobiOnSequence,finSumFinEquiv_apply_right]
  rw [← Matrix.det_reindex_self e.symm X,he,Matrix.det_fromBlocks_zero₂₁,
    jacobiOnSequence_zero_det h hn h0,mul_one]

end NovelliThibon
