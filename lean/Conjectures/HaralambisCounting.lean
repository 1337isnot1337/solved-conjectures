import Conjectures.HaralambisIntervals
import Conjectures.LonelinessPacking
import Mathlib.Algebra.BigOperators.Ring.Finset

namespace Haralambis

noncomputable def occupancy (A : Set ℤ) (t : ℕ) : ℤ := by
  classical
  exact if (t : ℤ) ∈ A then 1 else 0

theorem occupancy_zero_or_one (A : Set ℤ) (t : ℕ) :
    occupancy A t = 0 ∨ occupancy A t = 1 := by
  classical
  by_cases h : (t : ℤ) ∈ A <;> simp [occupancy, h]

theorem occupancy_sum_count (A : Set ℤ) (n : ℕ) :
    (∑ t ∈ Finset.range n, occupancy A t) = (NonmixedGap.count A 0 n : ℤ) := by
  classical
  have hc : ((Finset.range n).filter (fun t : ℕ => (t : ℤ) ∈ A)).card =
      NonmixedGap.count A 0 n := by
    unfold NonmixedGap.count
    apply Finset.card_bij (fun (t : ℕ) _ => (t : ℤ))
    · intro t ht
      obtain ⟨htn, htA⟩ := Finset.mem_filter.mp ht
      have hlt := Finset.mem_range.mp htn
      exact NonmixedGap.mem_occupied.mpr ⟨by positivity, by exact_mod_cast hlt, htA⟩
    · intro t ht u hu he
      exact_mod_cast he
    · intro t ht
      obtain ⟨ht0, htn, htA⟩ := NonmixedGap.mem_occupied.mp ht
      have hcast : (t.toNat : ℤ) = t := Int.toNat_of_nonneg ht0
      refine ⟨t.toNat, ?_, hcast⟩
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_range.mpr ?_, ?_⟩
      · omega
      · simpa only [hcast] using htA
  simp only [occupancy, Finset.sum_boole, hc]

theorem mem_speeds (d : Fin 3 → ℕ) (i : Fin 3) : d i ∈ speeds d := by
  fin_cases i <;> simp [speeds]

theorem occupancy_avoids {d : Fin 3 → ℕ} {A : Set ℤ}
    (hA : Loneliness.Packing.Avoids (speeds d) A) (i : Fin 3) (t : ℕ) :
    occupancy A t + occupancy A (t + d i) ≤ 1 := by
  classical
  have hn := hA (d i) (mem_speeds d i) (t : ℤ)
  by_cases ht : (t : ℤ) ∈ A
  · have hnt : ((t + d i : ℕ) : ℤ) ∉ A := by
      simpa only [Nat.cast_add] using hn ht
    simp only [occupancy, ite_eq_left ht, ite_eq_right hnt, add_zero, le_refl]
  · simp only [occupancy, ite_eq_right ht, zero_add]
    split_ifs <;> omega

noncomputable def pairCount (d : Fin 3 → ℕ) (A : Set ℤ) (i j : Fin 3) : ℕ :=
  NonmixedGap.count A 0 ((d i + d j : ℕ) : ℤ)

noncomputable def pairRatio (d : Fin 3 → ℕ) (A : Set ℤ) (i j : Fin 3) : ℝ :=
  (pairCount d A i j : ℝ) / (d i + d j : ℕ)

noncomputable def minRatio (d : Fin 3 → ℕ) (A : Set ℤ) : ℝ :=
  min (pairRatio d A 0 1) (min (pairRatio d A 0 2) (pairRatio d A 1 2))

theorem pairRatio_comm (d : Fin 3 → ℕ) (A : Set ℤ) (i j : Fin 3) :
    pairRatio d A i j = pairRatio d A j i := by
  simp only [pairRatio, pairCount, Nat.add_comm]

theorem minRatio_nonneg (d : Fin 3 → ℕ) (A : Set ℤ) : 0 ≤ minRatio d A := by
  dsimp [minRatio, pairRatio]
  positivity

theorem minRatio_le_pair (d : Fin 3 → ℕ) (A : Set ℤ) (i j : Fin 3) (hij : i ≠ j) :
    minRatio d A ≤ pairRatio d A i j := by
  have h01 : minRatio d A ≤ pairRatio d A 0 1 := min_le_left _ _
  have h02 : minRatio d A ≤ pairRatio d A 0 2 :=
    (min_le_right _ _).trans (min_le_left _ _)
  have h12 : minRatio d A ≤ pairRatio d A 1 2 :=
    (min_le_right _ _).trans (min_le_right _ _)
  fin_cases i <;> fin_cases j
  all_goals first
    | exact (hij rfl).elim
    | exact h01
    | exact h02
    | exact h12
    | exact h01.trans_eq (pairRatio_comm d A 0 1)
    | exact h02.trans_eq (pairRatio_comm d A 0 2)
    | exact h12.trans_eq (pairRatio_comm d A 1 2)

theorem minRatio_le_value_of_periods (d : Fin 3 → ℕ) (A : Set ℤ)
    (hd : ∀ i, 0 < d i)
    (hperiods : ∃ w : Fin 3 → ℤ, (∀ i, w i % 2 = 1) ∧
      ∀ i j, i ≠ j → |(d j : ℤ) * w i - (d i : ℤ) * w j| ≤
        (d i : ℤ) + d j - 2 * ∑ t ∈ Finset.range (d i + d j), occupancy A t) :
    minRatio d A ≤ Loneliness.value (speeds d) := by
  obtain ⟨w, hw, hb⟩ := hperiods
  apply value_ge_of_odd_vector d w (minRatio d A) hd hw
  intro i j hij
  have hbound := hb i j hij
  rw [occupancy_sum_count] at hbound
  have hboundR : |(d j : ℝ) * w i - (d i : ℝ) * w j| ≤
      (d i : ℝ) + d j - 2 * (pairCount d A i j : ℝ) := by
    dsimp [pairCount]
    exact_mod_cast hbound
  have hpos : (0 : ℝ) < (d i + d j : ℕ) := by
    have hi := hd i
    have hj := hd j
    positivity
  have hratio := (le_div_iff₀ hpos).mp (minRatio_le_pair d A i j hij)
  push_cast at hratio
  nlinarith only [hboundR, hratio]

theorem short_interval_of_minRatio (d : Fin 3 → ℕ) (A : Set ℤ) (δ : ℝ)
    (hd : ∀ i, 0 < d i) (h : minRatio d A ≤ δ) :
    ∃ i j : Fin 3, i ≠ j ∧
      (pairCount d A i j : ℝ) ≤ δ * (d i + d j : ℕ) := by
  have hconvert : ∀ i j : Fin 3, pairRatio d A i j ≤ δ →
      (pairCount d A i j : ℝ) ≤ δ * (d i + d j : ℕ) := by
    intro i j hij
    apply (div_le_iff₀ ?_).mp hij
    have hi := hd i
    have hj := hd j
    positivity
  rcases min_le_iff.mp h with h01 | hrest
  · exact ⟨0, 1, by decide, hconvert 0 1 h01⟩
  · rcases min_le_iff.mp hrest with h02 | h12
    · exact ⟨0, 2, by decide, hconvert 0 2 h02⟩
    · exact ⟨1, 2, by decide, hconvert 1 2 h12⟩

end Haralambis
