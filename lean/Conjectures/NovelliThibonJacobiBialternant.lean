module
public import Conjectures.NovelliThibonJacobiFactorization
public import Conjectures.NovelliThibonSchurMoments

@[expose] public section
namespace NovelliThibon

open Matrix
open Classical

theorem powerMatrix_X_det_eq_alternant {N : ℕ} (a : Fin (N+1) → ℕ) :
    (powerMatrix (MvPolynomial.X : Fin (N+1) → MvPolynomial (Fin (N+1)) ℤ) a).det =
      alternant a := by
  rw [Matrix.det_apply',alternant]
  conv_lhs => rw [← Equiv.sum_comp (Equiv.inv (Equiv.Perm (Fin (N+1))))]
  apply Finset.sum_congr rfl
  intro p _
  simp only [Equiv.inv_apply,Equiv.Perm.sign_inv,powerMatrix,Matrix.of_apply]
  change ((p.sign : ℤ):MvPolynomial (Fin (N+1)) ℤ) *
    (∏ i : Fin (N+1), MvPolynomial.X i ^ a (p.symm i)) =
      MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm (a ∘ p.symm)) (p.sign : ℤ)
  simp_rw [MvPolynomial.X_pow_eq_monomial]
  have hc : ((p.sign:ℤ):MvPolynomial (Fin (N+1)) ℤ) = MvPolynomial.C (p.sign:ℤ) := by simp
  rw [← MvPolynomial.monomial_sum_one,hc,MvPolynomial.C_mul_monomial,mul_one]
  apply congrArg (fun e => MvPolynomial.monomial e (p.sign:ℤ))
  apply Finsupp.ext
  intro i
  rw [Finsupp.finsetSum_apply]
  change (∑ j : Fin (N+1), (Finsupp.single j (a (p.symm j)):Fin (N+1) →₀ ℕ) i) = a (p.symm i)
  simp [Finsupp.single_apply,Finset.sum_ite_eq']

/-- The actual Jacobi–Trudi polynomial using Mathlib's complete
homogeneous symmetric sequence. Negative degree entries are zero. -/
noncomputable def jacobiTrudiPolynomial (m : ℕ) (lam : YoungDiagram) :
    MvPolynomial (Fin (m+2)) ℤ :=
  (Matrix.of fun (i j : Fin (m+2)) =>
    let d := (lam.rowLen i.val:ℤ)-(i.val:ℤ)+j.val
    if d < 0 then 0 else MvPolynomial.hsymm (Fin (m+2)) ℤ d.toNat).det

theorem jacobiTrudiPolynomial_eq_det (m : ℕ) (lam : YoungDiagram) :
    jacobiTrudiPolynomial m lam =
      (jacobiTrudiUniv (MvPolynomial.X : Fin (m+2) → MvPolynomial (Fin (m+2)) ℤ)
        (fun i => lam.rowLen i.val)).det := by
  apply congrArg (fun M : Matrix (Fin (m+2)) (Fin (m+2)) (MvPolynomial (Fin (m+2)) ℤ) => M.det)
  apply Matrix.ext
  intro i j
  change _ = completeOn (Finset.univ : Finset (Fin (m+2)))
    (MvPolynomial.X : Fin (m+2) → MvPolynomial (Fin (m+2)) ℤ)
    ((lam.rowLen i.val:ℤ)-(i.val:ℤ)+j.val)
  rw [completeOn_univ_eq_completeSum]
  rfl

/-- Cross multiplication yields exactly the signed alternant convention
used by the source coefficient extractor. -/
theorem jacobiTrudiPolynomial_bialternant (m : ℕ) (lam : YoungDiagram) :
    alternant (@staircase m) * jacobiTrudiPolynomial m lam =
      alternant (shapeExponents lam) := by
  rw [mul_comm,jacobiTrudiPolynomial_eq_det,← powerMatrix_X_det_eq_alternant,
      ← powerMatrix_X_det_eq_alternant]
  exact jacobiTrudi_det_times_staircase (N:=m+1) MvPolynomial.X (fun i => lam.rowLen i.val)

open Classical in
theorem schurExtract_jacobiTrudiPolynomial (m : ℕ) (lam nu : YoungDiagram)
    (hlam : lam.colLen 0 ≤ m+2) (hnu : nu.colLen 0 ≤ m+2) :
    schurExtract (m:=m) lam (jacobiTrudiPolynomial m nu) = if nu=lam then 1 else 0 :=
  schurExtract_of_bialternant m lam nu hlam hnu _ (jacobiTrudiPolynomial_bialternant m nu)

end NovelliThibon
