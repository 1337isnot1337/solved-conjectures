import Conjectures.LonelinessFiveSpeedRootIntegerForms
import Conjectures.LonelinessFiveSpeedRootIntegerFactors
import Conjectures.LonelinessFiveSpeedRootSemanticsTransport

/-! Signed coefficient bookkeeping for a folded 1:3:4 triple. The finite
phase calculation uses only the six integers ±1, ±3, ±4. It accounts for all
signs and permutations without an enumeration of five-coordinate vectors. -/

namespace Loneliness.FiveSpeedRoot

open Matrix
open scoped BigOperators
open Loneliness.FiveSpeedCertificate
open Loneliness.Modular

def phaseSign (b : Bool) : ℤ := if b then -1 else 1

def signed134Row (i j k : Fin 5) (a b c : Bool) : Row :=
  Pi.single i (phaseSign a) + Pi.single j (phaseSign b) - Pi.single k (phaseSign c)

def signed134Phase (i j k : Fin 5) (a b c : Bool) : Row :=
  Pi.single i (phaseSign a) + Pi.single j (3 * phaseSign b) + Pi.single k (4 * phaseSign c)

def phaseValues : Fin 6 → ℤ := ![-4, -3, -1, 1, 3, 4]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem signed134Row_shape : ∀ i j k : Fin 5, i ≠ j → i ≠ k → j ≠ k →
    ∀ a b c : Bool, ShortShape (signed134Row i j k a b c) := by
  decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem signed134Row_dot_phase : ∀ i j k : Fin 5, i ≠ j → i ≠ k → j ≠ k →
    ∀ a b c : Bool,
      signed134Row i j k a b c ⬝ᵥ signed134Phase i j k a b c = 0 := by
  decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem signed134Row_support_phase : ∀ i j k : Fin 5, i ≠ j → i ≠ k → j ≠ k →
    ∀ a b c : Bool, ∀ m : Fin 5, signed134Row i j k a b c m ≠ 0 →
      (m = i ∨ m = j ∨ m = k) ∧
      ∃ t : Fin 6, signed134Phase i j k a b c m = phaseValues t := by
  decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem additiveRelation_selected_nonzero : ∀ i j k : Fin 5, i ≠ k → j ≠ k →
    additiveRelation i j k i ≠ 0 ∧ additiveRelation i j k j ≠ 0 ∧
      additiveRelation i j k k ≠ 0 := by
  decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem phase_additive_codes : ∀ a b c : Fin 6,
    phaseValues a + phaseValues b = phaseValues c →
      phaseValues a ≠ phaseValues b ∧ ∃ e : Fin 6,
        tripleExtraCoefficients e 0 * phaseValues a +
          tripleExtraCoefficients e 1 * phaseValues b = 0 := by
  decide +kernel

theorem row_nonzero_iff_of_eq_or_neg (r s : Row) (h : r = s ∨ r = -s) (i : Fin 5) :
    r i ≠ 0 ↔ s i ≠ 0 := by
  rcases h with rfl | rfl <;> simp

theorem row_dot_zero_iff_of_eq_or_neg (r s z : Row) (h : r = s ∨ r = -s) :
    r ⬝ᵥ z = 0 ↔ s ⬝ᵥ z = 0 := by
  rcases h with rfl | rfl <;> simp only [neg_dotProduct, neg_eq_zero]

theorem short_form_exists_eq_or_neg (r : Row) (hr : ShortShape r) :
    ∃ a : Fin 80, formRows a = r ∨ formRows a = -r := by
  obtain ⟨a, ha⟩ := formRows_complete _ (canonicalize_spec hr)
  refine ⟨a, ?_⟩
  rw [ha]
  exact canonicalize_eq_or_neg r

theorem folded_eq_modEq_phaseSign (p x y : ℕ) (hp : 0 < p)
    (hfold : folded p x = folded p y) :
    ∃ b : Bool, (x : ℤ) ≡ phaseSign b * (y : ℤ) [ZMOD (p : ℤ)] := by
  obtain ⟨ε, hε, hx⟩ := folded_int_modEq_sign p x hp
  obtain ⟨δ, hδ, hy⟩ := folded_int_modEq_sign p y hp
  have he : ε * (x : ℤ) ≡ δ * (y : ℤ) [ZMOD (p : ℤ)] := by
    apply hx.symm.trans
    simpa only [hfold] using hy
  rcases hε with rfl | rfl <;> rcases hδ with rfl | rfl <;>
    simp only [one_mul, neg_one_mul] at he
  · exact ⟨false, by simpa [phaseSign] using he⟩
  · exact ⟨true, by simpa [phaseSign] using he⟩
  · exact ⟨true, by simpa [phaseSign] using he.neg⟩
  · exact ⟨false, by simpa [phaseSign] using he.neg⟩

theorem dot_dvd_of_phase (p : ℕ) (v : Speeds) (r φ : Row) (A : ℤ)
    (hpoint : ∀ i, r i ≠ 0 → (v i : ℤ) ≡ φ i * A [ZMOD (p : ℤ)])
    (hzero : r ⬝ᵥ φ = 0) : (p : ℤ) ∣ dot r v := by
  have hsum : dot r v ≡ (∑ i, r i * (φ i * A)) [ZMOD (p : ℤ)] := by
    apply Int.ModEq.sum
    intro i _
    by_cases hi : r i = 0
    · simpa only [hi, zero_mul] using (Int.ModEq.refl (n := (p : ℤ)) (0 : ℤ))
    · exact (hpoint i hi).mul_left (r i)
  have heq : (∑ i, r i * (φ i * A)) = 0 := by
    calc
      (∑ i, r i * (φ i * A)) = (∑ i, r i * φ i) * A := by
        rw [Finset.sum_mul]
        apply Finset.sum_congr rfl
        intro i _
        ring
      _ = 0 := by change (r ⬝ᵥ φ) * A = 0; rw [hzero, zero_mul]
  rw [heq] at hsum
  exact Int.modEq_zero_iff_dvd.mp hsum

theorem extraFactor_dvd_of_phases (p x y : ℕ) (A u w : ℤ) (e : Fin 6)
    (hx : (x : ℤ) ≡ u * A [ZMOD (p : ℤ)])
    (hy : (y : ℤ) ≡ w * A [ZMOD (p : ℤ)])
    (he : tripleExtraCoefficients e 0 * u + tripleExtraCoefficients e 1 * w = 0) :
    (p : ℤ) ∣ tripleExtraFactors x y e := by
  apply Int.modEq_zero_iff_dvd.mp
  rw [tripleExtraFactors_eq_coefficients]
  have h := (hx.mul_left (tripleExtraCoefficients e 0)).add
    (hy.mul_left (tripleExtraCoefficients e 1))
  have hz : tripleExtraCoefficients e 0 * (u * A) +
      tripleExtraCoefficients e 1 * (w * A) = 0 := by
    calc
      _ = (tripleExtraCoefficients e 0 * u + tripleExtraCoefficients e 1 * w) * A := by ring
      _ = 0 := by rw [he, zero_mul]
  simpa only [hz] using h

end Loneliness.FiveSpeedRoot
