module

public import Conjectures.SteinkeZakynthinou.Learner
public import Conjectures.SteinkeZakynthinou.Geometric

/-! Likelihood comparison for aligned paths through a balanced tree. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou.Tree

theorem minimum_eq_add_of_leaf_eq_add (t : Tree) (c d : ℕ → ℝ) (a : ℝ)
    (h : ∀ p : t.Path, c (t.position p) = d (t.position p) + a) :
    t.minimum c = t.minimum d + a := by
  obtain ⟨p, hp⟩ := t.exists_minimum c
  obtain ⟨q, hq⟩ := t.exists_minimum d
  have hp' := t.minimum_le d p
  have hq' := t.minimum_le c q
  linarith [h p, h q]

noncomputable def gap (c : ℕ → ℝ) : Tree → ℝ
  | leaf _ => 0
  | fork l r => l.minimum c - r.minimum c

theorem abs_gap_sub_le_of_leaf_le (t : Tree) (c d : ℕ → ℝ) {a : ℝ} (ha : 0 ≤ a)
    (h : ∀ p : t.Path, |c (t.position p) - d (t.position p)| ≤ a) :
    |t.gap c - t.gap d| ≤ 2 * a := by
  cases t with
  | leaf => simp [gap]; positivity
  | fork l r =>
    have h₀ := l.abs_minimum_sub_le (fun p => h (Sum.inl p))
    have h₁ := r.abs_minimum_sub_le (fun p => h (Sum.inr p))
    simp only [gap]
    exact abs_le.mpr ⟨by linarith [(abs_le.mp h₀).1, (abs_le.mp h₁).2],
      by linarith [(abs_le.mp h₀).2, (abs_le.mp h₁).1]⟩

theorem gap_eq_of_leaf_eq_add (t : Tree) (c d : ℕ → ℝ) (a : ℝ)
    (h : ∀ p : t.Path, c (t.position p) = d (t.position p) + a) :
    t.gap c = t.gap d := by
  cases t with
  | leaf => rfl
  | fork l r =>
    simp only [gap]
    rw [l.minimum_eq_add_of_leaf_eq_add c d a (fun p => h (Sum.inl p)),
      r.minimum_eq_add_of_leaf_eq_add c d a (fun p => h (Sum.inr p))]
    ring

theorem position_mem_span (t : Tree) (p : t.Path) (q : Tree) (hq : q ∈ t.spans p) :
    ∃ r : q.Path, q.position r = t.position p := by
  induction t with
  | leaf => simp [spans] at hq
  | fork l r ihl ihr =>
    change Sum l.Path r.Path at p
    cases p with
    | inl p =>
      simp only [spans, List.mem_cons] at hq
      rcases hq with rfl | hq
      · exact ⟨Sum.inl p, rfl⟩
      · exact ihl p hq
    | inr p =>
      simp only [spans, List.mem_cons] at hq
      rcases hq with rfl | hq
      · exact ⟨Sum.inr p, rfl⟩
      · exact ihr p hq

theorem span_position_mem (t : Tree) (p : t.Path) (q : Tree) (hq : q ∈ t.spans p)
    (r : q.Path) :
    ∃ s : t.Path, t.position s = q.position r := by
  induction t with
  | leaf => simp [spans] at hq
  | fork l r' ihl ihr =>
    change Sum l.Path r'.Path at p
    cases p with
    | inl p =>
      simp only [spans, List.mem_cons] at hq
      rcases hq with rfl | hq
      · exact ⟨r, rfl⟩
      · obtain ⟨s, hs⟩ := ihl p hq
        exact ⟨Sum.inl s, hs⟩
    | inr p =>
      simp only [spans, List.mem_cons] at hq
      rcases hq with rfl | hq
      · exact ⟨r, rfl⟩
      · obtain ⟨s, hs⟩ := ihr p hq
        exact ⟨Sum.inr s, hs⟩

theorem length_logCharges (t : Tree) (c d scale : ℕ → ℝ) (k : ℕ) (p : t.Path) :
    (t.logCharges c d scale k p).length = (t.spans p).length := by
  induction t generalizing k with
  | leaf => rfl
  | fork l r ihl ihr =>
    change Sum l.Path r.Path at p
    cases p with
    | inl p => simp [logCharges, spans, ihl]
    | inr p => simp [logCharges, spans, ihr]

theorem abs_logCharge_le (t : Tree) (c d scale : ℕ → ℝ) (hs : ∀ j, 0 < scale j)
    (k : ℕ) (p : t.Path) (j : ℕ) (hj : j < (t.spans p).length) :
    |(t.logCharges c d scale k p)[j]'(by rwa [length_logCharges])| ≤
      |((t.spans p)[j]).gap c - ((t.spans p)[j]).gap d| / scale (k + j) := by
  induction t generalizing k j with
  | leaf => simp [spans] at hj
  | fork l r ihl ihr =>
    change Sum l.Path r.Path at p
    cases p with
    | inl p =>
      cases j with
      | zero =>
        simp only [logCharges, spans, List.getElem_cons_zero, gap, Nat.add_zero]
        simpa only [← sub_div, abs_div, abs_of_pos (hs k)] using
          abs_log_choice_sub_le ((l.minimum c - r.minimum c) / scale k)
            ((l.minimum d - r.minimum d) / scale k)
      | succ j =>
        simp only [logCharges, spans, List.getElem_cons_succ]
        rw [show k + (j + 1) = k + 1 + j by omega]
        exact ihl (k + 1) p j (Nat.lt_of_succ_lt_succ hj)
    | inr p =>
      cases j with
      | zero =>
        simp only [logCharges, spans, List.getElem_cons_zero, gap, Nat.add_zero]
        convert abs_log_choice_sub_le ((r.minimum c - l.minimum c) / scale k)
          ((r.minimum d - l.minimum d) / scale k) using 1
        rw [← sub_div, abs_div, abs_of_pos (hs k)]
        congr 1
        rw [← abs_neg]
        congr 1
        ring
      | succ j =>
        simp only [logCharges, spans, List.getElem_cons_succ]
        rw [show k + (j + 1) = k + 1 + j by omega]
        exact ihr (k + 1) p j (Nat.lt_of_succ_lt_succ hj)

noncomputable def activeDepths (t : Tree) (p : t.Path) (active : Tree → Prop) : Finset ℕ := by
  classical
  exact (Finset.range (t.spans p).length).filter
    (fun j => ∃ h : j < (t.spans p).length, active (t.spans p)[j])

theorem mem_activeDepths {t : Tree} {p : t.Path} {active : Tree → Prop} {j : ℕ} :
    j ∈ t.activeDepths p active ↔ ∃ h : j < (t.spans p).length, active (t.spans p)[j] := by
  classical
  unfold activeDepths
  simp only [Finset.mem_filter, Finset.mem_range]
  exact ⟨And.right, fun h => ⟨h.choose, h⟩⟩

private theorem list_sum_range (xs : List ℝ) :
    xs.sum = ∑ j ∈ Finset.range xs.length, (xs[j]?).getD 0 := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    rw [List.length_cons, Finset.sum_range_succ', List.sum_cons, ih]
    simp [add_comm]

theorem abs_log_probability_sub_le (t : Tree) (c d : ℕ → ℝ) {n : ℕ}
    (hn : 0 < n) (p : t.Path) (active : Tree → Prop)
    (h : ∀ j (hj : j < (t.spans p).length),
      |((t.spans p)[j]).gap c - ((t.spans p)[j]).gap d| ≤ 8)
    (hzero : ∀ j (hj : j < (t.spans p).length), ¬ active ((t.spans p)[j]) →
      ((t.spans p)[j]).gap c = ((t.spans p)[j]).gap d) :
    |Real.log (t.probability c (noiseScale n) 0 p) -
      Real.log (t.probability d (noiseScale n) 0 p)| ≤
      (∑ j ∈ t.activeDepths p active, (4 / 3 : ℝ)^j) / (32 * Real.sqrt n) := by
  classical
  let L := t.logCharges c d (noiseScale n) 0 p
  have hl : L.length = (t.spans p).length := length_logCharges _ _ _ _ _ _
  rw [← sum_logCharges]
  change |L.sum| ≤ _
  rw [list_sum_range, hl]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  rw [Finset.sum_div]
  unfold activeDepths
  rw [Finset.sum_filter]
  apply Finset.sum_le_sum
  intro j hj
  have hj' : j < (t.spans p).length := Finset.mem_range.mp hj
  rw [List.getElem?_eq_getElem (by rw [hl]; exact hj'), Option.getD_some]
  have hh := abs_logCharge_le t c d (noiseScale n) (noiseScale_pos hn) 0 p j hj'
  rw [Nat.zero_add] at hh
  by_cases ha : active (t.spans p)[j]
  · have hex : ∃ h : j < (t.spans p).length, active (t.spans p)[j] := ⟨hj', ha⟩
    rw [ite_eq_left hex]
    have hsc (j : ℕ) : (8 : ℝ) / noiseScale n j = (4 / 3 : ℝ)^j / (32 * Real.sqrt n) := by
      unfold noiseScale
      have h : (4 / 3 : ℝ)^j = 1 / (3 / 4 : ℝ)^j := by
        rw [← one_div_pow]
        norm_num
      rw [h]
      rw [div_div]
      ring
    simpa only [Nat.zero_add, hsc] using
      hh.trans (div_le_div_of_nonneg_right (h j hj') (noiseScale_pos hn j).le)
  · have hex : ¬ ∃ h : j < (t.spans p).length, active (t.spans p)[j] := fun h => ha h.choose_spec
    rw [ite_eq_right hex]
    simpa only [hzero j hj' ha, sub_self, abs_zero, zero_div] using hh

end SteinkeZakynthinou.Tree
