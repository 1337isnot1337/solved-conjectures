import Conjectures.KauersKoutschanCertificate
import Conjectures.KauersKoutschanDividedSum

/-! The sixteen numerator choices in the literal finite-sum formula. -/

open scoped BigOperators

namespace KauersKoutschan

open KauersKoutschanCertificate (bit cells)

private theorem bit_le_one (mask i : ℕ) : bit mask i ≤ 1 := by
  unfold bit
  omega

theorem cells_shift (h t mask : ℕ) (ht : 4 ≤ t) :
    cells (2 * h + t) mask = (2 * h + (cells t mask).1, (h : ℤ) + (cells t mask).2) := by
  have ha := bit_le_one mask 0
  have hb := bit_le_one mask 1
  have hc := bit_le_one mask 2
  have hd := bit_le_one mask 3
  have hp : (2 * h + t + 1) / 2 = h + (t + 1) / 2 := by omega
  have hq : (2 * h + t) / 2 = h + t / 2 := by omega
  simp only [cells, hp, hq, Int.natCast_add, Int.ofNat_eq_natCast, add_sub_assoc, ← add_min, Prod.mk.injEq, and_true]
  omega

private theorem cells_cutoff (t mask : ℕ) (ht : 4 ≤ t) :
    0 ≤ (cells t mask).2 ∧ (cells t mask).2.toNat + 1 ≤ ((cells t mask).1 + 1) / 2 := by
  have ha := bit_le_one mask 0
  have hb := bit_le_one mask 1
  have hc := bit_le_one mask 2
  have hd := bit_le_one mask 3
  unfold cells
  simp only [Int.ofNat_eq_natCast]
  omega

/-- Equation (4), expressed directly as sums of the sixteen mask contributions. -/
def finiteSumCount (n : ℕ) : ℚ :=
  ∑ mask ∈ Finset.range 16,
    if (cells n mask).2 < 0 then 0 else
      ∑ j ∈ Finset.range ((cells n mask).2.toNat + 1),
        dividedDifference ((cells n mask).1 - j) j

/-- Equation (6), evaluated on the literal shifted derangement moments. -/
def shiftedSumCount (h t : ℕ) : ℚ :=
  ∑ mask ∈ Finset.range 16,
    let s := (cells t mask).1
    let cutoff := (cells t mask).2.toNat + 1
    dividedSum (2 * h + s) -
      ∑ i ∈ Finset.range ((s + 1) / 2 - cutoff),
        sign s * (moment (h + s - (cutoff + i)) - moment (h + (cutoff + i))) /
          ((s - 2 * (cutoff + i) : ℕ) : ℚ)

theorem finiteSumCount_eq_shifted (h t : ℕ) (ht : 4 ≤ t) :
    finiteSumCount (2 * h + t) = shiftedSumCount h t := by
  unfold finiteSumCount shiftedSumCount
  apply Finset.sum_congr rfl
  intro mask _
  have hc := cells_cutoff t mask ht
  rw [cells_shift h t mask ht]
  have hnonneg : ¬ (h : ℤ) + (cells t mask).2 < 0 := by omega
  have hcut : ((h : ℤ) + (cells t mask).2).toNat + 1 = h + ((cells t mask).2.toNat + 1) := by
    omega
  simp only [ite_eq_right hnonneg, hcut]
  exact truncated_pair_sum h (cells t mask).1 ((cells t mask).2.toNat + 1) hc.2

end KauersKoutschan
