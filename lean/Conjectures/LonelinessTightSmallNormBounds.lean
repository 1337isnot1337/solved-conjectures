import Conjectures.LonelinessTightNormCommon
import Conjectures.LonelinessKZSmallData
import Conjectures.LonelinessModularTightPrimeBounds

/-! Tight norm and prime reductions for six, seven, and eight speeds.
The prefix geometry and finite dual tables are internal. Lower-dimensional
runner bounds remain the exact induction inputs. -/

namespace Loneliness.NormGeometry

open scoped BigOperators
open CoordinateSubspace Modular.TightPrimeBounds

noncomputable section

theorem small_product_lower_bound (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 8)
    (t : ℕ → ℝ) (ht : ∀ i < k-1, 0 < t i)
    (hprefix : ∀ r ≤ k-1, (KZProduct.kzBound k r : ℝ) ≤
      ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < k-1 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range (k-1), (PrefixProduct.kzIncrement k i : ℝ) ≤
      ∏ i ∈ Finset.range (k-1), t i := by
  interval_cases k
  · have hp : ∀ r ≤ 5, KZGeneral.boundValue KZSmall.TightSix.bounds KZSmall.TightSix.scale r ≤
        ∑ i ∈ Finset.range r, t i := by
      intro r hr
      have hb : KZGeneral.boundValue KZSmall.TightSix.bounds KZSmall.TightSix.scale r =
          (KZProduct.kzBound 6 r : ℝ) := by
        interval_cases r <;> norm_num [KZGeneral.boundValue, KZSmall.TightSix.bounds,
          KZSmall.TightSix.boundData, KZSmall.TightSix.scale, KZProduct.kzBound]
      rw [hb]
      exact hprefix r hr
    calc
      ∏ i ∈ Finset.range 5, (PrefixProduct.kzIncrement 6 i : ℝ) =
          ∏ i ∈ Finset.range 5, KZGeneral.increment KZSmall.TightSix.bounds KZSmall.TightSix.scale i := by
        apply Finset.prod_congr rfl
        intro i hi
        have hi' := Finset.mem_range.mp hi
        interval_cases i <;> norm_num [KZGeneral.increment, KZGeneral.boundValue,
          KZSmall.TightSix.bounds, KZSmall.TightSix.boundData, KZSmall.TightSix.scale,
          PrefixProduct.kzIncrement]
      _ ≤ ∏ i ∈ Finset.range 5, t i :=
        KZSmall.TightSix.product_lower_bound t ht hp hratio
  · have hp : ∀ r ≤ 6, KZGeneral.boundValue KZSmall.TightSeven.bounds KZSmall.TightSeven.scale r ≤
        ∑ i ∈ Finset.range r, t i := by
      intro r hr
      have hb : KZGeneral.boundValue KZSmall.TightSeven.bounds KZSmall.TightSeven.scale r =
          (KZProduct.kzBound 7 r : ℝ) := by
        interval_cases r <;> norm_num [KZGeneral.boundValue, KZSmall.TightSeven.bounds,
          KZSmall.TightSeven.boundData, KZSmall.TightSeven.scale, KZProduct.kzBound]
      rw [hb]
      exact hprefix r hr
    calc
      ∏ i ∈ Finset.range 6, (PrefixProduct.kzIncrement 7 i : ℝ) =
          ∏ i ∈ Finset.range 6, KZGeneral.increment KZSmall.TightSeven.bounds KZSmall.TightSeven.scale i := by
        apply Finset.prod_congr rfl
        intro i hi
        have hi' := Finset.mem_range.mp hi
        interval_cases i <;> norm_num [KZGeneral.increment, KZGeneral.boundValue,
          KZSmall.TightSeven.bounds, KZSmall.TightSeven.boundData, KZSmall.TightSeven.scale,
          PrefixProduct.kzIncrement]
      _ ≤ ∏ i ∈ Finset.range 6, t i :=
        KZSmall.TightSeven.product_lower_bound t ht hp hratio
  · have hp : ∀ r ≤ 7, KZGeneral.boundValue KZSmall.TightEight.bounds KZSmall.TightEight.scale r ≤
        ∑ i ∈ Finset.range r, t i := by
      intro r hr
      have hb : KZGeneral.boundValue KZSmall.TightEight.bounds KZSmall.TightEight.scale r =
          (KZProduct.kzBound 8 r : ℝ) := by
        interval_cases r <;> norm_num [KZGeneral.boundValue, KZSmall.TightEight.bounds,
          KZSmall.TightEight.boundData, KZSmall.TightEight.scale, KZProduct.kzBound]
      rw [hb]
      exact hprefix r hr
    calc
      ∏ i ∈ Finset.range 7, (PrefixProduct.kzIncrement 8 i : ℝ) =
          ∏ i ∈ Finset.range 7, KZGeneral.increment KZSmall.TightEight.bounds KZSmall.TightEight.scale i := by
        apply Finset.prod_congr rfl
        intro i hi
        have hi' := Finset.mem_range.mp hi
        interval_cases i <;> norm_num [KZGeneral.increment, KZGeneral.boundValue,
          KZSmall.TightEight.bounds, KZSmall.TightEight.boundData, KZSmall.TightEight.scale,
          PrefixProduct.kzIncrement]
      _ ≤ ∏ i ∈ Finset.range 7, t i :=
        KZSmall.TightEight.product_lower_bound t ht hp hratio

theorem tight_small_natural_squaredNorm_le {n : ℕ} (hn : 5 ≤ n) (hn' : n ≤ 7)
    (v : Fin (n+1) → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m) :
    (∑ i, (v i)^2) ≤ squaredNormBound (n+1) := by
  apply natural_squaredNorm_le_of_product v hpositive hprimitive hvalue hLRC
    (fun i => (PrefixProduct.kzIncrement (n+1) i : ℝ)) (squaredNormBound (n+1))
  · intro t ht hp hr
    apply small_product_lower_bound (n+1) (by omega) (by omega) t
    · simpa only [Nat.add_sub_cancel] using ht
    · simpa only [Nat.add_sub_cancel] using hp
    · simpa only [Nat.add_sub_cancel] using hr
  · simpa only [Nat.add_sub_cancel] using
      prefix_margin (n+1) (by omega) (by omega)

theorem exists_small_prime_of_tight {n : ℕ} (hn : 5 ≤ n) (hn' : n ≤ 7)
    (v : Fin (n+1) → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m) :
    ∃ p ∈ primeSet (n+1), ∀ i, ¬ p ∣ v i := by
  apply exists_prime_of_tight_bound (n+1) (by omega) (by omega) v hpositive
  · convert hvalue using 1 <;> push_cast <;> ring
  · exact tight_small_natural_squaredNorm_le hn hn' v hpositive hprimitive hvalue hLRC

theorem six_squaredNorm_le (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < 6 → LonelyRunnerBound m) :
    (∑ i, (v i)^2) ≤ 34333151 := by
  simpa only [squaredNormBound] using tight_small_natural_squaredNorm_le
    (n := 5) (by decide) (by decide) v hpositive hprimitive hvalue hLRC

end

end Loneliness.NormGeometry
