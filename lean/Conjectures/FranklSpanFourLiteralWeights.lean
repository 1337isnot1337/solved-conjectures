module

public import Conjectures.FranklSpanFourLiteralWeightsCore
public import Conjectures.FranklSpanFourWeightBatches

/-! Supply the literal four-site weight field from checked ten-point rows.
Exact recurrent-word coverage and every arithmetic check remain premises. -/
@[expose] public section

namespace FranklSpanFour.Assembly

open FranklLocal FranklCyclic FranklSmallCyclic FranklSmallCyclic.Weights

def packetWithLiteralWeights (P : Packet) (rows : List Entry) : Packet :=
  { P with weights4 := weightsFromRows rows }

theorem weight4Check_of_literalBatch {P : Packet} {rows : List Entry}
    (hcover : rowCoverageCheck P rows = true)
    (hbatch : batchCheck 10 rows = true) :
    weight4Check (packetWithLiteralWeights P rows) = true := by
  change P.recurrent.all (fun v => decide (v ∈ P.left4) ||
    certificateCheck (localTiles 4 v) (windowCore 4) (weightsFromRows rows v)) = true
  apply List.all_eq_true.mpr
  intro v hv
  by_cases hleft : v ∈ P.left4
  · exact Bool.or_eq_true_iff.mpr (Or.inl (decide_eq_true hleft))
  · apply Bool.or_eq_true_iff.mpr
    apply Or.inr
    obtain ⟨he, hword⟩ := firstMatchingEntry_spec
      (rowCoverageCheck_sound hcover hv hleft)
    change certificateCheck (localTiles 4 v) (windowCore 4)
      (fun i : Fin 10 => siteWeights (firstMatchingEntry rows v) i.val) = true
    have hcert := LiteralWeights.batchCheck_certificate hbatch he
    simpa only [hword] using hcert

end FranklSpanFour.Assembly
