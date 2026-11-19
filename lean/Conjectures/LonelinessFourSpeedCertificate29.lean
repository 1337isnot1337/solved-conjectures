import Conjectures.LonelinessFourSpeedCertificate

/-! Exhaustive support certificate modulo 29, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime29

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,15,10,22,6,5,25,11,13,3,8,17,9,27,2,20,12,21,26,16,18,4,24,23,7,19,14,28] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,5},
  {1,2,3,8},
  {1,2,3,9},
  {1,2,3,12},
  {1,2,3,13},
  {1,2,6,8},
  {1,2,8,9},
  {1,2,9,11},
  {1,2,11,13},
  {1,2,13,14},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,4,10},
  {1,3,4,12},
  {1,3,7,8},
  {1,3,7,12},
  {1,3,9,12},
  {1,3,11,12},
  {1,4,5,6},
  {1,4,5,9},
  {1,8,9,12}}

theorem inverse_finite : ∀ a : Fin 15, 0<a.val →
    (a.val*inverse a.val)%29=1%29 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤29) :
    (a*inverse a)%29=1%29 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 29 1 inverse retained=true := by decide +kernel

theorem rows2_checked : residueCheck 2 9 29 2 inverse retained=true := by decide +kernel

theorem rows3_checked : residueCheck 2 9 29 3 inverse retained=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 29 4 inverse retained=true := by decide +kernel


theorem all_rows_checked (r : ℕ) (hr : 0<r) (hbound : r≤4) :
    residueCheck 2 9 29 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%29≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%29=1%29 ∧ foldedSupport 29 u (residueSupport 29 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=29) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime29
