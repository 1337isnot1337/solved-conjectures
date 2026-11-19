import Conjectures.LonelinessSevenSpectrumNormGeometry

open scoped BigOperators
open Loneliness Loneliness.CoordinateSubspace Loneliness.SubspaceDensity
open Loneliness.SevenSpectrumNormGeometry

noncomputable section

variable (v : Fin 7 → ℕ) (hp : ∀ i, 0 < v i)
  (hg : (List.ofFn v).foldr Nat.gcd 0 = 1)
  (hv : value (List.ofFn v) ≤ (1 / 7 : ℝ))
  (hplane : ∀ E : Submodule ℚ (Fin 7 → ℚ),
    (fun i => (v i : ℚ)) ∈ E → Module.finrank ℚ E = 2 →
    (5 / 33 : ℝ) ≤ spaceValue (realSpan E))

example : 8993 * NormGeometry.squaredNorm v ≤ 1186638179795145 :=
  squaredNorm_mul_le v hp hg hv hplane

example : (∑ i, (v i) ^ 2) ≤ 131951315444 :=
  natural_squaredNorm_le v hp hg hv hplane

example : ‖KZBasis.realVector (fun i => (v i : ℤ))‖ < (363252 : ℝ) :=
  norm_lt v hp hg hv hplane

example : ∃ p ∈ ([151, 157, 163, 167, 173, 179, 181, 191, 193, 197,
    199, 211, 223, 227, 229, 233, 239, 241, 251] : List ℕ).toFinset,
    ∀ i, ¬ p ∣ v i :=
  exists_prime_avoiding v hp hg hv hplane

example : ∃ p ∈ ([151, 157, 163, 167, 173, 179, 181, 191, 193, 197,
    199, 211, 223, 227, 229, 233] : List ℕ).toFinset, ∀ i, ¬ p ∣ v i :=
  exists_prime_avoiding16 v hp hg hv hplane

example (hstrict : value (List.ofFn v) < (1 / 7 : ℝ)) :
    ∃ p ∈ ([151, 157, 163, 167, 173, 179, 181, 191, 193, 197,
      199, 211, 223, 227, 229] : List ℕ).toFinset, ∀ i, ¬ p ∣ v i :=
  exists_prime_avoiding15 v hp hg hstrict hplane

example (ds : List ℕ) (hstrict : value ds < (1 / 7 : ℝ)) :
    420 ∣ ds.prod := forced_divisor_of_strict ds hstrict

end
