module
public import Conjectures.NovelliThibonVirtualComplete
public import Conjectures.NovelliThibonVirtualGraph
public import Conjectures.NovelliThibonHookExtraction
public import Mathlib.Algebra.Polynomial.Roots

@[expose] public section
namespace NovelliThibon

open Polynomial Matrix
open Classical

noncomputable def repeatedJacobiTrudi {r : ℕ} (shape : Fin r → ℕ) (z : ℚ) :
    Matrix (Fin r) (Fin r) ℚ[X] :=
  Matrix.of fun i j => completeRepeatedPolynomial z ((shape i:ℤ)-i.val+j.val)

noncomputable def ordinaryJacobiTrudi {r : ℕ} (shape : Fin r → ℕ) (z : ℚ) (m : ℕ) :
    Matrix (Fin r) (Fin r) ℚ :=
  Matrix.of fun i j =>
    let d := (shape i:ℤ)-i.val+j.val
    if d < 0 then 0 else MvPolynomial.eval (repeatedLetterWeight m z)
      (MvPolynomial.hsymm (Fin (m+1)) ℚ d.toNat)

theorem repeatedJacobiTrudi_eval_nat {r : ℕ} (shape : Fin r → ℕ) (z : ℚ) (m : ℕ) :
    ((repeatedJacobiTrudi shape z).det).eval (m:ℚ) = (ordinaryJacobiTrudi shape z m).det := by
  change evalRingHom (m:ℚ) (repeatedJacobiTrudi shape z).det = _
  rw [RingHom.map_det]
  congr 1
  ext i j
  exact completeRepeatedPolynomial_eval_nat z _ m

theorem repeatedJacobiTrudi_eval_neg_one {r : ℕ} (shape : Fin r → ℕ) (z : ℚ) :
    ((repeatedJacobiTrudi shape z).det).eval (-1) = (specializedJacobiTrudi shape z).det := by
  change evalRingHom (-1:ℚ) (repeatedJacobiTrudi shape z).det = _
  rw [RingHom.map_det]
  congr 1
  ext i j
  exact completeRepeatedPolynomial_eval_neg_one z _

end NovelliThibon
