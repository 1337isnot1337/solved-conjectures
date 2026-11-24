import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.Order.Interval.Set.Union
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

Right-endpoint step functions for the atom-safe log-tail integral estimate
in §4, equation (9), of the recorded proof at
`results/feldheim-weighted-tail/PROOF.md`, commit
`2f800fa5191a1d747f126fa20f7e9c2b3730b085`.

The half-open cells retain their right endpoints. This is essential when
the probability measure has atoms. These lemmas are components of the
weighted-tail proof and do not by themselves settle that conjecture.
-/

open Set MeasureTheory Filter Finset
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

def stieltjesGrid (a b : ℝ) (N i : ℕ) : ℝ := a + (b-a)*(i:ℝ)/(N:ℝ)

@[simp] theorem stieltjesGrid_zero (a b : ℝ) (N : ℕ) : stieltjesGrid a b N 0 = a := by
  simp [stieltjesGrid]

theorem stieltjesGrid_last (a b : ℝ) {N : ℕ} (hN : 0 < N) :
    stieltjesGrid a b N N = b := by
  have hn : (N:ℝ) ≠ 0 := by exact_mod_cast hN.ne'
  simp [stieltjesGrid, hn]

theorem stieltjesGrid_strictMono {a b : ℝ} (hab : a < b) {N : ℕ} (hN : 0 < N) :
    StrictMono (stieltjesGrid a b N) := by
  intro i j hij
  have hn : (0:ℝ) < N := by exact_mod_cast hN
  have hc : (i:ℝ) < j := by exact_mod_cast hij
  simpa only [stieltjesGrid, add_comm] using add_lt_add_left (div_lt_div_of_pos_right
    (mul_lt_mul_of_pos_left hc (sub_pos.mpr hab)) hn) a

theorem stieltjesGrid_step (a b : ℝ) (N i : ℕ) :
    stieltjesGrid a b N (i+1) - stieltjesGrid a b N i = (b-a)/(N:ℝ) := by
  simp only [stieltjesGrid, Nat.cast_add, Nat.cast_one]
  ring

theorem stieltjesGrid_cell_subset {a b : ℝ} (hab : a < b) {N : ℕ} (hN : 0 < N)
    {i : ℕ} (hi : i < N) :
    Ioc (stieltjesGrid a b N i) (stieltjesGrid a b N (i+1)) ⊆ Ioc a b := by
  have hm := (stieltjesGrid_strictMono hab hN).monotone
  intro x hx
  refine ⟨lt_of_le_of_lt ?_ hx.1, hx.2.trans ?_⟩
  · simpa using hm (Nat.zero_le i)
  · simpa [stieltjesGrid_last a b hN] using hm (Nat.succ_le_of_lt hi)

theorem exists_stieltjesGrid_cell {a b x : ℝ} {N : ℕ} (hN : 0 < N)
    (hx : x ∈ Ioc a b) :
    ∃ i ∈ range N, x ∈ Ioc (stieltjesGrid a b N i) (stieltjesGrid a b N (i+1)) := by
  have hx' : x ∈ Ioc (stieltjesGrid a b N 0) (stieltjesGrid a b N N) := by
    simpa [stieltjesGrid_last a b hN] using hx
  have hh := Ioc_subset_biUnion_Ioc N (stieltjesGrid a b N) hx'
  obtain ⟨i, hi⟩ := mem_iUnion.mp hh
  obtain ⟨hi, hc⟩ := mem_iUnion.mp hi
  exact ⟨i, hi, hc⟩

theorem stieltjesGrid_cell_unique {a b x : ℝ} (hab : a < b) {N : ℕ} (hN : 0 < N)
    {i j : ℕ}
    (hi : x ∈ Ioc (stieltjesGrid a b N i) (stieltjesGrid a b N (i+1)))
    (hj : x ∈ Ioc (stieltjesGrid a b N j) (stieltjesGrid a b N (j+1))) : i = j := by
  have hm := (stieltjesGrid_strictMono hab hN).monotone
  rcases lt_trichotomy i j with h | h | h
  · have := hm (Nat.succ_le_of_lt h)
    exact False.elim (not_lt_of_ge (hi.2.trans this) hj.1)
  · exact h
  · have := hm (Nat.succ_le_of_lt h)
    exact False.elim (not_lt_of_ge (hj.2.trans this) hi.1)

def stieltjesStep (f : ℝ → ℝ) (a b : ℝ) (N : ℕ) (x : ℝ) : ℝ :=
  ∑ i ∈ range N, (Ioc (stieltjesGrid a b N i) (stieltjesGrid a b N (i+1))).indicator
    (fun _ => f (stieltjesGrid a b N (i+1))) x

theorem stieltjesStep_eq_of_mem {f : ℝ → ℝ} {a b x : ℝ} (hab : a < b)
    {N : ℕ} (hN : 0 < N) {i : ℕ} (hi : i ∈ range N)
    (hx : x ∈ Ioc (stieltjesGrid a b N i) (stieltjesGrid a b N (i+1))) :
    stieltjesStep f a b N x = f (stieltjesGrid a b N (i+1)) := by
  unfold stieltjesStep
  rw [sum_eq_single i]
  · exact indicator_of_mem hx _
  · intro j _ hji
    apply indicator_of_notMem
    intro hj
    exact hji (stieltjesGrid_cell_unique hab hN hj hx)
  · intro h
    exact False.elim (h hi)

theorem stieltjesStep_eq_zero_of_notMem {f : ℝ → ℝ} {a b x : ℝ} (hab : a < b)
    {N : ℕ} (hN : 0 < N) (hx : x ∉ Ioc a b) : stieltjesStep f a b N x = 0 := by
  apply sum_eq_zero
  intro i hi
  apply indicator_of_notMem
  intro hc
  exact hx (stieltjesGrid_cell_subset hab hN (mem_range.mp hi) hc)

theorem stieltjesStep_measurable (f : ℝ → ℝ) (a b : ℝ) (N : ℕ) :
    Measurable (stieltjesStep f a b N) := by
  exact Finset.measurable_sum _ (fun i _ => measurable_const.indicator measurableSet_Ioc)

theorem stieltjesStep_integrable (f : ℝ → ℝ) (a b : ℝ) (N : ℕ)
    (μ : Measure ℝ) [IsFiniteMeasure μ] : Integrable (stieltjesStep f a b N) μ := by
  exact integrable_finsetSum _ (fun i _ => (integrable_const _).indicator measurableSet_Ioc)

theorem integral_stieltjesStep (f : ℝ → ℝ) (a b : ℝ) (N : ℕ)
    (μ : Measure ℝ) [IsFiniteMeasure μ] :
    ∫ x, stieltjesStep f a b N x ∂μ =
      ∑ i ∈ range N, μ.real (Ioc (stieltjesGrid a b N i) (stieltjesGrid a b N (i+1))) *
        f (stieltjesGrid a b N (i+1)) := by
  rw [show (fun x => stieltjesStep f a b N x) =
      fun x => ∑ i ∈ range N, (Ioc (stieltjesGrid a b N i)
        (stieltjesGrid a b N (i+1))).indicator
          (fun _ => f (stieltjesGrid a b N (i+1))) x from rfl]
  rw [integral_finsetSum _ (fun i _ => (integrable_const _).indicator measurableSet_Ioc)]
  apply sum_congr rfl
  intro i _
  rw [integral_indicator_const _ measurableSet_Ioc, smul_eq_mul]

theorem stieltjesStep_norm_le {f : ℝ → ℝ} {a b B : ℝ} (hab : a < b)
    {N : ℕ} (hN : 0 < N) (hB : 0 ≤ B)
    (hf : ∀ x ∈ Icc a b, ‖f x‖ ≤ B) (x : ℝ) :
    ‖stieltjesStep f a b N x‖ ≤ B := by
  by_cases hx : x ∈ Ioc a b
  · obtain ⟨i, hi, hcell⟩ := exists_stieltjesGrid_cell hN hx
    rw [stieltjesStep_eq_of_mem hab hN hi hcell]
    apply hf
    have hm := (stieltjesGrid_strictMono hab hN).monotone
    constructor
    · simpa using hm (Nat.zero_le (i+1))
    · simpa [stieltjesGrid_last a b hN] using hm (Nat.succ_le_of_lt (mem_range.mp hi))
  · rw [stieltjesStep_eq_zero_of_notMem hab hN hx, norm_zero]
    exact hB

end

end Conjectures.FeldheimWeightedTail
