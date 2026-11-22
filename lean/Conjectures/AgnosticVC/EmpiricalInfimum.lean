module

public import Conjectures.AgnosticVC.VCAccuracy

@[expose] public section

namespace AgnosticVC

open scoped BigOperators

/-- The empirical error is the average binary classification loss on the labeled sample. -/
theorem empiricalError_eq_zeroOne {H X : Type*} {n : ℕ} (predict : H → X → Bool)
    (z : Fin n → X × Bool) (h : H) :
    empiricalError predict z h =
      (∑ i, if predict h (z i).1 = (z i).2 then (0 : ℝ) else 1) / n := by
  unfold empiricalError mistakeCount
  congr 1
  apply Finset.sum_congr rfl
  intro i _
  have hb : decide (i ∈ sampleTrace predict (fun j => (z j).1) h) = predict h (z i).1 := by
    cases hh : predict h (z i).1 <;> simp [hh]
  rw [hb]

/-- The expected empirical error of the actual proper learner, compared with the infimum
of empirical errors in the hypothesis class. -/
theorem properLearner_empirical_le_iInf {H X : Type*} [Nonempty H] [TraceOrder H] {n d : ℕ}
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) (hvc : HasVCDimensionAtMost predict d)
    (z : Fin n → X × Bool) :
    (∑' t : H, (properLearner hd hn predict z t).toReal * empiricalError predict z t) ≤
      (⨅ h : H, empiricalError predict z h) + 583 * Real.sqrt ((d : ℝ) / n) := by
  apply sub_le_iff_le_add.mp
  apply le_ciInf
  intro h
  exact sub_le_iff_le_add.mpr (properLearner_empirical_le hd hn predict hvc z h)

end AgnosticVC
