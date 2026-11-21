import Conjectures.BrownMolPreimages
import Conjectures.BrownMolSequenceRoot
import Mathlib.Analysis.SpecificLimits.Basic

open Polynomial Filter
open scoped Topology
noncomputable section
namespace BrownMol

def family (a b : ℂ[X]) (n : ℕ) : ℂ[X] := a^n + C (n : ℂ)*b

theorem family_eval (a b : ℂ[X]) (n : ℕ) (z : ℂ) :
    (family a b n).eval z = (a.eval z)^n + (n : ℂ)*(b.eval z) := by
  simp [family]

theorem family_derivative_eval (a b : ℂ[X]) (n : ℕ) (z : ℂ) :
    (family a b n).derivative.eval z = (n : ℂ)*(a.eval z)^(n-1)*(a.derivative.eval z) +
      (n : ℂ)*(b.derivative.eval z) := by
  simp [family, derivative_add, derivative_pow]

theorem family_degree (a b : ℂ[X]) (n : ℕ) :
    (family a b n).natDegree ≤ (a.natDegree+b.natDegree+1)*n := by
  cases n with
  | zero => simp [family]
  | succ n =>
    have ha : (a^(n+1)).natDegree ≤ (n+1)*a.natDegree := natDegree_pow_le
    have hb : (C ((n+1 : ℕ) : ℂ)*b).natDegree ≤ b.natDegree := by
      calc
        _ ≤ (C ((n+1 : ℕ) : ℂ)).natDegree + b.natDegree := natDegree_mul_le
        _ ≤ b.natDegree := by simp
    apply (natDegree_add_le _ _).trans
    apply max_le <;> nlinarith

theorem scaled_value_eq (a b : ℂ[X]) (z b0 : ℂ) (n : ℕ) (hn : 0 < n)
    (hpower : (a.eval z)^n = -((n : ℂ)*b0)) :
    (family a b n).eval z / (n : ℂ) = b.eval z-b0 := by
  have hn0 : (n : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.ne_of_gt hn)
  rw [family_eval,hpower]
  field_simp
  ring

theorem scaled_derivative_eq (a b : ℂ[X]) (z b0 : ℂ) (n : ℕ) (hn : 0 < n)
    (hb0 : b0 ≠ 0) (hpower : (a.eval z)^n = -((n : ℂ)*b0)) :
    (family a b n).derivative.eval z / (n : ℂ)^2 =
      -(b0/(a.eval z))*(a.derivative.eval z) + (b.derivative.eval z)/(n : ℂ) := by
  have hn0 : (n : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr (Nat.ne_of_gt hn)
  have ha0 : a.eval z ≠ 0 := by
    intro hzero
    rw [hzero, zero_pow (Nat.ne_of_gt hn)] at hpower
    exact (neg_ne_zero.mpr (mul_ne_zero hn0 hb0)) hpower.symm
  have hpow : (a.eval z)^(n-1)*(a.eval z) = -((n : ℂ)*b0) := by
    rw [← pow_succ, Nat.sub_add_cancel hn]
    exact hpower
  rw [family_derivative_eval]
  field_simp
  linear_combination (a.derivative.eval z)*hpow

theorem family_scaled_limits (a b : ℂ[X]) (z0 : ℂ) (x : ℕ → ℂ)
    (ha : ‖a.eval z0‖ = 1) (hb : b.eval z0 ≠ 0)
    (hx : Tendsto x atTop (𝓝 z0))
    (hpow : ∀ᶠ n in atTop, (a.eval (x n))^n = -((n : ℂ)*b.eval z0)) :
    Tendsto (fun n => (family a b n).eval (x n)/(n : ℂ)) atTop (𝓝 0) ∧
    Tendsto (fun n => (family a b n).derivative.eval (x n)/(n : ℂ)^2) atTop
      (𝓝 (-(b.eval z0 / a.eval z0)*(a.derivative.eval z0))) := by
  have ha0 : a.eval z0 ≠ 0 := by intro h; simp [h] at ha
  have hbcont : Tendsto (fun n => b.eval (x n)) atTop (𝓝 (b.eval z0)) :=
    (b.hasStrictDerivAt z0).hasDerivAt.continuousAt.tendsto.comp hx
  have hacont : Tendsto (fun n => a.eval (x n)) atTop (𝓝 (a.eval z0)) :=
    (a.hasStrictDerivAt z0).hasDerivAt.continuousAt.tendsto.comp hx
  have hadcont : Tendsto (fun n => a.derivative.eval (x n)) atTop (𝓝 (a.derivative.eval z0)) :=
    (a.derivative.hasStrictDerivAt z0).hasDerivAt.continuousAt.tendsto.comp hx
  have hbdcont : Tendsto (fun n => b.derivative.eval (x n)) atTop (𝓝 (b.derivative.eval z0)) :=
    (b.derivative.hasStrictDerivAt z0).hasDerivAt.continuousAt.tendsto.comp hx
  have hval0 : Tendsto (fun n => b.eval (x n)-b.eval z0) atTop (𝓝 0) := by
    simpa using hbcont.sub (tendsto_const_nhds (x := b.eval z0))
  have hvaleq : (fun n => b.eval (x n)-b.eval z0) =ᶠ[atTop]
      (fun n => (family a b n).eval (x n)/(n : ℂ)) := by
    filter_upwards [hpow, Filter.eventually_ge_atTop 1] with n hn hnpos
    exact (scaled_value_eq a b (x n) _ n (by omega) hn).symm
  have hinv : Tendsto (fun n : ℕ => (1 : ℂ)/(n : ℂ)) atTop (𝓝 0) :=
    tendsto_one_div_atTop_nhds_zero_nat
  have hder0 : Tendsto
      (fun n => -(b.eval z0 / a.eval (x n))*(a.derivative.eval (x n)) +
        (b.derivative.eval (x n))*((1 : ℂ)/(n : ℂ))) atTop
      (𝓝 (-(b.eval z0 / a.eval z0)*(a.derivative.eval z0))) := by
    have hdiv := (tendsto_const_nhds (x := b.eval z0)).div hacont ha0
    have hsum := (hdiv.neg.mul hadcont).add (hbdcont.mul hinv)
    simpa only [mul_zero, add_zero, Function.comp_apply, Pi.div_apply] using hsum
  have hdereq : (fun n => -(b.eval z0 / a.eval (x n))*(a.derivative.eval (x n)) +
      (b.derivative.eval (x n))*((1 : ℂ)/(n : ℂ))) =ᶠ[atTop]
      (fun n => (family a b n).derivative.eval (x n)/(n : ℂ)^2) := by
    filter_upwards [hpow, Filter.eventually_ge_atTop 1] with n hn hnpos
    rw [scaled_derivative_eq a b (x n) _ n (by omega) hb hn]
    ring
  exact ⟨hval0.congr' hvaleq, hder0.congr' hdereq⟩

theorem polynomial_family_roots_converge (a b : ℂ[X]) (z0 : ℂ)
    (ha : ‖a.eval z0‖ = 1) (ha' : a.derivative.eval z0 ≠ 0) (hb : b.eval z0 ≠ 0)
    (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n in atTop, ∃ z, (family a b n).IsRoot z ∧ ‖z-z0‖ < ε := by
  obtain ⟨x,hx,hpow⟩ := exists_local_preimages a z0 (b.eval z0) ha ha' hb
  obtain ⟨hval,hder⟩ := family_scaled_limits a b z0 x ha hb hx hpow
  have ha0 : a.eval z0 ≠ 0 := by intro h; simp [h] at ha
  have hL : -(b.eval z0/a.eval z0)*(a.derivative.eval z0) ≠ 0 :=
    mul_ne_zero (neg_ne_zero.mpr (div_ne_zero hb ha0)) ha'
  let K := a.natDegree+b.natDegree+1
  have hK : 0 < K := by dsimp [K]; omega
  have hroots := roots_near_from_scaled_limits (family a b) x _ K hK hL (family_degree a b)
    hval hder (ε/2) (by positivity)
  have hxnear := (Metric.tendsto_nhds.mp hx) (ε/2) (by positivity)
  filter_upwards [hroots,hxnear] with n hn hnnear
  obtain ⟨z,hz,hclose⟩ := hn
  refine ⟨z,hz,?_⟩
  rw [dist_eq_norm] at hnnear
  have htri := norm_add_le (z-x n) (x n-z0)
  have he : z-x n+(x n-z0)=z-z0 := by ring
  rw [he] at htri
  have hclose' : ‖z-x n‖ < ε/2 := by rw [norm_sub_rev]; exact hclose
  linarith

end BrownMol
end
