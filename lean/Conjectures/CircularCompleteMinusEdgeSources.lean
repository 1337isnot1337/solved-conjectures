import Conjectures.CircularCompleteMinusEdgeRotation
import Conjectures.CircularCompleteMinusEdgeLevels
import Mathlib.Data.Finset.Max

/-!
# The unique source and sink

Step 2(2) of the recorded proof. The argument uses actual endpoint sets:
every ordinary color misses one vertex, while color zero misses three.
-/

namespace CircularCompleteMinusEdge

variable {V : Type*} [Fintype V] {G : SimpleGraph V} [Fintype G.edgeSet]
    {n : ℕ} [NeZero n]

def ProperColoring.IsSource (C : ProperColoring G n) (e : G.edgeSet) : Prop :=
  ∀ f, ¬ C.Arc f e

def ProperColoring.IsSink (C : ProperColoring G n) (e : G.edgeSet) : Prop :=
  ∀ f, ¬ C.Arc e f

omit [NeZero n] in
@[simp] theorem ProperColoring.mem_missing (C : ProperColoring G n) (i : Fin n) (v : V) :
    v ∈ C.missing i ↔ ∀ e, C.color e = i → v ∉ e.val := by
  classical
  simp [ProperColoring.missing]

theorem ProperColoring.source_iff_missing (C : ProperColoring G n) (hn : 2 ≤ n)
    (e : G.edgeSet) : C.IsSource e ↔ ∀ v ∈ e.val, v ∈ C.missing (C.color e - 1) := by
  classical
  constructor
  · intro hs v hv
    rw [C.mem_missing]
    intro f hf hvf
    apply hs f
    rw [C.arc_iff_add hn]
    refine ⟨?_, ⟨v, hvf, hv⟩, ?_⟩
    · intro hfe
      subst f
      have : (1 : Fin n) = 0 := by
        have hh := congrArg (fun z : Fin n => C.color e - z) hf
        simpa using hh.symm
      exact fin_one_ne_zero hn this
    · rw [hf, sub_add_cancel]
  · intro hm f hf
    rcases (C.arc_iff_add hn f e).mp hf with ⟨_, ⟨v, hvf, hve⟩, hcolor⟩
    have hmissing := (C.mem_missing _ v).mp (hm v hve)
    exact hmissing f (by rw [hcolor]; abel) hvf

theorem ProperColoring.sink_iff_missing (C : ProperColoring G n) (hn : 2 ≤ n)
    (e : G.edgeSet) : C.IsSink e ↔ ∀ v ∈ e.val, v ∈ C.missing (C.color e + 1) := by
  classical
  constructor
  · intro hs v hv
    rw [C.mem_missing]
    intro f hf hvf
    apply hs f
    rw [C.arc_iff_add hn]
    refine ⟨?_, ⟨v, hv, hvf⟩, hf⟩
    intro hef
    subst f
    have : (1 : Fin n) = 0 := by simpa using hf.symm
    exact fin_one_ne_zero hn this
  · intro hm f hf
    rcases (C.arc_iff_add hn e f).mp hf with ⟨_, ⟨v, hve, hvf⟩, hcolor⟩
    exact (C.mem_missing _ v).mp (hm v hve) f hcolor hvf

omit [Fintype V] [Fintype G.edgeSet] in
theorem endpoints_card_two [DecidableEq V] (e : G.edgeSet) : e.val.toFinset.card = 2 := by
  classical
  exact Sym2.card_toFinset_of_not_isDiag e.val (G.not_isDiag_of_mem_edgeSet e.property)

theorem edge_missing_color_zero (C : ProperColoring G n)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    (e : G.edgeSet) (i : Fin n) (he : ∀ v ∈ e.val, v ∈ C.missing i) : i = 0 := by
  classical
  by_contra hi
  have hsub : e.val.toFinset ⊆ C.missing i := by
    intro v hv
    exact he v (by simpa using hv)
  have hc := Finset.card_le_card hsub
  rw [endpoints_card_two, hmiss i hi] at hc
  omega

theorem ProperColoring.source_color (C : ProperColoring G n) (hn : 2 ≤ n)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    {e : G.edgeSet} (he : C.IsSource e) : C.color e = 1 := by
  exact sub_eq_zero.mp (edge_missing_color_zero C hmiss e (C.color e - 1)
    ((C.source_iff_missing hn e).mp he))

theorem ProperColoring.sink_color (C : ProperColoring G n) (hn : 2 ≤ n)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    {e : G.edgeSet} (he : C.IsSink e) : C.color e = -1 := by
  have hz := edge_missing_color_zero C hmiss e (C.color e + 1)
    ((C.sink_iff_missing hn e).mp he)
  exact eq_neg_of_add_eq_zero_left hz

omit [Fintype V] [NeZero n] in
theorem same_color_edges_in_three_eq (C : ProperColoring G n) (i : Fin n)
    (A : Finset V) (hA : A.card = 3) {e f : G.edgeSet}
    (he : C.color e = i) (hf : C.color f = i)
    (heA : ∀ v ∈ e.val, v ∈ A) (hfA : ∀ v ∈ f.val, v ∈ A) : e = f := by
  classical
  by_contra hef
  have hsubset : ({e, f} : Finset G.edgeSet) ⊆ C.colorClass i := by
    intro g hg
    simp only [Finset.mem_insert, Finset.mem_singleton] at hg
    rcases hg with rfl | rfl
    · exact (C.mem_colorClass i _).mpr he
    · exact (C.mem_colorClass i _).mpr hf
  have hM : IsEdgeMatching ({e, f} : Finset G.edgeSet) :=
    (C.colorClass_matching i).mono hsubset
  have hsub : covered ({e, f} : Finset G.edgeSet) ⊆ A := by
    intro v hv
    obtain ⟨g, hg, hvg⟩ := mem_covered.mp hv
    simp only [Finset.mem_insert, Finset.mem_singleton] at hg
    rcases hg with rfl | rfl
    · exact heA v hvg
    · exact hfA v hvg
  have hc := Finset.card_le_card hsub
  rw [covered_card hM, Finset.card_pair hef, hA] at hc
  omega

theorem ProperColoring.source_unique (C : ProperColoring G n) (hn : 2 ≤ n)
    (hsmall : (C.missing 0).card = 3)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    {e f : G.edgeSet} (he : C.IsSource e) (hf : C.IsSource f) : e = f := by
  have hec := C.source_color hn hmiss he
  have hfc := C.source_color hn hmiss hf
  apply same_color_edges_in_three_eq C 1 (C.missing 0) hsmall hec hfc
  · simpa only [hec, sub_self] using (C.source_iff_missing hn e).mp he
  · simpa only [hfc, sub_self] using (C.source_iff_missing hn f).mp hf

theorem ProperColoring.sink_unique (C : ProperColoring G n) (hn : 2 ≤ n)
    (hsmall : (C.missing 0).card = 3)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    {e f : G.edgeSet} (he : C.IsSink e) (hf : C.IsSink f) : e = f := by
  have hec := C.sink_color hn hmiss he
  have hfc := C.sink_color hn hmiss hf
  apply same_color_edges_in_three_eq C (-1) (C.missing 0) hsmall hec hfc
  · simpa only [hec, neg_add_cancel] using (C.sink_iff_missing hn e).mp he
  · simpa only [hfc, neg_add_cancel] using (C.sink_iff_missing hn f).mp hf

omit [Fintype V] [NeZero n] in
theorem ProperColoring.exists_source [Nonempty G.edgeSet]
    (C : ProperColoring G n) (hwf : WellFounded C.Arc) : ∃ e, C.IsSource e := by
  classical
  exact CircularCompleteMinusEdge.exists_source C.Arc hwf

omit [Fintype V] [NeZero n] in
theorem ProperColoring.exists_sink [Nonempty G.edgeSet]
    (C : ProperColoring G n) (hwf : WellFounded C.Arc) : ∃ e, C.IsSink e := by
  classical
  obtain ⟨e, _, he⟩ := Finset.exists_max_image Finset.univ (longestLevel C.Arc hwf)
    Finset.univ_nonempty
  refine ⟨e, fun f hf => ?_⟩
  exact (not_lt_of_ge (he f (Finset.mem_univ _))) (longestLevel_lt C.Arc hwf hf)

end CircularCompleteMinusEdge
