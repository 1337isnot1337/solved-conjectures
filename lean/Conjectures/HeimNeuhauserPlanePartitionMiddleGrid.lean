import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Data.Fintype.Basic
import Mathlib.Tactic

/-! Rounded rational bounds for the integral on the 72 intervals from three to twelve. -/

namespace PlanePartition

def binPointQ (i : ℕ) : ℚ := (24+(i : ℚ))/8

def binWeightQ (m q : ℚ) (i : ℕ) : ℚ :=
  let u := binPointQ i
  let v := binPointQ (i+1)
  m*(1/2-v^2/(24*251))*u^2/(1+v^2/q)^2

def binCostQ (m q : ℚ) (i : ℕ) : ℚ :=
  let u := binPointQ i
  let v := binPointQ (i+1)
  (v^3-u^3)/(6*(1+binWeightQ m q i/256)^256)

def intermediateAllocation : Array ℕ := #[
  378053, 335012, 294933, 258123, 224722, 194734, 168061, 144532, 123926, 105995, 90479, 77117,
  65658, 55866, 47523, 40432, 34417, 29323, 25012, 21368, 18287, 15683, 13481, 11618,
  10041, 8703, 7568, 6603, 5781, 5080, 4481, 3968, 3528, 3149, 2823, 2541,
  2297, 2085, 1901, 1741, 1602, 1480, 1373, 1280, 1198, 1126, 1063, 1007,
  959, 917, 880, 848, 821, 797, 777, 761, 747, 737, 729, 724,
  721, 721, 723, 727, 734, 743, 754, 767, 783, 801, 822, 846
]

def outerRadiiAllocation : Array ℕ := #[
  445399, 392456, 342533, 296260, 254032, 216035, 182283, 152659, 126942, 104847, 86044, 70186,
  56922, 45915, 36848, 29431, 23401, 18529, 14614, 11485, 8996, 7025, 5471, 4250,
  3294, 2548, 1968, 1517, 1169, 899, 691, 531, 408, 314, 241, 185,
  143, 110, 85, 65, 51, 39, 30, 24, 19, 15, 11, 9,
  7, 6, 5, 4, 3, 3, 2, 2, 2, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
]

def allocation (a : Array ℕ) (i : ℕ) := a[i]?.getD 0

def BinCertificate (m q : ℚ) (a : Array ℕ) : Prop :=
  (∀ i : Fin 72, binCostQ m q i ≤ (allocation a i : ℚ)/10^7) ∧
  (∑ i ∈ Finset.range 72, allocation a i) ≤ 3000000

instance (m q : ℚ) (a : Array ℕ) : Decidable (BinCertificate m q a) := by
  unfold BinCertificate
  infer_instance

set_option maxRecDepth 8000 in
theorem intermediate_bin_certificate : BinCertificate (7/10) 145 intermediateAllocation := by decide +kernel

set_option maxRecDepth 8000 in
theorem outerRadii_bin_certificate : BinCertificate (20/33) 400 outerRadiiAllocation := by decide +kernel

end PlanePartition
