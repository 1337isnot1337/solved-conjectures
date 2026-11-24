import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.Algebra.Group.Even
import Mathlib.Algebra.BigOperators.Group.Finset.Lemmas
import Mathlib.Data.Set.Finite.Basic

/-!
# Ulas's disjoint-block square-product conjecture

This file models the literal collections in Ulas, *On products of disjoint
blocks of consecutive integers*, Enseign. Math. 51 (2005), 331--334,
equations (1)--(2) and Conjecture 4 (p. 333). A start `a` represents
`a+1, ..., a+length`, and every start is positive.

The union and infinitude lemmas are components of the argument recorded in
`results/ulas-disjoint-square-blocks/PROOF.md`, sections 1 and 4. They do not
assert that the analytic or square-class inputs of that proof have been
formalized.
-/

open Finset

namespace UlasDisjointSquareBlocks

/-- Product of the `length` consecutive positive integers following `a`. -/
def blockProduct (length a : ℕ) : ℕ :=
  ∏ i ∈ Finset.range length, (a + i + 1)

/-- Ordered starts must leave their two blocks disjoint. -/
def Separated (length : ℕ) (s : Finset ℕ) : Prop :=
  ∀ a ∈ s, ∀ b ∈ s, a < b → a + length ≤ b

/-- A finite collection of disjoint positive-start blocks with square product. -/
def Valid (length : ℕ) (s : Finset ℕ) : Prop :=
  (∀ a ∈ s, 0 < a) ∧ Separated length s ∧
    IsSquare (∏ a ∈ s, blockProduct length a)

/-- The starts of a valid collection all lie at or above `T`. -/
def ValidAbove (length T : ℕ) (s : Finset ℕ) : Prop :=
  Valid length s ∧ ∀ a ∈ s, T ≤ a

/-- A count is realizable above the specified lower endpoint. -/
def CountAbove (length T count : ℕ) : Prop :=
  ∃ s : Finset ℕ, s.card = count ∧ ValidAbove length T s

/-- A fixed count can be realized arbitrarily far to the right. -/
def Repeatable (length count : ℕ) : Prop :=
  ∀ T, CountAbove length T count

/-- The actual set of finite collections of a specified cardinality. -/
def solutions (length count : ℕ) : Set (Finset ℕ) :=
  {s | s.card = count ∧ Valid length s}

/-- Ulas's original all-sufficiently-large-count assertion, at fixed length. -/
def EventuallyInfinite (length : ℕ) : Prop :=
  ∃ R : ℕ, ∀ count ≥ R, (solutions length count).Infinite

/-- The original conjecture, with the length fixed before the threshold. -/
def UlasConjecture : Prop :=
  ∀ length : ℕ, 5 ≤ length → EventuallyInfinite length

@[simp] theorem valid_empty (length : ℕ) : Valid length ∅ := by
  simp [Valid, Separated, IsSquare.one]

@[simp] theorem validAbove_empty (length T : ℕ) : ValidAbove length T ∅ := by
  simp [ValidAbove]

@[simp] theorem countAbove_zero (length T : ℕ) : CountAbove length T 0 :=
  ⟨∅, rfl, validAbove_empty length T⟩

@[simp] theorem repeatable_zero (length : ℕ) : Repeatable length 0 :=
  countAbove_zero length

theorem ValidAbove.mono {length T U : ℕ} {s : Finset ℕ}
    (h : ValidAbove length U s) (hTU : T ≤ U) : ValidAbove length T s :=
  ⟨h.1, fun a ha => hTU.trans (h.2 a ha)⟩

theorem CountAbove.mono {length T U count : ℕ}
    (h : CountAbove length U count) (hTU : T ≤ U) : CountAbove length T count := by
  obtain ⟨s, hs, hvalid⟩ := h
  exact ⟨s, hs, hvalid.mono hTU⟩

/-- A bound strictly beyond all blocks in `s`. -/
def after (length : ℕ) (s : Finset ℕ) : ℕ := s.sup id + length + 1

theorem endpoint_lt_after {length a : ℕ} {s : Finset ℕ} (ha : a ∈ s) :
    a + length < after length s := by
  have hle : a ≤ s.sup id := Finset.le_sup (f := id) ha
  simp only [after]
  omega

theorem disjoint_of_after {length : ℕ} {s t : Finset ℕ}
    (ht : ValidAbove length (after length s) t) : Disjoint s t := by
  apply Finset.disjoint_left.mpr
  intro a ha hat
  have hlt := endpoint_lt_after (length := length) ha
  have hge := ht.2 a hat
  omega

/-- Concatenating a square-product collection with one entirely to its right
preserves the literal disjoint-block and square-product conditions. -/
theorem valid_union_of_after {length : ℕ} {s t : Finset ℕ}
    (hs : Valid length s) (ht : ValidAbove length (after length s) t) :
    Valid length (s ∪ t) := by
  have hdis := disjoint_of_after ht
  refine ⟨?_, ?_, ?_⟩
  · intro a ha
    rcases Finset.mem_union.mp ha with ha | ha
    · exact hs.1 a ha
    · exact ht.1.1 a ha
  · intro a ha b hb hab
    rcases Finset.mem_union.mp ha with ha | ha <;>
      rcases Finset.mem_union.mp hb with hb | hb
    · exact hs.2.1 a ha b hb hab
    · exact (endpoint_lt_after (length := length) ha).le.trans (ht.2 b hb)
    · have hlt := endpoint_lt_after (length := length) hb
      have hge := ht.2 a ha
      omega
    · exact ht.1.2.1 a ha b hb hab
  · rw [Finset.prod_union hdis]
    exact hs.2.2.mul ht.1.2.2

theorem validAbove_union_of_after {length T : ℕ} {s t : Finset ℕ}
    (hs : ValidAbove length T s)
    (ht : ValidAbove length (max T (after length s)) t) :
    ValidAbove length T (s ∪ t) := by
  refine ⟨valid_union_of_after hs.1 (ht.mono (le_max_right _ _)), ?_⟩
  intro a ha
  rcases Finset.mem_union.mp ha with ha | ha
  · exact hs.2 a ha
  · exact (le_max_left _ _).trans (ht.2 a ha)

/-- Repeatable counts form an additive semigroup. The proof chooses the
second collection after the actual first collection's last endpoint. -/
theorem Repeatable.add {length a b : ℕ}
    (ha : Repeatable length a) (hb : Repeatable length b) :
    Repeatable length (a + b) := by
  intro T
  obtain ⟨s, hsc, hs⟩ := ha T
  obtain ⟨t, htc, ht⟩ := hb (max T (after length s))
  refine ⟨s ∪ t, ?_, validAbove_union_of_after hs ht⟩
  rw [Finset.card_union_of_disjoint (disjoint_of_after (ht.mono (le_max_right _ _))),
    hsc, htc]

theorem Repeatable.mul {length count : ℕ} (h : Repeatable length count) (k : ℕ) :
    Repeatable length (k * count) := by
  induction k with
  | zero => simp
  | succ k ih => simpa [Nat.succ_mul] using ih.add h

/-- Unbounded largest starts imply infinitely many distinct finite
collections. This does not assert unbounded least starts. -/
theorem infinite_solutions_of_unbounded {length count : ℕ}
    (h : ∀ T, ∃ s ∈ solutions length count, ∃ a ∈ s, T < a) :
    (solutions length count).Infinite := by
  intro hfinite
  classical
  let allStarts := hfinite.toFinset.biUnion id
  obtain ⟨s, hs, a, ha, hlarge⟩ := h (allStarts.sup id)
  have hmem : a ∈ allStarts :=
    Finset.mem_biUnion.mpr ⟨s, hfinite.mem_toFinset.mpr hs, ha⟩
  have hbound : a ≤ allStarts.sup id := Finset.le_sup (f := id) hmem
  omega

theorem Repeatable.infinite {length count : ℕ} (h : Repeatable length count)
    (hcount : 0 < count) : (solutions length count).Infinite := by
  apply infinite_solutions_of_unbounded
  intro T
  obtain ⟨s, hs, hvalid⟩ := h (T + 1)
  obtain ⟨a, ha⟩ := Finset.card_pos.mp (by omega : 0 < s.card)
  exact ⟨s, ⟨hs, hvalid.1⟩, a, ha, by have := hvalid.2 a ha; omega⟩

end UlasDisjointSquareBlocks
