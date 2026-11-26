module
public import Mathlib.Algebra.Order.Ring.Abs
public import Mathlib.Algebra.Order.Archimedean.Real.Basic
public import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

/-- The binomial/Pascal estimate and the common leading correction
coefficient imply eventual monotonicity. The correction estimate is
explicitly an input: this theorem does not claim Ehrhart asymptotics. -/
theorem eventually_increasing_of_fixed_leading_correction
    (N M : ℕ → ℝ) (d m : ℕ) (hd : 1 ≤ d)
    (K C D : ℝ) (hK : 0 < K) (hD : 0 ≤ D)
    (hΔ : ∀ g : ℕ, m ≤ g → (g:ℝ)^d ≤ K*(M (g+1)-M g))
    (hR : ∀ g : ℕ, m ≤ g → |N g-M g-C*(g:ℝ)^d| ≤ D*(g:ℝ)^(d-1)) :
    ∃ m' : ℕ, ∀ g : ℕ, m' ≤ g → N g < N (g+1) := by
  let L : ℝ := 2^(d-1)
  let B : ℝ := D+D*L+|C| *((d:ℝ)*L)
  obtain ⟨a,ha⟩ := exists_nat_gt (K*B)
  refine ⟨max m (max a 1),?_⟩
  intro g hg
  have hgm : m ≤ g := (le_max_left m _).trans hg
  have hga : a ≤ g := (le_max_left a 1).trans ((le_max_right m _).trans hg)
  have hg1 : 1 ≤ g := (le_max_right a 1).trans ((le_max_right m _).trans hg)
  have hx : (1:ℝ) ≤ (g:ℝ) := by exact_mod_cast hg1
  let x : ℝ := g
  change 1 ≤ x at hx
  have hxP : 0 < x := by linarith
  have hxa : K*B < x := by
    change K*B < (g:ℝ)
    exact ha.trans_le (by exact_mod_cast hga)
  have hPow : (x+1)^(d-1) ≤ L*x^(d-1) := by
    unfold L
    rw [← mul_pow]
    exact pow_le_pow_left₀ (by linarith) (by linarith) _
  have hDiff : |x^d-(x+1)^d| ≤ ((d:ℝ)*L)*x^(d-1) := by
    have h := abs_pow_sub_pow_le (a:=x) (b:=x+1) (n:=d)
    rw [show x-(x+1) = -1 by ring,abs_neg,abs_one,one_mul,
      abs_of_nonneg hxP.le, abs_of_pos (by linarith : 0<x+1),
      max_eq_right (by linarith : x≤x+1)] at h
    exact h.trans (by
      rw [mul_assoc]
      exact mul_le_mul_of_nonneg_left hPow (Nat.cast_nonneg _))
  have hC : C*(x^d-(x+1)^d) ≤ (|C| *((d:ℝ)*L))*x^(d-1) := by
    calc
      _ ≤ |C * (x^d-(x+1)^d)| := le_abs_self _
      _ = |C| *|x^d-(x+1)^d| := abs_mul _ _
      _ ≤ _ := by
        rw [mul_assoc]
        exact mul_le_mul_of_nonneg_left hDiff (abs_nonneg _)
  have h0 := (le_abs_self _).trans (hR g hgm)
  have h1 := (neg_le_neg (hR (g+1) (by omega))).trans (neg_abs_le _)
  rw [Nat.cast_add,Nat.cast_one] at h1
  change N g-M g-C*x^d ≤ D*x^(d-1) at h0
  change -(D*(x+1)^(d-1)) ≤ N (g+1)-M (g+1)-C*(x+1)^d at h1
  have h1' : -(D*(L*x^(d-1))) ≤ N (g+1)-M (g+1)-C*(x+1)^d :=
    (neg_le_neg (mul_le_mul_of_nonneg_left hPow hD)).trans h1
  have hL : B*x^(d-1) < M (g+1)-M g := by
    apply (mul_lt_mul_iff_right₀ hK).mp
    have hkx : (K*B)*x^(d-1) < x*x^(d-1) :=
      mul_lt_mul_of_pos_right hxa (pow_pos hxP _)
    have hgd : d-1+1=d := by omega
    rw [← pow_succ', hgd] at hkx
    exact (by simpa only [mul_assoc] using hkx.trans_le (hΔ g hgm))
  unfold B at hL
  nlinarith [hL,h1',h0,hC]

end CyrusianKaplan
