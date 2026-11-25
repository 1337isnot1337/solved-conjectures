import Conjectures.DukesRevstackSort
import Mathlib.Data.List.Nodup

/-! Splitting an actual permutation at its largest element gives two
smaller words. A revstack pass sorts those words in reverse order and
fixes the largest element at the end. -/

namespace DukesRevstack

theorem split_at_maximum (left right : List ℕ) (m : ℕ)
    (hLeft : ∀ x ∈ left, x < m) (hRight : ∀ x ∈ right, x < m) :
    let word := left ++ m :: right
    word.max? = some m ∧ word.take (word.idxOf m) = left ∧ word.drop (word.idxOf m + 1) = right := by
  dsimp only
  have hNot : m ∉ left := fun h => (hLeft m h).false
  have hIdx : (left ++ m :: right).idxOf m = left.length := by
    rw [List.idxOf_append_of_notMem hNot]
    simp
  refine ⟨List.max?_eq_some_iff.mpr ⟨by simp, ?_⟩, ?_, ?_⟩
  · intro x hx
    rcases List.mem_append.mp hx with hl | hr
    · exact (hLeft x hl).le
    · rcases List.mem_cons.mp hr with rfl | h
      · rfl
      · exact (hRight x h).le
  · rw [hIdx]
    simp
  · rw [hIdx]
    simp

theorem revstack_of_split (left right : List ℕ) (m : ℕ)
    (hLeft : ∀ x ∈ left, x < m) (hRight : ∀ x ∈ right, x < m) :
    revstack (left ++ m :: right) = revstack right ++ revstack left ++ [m] := by
  obtain ⟨hMax, hL, hR⟩ := split_at_maximum left right m hLeft hRight
  rw [revstack_at_max hMax, hL, hR]

theorem max_of_perm_range_succ {word : List ℕ} {m : ℕ} (h : word.Perm (List.range (m + 1))) :
    word.max? = some m := by
  apply List.max?_eq_some_iff.mpr
  refine ⟨h.mem_iff.mpr (List.mem_range.mpr (by omega)), ?_⟩
  intro x hx
  have hlt := List.mem_range.mp (h.mem_iff.mp hx)
  omega

theorem revstack_exists_prefix_of_max {word : List ℕ} {m : ℕ} (h : word.max? = some m) :
    ∃ p : List ℕ, revstack word = p ++ [m] := by
  exact ⟨_, revstack_at_max h⟩

theorem revstack_prefix_perm {word inner : List ℕ} {m : ℕ}
    (hWord : word.Perm (List.range (m + 1))) (hPass : revstack word = inner ++ [m]) :
    inner.Perm (List.range m) := by
  have h := (revstack_perm word).trans hWord
  rw [hPass, List.range_succ] at h
  exact (List.perm_append_right_iff [m]).mp h

theorem perm_range_succ_split_lt {left right : List ℕ} {m : ℕ}
    (hWord : (left ++ m :: right).Perm (List.range (m + 1))) :
    (∀ x ∈ left, x < m) ∧ (∀ x ∈ right, x < m) := by
  have hNodup : (left ++ m :: right).Nodup := hWord.nodup_iff.mpr List.nodup_range
  have hLnot : m ∉ left := fun h =>
    (List.disjoint_left.mp ((List.nodup_append'.mp hNodup).2.2)) h (by simp)
  have hRnot : m ∉ right := (List.nodup_cons.mp (List.nodup_append'.mp hNodup).2.1).1
  constructor
  · intro x hx
    have hxNot : x ≠ m := fun he => hLnot (he ▸ hx)
    have hxIn := List.mem_range.mp (hWord.mem_iff.mp (List.mem_append_left _ hx))
    omega
  · intro x hx
    have hxNot : x ≠ m := fun he => hRnot (he ▸ hx)
    have hxIn := List.mem_range.mp (hWord.mem_iff.mp (List.mem_append_right _ (List.mem_cons_of_mem _ hx)))
    omega

theorem iterate_not_sorted_iff_prefix {word inner : List ℕ} {m : ℕ}
    (hm : 2 ≤ m) (hWord : word.Perm (List.range (m + 1))) (hPass : revstack word = inner ++ [m]) :
    (revstack^[m - 1]) word ≠ List.range (m + 1) ↔
      (revstack^[m - 2]) inner ≠ List.range m := by
  have hPrefix := revstack_prefix_perm hWord hPass
  have hLt (x : ℕ) (hx : x ∈ inner) : x < m := List.mem_range.mp (hPrefix.mem_iff.mp hx)
  have hTime : m - 1 = m - 2 + 1 := by omega
  rw [hTime, Function.iterate_succ_apply, hPass, iterate_revstack_append_largest _ _ _ hLt, List.range_succ]
  exact not_congr ⟨fun e => List.append_left_injective [m] e, fun e => congrArg (· ++ [m]) e⟩

end DukesRevstack
