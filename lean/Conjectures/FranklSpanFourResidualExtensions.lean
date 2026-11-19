module

public import Conjectures.FranklSpanFourAssembly
public import Conjectures.FranklSpanFourWordCoverage

/-! Exact coverage of the 48 overlaps of the published 35 residual rows.
Reconstructed after the local runtime outage; this source requires a fresh gate. -/
@[expose] public section

namespace FranklSpanFour.Assembly

open FranklCyclic

def decodeWindow (k : ℕ) (row : List ℕ) : Word k :=
  fun j => FranklSmallCyclic.decodeLetter (row.getD j.val 0)

@[simp] theorem decode_encodeWindow {k : ℕ} (v : Word k) :
    decodeWindow k (encodeWindow v) = v := by
  funext j
  simp only [decodeWindow, encodeWindow, List.getD_eq_getElem?_getD,
    List.getElem?_ofFn, dite_eq_left j.isLt, Option.getD_some,
    FranklSmallCyclic.decode_encodeLetter]

theorem encodeWindow_injective {k : ℕ} :
    Function.Injective (encodeWindow (k := k)) := by
  intro v w h
  rw [← decode_encodeWindow v, ← decode_encodeWindow w, h]

def residualRows : List (List ℕ) := [
  [0, 0, 0, 0, 0, 0, 0],
  [0, 4, 2, 0, 4, 2, 0],
  [0, 4, 2, 0, 4, 10, 0],
  [0, 4, 2, 0, 12, 2, 0],
  [0, 4, 10, 0, 4, 2, 0],
  [0, 4, 10, 0, 4, 10, 0],
  [0, 12, 2, 0, 4, 2, 0],
  [0, 12, 2, 0, 4, 10, 0],
  [0, 12, 2, 0, 12, 2, 0],
  [2, 0, 4, 2, 0, 4, 2],
  [2, 0, 4, 2, 0, 4, 10],
  [2, 0, 4, 2, 0, 12, 2],
  [2, 0, 4, 10, 0, 4, 2],
  [2, 0, 4, 10, 0, 4, 10],
  [2, 0, 12, 2, 0, 4, 2],
  [2, 0, 12, 2, 0, 4, 10],
  [2, 0, 12, 2, 0, 12, 2],
  [4, 2, 0, 4, 2, 0, 4],
  [4, 2, 0, 4, 2, 0, 12],
  [4, 2, 0, 4, 10, 0, 4],
  [4, 2, 0, 12, 2, 0, 4],
  [4, 2, 0, 12, 2, 0, 12],
  [4, 10, 0, 4, 2, 0, 4],
  [4, 10, 0, 4, 2, 0, 12],
  [4, 10, 0, 4, 10, 0, 4],
  [10, 0, 4, 2, 0, 4, 2],
  [10, 0, 4, 2, 0, 4, 10],
  [10, 0, 4, 2, 0, 12, 2],
  [10, 0, 4, 10, 0, 4, 2],
  [10, 0, 4, 10, 0, 4, 10],
  [12, 2, 0, 4, 2, 0, 4],
  [12, 2, 0, 4, 2, 0, 12],
  [12, 2, 0, 4, 10, 0, 4],
  [12, 2, 0, 12, 2, 0, 4],
  [12, 2, 0, 12, 2, 0, 12]
]

theorem residualRows_exact :
    residualRows.toFinset = FranklSmallCyclic.residualEdges := by
  decide +kernel

theorem residual_row_roundtrip : ∀ row ∈ residualRows,
    encodeWindow (decodeWindow 7 row) = row := by
  decide +kernel

def residualWords : List (Word 7) := residualRows.map (decodeWindow 7)

theorem mem_residualWords_iff (v : Word 7) :
    v ∈ residualWords ↔ encodeWindow v ∈ FranklSmallCyclic.residualEdges := by
  constructor
  · intro hv
    obtain ⟨row, hrow, rfl⟩ := List.mem_map.mp hv
    rw [residual_row_roundtrip row hrow, ← residualRows_exact]
    exact List.mem_toFinset.mpr hrow
  · intro hv
    have hrow : encodeWindow v ∈ residualRows := by
      apply List.mem_toFinset.mp
      rw [residualRows_exact]
      exact hv
    exact List.mem_map.mpr ⟨encodeWindow v, hrow, decode_encodeWindow v⟩

theorem residualWords_length : residualWords.length = 35 := by decide +kernel

theorem residualWords_nodup : residualWords.Nodup := by decide +kernel

def residualExtensions : List (Word 8) :=
  WordCoverage.overlapWords residualWords residualWords

theorem mem_residualExtensions_iff (v : Word 8) :
    v ∈ residualExtensions ↔
      encodeWindow (wordPrefix v) ∈ FranklSmallCyclic.residualEdges ∧
      encodeWindow (wordSuffix v) ∈ FranklSmallCyclic.residualEdges := by
  rw [residualExtensions, WordCoverage.mem_overlapWords_iff]
  change (wordPrefix v ∈ residualWords ∧ wordSuffix v ∈ residualWords) ↔ _
  rw [mem_residualWords_iff, mem_residualWords_iff]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 4000000 in
theorem residualExtensions_length : residualExtensions.length = 48 := by decide +kernel

set_option maxRecDepth 65536 in
set_option maxHeartbeats 4000000 in
theorem residualExtensions_nodup : residualExtensions.Nodup := by decide +kernel

theorem extensionsCheck_iff_residualExtensions_subset (P : Packet) :
    extensionsCheck P = true ↔ ∀ v ∈ residualExtensions, v ∈ P.extensions := by
  unfold extensionsCheck
  constructor
  · intro hc v hv
    obtain ⟨hp, hs⟩ := (mem_residualExtensions_iff v).mp hv
    exact (of_decide_eq_true hc) v hp hs
  · intro hc
    apply decide_eq_true
    intro v hp hs
    exact hc v ((mem_residualExtensions_iff v).mpr ⟨hp, hs⟩)

def residualExtensionsCheck (P : Packet) : Bool :=
  residualExtensions.all (fun v => decide (v ∈ P.extensions))

theorem extensionsCheck_iff_residualExtensionsCheck (P : Packet) :
    extensionsCheck P = true ↔ residualExtensionsCheck P = true := by
  rw [extensionsCheck_iff_residualExtensions_subset]
  simp only [residualExtensionsCheck, List.all_eq_true, decide_eq_true_eq]

theorem extensionsCheck_of_residualExtensions_subset {P : Packet}
    (h : ∀ v ∈ residualExtensions, v ∈ P.extensions) : extensionsCheck P = true :=
  (extensionsCheck_iff_residualExtensions_subset P).mpr h

theorem extensionsCheck_set_residualExtensions (P : Packet) :
    extensionsCheck { P with extensions := residualExtensions } = true := by
  apply extensionsCheck_of_residualExtensions_subset
  exact fun _ h => h

end FranklSpanFour.Assembly
