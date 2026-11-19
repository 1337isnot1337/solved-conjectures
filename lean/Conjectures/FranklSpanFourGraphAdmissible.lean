module

public import Conjectures.FranklSpanFourGraphRank
public import Conjectures.FranklSpanFourAdmissibleCore

/-! Admissibility passes to shorter consecutive windows. Consequently a
small four-letter coverage table suffices for the six-letter state cover. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic FranklLocal

theorem localTile_prefix_image (w : ℕ) (p : Fin (w + 3)) (j : Fin 4) :
    (localTile w p j).image (fun x => x.castSucc) = localTile (w + 1) p.castSucc j := by
  simp only [localTile, Finset.map_eq_image, Finset.image_image]
  apply Finset.image_congr
  intro q _
  apply Fin.ext
  rfl

theorem localTile_suffix_image (w : ℕ) (p : Fin (w + 3)) (j : Fin 4) :
    (localTile w p j).image (fun x => x.succ) = localTile (w + 1) p.succ j := by
  simp only [localTile, Finset.map_eq_image, Finset.image_image]
  apply Finset.image_congr
  intro q _
  apply Fin.ext
  change p.val + q.val + 1 = p.val + 1 + q.val
  omega

theorem admissible_prefix (w : ℕ) (v : Word (w + 4))
    (h : AdmissibleGenerators (localTiles (w + 1) v)) :
    AdmissibleGenerators (localTiles w (wordPrefix v)) := by
  apply admissible_pullback (fun x : Fin (w + 6) => x.castSucc)
  · intro A hA
    obtain ⟨p, j, hj, rfl⟩ := (mem_localTiles _ _ A).mp hA
    rw [localTile_prefix_image]
    exact (mem_localTiles _ _ _).mpr ⟨p.castSucc, j, hj, rfl⟩
  · intro A _ B _ hAB
    exact (Finset.image_injective (Fin.castSucc_injective (w + 6))) hAB
  · intro A _
    exact Finset.card_image_of_injective A (Fin.castSucc_injective (w + 6))
  · exact h

theorem admissible_suffix (w : ℕ) (v : Word (w + 4))
    (h : AdmissibleGenerators (localTiles (w + 1) v)) :
    AdmissibleGenerators (localTiles w (wordSuffix v)) := by
  apply admissible_pullback (fun x : Fin (w + 6) => x.succ)
  · intro A hA
    obtain ⟨p, j, hj, rfl⟩ := (mem_localTiles _ _ A).mp hA
    rw [localTile_suffix_image]
    exact (mem_localTiles _ _ _).mpr ⟨p.succ, j, hj, rfl⟩
  · intro A _ B _ hAB
    exact (Finset.image_injective (Fin.succ_injective (w + 6))) hAB
  · intro A _
    exact Finset.card_image_of_injective A (Fin.succ_injective (w + 6))
  · exact h

theorem windowAdmissibleCheck_prefix (w : ℕ) (v : Word (w + 4))
    (h : windowAdmissibleCheck (w + 1) v = true) :
    windowAdmissibleCheck w (wordPrefix v) = true :=
  (windowAdmissibleCheck_eq_true _ _).mpr
    (admissible_prefix w v ((windowAdmissibleCheck_eq_true _ _).mp h))

theorem windowAdmissibleCheck_suffix (w : ℕ) (v : Word (w + 4))
    (h : windowAdmissibleCheck (w + 1) v = true) :
    windowAdmissibleCheck w (wordSuffix v) = true :=
  (windowAdmissibleCheck_eq_true _ _).mpr
    (admissible_suffix w v ((windowAdmissibleCheck_eq_true _ _).mp h))

def fourSliceCheck (table : Table) (start count : ℕ) : Bool :=
  (List.range count).all (fun i =>
    !(windowAdmissibleCheck 1 (wordOfCode 4 (start + i))) || table.contains (start + i))

def fourCoverageCheck (table : Table) : Bool :=
  (List.range 256).all (fun i => fourSliceCheck table (i * 256) 256)

theorem fourSliceCheck_sound {table : Table} {start count i : ℕ}
    (hc : fourSliceCheck table start count = true) (hi : i < count)
    (ha : windowAdmissibleCheck 1 (wordOfCode 4 (start + i)) = true) :
    table.contains (start + i) = true := by
  have h := List.all_eq_true.mp hc i (List.mem_range.mpr hi)
  simpa only [ha, Bool.not_true, Bool.false_or] using h

theorem fourCoverageCheck_sound {table : Table}
    (hc : fourCoverageCheck table = true) (v : Word 4)
    (ha : windowAdmissibleCheck 1 v = true) : table.contains (wordCode v) = true := by
  have hb := wordCode_lt v
  have hq : wordCode v / 256 < 256 := by norm_num at hb ⊢; omega
  have hr : wordCode v % 256 < 256 := Nat.mod_lt _ (by decide)
  have hs := List.all_eq_true.mp hc (wordCode v / 256) (List.mem_range.mpr hq)
  have he : wordCode v / 256 * 256 + wordCode v % 256 = wordCode v := by omega
  have hword : wordOfCode 4 (wordCode v / 256 * 256 + wordCode v % 256) = v := by
    rw [he, wordOfCode_wordCode]
  have h := fourSliceCheck_sound hs hr (by rw [hword]; exact ha)
  simpa only [he] using h

def threeSliceCheck (table : Table) (start count : ℕ) : Bool :=
  (List.range count).all (fun i =>
    !(windowAdmissibleCheck 0 (wordOfCode 3 (start + i))) || table.contains (start + i))

def threeCoverageCheck (table : Table) : Bool :=
  (List.range 16).all (fun i => threeSliceCheck table (i * 256) 256)

theorem threeCoverageCheck_sound {table : Table}
    (hc : threeCoverageCheck table = true) (v : Word 3)
    (ha : windowAdmissibleCheck 0 v = true) : table.contains (wordCode v) = true := by
  have hb := wordCode_lt v
  have hq : wordCode v / 256 < 16 := by norm_num at hb ⊢; omega
  have hr : wordCode v % 256 < 256 := Nat.mod_lt _ (by decide)
  have hs := List.all_eq_true.mp hc (wordCode v / 256) (List.mem_range.mpr hq)
  have hrow := List.all_eq_true.mp hs (wordCode v % 256) (List.mem_range.mpr hr)
  have he : wordCode v / 256 * 256 + wordCode v % 256 = wordCode v := by omega
  simpa only [he, wordOfCode_wordCode, ha, Bool.not_true, Bool.false_or] using hrow

def fourExtensionCheck (triples fours : Table) : Bool :=
  triples.keys.all (fun p => (List.range 16).all (fun digit =>
    !(windowAdmissibleCheck 1 (wordOfCode 4 (p + 4096 * digit))) ||
      fours.contains (p + 4096 * digit)))

theorem fourExtensionCheck_sound {triples fours : Table}
    (ht : threeCoverageCheck triples = true) (hf : fourExtensionCheck triples fours = true)
    (v : Word 4) (ha : windowAdmissibleCheck 1 v = true) : fours.contains (wordCode v) = true := by
  have hp := Table.contains_mem (threeCoverageCheck_sound ht (wordPrefix v)
    (windowAdmissibleCheck_prefix 0 v ha))
  have hd := letterCode_lt (v (Fin.last 3))
  have hrow := List.all_eq_true.mp (List.all_eq_true.mp hf (wordCode (wordPrefix v)) hp)
    (letterCode (v (Fin.last 3))) (List.mem_range.mpr hd)
  have he : wordCode (wordPrefix v) + 4096 * letterCode (v (Fin.last 3)) = wordCode v := by
    have hsnoc := wordCode_snoc (wordPrefix v) (v (Fin.last 3))
    have hv : Fin.snoc (wordPrefix v) (v (Fin.last 3)) = v := Fin.snoc_init_self v
    rw [hv] at hsnoc
    exact hsnoc.symm
  simpa only [he, wordOfCode_wordCode, ha, Bool.not_true, Bool.false_or] using hrow

theorem fourCoverageCheck_of_covers {table : Table}
    (h : ∀ v : Word 4, windowAdmissibleCheck 1 v = true → table.contains (wordCode v) = true) :
    fourCoverageCheck table = true := by
  apply List.all_eq_true.mpr
  intro block hb
  apply List.all_eq_true.mpr
  intro digit hd
  have hb' := List.mem_range.mp hb
  have hd' := List.mem_range.mp hd
  have hbound : block * 256 + digit < 16 ^ 4 := by norm_num; omega
  by_cases ha : windowAdmissibleCheck 1 (wordOfCode 4 (block * 256 + digit)) = true
  · have ht := h _ ha
    rw [wordCode_wordOfCode hbound] at ht
    exact Bool.or_eq_true_iff.mpr (Or.inr ht)
  · have ha' : windowAdmissibleCheck 1 (wordOfCode 4 (block * 256 + digit)) = false :=
      Bool.eq_false_iff.mpr ha
    exact Bool.or_eq_true_iff.mpr (Or.inl (by rw [ha']; rfl))

/-- Only three-letter coverage and extensions of its listed keys need
numerical checking; the full four-letter universal check follows. -/
theorem fourCoverageCheck_of_extension {triples fours : Table}
    (ht : threeCoverageCheck triples = true) (hf : fourExtensionCheck triples fours = true) :
    fourCoverageCheck fours = true :=
  fourCoverageCheck_of_covers (fourExtensionCheck_sound ht hf)

end FranklSpanFour.Graph
