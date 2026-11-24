import Conjectures.SteinerbergerGreedyFourier
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
# Steinerberger's greedy-energy Fourier conjecture

The actual weighted absolute Fourier sum has quadratic growth in the number
of alternating binary digits along an unbounded subsequence.  Only elementary
finite sums are needed: each dyadic block of odd harmonic terms has a fixed
positive mass.  This implements the lower-bound mechanism in the existing
`results/steinerberger-greedy-fourier/PROOF.md` without asserting the stronger
sharp limsup or independence from all choices of greedy minimizer.
-/

open Finset

namespace Conjectures.SteinerbergerGreedy

noncomputable section

/-- The exact truncated harmonic-weighted absolute Fourier statistic in §20. -/
def weightedSum (x : ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ l ∈ Icc 1 n, ‖∑ a ∈ range n, character l (x a)‖ / (l : ℝ)

theorem weightedSum_nonneg (x : ℕ → ℝ) (n : ℕ) : 0 ≤ weightedSum x n := by
  apply sum_nonneg
  intro l _
  positivity

/-- The harmonic sum over the first `2^d` positive odd integers. -/
def oddHarmonic (d : ℕ) : ℝ := ∑ q ∈ range (2^d), 1 / (2*(q : ℝ)+1)

theorem oddHarmonic_lower (d : ℕ) : (d : ℝ)/4 ≤ oddHarmonic d := by
  induction d with
  | zero => norm_num [oddHarmonic]
  | succ d ih =>
    have hp : (0:ℝ) < (2:ℝ)^d := by positivity
    have hblock : (1:ℝ)/4 ≤
        ∑ q ∈ range (2^d), 1 / (2*((2^d+q : ℕ) : ℝ)+1) := by
      have he : (∑ _q ∈ range (2^d), 1 / (4*(2:ℝ)^d)) = (1:ℝ)/4 := by
        simp only [sum_const, card_range, nsmul_eq_mul, Nat.cast_pow, Nat.cast_ofNat]
        field_simp
      rw [← he]
      apply sum_le_sum
      intro q hq
      have hq' : q < 2^d := mem_range.mp hq
      apply one_div_le_one_div_of_le (by positivity)
      have hnat : 2*(2^d+q)+1 ≤ 4*2^d := by omega
      exact_mod_cast hnat
    unfold oddHarmonic at ih ⊢
    rw [pow_succ, mul_two, sum_range_add]
    push_cast at hblock ⊢
    linarith

/-- Distinct valuation classes and distinct odd multipliers give distinct frequencies. -/
theorem frequency_injective : Function.Injective
    (fun p : ℕ × ℕ => 4^p.1 * (2*p.2+1)) := by
  have impossible (j k q r : ℕ) (hjk : j < k)
      (he : 4^j*(2*q+1) = 4^k*(2*r+1)) : False := by
    obtain ⟨s, hs⟩ := Nat.exists_eq_add_of_le (Nat.succ_le_of_lt hjk)
    have he' : 2*q+1 = 4^(s+1)*(2*r+1) := by
      apply Nat.eq_of_mul_eq_mul_left (by positivity : 0 < 4^j)
      calc
        4^j*(2*q+1) = 4^k*(2*r+1) := he
        _ = 4^j*(4^(s+1)*(2*r+1)) := by
          rw [hs, show j+1+s = j+(s+1) by omega, pow_add]
          ring
    have hmod := congrArg (fun n : ℕ => n % 2) he'
    simp [pow_succ, Nat.add_mod, Nat.mul_mod] at hmod
  intro p r he
  have hj : p.1 = r.1 := by
    by_contra h
    rcases lt_or_gt_of_ne h with hlt | hlt
    · exact impossible _ _ _ _ hlt he
    · exact impossible _ _ _ _ hlt he.symm
  apply Prod.ext hj
  dsimp only at he
  rw [hj] at he
  have hq := Nat.eq_of_mul_eq_mul_left (by positivity : 0 < 4^r.1) he
  omega

/-- Every frequency in the finite rectangular index set is in the conjectured truncation. -/
theorem frequency_mem (d j q : ℕ) (hj : j < d) (hq : q < 2^d) :
    4^j*(2*q+1) ∈ Icc 1 (alternatingPrefix (2*d+1)) := by
  apply mem_Icc.mpr
  constructor
  · exact Nat.succ_le_iff.mpr (Nat.mul_pos (pow_pos (by decide) _) (by omega))
  · have hj' : 4^j ≤ 4^d := pow_le_pow_right' (by decide) hj.le
    have hq' : 2*q+1 ≤ 4^(d+1) := by
      calc
        2*q+1 ≤ 2^(d+1) := by rw [pow_succ]; omega
        _ ≤ 4^(d+1) := pow_le_pow_left' (by decide) _
    calc
      4^j*(2*q+1) ≤ 4^d*4^(d+1) := Nat.mul_le_mul hj' hq'
      _ = 4^(2*d+1) := by rw [← pow_add]; congr 1; omega
      _ ≤ alternatingPrefix (2*d+1) := alternatingPrefix_lower _

theorem selected_term_lower (d j q : ℕ) (hj : j < d) :
    (1:ℝ) / (2*(2*(q:ℝ)+1)) ≤
      ‖fourierSum (alternatingPrefix (2*d+1)) (4^j*(2*q+1))‖ /
        (4^j*(2*q+1) : ℕ) := by
  rw [fourierSum_alternating_norm _ j q (by omega)]
  push_cast
  have hp : (0:ℝ) < (4:ℝ)^j := by positivity
  have hq : (0:ℝ) < 2*(q:ℝ)+1 := by positivity
  apply (div_le_div_iff₀ (by positivity) (by positivity)).mpr
  nlinarith [mul_nonneg hp.le hq.le]

/-- The finite truncation already contains a rectangle of valuation classes and odd multipliers. -/
theorem weightedSum_quadratic_lower (d : ℕ) :
    (d : ℝ)^2 / 8 ≤ weightedSum vdc (alternatingPrefix (2*d+1)) := by
  let S := (range d) ×ˢ (range (2^d))
  have hsel : (∑ p ∈ S, (1:ℝ)/(2*(2*(p.2:ℝ)+1))) ≤
      weightedSum vdc (alternatingPrefix (2*d+1)) := by
    change (∑ p ∈ S, (1:ℝ)/(2*(2*(p.2:ℝ)+1))) ≤
      ∑ l ∈ Icc 1 (alternatingPrefix (2*d+1)),
        ‖fourierSum (alternatingPrefix (2*d+1)) l‖ / (l : ℝ)
    apply sum_le_sum_of_injOn (fun p : ℕ × ℕ => 4^p.1*(2*p.2+1))
      frequency_injective.injOn
    · intro l hl
      obtain ⟨p, hp, rfl⟩ := mem_image.mp hl
      obtain ⟨hj, hq⟩ := mem_product.mp hp
      exact frequency_mem d p.1 p.2 (mem_range.mp hj) (mem_range.mp hq)
    · intro p hp
      exact selected_term_lower d p.1 p.2 (mem_range.mp (mem_product.mp hp).1)
    · intro l _ _
      positivity
  have hsum : (∑ p ∈ S, (1:ℝ)/(2*(2*(p.2:ℝ)+1))) =
      (d:ℝ)/2 * oddHarmonic d := by
    dsimp [S]
    rw [sum_product]
    have hs : (∑ q ∈ range (2^d), (1:ℝ)/(2*(2*(q:ℝ)+1))) = oddHarmonic d / 2 := by
      unfold oddHarmonic
      rw [sum_div]
      apply sum_congr rfl
      intro q _
      rw [div_div]
      congr 1
      ring
    simp_rw [hs]
    simp only [sum_const, card_range, nsmul_eq_mul]
    ring
  rw [hsum] at hsel
  have hb := mul_le_mul_of_nonneg_left (oddHarmonic_lower d)
    (by positivity : (0:ℝ) ≤ (d:ℝ)/2)
  nlinarith

theorem alternatingPrefix_ge_index (m : ℕ) : m ≤ alternatingPrefix m := by
  induction m with
  | zero => simp
  | succ m ih => simp only [alternatingPrefix]; omega

theorem log_alternatingPrefix_le (m : ℕ) :
    Real.log (alternatingPrefix m : ℝ) ≤ ((m+1 : ℕ) : ℝ) * Real.log 4 := by
  have hp : (0:ℝ) < (alternatingPrefix m : ℝ) := by
    exact_mod_cast alternatingPrefix_pos m
  have hb : (alternatingPrefix m : ℝ) ≤ ((4:ℝ)^(m+1)) := by
    exact_mod_cast (alternatingPrefix_upper m).le
  simpa only [Real.log_pow] using Real.log_le_log hp hb

/-- Every proposed logarithmic constant fails at arbitrarily late actual greedy prefixes. -/
theorem weightedSum_violates (C : ℝ) (hC : 0 ≤ C) (N : ℕ) :
    ∃ n : ℕ, N ≤ n ∧ C * Real.log (n : ℝ) < weightedSum vdc n := by
  have hlog4 : (0:ℝ) < Real.log 4 := Real.log_pos (by norm_num)
  obtain ⟨d, hd⟩ := exists_nat_gt (max (N:ℝ) (32*C*Real.log 4+1))
  have hdN : N ≤ d := by
    exact_mod_cast (le_of_lt (lt_of_le_of_lt (le_max_left _ _) hd))
  have hdC : 32*C*Real.log 4+1 < (d:ℝ) :=
    lt_of_le_of_lt (le_max_right _ _) hd
  have hd1 : (1:ℝ) ≤ (d:ℝ) := by nlinarith [mul_nonneg hC hlog4.le]
  have hdpos : (0:ℝ) < (d:ℝ) := lt_of_lt_of_le (by norm_num) hd1
  refine ⟨alternatingPrefix (2*d+1),
    hdN.trans ((show d ≤ 2*d+1 by omega).trans (alternatingPrefix_ge_index _)), ?_⟩
  have hlog := log_alternatingPrefix_le (2*d+1)
  push_cast at hlog
  have hlog' : Real.log (alternatingPrefix (2*d+1) : ℝ) ≤
      4*(d:ℝ)*Real.log 4 := by nlinarith
  have hupper := mul_le_mul_of_nonneg_left hlog' hC
  have hquad := weightedSum_quadratic_lower d
  have hstrict := mul_lt_mul_of_pos_right (show 32*C*Real.log 4 < (d:ℝ) by linarith) hdpos
  nlinarith

end
end Conjectures.SteinerbergerGreedy
