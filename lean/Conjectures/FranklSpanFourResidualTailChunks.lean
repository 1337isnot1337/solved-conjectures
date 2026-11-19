module

public import Conjectures.FranklSpanFourResidualTailCore
public import Conjectures.FranklLocalMaskCached

/-! Complete exterior chunking for the unchanged semantic mask checker.
Every chunk retains the full required-boundary domain. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail

open FranklLocal Frankl.FC.BitCode

def outside (e : Entry) : List ℕ :=
  Mask.submasks 11 (Mask.boundaryCode e.generators 248)

def positiveCheck (e : Entry) : Bool :=
  decide (∃ x ∈ decode 11 248, 0 < weightAt e.weights x)

def exteriorCheck (e : Entry) (allowed : ℕ) : Bool :=
  let localGs := Mask.localCodes e.generators 248
  let scores := Mask.shareCache 11 248 (Mask.submasks 11 248) (weightAt e.weights)
  let row := Mask.rowOfCached localGs scores allowed
  (outside e).all (fun required =>
    if required &&& allowed = required then decide (0 ≤ Mask.rowShare 248 row required) else true)

def chunkCheck (e : Entry) (chunk : List ℕ) : Bool := chunk.all (exteriorCheck e)

theorem entryCheck_of_chunks {e : Entry} {chunks : List (List ℕ)}
    (hmetadata : metadataCheck e = true) (hpositive : positiveCheck e = true)
    (hcover : chunks.flatten = outside e)
    (hchunks : chunks.all (chunkCheck e) = true) : entryCheck e = true := by
  apply Bool.and_eq_true_iff.mpr
  refine ⟨hmetadata, ?_⟩
  change Mask.check 11 e.generators 248 (Mask.submasks 11 248)
    (outside e) (weightAt e.weights) = true
  rw [← Mask.cachedCheck_eq]
  change positiveCheck e && (outside e).all (exteriorCheck e) = true
  apply Bool.and_eq_true_iff.mpr
  refine ⟨hpositive, List.all_eq_true.mpr ?_⟩
  intro allowed ha
  rw [← hcover] at ha
  obtain ⟨chunk, hchunk, hallowed⟩ := List.mem_flatten.mp ha
  have hcheck : chunk.all (exteriorCheck e) = true :=
    List.all_eq_true.mp hchunks chunk hchunk
  exact List.all_eq_true.mp hcheck allowed hallowed

end FranklSpanFour.Assembly.ResidualTail
