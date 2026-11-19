module

public import Conjectures.FranklSpanFourGraphEdgePilotData
public import Conjectures.FranklSpanFourGraphPrefixCertificate

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.EdgePilot

def codes : List ℕ :=
  edgeCodesFrom PrefixCertificate.level4 seeds (pairMaskCheck LocalData.pairRows)

theorem rank_checked : rankCodeCheck 6 codes kept ranks = true := by
  decide +kernel

theorem rank_semantic :
    FranklCyclic.rankListCheck ((decodeWords 7 codes).map Assembly.edge)
      (fun e => decide (Assembly.sevenOfEdge e ∈ decodeWords 7 kept.keys))
      (fun v => ranks.get (wordCode v)) = true :=
  rankCodeCheck_seven rank_checked

end FranklSpanFour.Graph.EdgePilot
