import Mathlib.Combinatorics.Enumerative.Partition.Basic
import Mathlib.Data.Multiset.Filter
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Recovery of the width partitions from the multiset of rectangular block
types, after unit squares fill the unused area. Block types use their smaller
side first, so rotations represent the same type. -/

namespace RectanglePartitions

abbrev BlockType := ℕ × ℕ

def canonicalBlock (a b : ℕ) : BlockType := (min a b,max a b)

theorem canonicalBlock_of_le {a b : ℕ} (hab : a ≤ b) : canonicalBlock a b = (a,b) := by
  simp only [canonicalBlock,min_eq_left hab,max_eq_right hab]

def tagWidths (a : ℕ) (parts : Multiset ℕ) : Multiset BlockType := parts.map (fun b => (a,b))

def recoverWidths (a : ℕ) : Multiset BlockType →+ Multiset ℕ where
  toFun s := (s.filter (fun p => p.1=a)).map Prod.snd
  map_zero' := by simp
  map_add' s t := by simp only [Multiset.filter_add,Multiset.map_add]

theorem recover_tagWidths (a b : ℕ) (parts : Multiset ℕ) :
    recoverWidths a (tagWidths b parts) = if b=a then parts else 0 := by
  change ((parts.map (fun c => (b,c))).filter (fun p => p.1=a)).map Prod.snd = _
  by_cases h : b=a
  · subst b
    simp [Multiset.filter_map,Function.comp_def]
  · simp [Multiset.filter_map,Function.comp_def,h]

theorem recover_units (a n : ℕ) (ha : 1 < a) :
    recoverWidths a (Multiset.replicate n (1,1)) = 0 := by
  have hh := recover_tagWidths a 1 (Multiset.replicate n 1)
  simpa only [tagWidths,Multiset.map_replicate,if_neg (ne_of_lt ha)] using hh

def familyBlocks (I : Finset ℕ) (parts : I → Multiset ℕ) : Multiset BlockType :=
  ∑ a : I, tagWidths a.val (parts a)

def filledFamily (I : Finset ℕ) (parts : I → Multiset ℕ) (units : ℕ) : Multiset BlockType :=
  familyBlocks I parts + Multiset.replicate units (1,1)

theorem recover_familyBlocks (I : Finset ℕ) (parts : I → Multiset ℕ) (a : I) :
    recoverWidths a.val (familyBlocks I parts) = parts a := by
  unfold familyBlocks
  rw [map_sum]
  simp only [recover_tagWidths,Subtype.val_inj]
  simp

theorem recover_filledFamily (I : Finset ℕ) (parts : I → Multiset ℕ) (units : ℕ)
    (ha : ∀ a ∈ I, 1 < a) (a : I) :
    recoverWidths a.val (filledFamily I parts units) = parts a := by
  rw [filledFamily,map_add,recover_familyBlocks,recover_units _ _ (ha a.val a.property),add_zero]

/-- The number of unit squares may depend on the input family. It cannot
hide or merge any of the width partitions whose heights are at least two. -/
theorem filledFamily_injective (I : Finset ℕ) (ha : ∀ a ∈ I, 1 < a)
    (units : (I → Multiset ℕ) → ℕ) :
    Function.Injective (fun parts => filledFamily I parts (units parts)) := by
  intro parts μ he
  funext a
  have hh := congrArg (recoverWidths a.val) he
  simpa only [recover_filledFamily I _ _ ha] using hh

theorem tagWidths_canonical (a : ℕ) (parts : Multiset ℕ) (hparts : ∀ b ∈ parts, a ≤ b) :
    parts.map (fun b => canonicalBlock a b) = tagWidths a parts := by
  apply Multiset.map_congr rfl
  intro b hb
  exact canonicalBlock_of_le (hparts b hb)

end RectanglePartitions
