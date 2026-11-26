import Conjectures.CircularCompleteMinusEdgeTransversals
import Conjectures.CircularCompleteMinusEdgeGraph

/-!
# The linear order of the actual edge set

The conclusion of Step 3 of the recorded proof, obtained from its endpoint
expansion by the proved Hall reformulation. Consecutive positions are incident,
the colors are position plus one modulo the number of colors, and all original
directed arcs increase position.
-/

namespace CircularCompleteMinusEdge

open scoped Fin.NatCast

variable {V : Type*} [Fintype V] {G : SimpleGraph V} [Fintype G.edgeSet]
    {n : ℕ} [NeZero n]

structure LinearEdgeOrder (C : ProperColoring G n) where
  position : G.edgeSet ≃ Fin (Fintype.card G.edgeSet)
  arc_increases : ∀ e f, C.Arc e f → (position e).val < (position f).val
  consecutive : ∀ e f, (position f).val = (position e).val + 1 → Incident e f
  color_position : ∀ e, C.color e = (((position e).val + 1 : ℕ) : Fin n)

omit [Fintype V] in
theorem LinearEdgeOrder.same_color_forbidden {C : ProperColoring G n}
    (L : LinearEdgeOrder C) {e f : G.edgeSet}
    (hef : (L.position e).val < (L.position f).val) (hinc : Incident e f) :
    C.color e ≠ C.color f := by
  apply C.proper e f _ hinc
  intro h
  subst f
  exact lt_irrefl _ hef

omit [Fintype V] in
theorem LinearEdgeOrder.backward_color_forbidden {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (hn : 2 ≤ n) {e f : G.edgeSet}
    (hef : (L.position e).val < (L.position f).val) (hinc : Incident e f) :
    C.color e ≠ C.color f + 1 := by
  intro hc
  have hfe : f ≠ e := by
    intro h
    subst f
    exact lt_irrefl _ hef
  have h := L.arc_increases f e ((C.arc_iff_add hn f e).mpr ⟨hfe, incident_symm hinc, hc⟩)
  omega

omit [Fintype V] in
theorem pathMatching_color_level (C : ProperColoring G n) (hn : 2 ≤ n)
    (hwf : WellFounded C.Arc) (D : PathMatching C.Arc)
    (hs : C.color D.source = 1) (e : G.edgeSet) :
    C.color e = ((D.level hwf e + 1 : ℕ) : Fin n) := by
  have haux : ∀ k : ℕ, ∀ e : G.edgeSet, D.level hwf e = k → C.color e = ((k + 1 : ℕ) : Fin n) := by
    intro k
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro e he
      by_cases hk : k = 0
      · have heq := (D.level_zero_iff hwf e).mp (he.trans hk)
        rw [hk]
        simpa only [heq, Nat.zero_add, Nat.cast_one] using hs
      · obtain ⟨f, hfe, hlevel⟩ := D.level_predecessor hwf (by omega : 0 < D.level hwf e)
        have hcf := ih (D.level hwf f) (by omega) f rfl
        have hce := ((C.arc_iff_add hn f e).mp (D.selected_sub hfe)).2.2
        have hk' : k = D.level hwf f + 1 := by omega
        rw [hce, hcf, hk']
        simp only [Nat.cast_add, Nat.cast_one]
  exact haux (D.level hwf e) e rfl

theorem exists_linearEdgeOrder [Nonempty G.edgeSet] (C : ProperColoring G n)
    (hn : 2 ≤ n) (hwf : WellFounded C.Arc)
    (hsmall : (C.missing 0).card = 3)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1) :
    Nonempty (LinearEdgeOrder C) := by
  classical
  obtain ⟨source, hsource⟩ := C.exists_source hwf
  obtain ⟨sink, hsink⟩ := C.exists_sink hwf
  obtain ⟨D, hDs, _⟩ := exists_pathMatching C hn hsmall hmiss source sink hsource hsink
  have hs : C.color D.source = 1 := by
    rw [hDs]
    exact C.source_color hn hmiss hsource
  refine ⟨⟨D.orderEquiv hwf, ?_, ?_, ?_⟩⟩
  · intro e f hef
    exact D.level_lt_of_relation hwf hef
  · intro e f hef
    exact (D.relation_of_levels_consecutive hwf hef).2.1
  · exact pathMatching_color_level C hn hwf D hs

theorem real_coloring_gives_linear_order {h : ℕ} [NeZero (2 * h - 1)]
    [Nonempty G.edgeSet] (hh : 2 ≤ h)
    (hv : Fintype.card V = 2 * h - 1)
    (he : Fintype.card G.edgeSet = (2 * h - 1) * (h - 1) - 1)
    {r : ℝ} (C : CircularIndex.RealCircularEdgeColoring G r) (hr : r < 2 * h - 1) :
    ∃ C' : ProperColoring G (2 * h - 1), Nonempty (LinearEdgeOrder C') := by
  classical
  have hr' : r < ((2 * h - 1 : ℕ) : ℝ) := by
    simpa only [Nat.cast_sub (by omega : 1 ≤ 2 * h), Nat.cast_mul, Nat.cast_ofNat,
      Nat.cast_one] using hr
  let C₀ := floorColoring C hr'
  have hwf : WellFounded C₀.Arc := floorColoring_wellFounded C (by omega) hr'
  obtain ⟨C', hwf', hzero, hother⟩ := exists_normalized_coloring hh C₀ hwf hv he
  have hmzero : (C'.missing 0).card = 3 := by
    rw [C'.missing_card, hv, hzero]
    omega
  have hmiss (i : Fin (2 * h - 1)) (hi : i ≠ 0) : (C'.missing i).card = 1 := by
    rw [C'.missing_card, hv, hother i hi]
    omega
  exact ⟨C', exists_linearEdgeOrder C' (by omega) hwf' hmzero hmiss⟩

end CircularCompleteMinusEdge
