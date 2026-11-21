module

public import Mathlib.GroupTheory.Perm.Fin
public import Mathlib.Order.Fin.Basic
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
public import Mathlib.Algebra.Polynomial.Basic
public import Mathlib.Algebra.Ring.Parity
public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring

/-!
# Literal signed permutations for Chow's conjecture

A signed permutation consists of a permutation of the absolute values and
one Boolean sign at each position. `true` means negative. The integer window
and the type-D descent statistic below are the source definitions.

Appending a last letter inserts its absolute value into the ordered alphabet.
The ordered insertion preserves comparisons and the sign of the sum of the
first two entries; this is the combinatorial basis of the refined recurrence.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

abbrev SignedLetter (n : ℕ) := Fin n × Bool

abbrev SignedPermutation (n : ℕ) := Equiv.Perm (Fin n) × (Fin n → Bool)

/-- The actual nonzero signed integer represented by an absolute value and sign. -/
def letterValue {n : ℕ} (a : SignedLetter n) : ℤ :=
  if a.2 then -((a.1.val : ℤ) + 1) else (a.1.val : ℤ) + 1

def negLetter {n : ℕ} (a : SignedLetter n) : SignedLetter n := (a.1, !a.2)

@[simp] theorem letterValue_negLetter {n : ℕ} (a : SignedLetter n) :
    letterValue (negLetter a) = -letterValue a := by
  rcases a with ⟨a, b⟩
  cases b <;> simp [letterValue, negLetter]

theorem letterValue_ne_zero {n : ℕ} (a : SignedLetter n) : letterValue a ≠ 0 := by
  rcases a with ⟨a, b⟩
  cases b <;> simp [letterValue] <;> omega

@[simp] theorem letterValue_neg_iff {n : ℕ} (a : SignedLetter n) :
    letterValue a < 0 ↔ a.2 = true := by
  rcases a with ⟨a, b⟩
  cases b <;> simp [letterValue] <;> omega

@[simp] theorem letterValue_natAbs {n : ℕ} (a : SignedLetter n) :
    (letterValue a).natAbs = a.1.val + 1 := by
  rcases a with ⟨a, b⟩
  have hcast : (a.val : ℤ) + 1 = ((a.val + 1 : ℕ) : ℤ) := by omega
  cases b <;> simp only [letterValue, Bool.false_eq_true, ite_false, ite_true,
    hcast, Int.natAbs_neg, Int.natAbs_natCast]

def entry {n : ℕ} (σ : SignedPermutation n) (i : Fin n) : ℤ :=
  letterValue (σ.1 i, σ.2 i)

/-- Every absolute value `1,...,n` occurs exactly once in the integer window. -/
theorem entry_natAbs {n : ℕ} (σ : SignedPermutation n) (i : Fin n) :
    (entry σ i).natAbs = (σ.1 i).val + 1 := letterValue_natAbs _

theorem entry_natAbs_injective {n : ℕ} (σ : SignedPermutation n) :
    Function.Injective (fun i => (entry σ i).natAbs) := by
  intro i j h
  simp only [entry_natAbs, Nat.add_right_cancel_iff] at h
  exact σ.1.injective (Fin.ext h)

/-- The source statistic at rank `r+2`, with no recurrence in its definition. -/
def desD (r : ℕ) (σ : SignedPermutation (r + 2)) : ℕ :=
  (if entry σ 0 + entry σ 1 < 0 then 1 else 0) +
    ∑ i : Fin (r + 1), if entry σ i.castSucc > entry σ i.succ then 1 else 0

def negativeCount {n : ℕ} (σ : SignedPermutation n) : ℕ :=
  (Finset.univ.filter (fun i => σ.2 i = true)).card

theorem negativeCount_eq_window {n : ℕ} (σ : SignedPermutation n) :
    negativeCount σ = (Finset.univ.filter (fun i => entry σ i < 0)).card := by
  simp [negativeCount, entry]

noncomputable def allSignedEulerian (r : ℕ) : ℝ[X] :=
  ∑ σ : SignedPermutation (r + 2), X ^ desD r σ

/-- The ordinary type-D Eulerian polynomial, at actual rank `r+2`. -/
noncomputable def typeDEulerian (r : ℕ) : ℝ[X] :=
  ∑ σ : SignedPermutation (r + 2), if Even (negativeCount σ) then X ^ desD r σ else 0

/-- Index of a signed letter in the descending order `n,...,1,-1,...,-n`. -/
def letterIndex {n : ℕ} (a : SignedLetter n) : Fin (2 * n) :=
  if a.2 then ⟨n + a.1.val, by have := a.1.isLt; omega⟩
  else ⟨n - 1 - a.1.val, by have := a.1.isLt; omega⟩

def indexLetter (n : ℕ) (i : Fin (2 * n)) : SignedLetter n :=
  if h : i.val < n then (⟨n - 1 - i.val, by omega⟩, false)
  else (⟨i.val - n, by have := i.isLt; omega⟩, true)

theorem indexLetter_letterIndex {n : ℕ} (a : SignedLetter n) :
    indexLetter n (letterIndex a) = a := by
  rcases a with ⟨a, b⟩
  have ha := a.isLt
  cases b
  · have h : n - 1 - a.val < n := by omega
    simp only [letterIndex, Bool.false_eq_true, ite_false, indexLetter, h, dite_true]
    congr 1
    apply Fin.ext
    change n - 1 - (n - 1 - a.val) = a.val
    omega
  · have h : ¬ n + a.val < n := by omega
    simp [letterIndex, indexLetter, h]

theorem letterIndex_indexLetter (n : ℕ) (i : Fin (2 * n)) :
    letterIndex (indexLetter n i) = i := by
  have hi := i.isLt
  by_cases h : i.val < n
  · apply Fin.ext
    simp [indexLetter, h, letterIndex]
    omega
  · apply Fin.ext
    simp [indexLetter, h, letterIndex]
    omega

def letterIndexEquiv (n : ℕ) : SignedLetter n ≃ Fin (2 * n) where
  toFun := letterIndex
  invFun := indexLetter n
  left_inv := indexLetter_letterIndex
  right_inv := letterIndex_indexLetter n

def lastIndex {n : ℕ} (σ : SignedPermutation (n + 1)) : Fin (2 * (n + 1)) :=
  letterIndex (σ.1 (Fin.last n), σ.2 (Fin.last n))

noncomputable def literalRefinedRow (r : ℕ) (i : Fin (2 * (r + 2))) : ℝ[X] :=
  ∑ σ : SignedPermutation (r + 2), if lastIndex σ = i then X ^ desD r σ else 0

theorem sum_literalRefinedRow (r : ℕ) :
    (∑ i, literalRefinedRow r i) = allSignedEulerian r := by
  unfold literalRefinedRow allSignedEulerian
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro σ _
  simp

/-- Ordered insertion of a new absolute value; signs are unchanged. -/
def liftLetter {n : ℕ} (a : Fin (n + 1)) (x : SignedLetter n) : SignedLetter (n + 1) :=
  (a.succAbove x.1, x.2)

theorem letterValue_lift_lt_iff {n : ℕ} (a : Fin (n + 1)) (x y : SignedLetter n) :
    letterValue (liftLetter a x) < letterValue (liftLetter a y) ↔
      letterValue x < letterValue y := by
  rcases x with ⟨x, b⟩
  rcases y with ⟨y, c⟩
  have hxy : (a.succAbove x).val < (a.succAbove y).val ↔ x.val < y.val :=
    Fin.succAbove_lt_succAbove_iff
  have hyx : (a.succAbove y).val < (a.succAbove x).val ↔ y.val < x.val :=
    Fin.succAbove_lt_succAbove_iff
  cases b <;> cases c <;> simp only [letterValue, liftLetter,
    Bool.false_eq_true, ite_false, ite_true] <;> omega

theorem letterValue_lift_sum_neg_iff {n : ℕ} (a : Fin (n + 1)) (x y : SignedLetter n) :
    letterValue (liftLetter a x) + letterValue (liftLetter a y) < 0 ↔
      letterValue x + letterValue y < 0 := by
  have h := letterValue_lift_lt_iff a x (negLetter y)
  have heq : liftLetter a (negLetter y) = negLetter (liftLetter a y) := rfl
  rw [heq, letterValue_negLetter, letterValue_negLetter] at h
  omega

/-- Append a final absolute value, inserting its missing place in the ordered alphabet. -/
def appendPermutation {n : ℕ} (a : Fin (n + 1)) (σ : Equiv.Perm (Fin n)) :
    Equiv.Perm (Fin (n + 1)) :=
  (finSuccEquiv' (Fin.last n)).trans
    ((Equiv.optionCongr σ).trans (finSuccEquiv' a).symm)

@[simp] theorem appendPermutation_last {n : ℕ} (a : Fin (n + 1))
    (σ : Equiv.Perm (Fin n)) : appendPermutation a σ (Fin.last n) = a := by
  simp [appendPermutation]

@[simp] theorem appendPermutation_castSucc {n : ℕ} (a : Fin (n + 1))
    (σ : Equiv.Perm (Fin n)) (j : Fin n) :
    appendPermutation a σ j.castSucc = a.succAbove (σ j) := by
  simp [appendPermutation, finSuccEquiv'_last_apply_castSucc]

def appendSigned {n : ℕ} (a : SignedLetter (n + 1)) (σ : SignedPermutation n) :
    SignedPermutation (n + 1) := (appendPermutation a.1 σ.1, Fin.snoc σ.2 a.2)

@[simp] theorem appendSigned_lastIndex {n : ℕ} (a : SignedLetter (n + 1))
    (σ : SignedPermutation n) : lastIndex (appendSigned a σ) = letterIndex a := by
  simp [lastIndex, appendSigned]

@[simp] theorem appendSigned_entry_last {n : ℕ} (a : SignedLetter (n + 1))
    (σ : SignedPermutation n) : entry (appendSigned a σ) (Fin.last n) = letterValue a := by
  simp [entry, appendSigned]

@[simp] theorem appendSigned_entry_castSucc {n : ℕ} (a : SignedLetter (n + 1))
    (σ : SignedPermutation n) (j : Fin n) :
    entry (appendSigned a σ) j.castSucc = letterValue (liftLetter a.1 (σ.1 j, σ.2 j)) := by
  simp [entry, appendSigned, liftLetter]

theorem appendSigned_injective (n : ℕ) :
    Function.Injective (fun p : SignedLetter (n + 1) × SignedPermutation n =>
      appendSigned p.1 p.2) := by
  rintro ⟨⟨a, b⟩, σ, s⟩ ⟨⟨a', b'⟩, σ', s'⟩ h
  have ha : a = a' := by
    have h' := congrArg (fun p : SignedPermutation (n + 1) => p.1 (Fin.last n)) h
    simpa [appendSigned] using h'
  have hb : b = b' := by
    have h' := congrArg (fun p : SignedPermutation (n + 1) => p.2 (Fin.last n)) h
    simpa [appendSigned] using h'
  subst a'
  subst b'
  have hσ : σ = σ' := by
    apply Equiv.ext
    intro j
    have h' := congrArg (fun p : SignedPermutation (n + 1) => p.1 j.castSucc) h
    simpa [appendSigned] using h'
  have hs : s = s' := by
    funext j
    have h' := congrArg (fun p : SignedPermutation (n + 1) => p.2 j.castSucc) h
    simpa [appendSigned] using h'
  subst σ'
  subst s'
  rfl

theorem appendSigned_bijective (n : ℕ) :
    Function.Bijective (fun p : SignedLetter (n + 1) × SignedPermutation n =>
      appendSigned p.1 p.2) := by
  rw [Nat.bijective_iff_injective_and_card]
  refine ⟨appendSigned_injective n, ?_⟩
  simp only [SignedLetter, SignedPermutation,
    Nat.card_eq_fintype_card, Fintype.card_prod, Fintype.card_perm,
    Fintype.card_fin, Fintype.card_bool,
    Fintype.card_fun, Nat.factorial_succ, pow_succ]
  ring

/-- Exact insertion/deletion of the final signed letter. -/
noncomputable def appendSignedEquiv (n : ℕ) :
    SignedLetter (n + 1) × SignedPermutation n ≃ SignedPermutation (n + 1) :=
  Equiv.ofBijective _ (appendSigned_bijective n)

end Chow
