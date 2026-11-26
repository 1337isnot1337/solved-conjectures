import Conjectures.CircularThreeBlockInjective
import Conjectures.CircularInsertionSchedule

/-! The three-block construction as a finite simple graph for every permitted
decomposition of the interval into six- and ten-vertex pieces. -/

namespace CircularIndex.Insertion.ThreeBlock

private theorem near_of_small {p : ℕ} [NeZero p] (hp : 3≤p) {c d : Fin p}
    (hne : c≠d) (hlt : ((d.val : ZMod p)-(c.val : ZMod p)).val < 3) :
    Near p c.val d.val := by
  let k := ((d.val : ZMod p)-(c.val : ZMod p)).val
  have he : (c.val+k)%p = d.val := by
    have eqn : (c.val : ZMod p) + ((d.val : ZMod p)-(c.val : ZMod p)) = (d.val : ZMod p) := by abel
    have eqv := congrArg ZMod.val eqn
    rw [ZMod.val_add,ZMod.val_natCast_of_lt c.isLt,ZMod.val_natCast_of_lt d.isLt] at eqv
    exact eqv
  have hk : k < 3 := hlt
  have hc := c.isLt
  have hdiff : c.val≠d.val := fun h => hne (Fin.ext h)
  unfold Near
  by_cases h : c.val+k < p
  · rw [Nat.mod_eq_of_lt h] at he
    omega
  · rw [Nat.mod_eq_sub_mod (by omega : p≤c.val+k),Nat.mod_eq_of_lt (by omega)] at he
    omega

section
variable {g : ℕ} (hg : 15≤g) (K : Packing g)

noncomputable def endpoints (i : Fin (colours g) × Fin g) :
    Fin (vertexCount g) × Fin (vertexCount g) :=
  let z := rotatedPair g K i.1.val i.2.val
  let h := rotatedPair_bounds (K := K) hg i.1.isLt i.2.isLt
  (⟨z.1,h.1⟩,⟨z.2,h.2.1⟩)

noncomputable def scheduledPair (i : Fin (colours g) × Fin g) : Sym2 (Fin (vertexCount g)) :=
  s((endpoints hg K i).1,(endpoints hg K i).2)

theorem scheduledPair_loopless (i : Fin (colours g) × Fin g) :
    ¬(scheduledPair hg K i).IsDiag := by
  intro h
  exact (rotatedPair_bounds (K := K) hg i.1.isLt i.2.isLt).2.2
    (congrArg Fin.val (Sym2.mk_isDiag_iff.mp h))

theorem scheduledPair_inj : Function.Injective (scheduledPair hg K) := by
  intro i j h
  have he : SameEnds (rotatedPair g K i.1.val i.2.val).1 (rotatedPair g K i.1.val i.2.val).2
    (rotatedPair g K j.1.val j.2.val).1 (rotatedPair g K j.1.val j.2.val).2 := by
    rcases Sym2.eq_iff.mp h with ⟨ha,hb'⟩|⟨ha,hb'⟩
    · exact Or.inl ⟨congrArg Fin.val ha,congrArg Fin.val hb'⟩
    · exact Or.inr ⟨congrArg Fin.val ha,congrArg Fin.val hb'⟩
  obtain ⟨hc,hk⟩ := rotatedPair_inj (K := K) hg i.1.isLt j.1.isLt i.2.isLt j.2.isLt he
  exact Prod.ext (Fin.ext hc) (Fin.ext hk)

theorem scheduledPair_meeting (i j : Fin (colours g) × Fin g)
    (hv : ∃ v, v ∈ scheduledPair hg K i ∧ v ∈ scheduledPair hg K j) :
    Meeting (rotatedPair g K i.1.val i.2.val) (rotatedPair g K j.1.val j.2.val) := by
  obtain ⟨v,h₁,h₂⟩ := hv
  rcases Sym2.mem_iff.mp h₁ with h₁|h₁ <;> rcases Sym2.mem_iff.mp h₂ with h₂|h₂
  · exact Or.inl (congrArg Fin.val (h₁.symm.trans h₂))
  · exact Or.inr (Or.inl (congrArg Fin.val (h₁.symm.trans h₂)))
  · exact Or.inr (Or.inr (Or.inl (congrArg Fin.val (h₁.symm.trans h₂))))
  · exact Or.inr (Or.inr (Or.inr (congrArg Fin.val (h₁.symm.trans h₂))))

noncomputable def schedule : ClassSchedule (vertexCount g) (colours g) g where
  pair := scheduledPair hg K
  loopless := scheduledPair_loopless hg K
  pairs_injective := scheduledPair_inj hg K
  separated i j hne hv := by
    have hm := scheduledPair_meeting hg K i j hv
    by_cases hcol : i.1=j.1
    · have hm' : Meeting (rotatedPair g K i.1.val i.2.val) (rotatedPair g K i.1.val j.2.val) := by
        simpa only [hcol] using hm
      have hk := same_class_matching (K := K) hg i.1.isLt i.2.isLt j.2.isLt hm'
      exact False.elim (hne (Prod.ext hcol (Fin.ext hk)))
    · have hp : 3≤colours g := by unfold colours vertexCount; omega
      let _ : NeZero (colours g) := ⟨by omega⟩
      by_contra! hlt
      exact scheduled_window (K := K) hg i.1.isLt j.1.isLt i.2.isLt j.2.isLt
        (near_of_small hp hcol hlt) hm

end

theorem graph_degree_and_index {g : ℕ} (hg : 15≤g) (K : Packing g) :
    let S := schedule hg K
    (∀ v, S.graph.degree v ≤ 4*g+3) ∧ (∃ v, S.graph.degree v=4*g+3) ∧
    circularChromaticIndex S.graph=((4*g+3 : ℕ) : ℝ)+2/3 := by
  let S := schedule hg K
  have hp : 3≤colours g := by unfold colours vertexCount; omega
  have hp' : colours g=3*(4*g+3)+2 := by unfold colours vertexCount; omega
  let _ : NeZero (colours g) := ⟨by omega⟩
  have havg : vertexCount g*(4*g+3-1)<2*(colours g*g) := by
    unfold vertexCount colours
    change (6*g+1)*(4*g+2)<2*((2*(6*g+1)+9)*g)
    nlinarith
  have hdeg := S.max_degree _ hp' hp havg
  refine ⟨hdeg.1,hdeg.2,?_⟩
  rw [S.exact_index (by omega) rfl hp,hp']
  push_cast
  ring

end CircularIndex.Insertion.ThreeBlock
