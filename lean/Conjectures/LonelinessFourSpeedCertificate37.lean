import Conjectures.LonelinessFourSpeedCertificate

/-! Exhaustive support certificate modulo 37, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime37

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,19,25,28,15,31,16,14,33,26,27,34,20,8,5,7,24,35,2,13,30,32,29,17,3,10,11,4,23,21,6,22,9,12,18,36] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,5},
  {1,2,3,8},
  {1,2,3,9},
  {1,2,3,12},
  {1,2,3,13},
  {1,2,3,16},
  {1,2,3,17},
  {1,2,6,8},
  {1,2,8,13},
  {1,2,11,13},
  {1,2,13,14},
  {1,2,14,16},
  {1,2,17,18},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,4,9},
  {1,3,4,12},
  {1,3,4,14},
  {1,3,4,16},
  {1,3,7,8},
  {1,3,7,12},
  {1,3,7,16},
  {1,3,8,9},
  {1,3,9,10},
  {1,3,9,12},
  {1,3,9,16},
  {1,3,11,12},
  {1,3,11,16},
  {1,3,12,15},
  {1,3,13,14},
  {1,3,13,16},
  {1,3,15,16},
  {1,4,5,6},
  {1,4,5,9},
  {1,4,16,17},
  {1,5,6,7},
  {1,5,6,11}}

theorem inverse_finite : ∀ a : Fin 19, 0<a.val →
    (a.val*inverse a.val)%37=1%37 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤37) :
    (a*inverse a)%37=1%37 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 37 1 inverse retained=true := by decide +kernel

theorem rows2_checked : residueCheck 2 9 37 2 inverse retained=true := by decide +kernel

theorem rows3_checked : residueCheck 2 9 37 3 inverse retained=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 37 4 inverse retained=true := by decide +kernel


theorem all_rows_checked (r : ℕ) (hr : 0<r) (hbound : r≤4) :
    residueCheck 2 9 37 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%37≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%37=1%37 ∧ foldedSupport 37 u (residueSupport 37 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=37) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime37
