import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Tactic

open Set
open intervalIntegral

namespace BesselWeights

theorem unit_trapezoid_strict (f : ℝ → ℝ) (a : ℝ)
    (hc : ContinuousOn f (Icc a (a+1)))
    (hs : StrictConvexOn ℝ (Icc a (a+1)) f) :
    (∫ x in a..a+1, f x) < (f a + f (a+1))/2 := by
  let line : ℝ → ℝ := fun x => (a+1-x)*f a + (x-a)*f (a+1)
  have hline : ContinuousOn line (Icc a (a+1)) := by
    dsimp [line]; fun_prop
  have hle : ∀ x ∈ Ioc a (a+1), f x ≤ line x := by
    intro x hx
    have hl : 0 ≤ a+1-x := by linarith [hx.2]
    have hr : 0 ≤ x-a := by linarith [hx.1]
    have hh := hs.convexOn.2 (show a ∈ Icc a (a+1) by simp) (show a+1 ∈ Icc a (a+1) by simp) hl hr (show (a+1-x)+(x-a)=1 by ring)
    simp only [smul_eq_mul] at hh
    have he : (a+1-x)*a+(x-a)*(a+1)=x := by ring
    rw [he] at hh
    exact hh
  have hlt : ∃ x ∈ Icc a (a+1), f x < line x := by
    refine ⟨a+1/2, ⟨by linarith, by linarith⟩, ?_⟩
    have hh := hs.2 (show a ∈ Icc a (a+1) by simp) (show a+1 ∈ Icc a (a+1) by simp)
      (show a ≠ a+1 by linarith) (show (0:ℝ)<1/2 by norm_num) (show (0:ℝ)<1/2 by norm_num) (show (1/2:ℝ)+1/2=1 by norm_num)
    simp only [smul_eq_mul] at hh
    have he : (1/2:ℝ)*a+(1/2)*(a+1)=a+1/2 := by ring
    rw [he] at hh
    dsimp [line]
    linarith
  have hint := integral_lt_integral_of_continuousOn_of_le_of_exists_lt (show a<a+1 by linarith) hc hline hle hlt
  have heq : (∫ x in a..a+1, line x) = (f a + f (a+1))/2 := by
    dsimp [line]
    have h1 : IntervalIntegrable (fun x : ℝ => (a+1-x)*f a) MeasureTheory.volume a (a+1) := by
      apply Continuous.intervalIntegrable; fun_prop
    have h2 : IntervalIntegrable (fun x : ℝ => (x-a)*f (a+1)) MeasureTheory.volume a (a+1) := by
      apply Continuous.intervalIntegrable; fun_prop
    rw [integral_add h1 h2]
    rw [integral_mul_const, integral_mul_const]
    have hi : IntervalIntegrable (fun x : ℝ => x) MeasureTheory.volume a (a+1) := by
      apply Continuous.intervalIntegrable; fun_prop
    have hc1 : IntervalIntegrable (fun _ : ℝ => a+1) MeasureTheory.volume a (a+1) := by
      apply Continuous.intervalIntegrable; fun_prop
    have hc2 : IntervalIntegrable (fun _ : ℝ => a) MeasureTheory.volume a (a+1) := by
      apply Continuous.intervalIntegrable; fun_prop
    rw [integral_sub hc1 hi, integral_sub hi hc2]
    simp only [integral_const, integral_id, smul_eq_mul]
    ring
  linarith

noncomputable def C (g lam : ℝ → ℝ) (n : ℕ) : ℝ :=
  (∑ k ∈ Finset.range n, g (k+1))/2 + g (n+1)/4 - lam (n+1)/2

theorem C_source_formula (g lam : ℝ → ℝ) (n : ℕ) :
    C g lam n = 2 * (∑ k ∈ Finset.range n, g (k+1)/4) + g (n+1)/4 - lam (n+1)/2 := by
  unfold C
  rw [← Finset.sum_div]
  ring

theorem c_increasing_and_positive (g lam : ℝ → ℝ)
    (hg0 : g 0 = 0) (hl0 : lam 0 = 0)
    (hc : ∀ a : ℝ, 0 ≤ a → ContinuousOn g (Icc a (a+1)))
    (hs : ∀ a : ℝ, 0 ≤ a → StrictConvexOn ℝ (Icc a (a+1)) g)
    (hd : ∀ x : ℝ, HasDerivAt lam (g x) x) :
    (∀ n, 0 < C g lam n) ∧ StrictMono (C g lam) := by
  have interval (a : ℝ) (ha : 0 ≤ a) : lam (a+1) - lam a < (g a+g (a+1))/2 := by
    have ht := unit_trapezoid_strict g a (hc a ha) (hs a ha)
    have hi : IntervalIntegrable g MeasureTheory.volume a (a+1) := (hc a ha).intervalIntegrable_of_Icc (by linarith)
    rw [integral_eq_sub_of_hasDerivAt (fun x _ => hd x) hi] at ht
    exact ht
  have hstep (n : ℕ) : C g lam n < C g lam (n+1) := by
    have hi := interval (n+1) (by positivity)
    unfold C
    rw [Finset.sum_range_succ]
    push_cast at *
    linarith
  have hzero : 0 < C g lam 0 := by
    have hi := interval 0 (by norm_num)
    simpa [C, hg0, hl0] using (show 0 < g 1/4-lam 1/2 by linarith)
  constructor
  · intro n
    exact lt_of_lt_of_le hzero (monotone_nat_of_le_succ (fun n => (hstep n).le) (Nat.zero_le n))
  · exact strictMono_nat_of_lt_succ hstep
end BesselWeights
