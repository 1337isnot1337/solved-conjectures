import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.ToLinearEquiv
import Mathlib.Logic.Function.Iterate
import Mathlib.Tactic.Push

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open scoped Classical
open Finset Matrix

variable {V : Type*} [Fintype V] [DecidableEq V]

def reachesRoot (δ : V → V) (root i : V) : Prop := ∃ n : ℕ, δ^[n] i = root

def isRootedTree (δ : V → V) (root : V) : Prop := ∀ i, reachesRoot δ root i

def functionalLaplacian (δ : V → V) (root : V) : Matrix V V ℚ :=
  fun i j => if i = root then (1 : Matrix V V ℚ) i j
    else (1 : Matrix V V ℚ) i j - if δ i = j then 1 else 0

omit [Fintype V] [DecidableEq V] in
theorem reachesRoot_step (δ : V → V) (root i : V) (hi : i ≠ root) :
    reachesRoot δ root (δ i) ↔ reachesRoot δ root i := by
  constructor
  · rintro ⟨n, hn⟩
    exact ⟨n+1, by simpa only [Function.iterate_succ_apply] using hn⟩
  · rintro ⟨n, hn⟩
    cases n with
    | zero => exact False.elim (hi hn)
    | succ n => exact ⟨n, by simpa only [Function.iterate_succ_apply] using hn⟩

theorem functionalLaplacian_det_of_tree (δ : V → V) (root : V)
    (ht : isRootedTree δ root) : (functionalLaplacian δ root).det = 1 := by
  classical
  let d : V → ℕ := fun i => Nat.find (ht i)
  have hd (i : V) : δ^[d i] i = root := Nat.find_spec (ht i)
  have hstep (i : V) (hi : i ≠ root) : d (δ i) < d i := by
    have hn : d i ≠ 0 := by
      intro hz
      have he := hd i
      rw [hz] at he
      exact hi he
    obtain ⟨n, he⟩ := Nat.exists_eq_succ_of_ne_zero hn
    have hh : δ^[n] (δ i) = root := by
      have h := hd i
      rw [he, Function.iterate_succ_apply] at h
      exact h
    have hle : d (δ i) ≤ n := Nat.find_min' (ht (δ i)) hh
    rw [he]
    exact Nat.lt_succ_of_le hle
  have hdiag (i j : V) (he : d i = d j) :
      functionalLaplacian δ root i j = (1 : Matrix V V ℚ) i j := by
    by_cases hi : i = root
    · simp [functionalLaplacian, hi]
    · have hn : δ i ≠ j := by
        intro hj
        have hs := hstep i hi
        rw [hj, he] at hs
        exact (Nat.lt_irrefl _ hs)
      simp [functionalLaplacian, hi, hn]
  let b : V → OrderDual ℕ := fun i => d i
  have htri : (functionalLaplacian δ root).BlockTriangular b := by
    intro i j hlt
    change d i < d j at hlt
    have hij : i ≠ j := by intro he; subst j; exact (Nat.lt_irrefl _ hlt)
    by_cases hi : i = root
    · subst i
      simp [functionalLaplacian, Matrix.one_apply, hij]
    · have hn : δ i ≠ j := by
        intro he
        have hs := hstep i hi
        rw [he] at hs
        exact Nat.lt_asymm hlt hs
      simp [functionalLaplacian, hi, hn, Matrix.one_apply, hij]
  rw [htri.det]
  apply Finset.prod_eq_one
  intro a _
  have he : (functionalLaplacian δ root).toSquareBlock b a = 1 := by
    ext i j
    change functionalLaplacian δ root i.val j.val = (1 : Matrix _ _ ℚ) i j
    rw [hdiag i j (i.property.trans j.property.symm)]
    simp [Matrix.one_apply, Subtype.ext_iff]
  rw [he, Matrix.det_one]

theorem functionalLaplacian_det_of_not_tree (δ : V → V) (root : V)
    (ht : ¬ isRootedTree δ root) : (functionalLaplacian δ root).det = 0 := by
  classical
  let v : V → ℚ := fun i => if reachesRoot δ root i then 0 else 1
  have hv : v ≠ 0 := by
    intro he
    apply ht
    intro i
    have hz := congrFun he i
    by_contra hi
    simp [v, hi] at hz
  apply Matrix.exists_mulVec_eq_zero_iff.mp
  refine ⟨v, hv, ?_⟩
  funext i
  by_cases hi : i = root
  · subst i
    have hr : reachesRoot δ root root := ⟨0, rfl⟩
    have hrow : functionalLaplacian δ root root = (1 : Matrix V V ℚ) root := by
      funext j
      simp [functionalLaplacian]
    change dotProduct (functionalLaplacian δ root root) v = 0
    rw [hrow]
    change ((1 : Matrix V V ℚ) *ᵥ v) root = 0
    rw [Matrix.one_mulVec]
    simp [v, hr]
  · have hs : v (δ i) = v i := by simp [v, reachesRoot_step δ root i hi]
    simp [Matrix.mulVec, dotProduct, functionalLaplacian, hi, sub_mul,
      Finset.sum_sub_distrib, Matrix.one_apply, hs]

/-- The directed functional graph is a tree to the root exactly when its
rooted Laplacian determinant is one. Every other graph has determinant zero. -/
theorem functionalLaplacian_det (δ : V → V) (root : V) :
    (functionalLaplacian δ root).det = if isRootedTree δ root then 1 else 0 := by
  classical
  by_cases ht : isRootedTree δ root
  · simp [ht, functionalLaplacian_det_of_tree δ root ht]
  · simp [ht, functionalLaplacian_det_of_not_tree δ root ht]

end BernardiMorales
