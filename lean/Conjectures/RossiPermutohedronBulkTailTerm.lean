module

public import Conjectures.RossiPermutohedronAnalyticPartial
public import Mathlib.Analysis.Real.Pi.Bounds

@[expose] public section
namespace RossiPermutohedron
open Complex

theorem oddPole_normSq_zero (x : ℝ) : ‖oddPole x 0‖^2=x^2+Real.pi^2 := by
  rw [Complex.sq_norm,oddPole_normSq]
  norm_num

theorem oddPole_tail_normSq (x : ℝ) (k : ℕ) :
    ‖oddPole x (k:ℤ)‖^2 =
      ‖oddPole x 0‖^2+4*Real.pi^2*((k:ℝ)*(k+1)) := by
  rw [Complex.sq_norm,oddPole_normSq,oddPole_normSq_zero]
  push_cast
  ring

theorem oddPole_near_norm_pos (x : ℝ) : 0<‖oddPole x 0‖ := by
  have h := oddPole_normSq_zero x
  have h' : 0<x^2+Real.pi^2 := by positivity
  by_contra! hn
  have he : ‖oddPole x 0‖=0 := le_antisymm hn (norm_nonneg _)
  simp [he] at h
  linarith

theorem bulkPole_ratio_lt (N : ℕ) (hN : 128≤N) (x : ℝ)
    (hx : ‖oddPole x 0‖^2 ≤ 10*(N:ℝ)) (k : ℕ) (hk : 1≤k) :
    (‖oddPole x 0‖/‖oddPole x (k:ℤ)‖)^N < (((k:ℝ)*(k+1))^2)⁻¹ := by
  let R := ‖oddPole x 0‖
  let L := ‖oddPole x (k:ℤ)‖
  let K : ℝ := (k:ℝ)*(k+1)
  let U : ℝ := 3*K/(N:ℝ)
  let M : ℕ := N/2
  have hR : 0<R := oddPole_near_norm_pos x
  have hN0 : 0<(N:ℝ) := by exact_mod_cast (show 0<N by omega)
  have hk0 : 0<(k:ℝ) := by exact_mod_cast (show 0<k by omega)
  have hK : 0<K := by dsimp [K]; positivity
  have hU : 0<U := by dsimp [U]; positivity
  have hs : L^2=R^2+4*Real.pi^2*K := oddPole_tail_normSq x k
  have hRL : R≤L := by
    apply (sq_le_sq₀ hR.le (norm_nonneg _)).mp
    rw [hs]
    exact le_add_of_nonneg_right (by positivity)
  have hL : 0<L := hR.trans_le hRL
  have hbase : 0≤R/L ∧ R/L≤1 :=
    ⟨(div_pos hR hL).le,(div_le_one hL).mpr hRL⟩
  have hpi : (30:ℝ)≤4*Real.pi^2 := by nlinarith [Real.pi_gt_three, sq_nonneg (Real.pi-3)]
  have hUr : U*R^2 ≤ 4*Real.pi^2*K := by
    calc
      _ ≤ U*(10*(N:ℝ)) := mul_le_mul_of_nonneg_left hx hU.le
      _ = 30*K := by dsimp [U]; field_simp; ring
      _ ≤ _ := mul_le_mul_of_nonneg_right hpi hK.le
  have hh : (1+U)*R^2≤L^2 := by rw [hs,add_mul,one_mul]; linarith
  have hsq : (R/L)^2≤(1+U)⁻¹ := by
    rw [div_pow, ←one_div]
    apply (div_le_div_iff₀ (pow_pos hL _) (by positivity : 0<1+U)).mpr
    nlinarith only [hh]
  have hmid : (R/L)^N ≤ ((1+U)^M)⁻¹ := by
    calc
      _ ≤ (R/L)^(2*M) := pow_le_pow_of_le_one hbase.1 hbase.2 (by dsimp [M]; omega)
      _ = ((R/L)^2)^M := pow_mul _ _ _
      _ ≤ ((1+U)⁻¹)^M := pow_le_pow_left₀ (sq_nonneg _) hsq _
      _ = _ := inv_pow _ _
  have hb : K^2 < (1+U)^M := bulkBinomial_strict N hN hK
  exact hmid.trans_lt ((inv_lt_inv₀ (by positivity : 0<(1+U)^M) (sq_pos_of_pos hK)).mpr hb)

end RossiPermutohedron
