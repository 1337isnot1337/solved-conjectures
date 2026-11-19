module

public import Conjectures.FranklSmallCyclicMaskTransport

/-! Coverage of reordered short-cycle rows.

Transport chunks may be grouped by their source arithmetic block. Each row
retains its original input index and its actual transported entry. The index
checks and word checks contain no local-certificate arithmetic. A union of
finite row masks proves coverage; an exact total count then proves uniqueness.
-/
@[expose] public section

namespace FranklSmallCyclic.RowCoverage

open Weights MaskTransport Frankl.FC.BitCode

structure TaggedRow where
  index : ℕ
  entry : Entry
  deriving DecidableEq

structure Chunk where
  rows : List TaggedRow
  indexMask : ℕ
  count : ℕ
  deriving DecidableEq

def allRows (chunks : List Chunk) : List TaggedRow :=
  chunks.flatMap Chunk.rows

def entries (chunks : List Chunk) : List Entry :=
  (allRows chunks).map TaggedRow.entry

def indices (chunks : List Chunk) : List ℕ :=
  (allRows chunks).map TaggedRow.index

def combinedMask (chunks : List Chunk) : ℕ :=
  maskUnion (chunks.map Chunk.indexMask)

def totalCount (chunks : List Chunk) : ℕ :=
  (chunks.map Chunk.count).sum

abbrev Indexed (size : ℕ) (chunk : Chunk) : Prop :=
  (∀ row ∈ chunk.rows, row.index < size) ∧
    pointsMask (chunk.rows.map TaggedRow.index) = chunk.indexMask ∧
    chunk.rows.length = chunk.count

abbrev WordsAgree (original : ℕ → List ℕ) (chunk : Chunk) : Prop :=
  ∀ row ∈ chunk.rows, row.entry.word = original row.index

abbrev Covers (size : ℕ) (chunks : List Chunk) : Prop :=
  combinedMask chunks = pointsMask (List.range size) ∧
    totalCount chunks = size

def indexCheck (size : ℕ) (chunk : Chunk) : Bool :=
  decide (Indexed size chunk)

def wordsCheck (original : ℕ → List ℕ) (chunk : Chunk) : Bool :=
  decide (WordsAgree original chunk)

def coverageCheck (size : ℕ) (chunks : List Chunk) : Bool :=
  decide (Covers size chunks)

theorem indexCheck_sound {size : ℕ} {chunk : Chunk}
    (h : indexCheck size chunk = true) : Indexed size chunk :=
  of_decide_eq_true h

theorem wordsCheck_sound {original : ℕ → List ℕ} {chunk : Chunk}
    (h : wordsCheck original chunk = true) : WordsAgree original chunk :=
  of_decide_eq_true h

theorem coverageCheck_sound {size : ℕ} {chunks : List Chunk}
    (h : coverageCheck size chunks = true) : Covers size chunks :=
  of_decide_eq_true h

theorem mem_allRows {chunks : List Chunk} {row : TaggedRow} :
    row ∈ allRows chunks ↔ ∃ chunk ∈ chunks, row ∈ chunk.rows := by
  simp [allRows]

theorem chunk_indices_bounded {size : ℕ} {chunk : Chunk}
    (h : Indexed size chunk) :
    ∀ i ∈ chunk.rows.map TaggedRow.index, i < size := by
  intro i hi
  obtain ⟨row, hrow, rfl⟩ := List.mem_map.mp hi
  exact h.1 row hrow

theorem indices_bounded {size : ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk) :
    ∀ i ∈ indices chunks, i < size := by
  intro i hi
  obtain ⟨row, hrow, rfl⟩ := List.mem_map.mp hi
  obtain ⟨chunk, hchunk, hrow⟩ := mem_allRows.mp hrow
  exact (hindexed chunk hchunk).1 row hrow

theorem decode_combinedMask {size : ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk) :
    decode size (combinedMask chunks) = (indices chunks).toFinset := by
  ext i
  rw [combinedMask, MaskWindows.mem_decode_maskUnion]
  constructor
  · rintro ⟨a, ha, hia⟩
    obtain ⟨chunk, hchunk, rfl⟩ := List.mem_map.mp ha
    rw [← (hindexed chunk hchunk).2.1,
      decode_pointsMask size _ (chunk_indices_bounded (hindexed chunk hchunk))] at hia
    obtain ⟨row, hrow, hindex⟩ := List.mem_map.mp (List.mem_toFinset.mp hia)
    exact List.mem_toFinset.mpr (List.mem_map.mpr
      ⟨row, mem_allRows.mpr ⟨chunk, hchunk, hrow⟩, hindex⟩)
  · intro hi
    obtain ⟨row, hrow, hindex⟩ := List.mem_map.mp (List.mem_toFinset.mp hi)
    obtain ⟨chunk, hchunk, hrow⟩ := mem_allRows.mp hrow
    refine ⟨chunk.indexMask, List.mem_map.mpr ⟨chunk, hchunk, rfl⟩, ?_⟩
    rw [← (hindexed chunk hchunk).2.1,
      decode_pointsMask size _ (chunk_indices_bounded (hindexed chunk hchunk))]
    exact List.mem_toFinset.mpr (List.mem_map.mpr ⟨row, hrow, hindex⟩)

theorem indices_toFinset {size : ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks) :
    (indices chunks).toFinset = Finset.range size := by
  have h := congrArg (decode size) hcover.1
  rw [decode_combinedMask hindexed,
    decode_pointsMask size (List.range size) (fun i hi => List.mem_range.mp hi)] at h
  have hrange : (List.range size).toFinset = Finset.range size := by
    ext i
    simp
  exact h.trans hrange

theorem allRows_length {size : ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk) :
    (allRows chunks).length = totalCount chunks := by
  revert hindexed
  induction chunks with
  | nil =>
      intro _
      rfl
  | cons chunk rest ih =>
      intro hindexed
      have hhead := (hindexed chunk List.mem_cons_self).2.2
      have htail : ∀ c ∈ rest, Indexed size c :=
        fun c hc => hindexed c (List.mem_cons_of_mem _ hc)
      simp only [allRows, List.flatMap_cons, List.length_append,
        totalCount, List.map_cons, List.sum_cons]
      exact congrArg₂ Nat.add hhead (ih htail)

theorem entries_length {size : ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks) :
    (entries chunks).length = size := by
  rw [entries, List.length_map, allRows_length hindexed, hcover.2]

theorem indices_nodup {size : ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks) :
    (indices chunks).Nodup := by
  change Multiset.Nodup (⟦indices chunks⟧ : Multiset ℕ)
  apply Multiset.toFinset_card_eq_card_iff_nodup.mp
  change (indices chunks).toFinset.card = (indices chunks).length
  rw [indices_toFinset hindexed hcover, Finset.card_range,
    indices, List.length_map, allRows_length hindexed, hcover.2]

/-- Combining checked chunk lists uses their proofs without evaluating the
numeric checker on the combined list. -/
theorem entries_checked {period : ℕ} {chunks : List Chunk}
    (hchecked : ∀ chunk ∈ chunks,
      batchCheck period (chunk.rows.map TaggedRow.entry) = true) :
    batchCheck period (entries chunks) = true := by
  apply List.all_eq_true.mpr
  intro entry hentry
  obtain ⟨row, hrow, rfl⟩ := List.mem_map.mp hentry
  obtain ⟨chunk, hchunk, hrow⟩ := mem_allRows.mp hrow
  exact List.all_eq_true.mp (hchecked chunk hchunk) row.entry
    (List.mem_map.mpr ⟨row, hrow, rfl⟩)

theorem entry_for_index {size : ℕ} {original : ℕ → List ℕ}
    {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks)
    (hwords : ∀ chunk ∈ chunks, WordsAgree original chunk)
    {i : ℕ} (hi : i < size) :
    ∃ entry ∈ entries chunks, entry.word = original i := by
  have himem : i ∈ indices chunks := by
    apply List.mem_toFinset.mp
    rw [indices_toFinset hindexed hcover]
    exact Finset.mem_range.mpr hi
  obtain ⟨row, hrow, hindex⟩ := List.mem_map.mp himem
  obtain ⟨chunk, hchunk, hrowchunk⟩ := mem_allRows.mp hrow
  refine ⟨row.entry, List.mem_map.mpr ⟨row, hrow, rfl⟩, ?_⟩
  simpa only [hindex] using hwords chunk hchunk row hrowchunk

theorem checked_entry_for_index {period size : ℕ}
    {original : ℕ → List ℕ} {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks)
    (hwords : ∀ chunk ∈ chunks, WordsAgree original chunk)
    (hchecked : ∀ chunk ∈ chunks,
      batchCheck period (chunk.rows.map TaggedRow.entry) = true)
    {i : ℕ} (hi : i < size) :
    ∃ entry ∈ entries chunks,
      entry.word = original i ∧ entryCheck period entry = true := by
  obtain ⟨entry, hentry, hword⟩ := entry_for_index hindexed hcover hwords hi
  exact ⟨entry, hentry, hword,
    List.all_eq_true.mp (entries_checked hchecked) entry hentry⟩

/-- The final word set equals the original indexed word set. Weights remain
the transported weights recorded in each entry. -/
theorem entry_words_toFinset {size : ℕ} {original : ℕ → List ℕ}
    {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks)
    (hwords : ∀ chunk ∈ chunks, WordsAgree original chunk) :
    ((entries chunks).map Entry.word).toFinset =
      (Finset.range size).image original := by
  ext word
  constructor
  · intro hword
    obtain ⟨entry, hentry, hword⟩ := List.mem_map.mp (List.mem_toFinset.mp hword)
    obtain ⟨row, hrow, rfl⟩ := List.mem_map.mp hentry
    obtain ⟨chunk, hchunk, hrow⟩ := mem_allRows.mp hrow
    exact Finset.mem_image.mpr ⟨row.index,
      Finset.mem_range.mpr ((hindexed chunk hchunk).1 row hrow),
      (hwords chunk hchunk row hrow).symm.trans hword⟩
  · intro hword
    obtain ⟨i, hi, hword⟩ := Finset.mem_image.mp hword
    obtain ⟨entry, hentry, heq⟩ :=
      entry_for_index hindexed hcover hwords (Finset.mem_range.mp hi)
    exact List.mem_toFinset.mpr (List.mem_map.mpr
      ⟨entry, hentry, heq.trans hword⟩)

/-- A canonical word view for coverage. Its weight fields are empty. -/
def originalEntries (size : ℕ) (original : ℕ → List ℕ) : List Entry :=
  (List.range size).map (fun i => ⟨original i, []⟩)

theorem entry_for_original {size : ℕ} {original : ℕ → List ℕ}
    {chunks : List Chunk}
    (hindexed : ∀ chunk ∈ chunks, Indexed size chunk)
    (hcover : Covers size chunks)
    (hwords : ∀ chunk ∈ chunks, WordsAgree original chunk)
    {entry : Entry} (hentry : entry ∈ originalEntries size original) :
    ∃ target ∈ entries chunks, shapeWord target = shapeWord entry := by
  obtain ⟨i, hi, rfl⟩ := List.mem_map.mp hentry
  obtain ⟨target, htarget, hword⟩ :=
    entry_for_index hindexed hcover hwords (List.mem_range.mp hi)
  refine ⟨target, htarget, ?_⟩
  funext p
  change (Finset.univ.filter (fun j : Fin 4 =>
      (target.word.getD p.val 0).testBit j.val = true)) =
    Finset.univ.filter (fun j : Fin 4 =>
      ((original i).getD p.val 0).testBit j.val = true)
  rw [hword]

end FranklSmallCyclic.RowCoverage
