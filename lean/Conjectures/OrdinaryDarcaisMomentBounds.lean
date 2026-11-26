import Conjectures.OrdinaryDarcaisSaddle
import Mathlib.Algebra.Order.Ring.Pow

/-! Rigorous enclosures of the ordinary sigma-one moments by finite polynomials. -/

namespace OrdinaryDarcais

open Finset

def shiftedWeight (j i : ℕ) := (i+1)^j*divisorSum (i+1)

noncomputable def shiftedTerm (j : ℕ) (r : ℝ) (i : ℕ) := (shiftedWeight j i : ℝ)*r^i

noncomputable def partialMoment (j N : ℕ) (r : ℝ) := ∑ i ∈ range N, shiftedTerm j r i

private theorem unshift (j i : ℕ) (r : ℝ) :
    momentTerm j (i+1) r = r*shiftedTerm j r i := by
  simp only [momentTerm,shiftedTerm,shiftedWeight,Nat.cast_mul,Nat.cast_pow,pow_succ r]
  ring

theorem shifted_summable (j : ℕ) {r : ℝ} (hr : 0 < r) (h : r < 1) :
    Summable (shiftedTerm j r) := by
  have s := (summable_nat_add_iff 1).2 (moment_summable j hr.le h)
  simp only [unshift] at s
  simpa only [← mul_assoc, inv_mul_cancel₀ hr.ne',one_mul] using s.mul_left r⁻¹

theorem moment_eq_shifted (j : ℕ) {r : ℝ} (hr : 0 < r) (h : r < 1) :
    moment j r = r * ∑' i : ℕ, shiftedTerm j r i := by
  rw [moment,(moment_summable j hr.le h).tsum_eq_zero_add]
  simp only [unshift,tsum_mul_left]
  have hz : momentTerm j 0 r = 0 := by simp [momentTerm,divisorSum]
  rw [hz,zero_add]

theorem divisorSum_le_sq (n : ℕ) : divisorSum n ≤ n^2 := by
  calc
    _ ≤ ∑ _d ∈ n.divisors, n := Finset.sum_le_sum (fun d hd => Nat.le_of_dvd
      (Nat.pos_of_mem_divisors (Nat.mem_divisors_self n (Nat.ne_zero_of_mem_divisors hd))) (Nat.dvd_of_mem_divisors hd))
    _ = n.divisors.card*n := by simp
    _ ≤ n^2 := by simpa [pow_two] using Nat.mul_le_mul_right n (Nat.card_divisors_le_self n)

theorem partial_mono (j N : ℕ) {a b : ℝ} (ha : 0 ≤ a) (hab : a ≤ b) :
    partialMoment j N a ≤ partialMoment j N b := by
  unfold partialMoment shiftedTerm
  gcongr

private theorem term_le_four {j : ℕ} (hj : j ≤ 2) (i : ℕ) {r : ℝ} (hr : 0 ≤ r) :
    shiftedTerm j r i ≤ ((i:ℝ)+1)^4 * r^i := by
  have hw (n : ℕ) : (divisorSum n : ℝ) ≤ (n:ℝ)^2 := by exact_mod_cast divisorSum_le_sq n
  have hp : ((i:ℝ)+1)^j ≤ ((i:ℝ)+1)^2 := pow_le_pow_right₀ (by linarith only [Nat.cast_nonneg (α:=ℝ) i]) hj
  have h := mul_le_mul hp (hw (i+1)) (Nat.cast_nonneg _) (by positivity)
  push_cast at h
  rw [show ((i:ℝ)+1)^2*((i:ℝ)+1)^2 = ((i:ℝ)+1)^4 by ring] at h
  unfold shiftedTerm shiftedWeight
  push_cast
  exact mul_le_mul_of_nonneg_right h (pow_nonneg hr _)

private theorem polynomial_tail (K i : ℕ) {b : ℝ} (hb : 0 ≤ b) :
    ((K+i : ℕ)+1:ℝ)^4*b^(K+i) ≤
      ((K:ℝ)+1)^4*b^K*(b*(1+1/((K:ℝ)+1))^4)^i := by
  let A := (K:ℝ)+1
  have hA : 0 < A := by dsimp [A]; positivity
  have h := one_add_mul_le_pow (a:=1/A) (by linarith only [show 0 ≤ 1/A by positivity]) i
  have hg : A+(i:ℝ) ≤ A*(1+1/A)^i := by
    have he : A*(1+(i:ℝ)*(1/A)) = A+(i:ℝ) := by field_simp
    rw [← he]
    exact mul_le_mul_of_nonneg_left h hA.le
  calc
    _ = (A+(i:ℝ))^4*(b^K*b^i) := by dsimp [A]; push_cast; rw [pow_add]; ring
    _ ≤ (A*(1+1/A)^i)^4*(b^K*b^i) := by gcongr
    _ = _ := by
      change _ = A^4*b^K*(b*(1+1/A)^4)^i
      simp only [mul_pow,← pow_mul,Nat.mul_comm i 4]
      ring

theorem shifted_enclosure {j : ℕ} (hj : j ≤ 2) {r b : ℝ} (hr : 0 < r) (hrb : r ≤ b)
    (hb : b < 1) (K : ℕ) (ratio : b*(1+1/((K:ℝ)+1))^4 < 1)
    (tail : ((K:ℝ)+1)^4*b^K/(1-b*(1+1/((K:ℝ)+1))^4) ≤ 1) :
    partialMoment j K r ≤ ∑' i, shiftedTerm j r i ∧
      (∑' i, shiftedTerm j r i) ≤ partialMoment j K r + 1 := by
  let q := b*(1+1/((K:ℝ)+1))^4
  let A := ((K:ℝ)+1)^4*b^K
  have hbr := hr.le.trans hrb
  have hq : 0 ≤ q := mul_nonneg hbr (by positivity)
  have hall := shifted_summable j hr (hrb.trans_lt hb)
  have rest := (summable_nat_add_iff K).2 hall
  have hs := hall.sum_add_tsum_nat_add K
  have hmaj := (summable_geometric_of_lt_one hq ratio).mul_left A
  have hbound (i : ℕ) : shiftedTerm j r (i+K) ≤ A*q^i := by
    calc
      _ ≤ ((↑(i+K):ℝ)+1)^4*r^(i+K) := term_le_four hj _ hr.le
      _ ≤ ((↑(i+K):ℝ)+1)^4*b^(i+K) := by gcongr
      _ ≤ A*q^i := by simpa only [Nat.add_comm i K,A,q] using polynomial_tail K i hbr
  have hu := rest.tsum_le_tsum hbound hmaj
  rw [tsum_mul_left,tsum_geometric_of_lt_one hq ratio,← div_eq_mul_inv] at hu
  have hlo : 0 ≤ ∑' i : ℕ, shiftedTerm j r (i+K) := tsum_nonneg (fun i => show 0 ≤ shiftedTerm j r (i+K) by unfold shiftedTerm; positivity)
  change A/(1-q) ≤ 1 at tail
  unfold partialMoment
  constructor <;> linarith

end OrdinaryDarcais
