import Conjectures.DukesRevstackPolynomial
import Mathlib.Data.List.Permutation

/-! Dukes's revstack map on actual permutation words. Its recursive
maximum split preserves every letter and fixes a sorted largest suffix. -/

open Polynomial

namespace DukesRevstack

variable {R : Type*} [CommRing R]

private theorem drop_after_max_lt {word : List ℕ} {m : ℕ} (h : word.max? = some m) :
    (word.drop (word.idxOf m + 1)).length < word.length := by
  have hi := List.idxOf_lt_length_of_mem (List.max?_mem h)
  simp only [List.length_drop]
  omega

private theorem take_before_max_lt {word : List ℕ} {m : ℕ} (h : word.max? = some m) :
    (word.take (word.idxOf m)).length < word.length := by
  have hi := List.idxOf_lt_length_of_mem (List.max?_mem h)
  simp only [List.length_take]
  exact (min_le_left _ _).trans_lt hi

private def revstackFuel : ℕ → List ℕ → List ℕ
  | 0, _ => []
  | fuel + 1, word =>
    match word.max? with
    | none => []
    | some m =>
      revstackFuel fuel (word.drop (word.idxOf m + 1)) ++
        revstackFuel fuel (word.take (word.idxOf m)) ++ [m]

private theorem revstackFuel_eq_of_length_le (first second : ℕ) (word : List ℕ)
    (hFirst : word.length ≤ first) (hSecond : word.length ≤ second) :
    revstackFuel first word = revstackFuel second word := by
  induction first generalizing second word with
  | zero =>
    have hnil : word = [] := List.length_eq_zero_iff.mp (by omega)
    subst word
    cases second <;> rfl
  | succ fuel ih =>
    cases second with
    | zero =>
      have hnil : word = [] := List.length_eq_zero_iff.mp (by omega)
      subst word
      rfl
    | succ other =>
      simp only [revstackFuel]
      cases hm : word.max? with
      | none => rfl
      | some m =>
        have hDrop := drop_after_max_lt hm
        have hTake := take_before_max_lt hm
        dsimp only
        rw [ih other (word.drop (word.idxOf m + 1)) (by omega) (by omega),
          ih other (word.take (word.idxOf m)) (by omega) (by omega)]

/-- Revstack sort applies the map to the right word, then the left word,
and appends the maximum. -/
def revstack (word : List ℕ) : List ℕ := revstackFuel word.length word

@[simp] theorem revstack_nil : revstack [] = [] := rfl

theorem revstack_at_max {word : List ℕ} {m : ℕ} (h : word.max? = some m) :
    revstack word = revstack (word.drop (word.idxOf m + 1)) ++
      revstack (word.take (word.idxOf m)) ++ [m] := by
  have hTake := take_before_max_lt h
  have hDrop := drop_after_max_lt h
  obtain ⟨fuel, hFuel⟩ : ∃ fuel, word.length = fuel + 1 := ⟨word.length - 1, by omega⟩
  unfold revstack
  rw [hFuel, revstackFuel, h]
  dsimp only
  rw [revstackFuel_eq_of_length_le fuel _ _ (by omega) le_rfl,
    revstackFuel_eq_of_length_le fuel _ _ (by omega) le_rfl]

theorem word_maximum_split {word : List ℕ} {m : ℕ} (h : word.max? = some m) :
    word = word.take (word.idxOf m) ++ m :: word.drop (word.idxOf m + 1) := by
  have hm := List.max?_mem h
  have hi := List.idxOf_lt_length_of_mem hm
  have hDrop := List.drop_eq_getElem_cons hi
  rw [List.getElem_idxOf] at hDrop
  rw [← hDrop, List.take_append_drop]

theorem revstack_perm (word : List ℕ) : (revstack word).Perm word := by
  cases h : word.max? with
  | none =>
    rw [List.max?_eq_none_iff.mp h, revstack_nil]
  | some m =>
    let left := word.take (word.idxOf m)
    let right := word.drop (word.idxOf m + 1)
    have hL := revstack_perm left
    have hR := revstack_perm right
    rw [revstack_at_max h]
    change (revstack right ++ revstack left ++ [m]).Perm word
    calc
      List.Perm _ (right ++ left ++ [m]) := (hR.append hL).append_right _
      List.Perm _ (left ++ m :: right) := by
        simpa [List.append_assoc] using
          (List.perm_append_comm (l₁ := right) (l₂ := left ++ [m]))
      List.Perm _ word := by
        have he : left ++ m :: right = word := (word_maximum_split h).symm
        rw [he]
termination_by word.length
decreasing_by
  · exact take_before_max_lt h
  · exact drop_after_max_lt h

theorem revstack_append_largest (word : List ℕ) (m : ℕ) (h : ∀ x ∈ word, x < m) :
    revstack (word ++ [m]) = revstack word ++ [m] := by
  have hmax : (word ++ [m]).max? = some m := by
    apply List.max?_eq_some_iff.mpr
    refine ⟨by simp, ?_⟩
    intro x hx
    rcases List.mem_append.mp hx with hmem | hmem
    · exact (h x hmem).le
    · simp at hmem
      exact hmem.le
  have hn : m ∉ word := fun hm => (h m hm).false
  rw [revstack_at_max hmax, List.idxOf_append_of_notMem hn]
  simp

theorem iterate_revstack_perm (word : List ℕ) (t : ℕ) : ((revstack^[t]) word).Perm word := by
  induction t with
  | zero => exact List.Perm.refl _
  | succ t hPrev =>
    rw [Function.iterate_succ_apply']
    exact (revstack_perm _).trans hPrev

theorem iterate_revstack_append_largest (word : List ℕ) (m t : ℕ) (h : ∀ x ∈ word, x < m) :
    (revstack^[t]) (word ++ [m]) = (revstack^[t]) word ++ [m] := by
  induction t with
  | zero => rfl
  | succ t ih =>
    rw [Function.iterate_succ_apply', Function.iterate_succ_apply', ih]
    apply revstack_append_largest
    exact fun x hx => h x ((iterate_revstack_perm word t).mem_iff.mp hx)

/-- Number of adjacent descents in a word. -/
def wordDescents (word : List ℕ) : ℕ :=
  (word.zip word.tail).countP fun p => decide (p.2 < p.1)

def isRevstackSortable (n t : ℕ) (word : List ℕ) : Bool :=
  (revstack^[t]) word == List.range n

/-- Literal descent polynomial of the permutations sorted in the specified
number of passes. Labels are zero-based, which preserves all comparisons. -/
noncomputable def revstackDescentPolynomial (n t : ℕ) : R[X] :=
  (((List.range n).permutations.filter (isRevstackSortable n t)).map
    (fun word => X ^ (1 + wordDescents word))).sum

end DukesRevstack
