import Conjectures.KauersKoutschanActualRows

/-! Row order recovers the realizing permutation and yields the factorial count. -/

open scoped BigOperators

namespace KauersKoutschan

private def predecessorEquiv {α : Type} {m : ℕ} (order : α ≃ Fin m) (b : α) :
    Fin (order b).val ≃ {c : α // order c < order b} where
  toFun i := ⟨order.symm (Fin.castLE (order b).isLt.le i), by
    rw [order.apply_symm_apply]
    exact i.isLt⟩
  invFun c := ⟨(order c.1).val, c.2⟩
  left_inv i := by
    apply Fin.ext
    change (order (order.symm (Fin.castLE (order b).isLt.le i))).val = i.val
    rw [order.apply_symm_apply]
    rfl
  right_inv c := by
    apply Subtype.ext
    exact order.symm_apply_apply c.1

private theorem orderedPrefix_eq_sum {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (order : RowOrders color) (row : Fin 2)
    (b : RowHeads color row) :
    orderedPrefix order row b =
      ∑ c : {c : RowHeads color row // order row c < order row b}, runLength s c.1.1.1 := by
  classical
  apply Fintype.sum_equiv (predecessorEquiv (order row) b)
  intro i
  rfl

private def earlierEquiv {n : ℕ} {s : Finset (Fin (n - 2))}
    (p : Equiv.Perm (Fin n)) (b : BlockHeads s) :
    {c : RowHeads (actualColor p) (actualColor p b) //
      actualOrders p (actualColor p b) c < actualOrders p (actualColor p b) ⟨b, rfl⟩} ≃
    {c : BlockHeads s // headChain p c = headChain p b ∧ headPosition p c < headPosition p b} where
  toFun c := ⟨c.1.1, congrArg Fin.val c.1.2,
    (actualOrders_lt_iff p (actualColor p b) _ _).mp c.2⟩
  invFun c := ⟨⟨c.1, Fin.ext c.2.1⟩,
    (actualOrders_lt_iff p (actualColor p b) _ _).mpr c.2.2⟩
  left_inv _ := Subtype.ext (Subtype.ext rfl)
  right_inv _ := Subtype.ext rfl

private theorem actualOrder_prefix {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) (b : BlockHeads s) :
    orderedPrefix (actualOrders p) (actualColor p b) ⟨b, rfl⟩ = headPosition p b := by
  classical
  rw [orderedPrefix_eq_sum, ← headPosition_eq_prefix_lengths hp b]
  exact Fintype.sum_equiv (earlierEquiv p b) _ _ (fun _ => rfl)

/-- Actual row order reconstructs the original realizing permutation. -/
theorem permutationOfActualOrders_eq {n : ℕ} {s : Finset (Fin (n - 2))}
    {p : Equiv.Perm (Fin n)} (hp : p ∈ s.inf edgeEvent) :
    permutationOfRowOrders (actualColor_fits hp) (actualOrders p) = p := by
  apply realizing_eq_of_heads (permutationOfRowOrders_realizes _ _) hp
  intro b
  let z : Fin (runLength s b.1) := ⟨0, runLength_pos s b.1⟩
  have h := permutationOfRowOrders_position (actualColor_fits hp) (actualOrders p) b z
  have hbase : (blocksByLength s).symm ⟨b, z⟩ = b.1 := by
    apply Fin.ext
    change (b.1 : ℕ) + 2 * (z : ℕ) = b.1
    simp [z]
  rw [hbase, actualOrder_prefix hp b] at h
  apply Fin.ext
  rw [h]
  simp [z, headPosition, actualColor]
  omega

private theorem orderedPrefix_lt_of_index_lt {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (order : RowOrders color) (row : Fin 2)
    {a b : RowHeads color row} (h : order row a < order row b) :
    orderedPrefix order row a < orderedPrefix order row b := by
  classical
  let weight (j : ℕ) :=
    if hj : j < Fintype.card (RowHeads color row) then
      runLength s ((order row).symm ⟨j, hj⟩).1.1 else 0
  have hprefix (c : RowHeads color row) :
      orderedPrefix order row c = ∑ j ∈ Finset.range (order row c).val, weight j := by
    rw [← Fin.sum_univ_eq_sum_range]
    apply Finset.sum_congr rfl
    intro j _
    simp only [weight, dite_eq_left (lt_trans j.isLt (order row c).isLt)]
    rfl
  rw [hprefix a, hprefix b]
  have hpos : 0 < weight (order row a).val := by
    simp only [weight, dite_eq_left (order row a).isLt]
    exact runLength_pos s _
  calc
    _ < (∑ j ∈ Finset.range (order row a).val, weight j) + weight (order row a).val := by omega
    _ = ∑ j ∈ Finset.range ((order row a).val + 1), weight j := (Finset.sum_range_succ _ _).symm
    _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (by exact h))
      (fun _ _ _ => Nat.zero_le _)

private theorem orderedPrefix_lt_iff {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (order : RowOrders color) (row : Fin 2)
    (a b : RowHeads color row) :
    orderedPrefix order row a < orderedPrefix order row b ↔ order row a < order row b := by
  constructor
  · intro h
    rcases lt_trichotomy (order row a) (order row b) with hl | he | hr
    · exact hl
    · have hab := (order row).injective he
      exact (lt_irrefl _) (hab ▸ h) |>.elim
    · exact (not_lt_of_ge (orderedPrefix_lt_of_index_lt order row hr).le h).elim
  · exact orderedPrefix_lt_of_index_lt order row

private theorem rowOrders_eq_of_prefixes {n : ℕ} {s : Finset (Fin (n - 2))}
    {color : BlockHeads s → Fin 2} (o₁ o₂ : RowOrders color)
    (h : ∀ row b, orderedPrefix o₁ row b = orderedPrefix o₂ row b) : o₁ = o₂ := by
  classical
  funext row
  apply Equiv.ext
  intro b
  apply Fin.ext
  let mid : {c : RowHeads color row // o₁ row c < o₁ row b} ≃
      {c : RowHeads color row // o₂ row c < o₂ row b} :=
    (Equiv.refl (RowHeads color row)).subtypeEquiv (fun c => by
    change (o₁ row c < o₁ row b) ↔ o₂ row c < o₂ row b
    rw [← orderedPrefix_lt_iff, ← orderedPrefix_lt_iff, h row c, h row b])
  have hcard := Fintype.card_congr
    ((predecessorEquiv (o₁ row) b).trans (mid.trans (predecessorEquiv (o₂ row) b).symm))
  simpa using hcard

/-- A valid row assignment and one order for each row. -/
abbrev RowPlans {n : ℕ} (s : Finset (Fin (n - 2))) :=
  Σ color : {color : BlockHeads s → Fin 2 // FitsRows color}, RowOrders color.1

private noncomputable def rowPlanPermutation {n : ℕ} (s : Finset (Fin (n - 2)))
    (plan : RowPlans s) : ↥(s.inf edgeEvent) :=
  ⟨permutationOfRowOrders plan.1.2 plan.2, permutationOfRowOrders_realizes _ _⟩

private theorem rowPlanPermutation_injective {n : ℕ} (s : Finset (Fin (n - 2))) :
    Function.Injective (rowPlanPermutation s) := by
  rintro ⟨⟨c, hc⟩, o⟩ ⟨⟨d, hd⟩, v⟩ hp
  have hperm : permutationOfRowOrders hc o = permutationOfRowOrders hd v :=
    congrArg Subtype.val hp
  have hcolor : c = d := by
    rw [← actualColor_permutationOfRowOrders hc o, ← actualColor_permutationOfRowOrders hd v]
    exact congrArg (actualColor (s := s)) hperm
  subst d
  have hopen : o = v := by
    apply rowOrders_eq_of_prefixes
    intro row b
    obtain ⟨b, hrow⟩ := b
    subst row
    let z : Fin (runLength s b.1) := ⟨0, runLength_pos s b.1⟩
    have h₁ := permutationOfRowOrders_position hc o b z
    have h₂ := permutationOfRowOrders_position hd v b z
    rw [hperm, h₂] at h₁
    change orderedPrefix o (c b) ⟨b, rfl⟩ = orderedPrefix v (c b) ⟨b, rfl⟩
    omega
  subst v
  rfl

/-- Realizing permutations are equivalent to legal assignments and row orders. -/
noncomputable def rowPlanEquiv {n : ℕ} (s : Finset (Fin (n - 2))) :
    RowPlans s ≃ ↥(s.inf edgeEvent) :=
  Equiv.ofBijective (rowPlanPermutation s) ⟨rowPlanPermutation_injective s, by
    intro p
    refine ⟨⟨⟨actualColor p.1, actualColor_fits p.2⟩, actualOrders p.1⟩, ?_⟩
    exact Subtype.ext (permutationOfActualOrders_eq p.2)⟩

private theorem card_rowOrders {n : ℕ} {s : Finset (Fin (n - 2))}
    (color : BlockHeads s → Fin 2) [DecidableEq (BlockHeads s)] :
    Fintype.card (RowOrders color) =
      ∏ row : Fin 2, (Fintype.card (RowHeads color row)).factorial := by
  classical
  rw [Fintype.card_pi]
  apply Finset.prod_congr rfl
  intro row _
  have h := Fintype.card_congr
    ((Equiv.refl (RowHeads color row)).equivCongr (Fintype.equivFin (RowHeads color row)).symm)
  rwa [Fintype.card_perm] at h

/-- The product of row-order factorials summed over legal assignments. -/
noncomputable def factorialAssignmentCount {n : ℕ} (s : Finset (Fin (n - 2))) : ℕ := by
  classical
  exact ∑ color : (BlockHeads s → Fin 2), if FitsRows color then
    ∏ row : Fin 2, (Fintype.card (RowHeads color row)).factorial else 0

/-- The exact factorial count attached to each selection in inclusion–exclusion. -/
theorem card_edge_intersection_eq_factorials {n : ℕ} (s : Finset (Fin (n - 2))) :
    (s.inf edgeEvent).card = factorialAssignmentCount s := by
  classical
  unfold factorialAssignmentCount
  let pay (color : BlockHeads s → Fin 2) :=
    ∏ row : Fin 2, (Fintype.card (RowHeads color row)).factorial
  calc
    _ = Fintype.card (RowPlans s) := (Fintype.card_coe _).symm.trans
      (Fintype.card_congr (rowPlanEquiv s)).symm
    _ = ∑ color : {color : BlockHeads s → Fin 2 // FitsRows color}, pay color.1 := by
      rw [Fintype.card_sigma]
      apply Finset.sum_congr rfl
      intro c _
      exact card_rowOrders c.1
    _ = ∑ color ∈ Finset.univ.filter FitsRows, pay color :=
      (Finset.sum_subtype _ (by simp) pay).symm
    _ = _ := Finset.sum_filter _ _

end KauersKoutschan
