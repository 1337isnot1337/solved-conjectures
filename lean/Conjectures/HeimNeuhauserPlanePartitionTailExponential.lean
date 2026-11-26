import Conjectures.HeimNeuhauserPlanePartitionTailParameters
import Mathlib.Analysis.Real.Pi.Bounds

/-! Explicit exponential majorants for the middle bins and the two outer integration ranges. -/

namespace PlanePartition

open Real

theorem expNegative_bound {w : ℝ} (hw : 0 ≤ w) {N : ℕ} (hN : 0 < N) :
    exp (-w) ≤ 1/(1+w/N)^N := by
  have hN' : (0 : ℝ) < N := by exact_mod_cast hN
  have h₁ : 1+w/N ≤ exp (w/N) := by linarith only [add_one_le_exp (w/N)]
  have hp : (1+w/N)^N ≤ exp w := by
    calc
      _ ≤ exp (w/N)^N := pow_le_pow_left₀ (by positivity) h₁ _
      _ = exp w := by rw [← Real.exp_nat_mul]; congr 1; field_simp
  rw [exp_neg, one_div]
  exact inv_anti₀ (by positivity) hp

private theorem cube_exp_decreases {a w : ℝ} (ha : 3 ≤ a) (haw : a ≤ w) :
    w^3*exp (-w) ≤ a^3*exp (-a) := by
  have ha₀ : 0 < a := by linarith
  have hw₀ : 0 ≤ w := by linarith
  let q := (w-a)/a
  have hq : 0 ≤ q := div_nonneg (sub_nonneg.mpr haw) ha₀.le
  have hEq : a*q = w-a := by dsimp [q]; field_simp
  have hratio : w ≤ a*exp q := by
    have h := mul_le_mul_of_nonneg_left (add_one_le_exp q) ha₀.le
    linarith
  have he : exp (3*q) ≤ exp (w-a) := by
    apply exp_le_exp.mpr
    nlinarith only [mul_le_mul_of_nonneg_right ha hq, hEq]
  have hpow : w^3 ≤ a^3*exp (w-a) := by
    calc
      _ ≤ (a*exp q)^3 := pow_le_pow_left₀ hw₀ hratio _
      _ = a^3*exp (3*q) := by rw [mul_pow, ← exp_nat_mul]; norm_num
      _ ≤ _ := mul_le_mul_of_nonneg_left he (pow_nonneg ha₀.le _)
  calc
    _ ≤ (a^3*exp (w-a))*exp (-w) := mul_le_mul_of_nonneg_right hpow (exp_pos _).le
    _ = _ := by rw [mul_assoc, ← exp_add]; congr 2; ring

theorem outer_exponential_bound {V B c : ℝ} (hV : 0 ≤ V) (hB : 0 ≤ B)
    (hupper : V ≤ 16*B^2) (hc : 2/5 ≤ c) (hw : 39/2 ≤ B*c) :
    π*V*sqrt V*exp (-(B*c)) ≤ 9/100 := by
  let w := B*c
  have hw₀ : 0 ≤ w := by dsimp [w]; linarith
  have hs : sqrt V ≤ 4*B := by
    apply (sq_le_sq₀ (sqrt_nonneg _) (by positivity)).mp
    rw [sq_sqrt hV]; nlinarith only [hupper]
  have hBw : B ≤ (5/2)*w := by dsimp [w]; nlinarith only [mul_le_mul_of_nonneg_left hc hB]
  have hscale : V*sqrt V ≤ 1000*w^3 := by
    calc
      _ ≤ (16*B^2)*(4*B) := mul_le_mul hupper hs (sqrt_nonneg _) (by positivity)
      _ = 64*B^3 := by ring
      _ ≤ 64*((5/2)*w)^3 := by gcongr
      _ = _ := by ring
  have hpi : π ≤ 16/5 := by linarith [Real.pi_lt_d2]
  have hmono := cube_exp_decreases (by norm_num : (3 : ℝ) ≤ 39/2) hw
  have hex := expNegative_bound (by norm_num : (0 : ℝ) ≤ 39/2) (by decide : 0 < 4096)
  norm_cast at hex
  calc
    _ = π*(V*sqrt V)*exp (-w) := by ring
    _ ≤ ((16/5)*(1000*w^3))*exp (-w) := by gcongr
    _ = 3200*(w^3*exp (-w)) := by ring
    _ ≤ 3200*((39/2)^3*exp (-(39/2))) := mul_le_mul_of_nonneg_left hmono (by norm_num)
    _ ≤ 3200*((39/2)^3*(1/(1+(39/2)/4096)^4096)) := by gcongr
    _ ≤ _ := by
      have hp : ((3200*((39/2)^3*(1/(1+(39/2)/4096)^4096)) : ℚ) : ℝ) ≤ ((9/100 : ℚ) : ℝ) :=
        Rat.cast_le.mpr (by decide +kernel)
      push_cast at hp
      exact hp

theorem gaussian_far_bound {u : ℝ} (hu : 12 ≤ u) :
    u^2/2*exp (-(u^2/16)) ≤ (1/100)*exp (-(u-12)) := by
  let z := (u-12)/12
  have hz : 0 ≤ z := by dsimp [z]; linarith
  have hu' : u ≤ 12*exp z := by
    have h := add_one_le_exp z
    dsimp [z] at h
    linarith
  have hpow : u^2 ≤ 144*exp (2*z) := by
    calc
      _ ≤ (12*exp z)^2 := pow_le_pow_left₀ (by linarith) hu' _
      _ = _ := by rw [mul_pow, ← exp_nat_mul]; norm_num
  have hadd : 2*z-u^2/16 ≤ -9-(u-12) := by
    dsimp [z]
    nlinarith only [sq_nonneg (u-12), hu]
  have hsmall : 72*exp (-9) ≤ 1/100 := by
    have h := expNegative_bound (by norm_num : (0 : ℝ) ≤ 9) (by decide : 0 < 1024)
    simp only [Nat.cast_ofNat] at h
    calc
      _ ≤ 72*(1/(1+(9 : ℝ)/1024)^1024) := by gcongr
      _ ≤ _ := by
        have hp : ((72*(1/(1+9/1024)^1024) : ℚ) : ℝ) ≤ ((1/100 : ℚ) : ℝ) :=
          Rat.cast_le.mpr (by decide +kernel)
        push_cast at hp
        exact hp
  calc
    _ ≤ (144*exp (2*z))/2 * exp (-(u^2/16)) := by gcongr
    _ = 72*exp (2*z-u^2/16) := by rw [sub_eq_add_neg, exp_add]; ring
    _ ≤ 72*exp (-9-(u-12)) := by gcongr
    _ = (72*exp (-9))*exp (-(u-12)) := by rw [sub_eq_add_neg (-9), exp_add, mul_assoc]
    _ ≤ _ := mul_le_mul_of_nonneg_right hsmall (exp_pos _).le

end PlanePartition
