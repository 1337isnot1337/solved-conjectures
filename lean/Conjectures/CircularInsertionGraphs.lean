import Conjectures.CircularInsertionEdgeInjective
import Conjectures.CircularInsertionWindows
import Conjectures.CircularInsertionSchedule

/-! A cyclic schedule of actual edges on 6g+1 labelled vertices for both insertion graphs. -/

namespace CircularIndex.Insertion

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
variable {g blocks : ℕ} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)

noncomputable def endpoints (i : Fin (classCount g blocks) × Fin g) :
    Fin (vertexCount g) × Fin (vertexCount g) :=
  let z := rotatedPair g blocks i.1.val i.2.val
  let h := rotatedPair_bounds hg hb i.1.isLt i.2.isLt
  (⟨z.1,h.1⟩,⟨z.2,h.2.1⟩)

noncomputable def scheduledPair (i : Fin (classCount g blocks) × Fin g) : Sym2 (Fin (vertexCount g)) :=
  s((endpoints hg hb i).1,(endpoints hg hb i).2)

theorem scheduledPair_loopless (i : Fin (classCount g blocks) × Fin g) :
    ¬(scheduledPair hg hb i).IsDiag := by
  intro h
  exact (rotatedPair_bounds hg hb i.1.isLt i.2.isLt).2.2
    (congrArg Fin.val (Sym2.mk_isDiag_iff.mp h))

theorem scheduledPair_inj : Function.Injective (scheduledPair hg hb) := by
  intro i j h
  have he : SameEnds (rotatedPair g blocks i.1.val i.2.val).1 (rotatedPair g blocks i.1.val i.2.val).2
    (rotatedPair g blocks j.1.val j.2.val).1 (rotatedPair g blocks j.1.val j.2.val).2 := by
    rcases Sym2.eq_iff.mp h with ⟨ha,hb'⟩|⟨ha,hb'⟩
    · exact Or.inl ⟨congrArg Fin.val ha,congrArg Fin.val hb'⟩
    · exact Or.inr ⟨congrArg Fin.val ha,congrArg Fin.val hb'⟩
  obtain ⟨hc,hk⟩ := rotatedPair_inj hg hb i.1.isLt j.1.isLt i.2.isLt j.2.isLt he
  exact Prod.ext (Fin.ext hc) (Fin.ext hk)

theorem scheduledPair_meeting (i j : Fin (classCount g blocks) × Fin g)
    (hv : ∃ v, v ∈ scheduledPair hg hb i ∧ v ∈ scheduledPair hg hb j) :
    Meeting (rotatedPair g blocks i.1.val i.2.val) (rotatedPair g blocks j.1.val j.2.val) := by
  obtain ⟨v,h₁,h₂⟩ := hv
  rcases Sym2.mem_iff.mp h₁ with h₁|h₁ <;> rcases Sym2.mem_iff.mp h₂ with h₂|h₂
  · exact Or.inl (congrArg Fin.val (h₁.symm.trans h₂))
  · exact Or.inr (Or.inl (congrArg Fin.val (h₁.symm.trans h₂)))
  · exact Or.inr (Or.inr (Or.inl (congrArg Fin.val (h₁.symm.trans h₂))))
  · exact Or.inr (Or.inr (Or.inr (congrArg Fin.val (h₁.symm.trans h₂))))

noncomputable def insertionSchedule : ClassSchedule (vertexCount g) (classCount g blocks) g where
  pair := scheduledPair hg hb
  loopless := scheduledPair_loopless hg hb
  pairs_injective := scheduledPair_inj hg hb
  separated i j hne hv := by
    have hm := scheduledPair_meeting hg hb i j hv
    by_cases hcol : i.1=j.1
    · have hm' : Meeting (rotatedPair g blocks i.1.val i.2.val) (rotatedPair g blocks i.1.val j.2.val) := by
        simpa only [hcol] using hm
      have hk := same_class_matching hg hb i.1.isLt i.2.isLt j.2.isLt hm'
      exact False.elim (hne (Prod.ext hcol (Fin.ext hk)))
    · have hp : 3≤classCount g blocks := by unfold classCount vertexCount; omega
      let _ : NeZero (classCount g blocks) := ⟨by omega⟩
      by_contra! hlt
      exact scheduled_window hg hb i.1.isLt j.1.isLt i.2.isLt j.2.isLt
        (near_of_small hp hcol hlt) hm

end

/-- Both literal graphs from the one- and two-block constructions have the
stated maximum degree, with attainment, and exact real circular index. -/
theorem insertion_family {g blocks : ℕ} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2) :
    let S := insertionSchedule hg hb
    (∀ v, S.graph.degree v ≤ 4*g+blocks) ∧ (∃ v, S.graph.degree v = 4*g+blocks) ∧
    circularChromaticIndex S.graph = ((4*g+blocks : ℕ) : ℝ)+2/3 := by
  let S := insertionSchedule hg hb
  have hp : 3≤classCount g blocks := by unfold classCount vertexCount; omega
  have hp' : classCount g blocks = 3*(4*g+blocks)+2 := by unfold classCount vertexCount; omega
  let _ : NeZero (classCount g blocks) := ⟨by omega⟩
  have havg : vertexCount g*(4*g+blocks-1)<2*(classCount g blocks*g) := by
    rcases hb with rfl|rfl <;> unfold classCount vertexCount <;>
      simp only [Nat.add_sub_cancel,show 4*g+2-1=4*g+1 by omega] <;> nlinarith
  have hdeg := S.max_degree _ hp' hp havg
  refine ⟨hdeg.1,hdeg.2,?_⟩
  rw [S.exact_index (by omega) rfl hp,hp']
  push_cast
  ring

end CircularIndex.Insertion
