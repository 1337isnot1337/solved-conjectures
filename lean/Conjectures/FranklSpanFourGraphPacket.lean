module

public import Conjectures.FranklSpanFourGraphCertificate
public import Conjectures.FranklSpanFourWeightBatches

/-! Install the concrete initial graph in the general assembly packet.
The four remaining Boolean checks still concern actual local weights and
the final residual reduction. No abundance claim is a packet premise. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly FranklCyclic

def withGraph (P : Assembly.Packet) : Assembly.Packet :=
  { P with
    states := Certificate.states
    edges := Certificate.edges
    recurrent := Certificate.recurrent
    left4 := Certificate.left4
    rankPair := Certificate.rankPair
    rank4 := Certificate.rank4 }

theorem withGraph_states_checked (P : Assembly.Packet) :
    statesCheck (withGraph P) = true := by
  unfold statesCheck
  apply decide_eq_true
  exact Certificate.states_cover

theorem withGraph_edges_checked (P : Assembly.Packet) :
    edgesCheck (withGraph P) = true := by
  unfold edgesCheck
  apply decide_eq_true
  exact Certificate.edges_cover

theorem withGraph_pair_rank_checked (P : Assembly.Packet) :
    pairRankCheck (withGraph P) = true :=
  Certificate.pair_rank_checked

theorem withGraph_residual_rank_checked (P : Assembly.Packet) :
    residualRankCheck (withGraph P) = true := by
  change rankListCheck (Certificate.left4.map edge)
    (fun e => decide
      (List.ofFn (fun j : Fin 7 => letterCode (sevenOfEdge e j)) ∈
        FranklSmallCyclic.residualEdges)) Certificate.rank4 = true
  exact Certificate.residual_rank_checked

theorem withGraph_rows_covered (P : Assembly.Packet) :
    rowCoverageCheck (withGraph P) Certificate.canonicalRows = true :=
  rowCoverageCheck_of_partition rfl

theorem withGraph_checked_iff (P : Assembly.Packet) :
    Checked (withGraph P) ↔
      weight4Check (withGraph P) = true ∧
      extensionsCheck (withGraph P) = true ∧
      weight5Check (withGraph P) = true ∧
      finalRankCheck (withGraph P) = true := by
  constructor
  · intro h
    exact ⟨h.weight4, h.extensions, h.weight5, h.finalRank⟩
  · rintro ⟨hweight4, hextensions, hweight5, hfinal⟩
    exact
      { states := withGraph_states_checked P
        edges := withGraph_edges_checked P
        pairRank := withGraph_pair_rank_checked P
        weight4 := hweight4
        residualRank := withGraph_residual_rank_checked P
        extensions := hextensions
        weight5 := hweight5
        finalRank := hfinal }

end FranklSpanFour.Graph
