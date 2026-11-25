module
public import Conjectures.NovelliThibonJacobiBialternant
public import Conjectures.NovelliThibonJacobiPadding
public import Conjectures.NovelliThibonStableHook

@[expose] public section
namespace NovelliThibon

open Matrix
open Classical

noncomputable def completeValue {A K : Type*} [Fintype A] [DecidableEq A] [CommRing K]
    (x : A → K) (d : ℤ) : K :=
  if d < 0 then 0 else MvPolynomial.eval x (MvPolynomial.hsymm A K d.toNat)

theorem completeValue_neg {A K : Type*} [Fintype A] [DecidableEq A] [CommRing K]
    (x : A → K) {d : ℤ} (hd : d < 0) : completeValue x d=0 := by
  simp [completeValue,hd]

theorem completeValue_zero {A K : Type*} [Fintype A] [DecidableEq A] [CommRing K]
    (x : A → K) : completeValue x 0=1 := by simp [completeValue]

/-- Ordinary evaluation of the integer bialternant Schur polynomial
equals the actual complete-symmetric determinant in the unpadded
shape, for any commutative coefficient ring. -/
theorem eval_jacobiTrudiPolynomial_shape_height {K : Type*} [CommRing K]
    (m : ℕ) (lam : YoungDiagram) (h : lam.colLen 0 ≤ m+2) (x : Fin (m+2) → K) :
    MvPolynomial.eval₂Hom (Int.castRingHom K) x (jacobiTrudiPolynomial m lam) =
      (jacobiOnSequence (completeValue x) (fun i : Fin (lam.colLen 0) => lam.rowLen i.val)).det := by
  let rows : Fin (m+2) → ℕ := fun i => lam.rowLen i.val
  have hm : MvPolynomial.eval₂Hom (Int.castRingHom K) x (jacobiTrudiPolynomial m lam) =
      (jacobiOnSequence (completeValue x) rows).det := by
    unfold jacobiTrudiPolynomial
    rw [RingHom.map_det]
    apply congrArg (fun M : Matrix (Fin (m+2)) (Fin (m+2)) K => M.det)
    apply Matrix.ext
    intro i j
    let d : ℤ := (lam.rowLen i.val:ℤ)-(i.val:ℤ)+j.val
    change MvPolynomial.eval₂Hom (Int.castRingHom K) x
      (if d < 0 then 0 else MvPolynomial.hsymm (Fin (m+2)) ℤ d.toNat) = completeValue x d
    unfold completeValue
    by_cases hd : d < 0
    · simp [hd]
    · simp only [hd,ite_false]
      change MvPolynomial.eval₂ (Int.castRingHom K) x (MvPolynomial.hsymm (Fin (m+2)) ℤ d.toNat) = _
      rw [MvPolynomial.eval₂_eq_eval_map,MvPolynomial.map_hsymm]
  rw [hm]
  let k := lam.colLen 0
  let s := m+2-k
  let small : Fin k → ℕ := fun i => lam.rowLen i.val
  let e : Fin (k+s) ≃ Fin (m+2) := finCongr (by dsimp [k,s]; omega)
  have hrow : (rows ∘ e) = Fin.append small (fun _ : Fin s => 0) := by
    funext i
    refine Fin.addCases ?_ ?_ i
    · intro j
      rw [Fin.append_left]
      rfl
    · intro j
      rw [Fin.append_right]
      change lam.rowLen (k+j.val)=0
      exact rowLen_eq_zero_of_bound lam (Nat.le_add_right _ _)
  have hmat : Matrix.reindex e.symm e.symm (jacobiOnSequence (completeValue x) rows) =
      jacobiOnSequence (completeValue x) (Fin.append small (fun _ : Fin s => 0)) := by
    apply Matrix.ext
    intro i j
    change completeValue x (((rows ∘ e) i:ℤ)-(i.val:ℤ)+j.val) =
      completeValue x (((Fin.append small (fun _ : Fin s => (0:ℕ)) i:ℕ):ℤ)-(i.val:ℤ)+j.val)
    rw [hrow]
  rw [← Matrix.det_reindex_self e.symm,hmat,
    jacobiOnSequence_padding _ (fun _ => completeValue_neg x) (completeValue_zero x)]

end NovelliThibon
