import Conjectures.DistanceGraphPhase

/-! Integer identities behind the exact odd-gap character formulas. -/
namespace DistanceGraph

theorem small_witness_data (l k s n u : ℤ) (hl : 2 ≤ l) (hk : 0 < k)
    (hs : s = 2*l-1) (hdiv : l*(k-1) = (s+2)*n+u)
    (hus : u ≤ s) (hsize : s*u ≤ k+s+1) :
    0 < n+l ∧ 2*(n+l)+u ≤ k+s+1 ∧
      (s+2)*(n+l) = l*(k+s+1)-u ∧
      k*(n+l) = (k+s+1)*n+(n+l)+u ∧
      (k+s)*(n+l) = (k+s+1)*(n+l-1)+((k+s+1)-(n+l)) := by
  have hs0 : 0 < s := by omega
  have hn : 0 ≤ n := by
    by_contra! hn
    have hh := mul_nonpos_of_nonneg_of_nonpos (show 0 ≤ s+2 by omega)
      (show n+1 ≤ 0 by omega)
    have hh' := mul_nonneg (show 0 ≤ l by omega) (show 0 ≤ k-1 by omega)
    nlinarith
  have hid : (s+2)*((k+s+1)-2*(n+l)-u) = (k+s+1)-s*u := by
    subst s
    linear_combination 2*hdiv
  have hp : 0 ≤ (s+2)*((k+s+1)-2*(n+l)-u) := by rw [hid]; omega
  have htwo : 2*(n+l)+u ≤ k+s+1 := by
    by_contra! htwo
    have hh := mul_neg_of_pos_of_neg (show 0 < s+2 by omega)
      (show (k+s+1)-2*(n+l)-u < 0 by omega)
    omega
  refine ⟨by omega, htwo, ?_, ?_, ?_⟩
  · subst s
    linear_combination -hdiv
  · linear_combination hdiv
  · ring

theorem small_value_above_phase_threshold (l k s n u : ℤ)
    (hl : 2 ≤ l) (hk : 0 < k) (hs : s = 2*l-1)
    (hdiv : l*(k-1) = (s+2)*n+u) (hsize : s*u ≤ k+s+1) :
    ((l : ℝ)-1)/s ≤ ((n+l : ℤ) : ℝ)/(k+s+1 : ℤ) := by
  have hs0 : 0 < s := by omega
  have hP : 0 < k+s+1 := by omega
  have hid : (s+2)*(s*(n+l)-(l-1)*(k+s+1)) = (k+s+1)-s*u := by
    subst s
    linear_combination -(2*l-1)*hdiv
  have hcross : (l-1)*(k+s+1) ≤ s*(n+l) := by
    by_contra! hcross
    have hh := mul_neg_of_pos_of_neg (show 0 < s+2 by omega)
      (show s*(n+l)-(l-1)*(k+s+1) < 0 by omega)
    omega
  have hsR : (0 : ℝ) < s := by exact_mod_cast hs0
  have hPR : (0 : ℝ) < (k+s+1 : ℤ) := by exact_mod_cast hP
  apply (div_le_div_iff₀ hsR hPR).mpr
  have hh : (((l-1)*(k+s+1) : ℤ) : ℝ) ≤ ((s*(n+l) : ℤ) : ℝ) := by
    exact_mod_cast hcross
  push_cast at hh ⊢
  nlinarith

theorem large_value_above_phase_threshold (l k s n : ℤ)
    (hl : 2 ≤ l) (hk : 0 < k) (hs : s = 2*l-1)
    (hdiv : l*(k-1) = (s+2)*n+(s+1)) (hsize : s*s ≤ 2*k+s) :
    ((l : ℝ)-1)/s ≤ ((k*l-s*(n+1) : ℤ) : ℝ)/(2*k+s : ℤ) := by
  have hs0 : 0 < s := by omega
  have hP : 0 < 2*k+s := by omega
  have hid : (s+2)*(s*(k*l-s*(n+1))-(l-1)*(2*k+s)) = (2*k+s)-s*s := by
    subst s
    linear_combination (2*l-1)^2*hdiv
  have hcross : (l-1)*(2*k+s) ≤ s*(k*l-s*(n+1)) := by
    by_contra! hcross
    have hh := mul_neg_of_pos_of_neg (show 0 < s+2 by omega)
      (show s*(k*l-s*(n+1))-(l-1)*(2*k+s) < 0 by omega)
    omega
  have hsR : (0 : ℝ) < s := by exact_mod_cast hs0
  have hPR : (0 : ℝ) < (2*k+s : ℤ) := by exact_mod_cast hP
  apply (div_le_div_iff₀ hsR hPR).mpr
  have hh : (((l-1)*(2*k+s) : ℤ) : ℝ) ≤ ((s*(k*l-s*(n+1)) : ℤ) : ℝ) := by
    exact_mod_cast hcross
  push_cast at hh ⊢
  nlinarith

theorem exceptional_witness_data (l s z : ℤ) (hl : 2 ≤ l) (hz : 0 ≤ z)
    (hs : s = 2*l-1) :
    let k := (s+2)*z+3
    let P := 2*k+s
    let H := 2*l*z+l+1
    0 < H ∧ 2*H+1 ≤ P ∧ (s+2)*H = l*P-s ∧
      k*(H+1) = P*(l*z+1)+H ∧
      (k+s)*(H+1) = P*(H-l*z-1)+(P-H) := by
  dsimp
  subst s
  have hlz : 0 ≤ l*z := mul_nonneg (by omega) hz
  refine ⟨by nlinarith, by nlinarith, ?_, ?_, ?_⟩ <;> ring

end DistanceGraph
