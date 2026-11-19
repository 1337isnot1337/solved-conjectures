import Conjectures.LonelinessKZProductAssembly
import Conjectures.LonelinessKZProductDataNine
import Conjectures.LonelinessKZProductDataTen
import Conjectures.LonelinessKZProductDataEleven
import Conjectures.LonelinessKZProductDataTwelve
import Conjectures.LonelinessKZProductDataThirteen

/-! Product minimization for the KZ constants used for nine through thirteen
speeds. Every subset inequality is checked by an integer dual certificate;
the variables are arbitrary positive real numbers satisfying the original
prefix and adjacent-ratio inequalities. -/

open scoped BigOperators

namespace Loneliness.KZProduct

theorem nine_bounds : ∀ r ≤ 8,
    (Nine.bounds r : ℚ)/Nine.boundScale = kzBound 9 r := by
  intro r hr
  interval_cases r <;> norm_num [Nine.bounds,Nine.boundData,Nine.boundScale,kzBound]

theorem product_nine (t : ℕ → ℝ) (ht : ∀ i < 8, 0 < t i)
    (hprefix : ∀ r ≤ 8, (kzBound 9 r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 8 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 8, (PrefixProduct.kzIncrement 9 i : ℝ) ≤
      ∏ i ∈ Finset.range 8, t i :=
  product_of_certificate 9 8 Nine.bounds Nine.boundScale (by decide)
    Nine.row Nine.rows_valid nine_bounds
    (fun i hi => PrefixProduct.kzIncrement_positive 9 i (by decide) (by decide) hi)
    t ht hprefix hratio

theorem ten_bounds : ∀ r ≤ 9,
    (Ten.bounds r : ℚ)/Ten.boundScale = kzBound 10 r := by
  intro r hr
  interval_cases r <;> norm_num [Ten.bounds,Ten.boundData,Ten.boundScale,kzBound]

theorem product_ten (t : ℕ → ℝ) (ht : ∀ i < 9, 0 < t i)
    (hprefix : ∀ r ≤ 9, (kzBound 10 r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 9 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 9, (PrefixProduct.kzIncrement 10 i : ℝ) ≤
      ∏ i ∈ Finset.range 9, t i :=
  product_of_certificate 10 9 Ten.bounds Ten.boundScale (by decide)
    Ten.row Ten.rows_valid ten_bounds
    (fun i hi => PrefixProduct.kzIncrement_positive 10 i (by decide) (by decide) hi)
    t ht hprefix hratio

theorem eleven_bounds : ∀ r ≤ 10,
    (Eleven.bounds r : ℚ)/Eleven.boundScale = kzBound 11 r := by
  intro r hr
  interval_cases r <;> norm_num [Eleven.bounds,Eleven.boundData,Eleven.boundScale,kzBound]

theorem product_eleven (t : ℕ → ℝ) (ht : ∀ i < 10, 0 < t i)
    (hprefix : ∀ r ≤ 10, (kzBound 11 r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 10 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 10, (PrefixProduct.kzIncrement 11 i : ℝ) ≤
      ∏ i ∈ Finset.range 10, t i :=
  product_of_certificate 11 10 Eleven.bounds Eleven.boundScale (by decide)
    Eleven.row Eleven.rows_valid eleven_bounds
    (fun i hi => PrefixProduct.kzIncrement_positive 11 i (by decide) (by decide) hi)
    t ht hprefix hratio

theorem twelve_bounds : ∀ r ≤ 11,
    (Twelve.bounds r : ℚ)/Twelve.boundScale = kzBound 12 r := by
  intro r hr
  interval_cases r <;> norm_num [Twelve.bounds,Twelve.boundData,Twelve.boundScale,kzBound]

theorem product_twelve (t : ℕ → ℝ) (ht : ∀ i < 11, 0 < t i)
    (hprefix : ∀ r ≤ 11, (kzBound 12 r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 11 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 11, (PrefixProduct.kzIncrement 12 i : ℝ) ≤
      ∏ i ∈ Finset.range 11, t i :=
  product_of_certificate 12 11 Twelve.bounds Twelve.boundScale (by decide)
    Twelve.row Twelve.rows_valid twelve_bounds
    (fun i hi => PrefixProduct.kzIncrement_positive 12 i (by decide) (by decide) hi)
    t ht hprefix hratio

theorem thirteen_bounds : ∀ r ≤ 12,
    (Thirteen.bounds r : ℚ)/Thirteen.boundScale = kzBound 13 r := by
  intro r hr
  interval_cases r <;> norm_num [Thirteen.bounds,Thirteen.boundData,Thirteen.boundScale,kzBound]

theorem product_thirteen (t : ℕ → ℝ) (ht : ∀ i < 12, 0 < t i)
    (hprefix : ∀ r ≤ 12, (kzBound 13 r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 12 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 12, (PrefixProduct.kzIncrement 13 i : ℝ) ≤
      ∏ i ∈ Finset.range 12, t i :=
  product_of_certificate 13 12 Thirteen.bounds Thirteen.boundScale (by decide)
    Thirteen.row Thirteen.rows_valid thirteen_bounds
    (fun i hi => PrefixProduct.kzIncrement_positive 13 i (by decide) (by decide) hi)
    t ht hprefix hratio

theorem product_lower_bound (k : ℕ) (hk : 9 ≤ k) (hk' : k ≤ 13)
    (t : ℕ → ℝ) (ht : ∀ i < k-1, 0 < t i)
    (hprefix : ∀ r ≤ k-1, (kzBound k r : ℝ) ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < k-1 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range (k-1), (PrefixProduct.kzIncrement k i : ℝ) ≤
      ∏ i ∈ Finset.range (k-1), t i := by
  interval_cases k
  · exact product_nine t ht hprefix hratio
  · exact product_ten t ht hprefix hratio
  · exact product_eleven t ht hprefix hratio
  · exact product_twelve t ht hprefix hratio
  · exact product_thirteen t ht hprefix hratio

/-- The original finite-dimensional feasible set, without a sorting hypothesis. -/
def Feasible (k : ℕ) (t : ℕ → ℝ) : Prop :=
  (∀ i < k-1, 0 < t i) ∧
  (∀ r ≤ k-1, (kzBound k r : ℝ) ≤ ∑ i ∈ Finset.range r, t i) ∧
  (∀ i, i+1 < k-1 → 3*t i ≤ 4*t (i+1))

theorem increments_feasible (k : ℕ) (hk : 9 ≤ k) (hk' : k ≤ 13) :
    Feasible k (fun i => (PrefixProduct.kzIncrement k i : ℝ)) := by
  refine ⟨?_,?_,?_⟩
  · intro i hi
    change (0 : ℝ) < (PrefixProduct.kzIncrement k i : ℝ)
    exact_mod_cast PrefixProduct.kzIncrement_positive k i hk hk' hi
  · intro r hr
    rw [increment_prefix_sum_real]
  · intro i hi
    have hp : (0 : ℝ) < PrefixProduct.kzIncrement k i := by
      exact_mod_cast PrefixProduct.kzIncrement_positive k i hk hk' (by omega)
    have hn : (0 : ℝ) < PrefixProduct.kzIncrement k (i+1) := by
      exact_mod_cast PrefixProduct.kzIncrement_positive k (i+1) hk hk' hi
    have h : 4*(PrefixProduct.kzIncrement k i : ℝ) <
        3*(PrefixProduct.kzIncrement k (i+1) : ℝ) := by
      exact_mod_cast PrefixProduct.kzIncrement_ratio k i hk hk' (by omega)
    linarith

/-- The displayed increments attain the product minimum in all five required dimensions. -/
theorem product_minimizer (k : ℕ) (hk : 9 ≤ k) (hk' : k ≤ 13) :
    Feasible k (fun i => (PrefixProduct.kzIncrement k i : ℝ)) ∧
    ∀ t : ℕ → ℝ, Feasible k t →
      ∏ i ∈ Finset.range (k-1), (PrefixProduct.kzIncrement k i : ℝ) ≤
        ∏ i ∈ Finset.range (k-1), t i := by
  refine ⟨increments_feasible k hk hk',?_⟩
  intro t ht
  exact product_lower_bound k hk hk' t ht.1 ht.2.1 ht.2.2

end Loneliness.KZProduct
