module

public import Mathlib.Data.Nat.Choose.Cast
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Tactic

@[expose] public section
namespace RossiPermutohedron

theorem quadratic_term_le_binomial (M : ℕ) (hM : 2≤M) {u : ℝ} (hu : 0≤u) :
    (M.choose 2:ℝ)*u^2 ≤ (1+u)^M := by
  rw [add_comm (1:ℝ) u,add_pow]
  have hm : 2∈Finset.range (M+1) := Finset.mem_range.mpr (by omega)
  have H := Finset.single_le_sum (s := Finset.range (M+1))
    (f := fun i => u^i * (1:ℝ)^(M-i) * (M.choose i:ℝ))
    (fun i _ => by positivity) hm
  simpa [mul_comm] using H

theorem big_choose_two (N : ℕ) (hN : 128≤N) :
    (N:ℝ)^2 < 9*((N/2 : ℕ).choose 2:ℝ) := by
  let M := N/2
  have hn : (128:ℝ) ≤ N := by exact_mod_cast hN
  have hn0 : (0:ℝ)≤N := by positivity
  have hM : (N:ℝ) ≤ 2*(M:ℝ)+1 := by
    exact_mod_cast (show N≤2*M+1 by dsimp [M]; omega)
  have ha : ((N:ℝ)-1)/2 ≤ M := by linarith
  have hb : ((N:ℝ)-3)/2 ≤ (M:ℝ)-1 := by linarith
  have hc : ((N:ℝ)-1)/2 * (((N:ℝ)-3)/2) ≤ (M:ℝ)*((M:ℝ)-1) :=
    mul_le_mul ha hb (by linarith) (by positivity)
  have hq : (N:ℝ)^2 < 9/2 * (((N:ℝ)-1)/2 * (((N:ℝ)-3)/2)) := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hn) hn0]
  have hchoose : (M.choose 2:ℝ) = (M:ℝ)*((M:ℝ)-1)/2 := Nat.cast_choose_two ℝ M
  change (N:ℝ)^2 < 9*(M.choose 2:ℝ)
  rw [hchoose]
  linarith

/-- With the bulk growth of N, the quadratic term alone gives the tail
majorant. No monotonicity lemma for a real variable exponent is needed. -/
theorem bulkBinomial_strict (N : ℕ) (hN : 128≤N) {K : ℝ} (hK : 0<K) :
    K^2 < (1+3*K/(N:ℝ))^(N/2) := by
  have hN0 : 0<(N:ℝ) := by exact_mod_cast (show 0<N by omega)
  have hu : 0≤3*K/(N:ℝ) := by positivity
  apply lt_of_lt_of_le _ (quadratic_term_le_binomial _ (by omega) hu)
  have h := mul_lt_mul_of_pos_right (big_choose_two N hN)
    (show 0<K^2/(N:ℝ)^2 by positivity)
  have hleft : (N:ℝ)^2*(K^2/(N:ℝ)^2)=K^2 := by field_simp
  rw [hleft] at h
  convert h using 1
  field_simp [hN0.ne']
  ring

end RossiPermutohedron
