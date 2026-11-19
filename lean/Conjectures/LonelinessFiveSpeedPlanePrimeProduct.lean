import Conjectures.LonelinessFiveSpeedPlaneProjective
import Conjectures.LonelinessModularPrimes

/-! A finite family of modular plane covers forces an exact integer
parameter relation when its distinct-prime product exceeds the explicit
product of coordinate bounds. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators

def integerFormWeight {n : ℕ} (a : Fin n → ℤ) : ℕ := ∑ j, (a j).natAbs

theorem dotProduct_natAbs_bound {n : ℕ} (a u : Fin n → ℤ) (C : ℕ)
    (hu : ∀ j, (u j).natAbs ≤ C) : (a ⬝ᵥ u).natAbs ≤ C * integerFormWeight a := by
  calc
    (a ⬝ᵥ u).natAbs ≤ ∑ j, (a j * u j).natAbs := Int.natAbs_sum_le _ _
    _ ≤ ∑ j, (a j).natAbs * C := by
      apply Finset.sum_le_sum
      intro j _
      rw [Int.natAbs_mul]
      exact Nat.mul_le_mul_left _ (hu j)
    _ = C * integerFormWeight a := by rw [← Finset.sum_mul, Nat.mul_comm]; rfl

private theorem natAbs_list_prod (xs : List ℤ) :
    xs.prod.natAbs = (xs.map Int.natAbs).prod := by
  induction xs with
  | nil => simp
  | cons x xs ih => simp only [List.prod_cons, Int.natAbs_mul, List.map_cons, ih]

def formProductBound {n : ℕ} (forms : List (Fin n → ℤ)) (C : ℕ) : ℕ :=
  (forms.map (fun a => C * integerFormWeight a)).prod

theorem form_product_natAbs_bound {n : ℕ} (forms : List (Fin n → ℤ))
    (u : Fin n → ℤ) (C : ℕ) (hu : ∀ j, (u j).natAbs ≤ C) :
    ((forms.map (fun a => a ⬝ᵥ u)).prod).natAbs ≤ formProductBound forms C := by
  rw [natAbs_list_prod, List.map_map]
  exact List.prod_map_le_prod_map₀ (fun a => (a ⬝ᵥ u).natAbs)
    (fun a => C * integerFormWeight a) (fun _ _ => Nat.zero_le _)
    (fun a _ => dotProduct_natAbs_bound a u C hu)

theorem exists_zero_form_of_prime_covers {n : ℕ} (forms : List (Fin n → ℤ))
    (u : Fin n → ℤ) (C : ℕ) (hu : ∀ j, (u j).natAbs ≤ C)
    (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime)
    (hcover : ∀ p ∈ ps, ∃ a ∈ forms, (p : ℤ) ∣ a ⬝ᵥ u)
    (hbound : formProductBound forms C < ∏ p ∈ ps, p) :
    ∃ a ∈ forms, a ⬝ᵥ u = 0 := by
  have hz : (forms.map (fun a => a ⬝ᵥ u)).prod = 0 := by
    apply Loneliness.Modular.integer_eq_zero_of_prime_product ps _ hprime
    · intro p hp
      obtain ⟨a, ha, hpa⟩ := hcover p hp
      exact hpa.trans (List.dvd_prod (List.mem_map.mpr ⟨a, ha, rfl⟩))
    · exact (form_product_natAbs_bound forms u C hu).trans_lt hbound
  obtain ⟨a, ha, he⟩ := List.mem_map.mp (List.prod_eq_zero_iff.mp hz)
  exact ⟨a, ha, he⟩

theorem canonical_plane_integer_relation (k : Fin 9) (u : ThreeIntegerVector)
    (C : ℕ) (hu : ∀ j, (u j).natAbs ≤ C) (ps : Finset ℕ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hcovers : ∀ p ∈ ps, CanonicalProjectiveCover p k)
    (hbound : formProductBound (planeStructuralForms k) C < ∏ p ∈ ps, p)
    (hlow : Loneliness.value
      (Loneliness.CoordinateSubspace.integerSpeeds (canonicalMaps k *ᵥ u)) < (1 : ℝ) / 5)
    (hnonzero : ∀ i, (canonicalMaps k *ᵥ u) i ≠ 0) :
    ∃ a ∈ planeParameterForms k, a ⬝ᵥ u = 0 := by
  obtain ⟨a, ha, he⟩ := exists_zero_form_of_prime_covers
    (planeStructuralForms k) u C hu ps hprime
    (fun p hp => canonicalProjectiveCover_divisor p (hprime p hp) k (hcovers p hp) u hlow)
    hbound
  rcases List.mem_append.mp ha with hcoordinate | hparameter
  · obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hcoordinate
    exact (hnonzero i he).elim
  · exact ⟨a, hparameter, he⟩

end Loneliness.FiveSpeedCertificate
