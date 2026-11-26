module
public import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter
open scoped Topology

/-- A probability upper bound is superexponentially small at the
given speed. The definition handles zero probabilities without using
Lean's totalized real logarithm at zero. -/
def SuperexponentiallySmall (speed prob : ℕ→ℝ) : Prop :=
  ∀ A : ℝ,0<A→∀ᶠ n in atTop,prob n≤ Real.exp (-A*speed n)

theorem SuperexponentiallySmall.mono {speed p q : ℕ→ℝ}
    (hp : SuperexponentiallySmall speed p) (hq : ∀ᶠ n in atTop,q n≤ p n) :
    SuperexponentiallySmall speed q := by
  intro A hA
  filter_upwards [hq,hp A hA] with n hn hs
  exact hn.trans hs

theorem SuperexponentiallySmall.add {speed p q : ℕ→ℝ}
    (hs : Tendsto speed atTop atTop)
    (hp : SuperexponentiallySmall speed p) (hq : SuperexponentiallySmall speed q) :
    SuperexponentiallySmall speed (fun n=>p n+q n) := by
  intro A hA
  have hA' : 0<A+1 := by linarith
  filter_upwards [hp (A+1) hA',hq (A+1) hA',hs.eventually_ge_atTop (Real.log 2)] with n hn hm hspeed
  calc
    _ ≤ Real.exp (-(A+1)*speed n)+Real.exp (-(A+1)*speed n) := add_le_add hn hm
    _ = Real.exp (Real.log 2 + (-(A+1)*speed n)) := by
      rw [Real.exp_add,Real.exp_log (by norm_num : (0:ℝ)<2)]
      ring
    _ ≤ _ := Real.exp_le_exp.mpr (by linarith)

theorem SuperexponentiallySmall.mul_subexp {speed p w : ℕ→ℝ}
    (hp : SuperexponentiallySmall speed p)
    (h₀ : ∀ᶠ n in atTop,0≤ w n)
    (hw : ∀ ε : ℝ,0<ε→∀ᶠ n in atTop,w n≤ Real.exp (ε*speed n)) :
    SuperexponentiallySmall speed (fun n=>w n*p n) := by
  intro A hA
  filter_upwards [hp (A+1) (by linarith),hw 1 (by norm_num),h₀] with n hn hw' h0
  calc
    _ ≤ w n*Real.exp (-(A+1)*speed n) := mul_le_mul_of_nonneg_left hn h0
    _ ≤ Real.exp ((1:ℝ)*speed n)*Real.exp (-(A+1)*speed n) :=
      mul_le_mul_of_nonneg_right hw' (Real.exp_pos _).le
    _ = _ := by rw [← Real.exp_add]; congr 1; ring

theorem superexponentiallySmall_exp_of_ratio {speed exponent : ℕ→ℝ}
    (hs : ∀ᶠ n in atTop,0<speed n) (hExp : Tendsto (fun n=>exponent n/speed n) atTop atTop) :
    SuperexponentiallySmall speed (fun n=>Real.exp (-(exponent n))) := by
  intro A _
  filter_upwards [hs,hExp.eventually_ge_atTop A] with n hn hrate
  apply Real.exp_le_exp.mpr
  have h := (le_div_iff₀ hn).mp hrate
  linarith

end PomeranceSarkozy
