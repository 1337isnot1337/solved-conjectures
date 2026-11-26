module
public import Conjectures.PomeranceSarkozyModelThresholdLaw
public import Conjectures.PomeranceSarkozyStatisticBridge

@[expose] public section
namespace PomeranceSarkozy

open scoped BigOperators

/-- The threshold count of the literal offset vector is the truncated
arithmetic count on the same sample, whose first point is `L`. -/
theorem thresholdVectorCount_literalOffsetCount (P : Finset ℕ) (L N H : ℕ)
    (j : Fin N) (hP : ∀ p ∈ P, p.Prime) (hHL : H < L) :
    thresholdVectorCount (Finset.Icc 1 H) (literalOffsetCount (Finset.Icc 1 H) P L N j) =
      ((truncatedOffsets P (L + j.val) H).card : ℝ) := by
  let I := Finset.Icc 1 H
  let g (h : ℕ) : ℝ :=
    if h < L + j.val ∧ h < restrictedPrimeCount P (L + j.val - h) then 1 else 0
  calc
    thresholdVectorCount I (literalOffsetCount I P L N j) = ∑ h : ↥I, g h := by
      unfold thresholdVectorCount
      refine Finset.sum_congr rfl (fun h _ ↦ ?_)
      have hh : (h : ℕ) < L + j.val :=
        ((Finset.mem_Icc.mp h.property).2.trans_lt hHL).trans_le (Nat.le_add_right _ _)
      rw [literalOffsetCount_eq_restrictedPrimeCount _ _ hP _ _ _ _ hh]
      simp only [g, hh, true_and]
    _ = ∑ h ∈ I, g h := Finset.sum_coe_sort _ g
    _ = _ := by simp only [g, I, truncatedOffsets, Finset.sum_boole]

end PomeranceSarkozy
