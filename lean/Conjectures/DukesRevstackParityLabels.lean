import Conjectures.DukesRevstackAlternation

/-! The two halves of an unsorted word are independently permuted parity
lists of the exact sizes in Dukes's product formula. -/

namespace DukesRevstack

def leftParityLabels (m : ℕ) : List ℕ := (List.range (m / 2)).map fun i => 2 * i + m % 2

def rightParityLabels (m : ℕ) : List ℕ := (List.range ((m + 1) / 2)).map fun i => 2 * i + (1 - m % 2)

theorem mem_leftParityLabels {m x : ℕ} :
    x ∈ leftParityLabels m ↔ x < m ∧ x % 2 = m % 2 := by
  simp only [leftParityLabels, List.mem_map, List.mem_range]
  constructor
  · rintro ⟨i, hi, rfl⟩
    omega
  · rintro ⟨h, hpar⟩
    exact ⟨x / 2, by omega, by omega⟩

theorem mem_rightParityLabels {m x : ℕ} :
    x ∈ rightParityLabels m ↔ x < m ∧ x % 2 ≠ m % 2 := by
  simp only [rightParityLabels, List.mem_map, List.mem_range]
  constructor
  · rintro ⟨i, hi, rfl⟩
    omega
  · rintro ⟨h, hpar⟩
    exact ⟨x / 2, by omega, by omega⟩

theorem nodup_leftParityLabels (m : ℕ) : (leftParityLabels m).Nodup :=
  List.nodup_range.map (fun _ _ h => by omega)

theorem nodup_rightParityLabels (m : ℕ) : (rightParityLabels m).Nodup :=
  List.nodup_range.map (fun _ _ h => by omega)

theorem alternating_word_shape (m : ℕ) (word : List ℕ) :
    word.Perm (List.range (m + 1)) ∧ AlternatingMaxSplit word m ↔
      ∃ left right, left.Perm (leftParityLabels m) ∧ right.Perm (rightParityLabels m) ∧
        word = left ++ m :: right := by
  constructor
  · rintro ⟨hWord, hAlt⟩
    let left := word.take (word.idxOf m)
    let right := word.drop (word.idxOf m + 1)
    have hSplit : word = left ++ m :: right := word_maximum_split (max_of_perm_range_succ hWord)
    have hSplitPerm : (left ++ m :: right).Perm (List.range (m + 1)) := hSplit ▸ hWord
    obtain ⟨hL, hR⟩ := perm_range_succ_split_lt hSplitPerm
    have hN := List.nodup_append'.mp (hSplitPerm.nodup_iff.mpr List.nodup_range)
    have hRN := (List.nodup_cons.mp hN.2.1).2
    have hLP : ∀ x ∈ left, x % 2 = m % 2 := hAlt.1
    have hRP : ∀ x ∈ right, x % 2 ≠ m % 2 := hAlt.2
    refine ⟨left, right, ?_, ?_, hSplit⟩
    · apply (List.perm_ext_iff_of_nodup hN.1 (nodup_leftParityLabels m)).mpr
      intro x
      rw [mem_leftParityLabels]
      constructor
      · exact fun hx => ⟨hL x hx, hLP x hx⟩
      · rintro ⟨hlt, hpar⟩
        have hmem := hSplitPerm.mem_iff.mpr (List.mem_range.mpr (show x < m + 1 by omega))
        rcases List.mem_append.mp hmem with hmem | hmem
        · exact hmem
        · rcases List.mem_cons.mp hmem with he | hr
          · omega
          · exact (hRP x hr hpar).elim
    · apply (List.perm_ext_iff_of_nodup hRN (nodup_rightParityLabels m)).mpr
      intro x
      rw [mem_rightParityLabels]
      constructor
      · exact fun hx => ⟨hR x hx, hRP x hx⟩
      · rintro ⟨hlt, hpar⟩
        have hmem := hSplitPerm.mem_iff.mpr (List.mem_range.mpr (show x < m + 1 by omega))
        rcases List.mem_append.mp hmem with hl | hmem
        · exact (hpar (hLP x hl)).elim
        · rcases List.mem_cons.mp hmem with he | hr
          · omega
          · exact hr
  · rintro ⟨left, right, hLP, hRP, rfl⟩
    have hl (x : ℕ) : x ∈ left ↔ x < m ∧ x % 2 = m % 2 := hLP.mem_iff.trans mem_leftParityLabels
    have hr (x : ℕ) : x ∈ right ↔ x < m ∧ x % 2 ≠ m % 2 := hRP.mem_iff.trans mem_rightParityLabels
    have hL (x : ℕ) (hx : x ∈ left) : x < m := ((hl x).mp hx).1
    have hR (x : ℕ) (hx : x ∈ right) : x < m := ((hr x).mp hx).1
    have hN : (left ++ m :: right).Nodup := by
      apply List.nodup_append'.mpr
      refine ⟨hLP.nodup_iff.mpr (nodup_leftParityLabels m),
        List.nodup_cons.mpr ⟨fun hx => (hR m hx).false, hRP.nodup_iff.mpr (nodup_rightParityLabels m)⟩, ?_⟩
      apply List.disjoint_left.mpr
      intro x hxL hxRight
      rcases List.mem_cons.mp hxRight with he | hxR
      · exact (hL x hxL).ne he
      · exact ((hr x).mp hxR).2 ((hl x).mp hxL).2
    constructor
    · apply (List.perm_ext_iff_of_nodup hN List.nodup_range).mpr
      intro x
      simp only [List.mem_append, List.mem_cons, List.mem_range, hl, hr]
      omega
    · exact (alternatingMaxSplit_of_split left right m hL hR).mpr
        ⟨fun x hx => ((hl x).mp hx).2, fun x hx => ((hr x).mp hx).2⟩

end DukesRevstack
