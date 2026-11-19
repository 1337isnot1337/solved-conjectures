module

public import Conjectures.FranklSpanFourGraphPairCheck000
public import Conjectures.FranklSpanFourGraphPairCheck001
public import Conjectures.FranklSpanFourGraphPairCheck002
public import Conjectures.FranklSpanFourGraphPairCheck003
public import Conjectures.FranklSpanFourGraphPairCheck004
public import Conjectures.FranklSpanFourGraphPairCheck005
public import Conjectures.FranklSpanFourGraphPairCheck006
public import Conjectures.FranklSpanFourGraphPairCheck007
public import Conjectures.FranklSpanFourGraphPairCheck008
public import Conjectures.FranklSpanFourGraphPairCheck009
public import Conjectures.FranklSpanFourGraphPairCheck010
public import Conjectures.FranklSpanFourGraphPairCheck011
public import Conjectures.FranklSpanFourGraphPairCheck012
public import Conjectures.FranklSpanFourGraphPairCheck013
public import Conjectures.FranklSpanFourGraphPairCheck014
public import Conjectures.FranklSpanFourGraphPairCheck015
public import Conjectures.FranklSpanFourGraphPairCheck016
public import Conjectures.FranklSpanFourGraphPairCheck017
public import Conjectures.FranklSpanFourGraphPairCheck018
public import Conjectures.FranklSpanFourGraphPairCheck019
public import Conjectures.FranklSpanFourGraphPairCheck020
public import Conjectures.FranklSpanFourGraphPairCheck021
public import Conjectures.FranklSpanFourGraphPairCheck022
public import Conjectures.FranklSpanFourGraphPairCheck023
public import Conjectures.FranklSpanFourGraphPairCheck024
public import Conjectures.FranklSpanFourGraphPairCheck025
public import Conjectures.FranklSpanFourGraphPairCheck026
public import Conjectures.FranklSpanFourGraphPairCheck027
public import Conjectures.FranklSpanFourGraphPairCheck028
public import Conjectures.FranklSpanFourGraphPairCheck029
public import Conjectures.FranklSpanFourGraphPairCheck030
public import Conjectures.FranklSpanFourGraphPairCheck031
public import Conjectures.FranklSpanFourGraphPairCheck032
public import Conjectures.FranklSpanFourGraphPairCheck033
public import Conjectures.FranklSpanFourGraphRetained
public import Conjectures.FranklSpanFourGraphWordLists

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

def states : List (Assembly.Word 6) :=
  decodeWords 6 (sixCodes PrefixCertificate.level4)

def edges : List (Assembly.Word 7) :=
  decodeWords 7 (edgeCodes PrefixCertificate.level4 (pairMaskCheck LocalData.pairRows))

def rankPair (v : Assembly.Word 6) : ℕ := pairRanks.get (wordCode v)

theorem states_cover (v : Assembly.Word 6) (hv : windowAdmissibleCheck 3 v = true) :
    v ∈ states :=
  PrefixCertificate.states_cover v hv

theorem edges_cover (v : Assembly.Word 7)
    (hp : FranklCyclic.wordPrefix v ∈ states) (hs : FranklCyclic.wordSuffix v ∈ states)
    (hn : FranklCyclic.windowPairCheck v = false) : v ∈ edges :=
  PrefixCertificate.edges_cover v hp hs hn

theorem pair_rank_codes_checked :
    rankCodeCheck 6
      (edgeCodes PrefixCertificate.level4 (pairMaskCheck LocalData.pairRows))
      pairKept pairRanks = true := by
  change rankCodeCheck 6
    (edgeCodesFrom PrefixCertificate.level4 PrefixCertificate.level4.keys
      (pairMaskCheck LocalData.pairRows)) pairKept pairRanks = true
  rw [← seedChunks_exact, rankCodeCheck_edgeChunks]
  simp only [seedChunks, List.all_append, List.all_nil, pairBatch000_checked, pairBatch001_checked, pairBatch002_checked, pairBatch003_checked, pairBatch004_checked, pairBatch005_checked, pairBatch006_checked, pairBatch007_checked, pairBatch008_checked, pairBatch009_checked, pairBatch010_checked, pairBatch011_checked, pairBatch012_checked, pairBatch013_checked, pairBatch014_checked, pairBatch015_checked, pairBatch016_checked, pairBatch017_checked, pairBatch018_checked, pairBatch019_checked, pairBatch020_checked, pairBatch021_checked, pairBatch022_checked, pairBatch023_checked, pairBatch024_checked, pairBatch025_checked, pairBatch026_checked, pairBatch027_checked, pairBatch028_checked, pairBatch029_checked, pairBatch030_checked, pairBatch031_checked, pairBatch032_checked, pairBatch033_checked, Bool.true_and]

theorem pair_rank_checked :
    FranklCyclic.rankListCheck (edges.map Assembly.edge)
      (fun e => decide (Assembly.sevenOfEdge e ∈ recurrent)) rankPair = true := by
  change FranklCyclic.rankListCheck (edges.map Assembly.edge)
    (fun e => decide (Assembly.sevenOfEdge e ∈ recurrent))
    (fun v => pairRanks.get (wordCode v)) = true
  simpa only [edges, recurrent, left4, ← canonicalRows_decoded] using
    rankCodeCheck_seven_partition pair_rank_codes_checked retained_partition_checked

end FranklSpanFour.Graph.Certificate
