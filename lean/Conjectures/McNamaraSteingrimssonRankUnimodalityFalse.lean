module

public import Conjectures.McNamaraSteingrimssonRanksExact
public import Conjectures.McNamaraSteingrimssonLiteralInterval

@[expose] public section
namespace McNamaraSteingrimsson

theorem repeatedEndpoints_comparable {n A K : ℕ} (a : Equiv.Perm (Fin A))
    (p : Equiv.Perm (Fin K)) (hAK : A≤K) :
    ClassicalPattern (repeatedPattern n a p hAK) (repeatedPattern (n+1) a p hAK) := by
  let miss : Fin (n+1) := 0
  apply classicalPattern_of_block_matches
    (repeatedWidths_le hAK) (repeatedWidths_le hAK) (repeatedOrders a p) (repeatedOrders a p)
    (skipBlockLabel miss) (skipBlockLabel_strictMono miss)
  intro i
  refine Fin.cases (motive := fun i => ClassicalPattern (repeatedOrders (n := n) a p i)
    (repeatedOrders (n := n+1) a p (skipBlockLabel miss i)))
    ((classicalPattern_same_size_iff_eq a a).mpr rfl)
    (fun j => (classicalPattern_same_size_iff_eq p p).mpr rfl) i

noncomputable def writtenSigma :=
  repeatedPattern 1627 writtenShort writtenLong writtenShort_lt_long.le

noncomputable def writtenTau :=
  repeatedPattern 1628 writtenShort writtenLong writtenShort_lt_long.le

theorem writtenRankCard_eq_intervalRankCard (r : ℕ) :
    intervalRankCard writtenSigma writtenTau r=writtenRankCard r := by
  change Nat.card (AbsoluteInterval writtenSigma writtenTau
    (Fintype.card (BlockPosition (repeatedWidths 1627 writtenShortLength writtenLongLength))+r))=_
  exact congrArg (fun m => Nat.card (AbsoluteInterval writtenSigma writtenTau (m+r)))
    (cardinal_repeatedBlocks 1627 writtenShortLength writtenLongLength)

/-- The literal classical permutation interval from the written
counterexample has a strict dip between ranks 44 and 46. -/
theorem writtenInterval_not_rankUnimodal :
    ClassicalPattern writtenSigma writtenTau ∧
    intervalRankCard writtenSigma writtenTau 44=8598793292661 ∧
    intervalRankCard writtenSigma writtenTau 45=8598464986146 ∧
    intervalRankCard writtenSigma writtenTau 46=8599053474845 ∧
    ¬IsRankUnimodal (intervalRankCard writtenSigma writtenTau) 67 := by
  have h44 := (writtenRankCard_eq_intervalRankCard 44).trans writtenRankCard_44
  have h45 := (writtenRankCard_eq_intervalRankCard 45).trans writtenRankCard_45
  have h46 := (writtenRankCard_eq_intervalRankCard 46).trans writtenRankCard_46
  refine ⟨repeatedEndpoints_comparable _ _ _,h44,h45,h46,?_⟩
  apply rank_dip_not_unimodal (r := 44) (by decide)
  · rw [h44,h45]
    decide
  · rw [h45,h46]
    decide

/-- Counterexample to interval rank-unimodality in the classical permutation
pattern poset, in the original all-finite-interval formulation. -/
theorem mcnamaraSteingrimsson_interval_rank_unimodality_false :
    ¬∀ (m n : ℕ) (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)),
      ClassicalPattern p q → IsRankUnimodal (intervalRankCard p q) (n-m) := by
  intro h
  let m := Fintype.card (BlockPosition (repeatedWidths 1627 writtenShortLength writtenLongLength))
  let n := Fintype.card (BlockPosition (repeatedWidths 1628 writtenShortLength writtenLongLength))
  have hf := h m n writtenSigma writtenTau writtenInterval_not_rankUnimodal.1
  obtain ⟨hm,hn⟩ := written_repeated_endpoint_sizes
  have hd : n-m=67 := (congrArg₂ Nat.sub hn hm).trans (show 109118-109051=67 from rfl)
  exact writtenInterval_not_rankUnimodal.2.2.2.2
    ((congrArg (fun d => IsRankUnimodal (intervalRankCard writtenSigma writtenTau) d) hd).mp hf)

end McNamaraSteingrimsson
