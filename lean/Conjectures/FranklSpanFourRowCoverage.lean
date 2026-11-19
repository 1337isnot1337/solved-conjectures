module

public import Conjectures.FranklSmallCyclicRowCoverage
public import Conjectures.FranklSpanFourWeightBatches

/-! Use reordered, independently weighted period lists in the assembly packet.

The canonical word-coverage premise remains explicit. The generic row-index
certificate transfers that premise to the entries produced by transport.
Periods seven, eight, and nine may use different weights and different orders.
-/
@[expose] public section

namespace FranklSpanFour.Assembly

open FranklSmallCyclic FranklSmallCyclic.Weights

theorem rowCoverageCheck_of_entry_coverage {P : Packet}
    {source target : List Entry}
    (hsource : rowCoverageCheck P source = true)
    (hentries : ∀ entry ∈ source,
      ∃ replacement ∈ target, shapeWord replacement = shapeWord entry) :
    rowCoverageCheck P target = true := by
  apply rowCoverageCheck_eq_true_iff.mpr
  intro word hword
  by_cases hleft : word ∈ P.left4
  · exact List.mem_append_left _ hleft
  · obtain ⟨entry, hentry, hshape⟩ :=
      rowCoverageCheck_sound hsource hword hleft
    obtain ⟨replacement, hreplacement, hreplace⟩ := hentries entry hentry
    exact List.mem_append_right _ (List.mem_map.mpr
      ⟨replacement, hreplacement, hreplace.trans hshape⟩)

theorem rowCoverageCheck_of_indexed_chunks {P : Packet} {size : ℕ}
    {original : ℕ → List ℕ} {chunks : List RowCoverage.Chunk}
    (hsource : rowCoverageCheck P (RowCoverage.originalEntries size original) = true)
    (hindexed : ∀ chunk ∈ chunks, RowCoverage.Indexed size chunk)
    (hcover : RowCoverage.Covers size chunks)
    (hwords : ∀ chunk ∈ chunks, RowCoverage.WordsAgree original chunk) :
    rowCoverageCheck P (RowCoverage.entries chunks) = true :=
  rowCoverageCheck_of_entry_coverage hsource
    (fun _ hentry => RowCoverage.entry_for_original hindexed hcover hwords hentry)

def shortWeightsFromSeparateRows (rows7 rows8 rows9 : List Entry) : ShortWeights where
  weights7 := weightsFromRows rows7
  weights8 := weightsFromRows rows8
  weights9 := weightsFromRows rows9

theorem shortChecked_of_separate_batches {P : Packet}
    {rows7 rows8 rows9 : List Entry}
    (hcover7 : rowCoverageCheck P rows7 = true)
    (hcover8 : rowCoverageCheck P rows8 = true)
    (hcover9 : rowCoverageCheck P rows9 = true)
    (hseven : batchCheck 7 rows7 = true)
    (height : batchCheck 8 rows8 = true)
    (hnine : batchCheck 9 rows9 = true) :
    ShortChecked P (shortWeightsFromSeparateRows rows7 rows8 rows9) where
  seven := shortWeightCheck_of_batchCheck (by decide) hcover7 hseven
  eight := shortWeightCheck_of_batchCheck (by decide) hcover8 height
  nine := shortWeightCheck_of_batchCheck (by decide) hcover9 hnine

end FranklSpanFour.Assembly
