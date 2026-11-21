module

public import Conjectures.SteinkeZakynthinou.Auxiliary
public import Conjectures.SteinkeZakynthinou.SelectorAvoid

/-! Decoding a finite proper threshold from the auxiliary output and a rank. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

def slotFeature {n : ℕ} (T : Pool n) (x : Slot n) : ℝ := (slotObservation T x).1

def orderKey {n : ℕ} (T : Pool n) (descending : Bool) (x : Slot n) : ℝ ×ₗ ℕ :=
  toLex ((if descending then -slotFeature T x else slotFeature T x), slotTag x)

private theorem orderKey_injective {n : ℕ} (T : Pool n) (descending : Bool) :
    Function.Injective (orderKey T descending) :=
  fun _ _ h => slotTag_injective (congrArg (fun x : ℝ ×ₗ ℕ => (ofLex x).2) h)

def queryLE {n : ℕ} (T : Pool n) (descending : Bool) (x y : Slot n) : Prop :=
  orderKey T descending x ≤ orderKey T descending y

noncomputable instance {n : ℕ} (T : Pool n) (descending : Bool) : DecidableRel (queryLE T descending) :=
  fun _ _ => inferInstanceAs (Decidable (_ ≤ _))

instance {n : ℕ} (T : Pool n) (descending : Bool) : IsTrans (Slot n) (queryLE T descending) :=
  ⟨fun _ _ _ => le_trans⟩

instance {n : ℕ} (T : Pool n) (descending : Bool) : Std.Antisymm (queryLE T descending) :=
  ⟨fun _ _ h₁ h₂ => orderKey_injective T descending (le_antisymm h₁ h₂)⟩

instance {n : ℕ} (T : Pool n) (descending : Bool) : Std.Total (queryLE T descending) :=
  ⟨fun _ _ => le_total _ _⟩

theorem queryLE_feature {n : ℕ} (T : Pool n) (x y : Slot n) (d : Bool)
    (h : queryLE T d x y) : (if d then slotFeature T y ≤ slotFeature T x else slotFeature T x ≤ slotFeature T y) := by
  have hc := (Prod.Lex.toLex_le_toLex'.mp h).1
  cases d <;> simpa only [Bool.false_eq_true, Bool.true_eq, ite_true, ite_false, neg_le_neg_iff] using hc

noncomputable def querySlots {n : ℕ} (T : Pool n) (q : Option (Slot n)) : List (Slot n) := by
  classical
  exact match q with
  | none => Finset.univ.sort (queryLE T true)
  | some x =>
    if (slotObservation T x).2 then [] else
      (Finset.univ.filter (fun y => slotFeature T x < slotFeature T y)).sort (queryLE T false)

theorem querySlots_nodup {n : ℕ} (T : Pool n) (q : Option (Slot n)) :
    (querySlots T q).Nodup := by
  cases q with
  | none => simp [querySlots]
  | some x => simp only [querySlots]; split <;> simp

theorem querySlots_length {n : ℕ} (T : Pool n) (q : Option (Slot n)) :
    (querySlots T q).length ≤ 2 * n := by
  have hcard : Fintype.card (Slot n) = n * 2 := by simp [Slot]
  cases q with
  | none => simp [querySlots, hcard]; omega
  | some x =>
    simp only [querySlots]
    split
    · simp
    · rw [Finset.length_sort]
      have h := Finset.card_filter_le (s := (Finset.univ : Finset (Slot n)))
        (p := fun y => slotFeature T x < slotFeature T y)
      rw [Finset.card_univ, hcard] at h
      omega

noncomputable def properRank {n : ℕ} (T : Pool n) (s : Selector n) (a : AuxCode n) :
    Fin (2*n+1) :=
  ⟨(querySlots T a.1.1).findIdx (isSelected s),
    List.findIdx_le_length.trans_lt (Nat.lt_succ_of_le (querySlots_length T a.1.1))⟩

theorem properRank_moment {n : ℕ} (T : Pool n) (a : AuxCode n) :
    (Learner.selectorMean (fun s => (3 / 2 : ℝ)^(properRank T s a).val)) ≤ 4 :=
  first_rank_exp_moment (querySlots T a.1.1) (querySlots_nodup T a.1.1)
    (Nat.lt_succ_of_le (querySlots_length T a.1.1))

noncomputable def decodeThreshold {n : ℕ} (T : Pool n) (a : AuxCode n) (k : Fin (2*n+1)) : ℝ :=
  match a.1.1 with
  | none => ((querySlots T none)[k.val]?).elim 0 (fun x => slotFeature T x + 1)
  | some x => if (slotObservation T x).2 then slotFeature T x else
    ((querySlots T (some x))[k.val]?).elim (slotFeature T x + 1) (slotFeature T)

private theorem first_feature_le {n : ℕ} (T : Pool n) (s : Selector n) (l : List (Slot n))
    (d : Bool) (hsort : l.Pairwise (queryLE T d))
    (h : l.findIdx (isSelected s) < l.length) (v : Slot n) (hvL : v ∈ l)
    (hv : isSelected s v) :
    if d then slotFeature T v ≤ slotFeature T (l[l.findIdx (isSelected s)]'h)
    else slotFeature T (l[l.findIdx (isSelected s)]'h) ≤ slotFeature T v := by
  obtain ⟨j,hj,rfl⟩ := List.mem_iff_getElem.mp hvL
  have hk : l.findIdx (isSelected s) ≤ j := by
    by_contra! h'
    have he := List.not_of_lt_findIdx h'
    simp [he] at hv
  rcases hk.eq_or_lt with he | he
  · cases d <;> simp [he]
  · exact queryLE_feature T _ _ d (hsort.rel_getElem_of_lt h hj he)

private theorem selected_feature_eq {n : ℕ} (T : Pool n) (s : Selector n) {x : Slot n}
    (h : isSelected s x) : slotFeature T x = (select T s x.1).1 := by
  have he : s x.1 = x.2 := of_decide_eq_true h
  simp [slotFeature, slotObservation, select, he]

private theorem sampleMaximum_of_descending_first {n : ℕ} (hn : 0 < n) (T : Pool n)
    (s : Selector n) (l : List (Slot n)) (hsort : l.Pairwise (queryLE T true))
    (hm : ∀ x : Slot n, x ∈ l) (hk : l.findIdx (isSelected s) < l.length) :
    slotFeature T (l[l.findIdx (isSelected s)]'hk) = sampleMaximum hn (select T s) := by
  apply le_antisymm
  · rw [selected_feature_eq T s (List.findIdx_getElem (w := hk))]
    exact feature_le_sampleMaximum hn (select T s) _
  · unfold sampleMaximum
    apply Finset.sup'_le
    intro i _
    have h := first_feature_le T s l true hsort hk (selectedSlot s i) (hm _)
      (by simp [isSelected, selectedSlot])
    exact h

private theorem sampleMaximum_eq_of_all_le {n : ℕ} (hn : 0 < n) (z : Sample n) (i : Fin n)
    (h : ∀ j, (z j).1 ≤ (z i).1) : sampleMaximum hn z = (z i).1 := by
  apply le_antisymm _ (feature_le_sampleMaximum hn z i)
  exact Finset.sup'_le _ _ (fun j _ => h j)

private theorem decode_open_eq {n : ℕ} (hn : 0 < n) (T : Pool n) (s : Selector n) (i : Fin n)
    (a : AuxCode n) (ha : a.1.1 = some (selectedSlot s i)) (hlabel : (select T s i).2 = false) :
    decodeThreshold T a (properRank T s a) =
      upperEndpoint hn (select T s) (select T s i).1 := by
  classical
  let z := select T s
  let x := selectedSlot s i
  let w := slotFeature T x
  let l := querySlots T (some x)
  let j := l.findIdx (isSelected s)
  have hl : (slotObservation T x).2 = false := hlabel
  have hmem (y : Slot n) : y ∈ l ↔ w < slotFeature T y := by
    simp [l, querySlots, hl, w]
  have hsort : l.Pairwise (queryLE T false) := by simp [l, querySlots, hl]
  change decodeThreshold T a (properRank T s a) = upperEndpoint hn z w
  unfold decodeThreshold
  rw [ha]
  change (if (slotObservation T x).2 then w else
    l[(properRank T s a).val]?.elim (w+1) (slotFeature T)) = _
  rw [show (properRank T s a).val = j by simp [properRank, ha, j, l, x]]
  simp only [hl, Bool.false_eq_true, ite_false]
  by_cases hj : j < l.length
  · let y := l[j]
    have hy : isSelected s y := List.findIdx_getElem (w := hj)
    have hw := (hmem y).mp (List.getElem_mem hj)
    rw [List.getElem?_eq_getElem hj, Option.elim_some]
    change slotFeature T y = upperEndpoint hn z w
    apply le_antisymm
    · unfold upperEndpoint
      apply Finset.le_inf'
      intro r _
      split
      · rename_i hr
        have hr' := (hmem (selectedSlot s r)).mpr hr
        exact first_feature_le T s l false hsort hj (selectedSlot s r) hr' (by simp [isSelected, selectedSlot])
      · rw [selected_feature_eq T s hy]
        linarith [feature_le_sampleMaximum hn z y.1]
    · unfold upperEndpoint
      apply (Finset.inf'_le (f := fun r =>
        if w < (z r).1 then (z r).1 else sampleMaximum hn z + 1) (Finset.mem_univ y.1)).trans
      rw [← selected_feature_eq T s hy, ite_eq_left hw]
  · rw [List.getElem?_eq_none (by omega : l.length ≤ j), Option.elim_none]
    have hall (r : Fin n) : (z r).1 ≤ w := by
      by_contra! hr
      have he : ∃ y ∈ l, isSelected s y := ⟨selectedSlot s r, (hmem _).mpr hr, by simp [isSelected, selectedSlot]⟩
      exact hj (List.findIdx_lt_length_of_exists he)
    have hw : sampleMaximum hn z = w := sampleMaximum_eq_of_all_le hn z i hall
    unfold upperEndpoint
    simp only [fun r : Fin n => not_lt_of_ge (hall r), ite_false, hw]
    exact (Finset.inf'_const _ _).symm

/-- The code exactly reproduces the actual threshold returned on the training sample. -/
theorem decodeThreshold_draw {n : ℕ} (hn : 0 < n) (T : Pool n) (s : Selector n) (d : Draw n) :
    let a := auxCode (select T s) s d
    decodeThreshold T a (properRank T s a) = drawThreshold hn (select T s) d := by
  classical
  let q := cutAt (select T s) Fin.val Fin.val_injective (foldRank n (drawPosition d))
  let a := auxCode (select T s) s d
  have ha : a.1.1 = q.map (selectedSlot s) :=
    congrArg (fun x : AuxCode n => x.1.1) (auxCode_at_draw (select T s) s d)
  change decodeThreshold T a (properRank T s a) = properEndpoint hn (select T s) q
  cases hq : q with
  | none =>
    have han : a.1.1 = none := by simp [ha, hq]
    let l := querySlots T none
    have hm (x : Slot n) : x ∈ l := by simp [l, querySlots]
    have hsort : l.Pairwise (queryLE T true) := by simp [l, querySlots]
    have hk : l.findIdx (isSelected s) < l.length :=
      List.findIdx_lt_length_of_exists ⟨selectedSlot s ⟨0,hn⟩, hm _, by simp [isSelected, selectedSlot]⟩
    unfold decodeThreshold
    rw [han]
    have hj : (properRank T s a).val = l.findIdx (isSelected s) := by simp [properRank, han, l]
    rw [hj, List.getElem?_eq_getElem hk, Option.elim_some, properEndpoint,
      sampleMaximum_of_descending_first hn T s l hsort hm hk]
  | some i =>
    have has : a.1.1 = some (selectedSlot s i) := by simp [ha, hq]
    cases hi : (select T s i).2
    · rw [decode_open_eq hn T s i a has hi]
      simp [properEndpoint, hi]
    · unfold decodeThreshold
      rw [has]
      have hl : (slotObservation T (selectedSlot s i)).2 = true := hi
      simp [properEndpoint, hl, hi]
      rfl

end SteinkeZakynthinou
