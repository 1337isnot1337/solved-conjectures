import Mathlib.Combinatorics.Enumerative.Composition
import Mathlib.Data.Finset.Powerset
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise

/-!
# Juhnke's conjecture

Literal arbitrary-step east/north paths and their expanded unit words.
A composition records the positive lengths of the successive steps; a Boolean
records each step's direction (`true` is east). No diagonal or compatibility
restriction is imposed. This is the path family in Conjecture 6 of Martina
Juhnke's Problem 9, Oberwolfach Report 2/2026, pp. 149–150.
-/

namespace Juhnke

open scoped BigOperators

/-- The left unit edge adjacent to an interior cut. -/
def leftUnit {N : ℕ} (i : Fin (N - 1)) : Fin N := ⟨i, by omega⟩

/-- The right unit edge adjacent to an interior cut. -/
def rightUnit {N : ℕ} (i : Fin (N - 1)) : Fin N := ⟨i + 1, by omega⟩

/-- Number of east unit edges in a word. -/
def eastCount {N : ℕ} (w : Fin N → Bool) : ℕ :=
  ∑ i, if w i then 1 else 0

/-- Interior positions where the direction changes; these cuts are mandatory. -/
def changes {N : ℕ} (w : Fin N → Bool) : Finset (Fin (N - 1)) :=
  Finset.univ.filter fun i ↦ w (leftUnit i) ≠ w (rightUnit i)

/-- Number of maximal direction runs, including the empty word convention. -/
def runCount {N : ℕ} (w : Fin N → Bool) : ℕ :=
  if N = 0 then 0 else (changes w).card + 1

@[simp] theorem mem_changes {N : ℕ} (w : Fin N → Bool) (i : Fin (N - 1)) :
    i ∈ changes w ↔ w (leftUnit i) ≠ w (rightUnit i) := by
  simp [changes]

theorem runCount_of_pos {N : ℕ} (hN : 0 < N) (w : Fin N → Bool) :
    runCount w = (changes w).card + 1 := by
  simp [runCount, Nat.ne_of_gt hN]

theorem runCount_le {N : ℕ} (w : Fin N → Bool) : runCount w ≤ N := by
  by_cases hN : N = 0
  · simp [runCount, hN]
  · rw [runCount_of_pos (Nat.pos_of_ne_zero hN)]
    have h := Finset.card_le_univ (changes w)
    simp only [Fintype.card_fin] at h
    omega

theorem runCount_pos {N : ℕ} (hN : 0 < N) (w : Fin N → Bool) : 0 < runCount w := by
  rw [runCount_of_pos hN]
  omega

theorem eastCount_le {N : ℕ} (w : Fin N → Bool) : eastCount w ≤ N := by
  calc
    eastCount w ≤ ∑ _i : Fin N, 1 := by
      apply Finset.sum_le_sum
      intro i _
      split <;> omega
    _ = N := by simp

/-- A finite sequence of positive integer step lengths, with one E/N label per step. -/
abbrev LiteralPath (N : ℕ) := Σ c : Composition N, Fin c.length → Bool

instance (N : ℕ) : Fintype (LiteralPath N) :=
  inferInstanceAs (Fintype (Σ c : Composition N, Fin c.length → Bool))

abbrev LiteralPath.stepCount {N : ℕ} (p : LiteralPath N) : ℕ := p.1.length

/-- Expand each long step into unit edges. -/
def LiteralPath.word {N : ℕ} (p : LiteralPath N) : Fin N → Bool :=
  fun i ↦ p.2 (p.1.index i)

/-- The east coordinate of the endpoint. -/
def LiteralPath.east {N : ℕ} (p : LiteralPath N) : ℕ :=
  ∑ i, if p.2 i then p.1.blocksFun i else 0

/-- The north coordinate of the endpoint. -/
def LiteralPath.north {N : ℕ} (p : LiteralPath N) : ℕ :=
  ∑ i, if p.2 i then 0 else p.1.blocksFun i

theorem LiteralPath.east_add_north {N : ℕ} (p : LiteralPath N) :
    p.east + p.north = N := by
  unfold east north
  rw [← Finset.sum_add_distrib]
  calc
    ∑ i, ((if p.2 i then p.1.blocksFun i else 0) +
      if p.2 i then 0 else p.1.blocksFun i) = ∑ i, p.1.blocksFun i := by
        apply Finset.sum_congr rfl
        intro i _
        cases p.2 i <;> simp
    _ = N := p.1.sum_blocksFun

theorem LiteralPath.east_eq_word_eastCount {N : ℕ} (p : LiteralPath N) :
    p.east = eastCount p.word := by
  unfold eastCount
  rw [← p.1.sum_sum_apply_embedding]
  unfold east word
  apply Finset.sum_congr rfl
  intro i _
  simp only [Composition.index_embedding]
  cases p.2 i <;> simp

/-- Paths from `(0,0)` to `(a,b)`, with arbitrary positive E/N step lengths. -/
abbrev PathsTo (a b : ℕ) := {p : LiteralPath (a + b) // p.east = a}

noncomputable instance (a b : ℕ) : Fintype (PathsTo a b) := by
  classical
  unfold PathsTo
  infer_instance

theorem PathsTo.north_eq {a b : ℕ} (p : PathsTo a b) : p.val.north = b := by
  have h := p.val.east_add_north
  rw [p.property] at h
  omega

/-- A direct list of the ordered direction/length steps represented by a literal path. -/
def LiteralPath.steps {N : ℕ} (p : LiteralPath N) : List (Bool × ℕ) :=
  List.ofFn fun i ↦ (p.2 i, p.1.blocksFun i)

theorem LiteralPath.steps_length {N : ℕ} (p : LiteralPath N) :
    p.steps.length = p.stepCount := by
  simp [steps, stepCount]

theorem LiteralPath.steps_positive {N : ℕ} (p : LiteralPath N)
    (s : Bool × ℕ) (hs : s ∈ p.steps) : 0 < s.2 := by
  obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hs
  exact p.1.one_le_blocksFun i

theorem LiteralPath.steps_total {N : ℕ} (p : LiteralPath N) :
    (p.steps.map Prod.snd).sum = N := by
  simp [steps, List.map_ofFn, Function.comp_def, Composition.ofFn_blocksFun]

end Juhnke
