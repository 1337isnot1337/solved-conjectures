import Conjectures.HornakPacking
import Mathlib.Data.Fintype.Pi

/-! The finite maximum M(K) and its one-step carry-budget bound. -/
namespace Hornak
open scoped BigOperators

noncomputable def choices (m K : ℕ) : Finset (Fin m → Fin (K+1)) := by
  classical
  exact Finset.univ.filter (fun f => (∑ j, (f j).val) ≤ K)

noncomputable def score {m K : ℕ} (capacity : Fin m → ℕ) (i : ℕ)
    (f : Fin m → Fin (K+1)) : ℕ :=
  ∑ j, armAllowance (capacity j) i (f j).val

noncomputable def maxLarge {m : ℕ} (capacity : Fin m → ℕ) (i K : ℕ) : ℕ :=
  (choices m K).sup (score capacity i)

theorem score_le_maxLarge {m : ℕ} (capacity budget : Fin m → ℕ) (i K : ℕ)
    (hb : (∑ j, budget j) ≤ K) :
    (∑ j, armAllowance (capacity j) i (budget j)) ≤ maxLarge capacity i K := by
  classical
  let f : Fin m → Fin (K+1) := fun j => ⟨budget j, by
    have h := Finset.single_le_sum (s := Finset.univ) (f := budget)
      (fun _ _ => Nat.zero_le _) (Finset.mem_univ j)
    omega⟩
  have hf : f ∈ choices m K := by
    simp [choices, f, hb]
  have h := Finset.le_sup (f := score capacity i) hf
  simpa [score, f, maxLarge] using h

theorem maxLarge_mono {m : ℕ} (capacity : Fin m → ℕ) (i K : ℕ) :
    maxLarge capacity i K ≤ maxLarge capacity i (K+1) := by
  classical
  unfold maxLarge
  apply Finset.sup_le
  intro f hf
  have h := (Finset.mem_filter.mp hf).2
  exact score_le_maxLarge capacity (fun j => (f j).val) i (K+1) (by omega)

theorem maxLarge_step {m : ℕ} (capacity : Fin m → ℕ) (i K : ℕ) :
    maxLarge capacity i (K+1) ≤ maxLarge capacity i K + i := by
  classical
  unfold maxLarge at ⊢
  apply Finset.sup_le
  intro f hf
  have h := (Finset.mem_filter.mp hf).2
  by_cases hsmall : (∑ j, (f j).val) ≤ K
  · have hx := score_le_maxLarge capacity (fun j => (f j).val) i K hsmall
    dsimp [score] at ⊢
    unfold maxLarge at hx
    omega
  · have heq : (∑ j, (f j).val) = K+1 := by omega
    obtain ⟨reduced, _, hsum, hscore⟩ :=
      allowance_remove_one Finset.univ capacity (fun j => (f j).val) i K heq
    have hmax := score_le_maxLarge capacity reduced i K (by simpa using hsum.le)
    dsimp [score] at ⊢
    unfold maxLarge at hmax
    omega

/-- The maximum has the exact allocation meaning used in the paper: the
larger pieces fit within the given carry-cost budget. -/
theorem large_packing_iff {m : ℕ} (capacity : Fin m → ℕ) (i K b : ℕ) (hi : 0 < i) :
    (∃ large : Fin m → ℕ, (∑ j, large j) = b ∧
      (∀ j, large j*(i+1) ≤ capacity j) ∧
      (∑ j, carryCost i (capacity j%i) (large j)) ≤ K) ↔
    b ≤ maxLarge capacity i K := by
  classical
  constructor
  · rintro ⟨large, hsum, hfit, hcost⟩
    rw [← hsum]
    calc
      (∑ j, large j) ≤ ∑ j, armAllowance (capacity j) i (carryCost i (capacity j%i) (large j)) := by
        apply Finset.sum_le_sum
        intro j _
        exact (armAllowance_iff _ _ _ _ hi).2 ⟨hfit j, le_rfl⟩
      _ ≤ maxLarge capacity i K := score_le_maxLarge capacity
        (fun j => carryCost i (capacity j%i) (large j)) i K hcost
  · intro hb
    have hne : (choices m K).Nonempty := by
      let zero : Fin m → Fin (K+1) := fun _ => ⟨0, by omega⟩
      refine ⟨zero, ?_⟩
      simp [choices, zero]
    obtain ⟨f,hf,hmax⟩ := Finset.exists_mem_eq_sup (choices m K) hne (score capacity i)
    have hbudget := (Finset.mem_filter.mp hf).2
    have hb' : b ≤ ∑ j, armAllowance (capacity j) i (f j).val := by
      simpa [maxLarge, score, hmax] using hb
    obtain ⟨large, hlarge, hsum⟩ := allocate Finset.univ
      (fun j => armAllowance (capacity j) i (f j).val) b hb'
    refine ⟨large, hsum, ?_, ?_⟩
    · intro j
      exact ((armAllowance_iff _ _ _ _ hi).1 (hlarge j (Finset.mem_univ j))).1
    · calc
        (∑ j, carryCost i (capacity j%i) (large j)) ≤ ∑ j, (f j).val := by
          apply Finset.sum_le_sum
          intro j _
          exact ((armAllowance_iff _ _ _ _ hi).1 (hlarge j (Finset.mem_univ j))).2
        _ ≤ K := hbudget

/-- Complete two-size arm-packing criterion from Section 1, with the
nonnegative budget `K` expressed by its exact additive equation. -/
theorem two_size_packing_iff {m : ℕ} (capacity : Fin m → ℕ) (i a b K : ℕ)
    (hi : 0 < i) (hbudget : a+b+K = ∑ j, capacity j/i) :
    (∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j) ↔
    b ≤ maxLarge capacity i K := by
  classical
  constructor
  · rintro ⟨small,large,hsmall,hlarge,hfit⟩
    have hb : ∀ j ∈ Finset.univ, large j*(i+1) ≤ capacity j := by
      intro j _
      have h := hfit j
      omega
    have hcost := (fixed_large_budget_iff Finset.univ capacity large i a hi hb).1
      ⟨small, (fun j _ => hfit j), hsmall⟩
    apply (large_packing_iff capacity i K b hi).1
    refine ⟨large, hlarge, (fun j => hb j (Finset.mem_univ j)), ?_⟩
    rw [hlarge, ← hbudget] at hcost
    omega
  · intro hb
    obtain ⟨large,hlarge,hfit,hcost⟩ := (large_packing_iff capacity i K b hi).2 hb
    have hb' : ∀ j ∈ Finset.univ, large j*(i+1) ≤ capacity j := fun j _ => hfit j
    have h := (fixed_large_budget_iff Finset.univ capacity large i a hi hb').2 (by
      rw [hlarge, ← hbudget]
      omega)
    obtain ⟨small,hfit',hsmall⟩ := h
    exact ⟨small,large,hsmall,hlarge,fun j => hfit' j (Finset.mem_univ j)⟩

/-- Transfer feasibility from one endpoint to the next smaller larger-piece
count while preserving the total number of occupied vertices. -/
theorem transfer_to_fewer_large {m : ℕ} (capacity : Fin m → ℕ) (i a b K : ℕ)
    (hi : 0 < i) (hbudget : (a+i+1)+b+K = ∑ j, capacity j/i)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b+i ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a+i+1 ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  have hbigger : a+(b+i)+(K+1) = ∑ j, capacity j/i := by omega
  have h := (two_size_packing_iff capacity i a (b+i) (K+1) hi hbigger).1 hfeasible
  have hstep := maxLarge_step capacity i K
  apply (two_size_packing_iff capacity i (a+i+1) b K hi hbudget).2
  omega

end Hornak
