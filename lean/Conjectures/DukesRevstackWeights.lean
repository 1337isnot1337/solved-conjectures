import Conjectures.DukesRevstackEulerian
import Conjectures.DukesRevstackParityLabels
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-! Increasing relabeling leaves descent weights unchanged. In a split
at the maximum, the only new descent is the edge into the right word. -/

open Polynomial
open scoped BigOperators

namespace DukesRevstack

variable {R : Type*} [CommRing R]

theorem wordDescents_map (f : ℕ → ℕ) (hF : StrictMono f) (word : List ℕ) :
    wordDescents (word.map f) = wordDescents word := by
  induction word with
  | nil => rfl
  | cons a tail ih =>
    cases tail with
    | nil => rfl
    | cons b tail =>
      simp only [List.map_cons, wordDescents_cons_cons, hF.lt_iff_lt]
      simpa only [List.map_cons] using congrArg (· + if b < a then 1 else 0) ih

theorem wordEulerian_map (f : ℕ → ℕ) (hF : StrictMono f) (labels : List ℕ) :
    (wordEulerian (R := R) (labels.map f) : R[X]) = wordEulerian labels := by
  unfold wordEulerian
  rw [← List.map_permutations, List.map_map]
  simp [Function.comp_def, wordWeight, wordDescents_map f hF]
  rfl

theorem wordEulerian_leftParity (m : ℕ) :
    (wordEulerian (R := R) (leftParityLabels m) : R[X]) = eulerian (m / 2) := by
  unfold leftParityLabels
  rw [wordEulerian_map _ (fun _ _ h => by omega), wordEulerian_range]

theorem wordEulerian_rightParity (m : ℕ) :
    (wordEulerian (R := R) (rightParityLabels m) : R[X]) = eulerian ((m + 1) / 2) := by
  unfold rightParityLabels
  rw [wordEulerian_map _ (fun _ _ h => by omega), wordEulerian_range]

theorem wordDescents_split (left right : List ℕ) (m : ℕ)
    (hLeft : ∀ x ∈ left, x < m) (hRight : ∀ x ∈ right, x < m) (hNonempty : right ≠ []) :
    wordDescents (left ++ m :: right) = wordDescents left + wordDescents right + 1 := by
  induction left with
  | nil =>
    cases right with
    | nil => contradiction
    | cons b tail =>
      have hb := hRight b (by simp)
      simp [wordDescents_cons_cons, hb]
  | cons a tail ih =>
    have ha := hLeft a (by simp)
    cases tail with
    | nil =>
      have hr := ih (by simp)
      simp only [List.singleton_append, wordDescents_cons_cons, show ¬ m < a by omega, ite_false,
        Nat.add_zero, wordDescents_singleton, Nat.zero_add]
      simpa only [List.nil_append, wordDescents_nil, Nat.zero_add] using hr
    | cons b rest =>
      have hTail := ih (fun x hx => hLeft x (List.mem_cons_of_mem _ hx))
      simp only [List.cons_append, wordDescents_cons_cons] at hTail ⊢
      omega

theorem sum_list_map_eq_finset {α S : Type*} [DecidableEq α] [AddCommMonoid S]
    (f : α → S) (words : List α) (hN : words.Nodup) :
    (words.map f).sum = ∑ word ∈ words.toFinset, f word := by
  induction words with
  | nil => simp
  | cons a tail ih =>
    obtain ⟨hNot, hTail⟩ := List.nodup_cons.mp hN
    rw [List.map_cons, List.sum_cons, List.toFinset_cons, Finset.sum_insert (by simpa)]
    rw [ih hTail]

end DukesRevstack
