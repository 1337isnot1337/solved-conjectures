import Mathlib.Algebra.MvPolynomial.Equiv
import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem

/-! # Fundamental theorem of symmetric polynomials in disjoint blocks

This module uses the one-block theorem over a coefficient ring containing all
other blocks. The multipolynomials are formal; no evaluation over a finite field
is used to establish a polynomial identity.
-/

namespace Conjectures.AsgarliGhiocaYip

open MvPolynomial Finset

variable {ι R : Type*} [CommRing R] {d : ℕ}

private abbrev OffBlock (i : ι) (d : ℕ) := {a : ι × Fin d // a.1 ≠ i}

private def blockIndexEquiv [DecidableEq ι] (i : ι) : Fin d ⊕ OffBlock i d ≃ ι × Fin d where
  toFun := Sum.elim (fun j ↦ (i, j)) Subtype.val
  invFun a := if h : a.1 = i then .inl a.2 else .inr ⟨a, h⟩
  left_inv a := by
    cases a with
    | inl j => simp
    | inr a => simp [a.property]
  right_inv a := by rcases a with ⟨l, j⟩; by_cases h : l = i <;> simp_all

private noncomputable def blockCoordinates [DecidableEq ι] (i : ι) :
    MvPolynomial (ι × Fin d) R ≃ₐ[R] MvPolynomial (Fin d) (MvPolynomial (OffBlock i d) R) :=
  (renameEquiv R (blockIndexEquiv i).symm).trans (sumAlgEquiv R _ _)

private theorem blockCoordinates_X_same [DecidableEq ι] (i : ι) (j : Fin d) :
    blockCoordinates i (X (i, j) : MvPolynomial (ι × Fin d) R) = X j := by
  simp [blockCoordinates, blockIndexEquiv]

private theorem blockCoordinates_X_other [DecidableEq ι] (i : ι) (a : OffBlock i d) :
    blockCoordinates i (X a.val : MvPolynomial (ι × Fin d) R) = C (X a) := by
  simp [blockCoordinates, blockIndexEquiv, a.property]

/-- The `n`th elementary symmetric polynomial of the `i`th block. -/
noncomputable def blockESymm (i : ι) (n : ℕ) : MvPolynomial (ι × Fin d) R :=
  rename (fun j : Fin d ↦ (i, j)) (esymm (Fin d) R n)

private theorem blockCoordinates_esymm [DecidableEq ι] (i : ι) (n : ℕ) :
    blockCoordinates i (blockESymm i n : MvPolynomial (ι × Fin d) R) =
      esymm (Fin d) (MvPolynomial (OffBlock i d) R) n := by
  simp only [blockESymm, esymm, map_sum, map_prod, rename_X, blockCoordinates_X_same]

/-- Apply a permutation to one block of variables, leaving the others unchanged. -/
def blockPerm [DecidableEq ι] (i : ι) (p : Equiv.Perm (Fin d)) : Equiv.Perm (ι × Fin d) :=
  (blockIndexEquiv i).symm.trans ((Equiv.sumCongr p (Equiv.refl _)).trans (blockIndexEquiv i))

@[simp] theorem blockPerm_same [DecidableEq ι] (i : ι) (p : Equiv.Perm (Fin d)) (j : Fin d) :
    blockPerm i p (i, j) = (i, p j) := by simp [blockPerm, blockIndexEquiv]

@[simp] theorem blockPerm_other [DecidableEq ι] {i : ι} (p : Equiv.Perm (Fin d))
    {a : ι × Fin d} (ha : a.1 ≠ i) : blockPerm i p a = a := by
  simp [blockPerm, blockIndexEquiv, ha]

private theorem blockCoordinates_rename [DecidableEq ι] (i : ι) (p : Equiv.Perm (Fin d))
    (F : MvPolynomial (ι × Fin d) R) :
    blockCoordinates i (rename (blockPerm i p) F) = rename p (blockCoordinates i F) := by
  let e := blockCoordinates (d := d) (R := R) i
  have h : e.toAlgHom.comp (rename (blockPerm i p)) =
      ((rename (R := MvPolynomial (OffBlock i d) R) p).restrictScalars R).comp e.toAlgHom := by
    ext ⟨l, j⟩
    by_cases h : l = i
    · subst l
      simp [e, blockCoordinates_X_same]
    · simp [e, h, blockCoordinates_X_other i (⟨(l,j), h⟩ : OffBlock i d)]
  exact DFunLike.congr_fun h F

private noncomputable def blockSubst [DecidableEq ι] (i : ι) :
    MvPolynomial (ι × Fin d) R →ₐ[R] MvPolynomial (ι × Fin d) R :=
  aeval fun a ↦ if a.1 = i then blockESymm i (a.2.val + 1) else X a

private theorem blockCoordinates_subst [DecidableEq ι] (i : ι) (F : MvPolynomial (ι × Fin d) R) :
    blockCoordinates i (blockSubst i F) =
      (esymmAlgHom (Fin d) (MvPolynomial (OffBlock i d) R) d (blockCoordinates i F)).val := by
  let e := blockCoordinates (d := d) (R := R) i
  let S := MvPolynomial (OffBlock i d) R
  let es : MvPolynomial (Fin d) S →ₐ[S] MvPolynomial (Fin d) S :=
    (symmetricSubalgebra (Fin d) S).val.comp (esymmAlgHom (Fin d) S d)
  have h : e.toAlgHom.comp (blockSubst i) = (es.restrictScalars R).comp e.toAlgHom := by
    ext ⟨l, j⟩
    by_cases h : l = i
    · subst l
      simp [es, e, blockSubst, esymmAlgHom, blockCoordinates_X_same, blockCoordinates_esymm]
      rfl
    · have hX := blockCoordinates_X_other (R := R) i (⟨(l,j), h⟩ : OffBlock i d)
      simp [es, e, blockSubst, h, hX, esymmAlgHom]
  exact DFunLike.congr_fun h F

private theorem blockSubst_injective [DecidableEq ι] (i : ι) :
    Function.Injective (blockSubst (R := R) (d := d) i) := by
  intro F G h
  apply (blockCoordinates i).injective
  apply esymmAlgHom_fin_injective _ (Nat.le_refl d)
  apply Subtype.ext
  simpa only [blockCoordinates_subst] using congrArg (blockCoordinates i) h

private theorem exists_blockSubst_eq [DecidableEq ι] (i : ι) {F : MvPolynomial (ι × Fin d) R}
    (hF : ∀ p : Equiv.Perm (Fin d), rename (blockPerm i p) F = F) : ∃ G, blockSubst i G = F := by
  let e := blockCoordinates (d := d) (R := R) i
  have hsymm : (e F).IsSymmetric := by
    intro p
    rw [← blockCoordinates_rename, hF]
  obtain ⟨G, hG⟩ := (esymmAlgHom_fin_bijective (MvPolynomial (OffBlock i d) R) d).2 ⟨e F, hsymm⟩
  refine ⟨e.symm G, e.injective ?_⟩
  change blockCoordinates i (blockSubst i (e.symm G)) = _
  rw [blockCoordinates_subst]
  simpa only [show blockCoordinates i (e.symm G) = G from e.apply_symm_apply G] using
    congrArg Subtype.val hG

private theorem blockSubst_relabel_comm [DecidableEq ι] {i l : ι} (hil : i ≠ l)
    (p : Equiv.Perm (Fin d)) (F : MvPolynomial (ι × Fin d) R) :
    blockSubst i (rename (blockPerm l p) F) = rename (blockPerm l p) (blockSubst i F) := by
  have h : (blockSubst i).comp (rename (blockPerm l p)) =
      (rename (R := R) (blockPerm l p)).comp (blockSubst i) := by
    ext ⟨m, j⟩
    by_cases hmi : m = i
    · subst m
      simp [blockSubst, hil, blockESymm, ← AlgHom.comp_apply, rename_comp_rename, Function.comp_def]
    by_cases hml : m = l
    · subst m
      simp [blockSubst, Ne.symm hil]
    · simp [blockSubst, hmi, hml]
  exact DFunLike.congr_fun h F

private noncomputable def blocksSubst [DecidableEq ι] (s : Finset ι) :
    MvPolynomial (ι × Fin d) R →ₐ[R] MvPolynomial (ι × Fin d) R :=
  aeval fun a ↦ if a.1 ∈ s then blockESymm a.1 (a.2.val + 1) else X a

private theorem blocksSubst_insert [DecidableEq ι] {s : Finset ι} {i : ι} (hi : i ∉ s) :
    blocksSubst (R := R) (d := d) (insert i s) = (blockSubst i).comp (blocksSubst s) := by
  ext ⟨l, j⟩
  by_cases hli : l = i
  · subst l; simp [blocksSubst, blockSubst, hi]
  by_cases hls : l ∈ s
  · simp [blocksSubst, hls, blockSubst, blockESymm, esymm, map_sum, map_prod, hli]
  · simp [blocksSubst, blockSubst, hls, hli]

private theorem blocksSubst_empty [DecidableEq ι] :
    blocksSubst (R := R) (d := d) (∅ : Finset ι) = AlgHom.id R _ := by
  ext a; simp [blocksSubst]

private theorem blocksSubst_injective [DecidableEq ι] (s : Finset ι) :
    Function.Injective (blocksSubst (R := R) (d := d) s) := by
  induction s using Finset.induction_on with
  | empty => rw [blocksSubst_empty]; exact Function.injective_id
  | insert i s hi ih => rw [blocksSubst_insert hi]; exact (blockSubst_injective i).comp ih

private theorem exists_blocksSubst_eq [DecidableEq ι] (s : Finset ι)
    {F : MvPolynomial (ι × Fin d) R}
    (hF : ∀ i ∈ s, ∀ p : Equiv.Perm (Fin d), rename (blockPerm i p) F = F) :
    ∃ G, blocksSubst s G = F := by
  induction s using Finset.induction_on generalizing F with
  | empty => exact ⟨F, by rw [blocksSubst_empty]; rfl⟩
  | insert i s hi ih =>
    obtain ⟨G, hG⟩ := exists_blockSubst_eq i (hF i (mem_insert_self _ _))
    have hsymm (l : ι) (hl : l ∈ s) (p : Equiv.Perm (Fin d)) : rename (blockPerm l p) G = G := by
      have hil : i ≠ l := fun h ↦ hi (h ▸ hl)
      apply blockSubst_injective i
      rw [blockSubst_relabel_comm hil, hG, hF l (mem_insert_of_mem hl)]
    obtain ⟨H, hH⟩ := ih hsymm
    exact ⟨H, by rw [blocksSubst_insert hi, AlgHom.comp_apply, hH, hG]⟩

/-- Substitute the elementary symmetric polynomials in every block simultaneously. -/
noncomputable def esymmBlocks : MvPolynomial (ι × Fin d) R →ₐ[R] MvPolynomial (ι × Fin d) R :=
  aeval fun a ↦ blockESymm a.1 (a.2.val + 1)

private theorem blocksSubst_univ [Fintype ι] [DecidableEq ι] :
    blocksSubst (R := R) (d := d) (univ : Finset ι) = esymmBlocks := by
  ext a; simp [blocksSubst, esymmBlocks]

theorem esymmBlocks_injective [Fintype ι] : Function.Injective (esymmBlocks (ι := ι) (R := R) (d := d)) := by
  classical
  rw [← blocksSubst_univ]; exact blocksSubst_injective univ

theorem exists_esymmBlocks_eq [Fintype ι] [DecidableEq ι] {F : MvPolynomial (ι × Fin d) R}
    (hF : ∀ i : ι, ∀ p : Equiv.Perm (Fin d), rename (blockPerm i p) F = F) :
    ∃ G, esymmBlocks G = F := by
  rw [← blocksSubst_univ]; exact exists_blocksSubst_eq univ (fun i _ ↦ hF i)

end Conjectures.AsgarliGhiocaYip
