module

public import Conjectures.SteinkeZakynthinou.Learner

/-! Binary loss along the folded cycle and its single-observation changes. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

noncomputable def rankError {n : ℕ} (label : Bool) (i : Fin n) (r : Fin (n + 1)) : ℝ :=
  if (decide (r.val ≤ i.val) : Bool) = label then 0 else 1

noncomputable def rankLoss {n : ℕ} (label : Fin n → Bool) (r : Fin (n + 1)) : ℝ :=
  ∑ i, rankError (label i) i r

theorem virtualLoss_cutAt_eq_rankLoss {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin (n + 1)) :
    virtualLoss z tag (cutAt z tag ht r) =
      rankLoss (fun j => (z (sortedRows z tag ht j)).2) r := by
  let e := sortedRows z tag ht
  let f := fun k => key (z (e k)) (tag (e k))
  have hmono : StrictMono f := sortedRows_strictMono z tag ht
  unfold virtualLoss rankLoss
  rw [← e.sum_comp]
  apply Finset.sum_congr rfl
  intro i _
  refine Fin.lastCases ?_ (fun j => ?_) r
  · have hi := i.isLt
    simp [cutAt, virtualPredict, rankError, Nat.not_le.mpr hi, e]
  · have he : key (z (e j)) (tag (e j)) ≤ key (z (e i)) (tag (e i)) ↔ j.val ≤ i.val :=
      hmono.le_iff_le
    simp [cutAt, virtualPredict, rankError, e, (show _ from he)]

theorem foldRank_next_close (n : ℕ) (j : Fin (cycleSize n)) :
    (foldRank n (j + 1)).val ≤ (foldRank n j).val + 1 ∧
      (foldRank n j).val ≤ (foldRank n (j + 1)).val + 1 := by
  unfold foldRank
  have hj := j.isLt
  have h1 : (1 : Fin (cycleSize n)).val = 1 := by
    change 1 % cycleSize n = 1
    exact Nat.mod_eq_of_lt (by change 1 < 2 * n + 1 + 1; omega)
  have hnext := Fin.val_add_eq_ite j (1 : Fin (cycleSize n))
  rw [h1] at hnext
  simp only [cycleSize] at hj hnext ⊢
  split_ifs at hnext ⊢
  all_goals
    simp only [cycleSize] at *
    omega

theorem rankError_eq_of_no_crossing {n : ℕ} (label : Bool)
    (i : Fin n) (r s : Fin (n + 1))
    (h₀ : r.val ≤ s.val + 1) (h₁ : s.val ≤ r.val + 1)
    (hr : r.val ≠ i.val) (hs : s.val ≠ i.val) :
    rankError label i r = rankError label i s := by
  have h : r.val ≤ i.val ↔ s.val ≤ i.val := by omega
  simp [rankError, h]

theorem abs_rankLoss_sub_le_of_close {n : ℕ} (label : Fin n → Bool)
    (r s : Fin (n + 1)) (h₀ : r.val ≤ s.val + 1) (h₁ : s.val ≤ r.val + 1) :
    |rankLoss label r - rankLoss label s| ≤ 1 := by
  wlog h : r.val ≤ s.val generalizing r s
  · rw [abs_sub_comm]
    exact this s r h₁ h₀ (by omega)
  by_cases hre : r = s
  · simp [hre]
  have hne : r.val ≠ s.val := fun he => hre (Fin.ext he)
  have h' : s.val = r.val + 1 := by omega
  have hs := s.isLt
  let i : Fin n := ⟨r.val, by omega⟩
  have hsingle (k : Fin n) (hk : k ≠ i) : rankError (label k) k r - rankError (label k) k s = 0 := by
    have hne' : k.val ≠ r.val := fun h => hk (Fin.ext h)
    have hiff : r.val ≤ k.val ↔ s.val ≤ k.val := by omega
    simp [rankError, hiff]
  unfold rankLoss
  rw [← Finset.sum_sub_distrib, Finset.sum_eq_single i]
  · unfold rankError
    split_ifs <;> norm_num
  · intro k _ hk
    exact hsingle k hk
  · simp

/-- Consecutive positions on the cycle differ in total loss by at most one,
including the circular boundary and the two copies of the last cut. -/
theorem abs_foldRank_loss_next_le {n : ℕ} (label : Fin n → Bool)
    (j : Fin (cycleSize n)) :
    |rankLoss label (foldRank n (j + 1)) - rankLoss label (foldRank n j)| ≤ 1 :=
  abs_rankLoss_sub_le_of_close _ _ _ (foldRank_next_close _ _).1 (foldRank_next_close _ _).2

theorem foldRank_error_next_eq_of_no_crossing {n : ℕ} (label : Bool)
    (i : Fin n) (j : Fin (cycleSize n))
    (h₀ : (foldRank n j).val ≠ i.val) (h₁ : (foldRank n (j + 1)).val ≠ i.val) :
    rankError label i (foldRank n (j + 1)) = rankError label i (foldRank n j) :=
  rankError_eq_of_no_crossing _ _ _ _ (foldRank_next_close _ _).1
    (foldRank_next_close _ _).2 h₁ h₀

end SteinkeZakynthinou
