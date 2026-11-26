import Conjectures.KauersKoutschanConjecture
import Conjectures.KauersKoutschanSupplementEvaluation

/-! The separate Spahn–Zeilberger order-thirteen recurrence for A189281. -/

open scoped BigOperators

namespace KauersKoutschan

open KauersKoutschanCertificate

private def derangementPrefix (t : ℕ) : List ℚ :=
  (List.range t).foldl
    (fun ds k => ds ++ [(k + 1 : ℕ) * ds[k]! + signed (k + 1)]) [1]

private theorem derangementPrefix_succ (t : ℕ) :
    derangementPrefix (t + 1) =
      derangementPrefix t ++ [(t + 1 : ℕ) * (derangementPrefix t)[t]! + signed (t + 1)] := by
  simp only [derangementPrefix, List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]

private theorem derangementPrefix_length (t : ℕ) : (derangementPrefix t).length = t + 1 := by
  induction t with
  | zero => rfl
  | succ t ih => simp [derangementPrefix_succ, ih]

private theorem derangementPrefix_get (t j : ℕ) (hj : j ≤ t) :
    (derangementPrefix t)[j]! = derangement j := by
  induction t generalizing j with
  | zero =>
    have h : j = 0 := by omega
    subst j
    norm_num [derangementPrefix, derangement, sign, moment]
  | succ t ih =>
    let x : ℚ := (t + 1 : ℕ) * (derangementPrefix t)[t]! + signed (t + 1)
    let ds := derangementPrefix t
    have hl : ds.length = t + 1 := derangementPrefix_length t
    rw [derangementPrefix_succ]
    change (ds ++ [x])[j]! = _
    by_cases h : j ≤ t
    · rw [getElem!_pos _ _ (by simp [hl]; omega), List.getElem_append_left (by omega),
        ← getElem!_pos ds j (by omega)]
      exact ih j h
    · have h' : j = t + 1 := by omega
      subst j
      rw [getElem!_pos _ _ (by simp [hl]), List.getElem_append_right (by omega)]
      simp only [hl, Nat.sub_self, List.getElem_cons_zero, x, ih t le_rfl,
        signed_eq_sign, derangement_succ, Nat.cast_add, Nat.cast_one]

private theorem mask_cutoff_bounds (n mask j : ℕ) (hj : j ≤ (cells n mask).2.toNat) :
    j ≤ (cells n mask).1 - j ∧ (cells n mask).1 ≤ n + 1 := by
  unfold cells at *
  simp only [Int.ofNat_eq_natCast] at *
  omega

private theorem directCount_eq_finiteSumCount (n : ℕ) : directCount n = finiteSumCount n := by
  let f (mask : ℕ) :=
    if (cells n mask).2 < 0 then 0 else
      ∑ j ∈ Finset.range ((cells n mask).2.toNat + 1), dividedDifference ((cells n mask).1 - j) j
  unfold directCount
  change _ = ∑ mask ∈ Finset.range 16, f mask
  rw [← zero_add (∑ mask ∈ Finset.range 16, f mask), ← foldl_range_add]
  dsimp only
  congr 1
  funext acc mask
  dsimp only [f]
  rw [add_ite, add_zero]
  split
  · rfl
  · congr 1
    rw [foldl_range_add, zero_add]
    apply Finset.sum_congr rfl
    intro j hj
    have hj' := Finset.mem_range.mp hj
    have ⟨hjk, hm⟩ := mask_cutoff_bounds n mask j (by omega)
    change (_ * (derangementPrefix (n + 1))[_]! -
      _ * (derangementPrefix (n + 1))[j]!) / _ = _
    rw [derangementPrefix_get _ _ (by omega), derangementPrefix_get _ _ (by omega), dividedDifference]
    rw [signed_eq_sign, signed_eq_sign, Nat.cast_sub hjk]

private theorem finiteSumCount_orderThirteen_shift (h t : ℕ) (ht : t = 4 ∨ t = 5) :
    orderThirteen ((2 * h + t : ℕ) : ℚ) (fun j => finiteSumCount (2 * h + t + j)) = 0 := by
  have hn : ((2 * h + t : ℕ) : ℚ) = t + 2 * (h : ℚ) := by push_cast; ring
  rw [hn]
  refine (orderThirteen_congr _ _ _ ?_).trans
    (orderThirteen_linear_combination (h : ℚ) t ht (initialComponents h))
  intro j hj
  rw [show 2 * h + t + j = 2 * h + (t + j) by omega,
    finiteSumCount_eq_shifted h (t + j) (by omega), ← combine_count h (t + j) (by omega)]
  rfl

theorem finiteSumCount_orderThirteen (n : ℕ) :
    orderThirteen n (fun j => finiteSumCount (n + j)) = 0 := by
  by_cases hn : 4 ≤ n
  · let h := (n - 4) / 2
    let t := 4 + (n - 4) % 2
    have ht : t = 4 ∨ t = 5 := by dsimp [t]; omega
    have hn' : n = 2 * h + t := by dsimp [h, t]; omega
    rw [hn']
    exact finiteSumCount_orderThirteen_shift h t ht
  · simpa only [directCount_eq_finiteSumCount] using orderThirteen_directCount_initial n (by omega)

/-- The alternate published recurrence annihilates the actual A189281 permutation count. -/
theorem permutationCount_orderThirteen (n : ℕ) :
    orderThirteen n (fun j => (permutationCount (n + j) : ℚ)) = 0 := by
  simpa only [permutationCount_eq_finiteSumCount] using finiteSumCount_orderThirteen n

end KauersKoutschan
