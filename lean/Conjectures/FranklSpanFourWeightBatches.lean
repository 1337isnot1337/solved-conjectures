module

public import Conjectures.FranklSmallCyclicWeights
public import Conjectures.FranklSpanFourAssembly

/-! Connect literal short-cycle weight batches to the finite assembly packet.

The same row list may supply all three short periods. A separate coverage
check requires each recurrent word either to survive into the next graph
or to occur in the checked rows. No graph data or weight check is assumed
to have passed by these generic statements.
-/
@[expose] public section

namespace FranklSpanFour.Assembly

open FranklSmallCyclic FranklSmallCyclic.Weights

/-- Select the first row with the exact seven-letter word. The default is
used only outside the coverage hypothesis. -/
def firstMatchingEntry (rows : List Entry) (v : Word 7) : Entry :=
  (rows.find? (fun e => decide (shapeWord e = v))).getD ⟨[], []⟩

theorem firstMatchingEntry_spec {rows : List Entry} {v : Word 7}
    (h : ∃ e ∈ rows, shapeWord e = v) :
    firstMatchingEntry rows v ∈ rows ∧
      shapeWord (firstMatchingEntry rows v) = v := by
  unfold firstMatchingEntry
  cases hfind : rows.find? (fun e => decide (shapeWord e = v)) with
  | none =>
      obtain ⟨e, he, hv⟩ := h
      have hnot := List.find?_eq_none.mp hfind e he
      exact False.elim (hnot (decide_eq_true hv))
  | some e =>
      change e ∈ rows ∧ shapeWord e = v
      have hv : decide (shapeWord e = v) = true :=
        List.find?_some (p := fun e => decide (shapeWord e = v)) hfind
      exact ⟨List.mem_of_find?_eq_some hfind,
        of_decide_eq_true hv⟩

/-- Rows cover precisely the recurrent words removed by the first weight
step. The graph survivor list remains an explicit part of the packet. -/
def rowCoverageCheck (P : Packet) (rows : List Entry) : Bool :=
  P.recurrent.all (fun v => decide (v ∈ P.left4) ||
    rows.any (fun e => decide (shapeWord e = v)))

theorem rowCoverageCheck_sound {P : Packet} {rows : List Entry}
    (hc : rowCoverageCheck P rows = true) {v : Word 7}
    (hv : v ∈ P.recurrent) (hleft : v ∉ P.left4) :
    ∃ e ∈ rows, shapeWord e = v := by
  have h := List.all_eq_true.mp hc v hv
  rcases Bool.or_eq_true_iff.mp h with h | h
  · exact False.elim (hleft (of_decide_eq_true h))
  · obtain ⟨e, he, hv⟩ := List.any_eq_true.mp h
    exact ⟨e, he, of_decide_eq_true hv⟩

theorem rowCoverageCheck_eq_true_iff {P : Packet} {rows : List Entry} :
    rowCoverageCheck P rows = true ↔
      P.recurrent ⊆ P.left4 ++ rows.map shapeWord := by
  constructor
  · intro hc v hv
    by_cases hleft : v ∈ P.left4
    · exact List.mem_append_left _ hleft
    · obtain ⟨e, he, hv⟩ := rowCoverageCheck_sound hc hv hleft
      exact List.mem_append_right _ (List.mem_map.mpr ⟨e, he, hv⟩)
  · intro hcover
    apply List.all_eq_true.mpr
    intro v hv
    rcases List.mem_append.mp (hcover hv) with hleft | hrow
    · exact Bool.or_eq_true_iff.mpr (Or.inl (decide_eq_true hleft))
    · obtain ⟨e, he, hv⟩ := List.mem_map.mp hrow
      exact Bool.or_eq_true_iff.mpr (Or.inr
        (List.any_eq_true.mpr ⟨e, he, decide_eq_true hv⟩))

theorem rowCoverageCheck_of_partition {P : Packet} {rows : List Entry}
    (h : P.recurrent = P.left4 ++ rows.map shapeWord) :
    rowCoverageCheck P rows = true :=
  rowCoverageCheck_eq_true_iff.mpr (by rw [h])

def weightsFromRows {n : ℕ} (rows : List Entry) : Word 7 → Fin n → ℕ :=
  fun v i => siteWeights (firstMatchingEntry rows v) i.val

theorem extendWeights_siteWeights {n : ℕ} (hn : 7 ≤ n) (e : Entry) :
    extendWeights (fun i : Fin n => siteWeights e i.val) = siteWeights e := by
  funext i
  simp only [extendWeights]
  split_ifs with hi
  · rfl
  · have hout : ¬ (3 ≤ i ∧ i < 7) := by omega
    simp only [siteWeights, ite_eq_right hout]

theorem shortWeightCheck_of_batchCheck {n : ℕ} (hn : 7 ≤ n)
    {P : Packet} {rows : List Entry}
    (hcover : rowCoverageCheck P rows = true)
    (hbatch : batchCheck n rows = true) :
    shortWeightCheck n P (weightsFromRows rows) = true := by
  apply List.all_eq_true.mpr
  intro v hv
  by_cases hleft : v ∈ P.left4
  · exact Bool.or_eq_true_iff.mpr (Or.inl (decide_eq_true hleft))
  · apply Bool.or_eq_true_iff.mpr
    apply Or.inr
    obtain ⟨he, hword⟩ := firstMatchingEntry_spec
      (rowCoverageCheck_sound hcover hv hleft)
    have hcheck := batchCheck_entry hbatch he
    change MaskWindows.windowCheck n v
      (extendWeights (fun i : Fin n =>
        siteWeights (firstMatchingEntry rows v) i.val)) = true
    rw [extendWeights_siteWeights hn]
    simpa only [hword] using hcheck

def shortWeightsFromRows (rows : List Entry) : ShortWeights where
  weights7 := weightsFromRows rows
  weights8 := weightsFromRows rows
  weights9 := weightsFromRows rows

theorem shortChecked_of_batchChecks {P : Packet} {rows : List Entry}
    (hcover : rowCoverageCheck P rows = true)
    (hseven : batchCheck 7 rows = true)
    (height : batchCheck 8 rows = true)
    (hnine : batchCheck 9 rows = true) :
    ShortChecked P (shortWeightsFromRows rows) where
  seven := shortWeightCheck_of_batchCheck (by decide) hcover hseven
  eight := shortWeightCheck_of_batchCheck (by decide) hcover height
  nine := shortWeightCheck_of_batchCheck (by decide) hcover hnine

end FranklSpanFour.Assembly
