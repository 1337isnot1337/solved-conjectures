import Conjectures.LonelinessFourSpeedCertificateChunks
import Mathlib.Tactic.FinCases

/-! Exhaustive support certificate modulo 53, at threshold 2/9.
Generated finite data are accepted only through ordinary kernel reduction. -/

namespace Loneliness.Modular.FourSpeed.Prime53

set_option maxRecDepth 200000
set_option maxHeartbeats 0

def inverse (a : ℕ) : ℕ := ([0,1,27,18,40,32,9,38,20,6,16,29,31,49,19,46,10,25,3,14,8,48,41,30,42,17,51,2,36,11,23,12,5,45,39,50,28,43,7,34,4,22,24,37,47,33,15,44,21,13,35,26,52] : List ℕ).getD a 0

def retained : Finset (Finset ℕ) :=
  {{1,2,3,4},
  {1,2,3,8},
  {1,2,3,9},
  {1,2,3,13},
  {1,2,3,17},
  {1,2,25,26},
  {1,3,4,5},
  {1,3,4,7},
  {1,3,4,12},
  {1,3,4,14},
  {1,3,12,13},
  {1,3,13,14},
  {1,3,21,22},
  {1,4,5,6},
  {1,4,5,9},
  {1,4,24,25},
  {1,6,7,8},
  {1,11,12,23}}

theorem inverse_finite : ∀ a : Fin 27, 0<a.val →
    (a.val*inverse a.val)%53=1%53 := by decide +kernel

theorem inverse_correct (a : ℕ) (ha : 0<a) (hbound : 2*a≤53) :
    (a*inverse a)%53=1%53 :=
  inverse_finite ⟨a,by omega⟩ ha

theorem retained_card : ∀ s∈retained, s.card=4 := by decide +kernel

theorem rows1_checked : residueCheck 2 9 53 1 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows2_checked : residueCheck 2 9 53 2 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows3_checked : residueCheck 2 9 53 3 inverse retained=true := by
  apply fastResidueCheck_sound (by decide +kernel) (by decide +kernel) inverse retained
  decide +kernel

theorem rows4_bucket_0_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 0=true := by decide +kernel

theorem rows4_bucket_1_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 1=true := by decide +kernel

theorem rows4_bucket_2_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 2=true := by decide +kernel

theorem rows4_bucket_3_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 3=true := by decide +kernel

theorem rows4_bucket_4_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 4=true := by decide +kernel

theorem rows4_bucket_5_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 5=true := by decide +kernel

theorem rows4_bucket_6_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 6=true := by decide +kernel

theorem rows4_bucket_7_checked :
    bucketResidueCheck 2 9 53 4 inverse retained 8 7=true := by decide +kernel

theorem rows4_checked : residueCheck 2 9 53 4 inverse retained=true := by
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
    residueCheck 2 9 53 r inverse retained=true := by
  have hcases : r=1 ∨ r=2 ∨ r=3 ∨ r=4 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · exact rows1_checked
  · exact rows2_checked
  · exact rows3_checked
  · exact rows4_checked

theorem residue_cover (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%53≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%53=1%53 ∧ foldedSupport 53 u (residueSupport 53 ds)∈retained :=
  checked_residue_cover (num:=2) (den:=9) (m:=53) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) inverse inverse_correct retained all_rows_checked ds hne hlen hmod hlow

end Loneliness.Modular.FourSpeed.Prime53
