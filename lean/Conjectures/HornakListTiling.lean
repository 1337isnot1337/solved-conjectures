import Conjectures.HornakReductionArithmetic

/-! Prefix sums for tiling arms with arbitrary positive piece lengths. -/
namespace Hornak

def listPrefix (xs : List ℕ) (n : ℕ) : ℕ := (xs.take n).sum

theorem list_prefix_step (xs : List ℕ) (k : Fin xs.length) :
    listPrefix xs (k.val+1) = listPrefix xs k.val+xs.getD k.val 0 := by
  unfold listPrefix
  rw [List.take_succ_eq_append_getElem k.isLt, List.sum_append]
  simp [List.getD_eq_getElem?_getD]

theorem list_prefix_monotone (xs : List ℕ) : Monotone (listPrefix xs) := by
  intro a b hab
  unfold listPrefix
  have heq : b = a+(b-a) := by omega
  rw [heq, List.take_add, List.sum_append]
  omega

theorem list_piece_ordered (xs : List ℕ) (k l : Fin xs.length) (h : k < l) :
    listPrefix xs k.val+xs.getD k.val 0 ≤ listPrefix xs l.val := by
  rw [← list_prefix_step xs k]
  exact list_prefix_monotone xs (by omega)

theorem list_piece_cover (xs : List ℕ) (hpos : ∀ x ∈ xs, 0 < x)
    (n : ℕ) (hn : n < xs.sum) :
    ∃ k : Fin xs.length, listPrefix xs k.val ≤ n ∧ n < listPrefix xs k.val+xs.getD k.val 0 := by
  induction xs generalizing n with
  | nil => simp at hn
  | cons x xs ih =>
    have hx : 0 < x := hpos x (by simp)
    by_cases h : n < x
    · refine ⟨⟨0,by simp⟩,?_,?_⟩ <;> simp [listPrefix, h]
    · have hn' : n-x < xs.sum := by simp only [List.sum_cons] at hn; omega
      obtain ⟨k,hklo,hkhi⟩ := ih (fun y hy => hpos y (by simp [hy])) (n-x) hn'
      refine ⟨k.succ,?_,?_⟩
      · simp only [Fin.val_succ, listPrefix, List.take_succ_cons, List.sum_cons] at ⊢
        change x+listPrefix xs k.val ≤ n
        omega
      · simp only [Fin.val_succ, listPrefix, List.take_succ_cons, List.sum_cons] at ⊢
        change n < x+listPrefix xs k.val+xs.getD k.val 0
        omega

theorem list_piece_end_le (xs : List ℕ) (k : Fin xs.length) :
    listPrefix xs k.val+xs.getD k.val 0 ≤ xs.sum := by
  rw [← list_prefix_step xs k]
  have h := list_prefix_monotone xs (show k.val+1 ≤ xs.length by omega)
  simpa [listPrefix] using h

/-- Any lists of positive pieces whose sums fit the arms produce actual
connected graph partitions, with the unused prefixes joined at the center. -/
theorem realize_list_allocations {m : ℕ} (arms : Fin m → ℕ) (pieces : Fin m → List ℕ)
    (hpos : ∀ j x, x ∈ pieces j → 0 < x)
    (hfit : ∀ j, (pieces j).sum ≤ arms j) :
    let cut : Fin m → ℕ := fun j => arms j-(pieces j).sum
    let labels := Σ j, Fin (pieces j).length
    let e := Fintype.equivFin labels
    Partitionable arms (Fin.cases (1+∑ j, cut j)
      (fun k => (pieces (e.symm k).1).getD (e.symm k).2.val 0)) := by
  classical
  dsimp only
  let cut : Fin m → ℕ := fun j => arms j-(pieces j).sum
  let labels := Σ j, Fin (pieces j).length
  let e := Fintype.equivFin labels
  let host := fun k : Fin (Fintype.card labels) => (e.symm k).1
  let lo := fun k : Fin (Fintype.card labels) =>
    cut (host k)+listPrefix (pieces (host k)) (e.symm k).2.val
  let high := fun k : Fin (Fintype.card labels) =>
    lo k+(pieces (host k)).getD (e.symm k).2.val 0
  change Partitionable arms (Fin.cases (1+∑ j, cut j)
    (fun k => (pieces (host k)).getD (e.symm k).2.val 0))
  have hcut (j : Fin m) : cut j ≤ arms j := Nat.sub_le _ _
  have htotal (j : Fin m) : cut j+(pieces j).sum = arms j := by
    dsimp [cut]
    exact Nat.sub_add_cancel (hfit j)
  have hinter (k : Fin (Fintype.card labels)) :
      cut (host k) ≤ lo k ∧ lo k < high k ∧ high k ≤ arms (host k) := by
    have hend := list_piece_end_le (pieces (host k)) (e.symm k).2
    have hp : 0 < (pieces (host k)).getD (e.symm k).2.val 0 := by
      have hh := hpos (host k) _ (List.get_mem (pieces (host k)) (e.symm k).2)
      rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem (e.symm k).2.isLt]
      exact hh
    dsimp [lo,high]
    have ht := htotal (host k)
    omega
  have hcover (j : Fin m) (n : ℕ) (hn : cut j ≤ n) (hbound : n < arms j) :
      ∃ k, host k = j ∧ lo k ≤ n ∧ n < high k := by
    have hused : n-cut j < (pieces j).sum := by have := htotal j; omega
    obtain ⟨r,hrlo,hrhi⟩ := list_piece_cover (pieces j) (hpos j) (n-cut j) hused
    let label : labels := ⟨j,r⟩
    refine ⟨e label, ?_, ?_, ?_⟩
    · simp [host, label]
    · change cut ((e.symm (e label)).1) + listPrefix (pieces (e.symm (e label)).1) (e.symm (e label)).2.val ≤ n
      rw [e.symm_apply_apply]
      change cut j+listPrefix (pieces j) r.val ≤ n
      omega
    · change n < cut ((e.symm (e label)).1) + listPrefix (pieces (e.symm (e label)).1) (e.symm (e label)).2.val + (pieces (e.symm (e label)).1).getD (e.symm (e label)).2.val 0
      have he : e.symm (e label) = label := e.symm_apply_apply label
      have hsnd := congrArg (fun z : labels => z.2.val) he
      have hfst := congrArg (fun z : labels => z.1) he
      change (e.symm (e label)).2.val = r.val at hsnd
      change (e.symm (e label)).1 = j at hfst
      rw [hsnd, hfst]
      omega
  have hdisj (k l : Fin (Fintype.card labels)) (hne : k ≠ l) (hsame : host k = host l) :
      high k ≤ lo l ∨ high l ≤ lo k := by
    have hidx : (e.symm k).2.val ≠ (e.symm l).2.val := by
      intro he
      apply hne
      apply e.symm.injective
      change (e.symm k).1 = (e.symm l).1 at hsame
      apply Sigma.ext hsame
      apply (Fin.heq_ext_iff (congrArg (fun j => (pieces j).length) hsame)).2
      exact he
    rcases lt_or_gt_of_ne hidx with h | h
    · left
      have hl : (e.symm l).2.val < (pieces (host k)).length := by
        rw [hsame]
        exact (e.symm l).2.isLt
      have hh := list_piece_ordered (pieces (host k)) (e.symm k).2 ⟨(e.symm l).2.val,hl⟩ (by exact h)
      dsimp [high,lo]
      rw [← hsame]
      simpa only [Fin.val_mk, Nat.add_assoc] using Nat.add_le_add_left hh (cut (host k))
    · right
      have hk : (e.symm k).2.val < (pieces (host l)).length := by
        rw [← hsame]
        exact (e.symm k).2.isLt
      have hh := list_piece_ordered (pieces (host l)) (e.symm l).2 ⟨(e.symm k).2.val,hk⟩ (by exact h)
      dsimp [high,lo]
      rw [hsame]
      simpa only [Fin.val_mk, Nat.add_assoc] using Nat.add_le_add_left hh (cut (host l))
  have h := partition_of_interval_tiling arms cut host lo high hcut hinter hcover hdisj
  simpa only [high, lo, Nat.add_sub_cancel_left] using h

end Hornak
