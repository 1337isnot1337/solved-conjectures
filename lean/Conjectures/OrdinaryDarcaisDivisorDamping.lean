import Conjectures.OrdinaryDarcaisPhase
import Mathlib.Analysis.Complex.Basic

/-! Divisor-class contributions to ordinary Fourier damping. -/

namespace OrdinaryDarcais

open Real

theorem divisorSum_div (n : ℕ) :
    (divisorSum n : ℝ) / n = ∑ d ∈ n.divisors, (d : ℝ)⁻¹ := by
  by_cases hn : n = 0
  · simp [hn, divisorSum]
  have hnr : (n : ℝ) ≠ 0 := by exact_mod_cast hn
  unfold divisorSum
  push_cast
  rw [Finset.sum_div, ← Nat.sum_div_divisors n (fun d => (d : ℝ)⁻¹)]
  apply Finset.sum_congr rfl
  intro d hd
  have hdr : (d : ℝ) ≠ 0 := by exact_mod_cast (Nat.pos_of_mem_divisors hd).ne'
  rw [Nat.cast_div (Nat.dvd_of_mem_divisors hd) hdr]
  field_simp

noncomputable def divisorDampingTerm (x r t : ℝ) (d k : ℕ) : ℝ :=
  if d ∈ k.divisors then (d : ℝ)⁻¹ * (x*r^k*(1-cos (k*t))) else 0

theorem dampingTerm_sum (x r t : ℝ) (k : ℕ) :
    (∑ d ∈ k.divisors, divisorDampingTerm x r t d k) =
      intensity x r k * (1-cos (k*t)) := by
  simp only [divisorDampingTerm, Finset.sum_ite_mem, Finset.inter_self, ← Finset.sum_mul,
    ← divisorSum_div]
  unfold intensity
  ring

private theorem blockTerm_nonneg {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (t : ℝ) (d k : ℕ) :
    0 ≤ divisorDampingTerm x r t d k := by
  unfold divisorDampingTerm
  split
  · exact mul_nonneg (by positivity) (mul_nonneg (by positivity) (sub_nonneg.mpr (cos_le_one _)))
  · exact le_rfl

private theorem finite_damping_le {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r)
    (t : ℝ) (D : Finset ℕ) (k : ℕ) :
    (∑ d ∈ D, divisorDampingTerm x r t d k) ≤ intensity x r k * (1-cos (k*t)) := by
  rw [← dampingTerm_sum]
  have hD : (∑ d ∈ D, divisorDampingTerm x r t d k) =
      ∑ d ∈ D ∩ k.divisors, divisorDampingTerm x r t d k := by
    symm
    apply Finset.sum_subset (Finset.inter_subset_left)
    intro d hd h
    have : d ∉ k.divisors := fun hk => h (Finset.mem_inter.mpr ⟨hd,hk⟩)
    simp [divisorDampingTerm,this]
  rw [hD]
  exact Finset.sum_le_sum_of_subset_of_nonneg Finset.inter_subset_right
    (fun i _ _ => blockTerm_nonneg hx hr t i k)

private theorem damping_summable {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) (t : ℝ) :
    Summable (fun k : ℕ => intensity x r k * (1-cos (k*t))) := by
  apply Summable.of_nonneg_of_le _ _ ((intensity_summable hx hr hr').mul_right 2)
  · intro k
    exact mul_nonneg (by unfold intensity; positivity) (sub_nonneg.mpr (cos_le_one _))
  · intro k
    exact mul_le_mul_of_nonneg_left (by linarith [neg_one_le_cos ((k:ℝ)*t)])
      (by unfold intensity; positivity)

theorem divisorDamping_lower {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1)
    (t : ℝ) (D : Finset ℕ) :
    (∑ d ∈ D, ∑' k : ℕ, divisorDampingTerm x r t d k) ≤ damping x r t := by
  have h := damping_summable hx hr hr' t
  have hs (d : ℕ) : Summable (divisorDampingTerm x r t d) := by
    apply Summable.of_nonneg_of_le (blockTerm_nonneg hx hr t d) _ h
    intro k
    simpa using finite_damping_le hx hr t {d} k
  rw [← Summable.tsum_finsetSum (fun d _ => hs d)]
  have hsum : Summable (fun k => ∑ d ∈ D, divisorDampingTerm x r t d k) :=
    Summable.of_nonneg_of_le (fun k => Finset.sum_nonneg (fun d _ => blockTerm_nonneg hx hr t d k))
      (finite_damping_le hx hr t D) h
  exact hsum.tsum_le_tsum (finite_damping_le hx hr t D) h

end OrdinaryDarcais
