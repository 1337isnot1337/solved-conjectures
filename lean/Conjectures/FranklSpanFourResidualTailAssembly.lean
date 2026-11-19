module

public import Conjectures.FranklSpanFourResidualTailRank

/-! The concrete tail covers all 48 residual extensions. The arithmetic
entry proofs are the only input to its weight field; its final rank and
extension fields are unconditional finite certificates. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail

open FranklLocal FranklCyclic

def tailCoverageCheck : Bool :=
  residualExtensions.all (fun v => decide (v ∈ leftWords) ||
    entries.any (fun e => decide (entryWord e = v)))

set_option maxRecDepth 65536 in
set_option maxHeartbeats 4000000 in
theorem tail_coverage_checked : tailCoverageCheck = true := by
  decide +kernel

theorem tail_coverage {v : Word 8} (hv : v ∈ residualExtensions) :
    v ∈ leftWords ∨ ∃ e ∈ entries, entryWord e = v := by
  have h := List.all_eq_true.mp tail_coverage_checked v hv
  rcases Bool.or_eq_true_iff.mp h with h | h
  · exact Or.inl (of_decide_eq_true h)
  · obtain ⟨e, he, hv⟩ := List.any_eq_true.mp h
    exact Or.inr ⟨e, he, of_decide_eq_true hv⟩

def firstEntry (v : Word 8) : Entry :=
  (entries.find? (fun e => decide (entryWord e = v))).getD default

theorem firstEntry_spec {v : Word 8} (h : ∃ e ∈ entries, entryWord e = v) :
    firstEntry v ∈ entries ∧ entryWord (firstEntry v) = v := by
  unfold firstEntry
  cases hfind : entries.find? (fun e => decide (entryWord e = v)) with
  | none =>
      obtain ⟨e, he, hv⟩ := h
      exact False.elim (List.find?_eq_none.mp hfind e he (decide_eq_true hv))
  | some e =>
      change e ∈ entries ∧ entryWord e = v
      exact ⟨List.mem_of_find?_eq_some hfind,
        of_decide_eq_true (List.find?_some (p := fun e => decide (entryWord e = v)) hfind)⟩

def tailWeights (v : Word 8) : Fin 11 → ℕ := siteWeights (firstEntry v)

/-- Install exactly the checked residual extension list, survivor list,
weight lookup, and final rank. The earlier packet fields remain inputs. -/
def tailPacket (P : Packet) : Packet :=
  { P with
    extensions := residualExtensions
    left5 := leftWords
    weights5 := tailWeights
    rank5 := tailRank }

theorem tail_extensions_checked (P : Packet) : extensionsCheck (tailPacket P) = true := by
  apply extensionsCheck_of_residualExtensions_subset
  exact fun _ h => h

theorem tail_finalRank_checked (P : Packet) : finalRankCheck (tailPacket P) = true :=
  tail_rank_checked

theorem tail_weight5_of_entries (P : Packet)
    (hentries : ∀ e ∈ entries, entryCheck e = true) :
    weight5Check (tailPacket P) = true := by
  apply List.all_eq_true.mpr
  intro v hv
  rcases tail_coverage hv with hleft | hrow
  · exact Bool.or_eq_true_iff.mpr (Or.inl (decide_eq_true hleft))
  · apply Bool.or_eq_true_iff.mpr
    apply Or.inr
    obtain ⟨he, hword⟩ := firstEntry_spec hrow
    have h := entryCheck_certificate (hentries _ he)
    simpa only [hword, tailPacket, tailWeights] using h

/-- Five earlier finite checks plus the entry arithmetic complete the
full packet; no abundance proposition is an input. -/
theorem checked_tailPacket_of_entries (P : Packet)
    (hstates : statesCheck P = true) (hedges : edgesCheck P = true)
    (hpair : pairRankCheck P = true) (hweight4 : weight4Check P = true)
    (hresidual : residualRankCheck P = true)
    (hentries : ∀ e ∈ entries, entryCheck e = true) : Checked (tailPacket P) where
  states := hstates
  edges := hedges
  pairRank := hpair
  weight4 := hweight4
  residualRank := hresidual
  extensions := tail_extensions_checked P
  weight5 := tail_weight5_of_entries P hentries
  finalRank := tail_finalRank_checked P

theorem shortChecked_tailPacket {P : Packet} {Q : ShortWeights}
    (h : ShortChecked P Q) : ShortChecked (tailPacket P) Q :=
  ⟨h.seven, h.eight, h.nine⟩

end FranklSpanFour.Assembly.ResidualTail
