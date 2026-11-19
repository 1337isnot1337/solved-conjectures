import Conjectures.LineSizeIncidences
import Conjectures.LineSizeFill
import Conjectures.LineSizeGraphCounts

/-! The selected finite graph counts actual distinct intersections of the
generic real-plane carriers. Its vertex degrees are actual line occupancies. -/
noncomputable section
namespace LineSize

theorem Arrangement.carrierPoints_pointsOfEdges (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card=n) (E : Finset (ℕ × ℕ))
    (hE : ∀ e ∈ E, e.1 < e.2 ∧ e.2 < n) (i : ℕ) (hi : i < n) :
    carrierPoints (A.pointsOfEdges hn E) (A.carrierAt hn i) =
      A.pointsOfEdges hn (E.filter (fun e => e.1=i ∨ e.2=i)) := by
  classical
  ext p
  rw [mem_carrierPoints]
  constructor
  · rintro ⟨hp,hon⟩
    obtain ⟨e,he,rfl⟩ := Finset.mem_image.mp hp
    have hindex := hE e he
    have hpair := (A.indexed_meet_on_iff hn e.1 e.2 i
      (by omega) hindex.2 hi hindex.1.ne).mp hon
    apply Finset.mem_image.mpr
    refine ⟨e,Finset.mem_filter.mpr ⟨he,?_⟩,rfl⟩
    rcases hpair with hfirst | hsecond
    · exact Or.inl hfirst.symm
    · exact Or.inr hsecond.symm
  · intro hp
    obtain ⟨e,he,rfl⟩ := Finset.mem_image.mp hp
    obtain ⟨he,hpair⟩ := Finset.mem_filter.mp he
    have hindex := hE e he
    refine ⟨Finset.mem_image.mpr ⟨e,he,rfl⟩,?_⟩
    apply (A.indexed_meet_on_iff hn e.1 e.2 i
      (by omega) hindex.2 hi hindex.1.ne).mpr
    rcases hpair with hfirst | hsecond
    · exact Or.inl hfirst.symm
    · exact Or.inr hsecond.symm

theorem Arrangement.card_carrierPoints_pointsOfEdges (A : Arrangement) {n : ℕ}
    (hn : A.carriers.card=n) (E : Finset (ℕ × ℕ))
    (hE : ∀ e ∈ E, e.1 < e.2 ∧ e.2 < n) (i : ℕ) (hi : i < n) :
    (carrierPoints (A.pointsOfEdges hn E) (A.carrierAt hn i)).card =
      (E.filter (fun e => e.1=i ∨ e.2=i)).card := by
  classical
  rw [A.carrierPoints_pointsOfEdges hn E hE i hi]
  apply A.card_pointsOfEdges
  intro e he
  exact hE e (Finset.mem_filter.mp he).1

theorem Arrangement.selected_point_degree (A : Arrangement) (d : ℕ → ℕ)
    (k r : ℕ) (hk : A.carriers.card=k) (i : ℕ) (hi : i < k) :
    (carrierPoints (A.pointsOfEdges hk (SelectedGraph.edges d k r))
      (A.carrierAt hk i)).card = SelectedGraph.degree d k r i := by
  classical
  rw [SelectedGraph.degree_eq_incident_card]
  apply A.card_carrierPoints_pointsOfEdges
  · intro e he
    have h := (SelectedGraph.mem_edges d k r e.1 e.2).mp he
    exact ⟨h.1,h.2.1⟩
  · exact hi

theorem Arrangement.selected_points_exist (A : Arrangement) (d : ℕ → ℕ)
    (k r : ℕ) (hk : A.carriers.card=k) :
    ∃ P : Finset Point, NoExtraLine A.carriers P ∧
      P.card=(SelectedGraph.edges d k r).card ∧
      ∀ i < k, (carrierPoints P (A.carrierAt hk i)).card=SelectedGraph.degree d k r i := by
  have hE : ∀ e ∈ SelectedGraph.edges d k r, e.1 < e.2 ∧ e.2 < k := by
    intro e he
    have h := (SelectedGraph.mem_edges d k r e.1 e.2).mp he
    exact ⟨h.1,h.2.1⟩
  exact ⟨A.pointsOfEdges hk (SelectedGraph.edges d k r),
    A.pointsOfEdges_noExtra hk _ hE,A.card_pointsOfEdges hk _ hE,
    fun i hi => A.selected_point_degree d k r hk i hi⟩

end LineSize
