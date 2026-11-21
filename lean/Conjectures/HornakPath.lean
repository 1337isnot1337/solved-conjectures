import Conjectures.HornakGroupGraph

/-! Realizing arbitrary path partitions after reserving the short arm. -/
namespace Hornak

/-- Place lists of pieces on the two long arms and a third list on the
short arm, joining their unused initial segments into the central part. -/
theorem three_lists_realize_tripod (arms : Fin 3 → ℕ) (center : ℕ)
    (left right extra : List ℕ)
    (hleftpos : ∀ x ∈ left, 0 < x) (hrightpos : ∀ x ∈ right, 0 < x)
    (hextrapos : ∀ x ∈ extra, 0 < x)
    (hleft : left.sum ≤ arms 1) (hright : right.sum ≤ arms 0)
    (hextra : extra.sum ≤ arms 2)
    (htotal : center+left.sum+right.sum+extra.sum = 1+∑ j, arms j) :
    Partitionable arms (center::(left++right++extra)).get := by
  classical
  let ls : Fin left.length → ℕ := left.get
  let rs : Fin right.length → ℕ := right.get
  let es : Fin extra.length → ℕ := extra.get
  let sizes : Fin (left.length+right.length) → ℕ := fun k =>
    Sum.elim ls rs (finSumFinEquiv.symm k)
  let host : Fin (left.length+right.length) → Fin 3 := fun k =>
    Sum.elim (fun _ => 1) (fun _ => 0) (finSumFinEquiv.symm k)
  have hp : ∀ k, 0 < sizes k := by
    intro k
    dsimp [sizes]
    cases finSumFinEquiv.symm k with
    | inl k => exact hleftpos _ (List.get_mem _ _)
    | inr k => exact hrightpos _ (List.get_mem _ _)
  have hep : ∀ k, 0 < es k := fun k => hextrapos _ (List.get_mem _ _)
  have hno : IsEmpty {k // host k = 2} := by
    constructor
    rintro ⟨k,hk⟩
    dsimp [host] at hk
    cases hc : finSumFinEquiv.symm k <;> simp [hc] at hk
  have hf : ∀ j, (∑ k : {k // host k = j}, sizes k.val) ≤ arms j := by
    intro j
    have he := joined_assignment_load ls rs (fun _ => (1 : Fin 3)) (fun _ => (0 : Fin 3)) j
    change (∑ k : {k // host k = j}, sizes k.val) = _ at he
    rw [he]
    fin_cases j
    · change (∑ k : {k : Fin left.length // (1 : Fin 3) = 0}, ls k.val) +
        (∑ k : {k : Fin right.length // (0 : Fin 3) = 0}, rs k.val) ≤ arms 0
      have hz : IsEmpty {k : Fin left.length // (1 : Fin 3) = 0} := ⟨fun k => by have h := k.property; contradiction⟩
      have hzero : (∑ k : {k : Fin left.length // (1 : Fin 3) = 0}, ls k.val) = 0 := Fintype.sum_empty _
      have hsum : (∑ k : {k : Fin right.length // (0 : Fin 3) = 0}, rs k.val) = right.sum := by
        calc
          (∑ k : {k : Fin right.length // (0 : Fin 3) = 0}, rs k.val) = ∑ k, rs k :=
            (Equiv.subtypeUnivEquiv (fun _ : Fin right.length => rfl)).sum_comp rs
          _ = right.sum := by rw [← List.sum_ofFn, List.ofFn_get]
      omega
    · change (∑ k : {k : Fin left.length // (1 : Fin 3) = 1}, ls k.val) +
        (∑ k : {k : Fin right.length // (0 : Fin 3) = 1}, rs k.val) ≤ arms 1
      have hz : IsEmpty {k : Fin right.length // (0 : Fin 3) = 1} := ⟨fun k => by have h := k.property; contradiction⟩
      have hzero : (∑ k : {k : Fin right.length // (0 : Fin 3) = 1}, rs k.val) = 0 := Fintype.sum_empty _
      have hsum : (∑ k : {k : Fin left.length // (1 : Fin 3) = 1}, ls k.val) = left.sum := by
        calc
          (∑ k : {k : Fin left.length // (1 : Fin 3) = 1}, ls k.val) = ∑ k, ls k :=
            (Equiv.subtypeUnivEquiv (fun _ : Fin left.length => rfl)).sum_comp ls
          _ = left.sum := by rw [← List.sum_ofFn, List.ofFn_get]
      omega
    · have hz0 : IsEmpty {k : Fin left.length // (1 : Fin 3) = 2} := ⟨fun k => by have h := k.property; contradiction⟩
      have hz1 : IsEmpty {k : Fin right.length // (0 : Fin 3) = 2} := ⟨fun k => by have h := k.property; contradiction⟩
      change (∑ k : {k : Fin left.length // (1 : Fin 3) = 2}, ls k.val) +
        (∑ k : {k : Fin right.length // (0 : Fin 3) = 2}, rs k.val) ≤ arms 2
      have h0 : (∑ k : {k : Fin left.length // (1 : Fin 3) = 2}, ls k.val) = 0 := Fintype.sum_empty _
      have h1 : (∑ k : {k : Fin right.length // (0 : Fin 3) = 2}, rs k.val) = 0 := Fintype.sum_empty _
      omega
  have hsum : (∑ k, sizes k) = left.sum+right.sum := by
    rw [Fin.sum_univ_add]
    simp [sizes,ls,rs, ← finSumFinEquiv_apply_left, ← finSumFinEquiv_apply_right,
      ← List.sum_ofFn]
  have hesum : (∑ k, es k) = extra.sum := by rw [← List.sum_ofFn, List.ofFn_get]
  have ht : center+(∑ k, sizes k)+(∑ k, es k) = 1+∑ j, arms j := by rw [hsum,hesum]; omega
  have hpart := append_on_free_short_arm arms center sizes es host hp hep hf hno (by simpa [hesum] using hextra) ht
  have hlist := partitionable_ofFn arms _ hpart
  have heq : List.ofFn (Fin.cases center
      (fun k : Fin ((left.length+right.length)+extra.length) =>
        Sum.elim sizes es (finSumFinEquiv.symm k))) = center::(left++right++extra) := by
    rw [List.ofFn_succ]
    simp only [Fin.cases_zero, Fin.cases_succ]
    rw [List.ofFn_add]
    have hleft : (List.ofFn fun k : Fin (left.length+right.length) =>
        Sum.elim sizes es (finSumFinEquiv.symm (Fin.castLE (Nat.le_add_right _ _) k))) = List.ofFn sizes := by
      congr 1
      funext k
      have hc : Fin.castLE (Nat.le_add_right _ _) k = Fin.castAdd extra.length k := by apply Fin.ext; rfl
      rw [hc]
      simp [← finSumFinEquiv_apply_left]
    have hright : (List.ofFn fun k : Fin extra.length =>
        Sum.elim sizes es (finSumFinEquiv.symm (Fin.natAdd (left.length+right.length) k))) = extra := by
      calc
        _ = List.ofFn es := by congr 1; funext k; simp [← finSumFinEquiv_apply_right]
        _ = extra := List.ofFn_get extra
    rw [hleft,hright]
    have hs : List.ofFn sizes = left++right := by
      rw [List.ofFn_add]
      have hl : (List.ofFn fun k : Fin left.length => sizes (Fin.castLE (Nat.le_add_right _ _) k)) = left := by
        calc
          _ = List.ofFn ls := by
            congr 1
            funext k
            have hc : Fin.castLE (Nat.le_add_right _ _) k = Fin.castAdd right.length k := by apply Fin.ext; rfl
            rw [hc]
            simp [sizes, ← finSumFinEquiv_apply_left]
          _ = left := List.ofFn_get left
      have hr : (List.ofFn fun k : Fin right.length => sizes (Fin.natAdd left.length k)) = right := by
        calc
          _ = List.ofFn rs := by congr 1; funext k; simp [sizes, ← finSumFinEquiv_apply_right]
          _ = right := List.ofFn_get right
      rw [hl,hr]
    rw [hs]
  rw [heq] at hlist
  exact hlist

/-- A tripod partition containing a part exactly equal to the shortest
arm is always realizable: reserve that arm and partition the remaining path. -/
theorem tripod_partition_with_short_arm_part (arms : Fin 3 → ℕ)
    (parts : List ℕ) (hshort : 0 < arms 2)
    (hpos : ∀ x ∈ parts, 0 < x)
    (htotal : arms 2+parts.sum = 1+∑ j, arms j) :
    Partitionable arms ((arms 2)::parts).get := by
  have hrest : parts.sum = 1+arms 0+arms 1 := by
    rw [Fin.sum_univ_three] at htotal
    omega
  have hbound : arms 1 < parts.sum := by omega
  obtain ⟨k,hlo,hhi⟩ := list_piece_cover parts hpos (arms 1) hbound
  let left := parts.take k.val
  let pivot := parts.get k
  let right := parts.drop (k.val+1)
  have hsplit : left++pivot::right = parts := by
    dsimp [left,pivot,right]
    have hh := List.take_append_drop k.val parts
    rw [List.drop_eq_getElem_cons k.isLt] at hh
    exact hh
  have hsum : left.sum+pivot+right.sum = parts.sum := by
    have hh := congrArg List.sum hsplit
    simp only [List.sum_append,List.sum_cons] at hh
    omega
  have hleft : left.sum ≤ arms 1 := hlo
  have hright : right.sum ≤ arms 0 := by
    have hh : arms 1 < left.sum+pivot := by
      dsimp [left,pivot] at *
      simpa [listPrefix,List.getD_eq_getElem?_getD] using hhi
    omega
  have hlpos : ∀ x ∈ left, 0 < x := fun x hx => hpos x ((List.take_sublist _ _).mem hx)
  have hrpos : ∀ x ∈ right, 0 < x := fun x hx => hpos x ((List.drop_sublist _ _).mem hx)
  have hextrapos : ∀ x ∈ [arms 2], 0 < x := by simpa using hshort
  have ht : pivot+left.sum+right.sum+[arms 2].sum = 1+∑ j, arms j := by
    simp only [List.sum_cons,List.sum_nil,add_zero]
    omega
  have hp := three_lists_realize_tripod arms pivot left right [arms 2] hlpos hrpos hextrapos
    hleft hright (by simp) ht
  have hperm : (pivot::(left++right++[arms 2])).Perm ((arms 2)::parts) := by
    have h1 : (pivot::(left++right++[arms 2])).Perm (left++pivot::right++[arms 2]) := by
      simpa [List.append_assoc] using
        (List.perm_middle (a := pivot) (l₁ := left) (l₂ := right++[arms 2])).symm
    have h2 : (left++pivot::right++[arms 2]) = parts++[arms 2] := by
      simpa [List.append_assoc] using congrArg (fun l => l++[arms 2]) hsplit
    have h3 : (parts++[arms 2]).Perm ((arms 2)::parts) := by simp
    exact h1.trans (h2 ▸ h3)
  exact (partitionable_list_perm arms _ _ hperm).1 hp


theorem tripod_partition_with_short_arm_subset (arms : Fin 3 → ℕ)
    (extra parts : List ℕ) (hextra : extra.sum = arms 2)
    (hextrapos : ∀ x ∈ extra, 0 < x) (hpos : ∀ x ∈ parts, 0 < x)
    (htotal : extra.sum+parts.sum = 1+∑ j, arms j) :
    Partitionable arms (extra++parts).get := by
  have hrest : parts.sum = 1+arms 0+arms 1 := by
    rw [Fin.sum_univ_three] at htotal
    omega
  have hbound : arms 1 < parts.sum := by omega
  obtain ⟨k,hlo,hhi⟩ := list_piece_cover parts hpos (arms 1) hbound
  let left := parts.take k.val
  let pivot := parts.get k
  let right := parts.drop (k.val+1)
  have hsplit : left++pivot::right = parts := by
    dsimp [left,pivot,right]
    have hh := List.take_append_drop k.val parts
    rw [List.drop_eq_getElem_cons k.isLt] at hh
    exact hh
  have hsum : left.sum+pivot+right.sum = parts.sum := by
    have hh := congrArg List.sum hsplit
    simp only [List.sum_append,List.sum_cons] at hh
    omega
  have hleft : left.sum ≤ arms 1 := hlo
  have hright : right.sum ≤ arms 0 := by
    have hh : arms 1 < left.sum+pivot := by
      dsimp [left,pivot] at *
      simpa [listPrefix,List.getD_eq_getElem?_getD] using hhi
    omega
  have hlpos : ∀ x ∈ left, 0 < x := fun x hx => hpos x ((List.take_sublist _ _).mem hx)
  have hrpos : ∀ x ∈ right, 0 < x := fun x hx => hpos x ((List.drop_sublist _ _).mem hx)
  have ht : pivot+left.sum+right.sum+extra.sum = 1+∑ j, arms j := by omega
  have hp := three_lists_realize_tripod arms pivot left right extra hlpos hrpos hextrapos
    hleft hright (by omega) ht
  have hperm : (pivot::(left++right++extra)).Perm (extra++parts) := by
    have h1 : (pivot::(left++right++extra)).Perm (left++pivot::right++extra) := by
      simpa [List.append_assoc] using
        (List.perm_middle (a := pivot) (l₁ := left) (l₂ := right++extra)).symm
    have h2 : (left++pivot::right++extra) = parts++extra := by
      simpa [List.append_assoc] using congrArg (fun l => l++extra) hsplit
    have h3 : (parts++extra).Perm (extra++parts) := List.perm_append_comm
    exact h1.trans (h2 ▸ h3)
  exact (partitionable_list_perm arms _ _ hperm).1 hp

/-- Any positive part list with a sublist summing to the shortest arm is
realizable, regardless of admissibility. -/
theorem tripod_partition_of_short_arm_sublist (arms : Fin 3 → ℕ) (parts chosen : List ℕ)
    (hsub : chosen.Sublist parts) (hsum : chosen.sum = arms 2)
    (hpos : ∀ x ∈ parts, 0 < x)
    (htotal : parts.sum = 1+∑ j, arms j) :
    Partitionable arms parts.get := by
  obtain ⟨rest,hperm⟩ := hsub.exists_perm_append
  have hchosen : ∀ x ∈ chosen, 0 < x := fun x hx => hpos x (hsub.mem hx)
  have hrest : ∀ x ∈ rest, 0 < x := by
    intro x hx
    apply hpos x
    apply hperm.mem_iff.mpr
    simp [hx]
  have ht : chosen.sum+rest.sum = 1+∑ j, arms j := by
    have hh := hperm.sum_eq
    simp only [List.sum_append] at hh
    omega
  have hp := tripod_partition_with_short_arm_subset arms chosen rest hsum hchosen hrest ht
  exact (partitionable_list_perm arms _ _ hperm).2 hp

end Hornak
