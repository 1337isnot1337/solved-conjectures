import Mathlib.Combinatorics.Enumerative.Composition
import Mathlib.Data.Finset.Powerset
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Tactic.Convert
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Tauto
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.SplitIfs

/-!
# Juhnke's conjecture

Length-refined cardinalities for Mathlib's literal positive compositions.
These lemmas supply the run-length and internal-cut counts in the source
proof of Juhnke's arbitrary-step lattice-path conjecture.
-/

namespace Juhnke

open scoped BigOperators
open Polynomial

/-- Send a positive composition to its interior boundary set. -/
def compositionCutsEquiv (n : ℕ) : Composition n ≃ Finset (Fin (n - 1)) :=
  (compositionEquiv n).trans (compositionAsSetEquiv n)

@[simp] theorem mem_compositionCutsEquiv {n : ℕ} (c : Composition n)
    (i : Fin (n - 1)) :
    i ∈ compositionCutsEquiv n c ↔
      (⟨1 + i.val, by omega⟩ : Fin (n + 1)) ∈ c.boundaries := by
  change i ∈ ({i : Fin (n - 1) |
      (⟨1 + i.val, by omega⟩ : Fin (n + 1)) ∈ c.boundaries}.toFinset) ↔ _
  simp only [Set.mem_toFinset, Set.mem_ofPred_eq]

theorem compositionCutsEquiv_symm_length {n : ℕ} (hn : 0 < n)
    (s : Finset (Fin (n - 1))) :
    ((compositionCutsEquiv n).symm s).length = s.card + 1 := by
  let e : Fin (n - 1) → Fin (n + 1) := fun i => ⟨i.val + 1, by omega⟩
  have he : Function.Injective e := by
    intro a b hab
    apply Fin.ext
    have h := congrArg Fin.val hab
    dsimp [e] at h
    omega
  have hzero : (0 : Fin (n + 1)) ∉ s.image e := by
    intro h
    obtain ⟨i, hi, heq⟩ := Finset.mem_image.mp h
    have hval := congrArg Fin.val heq
    dsimp [e] at hval
    omega
  have hlast : Fin.last n ∉ s.image e := by
    intro h
    obtain ⟨i, hi, heq⟩ := Finset.mem_image.mp h
    have hval := congrArg Fin.val heq
    dsimp [e] at hval
    have hi' := i.isLt
    omega
  let c : CompositionAsSet n := (compositionAsSetEquiv n).symm s
  have hbound : c.boundaries = insert 0 (insert (Fin.last n) (s.image e)) := by
    ext i
    change i ∈ ({i : Fin (n + 1) | i = 0 ∨ i = Fin.last n ∨
      ∃ (j : Fin (n - 1)) (_ : j ∈ s), (i : ℕ) = j + 1}.toFinset) ↔ _
    simp only [Set.mem_toFinset, Set.mem_ofPred_eq, Finset.mem_insert, Finset.mem_image]
    constructor
    · rintro (h | h | ⟨j, hj, hval⟩)
      · exact Or.inl h
      · exact Or.inr (Or.inl h)
      · exact Or.inr (Or.inr ⟨j, hj, Fin.ext hval.symm⟩)
    · rintro (h | h | ⟨j, hj, heq⟩)
      · exact Or.inl h
      · exact Or.inr (Or.inl h)
      · refine Or.inr (Or.inr ⟨j, hj, ?_⟩)
        exact (congrArg Fin.val heq).symm
  have hlength : c.length = s.card + 1 := by
    unfold CompositionAsSet.length
    rw [hbound, Finset.card_insert_of_notMem, Finset.card_insert_of_notMem hlast,
      Finset.card_image_of_injective s he]
    · omega
    · simp only [Finset.mem_insert, not_or]
      refine ⟨?_, hzero⟩
      intro h
      exact hn.ne' (congrArg Fin.val h).symm
  change c.toComposition.length = s.card + 1
  rw [CompositionAsSet.toComposition_length]
  exact hlength

theorem compositionCutsEquiv_length {n : ℕ} (hn : 0 < n) (c : Composition n) :
    c.length = ((compositionCutsEquiv n) c).card + 1 := by
  simpa using compositionCutsEquiv_symm_length hn ((compositionCutsEquiv n) c)

/-- Fixing the number of positive parts fixes the number of interior cuts. -/
def compositionLengthEquiv {n : ℕ} (hn : 0 < n) (h : ℕ) :
    {c : Composition n // c.length = h + 1} ≃
      {s : Finset (Fin (n - 1)) // s.card = h} where
  toFun c := ⟨compositionCutsEquiv n c.val, by
    have hc := compositionCutsEquiv_length hn c.val
    omega⟩
  invFun s := ⟨(compositionCutsEquiv n).symm s.val, by
    rw [compositionCutsEquiv_symm_length hn, s.property]⟩
  left_inv c := by
    apply Subtype.ext
    simp
  right_inv s := by
    apply Subtype.ext
    simp

theorem composition_length_card {n : ℕ} (hn : 0 < n) (h : ℕ) :
    Fintype.card {c : Composition n // c.length = h + 1} = (n - 1).choose h := by
  classical
  rw [Fintype.card_congr (compositionLengthEquiv hn h)]
  rw [Fintype.card_subtype]
  have heq : (Finset.univ.filter fun s : Finset (Fin (n - 1)) => s.card = h) =
      (Finset.univ : Finset (Fin (n - 1))).powersetCard h := by
    ext s
    simp
  rw [heq, Finset.card_powersetCard]
  simp

theorem sum_pow_card_finset {R : Type*} [CommSemiring R] {α : Type*} [Fintype α]
    (z : R) : (∑ s : Finset α, z ^ s.card) = (1 + z) ^ Fintype.card α := by
  classical
  simpa using (Finset.prod_one_add (s := Finset.univ) (f := fun _ : α => z)).symm

/-- The exact positive-composition generating polynomial, with a variable for each part. -/
theorem composition_generating_polynomial {R : Type*} [CommSemiring R]
    {n : ℕ} (hn : 0 < n) :
    (∑ c : Composition n, (X : R[X]) ^ c.length) = X * (1 + X) ^ (n - 1) := by
  classical
  rw [← Equiv.sum_comp (compositionCutsEquiv n).symm]
  simp_rw [compositionCutsEquiv_symm_length hn, pow_succ]
  rw [← Finset.sum_mul, sum_pow_card_finset]
  simp [mul_comm]

end Juhnke
