module

public import Conjectures.SteinkeZakynthinou.Statement
public import Mathlib.Order.Prod.Lex.Basic
public import Mathlib.Data.Finset.Lattice.Fold
public import Mathlib.MeasureTheory.Order.Lattice
public import Mathlib.Tactic.Linarith

/-! Label-first tie handling and proper finite real thresholds. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace SteinkeZakynthinou

abbrev Key := ℝ ×ₗ (Bool ×ₗ ℕ)

/-- Ties in the feature are ordered with positive labels first. Tags
distinguish observations having both the same feature and the same label. -/
def key (z : Observation) (tag : ℕ) : Key :=
  toLex (z.1, toLex (!z.2, tag))

noncomputable def virtualPredict {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (q : Option (Fin n)) (i : Fin n) : Bool :=
  match q with
  | none => false
  | some k => decide (key (z k) (tag k) ≤ key (z i) (tag i))

noncomputable def virtualLoss {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (q : Option (Fin n)) : ℝ :=
  ∑ i, if virtualPredict z tag q i = (z i).2 then 0 else 1

noncomputable def sampleMaximum {n : ℕ} (hn : 0 < n) (z : Sample n) : ℝ :=
  Finset.univ.sup' ⟨⟨0, hn⟩, Finset.mem_univ _⟩ (fun i => (z i).1)

theorem feature_le_sampleMaximum {n : ℕ} (hn : 0 < n) (z : Sample n) (i : Fin n) :
    (z i).1 ≤ sampleMaximum hn z :=
  Finset.le_sup' (f := fun i => (z i).1) (Finset.mem_univ i)

/-- The successor feature, with the all-zero threshold as a fallback. -/
noncomputable def upperEndpoint {n : ℕ} (hn : 0 < n) (z : Sample n) (w : ℝ) : ℝ :=
  Finset.univ.inf' ⟨⟨0, hn⟩, Finset.mem_univ _⟩ fun i =>
    if w < (z i).1 then (z i).1 else sampleMaximum hn z + 1

theorem upperEndpoint_le_iff {n : ℕ} (hn : 0 < n) (z : Sample n) (w : ℝ) (i : Fin n) :
    upperEndpoint hn z w ≤ (z i).1 ↔ w < (z i).1 := by
  classical
  unfold upperEndpoint
  erw [Finset.inf'_le_iff]
  constructor
  · rintro ⟨j, _, hj⟩
    split at hj
    · rename_i h
      exact h.trans_le hj
    · linarith [feature_le_sampleMaximum hn z i]
  · intro hi
    exact ⟨i, Finset.mem_univ _, by simp [hi]⟩

noncomputable def properEndpoint {n : ℕ} (hn : 0 < n) (z : Sample n)
    (q : Option (Fin n)) : ℝ :=
  match q with
  | none => sampleMaximum hn z + 1
  | some i => if (z i).2 then (z i).1 else upperEndpoint hn z (z i).1

private theorem round_one {n : ℕ} (hn : 0 < n) (z : Sample n) (tag : Fin n → ℕ)
    (q : Option (Fin n)) (i : Fin n) :
    (if (decide (properEndpoint hn z q ≤ (z i).1) : Bool) = (z i).2 then 0 else 1 : ℝ) ≤
      if virtualPredict z tag q i = (z i).2 then 0 else 1 := by
  cases q with
  | none =>
    have h : ¬ sampleMaximum hn z + 1 ≤ (z i).1 := by
      linarith [feature_le_sampleMaximum hn z i]
    simp [properEndpoint, virtualPredict, h]
  | some k =>
    rcases lt_trichotomy (z k).1 (z i).1 with h | h | h
    · have hv : key (z k) (tag k) ≤ key (z i) (tag i) :=
        Prod.Lex.toLex_le_toLex.mpr (Or.inl h)
      have hl : (z k).1 ≤ (z i).1 := le_of_lt h
      cases hk : (z k).2 <;>
        simp [properEndpoint, virtualPredict, hv, hk, upperEndpoint_le_iff, h, hl]
    · cases hk : (z k).2 <;> cases hi : (z i).2
      · simp [properEndpoint, virtualPredict, hk, h, upperEndpoint_le_iff]
        split <;> norm_num
      · have hv : ¬ key (z k) (tag k) ≤ key (z i) (tag i) := by
          simp [key, Prod.Lex.toLex_le_toLex, h, hk, hi]
        simp [properEndpoint, virtualPredict, hk, h, hv, upperEndpoint_le_iff]
      · have hv : key (z k) (tag k) ≤ key (z i) (tag i) := by
          simp [key, Prod.Lex.toLex_le_toLex, h, hk, hi]
        simp [properEndpoint, virtualPredict, hk, h, hv]
      · simp [properEndpoint, virtualPredict, hk, h]
        split <;> norm_num
    · have hl : ¬ (z k).1 ≤ (z i).1 := not_le.mpr h
      have hlt : ¬ (z k).1 < (z i).1 := not_lt.mpr (le_of_lt h)
      have he : (z k).1 ≠ (z i).1 := Ne.symm (ne_of_lt h)
      have hv : ¬ key (z k) (tag k) ≤ key (z i) (tag i) := by
        simp [key, Prod.Lex.toLex_le_toLex, he, hlt]
      cases hk : (z k).2 <;>
        simp [properEndpoint, virtualPredict, hv, hk, upperEndpoint_le_iff, hl, hlt]

/-- Each rounded cut has no more errors than its virtual cut, even with
arbitrary ties and conflicting labels at the same feature value. -/
theorem totalLoss_properEndpoint_le {n : ℕ} (hn : 0 < n) (z : Sample n)
    (tag : Fin n → ℕ) (q : Option (Fin n)) :
    totalLoss z (properEndpoint hn z q) ≤ virtualLoss z tag q :=
  Finset.sum_le_sum fun i _ => round_one hn z tag q i

/-- Every finite real threshold has its exact prediction trace at a virtual cut. -/
theorem exists_virtualLoss_eq {n : ℕ} (z : Sample n) (tag : Fin n → ℕ) (t : ℝ) :
    ∃ q, virtualLoss z tag q = totalLoss z t := by
  classical
  let s : Finset (Fin n) := Finset.univ.filter fun i => t ≤ (z i).1
  by_cases hs : s.Nonempty
  · let f := fun i => key (z i) (tag i)
    obtain ⟨k, hk, hmin⟩ := (s.exists_min_image f hs)
    have htk : t ≤ (z k).1 := (Finset.mem_filter.mp hk).2
    refine ⟨some k, Finset.sum_congr rfl fun i _ => ?_⟩
    have he : f k ≤ f i ↔ t ≤ (z i).1 := by
      constructor
      · intro h
        exact htk.trans ((Prod.Lex.toLex_le_toLex'.mp h).1)
      · intro h
        exact hmin i (Finset.mem_filter.mpr ⟨Finset.mem_univ _, h⟩)
    simp [virtualPredict, he, f] at *
  · refine ⟨none, Finset.sum_congr rfl fun i _ => ?_⟩
    have hi : ¬ t ≤ (z i).1 := fun h => hs ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, h⟩⟩
    simp [virtualPredict, hi]

private theorem measurable_sample_apply {n : ℕ} (i : Fin n) :
    Measurable (fun z : Sample n => z i) := measurable_pi_apply i

theorem measurable_sampleMaximum {n : ℕ} (hn : 0 < n) :
    Measurable (sampleMaximum hn) := by
  unfold sampleMaximum
  let f := fun (i : Fin n) (z : Sample n) => (z i).1
  have h : (Finset.univ : Finset (Fin n)).Nonempty := ⟨⟨0, hn⟩, Finset.mem_univ _⟩
  convert (Finset.measurable_sup' h (f := f) fun i _ =>
    measurable_fst.comp (measurable_sample_apply i)) using 1
  funext z
  exact (Finset.sup'_apply h f z).symm

theorem measurable_upperEndpoint {n : ℕ} (hn : 0 < n) {w : Sample n → ℝ}
    (hw : Measurable w) : Measurable (fun z => upperEndpoint hn z (w z)) := by
  unfold upperEndpoint
  let f := fun (i : Fin n) (z : Sample n) =>
    if w z < (z i).1 then (z i).1 else sampleMaximum hn z + 1
  have h : (Finset.univ : Finset (Fin n)).Nonempty := ⟨⟨0, hn⟩, Finset.mem_univ _⟩
  have hf (i : Fin n) : Measurable (f i) := by
    have hi : Measurable (fun z : Sample n => (z i).1) :=
      measurable_fst.comp (measurable_sample_apply i)
    exact Measurable.ite (measurableSet_lt hw hi) hi ((measurable_sampleMaximum hn).add_const 1)
  have he : (fun z => Finset.univ.inf' h (fun i => f i z)) = Finset.univ.inf' h f := by
    funext z
    exact (Finset.inf'_apply h f z).symm
  change Measurable (fun z => Finset.univ.inf' h (fun i => f i z))
  rw [he]
  exact Finset.measurable_sup' (α := ℝᵒᵈ) h (f := f) fun i _ => hf i

theorem measurable_properEndpoint {n : ℕ} (hn : 0 < n) (q : Option (Fin n)) :
    Measurable (fun z => properEndpoint hn z q) := by
  cases q with
  | none => exact (measurable_sampleMaximum hn).add_const 1
  | some i =>
    have h : Measurable (fun z : Sample n => (z i).1) := measurable_fst.comp (measurable_sample_apply i)
    apply Measurable.ite _ h (measurable_upperEndpoint hn h)
    have hb : Measurable (fun z : Sample n => (z i).2) :=
      measurable_snd.comp (measurable_sample_apply i)
    exact measurableSet_eq_fun hb measurable_const

end SteinkeZakynthinou
