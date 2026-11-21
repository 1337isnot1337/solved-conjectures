module

public import Conjectures.GrochenigSeriesCoefficients
public import Conjectures.GrochenigSeriesAnalytic
public import Conjectures.GrochenigDensityDefinitions
public import Mathlib.Topology.Algebra.InfiniteSum.NatInt

/-!
# The real shift sum and its entire extension

The same single coefficient sequence defines the real and complex sums.
Absolute summability justifies regrouping the integer shifts into finite
blocks, including the exact prefix, current block, and tail decomposition.
-/

@[expose] public section

namespace Grochenig

open Set
open scoped BigOperators Topology

noncomputable section

def seriesValue (center : ℕ → ℤ) (x : ℝ) : ℝ :=
  ∑' k : ℤ, coefficient center k * gaussian (x - (k : ℝ))

theorem seriesValue_eq (center : ℕ → ℤ) (x : ℝ) :
    seriesValue center x = ∑' k : ℤ, coefficient center k * gaussian (x - (k : ℝ)) := by
  simp only [seriesValue]

def entireValue (center : ℕ → ℤ) (z : ℂ) : ℂ :=
  ∑' k : ℤ, (coefficient center k : ℂ) * gaussianComplex (z - (k : ℂ))

theorem entireValue_eq (center : ℕ → ℤ) (z : ℂ) :
    entireValue center z =
      ∑' k : ℤ, (coefficient center k : ℂ) * gaussianComplex (z - (k : ℂ)) := by
  simp only [entireValue]

theorem seriesValue_hasSum (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ) :
    HasSum (fun k : ℤ => coefficient center k * gaussian (x - (k : ℝ)))
      (seriesValue center x) :=
  (gaussian_shift_summable (coefficient center) (coefficient_abs_summable center hinj) x).hasSum

theorem entireValue_hasSum (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (z : ℂ) :
    HasSum (fun k : ℤ => (coefficient center k : ℂ) * gaussianComplex (z - (k : ℂ)))
      (entireValue center z) :=
  (gaussian_complex_shift_summable (coefficient center)
    (coefficient_abs_summable center hinj) z).hasSum

theorem coefficient_gaussian_at_slot (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ)
    (n : ℕ) (k : Fin (n + 2)) :
    coefficient center (slotPosition center ⟨n, k⟩) *
        gaussian (x - (slotPosition center ⟨n, k⟩ : ℝ)) =
      blockCoeff (n + 1) k.val *
        gaussian ((x - (center n : ℝ)) - 2 * (k.val : ℝ)) := by
  rw [coefficient_at_slot center hinj]
  congr 1
  congr 1
  rw [slotPosition_eq]
  push_cast
  ring

theorem block_eq_slot_sum (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ) (n : ℕ) :
    block (n + 1) (x - (center n : ℝ)) =
      ∑ k : Fin (n + 2), coefficient center (slotPosition center ⟨n, k⟩) *
        gaussian (x - (slotPosition center ⟨n, k⟩ : ℝ)) := by
  rw [block_eq]
  apply Finset.sum_congr rfl
  intro k _
  exact (coefficient_gaussian_at_slot center hinj x n k).symm

/-- Regrouping preserves both convergence and the value of the original
integer-indexed Gaussian shift sum. -/
theorem grouped_blocks_hasSum (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ) :
    HasSum (fun n : ℕ => block (n + 1) (x - (center n : ℝ))) (seriesValue center x) := by
  have hsigma : HasSum
      (fun p : Σ n : ℕ, Fin (n + 2) => coefficient center (slotPosition center p) *
        gaussian (x - (slotPosition center p : ℝ))) (seriesValue center x) := by
    apply (hinj.hasSum_iff ?_).mpr (seriesValue_hasSum center hinj x)
    intro k hk
    rw [coefficient_off_range center k hk, zero_mul]
  apply hsigma.sigma
  intro n
  rw [block_eq_slot_sum center hinj x n]
  exact hasSum_fintype _

theorem grouped_blocks_summable (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ) :
    Summable (fun n : ℕ => block (n + 1) (x - (center n : ℝ))) :=
  (grouped_blocks_hasSum center hinj x).summable

theorem seriesValue_eq_grouped_blocks (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ) :
    seriesValue center x = ∑' n : ℕ, block (n + 1) (x - (center n : ℝ)) :=
  (grouped_blocks_hasSum center hinj x).tsum_eq.symm

/-- The exact decomposition used to preserve the signs of every finite block. -/
theorem seriesValue_eq_prefix_add_block_add_tail (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (n : ℕ) (x : ℝ) :
    seriesValue center x =
      (∑ i ∈ Finset.range n, block (i + 1) (x - (center i : ℝ))) +
        block (n + 1) (x - (center n : ℝ)) +
        ∑' k : ℕ, block (n + k + 2) (x - (center (n + k + 1) : ℝ)) := by
  rw [seriesValue_eq_grouped_blocks center hinj x,
    ← (grouped_blocks_summable center hinj x).sum_add_tsum_nat_add (n + 1),
    Finset.sum_range_succ]
  congr 1
  apply tsum_congr
  intro k
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem seriesValue_abs_le_one (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) (x : ℝ) :
    |seriesValue center x| ≤ 1 := by
  simpa only [seriesValue_eq, sum_abs_coefficient center hinj] using
    gaussian_shift_tsum_bound (coefficient center) (coefficient_abs_summable center hinj) x

theorem continuous_seriesValue (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) : Continuous (seriesValue center) :=
  continuous_gaussian_shift_tsum (coefficient center) (coefficient_abs_summable center hinj)

theorem differentiable_entireValue (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) : Differentiable ℂ (entireValue center) :=
  differentiable_gaussian_shift_tsum (coefficient center) (coefficient_abs_summable center hinj)

theorem entireValue_ofReal (center : ℕ → ℤ) (x : ℝ) :
    entireValue center (x : ℂ) = (seriesValue center x : ℂ) :=
  gaussian_shift_tsum_ofReal (coefficient center) x

theorem isBoundedShiftSum_seriesValue (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) :
    IsBoundedShiftSum gaussian (coefficient center) (seriesValue center) :=
  ⟨coefficient_bounded center hinj, seriesValue_hasSum center hinj⟩

theorem inVInfinity_seriesValue (center : ℕ → ℤ)
    (hinj : Function.Injective (slotPosition center)) :
    InVInfinity gaussian (seriesValue center) :=
  ⟨coefficient center, isBoundedShiftSum_seriesValue center hinj⟩

end

end Grochenig
