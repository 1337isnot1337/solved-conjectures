module

public import Conjectures.GesselZhuangBlockOperations
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Data.List.Range

/-!
# Gessel–Zhuang conjecture

Inverse descents of literal permutation words. The statistic compares
the actual positions of consecutive values. Inserting a new maximum
preserves every old comparison and adds precisely its comparison with
the previous maximum.
-/

@[expose] public section

namespace GesselZhuang

open Finset

/-- Number of `k` for which the value `k+1` occurs before `k` in the word.
For a permutation of `range n`, these are exactly its inverse descents. -/
def wordInverseDescents (w : List ℕ) : ℕ :=
  ∑ k ∈ range (w.length - 1), if w.idxOf (k + 1) < w.idxOf k then 1 else 0

theorem idxOf_insert_lt_iff {L R : List ℕ} {x a b : ℕ}
    (hxa : x ≠ a) (hxb : x ≠ b) :
    (L ++ x :: R).idxOf a < (L ++ x :: R).idxOf b ↔
      (L ++ R).idxOf a < (L ++ R).idxOf b := by
  induction L with
  | nil => simp [hxa, hxb]
  | cons y L ih =>
    by_cases hya : y = a
    · subst y
      by_cases hab : a = b
      · subst b; simp
      · simp [hab]
    · by_cases hyb : y = b
      · subst y; simp [hya]
      · simpa [List.idxOf_cons, hya, hyb] using ih

theorem idxOf_insert_max_lt_iff {L R : List ℕ} {x b : ℕ}
    (hx : x ∉ L) (hxb : x ≠ b) :
    (L ++ x :: R).idxOf x < (L ++ x :: R).idxOf b ↔ b ∉ L := by
  induction L with
  | nil => simp [hxb]
  | cons y L ih =>
    have hyx : y ≠ x := by intro h; subst y; exact hx (by simp)
    have hxL : x ∉ L := fun h => hx (by simp [h])
    by_cases hyb : y = b
    · subst y; simp [hyx]
    · simpa [List.idxOf_cons, hyx, hyb, Ne.symm hyb] using ih hxL

theorem wordInverseDescents_insert_max {L R : List ℕ} {x : ℕ}
    (hx : 0 < x) (hlen : (L ++ R).length = x)
    (hbound : ∀ y ∈ L ++ R, y < x) :
    wordInverseDescents (L ++ x :: R) = wordInverseDescents (L ++ R) +
      if x - 1 ∉ L then 1 else 0 := by
  have hxL : x ∉ L := by
    intro h
    have := hbound x (List.mem_append_left R h)
    omega
  have hlen' : (L ++ x :: R).length = x + 1 := by
    simp only [List.length_append, List.length_cons] at hlen ⊢
    omega
  unfold wordInverseDescents
  rw [hlen', hlen]
  simp only [Nat.add_sub_cancel]
  conv_lhs => arg 1; rw [show x = (x - 1) + 1 by omega]
  rw [sum_range_succ]
  congr 1
  · apply sum_congr rfl
    intro k hk
    have hk' := mem_range.mp hk
    simp only [idxOf_insert_lt_iff (by omega : x ≠ k + 1) (by omega : x ≠ k)]
  · rw [show x - 1 + 1 = x by omega]
    simp only [idxOf_insert_max_lt_iff hxL (by omega : x ≠ x - 1)]

theorem length_le_blockIndex_append_iff (A C : Blocks) (y : ℕ) :
    A.length ≤ blockIndex y (A ++ C) ↔ y ∉ A.flatten := by
  induction A with
  | nil => simp
  | cons a A ih =>
    by_cases hy : y ∈ a
    · simp [blockIndex, hy]
    · simpa [blockIndex, hy] using ih

theorem length_lt_blockIndex_append_iff (A C : Blocks) (b : List ℕ) (y : ℕ) :
    A.length < blockIndex y (A ++ b :: C) ↔ y ∉ (A ++ [b]).flatten := by
  simpa [List.append_assoc, Nat.add_one_le_iff] using
    length_le_blockIndex_append_iff (A ++ [b]) C y

theorem wordInverseDescents_up {B : Blocks} {i x : ℕ}
    (hi : i ≤ B.length) (hx : 0 < x)
    (hlen : B.flatten.length = x) (hbound : ∀ y ∈ B.flatten, y < x) :
    wordInverseDescents (upBlocks B i x).flatten = wordInverseDescents B.flatten +
      if i ≤ blockIndex (x - 1) B then 1 else 0 := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  simp only [length_le_blockIndex_append_iff]
  simpa [upBlocks_append] using
    wordInverseDescents_insert_max (L := A.flatten) (R := C.flatten) hx
      (by simpa using hlen) (by simpa using hbound)

theorem wordInverseDescents_flat {B : Blocks} {i x : ℕ}
    (hi : i < B.length) (hx : 0 < x) (e : Bool)
    (hlen : B.flatten.length = x) (hbound : ∀ y ∈ B.flatten, y < x) :
    wordInverseDescents (flatBlocks B i x e).flatten = wordInverseDescents B.flatten +
      if e then (if i ≤ blockIndex (x - 1) B then 1 else 0)
      else (if i < blockIndex (x - 1) B then 1 else 0) := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  rw [flatBlocks_append]
  cases e
  · simp only [Bool.false_eq_true, ite_false, length_lt_blockIndex_append_iff]
    simpa [List.flatten_append, List.append_assoc]
      using wordInverseDescents_insert_max (L := A.flatten ++ b) (R := C.flatten) hx
        (by simpa [List.append_assoc] using hlen)
        (by simpa [List.append_assoc] using hbound)
  · simp only [ite_true, length_le_blockIndex_append_iff]
    simpa [List.flatten_append, List.append_assoc]
      using wordInverseDescents_insert_max (L := A.flatten) (R := b ++ C.flatten) hx
        (by simpa using hlen) (by simpa using hbound)

theorem wordInverseDescents_down {B : Blocks} {i x : ℕ}
    (hi : i + 1 < B.length) (hx : 0 < x)
    (hlen : B.flatten.length = x) (hbound : ∀ y ∈ B.flatten, y < x) :
    wordInverseDescents (downBlocks B i x).flatten = wordInverseDescents B.flatten +
      if i < blockIndex (x - 1) B then 1 else 0 := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  simp only [length_lt_blockIndex_append_iff]
  simpa [downBlocks_append, List.append_assoc]
    using wordInverseDescents_insert_max (L := A.flatten ++ b) (R := c ++ C.flatten) hx
      (by simpa [List.append_assoc] using hlen)
      (by simpa [List.append_assoc] using hbound)

end GesselZhuang
