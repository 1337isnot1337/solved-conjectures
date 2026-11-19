import Conjectures.LonelinessTightNormCommon
import Conjectures.LonelinessKZProduct
import Conjectures.LonelinessModularTightPrimeBounds

/-! Actual primitive-speed norm bounds and prime selection for counts nine
through thirteen. The basis geometry and finite product certificates are
internal. Only strictly smaller-dimensional runner bounds remain as inputs. -/

namespace Loneliness.NormGeometry

open scoped BigOperators
open CoordinateSubspace Modular.TightPrimeBounds

noncomputable section

theorem tight_natural_squaredNorm_le {n : ℕ} (hn : 8 ≤ n) (hn' : n ≤ 12)
    (v : Fin (n+1) → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m) :
    (∑ i, (v i)^2) ≤ squaredNormBound (n+1) := by
  apply natural_squaredNorm_le_of_product v hpositive hprimitive hvalue hLRC
    (fun i => (PrefixProduct.kzIncrement (n+1) i : ℝ)) (squaredNormBound (n+1))
  · intro t ht hp hr
    apply KZProduct.product_lower_bound (n+1) (by omega) (by omega) t
    · simpa only [Nat.add_sub_cancel] using ht
    · simpa only [Nat.add_sub_cancel] using hp
    · simpa only [Nat.add_sub_cancel] using hr
  · simpa only [Nat.add_sub_cancel] using
      prefix_margin (n+1) (by omega) (by omega)

theorem exists_original_prime_of_tight {n : ℕ} (hn : 8 ≤ n) (hn' : n ≤ 12)
    (v : Fin (n+1) → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m) :
    ∃ p ∈ primeSet (n+1), ∀ i, ¬ p ∣ v i := by
  apply exists_prime_of_tight_bound (n+1) (by omega) (by omega) v hpositive
  · convert hvalue using 1; push_cast; ring
  · exact tight_natural_squaredNorm_le hn hn' v hpositive hprimitive hvalue hLRC

end

end Loneliness.NormGeometry
