import Conjectures.LonelinessFourSpeedCertificateChunks
import Mathlib.Tactic.FinCases

/-! Exhaustive support certificate modulo 61, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime61

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,31,41,46,49,51,35,23,34,55,50,56,47,48,57,42,18,17,45,58,32,25,8,28,22,54,52,24,40,59,2,21,37,9,7,39,33,53,36,29,3,16,44,43,19,4,13,14,5,11,6,27,38,26,10,12,15,20,30,60] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,8},
  {1,2,3,9},
  {1,2,3,13},
  {1,2,3,17},
  {1,2,3,21},
  {1,2,29,30},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,7,8},
  {1,3,14,17},
  {1,3,16,17},
  {1,4,5,6},
  {1,4,5,9},
  {1,4,28,29},
  {1,5,21,26},
  {1,6,7,8},
  {1,6,7,13},
  {1,6,27,28},
  {1,8,14,22},
  {1,16,17,18},
  {1,16,17,28}}

theorem inverse_finite : ∀ a : Fin 31, 0<a.val →
    (a.val*inverse a.val)%61=1%61 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤61) :
    (a*inverse a)%61=1%61 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 61 1 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows2_checked : residueCheck 2 9 61 2 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows3_checked : residueCheck 2 9 61 3 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows4_bucket_0_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 0=true := by decide +kernel

theorem rows4_bucket_1_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 1=true := by decide +kernel

theorem rows4_bucket_2_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 2=true := by decide +kernel

theorem rows4_bucket_3_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 3=true := by decide +kernel

theorem rows4_bucket_4_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 4=true := by decide +kernel

theorem rows4_bucket_5_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 5=true := by decide +kernel

theorem rows4_bucket_6_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 6=true := by decide +kernel

theorem rows4_bucket_7_checked :
    bucketResidueCheck 2 9 61 4 inverse retained 8 7=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 61 4 inverse retained=true := by
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
    residueCheck 2 9 61 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%61≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%61=1%61 ∧ foldedSupport 61 u (residueSupport 61 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=61) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime61
