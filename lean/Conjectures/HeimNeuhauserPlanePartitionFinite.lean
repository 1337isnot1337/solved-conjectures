import Conjectures.HeimNeuhauserPlanePartitionBoundary
import Conjectures.HeimNeuhauserPlanePartitionIndices000To031
import Conjectures.HeimNeuhauserPlanePartitionIndices032To063
import Conjectures.HeimNeuhauserPlanePartitionIndices064To095
import Conjectures.HeimNeuhauserPlanePartitionIndices096To119
import Conjectures.HeimNeuhauserPlanePartitionIndices120To143
import Conjectures.HeimNeuhauserPlanePartitionIndices144To163
import Conjectures.HeimNeuhauserPlanePartitionIndices164To183
import Conjectures.HeimNeuhauserPlanePartitionIndices184To199
import Conjectures.HeimNeuhauserPlanePartitionIndices200To214
import Conjectures.HeimNeuhauserPlanePartitionIndices215To229
import Conjectures.HeimNeuhauserPlanePartitionIndices230To239
import Conjectures.HeimNeuhauserPlanePartitionIndices240To250

/-! Finite ranges of both plane-partition conjectures and the remaining unbounded implication. -/

namespace PlanePartition

private theorem allCertificates (n : ℕ) (hn : n < 251) : IndexCertificate n := by
  by_cases h31 : n ≤ 31
  · exact certificates000To031 n h31
  by_cases h63 : n ≤ 63
  · exact certificates032To063 n (by omega) h63
  by_cases h95 : n ≤ 95
  · exact certificates064To095 n (by omega) h95
  by_cases h119 : n ≤ 119
  · exact certificates096To119 n (by omega) h119
  by_cases h143 : n ≤ 143
  · exact certificates120To143 n (by omega) h143
  by_cases h163 : n ≤ 163
  · exact certificates144To163 n (by omega) h163
  by_cases h183 : n ≤ 183
  · exact certificates164To183 n (by omega) h183
  by_cases h199 : n ≤ 199
  · exact certificates184To199 n (by omega) h199
  by_cases h214 : n ≤ 214
  · exact certificates200To214 n (by omega) h214
  by_cases h229 : n ≤ 229
  · exact certificates215To229 n (by omega) h229
  by_cases h239 : n ≤ 239
  · exact certificates230To239 n (by omega) h239
  exact certificates240To250 n (by omega) (by omega)

/-- The original strict Turán inequality for every real x ≥ 1 through index 250. -/
theorem strictTuran_finite {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 12 ≤ n) (hn' : n ≤ 250) :
    planePartition x (n - 1) * planePartition x (n + 1) < planePartition x n ^ 2 :=
  strictTuran_of_certificates (N := 251) (by decide +kernel) allCertificates hn (by omega) hx

theorem rootDecrease_through_250 {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 6 ≤ n) (hn' : n ≤ 250) :
    RootDecrease x n := by
  by_cases h : n ≤ 11
  · exact rootDecrease_six_to_eleven hx hn h
  · have step (m : ℕ) (hm : 11 ≤ m) : m ≤ 250 → RootDecrease x m := by
      induction m, hm using Nat.le_induction with
      | base => exact fun _ => rootDecrease_six_to_eleven hx (by decide) le_rfl
      | succ m hm ih =>
        intro hm'
        exact rootDecrease_succ (by linarith) (ih (by omega)) (strictTuran_finite hx (by omega) hm').le
    exact step n (by omega) hn'

/-- Both real-parameter ranges through the last finite index of the published proof. -/
theorem original_root_finite :
    (∀ (x : ℝ), 5 < x → ∀ n, 1 ≤ n → n ≤ 250 → RootDecrease x n) ∧
    (∀ (x : ℝ), 1 ≤ x → ∀ n, 6 ≤ n → n ≤ 250 → RootDecrease x n) := by
  refine ⟨?_, fun _ hx _ hn hn' => rootDecrease_through_250 hx hn hn'⟩
  intro x hx n hn hn'
  by_cases h : n ≤ 5
  · exact rootDecrease_first_five hx hn h
  · exact rootDecrease_through_250 (by linarith) (by omega) hn'

/-- Only the Turán tail starting at 251 is needed to obtain both full root clauses. -/
theorem original_root_of_turan_tail
    (tail : ∀ (x : ℝ), 1 ≤ x → ∀ n ≥ 251, TuranAt x n) :
    (∀ (x : ℝ), 5 < x → ∀ n ≥ 1, RootDecrease x n) ∧
    (∀ (x : ℝ), 1 ≤ x → ∀ n ≥ 6, RootDecrease x n) := by
  apply original_root_of_turan
  intro x hx n hn
  by_cases h : n ≤ 250
  · exact (strictTuran_finite hx hn h).le
  · exact tail x hx n (by omega)

end PlanePartition
