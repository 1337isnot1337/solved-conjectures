module

public import Conjectures.FranklSpanFourGraphPacket
public import Conjectures.FranklSpanFourLiteralWeights
public import Conjectures.FranklSpanFourRowCoverage
public import Conjectures.FranklSpanFourResidualTail
public import Conjectures.FranklSmallCyclicTransportResults
public import Conjectures.FranklFamilyRelabel

/-! Candidate unconditional cyclic span-four theorem.

Every field of the finite packet is supplied by a concrete graph, weight,
coverage, or residual certificate. Acceptance requires the exact dependency
gates and the final composed source, all-owned audit, and stock-kernel gate.
The final statements retain arbitrary positive cycle lengths and arbitrary
ground labels. Families may omit the empty set. -/
@[expose] public section

namespace FranklSpanFour.Verified

open FranklLocal Assembly FranklSmallCyclic FranklSmallCyclic.TransportBatches

/-- Every field is replaced before the packet is used. -/
def seedPacket : Packet where
  states := []
  edges := []
  recurrent := []
  left4 := []
  extensions := []
  left5 := []
  rankPair := fun _ => 0
  rank4 := fun _ => 0
  rank5 := fun _ => 0
  weights4 := fun _ _ => 0
  weights5 := fun _ _ => 0

def graphPacket : Packet := Graph.withGraph seedPacket

def literalPacket : Packet :=
  packetWithLiteralWeights graphPacket Coverage.period10Entries

def packet : Packet := ResidualTail.tailPacket literalPacket

def shortWeights : ShortWeights :=
  shortWeightsFromSeparateRows
    Coverage.period7Entries Coverage.period8Entries Coverage.period9Entries

theorem canonical_rows_covered :
    rowCoverageCheck graphPacket
      (RowCoverage.originalEntries CanonicalWords.count CanonicalWords.wordAt) = true :=
  Graph.withGraph_rows_covered seedPacket

theorem rows_covered {chunks : List RowCoverage.Chunk}
    (hindexed : ∀ chunk ∈ chunks, RowCoverage.Indexed CanonicalWords.count chunk)
    (hcover : RowCoverage.Covers CanonicalWords.count chunks)
    (hwords : ∀ chunk ∈ chunks, RowCoverage.WordsAgree CanonicalWords.wordAt chunk) :
    rowCoverageCheck graphPacket (RowCoverage.entries chunks) = true :=
  rowCoverageCheck_of_indexed_chunks canonical_rows_covered hindexed hcover hwords

theorem period7_rows_covered : rowCoverageCheck graphPacket Coverage.period7Entries = true :=
  rows_covered Coverage.period7_indexed Coverage.period7_coverage Coverage.period7_words

theorem period8_rows_covered : rowCoverageCheck graphPacket Coverage.period8Entries = true :=
  rows_covered Coverage.period8_indexed Coverage.period8_coverage Coverage.period8_words

theorem period9_rows_covered : rowCoverageCheck graphPacket Coverage.period9Entries = true :=
  rows_covered Coverage.period9_indexed Coverage.period9_coverage Coverage.period9_words

theorem period10_rows_covered : rowCoverageCheck graphPacket Coverage.period10Entries = true :=
  rows_covered Coverage.period10_indexed Coverage.period10_coverage Coverage.period10_words

/-- Check the packet update with the graph and row data still abstract.
The concrete application below uses this opaque proof without expanding
its finite decision procedures. -/
private theorem checked_tail_literal (P : Packet)
    (rows : List FranklSmallCyclic.Weights.Entry)
    (hstates : statesCheck P = true) (hedges : edgesCheck P = true)
    (hpair : pairRankCheck P = true) (hresidual : residualRankCheck P = true)
    (hcover : rowCoverageCheck P rows = true)
    (hbatch : FranklSmallCyclic.Weights.batchCheck 10 rows = true) :
    Checked (ResidualTail.tailPacket (packetWithLiteralWeights P rows)) := by
  apply ResidualTail.tail_checked (packetWithLiteralWeights P rows)
  · exact hstates
  · exact hedges
  · exact hpair
  · exact weight4Check_of_literalBatch hcover hbatch
  · exact hresidual

private theorem shortChecked_tail_literal (P : Packet)
    (rows rows7 rows8 rows9 : List FranklSmallCyclic.Weights.Entry)
    (hcover7 : rowCoverageCheck P rows7 = true)
    (hcover8 : rowCoverageCheck P rows8 = true)
    (hcover9 : rowCoverageCheck P rows9 = true)
    (hseven : FranklSmallCyclic.Weights.batchCheck 7 rows7 = true)
    (height : FranklSmallCyclic.Weights.batchCheck 8 rows8 = true)
    (hnine : FranklSmallCyclic.Weights.batchCheck 9 rows9 = true) :
    ShortChecked (ResidualTail.tailPacket (packetWithLiteralWeights P rows))
      (shortWeightsFromSeparateRows rows7 rows8 rows9) := by
  apply ResidualTail.shortChecked_tailPacket
  exact shortChecked_of_separate_batches
    (P := packetWithLiteralWeights P rows)
    hcover7 hcover8 hcover9 hseven height hnine

theorem packet_checked : Checked packet :=
  checked_tail_literal graphPacket Coverage.period10Entries
    (Graph.withGraph_states_checked seedPacket)
    (Graph.withGraph_edges_checked seedPacket)
    (Graph.withGraph_pair_rank_checked seedPacket)
    (Graph.withGraph_residual_rank_checked seedPacket)
    period10_rows_covered period10_checked

theorem short_weights_checked : ShortChecked packet shortWeights :=
  shortChecked_tail_literal graphPacket Coverage.period10Entries
    Coverage.period7Entries Coverage.period8Entries Coverage.period9Entries
    period7_rows_covered period8_rows_covered period9_rows_covered
    period7_checked period8_checked period9_checked

variable {n : ℕ} [NeZero n]

theorem generators_abundant
    (G : Finset (Finset (ZMod n))) (hspan : SpanFourGenerators G)
    (hpos : ∃ g ∈ G, g.Nonempty) : ∃ x, Abundant (family G) x :=
  Assembly.generators_abundant packet shortWeights packet_checked short_weights_checked
    G hspan hpos

theorem generators_abundant_of_contained
    (G : Finset (Finset (ZMod n)))
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hpos : ∃ g ∈ G, g.Nonempty) : ∃ x, Abundant (family G) x :=
  Assembly.generators_abundant_of_contained
    packet shortWeights packet_checked short_weights_checked G hspan hpos

theorem family_abundant_of_generated_eq
    (F G : Finset (Finset (ZMod n)))
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hfamily : family G = insert ∅ F) (hpos : ∃ U ∈ F, U.Nonempty) :
    ∃ x, Abundant F x :=
  Assembly.family_abundant_of_generated_eq
    packet shortWeights packet_checked short_weights_checked F G hspan hfamily hpos

theorem unionClosed_family_abundant
    (F G : Finset (Finset (ZMod n))) (hu : Frankl.UnionClosed F) (hG : G ⊆ F)
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hcover : ∀ U ∈ F, ∃ H ⊆ G, unionOf H = U) (hpos : ∃ U ∈ F, U.Nonempty) :
    ∃ x, Abundant F x :=
  Assembly.unionClosed_family_abundant
    packet shortWeights packet_checked short_weights_checked F G hu hG hspan hcover hpos

/-- A chosen cyclic labeling transports both the generators and the actual
family frequencies. No normalization of generator sizes is assumed. -/
theorem unionClosed_family_abundant_of_cyclic_labels
    {α : Type*} [DecidableEq α] (e : α ≃ ZMod n)
    (F G : Finset (Finset α)) (hu : Frankl.UnionClosed F) (hG : G ⊆ F)
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g.image e ⊆ (Finset.univ : Finset (Fin 4)).image
        (fun j => p + (j.val : ZMod n)))
    (hcover : ∀ U ∈ F, ∃ H ⊆ G, unionOf H = U) (hpos : ∃ U ∈ F, U.Nonempty) :
    ∃ x, Abundant F x := by
  have hu' := Frankl.Relabel.unionClosed_mapFamily e hu
  have hG' : Frankl.Relabel.mapFamily e G ⊆ Frankl.Relabel.mapFamily e F :=
    Finset.image_subset_image hG
  have hspan' : ∀ g ∈ Frankl.Relabel.mapFamily e G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image
        (fun j => p + (j.val : ZMod n)) := by
    intro g hg
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hg
    exact hspan U hU
  have hcover' : ∀ U ∈ Frankl.Relabel.mapFamily e F,
      ∃ H ⊆ Frankl.Relabel.mapFamily e G, unionOf H = U := by
    intro U hU
    obtain ⟨V, hV, rfl⟩ := Finset.mem_image.mp hU
    obtain ⟨H, hHG, hHV⟩ := hcover V hV
    refine ⟨Frankl.Relabel.mapFamily e H, Finset.image_subset_image hHG, ?_⟩
    exact (Frankl.Relabel.unionOf_mapFamily e H).trans
      (congrArg (Frankl.Relabel.mapMember e) hHV)
  have hpos' : ∃ U ∈ Frankl.Relabel.mapFamily e F, U.Nonempty := by
    obtain ⟨U, hU, x, hx⟩ := hpos
    exact ⟨Frankl.Relabel.mapMember e U,
      Finset.mem_image_of_mem (Frankl.Relabel.mapMember e) hU, e x,
      (Frankl.Relabel.mem_mapMember e).mpr hx⟩
  obtain ⟨y, hy⟩ := unionClosed_family_abundant
    (Frankl.Relabel.mapFamily e F) (Frankl.Relabel.mapFamily e G)
    hu' hG' hspan' hcover' hpos'
  refine ⟨e.symm y, ?_⟩
  change Frankl.Abundant F (e.symm y)
  apply (Frankl.Relabel.abundant_mapFamily_iff e F (e.symm y)).mp
  change Frankl.Abundant (Frankl.Relabel.mapFamily e F) y at hy
  simpa only [Equiv.apply_symm_apply] using hy

omit [NeZero n] in
/-- The literal existence-of-a-common-cyclic-order formulation. -/
theorem unionClosed_family_abundant_of_cyclic_order
    {α : Type*} [DecidableEq α]
    (F G : Finset (Finset α)) (hu : Frankl.UnionClosed F) (hG : G ⊆ F)
    (horder : ∃ m : ℕ, 0 < m ∧ ∃ e : α ≃ ZMod m,
      ∀ g ∈ G, ∃ p : ZMod m,
        g.image e ⊆ (Finset.univ : Finset (Fin 4)).image
          (fun j => p + (j.val : ZMod m)))
    (hcover : ∀ U ∈ F, ∃ H ⊆ G, unionOf H = U) (hpos : ∃ U ∈ F, U.Nonempty) :
    ∃ x, Abundant F x := by
  obtain ⟨m, hm, e, hspan⟩ := horder
  let _ : NeZero m := ⟨by omega⟩
  exact unionClosed_family_abundant_of_cyclic_labels e F G hu hG hspan hcover hpos

end FranklSpanFour.Verified
