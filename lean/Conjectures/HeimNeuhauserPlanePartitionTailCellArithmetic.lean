import Conjectures.HeimNeuhauserPlanePartitionMomentCells

/-! Exact rational interval tests for the large-angle and middle integral bounds. -/

namespace PlanePartition

def gridPoint (a : ℕ) : ℚ := (a : ℚ)/1000

def gridMoment (j a : ℕ) : ℚ := (momentNumerator j a 250 : ℚ)/1000^250

def boxMass (a b : ℕ) : ℚ := max (gridPoint a) (251/(gridMoment 0 b+1))

def boxDamping (a b : ℕ) : ℚ :=
  let A := gridPoint a
  let B := gridPoint b
  ((11/24)*(1+A^2)+(11/6)*A+(121/144)*A^2)/(1+(11/12)*B)^2

def TailCell (a b : ℕ) : Prop :=
  let A := gridPoint a
  let B := gridPoint b
  let Y := boxMass a b
  39/2 ≤ Y/(1-A)^2*boxDamping a b ∧ (b ≤ 250 ∨
    ((7/10)*(gridMoment 1 b+1)*(1-A)^4 ≤ 1+4*A+A^2 ∧
     145*B ≤ Y*(1-B)^2*gridMoment 1 a))

instance (a b : ℕ) : Decidable (TailCell a b) := by unfold TailCell; infer_instance

theorem gridPoint_cast (a : ℕ) : (gridPoint a : ℝ) = (a : ℝ)/1000 := by
  simp [gridPoint]

theorem gridMoment_cast (j a : ℕ) : (gridMoment j a : ℝ) = partialMoment j 250 ((a : ℝ)/1000) := by
  simp only [gridMoment, Rat.cast_div, Rat.cast_natCast, Rat.cast_pow, Rat.cast_ofNat, momentNumerator_eq]
  field_simp

end PlanePartition
