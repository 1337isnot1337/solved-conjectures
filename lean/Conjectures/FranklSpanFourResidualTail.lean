module

public import Conjectures.FranklSpanFourResidualTailAssembly
public import Conjectures.FranklSpanFourResidualTailCertificates

/-! The complete concrete residual tail: 48 extensions, 31 checked literal
width-five certificates, and a rank witness on the 17 remaining edges. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail

theorem tail_weight5_checked (P : Packet) : weight5Check (tailPacket P) = true :=
  tail_weight5_of_entries P (fun _ he => entries_checked_mem he)

theorem tail_checks (P : Packet) :
    extensionsCheck (tailPacket P) = true ∧ weight5Check (tailPacket P) = true ∧
      finalRankCheck (tailPacket P) = true :=
  ⟨tail_extensions_checked P, tail_weight5_checked P, tail_finalRank_checked P⟩

/-- Only the five earlier packet checks remain for an unwrapped packet.
Short-cycle certificates are still a separate assembly requirement. -/
theorem tail_checked (P : Packet)
    (hstates : statesCheck P = true) (hedges : edgesCheck P = true)
    (hpair : pairRankCheck P = true) (hweight4 : weight4Check P = true)
    (hresidual : residualRankCheck P = true) : Checked (tailPacket P) :=
  checked_tailPacket_of_entries P hstates hedges hpair hweight4 hresidual
    (fun _ he => entries_checked_mem he)

end FranklSpanFour.Assembly.ResidualTail
