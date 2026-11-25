import Conjectures.DukesRevstackSort
import Mathlib.Algebra.BigOperators.Ring.List

/-! Inserting a new largest label gives the actual Eulerian recurrence
for the descent generating polynomial of a permutation list. -/

open Polynomial

namespace DukesRevstack

variable {R : Type*} [CommRing R]

@[simp] theorem wordDescents_nil : wordDescents [] = 0 := rfl

@[simp] theorem wordDescents_singleton (x : ℕ) : wordDescents [x] = 0 := rfl

theorem wordDescents_cons_cons (a b : ℕ) (tail : List ℕ) :
    wordDescents (a :: b :: tail) = wordDescents (b :: tail) + if b < a then 1 else 0 := by
  simp [wordDescents, List.countP_cons]

noncomputable def wordWeight (word : List ℕ) : R[X] := X ^ wordDescents word

noncomputable def insertionWeight (m : ℕ) (word : List ℕ) : R[X] :=
  ((List.permutations'Aux m word).map wordWeight).sum

private theorem insertionWeight_cons_cons (m a b : ℕ) (tail : List ℕ) (ha : a < m) (hb : b < m) :
    (insertionWeight (R := R) m (a :: b :: tail) : R[X]) =
      X ^ (if b < a then 1 else 0) * insertionWeight m (b :: tail) +
        X ^ (wordDescents (b :: tail) + 1) := by
  let delta : ℕ := if b < a then 1 else 0
  have hFirst : (wordWeight (R := R) (m :: a :: b :: tail) : R[X]) =
      X ^ delta * wordWeight (m :: b :: tail) := by
    simp only [wordWeight, wordDescents_cons_cons, ha, hb, ite_true]
    rw [← pow_add]
    congr 1
    dsimp [delta]
    omega
  have hSecond : (wordWeight (R := R) (a :: m :: b :: tail) : R[X]) =
      X ^ (wordDescents (b :: tail) + 1) := by
    simp [wordWeight, wordDescents_cons_cons, hb, show ¬ m < a by omega]
  have hRest (w : List ℕ) : (wordWeight (R := R) (a :: b :: w) : R[X]) =
      X ^ delta * wordWeight (b :: w) := by
    simp only [wordWeight, wordDescents_cons_cons a b, ← pow_add, delta]
    congr 1
    omega
  unfold insertionWeight
  simp only [List.permutations'Aux, List.map_cons, List.map_map, List.sum_cons, Function.comp_def,
    hFirst, hSecond, hRest, List.sum_map_mul_left]
  ring

theorem insertionWeight_formula (m : ℕ) (word : List ℕ) (h : ∀ x ∈ word, x < m) :
    (insertionWeight (R := R) m word : R[X]) =
      C ((wordDescents word : R) + 1) * X ^ wordDescents word +
        C ((word.length : R) - (wordDescents word : R)) * X ^ (wordDescents word + 1) := by
  induction word with
  | nil => simp [insertionWeight, wordWeight]
  | cons a rest ih =>
    have ha : a < m := h a (by simp)
    cases rest with
    | nil =>
      simp [insertionWeight, wordWeight, wordDescents_cons_cons, ha, show ¬ m < a by omega]
      ring
    | cons b tail =>
      have hb : b < m := h b (by simp)
      rw [insertionWeight_cons_cons m a b tail ha hb, ih (fun x hx => h x (List.mem_cons_of_mem _ hx))]
      by_cases hba : b < a
      · simp only [wordDescents_cons_cons a b, hba, ite_true, List.length_cons, Nat.cast_add, Nat.cast_one,
          pow_succ, map_add, map_sub, map_one]
        ring
      · simp only [wordDescents_cons_cons a b, hba, ite_false, List.length_cons, Nat.cast_add, Nat.cast_one,
          Nat.add_zero, pow_zero, pow_succ, map_add, map_sub, map_one, one_mul]
        ring

private theorem eulerianOperator_X_pow (n d : ℕ) :
    eulerianOperator n ((X : R[X]) ^ d) =
      C ((d : R) + 1) * X ^ d + C ((n : R) - (d : R)) * X ^ (d + 1) := by
  cases d with
  | zero => simp [eulerianOperator]
  | succ d =>
    rw [eulerianOperator, derivative_X_pow]
    simp [pow_succ, Nat.cast_add]
    ring

theorem insertionWeight_eq_operator (m : ℕ) (word : List ℕ) (h : ∀ x ∈ word, x < m) :
    (insertionWeight (R := R) m word : R[X]) = eulerianOperator word.length (wordWeight word) := by
  rw [insertionWeight_formula m word h, wordWeight, eulerianOperator_X_pow]

noncomputable def wordEulerian (labels : List ℕ) : R[X] := (labels.permutations.map wordWeight).sum

theorem wordEulerian_perm {a b : List ℕ} (h : a.Perm b) :
    (wordEulerian (R := R) a : R[X]) = wordEulerian b :=
  (h.permutations.map wordWeight).sum_eq

private theorem eulerianOperator_add (n : ℕ) (p q : R[X]) :
    eulerianOperator n (p + q) = eulerianOperator n p + eulerianOperator n q := by
  rw [eulerianOperator, derivative_add, eulerianOperator, eulerianOperator]
  ring

private theorem sum_insertions_eq_operator (words : List (List ℕ)) (m n : ℕ)
    (h : ∀ w ∈ words, w.length = n ∧ ∀ x ∈ w, x < m) :
    (((words.flatMap (List.permutations'Aux m)).map wordWeight).sum : R[X]) =
      eulerianOperator n ((words.map wordWeight).sum) := by
  induction words with
  | nil => simp [eulerianOperator]
  | cons word rest ih =>
    have hw := h word (by simp)
    simp only [List.flatMap_cons, List.map_append, List.sum_append, List.map_cons, List.sum_cons]
    rw [eulerianOperator_add, ← ih (fun w hw => h w (List.mem_cons_of_mem _ hw))]
    change insertionWeight m word + _ = eulerianOperator n (wordWeight word) + _
    rw [insertionWeight_eq_operator m word hw.2, hw.1]

theorem wordEulerian_range (n : ℕ) : (wordEulerian (R := R) (List.range n) : R[X]) = eulerian n := by
  induction n with
  | zero => simp [wordEulerian, wordWeight]
  | succ n ih =>
    have hRange : (List.range (n + 1)).Perm (n :: List.range n) := by
      rw [List.range_succ]
      exact List.perm_append_comm
    rw [wordEulerian_perm hRange, eulerian_succ, ← ih]
    unfold wordEulerian
    have hP (xs : List ℕ) :
        ((xs.permutations.map wordWeight).sum : R[X]) =
          (xs.permutations'.map wordWeight).sum :=
      ((List.permutations_perm_permutations' xs).map wordWeight).sum_eq
    rw [hP (n :: List.range n), hP (List.range n)]
    simp only [List.permutations']
    apply sum_insertions_eq_operator
    intro w hw
    have hp : w.Perm (List.range n) := List.mem_permutations'.mp hw
    exact ⟨by simpa using hp.length_eq, fun x hx => List.mem_range.mp (hp.mem_iff.mp hx)⟩

end DukesRevstack
