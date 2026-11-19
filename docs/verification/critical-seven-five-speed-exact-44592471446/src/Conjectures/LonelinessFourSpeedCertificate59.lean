import Conjectures.LonelinessFourSpeedCertificateChunks
import Mathlib.Tactic.FinCases

/-! Exhaustive support certificate modulo 59, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime59

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,30,20,15,12,10,17,37,46,6,43,5,50,38,4,48,7,23,28,3,45,51,18,32,26,25,35,19,57,2,40,24,34,33,27,41,8,14,56,31,36,52,11,55,21,9,54,16,53,13,22,42,49,47,44,39,29,58] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,8},
  {1,2,3,12},
  {1,2,3,16},
  {1,2,28,29},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,4,9},
  {1,3,4,14},
  {1,3,4,16},
  {1,3,7,8},
  {1,3,8,9},
  {1,3,11,12},
  {1,3,11,16},
  {1,3,11,26},
  {1,3,13,16},
  {1,3,15,16},
  {1,3,16,17},
  {1,3,17,20},
  {1,3,20,21},
  {1,3,23,26},
  {1,3,24,25},
  {1,3,26,27},
  {1,4,5,6},
  {1,4,5,9},
  {1,4,27,28},
  {1,5,6,7},
  {1,5,6,11},
  {1,5,19,24},
  {1,6,7,8},
  {1,6,26,27},
  {1,7,8,9},
  {1,7,8,18},
  {1,7,16,23},
  {1,8,25,26}}

theorem inverse_finite : ∀ a : Fin 30, 0<a.val →
    (a.val*inverse a.val)%59=1%59 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤59) :
    (a*inverse a)%59=1%59 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 59 1 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows2_checked : residueCheck 2 9 59 2 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows3_checked : residueCheck 2 9 59 3 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows4_bucket_0_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 0=true := by decide +kernel

theorem rows4_bucket_1_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 1=true := by decide +kernel

theorem rows4_bucket_2_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 2=true := by decide +kernel

theorem rows4_bucket_3_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 3=true := by decide +kernel

theorem rows4_bucket_4_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 4=true := by decide +kernel

theorem rows4_bucket_5_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 5=true := by decide +kernel

theorem rows4_bucket_6_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 6=true := by decide +kernel

theorem rows4_bucket_7_checked :
    bucketResidueCheck 2 9 59 4 inverse retained 8 7=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 59 4 inverse retained=true := by
  apply residueCheck_of_buckets (chunks:=8) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse retained
  intro bucket
  fin_cases bucket
  · exact rows4_bucket_0_checked
  · exact rows4_bucket_1_checked
  · exact rows4_bucket_2_checked
  · exact rows4_bucket_3_checked
  · exact rows4_bucket_4_checked
  · exact rows4_bucket_5_checked
  · exact rows4_bucket_6_checked
  · exact rows4_bucket_7_checked


theorem all_rows_checked (r : ℕ) (hr : 0<r) (hbound : r≤4) :
    residueCheck 2 9 59 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%59≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%59=1%59 ∧ foldedSupport 59 u (residueSupport 59 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=59) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime59
