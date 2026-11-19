import Conjectures.LonelinessFourSpeedCertificate

/-! Exhaustive support certificate modulo 47, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime47

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,24,16,12,19,8,27,6,21,33,30,4,29,37,22,3,36,34,5,40,9,15,45,2,32,38,7,42,13,11,44,25,10,18,43,17,14,26,41,20,39,28,35,31,23,46] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,8},
  {1,2,3,12},
  {1,2,6,8},
  {1,2,22,23},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,4,9},
  {1,3,4,12},
  {1,3,4,14},
  {1,3,4,16},
  {1,3,4,19},
  {1,3,4,21},
  {1,3,8,9},
  {1,3,9,12},
  {1,3,9,16},
  {1,3,9,20},
  {1,3,11,12},
  {1,3,12,13},
  {1,3,13,16},
  {1,3,16,17},
  {1,3,16,21},
  {1,3,18,19},
  {1,3,20,21},
  {1,4,5,6},
  {1,4,5,9},
  {1,4,21,22},
  {1,5,6,7},
  {1,5,6,11},
  {1,6,7,13}}

theorem inverse_finite : ∀ a : Fin 24, 0<a.val →
    (a.val*inverse a.val)%47=1%47 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤47) :
    (a*inverse a)%47=1%47 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 47 1 inverse retained=true := by decide +kernel

theorem rows2_checked : residueCheck 2 9 47 2 inverse retained=true := by decide +kernel

theorem rows3_checked : residueCheck 2 9 47 3 inverse retained=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 47 4 inverse retained=true := by decide +kernel


theorem all_rows_checked (r : ℕ) (hr : 0<r) (hbound : r≤4) :
    residueCheck 2 9 47 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%47≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%47=1%47 ∧ foldedSupport 47 u (residueSupport 47 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=47) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime47
