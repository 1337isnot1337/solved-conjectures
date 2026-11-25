import Conjectures.KauersKoutschanBlockLengths

/-! A block's position is the sum of the lengths of earlier blocks in its chain. -/

open scoped BigOperators

namespace KauersKoutschan

def headChain {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) (b : BlockHeads s) : ℕ :=
  (p.symm b.1 : ℕ) % 2

def headPosition {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) (b : BlockHeads s) : ℕ :=
  (p.symm b.1 : ℕ) / 2

private def offsetCoordinate {n : ℕ} (s : Finset (Fin (n - 2)))
    (b : BlockHeads s) (k : Fin (runLength s b.1)) : BlockOffsets s :=
  let h := (admissibleOffset_iff_lt_runLength s b.1 k).mpr k.isLt
  ⟨(b.1, k), h.1, b.2, h.2⟩

private theorem placed_offsetCoordinate {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent)
    (b : BlockHeads s) (k : Fin (runLength s b.1)) :
    (placedBlockEquiv s p (offsetCoordinate s b k)).1 =
      (headChain p b, headPosition p b + (k : ℕ)) :=
  placedBlockEquiv_apply hp _

/-- Ordered blocks in the same chain have disjoint consecutive position intervals. -/
theorem ordered_blocks_do_not_overlap {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (b c : BlockHeads s)
    (hchain : headChain p b = headChain p c) (hpos : headPosition p b < headPosition p c) :
    headPosition p b + runLength s b.1 ≤ headPosition p c := by
  by_contra h
  let k : Fin (runLength s b.1) := ⟨headPosition p c - headPosition p b, by omega⟩
  let z : Fin (runLength s c.1) := ⟨0, runLength_pos s c.1⟩
  have hsame : placedBlockEquiv s p (offsetCoordinate s b k) =
      placedBlockEquiv s p (offsetCoordinate s c z) := by
    apply Subtype.ext
    rw [placed_offsetCoordinate hp b k, placed_offsetCoordinate hp c z, hchain]
    exact Prod.ext rfl (by dsimp [k, z]; omega)
  have hheads : (b.1 : ℕ) = c.1 :=
    congrArg (fun v : BlockOffsets s => v.1.1) ((placedBlockEquiv s p).injective hsame)
  have hbc : b = c := Subtype.ext (Fin.ext hheads)
  exact (lt_irrefl _) (hbc ▸ hpos)

private theorem headPosition_bound {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (b : BlockHeads s) :
    headPosition p b < (n + 1 - headChain p b) / 2 := by
  let z : Fin (runLength s b.1) := ⟨0, runLength_pos s b.1⟩
  have h := (placedBlockEquiv s p (offsetCoordinate s b z)).2
  rw [placed_offsetCoordinate hp b z] at h
  exact h.2

/-- Every position before a block is occupied by an earlier block in that chain. -/
theorem earlier_position_covered {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent)
    (b : BlockHeads s) (x : ℕ) (hx : x < headPosition p b) :
    ∃ (c : BlockHeads s) (k : Fin (runLength s c.1)),
      headChain p c = headChain p b ∧ headPosition p c < headPosition p b ∧
      headPosition p c + (k : ℕ) = x := by
  let row : PositionCoordinates n := ⟨(headChain p b, x), by
    constructor
    · unfold headChain; omega
    · exact lt_trans hx (headPosition_bound hp b)⟩
  let off := (placedBlockEquiv s p).symm row
  have hback : placedBlockEquiv s p off = row := (placedBlockEquiv s p).apply_symm_apply row
  obtain ⟨⟨c, j⟩, hb, hfirst, hj⟩ := off
  let cHead : BlockHeads s := ⟨⟨c, by omega⟩, hfirst⟩
  let k : Fin (runLength s cHead.1) :=
    ⟨j, (admissibleOffset_iff_lt_runLength s c j).mp ⟨hb, hj⟩⟩
  change placedBlockEquiv s p (offsetCoordinate s cHead k) = row at hback
  have hc := congrArg Subtype.val hback
  rw [placed_offsetCoordinate hp cHead k] at hc
  have heq := congrArg Prod.snd hc
  change headPosition p cHead + (k : ℕ) = x at heq
  exact ⟨cHead, k, congrArg Prod.fst hc, by omega, heq⟩

/-- Earlier values are exactly the disjoint blocks preceding the chosen head. -/
noncomputable def prefixBlockEquiv {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (b : BlockHeads s) :
    (Σ c : {c : BlockHeads s // headChain p c = headChain p b ∧ headPosition p c < headPosition p b},
      Fin (runLength s c.1.1)) ≃ Fin (headPosition p b) := by
  classical
  refine Equiv.ofBijective (fun q => ⟨headPosition p q.1.1 + (q.2 : ℕ), ?_⟩) ⟨?_, ?_⟩
  · have h := ordered_blocks_do_not_overlap hp q.1.1 b q.1.2.1 q.1.2.2
    have hk := q.2.isLt
    omega
  · rintro ⟨c, j⟩ ⟨d, k⟩ h
    have heq : headPosition p c.1 + (j : ℕ) = headPosition p d.1 + (k : ℕ) := congrArg Fin.val h
    have hpos : placedBlockEquiv s p (offsetCoordinate s c.1 j) =
        placedBlockEquiv s p (offsetCoordinate s d.1 k) := by
      apply Subtype.ext
      rw [placed_offsetCoordinate hp c.1 j, placed_offsetCoordinate hp d.1 k, c.2.1, d.2.1, heq]
    have hcoords := congrArg Subtype.val ((placedBlockEquiv s p).injective hpos)
    have hhead : c = d := Subtype.ext (Subtype.ext (Fin.ext (congrArg Prod.fst hcoords)))
    subst d
    have hjk : j = k := Fin.ext (congrArg Prod.snd hcoords)
    rw [hjk]
  · intro x
    obtain ⟨c, k, hchain, hpos, heq⟩ := earlier_position_covered hp b x x.isLt
    exact ⟨⟨⟨c, hchain, hpos⟩, k⟩, Fin.ext heq⟩

/-- Block heads are located at the cumulative lengths of their predecessors. -/
theorem headPosition_eq_prefix_lengths {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (b : BlockHeads s) :
    (∑ c : {c : BlockHeads s // headChain p c = headChain p b ∧ headPosition p c < headPosition p b},
      runLength s c.1.1) = headPosition p b := by
  classical
  have h := Fintype.card_congr (prefixBlockEquiv hp b)
  simpa [Fintype.card_sigma] using h

end KauersKoutschan
