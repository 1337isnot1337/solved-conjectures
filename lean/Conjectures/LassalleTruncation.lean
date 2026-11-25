module

public import Conjectures.LassalleTailGeometric

@[expose] public section
namespace LassalleRefinement

theorem certificateWeight_real_budget :
    (8/7:ℝ)*certificateWeight 15 +
      (32/2^40:ℝ)*(∑ m ∈ Finset.range 15, certificateWeight m) < 1/1000000 := by
  have hb :
      ((weight 15*(8/7) + 32/2^40*(∑ m ∈ Finset.range 15, weight m):ℚ):ℝ) <
        ((1/1000000:ℚ):ℝ) := by exact_mod_cast bessel_certificate_error_budget
  push_cast at hb
  simp_rw [certificateWeight_cast] at hb
  simpa only [mul_comm (certificateWeight 15)] using hb

/-- Once the individual Bernstein layers satisfy their weight bounds, the
written cutoff-14 error estimate follows for every finite row length. -/
theorem lassalle_truncation_bound (n : ℕ) (f g : ℕ→ℝ)
    (hprefix : ∀ i<15, |f i-g i|≤(32/2^40:ℝ)*certificateWeight i)
    (htail : ∀ i<n, |f (15+i)|≤certificateWeight (15+i)) :
    |(∑ i ∈ Finset.range (15+n), f i)-(∑ i ∈ Finset.range 15, g i)|≤1/1000000 := by
  rw [Finset.sum_range_add]
  rw [add_sub_right_comm,←Finset.sum_sub_distrib]
  have h₁ :
      |∑ i ∈ Finset.range 15, (f i-g i)| ≤ (32/2^40:ℝ)*(∑ i ∈ Finset.range 15, certificateWeight i) := by
    calc
      _ ≤ ∑ i ∈ Finset.range 15, |f i-g i| := Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ i ∈ Finset.range 15, (32/2^40:ℝ)*certificateWeight i :=
        Finset.sum_le_sum (fun i hi => hprefix i (Finset.mem_range.mp hi))
      _ = _ := by rw [Finset.mul_sum]
  have h₂ : |∑ i ∈ Finset.range n, f (15+i)| ≤ (8/7:ℝ)*certificateWeight 15 := by
    calc
      _ ≤ ∑ i ∈ Finset.range n, |f (15+i)| := Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ i ∈ Finset.range n, certificateWeight (15+i) :=
        Finset.sum_le_sum (fun i hi => htail i (Finset.mem_range.mp hi))
      _ ≤ _ := certificateWeight_tail n
  refine (abs_add_le _ _).trans ?_
  have hb := add_le_add h₁ h₂
  have hc := certificateWeight_real_budget
  linarith

end LassalleRefinement
