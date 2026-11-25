module

public import Conjectures.McNamaraSteingrimssonRepeatedCount

@[expose] public section
namespace McNamaraSteingrimsson

abbrev writtenShortLength := Fintype.card (LayerPosition alphaCaseWord)+1
abbrev writtenLongLength := Fintype.card (LayerPosition piCaseWord)+1

theorem writtenShortLength_eq : writtenShortLength=42 := by
  change Fintype.card (LayerPosition alphaCaseWord)+1=42
  rw [card_layerPosition,alpha_weight]

theorem writtenLongLength_eq : writtenLongLength=67 := by
  change Fintype.card (LayerPosition piCaseWord)+1=67
  rw [card_layerPosition,pi_weight]

noncomputable def writtenShort : Equiv.Perm (Fin writtenShortLength) :=
  pointedPermutation (layerPermutation alphaCaseWord)

noncomputable def writtenLong : Equiv.Perm (Fin writtenLongLength) :=
  pointedPermutation (layerPermutation piCaseWord)

theorem writtenShort_lt_long : writtenShortLength<writtenLongLength := by
  rw [writtenShortLength_eq,writtenLongLength_eq]
  decide

/-- The rank of the literal closed interval is the cardinality of its
set of intermediate permutations of the specified absolute length. -/
noncomputable def writtenRankCard (r : ℕ) : ℕ :=
  Nat.card (AbsoluteInterval
    (repeatedPattern 1627 writtenShort writtenLong writtenShort_lt_long.le)
    (repeatedPattern 1628 writtenShort writtenLong writtenShort_lt_long.le)
    (writtenShortLength+1627*writtenLongLength+r))

theorem writtenRankCard_convolution (r : ℕ) (hr : 42≤r) (hrK : r<67) :
    writtenRankCard r=1628*Nat.card (PatternDownsetAt writtenLong r) +
      ∑ k : Fin writtenShortLength,
        Nat.card (PatternDownsetAt writtenShort k.val) * Nat.choose 25 (r-k.val) := by
  have hA : 0<writtenShortLength := by rw [writtenShortLength_eq]; decide
  have hr' : 0<r := by omega
  have hrK' : r<writtenLongLength := by rwa [writtenLongLength_eq]
  have he := repeatedInterval_rank_count (a := writtenShort) (p := writtenLong) (n := 1627)
    writtenShort_lt_long hA (pointed_beginsWithMaximum _) (pointed_beginsWithMaximum _) hr' hrK'
  change writtenRankCard r = _ at he
  have ht := twoSummand_rank_count (a := alphaCaseWord) (b := piCaseWord) (by decide) hr'
  change Nat.card (AbsoluteInterval writtenShort (directSumPermutation writtenShort writtenLong)
    (writtenShortLength+r)) =
    Nat.card (PatternDownsetAt writtenLong r) + ∑ k : Fin writtenShortLength,
      Nat.card (PatternDownsetAt writtenShort k.val) *
        Nat.card (AbsoluteInterval writtenShort writtenLong (writtenShortLength+r-k.val)) at ht
  rw [he,ht]
  have hw (k : Fin writtenShortLength) :
      Nat.card (AbsoluteInterval writtenShort writtenLong (writtenShortLength+r-k.val)) =
        Nat.choose 25 (r-k.val) := by
    have hk : k.val<42 := k.isLt.trans_le writtenShortLength_eq.le
    have H : writtenShortLength+r-k.val=(41+(r-k.val))+1 := by
      have ha := writtenShortLength_eq
      omega
    rw [H]
    exact pointedWrittenEndpoints_rankCount (r-k.val)
  simp_rw [hw]
  ring

end McNamaraSteingrimsson
