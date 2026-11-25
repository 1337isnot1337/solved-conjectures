import Conjectures.DukesRevstackSplit

/-! The permutations that need the last available pass are exactly those
whose two sides of the maximum contain the two prescribed parity classes.
The proof tracks this splitting condition after one pass. -/

namespace DukesRevstack

/-- The left part contains labels of the maximum's parity, and the right
part contains the opposite parity. Labels are zero-based. -/
def AlternatingMaxSplit (word : List ℕ) (m : ℕ) : Prop :=
  (∀ x ∈ word.take (word.idxOf m), x % 2 = m % 2) ∧
    (∀ x ∈ word.drop (word.idxOf m + 1), x % 2 ≠ m % 2)

instance (word : List ℕ) (m : ℕ) : Decidable (AlternatingMaxSplit word m) := by
  unfold AlternatingMaxSplit
  infer_instance

theorem alternatingMaxSplit_of_split (left right : List ℕ) (m : ℕ)
    (hLeft : ∀ x ∈ left, x < m) (hRight : ∀ x ∈ right, x < m) :
    AlternatingMaxSplit (left ++ m :: right) m ↔
      (∀ x ∈ left, x % 2 = m % 2) ∧ (∀ x ∈ right, x % 2 ≠ m % 2) := by
  obtain ⟨_, hL, hR⟩ := split_at_maximum left right m hLeft hRight
  unfold AlternatingMaxSplit
  rw [hL, hR]

private theorem max_sub_one_if_mem {word : List ℕ} {m : ℕ}
    (hBound : ∀ x ∈ word, x < m) (hMem : m - 1 ∈ word) : word.max? = some (m - 1) := by
  apply List.max?_eq_some_iff.mpr
  refine ⟨hMem, ?_⟩
  intro x hx
  have := hBound x hx
  omega

theorem alternatingMaxSplit_after_one_pass {m : ℕ} (hm : 3 ≤ m) {word inner : List ℕ}
    (hWord : word.Perm (List.range (m + 1))) (hPass : revstack word = inner ++ [m]) :
    AlternatingMaxSplit inner (m - 1) ↔ AlternatingMaxSplit word m := by
  let left := word.take (word.idxOf m)
  let right := word.drop (word.idxOf m + 1)
  have hSplit : word = left ++ m :: right := word_maximum_split (max_of_perm_range_succ hWord)
  have hOriginal : (left ++ m :: right).Perm (List.range (m + 1)) := hSplit ▸ hWord
  obtain ⟨hL, hR⟩ := perm_range_succ_split_lt hOriginal
  have hInner := revstack_prefix_perm hWord hPass
  have hCore : inner = revstack right ++ revstack left := by
    apply List.append_left_injective [m]
    change inner ++ [m] = (revstack right ++ revstack left) ++ [m]
    rw [← hPass, hSplit, revstack_of_split left right m hL hR]
  have hOriginalAlt : AlternatingMaxSplit word m ↔
      (∀ x ∈ left, x % 2 = m % 2) ∧ (∀ x ∈ right, x % 2 ≠ m % 2) := by
    rw [hSplit, alternatingMaxSplit_of_split left right m hL hR]
  have hLower : m - 1 + 1 = m := by omega
  by_cases hIn : m - 1 ∈ right
  · obtain ⟨head, hHead⟩ := revstack_exists_prefix_of_max (max_sub_one_if_mem hR hIn)
    have hISplit : inner = head ++ (m - 1) :: revstack left := by
      rw [hCore, hHead]
      simp [List.append_assoc]
    have hInside : (head ++ (m - 1) :: revstack left).Perm (List.range (m - 1 + 1)) := by
      rw [hLower, ← hISplit]
      exact hInner
    obtain ⟨hHeadBound, hEndBound⟩ := perm_range_succ_split_lt hInside
    rw [hOriginalAlt, hISplit, alternatingMaxSplit_of_split _ _ _ hHeadBound hEndBound]
    constructor
    · rintro ⟨hHeadParity, hEndParity⟩
      constructor
      · intro x hx
        have hPar := hEndParity x ((revstack_perm left).mem_iff.mpr hx)
        omega
      · intro x hx
        have hmem := (revstack_perm right).mem_iff.mpr hx
        rw [hHead, List.mem_append] at hmem
        rcases hmem with hmem | hTail
        · have hPar := hHeadParity x hmem
          omega
        · have he : x = m - 1 := by simpa using hTail
          omega
    · rintro ⟨hLeftParity, hRightParity⟩
      constructor
      · intro x hx
        have hMem : x ∈ revstack right := by
          rw [hHead]
          exact List.mem_append_left _ hx
        have hPar := hRightParity x ((revstack_perm right).mem_iff.mp hMem)
        omega
      · intro x hx
        have hPar := hLeftParity x ((revstack_perm left).mem_iff.mp hx)
        omega
  · have hInLeft : m - 1 ∈ left := by
      have hMem := hWord.mem_iff.mpr (List.mem_range.mpr (show m - 1 < m + 1 by omega))
      rw [hSplit, List.mem_append, List.mem_cons] at hMem
      rcases hMem with hl | he | hr
      · exact hl
      · omega
      · exact (hIn hr).elim
    have hNotOriginal : ¬ AlternatingMaxSplit word m := by
      intro h
      have hPar := (hOriginalAlt.mp h).1 (m - 1) hInLeft
      omega
    obtain ⟨tail, hTail⟩ := revstack_exists_prefix_of_max (max_sub_one_if_mem hL hInLeft)
    let whole := revstack right ++ tail
    have hISplit : inner = whole ++ [m - 1] := by rw [hCore, hTail]; simp [whole, List.append_assoc]
    have hInside : (whole ++ (m - 1) :: []).Perm (List.range (m - 1 + 1)) := by
      rw [hLower, ← hISplit]
      exact hInner
    obtain ⟨hWhole, hEmpty⟩ := perm_range_succ_split_lt hInside
    have hNotInner : ¬ AlternatingMaxSplit inner (m - 1) := by
      intro ha
      have hChoice : m - 2 ∈ whole := by
        have hMem := hInner.mem_iff.mpr (List.mem_range.mpr (show m - 2 < m by omega))
        rw [hISplit, List.mem_append] at hMem
        rcases hMem with h | he
        · exact h
        · simp at he
          omega
      rw [hISplit, alternatingMaxSplit_of_split whole [] _ hWhole hEmpty] at ha
      have hPar := ha.1 (m - 2) hChoice
      omega
    exact ⟨fun h => (hNotInner h).elim, fun h => (hNotOriginal h).elim⟩

private theorem failure_base_three (word : List ℕ) (hWord : word.Perm (List.range 3)) :
    (revstack^[1]) word ≠ List.range 3 ↔ AlternatingMaxSplit word 2 := by
  have hAll : ((List.range 3).permutations').all (fun w =>
    decide ((revstack^[1]) w ≠ List.range 3 ↔ AlternatingMaxSplit w 2)) = true := by decide +kernel
  have hMem : word ∈ (List.range 3).permutations' := List.mem_permutations'.mpr hWord
  exact of_decide_eq_true (List.all_eq_true.mp hAll word hMem)

theorem penultimate_pass_failure_iff (m : ℕ) (hm : 2 ≤ m) (word : List ℕ)
    (hWord : word.Perm (List.range (m + 1))) :
    (revstack^[m - 1]) word ≠ List.range (m + 1) ↔ AlternatingMaxSplit word m := by
  induction m using Nat.strong_induction_on generalizing word with
  | h m ih =>
    by_cases he : m = 2
    · subst m
      exact failure_base_three word hWord
    have hM : 3 ≤ m := by omega
    obtain ⟨inner, hPass⟩ := revstack_exists_prefix_of_max (max_of_perm_range_succ hWord)
    have hInner := revstack_prefix_perm hWord hPass
    have hSize : m - 1 + 1 = m := by omega
    have hIter : m - 1 - 1 = m - 2 := by omega
    have hPrev := ih (m - 1) (by omega) (by omega) inner (by rwa [hSize])
    rw [hSize, hIter] at hPrev
    exact (iterate_not_sorted_iff_prefix hm hWord hPass).trans
      (hPrev.trans (alternatingMaxSplit_after_one_pass hM hWord hPass))

end DukesRevstack
