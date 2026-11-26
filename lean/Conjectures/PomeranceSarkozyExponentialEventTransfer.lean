module
public import Conjectures.PomeranceSarkozySuperExponential
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter
open scoped Topology

/-- A superexponentially small additive error does not change a
finite exponential upper rate. This formulation is valid at zero
probabilities without taking a totalized real logarithm. -/
theorem exponential_event_upper_transfer (s p q e : ℕ→ℝ)
    (hs : Tendsto s atTop atTop) (he : SuperexponentiallySmall s e)
    (I ε : ℝ) (hε : 0<ε)
    (h : ∀ᶠ n in atTop,p n≤q n+e n)
    (hQ : ∀ᶠ n in atTop,q n≤Real.exp (-s n*(I-ε/2))) :
    ∀ᶠ n in atTop,p n≤Real.exp (-s n*(I-ε)) := by
  let A := max 1 I
  have hA : 0<A := zero_lt_one.trans_le (le_max_left ..)
  filter_upwards [h,hQ,he A hA,hs.eventually_ge_atTop 0,
    hs.eventually_ge_atTop (2*Real.log 2/ε)] with n hP hq herr h0 hS
  have he' : e n≤Real.exp (-s n*(I-ε/2)) := by
    refine herr.trans (Real.exp_le_exp.mpr ?_)
    have hi : I-ε/2≤A := (by linarith : I-ε/2≤I).trans (le_max_right ..)
    have hM := mul_le_mul_of_nonneg_right hi h0
    nlinarith
  have hLog : Real.log 2≤s n*(ε/2) := by
    have h := (div_le_iff₀ hε).mp hS
    nlinarith
  calc
    _ ≤ Real.exp (-s n*(I-ε/2))+Real.exp (-s n*(I-ε/2)) := hP.trans (add_le_add hq he')
    _ = Real.exp (-s n*(I-ε/2)+Real.log 2) := by
      rw [Real.exp_add,Real.exp_log (by norm_num : (0:ℝ)<2)]
      ring
    _ ≤ _ := by apply Real.exp_le_exp.mpr; nlinarith

/-- The matching lower-rate transfer follows by absorbing the
superexponential error into half of the lower bound and absorbing
that factor on the diverging speed. -/
theorem exponential_event_lower_transfer (s p q e : ℕ→ℝ)
    (hs : Tendsto s atTop atTop) (he : SuperexponentiallySmall s e)
    (I ε : ℝ) (hε : 0<ε)
    (h : ∀ᶠ n in atTop,q n≤p n+e n)
    (hQ : ∀ᶠ n in atTop,Real.exp (-s n*(I+ε/2))≤q n) :
    ∀ᶠ n in atTop,Real.exp (-s n*(I+ε))≤p n := by
  let A := max 1 (I+ε)
  have hA : 0<A := zero_lt_one.trans_le (le_max_left ..)
  filter_upwards [h,hQ,he A hA,hs.eventually_ge_atTop 0,
    hs.eventually_ge_atTop (2*Real.log 2/ε)] with n hp hq herr h0 hS
  have hLog : Real.log 2≤s n*(ε/2) := by
    have h := (div_le_iff₀ hε).mp hS
    nlinarith
  have hE : Real.exp (-s n*(I+ε))≤(1/2:ℝ)*Real.exp (-s n*(I+ε/2)) := by
    calc
      _ ≤ Real.exp (-s n*(I+ε/2)-Real.log 2) := by apply Real.exp_le_exp.mpr; nlinarith
      _ = _ := by rw [Real.exp_sub,Real.exp_log (by norm_num : (0:ℝ)<2)]; ring
  have he' : e n≤Real.exp (-s n*(I+ε)) := by
    refine herr.trans (Real.exp_le_exp.mpr ?_)
    have hM := mul_le_mul_of_nonneg_right (le_max_right 1 (I+ε)) h0
    nlinarith
  linarith [hq.trans hp,he'.trans hE]

end PomeranceSarkozy
