import Conjectures.HeimNeuhauserPlanePartitionSaddle

/-! A common absolutely convergent enclosure for the three saddle moments
at every radius through nine tenths. -/

namespace PlanePartition

open Finset

def momentWeight (j i : ℕ) := (i + 1)^j * divisorSquareSum (i + 1)

noncomputable def shiftedMomentTerm (j : ℕ) (r : ℝ) (i : ℕ) : ℝ :=
  (momentWeight j i : ℝ) * r ^ i

noncomputable def partialMoment (j N : ℕ) (r : ℝ) :=
  ∑ i ∈ range N, shiftedMomentTerm j r i

private theorem unshift_moment (j : ℕ) (r : ℝ) (i : ℕ) :
    momentTerm j (i + 1) r = r * shiftedMomentTerm j r i := by
  simp only [momentTerm, shiftedMomentTerm, momentWeight, Nat.cast_mul, Nat.cast_pow, pow_succ r]
  ring

theorem shiftedMoment_summable (j : ℕ) {r : ℝ} (hr : 0 < r) (hr' : r < 1) :
    Summable (shiftedMomentTerm j r) := by
  have h := (summable_nat_add_iff 1).2 (moment_summable j hr.le hr')
  simp only [unshift_moment] at h
  simpa only [← mul_assoc, inv_mul_cancel₀ hr.ne', one_mul] using h.mul_left r⁻¹

theorem moment_eq_shifted (j : ℕ) {r : ℝ} (hr : 0 < r) (hr' : r < 1) :
    moment j r = r * ∑' i, shiftedMomentTerm j r i := by
  rw [moment, (moment_summable j hr.le hr').tsum_eq_zero_add]
  have hz : momentTerm j 0 r = 0 := by simp [momentTerm, divisorSquareSum]
  simp only [hz, zero_add, unshift_moment, tsum_mul_left]

private theorem polynomial_decay (i : ℕ) :
    ((i : ℝ) + 251)^4 * (9/10 : ℝ)^(i+250) ≤
      251^4 * (9/10 : ℝ)^250 * (15/16 : ℝ)^i := by
  induction i with
  | zero => norm_num
  | succ i ih =>
    have hi : 0 ≤ (i : ℝ) := by positivity
    have hpol : ((i : ℝ) + 252)^4 * (9/10) ≤ ((i : ℝ) + 251)^4 * (15/16) := by
      ring_nf
      nlinarith only [hi, sq_nonneg (i : ℝ), pow_nonneg hi 3, pow_nonneg hi 4]
    calc
      _ = (((i : ℝ) + 252)^4 * (9/10)) * (9/10 : ℝ)^(i+250) := by
        rw [show i+1+250 = i+250+1 by omega, pow_succ]
        push_cast
        ring
      _ ≤ (((i : ℝ) + 251)^4 * (15/16)) * (9/10 : ℝ)^(i+250) :=
        mul_le_mul_of_nonneg_right hpol (by positivity)
      _ = (((i : ℝ) + 251)^4 * (9/10 : ℝ)^(i+250)) * (15/16) := by ring
      _ ≤ _ := by rw [pow_succ (15/16 : ℝ), ← mul_assoc]; gcongr

private noncomputable def tailMajorant (i : ℕ) : ℝ :=
  ((33/20) * 251^4 * (9/10)^250) * (15/16)^i

private theorem tail_term_bound {j : ℕ} (hj : j ≤ 2) {r : ℝ}
    (hr : 0 ≤ r) (hr' : r ≤ 9/10) (i : ℕ) :
    shiftedMomentTerm j r (i+250) ≤ tailMajorant i := by
  let k := i+250+1
  have h1 : (1 : ℝ) ≤ (k : ℝ) := by exact_mod_cast (by omega : 1 ≤ k)
  have hg := divisorSquareSum_upper k
  have hp : (k : ℝ)^j ≤ (k : ℝ)^2 := pow_le_pow_right₀ h1 hj
  have hc : (momentWeight j (i+250) : ℝ) ≤ (33/20) * ((i : ℝ)+251)^4 := by
    change ((k^j * divisorSquareSum k : ℕ) : ℝ) ≤ _
    push_cast
    calc
      _ ≤ (k : ℝ)^2 * ((33/20)*(k : ℝ)^2) := by gcongr
      _ = _ := by dsimp [k]; push_cast; ring
  calc
    _ ≤ ((33/20) * ((i : ℝ)+251)^4) * (9/10 : ℝ)^(i+250) := by
      unfold shiftedMomentTerm
      gcongr
    _ = (33/20) * (((i : ℝ)+251)^4 * (9/10 : ℝ)^(i+250)) := by ring
    _ ≤ (33/20) * (251^4 * (9/10 : ℝ)^250 * (15/16)^i) :=
      mul_le_mul_of_nonneg_left (polynomial_decay i) (by norm_num)
    _ = _ := by unfold tailMajorant; ring

theorem shiftedMoment_enclosure {j : ℕ} (hj : j ≤ 2) {r : ℝ} (hr : 0 < r) (hr' : r ≤ 9/10) :
    partialMoment j 250 r ≤ ∑' i, shiftedMomentTerm j r i ∧
      ∑' i, shiftedMomentTerm j r i ≤ partialMoment j 250 r + 1 := by
  have hs := shiftedMoment_summable j hr (show r < 1 by linarith)
  have h := hs.sum_add_tsum_nat_add 250
  have hh : Summable tailMajorant := (summable_geometric_of_norm_lt_one
    (by norm_num : ‖(15/16 : ℝ)‖ < 1)).mul_left _
  have hmaj : ∑' i, tailMajorant i ≤ 1 := by
    simp only [tailMajorant, tsum_mul_left, tsum_geometric_of_lt_one (by norm_num : (0 : ℝ) ≤ 15/16) (by norm_num)]
    norm_num
  have htail := ((summable_nat_add_iff 250).2 hs).tsum_le_tsum (tail_term_bound hj hr.le hr') hh
  have hpos : 0 ≤ ∑' i, shiftedMomentTerm j r (i+250) := tsum_nonneg (fun i => by unfold shiftedMomentTerm; positivity)
  unfold partialMoment
  constructor <;> linarith

theorem partialMoment_mono (j N : ℕ) {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) :
    partialMoment j N a ≤ partialMoment j N b := by
  unfold partialMoment shiftedMomentTerm
  gcongr

end PlanePartition
