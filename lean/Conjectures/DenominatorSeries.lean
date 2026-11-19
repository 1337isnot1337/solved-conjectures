import Conjectures.DenominatorForest
import Mathlib.RingTheory.PowerSeries.Basic

namespace DenominatorForest

noncomputable def series (s : State) : PowerSeries ℚ :=
  PowerSeries.mk (fun d => (pathCount d s:ℚ))

@[simp] theorem series_coeff (s : State) (d : Nat) :
    PowerSeries.coeff d (series s)=(pathCount d s:ℚ) := PowerSeries.coeff_mk _ _

theorem series_congr {s t : State} (h : s.DataEq t) : series s=series t := by
  ext d
  rw [series_coeff,series_coeff,pathCount_congr d s t h]

theorem series_rec (s : State) :
    series s=1+PowerSeries.X*(∑ j ∈ s.moves, series (s.step j)) := by
  ext d
  cases d with
  | zero => simp [series,pathCount,PowerSeries.coeff_zero_eq_constantCoeff_apply]
  | succ d =>
    simp [pathCount,PowerSeries.coeff_succ_X_mul]

/-- A homogeneous system in which every recursive term is delayed by one
power of `X` has only the zero formal-series solution. -/
theorem guarded_zero {I : Type*} (F : I → PowerSeries ℚ)
    (h : ∀ i, ∃ (S : Finset Nat) (child : Nat → I),
      F i=PowerSeries.X*(∑ j ∈ S, F (child j))) : ∀ i, F i=0 := by
  have hc : ∀ d i, PowerSeries.coeff d (F i)=0 := by
    intro d
    induction d with
    | zero =>
      intro i
      obtain ⟨S,child,hi⟩ := h i
      rw [hi]
      simp [PowerSeries.coeff_zero_eq_constantCoeff_apply]
    | succ d ih =>
      intro i
      obtain ⟨S,child,hi⟩ := h i
      rw [hi,PowerSeries.coeff_succ_X_mul]
      simp [ih]
  intro i
  ext d
  simpa using hc d i

end DenominatorForest
