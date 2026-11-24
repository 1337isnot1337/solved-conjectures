import Conjectures.CircularCompleteMinusEdgeSources
import Conjectures.CircularCompleteMinusEdgePath

/-!
# Assembling the color transversals

The source's endpoint inequalities E1 and E2 are applied to each color class.
Their Hall transversals together give a bijection from all edges except the
sink to all edges except the source, along actual directed color arcs.
-/

namespace CircularCompleteMinusEdge

variable {V : Type*} [Fintype V] [DecidableEq V] {G : SimpleGraph V} [Fintype G.edgeSet]
    {n : ℕ} [NeZero n]

omit [Fintype V] [Fintype G.edgeSet] in
theorem covered_erase_disjoint {M : Finset G.edgeSet} (hM : IsEdgeMatching M)
    {e : G.edgeSet} (he : e ∈ M) : ∀ v ∈ covered (M.erase e), v ∉ e.val := by
  classical
  intro v hv hve
  obtain ⟨f, hf, hvf⟩ := mem_covered.mp hv
  have hfe := hM f (Finset.mem_erase.mp hf).2 e he ⟨v, hvf, hve⟩
  exact (Finset.mem_erase.mp hf).1 hfe

noncomputable def ProperColoring.nextDomain (C : ProperColoring G n)
    (sink : G.edgeSet) (i : Fin n) : Finset G.edgeSet := by
  classical
  exact (C.colorClass i).erase sink

theorem ProperColoring.nextDomain_expansion (C : ProperColoring G n) (hn : 2 ≤ n)
    (hsmall : (C.missing 0).card = 3)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    {sink : G.edgeSet} (hsink : C.IsSink sink) (i : Fin n) :
    (covered (C.nextDomain sink i) \ covered (C.colorClass (i + 1))).card ≤ 1 := by
  classical
  by_cases hi : i + 1 = 0
  · have hic : i = -1 := eq_neg_of_add_eq_zero_left hi
    have hsc : C.color sink = i := (C.sink_color hn hmiss hsink).trans hic.symm
    have hmem : sink ∈ C.colorClass i := (C.mem_colorClass i sink).mpr hsc
    have hsA : sink.val.toFinset ⊆ C.missing 0 := by
      intro v hv
      have h := (C.sink_iff_missing hn sink).mp hsink v (by simpa using hv)
      simpa only [hsc, hi] using h
    have hbound : (C.missing 0 \ sink.val.toFinset).card = 1 := by
      rw [Finset.card_sdiff_of_subset hsA, hsmall, endpoints_card_two]
    rw [hi]
    apply (Finset.card_le_card ?_).trans hbound.le
    intro v hv
    obtain ⟨hdom, hnot⟩ := Finset.mem_sdiff.mp hv
    refine Finset.mem_sdiff.mpr ⟨?_, ?_⟩
    · apply (C.mem_missing 0 v).mpr
      intro e he hve
      exact hnot (mem_covered.mpr ⟨e, (C.mem_colorClass 0 e).mpr he, hve⟩)
    · simpa using covered_erase_disjoint (C.colorClass_matching i) hmem v hdom
  · apply (Finset.card_le_card ?_).trans (hmiss (i + 1) hi).le
    intro v hv
    apply (C.mem_missing (i + 1) v).mpr
    intro e he hve
    exact (Finset.mem_sdiff.mp hv).2
      (mem_covered.mpr ⟨e, (C.mem_colorClass (i + 1) e).mpr he, hve⟩)

theorem exists_pathMatching (C : ProperColoring G n) (hn : 2 ≤ n)
    (hsmall : (C.missing 0).card = 3)
    (hmiss : ∀ i : Fin n, i ≠ 0 → (C.missing i).card = 1)
    (source sink : G.edgeSet) (hsource : C.IsSource source) (hsink : C.IsSink sink) :
    ∃ D : PathMatching C.Arc, D.source = source ∧ D.sink = sink := by
  classical
  have htrans (i : Fin n) :
      ∃ f : {e // e ∈ C.nextDomain sink i} → {e // e ∈ C.colorClass (i + 1)},
        Function.Injective f ∧ ∀ e, Incident e.val (f e).val := by
    apply matching_transversal
    · exact (C.colorClass_matching i).mono (Finset.erase_subset _ _)
    · exact C.nextDomain_expansion hn hsmall hmiss hsink i
  choose f hfinj hfinc using htrans
  have hf_same (i j : Fin n) (hij : i = j) (e : G.edgeSet)
      (hi : e ∈ C.nextDomain sink i) (hj : e ∈ C.nextDomain sink j) :
      (f i ⟨e, hi⟩).val = (f j ⟨e, hj⟩).val := by
    subst j
    rfl
  have hin (e : {e : G.edgeSet // e ≠ sink}) : e.val ∈ C.nextDomain sink (C.color e.val) := by
    simp [ProperColoring.nextDomain, e.property]
  let F : {e : G.edgeSet // e ≠ sink} → G.edgeSet :=
    fun e => (f (C.color e.val) ⟨e.val, hin e⟩).val
  have hcolor (e : {e : G.edgeSet // e ≠ sink}) : C.color (F e) = C.color e.val + 1 :=
    (C.mem_colorClass _ _).mp (f (C.color e.val) ⟨e.val, hin e⟩).property
  have hArc (e : {e : G.edgeSet // e ≠ sink}) : C.Arc e.val (F e) := by
    rw [C.arc_iff_add hn]
    refine ⟨?_, hfinc (C.color e.val) ⟨e.val, hin e⟩, hcolor e⟩
    intro he
    have hc : C.color e.val = C.color e.val + 1 := by simpa only [← he] using hcolor e
    have : (1 : Fin n) = 0 := by simpa using hc.symm
    exact fin_one_ne_zero hn this
  have hF_inj : Function.Injective F := by
    intro a b hab
    have hcol : C.color a.val = C.color b.val := by
      apply add_right_cancel (b := (1 : Fin n))
      rw [← hcolor a, ← hcolor b, hab]
    have ha : a.val ∈ C.nextDomain sink (C.color b.val) := by simpa only [hcol] using hin a
    have hfa : (f (C.color b.val) ⟨a.val, ha⟩).val = F a := by
      exact hf_same _ _ hcol.symm a.val ha (hin a)
    have hh : f (C.color b.val) ⟨a.val, ha⟩ = f (C.color b.val) ⟨b.val, hin b⟩ := by
      apply Subtype.ext
      exact hfa.trans hab
    have heq := congrArg Subtype.val (hfinj _ hh)
    exact Subtype.ext heq
  have hav (e : {e : G.edgeSet // e ≠ sink}) : F e ≠ source := by
    intro he
    exact hsource e.val (he ▸ hArc e)
  let F' : {e : G.edgeSet // e ≠ sink} → {e : G.edgeSet // e ≠ source} :=
    fun e => ⟨F e, hav e⟩
  have hbij : Function.Bijective F' := by
    apply (Fintype.bijective_iff_injective_and_card F').mpr
    constructor
    · intro a b h
      exact hF_inj (congrArg Subtype.val h)
    · simp only [Fintype.card_subtype_compl, Fintype.card_subtype_eq]
  refine ⟨⟨source, sink, Equiv.ofBijective F' hbij, ?_⟩, rfl, rfl⟩
  intro e
  exact hArc e

end CircularCompleteMinusEdge
