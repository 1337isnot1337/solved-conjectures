module

public import Conjectures.SteinkeZakynthinou.Adjacency
public import Conjectures.SteinkeZakynthinou.TreeStability

/-! Uniform replacement sensitivity and exact cancellation on inactive intervals. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

def cycleIndex (n j : ℕ) : Fin (cycleSize n) :=
  ⟨j % cycleSize n, Nat.mod_lt _ (cycleSize_pos n)⟩

theorem cycleIndex_val (n : ℕ) (i : Fin (cycleSize n)) : cycleIndex n i.val = i :=
  Fin.ext (Nat.mod_eq_of_lt i.isLt)

theorem cycleIndex_succ (n i : ℕ) : cycleIndex n (i + 1) = cycleIndex n i + 1 := by
  apply Fin.ext
  change (i + 1) % cycleSize n = (i % cycleSize n + 1 % cycleSize n) % cycleSize n
  exact Nat.add_mod _ _ _

theorem abs_cycle_sub_le {n : ℕ} (f : Fin (cycleSize n) → ℝ)
    (hf : ∀ i, |f (i + 1) - f i| ≤ 1) (a : Fin (cycleSize n)) {r s : ℕ} (h : r ≤ s) :
    |f (a + cycleIndex n s) - f (a + cycleIndex n r)| ≤ (s - r : ℕ) := by
  induction s, h using Nat.le_induction with
  | base => simp
  | succ s hs ih =>
    rw [cycleIndex_succ, ← add_assoc]
    apply (abs_sub_le _ (f (a + cycleIndex n s)) _).trans
    have he := hf (a + cycleIndex n s)
    have hsub : s + 1 - r = s - r + 1 := by omega
    rw [hsub, Nat.cast_add, Nat.cast_one]
    linarith

theorem taggedError_eq_rankError {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin (n + 1)) (i : Fin n) :
    taggedError (orderedCutKey z tag ht r) (z i) (tag i) =
      rankError (z i).2 ((sortedRows z tag ht).symm i) r := by
  let e := sortedRows z tag ht
  have hmono := sortedRows_strictMono z tag ht
  refine Fin.lastCases ?_ (fun j => ?_) r
  · have he : ¬ n ≤ ((sortedRows z tag ht).symm i).val :=
      not_le.mpr ((sortedRows z tag ht).symm i).isLt
    simp [orderedCutKey_last, taggedError, rankError, he]
  · rw [orderedCutKey_castSucc]
    have he : key (z (e j)) (tag (e j)) ≤ key (z i) (tag i) ↔ j ≤ e.symm i := by
      have hc := hmono.le_iff_le (a := j) (b := e.symm i)
      simpa [e] using hc
    simp [taggedError, rankError, e, (show _ from he)]

theorem cutAt_some_iff_rank {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin (n + 1)) (i : Fin n) :
    cutAt z tag ht r = some i ↔ r.val = ((sortedRows z tag ht).symm i).val := by
  refine Fin.lastCases ?_ (fun j => ?_) r
  · simp [cutAt]
    exact (Fin.isLt _).ne'
  · rw [cutAt, finSuccEquivLast_castSucc, Option.map_some, Option.some.injEq]
    change sortedRows z tag ht j = i ↔ j.val = ((sortedRows z tag ht).symm i).val
    rw [← (sortedRows z tag ht).eq_symm_apply, Fin.ext_iff]

variable {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n)

abbrev branchSelector (b : Bool) : Selector n := Function.update s i b
abbrev branchSample (b : Bool) : Sample n := select T (branchSelector s i b)
abbrev branchTag (b : Bool) : Fin n → ℕ := selectedTag (branchSelector s i b)

noncomputable def branchCut (b : Bool) (a : Fin (cycleSize n)) : Option (Fin n) :=
  cutAt (branchSample T s i b) (branchTag s i b) (selectedTag_injective _)
    (foldRank n a)

noncomputable def branchFoldEmbedding (b : Bool) :
    Fin (cycleSize n) ↪o Fin (cycleSize (n + 1)) :=
  foldedEmbedding ((branchInclusion T s i b).cutEmbedding
    (selectedTag_injective _) (unionTag_injective s i))

noncomputable def branchCost (b : Bool) (a : Fin (cycleSize n)) : ℝ :=
  virtualLoss (branchSample T s i b) (branchTag s i b) (branchCut T s i b a)

noncomputable def unionCost (a : Fin (cycleSize (n + 1))) : ℝ :=
  virtualLoss (unionSample T s i) (unionTag s i)
    (cutAt (unionSample T s i) (unionTag s i) (unionTag_injective s i) (foldRank (n + 1) a))

noncomputable def branchError (b : Bool) (a : Fin (cycleSize n)) (j : Fin n) : ℝ :=
  taggedError
    (orderedCutKey (branchSample T s i b) (branchTag s i b) (selectedTag_injective _) (foldRank n a))
    (branchSample T s i b j) (branchTag s i b j)

private theorem fold_key_eq {b : Bool} (a : Fin (cycleSize n)) :
    orderedCutKey (unionSample T s i) (unionTag s i) (unionTag_injective s i)
      (foldRank (n + 1) (branchFoldEmbedding T s i b a)) =
    orderedCutKey (branchSample T s i b) (branchTag s i b) (selectedTag_injective _) (foldRank n a) := by
  unfold branchFoldEmbedding
  rw [foldRank_foldedEmbedding]
  exact (branchInclusion T s i b).orderedCutKey_ordinal _ _ _

private theorem abs_unionCost_next_le (a : Fin (cycleSize (n + 1))) :
    |unionCost T s i (a + 1) - unionCost T s i a| ≤ 1 := by
  unfold unionCost
  rw [virtualLoss_cutAt_eq_rankLoss, virtualLoss_cutAt_eq_rankLoss]
  exact abs_foldRank_loss_next_le _ _

private theorem branchCost_eq (b : Bool) (a : Fin (cycleSize n)) :
    branchCost T s i b a =
      unionCost T s i (branchFoldEmbedding T s i b a) -
      taggedError
        (orderedCutKey (branchSample T s i b) (branchTag s i b) (selectedTag_injective _) (foldRank n a))
        (unionSample T s i (omittedRow i b)) (unionTag s i (omittedRow i b)) := by
  unfold branchCost branchCut unionCost branchFoldEmbedding
  rw [foldRank_foldedEmbedding]
  exact (branchInclusion T s i b).loss_eq_union_sub
    (selectedTag_injective _) (unionTag_injective s i) _ (omittedRow_not_mem i b) _

theorem shiftedCut_eq_branchCut (b : Bool) (a p : Fin (cycleSize n)) (j : ℕ) :
    cutAt (branchSample T s i b) Fin.val Fin.val_injective (shiftedRank n (a - p) j) =
      branchCut T s i b (a + (cycleIndex n j - p)) := by
  have he : cycleIndex n j + (a - p) = a + (cycleIndex n j - p) := by abel
  unfold branchCut shiftedRank cutAt
  change (finSuccEquivLast (foldRank n (cycleIndex n j + (a - p)))).map _ = _
  rw [he, sortedRows_selectedTag_eq]

private theorem branchCost_shift (b : Bool) (a p : Fin (cycleSize n)) (j : ℕ) :
    shiftedCost (branchSample T s i b) Fin.val Fin.val_injective (a - p) j =
      branchCost T s i b (a + (cycleIndex n j - p)) := by
  rw [← shiftedCost_selectedTag_eq _ (branchSelector s i b)]
  unfold shiftedCost branchCost branchCut shiftedRank
  have he : cycleIndex n j + (a - p) = a + (cycleIndex n j - p) := by abel
  change virtualLoss _ _ (cutAt _ _ _ (foldRank n (cycleIndex n j + (a - p)))) = _
  rw [he]

theorem abs_cost_difference_le (a₀ a₁ p : Fin (cycleSize n))
    (ha : branchFoldEmbedding T s i false a₀ = branchFoldEmbedding T s i true a₁)
    (j : ℕ) :
    |shiftedCost (branchSample T s i false) Fin.val Fin.val_injective (a₀ - p) j -
      shiftedCost (branchSample T s i true) Fin.val Fin.val_injective (a₁ - p) j| ≤ 3 := by
  let e₀ := branchFoldEmbedding T s i false
  let e₁ := branchFoldEmbedding T s i true
  let r := cycleIndex n j - p
  let x₀ := e₀ (a₀ + r) - e₀ a₀
  let x₁ := e₁ (a₁ + r) - e₁ a₁
  have hm : cycleSize (n + 1) = cycleSize n + 2 := by simp only [cycleSize]; omega
  have h₀ := orderEmbedding_bounds ((anchoredEmbedding e₀ a₀).trans
    (Fin.castOrderIso hm).toOrderEmbedding) r
  have h₁ := orderEmbedding_bounds ((anchoredEmbedding e₁ a₁).trans
    (Fin.castOrderIso hm).toOrderEmbedding) r
  change r.val ≤ x₀.val ∧ x₀.val ≤ r.val + 2 at h₀
  change r.val ≤ x₁.val ∧ x₁.val ≤ r.val + 2 at h₁
  have hu : |unionCost T s i (e₀ a₀ + x₀) - unionCost T s i (e₀ a₀ + x₁)| ≤ 2 := by
    rcases le_total x₀.val x₁.val with h | h
    · rw [abs_sub_comm]
      have hb := abs_cycle_sub_le (unionCost T s i) (abs_unionCost_next_le T s i)
        (e₀ a₀) h
      rw [cycleIndex_val, cycleIndex_val] at hb
      exact hb.trans (by exact_mod_cast (show x₁.val - x₀.val ≤ 2 by omega))
    · have hb := abs_cycle_sub_le (unionCost T s i) (abs_unionCost_next_le T s i)
        (e₀ a₀) h
      rw [cycleIndex_val, cycleIndex_val] at hb
      exact hb.trans (by exact_mod_cast (show x₀.val - x₁.val ≤ 2 by omega))
  have he₀ : e₀ a₀ + x₀ = e₀ (a₀ + r) := by dsimp [x₀]; abel
  have he₁ : e₀ a₀ + x₁ = e₁ (a₁ + r) := by
    change e₀ a₀ = e₁ a₁ at ha
    rw [ha]
    dsimp [x₁]
    abel
  rw [he₀, he₁] at hu
  rw [branchCost_shift, branchCost_shift, branchCost_eq, branchCost_eq]
  have hleft := taggedError_mem_Icc
    (orderedCutKey (branchSample T s i false) (branchTag s i false) (selectedTag_injective _)
      (foldRank n (a₀ + r)))
    (unionSample T s i (omittedRow i false)) (unionTag s i (omittedRow i false))
  have hright := taggedError_mem_Icc
    (orderedCutKey (branchSample T s i true) (branchTag s i true) (selectedTag_injective _)
      (foldRank n (a₁ + r)))
    (unionSample T s i (omittedRow i true)) (unionTag s i (omittedRow i true))
  rw [Set.mem_Icc] at hleft hright
  exact abs_le.mpr ⟨by linarith [(abs_le.mp hu).1, hleft.2, hright.1],
    by linarith [(abs_le.mp hu).2, hleft.1, hright.2]⟩

theorem branchFoldEmbedding_cutAt (b : Bool) (a : Fin (cycleSize n)) :
    cutAt (unionSample T s i) (unionTag s i) (unionTag_injective s i)
      (foldRank (n + 1) (branchFoldEmbedding T s i b a)) =
    (branchCut T s i b a).map (replacementRow i b) := by
  unfold branchFoldEmbedding
  rw [foldRank_foldedEmbedding]
  exact (branchInclusion T s i b).cutAt_cutEmbedding _ _ _

theorem branchFoldEmbedding_mem_common_of_ne (b : Bool) (a : Fin (cycleSize n))
    (h : branchCut T s i b a ≠ some i) :
    branchFoldEmbedding T s i b a ∈ Set.range (branchFoldEmbedding T s i (!b)) := by
  unfold branchFoldEmbedding
  rw [mem_range_foldedEmbedding, (branchInclusion T s i (!b)).mem_range_cutEmbedding]
  intro r hr
  conv at hr => lhs; change cutAt _ _ _ (foldRank (n + 1) (branchFoldEmbedding T s i b a))
  rw [branchFoldEmbedding_cutAt] at hr
  cases hq : branchCut T s i b a with
  | none => simp [hq] at hr
  | some j =>
    simp only [hq, Option.map_some, Option.some.injEq] at hr
    rw [← hr]
    exact mem_range_other_of_ne i j (fun hj => h (hj ▸ hq)) b

/-- The two branch views of a common interval have exactly the same cuts. -/
theorem inactive_align (a₀ a₁ p l u : Fin (cycleSize n)) (hl : l ≤ p) (hu : p ≤ u)
    (ha : branchFoldEmbedding T s i false a₀ = branchFoldEmbedding T s i true a₁)
    (h₀ : ∀ j, l ≤ j → j ≤ u → branchCut T s i false (a₀ + (j - p)) ≠ some i)
    (h₁ : ∀ j, l ≤ j → j ≤ u → branchCut T s i true (a₁ + (j - p)) ≠ some i)
    (j : Fin (cycleSize n)) (hj₀ : l ≤ j) (hj₁ : j ≤ u) :
    branchFoldEmbedding T s i false (a₀ + (j - p)) =
      branchFoldEmbedding T s i true (a₁ + (j - p)) := by
  let e₀ := branchFoldEmbedding T s i false
  let e₁ := branchFoldEmbedding T s i true
  let f := anchoredEmbedding e₀ a₀
  let g := anchoredEmbedding e₁ a₁
  have hg₀ (k : Fin (cycleSize n)) (hkl : l ≤ k) (hku : k ≤ u) :
      f (k - p) ∈ Set.range g := by
    obtain ⟨v, hv⟩ := branchFoldEmbedding_mem_common_of_ne T s i false _ (h₀ k hkl hku)
    use v - a₁
    change e₁ (a₁ + (v - a₁)) - e₁ a₁ = e₀ (a₀ + (k - p)) - e₀ a₀
    change e₁ v = e₀ (a₀ + (k - p)) at hv
    change e₀ a₀ = e₁ a₁ at ha
    rw [show a₁ + (v - a₁) = v by abel, ← ha, hv]
  have hg₁ (k : Fin (cycleSize n)) (hkl : l ≤ k) (hku : k ≤ u) :
      g (k - p) ∈ Set.range f := by
    obtain ⟨v, hv⟩ := branchFoldEmbedding_mem_common_of_ne T s i true _ (h₁ k hkl hku)
    use v - a₀
    change e₀ (a₀ + (v - a₀)) - e₀ a₀ = e₁ (a₁ + (k - p)) - e₁ a₁
    change e₀ v = e₁ (a₁ + (k - p)) at hv
    change e₀ a₀ = e₁ a₁ at ha
    rw [show a₀ + (v - a₀) = v by abel, ha, hv]
  have he := aligned_interval_eq f g f.strictMono g.strictMono l p u hl hu hg₀ hg₁ j hj₀ hj₁
  change e₀ (a₀ + (j - p)) - e₀ a₀ = e₁ (a₁ + (j - p)) - e₁ a₁ at he
  rw [ha] at he
  exact sub_left_injective he

private theorem branchError_next_eq_of_no_crossing (b : Bool) (a : Fin (cycleSize n))
    (h₀ : branchCut T s i b a ≠ some i) (h₁ : branchCut T s i b (a + 1) ≠ some i) :
    branchError T s i b (a + 1) i = branchError T s i b a i := by
  unfold branchError
  rw [taggedError_eq_rankError, taggedError_eq_rankError]
  apply foldRank_error_next_eq_of_no_crossing
  · exact fun h => h₀ ((cutAt_some_iff_rank _ _ _ _ _).mpr h)
  · exact fun h => h₁ ((cutAt_some_iff_rank _ _ _ _ _).mpr h)

private theorem branchError_constant_on_interval (b : Bool) (a p : Fin (cycleSize n))
    (l u : ℕ) (h : ∀ j, l ≤ j → j ≤ u →
      branchCut T s i b (a + (cycleIndex n j - p)) ≠ some i) :
    ∀ j, l ≤ j → j ≤ u →
      branchError T s i b (a + (cycleIndex n j - p)) i =
      branchError T s i b (a + (cycleIndex n l - p)) i := by
  intro j hlj hju
  induction j, hlj using Nat.le_induction with
  | base => rfl
  | succ j hlj ih =>
    rw [← ih (by omega)]
    have he : a + (cycleIndex n (j + 1) - p) = (a + (cycleIndex n j - p)) + 1 := by
      rw [cycleIndex_succ]
      abel
    rw [he]
    exact branchError_next_eq_of_no_crossing T s i b _ (h j hlj (by omega))
      (he ▸ h (j + 1) (by omega) hju)

theorem shiftedCost_eq_add_on_inactive (a₀ a₁ p l u : Fin (cycleSize n))
    (hl : l ≤ p) (hu : p ≤ u)
    (ha : branchFoldEmbedding T s i false a₀ = branchFoldEmbedding T s i true a₁)
    (h₀ : ∀ j, l ≤ j → j ≤ u → branchCut T s i false (a₀ + (j - p)) ≠ some i)
    (h₁ : ∀ j, l ≤ j → j ≤ u → branchCut T s i true (a₁ + (j - p)) ≠ some i) :
    ∃ c : ℝ, ∀ j : Fin (cycleSize n), l ≤ j → j ≤ u →
      shiftedCost (branchSample T s i false) Fin.val Fin.val_injective (a₀ - p) j.val =
        shiftedCost (branchSample T s i true) Fin.val Fin.val_injective (a₁ - p) j.val + c := by
  refine ⟨branchError T s i false (a₀ + (l - p)) i -
    branchError T s i true (a₁ + (l - p)) i, ?_⟩
  intro j hjl hju
  let x := a₀ + (j - p)
  let y := a₁ + (j - p)
  rw [branchCost_shift, branchCost_shift, cycleIndex_val, branchCost_eq, branchCost_eq]
  have hxy := inactive_align T s i a₀ a₁ p l u hl hu ha h₀ h₁ j hjl hju
  change branchFoldEmbedding T s i false x = branchFoldEmbedding T s i true y at hxy
  rw [hxy]
  have hkey := fold_key_eq T s i (b := false) x
  rw [hxy, fold_key_eq T s i y] at hkey
  have hc₀ : branchError T s i false x i = branchError T s i false (a₀ + (l - p)) i := by
    have hnat (k : ℕ) (hkl : l.val ≤ k) (hku : k ≤ u.val) :
        branchCut T s i false (a₀ + (cycleIndex n k - p)) ≠ some i := by
      let v : Fin (cycleSize n) := ⟨k, hku.trans_lt u.isLt⟩
      change branchCut T s i false (a₀ + (cycleIndex n v.val - p)) ≠ some i
      rw [cycleIndex_val]
      exact h₀ v hkl hku
    simpa only [cycleIndex_val, x] using branchError_constant_on_interval T s i false a₀ p
      l.val u.val hnat j.val hjl hju
  have hc₁ : branchError T s i true y i = branchError T s i true (a₁ + (l - p)) i := by
    have hnat (k : ℕ) (hkl : l.val ≤ k) (hku : k ≤ u.val) :
        branchCut T s i true (a₁ + (cycleIndex n k - p)) ≠ some i := by
      let v : Fin (cycleSize n) := ⟨k, hku.trans_lt u.isLt⟩
      change branchCut T s i true (a₁ + (cycleIndex n v.val - p)) ≠ some i
      rw [cycleIndex_val]
      exact h₁ v hkl hku
    simpa only [cycleIndex_val, y] using branchError_constant_on_interval T s i true a₁ p
      l.val u.val hnat j.val hjl hju
  have ho (b : Bool) : omittedRow i b = replacementRow i (!b) i := by
    cases b <;> simp [omittedRow, replacementRow]
  have ho₀ := (branchInclusion T s i true).obs_eq i
  have ht₀ := (branchInclusion T s i true).tag_eq i
  have ho₁ := (branchInclusion T s i false).obs_eq i
  have ht₁ := (branchInclusion T s i false).tag_eq i
  change unionSample T s i (replacementRow i true i) = branchSample T s i true i at ho₀
  change unionTag s i (replacementRow i true i) = branchTag s i true i at ht₀
  change unionSample T s i (replacementRow i false i) = branchSample T s i false i at ho₁
  change unionTag s i (replacementRow i false i) = branchTag s i false i at ht₁
  have he₀ : omittedRow i false = replacementRow i true i := ho false
  have he₁ : omittedRow i true = replacementRow i false i := ho true
  rw [he₀, he₁, ho₀, ht₀, ho₁, ht₁]
  have he : taggedError (orderedCutKey (branchSample T s i false) (branchTag s i false)
        (selectedTag_injective _) (foldRank n x)) (branchSample T s i true i)
        (branchTag s i true i) = branchError T s i true y i := by
    rw [← hkey]
    rfl
  have he' : taggedError (orderedCutKey (branchSample T s i true) (branchTag s i true)
        (selectedTag_injective _) (foldRank n y)) (branchSample T s i false i)
        (branchTag s i false i) = branchError T s i false x i := by
    rw [hkey]
    rfl
  rw [he, he', hc₀, hc₁]
  ring

end SteinkeZakynthinou
