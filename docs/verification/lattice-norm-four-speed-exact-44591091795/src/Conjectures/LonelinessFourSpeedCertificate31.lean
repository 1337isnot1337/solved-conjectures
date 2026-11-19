import Conjectures.LonelinessFourSpeedCertificate

/-! Exhaustive support certificate modulo 31, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime31

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,16,21,8,25,26,9,4,7,28,17,13,12,20,29,2,11,19,18,14,3,24,27,22,5,6,23,10,15,30] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,8},
  {1,2,11,13},
  {1,2,14,15},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,4,10},
  {1,3,4,12},
  {1,3,7,8},
  {1,3,9,12},
  {1,3,12,13},
  {1,4,5,6},
  {1,4,13,14}}

theorem inverse_finite : ∀ a : Fin 16, 0<a.val →
    (a.val*inverse a.val)%31=1%31 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤31) :
    (a*inverse a)%31=1%31 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 31 1 inverse retained=true := by decide +kernel

theorem rows2_checked : residueCheck 2 9 31 2 inverse retained=true := by decide +kernel

theorem rows3_checked : residueCheck 2 9 31 3 inverse retained=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 31 4 inverse retained=true := by decide +kernel


theorem all_rows_checked (r : ℕ) (hr : 0<r) (hbound : r≤4) :
    residueCheck 2 9 31 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%31≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%31=1%31 ∧ foldedSupport 31 u (residueSupport 31 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=31) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime31
