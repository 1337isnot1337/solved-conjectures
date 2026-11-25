import Mathlib.Analysis.Normed.Group.Tannery
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic

/-! Summing the normalized tail contributions for Conjecture 6.3. -/

namespace PantoneBonaTerminal

open Filter Finset
open scoped Topology

private noncomputable def term (F : ℕ → ℝ) (S : ℕ → ℕ → ℝ) (n r : ℕ) : ℝ :=
  if r < n then F (n - (r + 1)) * S (n - (r + 1)) (r + 1) / 9 ^ n * (n : ℝ) ^ 3
  else 0

private theorem term_limit {F : ℕ → ℝ} {S : ℕ → ℕ → ℝ} {c : ℝ} (r : ℕ)
    (hf : Tendsto (fun m : ℕ => F m / 9 ^ m * (m : ℝ) ^ 4) atTop (𝓝 c))
    (hs : Tendsto (fun m : ℕ => S m (r + 1) / (m : ℝ)) atTop (𝓝 (3 ^ r))) :
    Tendsto (fun n => term F S n r) atTop (𝓝 ((c / 9) * (1 / 3) ^ r)) := by
  let m (n : ℕ) := n - (r + 1)
  have hm : Tendsto m atTop atTop := tendsto_sub_atTop_nat _
  have hratio : Tendsto (fun n : ℕ => (n : ℝ) / (m n : ℝ)) atTop (𝓝 1) := by
    have hh := ((tendsto_const_div_atTop_nhds_zero_nat (r + 1 : ℝ)).comp hm).const_add 1
    simp only [add_zero] at hh
    apply hh.congr'
    filter_upwards [eventually_ge_atTop (r + 2)] with n hn
    have hm' : 0 < m n := by dsimp [m]; omega
    have hn' : n = m n + (r + 1) := by dsimp [m]; omega
    have hnR : (n : ℝ) = (m n : ℝ) + (r + 1 : ℝ) := by exact_mod_cast hn'
    change 1 + (r + 1 : ℝ) / (m n : ℝ) = (n : ℝ) / (m n : ℝ)
    have hmR : (m n : ℝ) ≠ 0 := by exact_mod_cast hm'.ne'
    rw [hnR, add_div (m n : ℝ), div_self hmR]
  have hlim := (((hf.comp hm).mul (hs.comp hm)).mul (hratio.pow 3)).div_const (9 ^ (r + 1))
  have hgeom : c * 3 ^ r * 1 ^ 3 / 9 ^ (r + 1) = (c / 9) * (1 / 3 : ℝ) ^ r := by
    rw [one_pow, mul_one, pow_succ, div_pow, one_pow,
      show (9 : ℝ) ^ r = (3 ^ r) ^ 2 by rw [← pow_mul, Nat.mul_comm, pow_mul]; norm_num]
    field_simp
  rw [hgeom] at hlim
  apply hlim.congr'
  filter_upwards [eventually_ge_atTop (r + 2)] with n hn
  have hm' : 0 < m n := by dsimp [m]; omega
  have hn' : m n + (r + 1) = n := by dsimp [m]; omega
  have hnPow : (9 : ℝ) ^ n = 9 ^ (m n) * 9 ^ (r + 1) := by rw [← pow_add, hn']
  have hmR : (m n : ℝ) ≠ 0 := by exact_mod_cast hm'.ne'
  change F (m n) / 9 ^ (m n) * (m n : ℝ) ^ 4 * (S (m n) (r + 1) / (m n : ℝ)) *
    ((n : ℝ) / (m n : ℝ)) ^ 3 / 9 ^ (r + 1) = term F S n r
  rw [term, ite_eq_left (by omega : r < n), hnPow]
  change _ = F (m n) * S (m n) (r + 1) / (9 ^ (m n) * 9 ^ (r + 1)) * (n : ℝ) ^ 3
  field_simp [hmR]

private theorem term_bound {F : ℕ → ℝ} {S : ℕ → ℕ → ℝ} {C K : ℝ} (hC : 0 ≤ C)
    (hK : 0 ≤ K) (hf : ∀ m, |F m / 9 ^ m| ≤ C / ((m : ℝ) + 1) ^ 4)
    (hs : ∀ m r, |S m (r + 1)| ≤ K * (m : ℝ) * 4 ^ (r + 1)) (n r : ℕ) :
    ‖term F S n r‖ ≤ C * K * ((r : ℝ) + 2) ^ 3 * (4 / 9) ^ (r + 1) := by
  by_cases hr : r < n
  · let m := n - (r + 1)
    let b := (m : ℝ) + 1
    let a := (r : ℝ) + 2
    have hn : m + (r + 1) = n := by dsimp [m]; omega
    have hnPow : (9 : ℝ) ^ n = 9 ^ m * 9 ^ (r + 1) := by rw [← pow_add, hn]
    have hna : n ≤ (m + 1) * (r + 2) := by
      rw [← hn, Nat.mul_succ]
      have hh := Nat.mul_le_mul_right (r + 1) (show 1 ≤ m + 1 by omega)
      omega
    have hnR : (n : ℝ) ≤ b * a := by dsimp [a, b]; exact_mod_cast hna
    have hmR : (m : ℝ) ≤ b := by dsimp [b]; linarith
    have hb : 0 < b := by dsimp [b]; positivity
    rw [term, ite_eq_left hr, hnPow, Real.norm_eq_abs]
    change |F m * S m (r + 1) / (9 ^ m * 9 ^ (r + 1)) * (n : ℝ) ^ 3| ≤ _
    rw [show F m * S m (r + 1) / (9 ^ m * 9 ^ (r + 1)) * (n : ℝ) ^ 3 =
      F m / 9 ^ m * S m (r + 1) * (n : ℝ) ^ 3 / 9 ^ (r + 1) by ring]
    rw [abs_div, abs_mul, abs_mul, abs_of_nonneg (by positivity : 0 ≤ (n : ℝ) ^ 3),
      abs_of_nonneg (by positivity : 0 ≤ (9 : ℝ) ^ (r + 1))]
    calc
      _ ≤ C / b ^ 4 * (K * b * 4 ^ (r + 1)) * (b * a) ^ 3 / 9 ^ (r + 1) := by
        have hS : |S m (r + 1)| ≤ K * b * 4 ^ (r + 1) := (hs m r).trans (by gcongr)
        gcongr
        · exact hf m
      _ = _ := by
        change _ = C * K * a ^ 3 * (4 / 9) ^ (r + 1)
        rw [div_pow]
        field_simp [hb.ne']
  · rw [term, ite_eq_right hr, norm_zero]
    positivity

private theorem summable_shifted_pow_mul_geom (B : ℕ) {q : ℝ}
    (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) :
    Summable (fun r : ℕ => ((r : ℝ) + 1) ^ B * q ^ r) := by
  have hh : Summable (fun r : ℕ => ((r + 1 : ℕ) : ℝ) ^ B * q ^ (r + 1)) :=
    (summable_nat_add_iff (f := fun r : ℕ => (r : ℝ) ^ B * q ^ r) 1).mpr
      (summable_pow_mul_geometric_of_norm_lt_one B hq)
  convert hh.mul_left q⁻¹ using 1
  funext r
  rw [Nat.cast_add, Nat.cast_one, pow_succ]
  field_simp [hq₀]

/-- The binomial moment of the normalized gap frequencies at front size `m`. -/
noncomputable def gapMoment (z : ℕ → ℕ → ℝ) (m r : ℕ) : ℝ :=
  ∑' g : ℕ, z m g * ((g + r).choose r : ℝ)

/-- The fixed-gap limits and uniform exponential estimate imply every fixed
binomial-moment limit. -/
theorem gapMoment_limit {z : ℕ → ℕ → ℝ} {q a C : ℝ} (B r : ℕ)
    (hq₀ : 0 < q) (hq₁ : q < 1) (hC : 0 ≤ C)
    (hz : ∀ m g, |z m g| ≤ C * ((g : ℝ) + 1) ^ B * q ^ g)
    (hpoint : ∀ g, Tendsto (fun m => z m g) atTop (𝓝 (a * q ^ g))) :
    Tendsto (fun m => gapMoment z m r) atTop (𝓝 (a / (1 - q) ^ (r + 1))) := by
  have hq : ‖q‖ < 1 := by simpa [Real.norm_eq_abs, abs_of_pos hq₀] using hq₁
  have hsum := (summable_shifted_pow_mul_geom (B + r) hq₀.ne' hq).mul_left
    (C * ((r : ℝ) + 1) ^ r)
  have hbound (m g : ℕ) : ‖z m g * ((g + r).choose r : ℝ)‖ ≤
      C * ((r : ℝ) + 1) ^ r * (((g : ℝ) + 1) ^ (B + r) * q ^ g) := by
    have hg : g + r ≤ (g + 1) * (r + 1) := by nlinarith
    have hchoose : ((g + r).choose r : ℝ) ≤ (((g : ℝ) + 1) * ((r : ℝ) + 1)) ^ r := by
      exact_mod_cast (Nat.choose_le_pow _ _).trans (Nat.pow_le_pow_left hg _)
    have habs : |((g + r).choose r : ℝ)| = ((g + r).choose r : ℝ) := abs_of_nonneg (by positivity)
    rw [Real.norm_eq_abs, abs_mul, habs]
    calc
      _ ≤ (C * ((g : ℝ) + 1) ^ B * q ^ g) * (((g : ℝ) + 1) * ((r : ℝ) + 1)) ^ r :=
        mul_le_mul (hz m g) hchoose (Nat.cast_nonneg _) (by positivity)
      _ = _ := by rw [mul_pow, pow_add]; ring
  have hlim := tendsto_tsum_of_dominated_convergence hsum
    (fun g => (hpoint g).mul_const ((g + r).choose r : ℝ))
    (Eventually.of_forall hbound)
  have htotal : (∑' g : ℕ, a * q ^ g * ((g + r).choose r : ℝ)) =
      a / (1 - q) ^ (r + 1) := by
    simp_rw [mul_assoc a, mul_comm (q ^ _)]
    rw [tsum_mul_left, tsum_choose_mul_geometric_of_norm_lt_one r hq]
    ring
  rw [htotal] at hlim
  exact hlim

private theorem choose_le_four_pow (g r : ℕ) :
    ((g + r).choose r : ℝ) ≤ (4 / 3 : ℝ) ^ (g + 1) * 4 ^ r := by
  have hq : ‖(1 / 4 : ℝ)‖ < 1 := by norm_num
  have h := (summable_choose_mul_geometric_of_norm_lt_one g hq).le_tsum r
    (fun j _ => by positivity)
  rw [tsum_choose_mul_geometric_of_norm_lt_one g hq] at h
  rw [show (1 : ℝ) / (1 - 1 / 4) ^ (g + 1) = (4 / 3 : ℝ) ^ (g + 1) by
    rw [show (1 : ℝ) - 1 / 4 = 3 / 4 by norm_num, ← one_pow (g + 1), ← div_pow]
    norm_num] at h
  have hh := mul_le_mul_of_nonneg_right h (by positivity : 0 ≤ (4 : ℝ) ^ r)
  rw [mul_assoc, ← mul_pow, show (1 / 4 : ℝ) * 4 = 1 by norm_num, one_pow, mul_one] at hh
  simpa [Nat.add_comm r g, Nat.choose_symm_add (a := g) (b := r)] using hh

/-- At width three the same uniform gap estimate gives a moment bound
geometric in the tail length, with rate `4 < 9`. -/
theorem gapMoment_bound_width_three {z : ℕ → ℕ → ℝ} {C : ℝ} (B : ℕ)
    (hC : 0 ≤ C) (hz : ∀ m g, |z m g| ≤ C * ((g : ℝ) + 1) ^ B * (2 / 3) ^ g) :
    ∃ K ≥ 0, ∀ m r, |gapMoment z m r| ≤ K * 4 ^ r := by
  let majorant (g : ℕ) := (C * (4 / 3)) * (((g : ℝ) + 1) ^ B * (8 / 9) ^ g)
  have hm₀ (g : ℕ) : 0 ≤ majorant g := by dsimp [majorant]; positivity
  have hm : Summable majorant := (summable_shifted_pow_mul_geom B (by norm_num) (by norm_num)).mul_left _
  refine ⟨∑' g, majorant g, tsum_nonneg hm₀, fun m r => ?_⟩
  have hb (g : ℕ) : ‖z m g * ((g + r).choose r : ℝ)‖ ≤ majorant g * 4 ^ r := by
    have habs : |((g + r).choose r : ℝ)| = ((g + r).choose r : ℝ) := abs_of_nonneg (by positivity)
    rw [Real.norm_eq_abs, abs_mul, habs]
    calc
      _ ≤ (C * ((g : ℝ) + 1) ^ B * (2 / 3) ^ g) * ((4 / 3) ^ (g + 1) * 4 ^ r) :=
        mul_le_mul (hz m g) (choose_le_four_pow g r) (Nat.cast_nonneg _) (by positivity)
      _ = _ := by
        unfold majorant
        rw [show (8 / 9 : ℝ) = (2 / 3) * (4 / 3) by norm_num, mul_pow, pow_succ (4 / 3 : ℝ)]
        ring
  have hmajor := hm.mul_right ((4 : ℝ) ^ r)
  have hs := Summable.of_nonneg_of_le (fun _ => norm_nonneg _) hb hmajor
  rw [← Real.norm_eq_abs, gapMoment, ← tsum_mul_right]
  exact (norm_tsum_le_tsum_norm hs).trans (hs.tsum_le_tsum hb hmajor)

/-- The finite counting identity, Regev front limit, fixed-tail limits and
uniform geometric bound imply the normalized `A₅,₄` limit. -/
theorem count_limit_of_gap_estimates {A F : ℕ → ℝ} {S : ℕ → ℕ → ℝ} {c C K : ℝ}
    (hC : 0 ≤ C) (hK : 0 ≤ K)
    (hcount : ∀ n, A n = F n + ∑ r ∈ range n, F (n - (r + 1)) * S (n - (r + 1)) (r + 1))
    (hf : Tendsto (fun m : ℕ => F m / 9 ^ m * (m : ℝ) ^ 4) atTop (𝓝 c))
    (hfBound : ∀ m, |F m / 9 ^ m| ≤ C / ((m : ℝ) + 1) ^ 4)
    (hs : ∀ r, Tendsto (fun m : ℕ => S m (r + 1) / (m : ℝ)) atTop (𝓝 (3 ^ r)))
    (hsBound : ∀ m r, |S m (r + 1)| ≤ K * (m : ℝ) * 4 ^ (r + 1)) :
    Tendsto (fun n : ℕ => A n / 9 ^ n * (n : ℝ) ^ 3) atTop (𝓝 (c / 6)) := by
  have hsum : Summable (fun r : ℕ => C * K * ((r : ℝ) + 2) ^ 3 * (4 / 9) ^ (r + 1)) := by
    have hh := summable_shifted_pow_mul_geom 3 (by norm_num : (4 / 9 : ℝ) ≠ 0)
      (by norm_num : ‖(4 / 9 : ℝ)‖ < 1)
    convert ((summable_nat_add_iff (f := fun r : ℕ => ((r : ℝ) + 1) ^ 3 * (4 / 9) ^ r) 1).mpr hh).mul_left (C * K) using 1
    funext r
    push_cast
    ring
  have htail := tendsto_tsum_of_dominated_convergence hsum
    (fun r => term_limit r hf (hs r)) (Eventually.of_forall (fun n r => term_bound hC hK hfBound hsBound n r))
  have hgeom : (∑' r : ℕ, (c / 9) * (1 / 3 : ℝ) ^ r) = c / 6 := by
    rw [tsum_mul_left, tsum_geometric_of_norm_lt_one (by norm_num : ‖(1 / 3 : ℝ)‖ < 1)]
    ring
  rw [hgeom] at htail
  have hfront : Tendsto (fun n : ℕ => F n / 9 ^ n * (n : ℝ) ^ 3) atTop (𝓝 0) := by
    have hh := hf.mul (tendsto_const_div_atTop_nhds_zero_nat (1 : ℝ))
    rw [mul_zero] at hh
    apply hh.congr'
    filter_upwards [eventually_ge_atTop (1 : ℕ)] with n hn
    have hne : (n : ℝ) ≠ 0 := by exact_mod_cast (by omega : n ≠ 0)
    change F n / 9 ^ n * (n : ℝ) ^ 4 * (1 / (n : ℝ)) = F n / 9 ^ n * (n : ℝ) ^ 3
    field_simp [hne]
  have htotal := hfront.add htail
  rw [zero_add] at htotal
  apply htotal.congr
  intro n
  rw [hcount, add_div, add_mul,
    tsum_eq_sum (f := term F S n) (s := range n)
      (fun r hr => ite_eq_right (fun hh => hr (mem_range.mpr hh)))]
  congr 1
  simp only [div_eq_mul_inv, sum_mul]
  exact sum_congr rfl fun r hr => by rw [term, ite_eq_left (mem_range.mp hr), div_eq_mul_inv]

end PantoneBonaTerminal
