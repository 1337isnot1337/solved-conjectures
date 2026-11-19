module

public import Conjectures.FranklSpanFourResidualTailData

/-! A finite rank for the 17 surviving edges. Equal ranks retain only the zero loop. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail

open FranklCyclic

def leftWords : List (Word 8) := remainingRows.map (decodeWindow 8)

def tailRank (v : Word 7) : ℕ :=
  ((rankRows.find? (fun r => decide (r.1 = encodeWindow v))).getD ([], 0)).2

theorem leftWords_length : leftWords.length = 17 := by decide +kernel

theorem leftWords_nodup : leftWords.Nodup := by decide +kernel

set_option maxRecDepth 65536 in
set_option maxHeartbeats 4000000 in
theorem tail_rank_checked :
    rankListCheck (leftWords.map edge)
      (fun e => decide (e = ((fun _ => ∅), (fun _ => ∅)))) tailRank = true := by
  decide +kernel

theorem finalRankCheck_set_tail (P : Packet) :
    finalRankCheck { P with left5 := leftWords, rank5 := tailRank } = true :=
  tail_rank_checked

end FranklSpanFour.Assembly.ResidualTail
