import Conjectures.LonelinessNormGeometry

/-! Convert a checked product inequality into an exact natural squared-norm
ceiling for the actual primitive speed vector. -/

namespace Loneliness.NormGeometry

open scoped BigOperators
open CoordinateSubspace

noncomputable section

theorem natural_squaredNorm_le_of_product {n : ℕ} (v : Fin (n+1) → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m)
    (c : ℕ → ℝ) (B : ℕ)
    (hproduct : ∀ t : ℕ → ℝ,
      (∀ i < n, 0 < t i) →
      (∀ r ≤ n, (KZProduct.kzBound (n+1) r : ℝ) ≤
        ∑ i ∈ Finset.range r, t i) →
      (∀ i, i+1 < n → 3*t i ≤ 4*t (i+1)) →
      ∏ i ∈ Finset.range n, c i ≤ ∏ i ∈ Finset.range n, t i)
    (hmargin : 1 < (∏ i ∈ Finset.range n, c i) * ((B+1 : ℕ) : ℝ)) :
    (∑ i, (v i)^2) ≤ B := by
  obtain ⟨t, ht, hp, hr, hd⟩ :=
    exists_tight_gram_data v hpositive hprimitive hvalue hLRC
  have hprod := hproduct t ht hp hr
  rw [hd] at hprod
  have hmul := (le_div_iff₀ (squaredNorm_pos v hpositive)).mp hprod
  have hK : 0 < ∏ i ∈ Finset.range n, c i := by
    by_contra! hnot
    have h := mul_nonpos_of_nonpos_of_nonneg hnot
      (show (0 : ℝ) ≤ ((B+1 : ℕ) : ℝ) by positivity)
    linarith
  have hS : squaredNorm v = ((∑ i, (v i)^2 : ℕ) : ℝ) := by
    rw [squaredNorm_eq_sum]
    simp only [Nat.cast_sum, Nat.cast_pow]
  have hupper : ((∑ i, (v i)^2 : ℕ) : ℝ) < ((B+1 : ℕ) : ℝ) := by
    by_contra! hnot
    have h := mul_le_mul_of_nonneg_left hnot hK.le
    rw [← hS] at h
    exact (not_le_of_gt hmargin) (h.trans hmul)
  exact Nat.le_of_lt_succ (by exact_mod_cast hupper)

end

end Loneliness.NormGeometry
