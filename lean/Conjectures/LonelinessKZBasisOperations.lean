import Conjectures.LonelinessKZBasisInteger
import Mathlib.LinearAlgebra.Transvection.Basic

/-! Integer elementary basis changes and their effect on prefix Gram
determinants. An adjacent shear followed by a swap preserves all prefix
determinants except the prefix ending between the two changed vectors. -/

namespace Loneliness.KZBasis

noncomputable section

section BasisOperations

variable {ι M : Type*} [DecidableEq ι] [AddCommGroup M]

def shearBasis (B : Module.Basis ι ℤ M) (i j : ι) (hij : i ≠ j) (c : ℤ) :
    Module.Basis ι ℤ M :=
  B.map (LinearEquiv.transvection (f := B.coord j) (v := c • B i) (by
    simp [Module.Basis.coord_apply, hij, Ne.symm hij]))

theorem shearBasis_apply (B : Module.Basis ι ℤ M) (i j : ι) (hij : i ≠ j)
    (c : ℤ) (k : ι) :
    shearBasis B i j hij c k = if k = j then B j + c • B i else B k := by
  simp only [shearBasis, Module.Basis.map_apply, LinearEquiv.transvection.apply]
  by_cases hk : k = j
  · subst k
    simp [Module.Basis.coord_apply]
  · simp [Module.Basis.coord_apply, hk, Ne.symm hk]

def adjacentBasis (B : Module.Basis ι ℤ M) (i j : ι) (hij : i ≠ j) (c : ℤ) :
    Module.Basis ι ℤ M :=
  (shearBasis B i j hij c).reindex (Equiv.swap i j)

@[simp]
theorem adjacentBasis_apply_left (B : Module.Basis ι ℤ M) (i j : ι) (hij : i ≠ j)
    (c : ℤ) : adjacentBasis B i j hij c i = B j + c • B i := by
  simp [adjacentBasis, Module.Basis.reindex_apply, shearBasis_apply, hij, Ne.symm hij]

@[simp]
theorem adjacentBasis_apply_right (B : Module.Basis ι ℤ M) (i j : ι) (hij : i ≠ j)
    (c : ℤ) : adjacentBasis B i j hij c j = B i := by
  simp [adjacentBasis, Module.Basis.reindex_apply, shearBasis_apply, hij, Ne.symm hij]

theorem adjacentBasis_apply_other (B : Module.Basis ι ℤ M) (i j : ι) (hij : i ≠ j)
    (c : ℤ) (k : ι) (hki : k ≠ i) (hkj : k ≠ j) :
    adjacentBasis B i j hij c k = B k := by
  simp [adjacentBasis, Module.Basis.reindex_apply, shearBasis_apply,
    Equiv.swap_apply_def, hki, hkj, Ne.symm hki, Ne.symm hkj]

end BasisOperations

section GramRestriction

variable {ι κ : Type*} [DecidableEq ι] [Fintype κ] [DecidableEq κ] {N : ℕ}

theorem adjacent_real_restrict
    (B : Module.Basis ι ℤ (Fin N → ℤ)) (e : κ → ι) (he : Function.Injective e)
    (i j : κ) (hij : i ≠ j) (c : ℤ) :
    (fun k => realVector (adjacentBasis B (e i) (e j) (he.ne hij) c (e k))) =
      (Function.update (fun k => realVector (B (e k))) j
        (realVector (B (e j)) + (c : ℝ) • realVector (B (e i)))) ∘ Equiv.swap i j := by
  funext k
  by_cases hki : k = i
  · subst k
    simp only [Function.comp_apply, Equiv.swap_apply_left, Function.update_self,
      adjacentBasis_apply_left, realVector_add, realVector_zsmul]
  by_cases hkj : k = j
  · subst k
    simp [Function.comp_apply, hij]
  have hei : e k ≠ e i := fun h => hki (he h)
  have hej : e k ≠ e j := fun h => hkj (he h)
  rw [adjacentBasis_apply_other B (e i) (e j) (he.ne hij) c (e k) hei hej]
  simp [Function.comp_apply, Equiv.swap_apply_def, hki, hkj, Ne.symm hki, Ne.symm hkj]

theorem gram_det_adjacent_restrict
    (B : Module.Basis ι ℤ (Fin N → ℤ)) (e : κ → ι) (he : Function.Injective e)
    (i j : κ) (hij : i ≠ j) (c : ℤ) :
    (Matrix.gram ℝ (fun k =>
      realVector (adjacentBasis B (e i) (e j) (he.ne hij) c (e k)))).det =
      (Matrix.gram ℝ (fun k => realVector (B (e k)))).det := by
  rw [adjacent_real_restrict B e he i j hij c, gram_det_reindex,
    gram_det_add_smul (fun k => realVector (B (e k))) i j hij (c : ℝ)]

end GramRestriction

variable {N : ℕ}

def adjacentStep (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) : Module.Basis (Fin N) ℤ (Fin N → ℤ) :=
  adjacentBasis B ⟨i, by omega⟩ ⟨i + 1, hi⟩ (by
    intro h
    have hval : i = i + 1 := congrArg (fun x : Fin N => x.val) h
    omega) c

theorem adjacentStep_apply_before (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) (k : Fin N) (hk : k.val < i) :
    adjacentStep B i hi c k = B k := by
  apply adjacentBasis_apply_other
  · intro h
    have hval : k.val = i := congrArg (fun x : Fin N => x.val) h
    omega
  · intro h
    have hval : k.val = i + 1 := congrArg (fun x : Fin N => x.val) h
    omega

theorem realFamily_adjacentStep_left (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) :
    realFamily (adjacentStep B i hi c) i =
      realFamily B (i + 1) + (c : ℝ) • realFamily B i := by
  have hi' : i < N := by omega
  simp only [realFamily, integerFamily, dite_eq_left hi, dite_eq_left hi',
    adjacentStep, adjacentBasis_apply_left, realVector_add, realVector_zsmul]

theorem realFamily_adjacentStep_right (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) :
    realFamily (adjacentStep B i hi c) (i + 1) = realFamily B i := by
  have hi' : i < N := by omega
  simp [realFamily, integerFamily, hi, hi', adjacentStep]

theorem realFamily_adjacentStep_other (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) (k : ℕ) (hki : k ≠ i) (hkj : k ≠ i + 1) :
    realFamily (adjacentStep B i hi c) k = realFamily B k := by
  by_cases hk : k < N
  · have hi' : i < N := by omega
    have hki' : (⟨k, hk⟩ : Fin N) ≠ ⟨i, hi'⟩ := fun h => hki (congrArg Fin.val h)
    have hkj' : (⟨k, hk⟩ : Fin N) ≠ ⟨i + 1, hi⟩ := fun h => hkj (congrArg Fin.val h)
    simp only [realFamily, integerFamily, dite_eq_left hk, adjacentStep]
    rw [adjacentBasis_apply_other B ⟨i, hi'⟩ ⟨i + 1, hi⟩ _ c ⟨k, hk⟩ hki' hkj']
  · simp [realFamily, integerFamily, hk]

theorem prefixDet_adjacentStep_short (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) (r : ℕ) (hr : r ≤ i) :
    prefixDet (adjacentStep B i hi c) r = prefixDet B r := by
  have hf : (fun k : Fin r => realFamily (adjacentStep B i hi c) k.val) =
      fun k : Fin r => realFamily B k.val := by
    funext k
    exact realFamily_adjacentStep_other B i hi c k.val (by omega) (by omega)
  have h : (prefixDet (adjacentStep B i hi c) r : ℝ) = (prefixDet B r : ℝ) := by
    rw [prefixDet_cast, prefixDet_cast, hf]
  exact_mod_cast h

theorem prefixDet_adjacentStep_long (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) (r : ℕ) (hr : r ≤ N) (hir : i + 1 < r) :
    prefixDet (adjacentStep B i hi c) r = prefixDet B r := by
  let e : Fin r → Fin N := Fin.castLE hr
  have he : Function.Injective e := by
    intro a b h
    apply Fin.ext
    exact congrArg (fun x : Fin N => x.val) h
  let a : Fin r := ⟨i, by omega⟩
  let b : Fin r := ⟨i + 1, hir⟩
  have hab : a ≠ b := by
    intro h
    have := congrArg Fin.val h
    dsimp [a, b] at this
    omega
  have hgram := gram_det_adjacent_restrict B e he a b hab c
  have hleft : (fun k : Fin r => realFamily (adjacentStep B i hi c) k.val) =
      fun k => realVector (adjacentStep B i hi c (e k)) := by
    funext k
    exact realFamily_apply (adjacentStep B i hi c) (e k)
  have hright : (fun k : Fin r => realFamily B k.val) =
      fun k => realVector (B (e k)) := by
    funext k
    exact realFamily_apply B (e k)
  have h : (prefixDet (adjacentStep B i hi c) r : ℝ) = (prefixDet B r : ℝ) := by
    rw [prefixDet_cast, prefixDet_cast, hleft, hright]
    simpa only [adjacentStep, e, a, b, Fin.castLE_mk] using hgram
  exact_mod_cast h

theorem prefixDet_adjacentStep_unchanged (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ)
    (hi : i + 1 < N) (c : ℤ) (r : ℕ) (hr : r ≤ N) (hne : r ≠ i + 1) :
    prefixDet (adjacentStep B i hi c) r = prefixDet B r := by
  by_cases hshort : r ≤ i
  · exact prefixDet_adjacentStep_short B i hi c r hshort
  · exact prefixDet_adjacentStep_long B i hi c r hr (by omega)

end

end Loneliness.KZBasis
