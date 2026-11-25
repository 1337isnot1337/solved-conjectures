module

public import Mathlib.Analysis.Complex.ExponentialBounds
public import Mathlib.Topology.Algebra.InfiniteSum.Order
public import Mathlib.Tactic

@[expose] public section
namespace LassalleRefinement

theorem exp_three_lt_32 : Real.exp 3 < 32 := by
  have h : (Real.exp 1)^3 < (3:ℝ)^3 :=
    pow_lt_pow_left₀ Real.exp_one_lt_three (Real.exp_pos _).le (by decide)
  have hu := Real.exp_nat_mul 1 3
  norm_num at hu h ⊢
  linarith

/-- Uniform ordinary-product estimate used after removing the first
Bessel zero. This only needs the two power-sum bounds. -/
theorem bessel_product_bound_finite (α : ℕ→ℝ)
    (hα : ∀ i,0≤α i) (hs : Summable α) (hs2 : Summable (fun i => (α i)^2))
    (h1 : ∑' i,α i≤21/25) (h2 : ∑' i,(α i)^2≤(9/25:ℝ)^2) (s : Finset ℕ) :
    (∏ i ∈ s, (1+α i/(1-2*α i))) ≤ Real.exp 3 := by
  have hsmall (i : ℕ) : α i≤9/25 := by
    have h := (hs2.sum_le_tsum {i} (fun j _ => sq_nonneg (α j))).trans h2
    simp only [Finset.sum_singleton] at h
    by_contra! hh
    have hd : (9/25:ℝ)^2<(α i)^2 :=
      pow_lt_pow_left₀ hh (by norm_num) (by decide)
    exact (not_lt_of_ge h) hd
  let f (i : ℕ) := α i/(1-2*α i)
  have hp (i : ℕ) : 0<1-2*α i := by linarith [hsmall i]
  have hf (i : ℕ) : 0≤f i := div_nonneg (hα i) (hp i).le
  have he (i : ℕ) : f i≤α i/(7/25) := by
    apply div_le_div_of_nonneg_left (hα i) (by norm_num)
    linarith [hsmall i]
  have hsum : (∑ i ∈ s,f i)≤3 := by
    calc
      _ ≤ ∑ i ∈ s, α i/(7/25) := Finset.sum_le_sum (fun i _ => he i)
      _ = (∑ i ∈ s,α i)/(7/25) := by rw [Finset.sum_div]
      _ ≤ (21/25:ℝ)/(7/25) := div_le_div_of_nonneg_right
        ((hs.sum_le_tsum s (fun i _ => hα i)).trans h1) (by norm_num)
      _ = _ := by norm_num
  exact (Real.prod_one_add_le_exp_sum s hf).trans (Real.exp_le_exp.mpr hsum)

theorem bessel_product_bound_limit (α : ℕ→ℝ) (P : ℝ)
    (hα : ∀ i,0≤α i) (hs : Summable α) (hs2 : Summable (fun i => (α i)^2))
    (h1 : ∑' i,α i≤21/25) (h2 : ∑' i,(α i)^2≤(9/25:ℝ)^2)
    (hP : HasProd (fun i => 1+α i/(1-2*α i)) P) : P<32 := by
  have hp : P≤Real.exp 3 := by
    apply le_of_tendsto hP
    exact Filter.Eventually.of_forall (bessel_product_bound_finite α hα hs hs2 h1 h2)
  exact hp.trans_lt exp_three_lt_32

end LassalleRefinement
