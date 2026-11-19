import Conjectures.LonelinessFourSpeedCertificate

/-! Exhaustive support certificate modulo 17, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime17

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,9,6,13,7,3,5,15,2,12,14,10,4,11,8,16] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,5},
  {1,2,3,8},
  {1,2,4,6},
  {1,2,4,8},
  {1,2,7,8},
  {1,3,4,5}}

theorem inverse_finite : ∀ a : Fin 9, 0<a.val →
    (a.val*inverse a.val)%17=1%17 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤17) :
    (a*inverse a)%17=1%17 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 17 1 inverse retained=true := by decide +kernel

theorem rows2_checked : residueCheck 2 9 17 2 inverse retained=true := by decide +kernel

theorem rows3_checked : residueCheck 2 9 17 3 inverse retained=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 17 4 inverse retained=true := by decide +kernel


theorem all_rows_checked (r : ℕ) (hr : 0<r) (hbound : r≤4) :
    residueCheck 2 9 17 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%17≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%17=1%17 ∧ foldedSupport 17 u (residueSupport 17 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=17) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime17
