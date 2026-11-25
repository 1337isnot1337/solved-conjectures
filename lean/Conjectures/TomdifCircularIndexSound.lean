module

public import Conjectures.TomdifCircularIndexCertificates
public import Mathlib.Data.List.Nodup
public import Mathlib.Tactic

@[expose] public section
namespace CircularIndex.Tomdif

theorem occurs_iff {v : ℕ} {e : ColoredEdge} : occurs v e = true ↔
    v = e.left ∨ v = e.right := by simp [occurs]

theorem verified_ranges {d n : ℕ} {es : List ColoredEdge} (h : verified d n es = true)
    {e : ColoredEdge} (he : e ∈ es) : e.left < e.right ∧ e.right < n ∧ e.color < 3*d+2 := by
  simp only [verified, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at h
  exact h.1.1.1.2 e he

theorem verified_density {d n : ℕ} {es : List ColoredEdge} (h : verified d n es = true) :
    n%2=1 ∧ 0<n/2 ∧ (2*d+1)*(n/2)<2*es.length ∧
      3*es.length≤(3*d+2)*(n/2) ∧ 3*d+2<3*(d+1) := by
  simp only [verified, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h.1.1.1.1

theorem verified_degree_bound {d n : ℕ} {es : List ColoredEdge} (h : verified d n es = true)
    (v : Fin n) : (incident es v.val).length ≤ d := by
  simp only [verified, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at h
  exact (h.1.2 v.val (List.mem_range.mpr v.isLt)).1

theorem verified_degree_attained {d n : ℕ} {es : List ColoredEdge} (h : verified d n es = true) :
    ∃ v : Fin n, (incident es v.val).length = d := by
  simp only [verified, Bool.and_eq_true, List.any_eq_true, beq_iff_eq] at h
  obtain ⟨v,hv,hd⟩ := h.2
  exact ⟨⟨v,List.mem_range.mp hv⟩,hd⟩

theorem separated_symm {p : ℕ} {e f : ColoredEdge} (h : separated p e f = true) :
    separated p f e = true := by
  simpa [separated, and_comm] using h

theorem separated_of_mem {p : ℕ} {es : List ColoredEdge}
    (h : enoughSeparation p es = true) {e f : ColoredEdge} (he : e∈es) (hf : f∈es)
    (hne : e≠f) : separated p e f = true := by
  induction es with
  | nil => simp at he
  | cons a rest ih =>
    simp only [enoughSeparation, Bool.and_eq_true, List.all_eq_true] at h
    rcases List.mem_cons.mp he with heq | he
    · rcases List.mem_cons.mp hf with hfq | hf
      · exact (hne (heq.trans hfq.symm)).elim
      · rw [heq]
        exact h.1 f hf
    · rcases List.mem_cons.mp hf with hfq | hf
      · rw [hfq]
        exact separated_symm (h.1 e he)
      · exact ih h.2 he hf

theorem verified_separation {d n : ℕ} {es : List ColoredEdge} (h : verified d n es = true)
    (v : Fin n) {e f : ColoredEdge} (he : e∈incident es v.val) (hf : f∈incident es v.val)
    (hne : e≠f) : 3 ≤ (e.color+(3*d+2)-f.color)%(3*d+2) ∧
      3 ≤ (f.color+(3*d+2)-e.color)%(3*d+2) := by
  simp only [verified, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at h
  exact of_decide_eq_true (separated_of_mem (h.1.2 v.val (List.mem_range.mpr v.isLt)).2 he hf hne)

theorem ids_pairwise {n : ℕ} {es : List ColoredEdge} (h : strictlyIncreasingIds n es = true) :
    es.Pairwise (fun a b => edgeId n a < edgeId n b) := by
  induction es with
  | nil => simp
  | cons a rest ih =>
    cases rest with
    | nil => simp
    | cons b tail =>
      simp only [strictlyIncreasingIds, Bool.and_eq_true, decide_eq_true_eq] at h
      have ht := ih h.2
      refine List.pairwise_cons.mpr ⟨?_,ht⟩
      intro c hc
      rcases List.mem_cons.mp hc with rfl | hc
      · exact h.1
      · exact h.1.trans ((List.pairwise_cons.mp ht).1 c hc)

theorem verified_ids {d n : ℕ} {es : List ColoredEdge} (h : verified d n es = true) :
    es.Pairwise (fun a b => edgeId n a < edgeId n b) := by
  simp only [verified, Bool.and_eq_true] at h
  exact ids_pairwise h.1.1.2

theorem distinct_ids {n : ℕ} {es : List ColoredEdge}
    (h : es.Pairwise (fun a b => edgeId n a < edgeId n b)) {a b : ColoredEdge}
    (ha : a ∈ es) (hb : b ∈ es) (hab : edgeId n a = edgeId n b) : a=b := by
  induction es with
  | nil => simp at ha
  | cons e rest ih =>
    obtain ⟨hh,ht⟩ := List.pairwise_cons.mp h
    rcases List.mem_cons.mp ha with hae | ha <;> rcases List.mem_cons.mp hb with hbe | hb
    · exact hae.trans hbe.symm
    · rw [hae] at hab
      exact (hh b hb).ne hab |>.elim
    · rw [hbe] at hab
      exact (hh a ha).ne hab.symm |>.elim
    · exact ih ht ha hb

end CircularIndex.Tomdif
